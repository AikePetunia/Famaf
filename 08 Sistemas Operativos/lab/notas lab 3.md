# Lab 3: Auditoría forense en FAT32 con FUSE

El lab implementa un sistema de auditoría para un filesystem FAT32 montado con FUSE: registra las operaciones críticas en un log binario y permite recuperar archivos borrados.

La parte central es entender **cuándo un archivo borrado puede recuperarse y cuándo no**. Si borrás un archivo y después otro reutiliza esos clusters sobrescribiendo los datos, el primero ya no se puede recuperar. El sistema tiene que detectarlo solo, consultando los logs.

Son 3 piezas:
1. **Registrar la actividad:** un archivo donde se guardan las actividades relevantes del usuario, como escrituras y borrados.
2. **Comando de restaurado:** recupera archivos borrados.
3. **Reconstruir archivos:** usa los logs para rearmar archivos borrados de más de un cluster.

## 1. Conceptos base

### Qué es un sistema de archivos

Es el componente del sistema operativo que administra y organiza los datos dentro de un dispositivo de memoria. Acá los datos se organizan en archivos y directorios, que tienen metadatos y una jerarquía definida por el usuario.

### VFS y FUSE

**VFS** (*Virtual File System*) es la capa del kernel que ofrece la misma interfaz (`open`, `read`, `write`) para cualquier sistema de archivos. Recibe esas llamadas y se las pasa al filesystem que corresponde a esa carpeta.

**FUSE** (*Filesystem in Userspace*) permite escribir un sistema de archivos como un **programa común**, en espacio de usuario. Normalmente un filesystem es código dentro del kernel: es difícil de programar, y un bug puede tirar abajo todo el sistema.

```
echo hola > mnt/a.txt       programa cualquiera
        │  syscall write()
        ▼
VFS (kernel)
        │
        ▼
módulo FUSE del kernel      /dev/fuse
        │
        ▼
fat-fuse (libfuse)          tu programa, en espacio de usuario
        │
        ▼
fat_fuse_write()            en fat_fuse_ops.c
        │
        ▼
disk.img                    lee y escribe la imagen
```

Se le dice a FUSE qué hacer completando `struct fuse_operations` con punteros a funciones: "cuando alguien haga `write`, llamá a `fat_fuse_write`". El esqueleto ya trae `read`, `write`, `unlink`, `rmdir`, `mkdir`, `rename`, etc.

- Si algo sale mal se devuelve un número negativo con el error (`-ENOENT`, `-ENOSYS`, `-EOVERFLOW`). `read` y `write` devuelven cuántos bytes procesaron.
- El código no es thread-safe, así que FUSE corre en un solo hilo (`-s`).

### Alto nivel vs bajo nivel

Una sola syscall (alto nivel) puede terminar en varias escrituras al disco (bajo nivel). Un `echo hola > mnt/a.txt` sobre un archivo nuevo puede buscar un cluster libre y marcarlo en la FAT, escribir los datos en el cluster y actualizar la dentry.

### Borrado lógico vs físico

Cuando hacés `rm file.txt`, el filesystem:

1. Marca la dentry como borrada: primer byte = `0xE5`.
2. Libera los clusters en la FAT: los marca como `0x0` (`FREE`).
3. **No** sobrescribe los datos de los clusters.

Eso es **borrado lógico**. Los datos siguen físicamente en el disco hasta que otro archivo reutilice esos clusters, que sería el **borrado físico**. Es como una biblioteca que saca la ficha del catálogo y marca el estante como disponible, pero deja el libro ahí.

---

## 2. FAT32 por dentro

### Las tres zonas

```
┌───────────────┬───────────────┬──────────────────────────────┐
│ Reserved Area │   FAT Area    │  Data Area: │ │ │ │ ... │ │  │
└───────┬───────┴───────────────┴──────────────────────────────┘
        ▼                                     └─ clusters
 Boot Sector │ FSINFO │ Bootstrap │ Reserved Sector
```

| Componente       | Qué hace                                                                                                                                    |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| Sector de boot   | Define cómo está organizado el volumen: particiones, ubicación de la FAT y segmentos del sector de datos (clusters).                        |
| Tabla(s) FAT     | Define dónde están los datos de cada archivo. Como pueden no estar en clusters contiguos, guarda la cadena de clusters del archivo.         |
| Sector de datos  | Está dividido en clusters contiguos del mismo tamaño: clusters de datos y clusters de entradas de directorio.                               |

- La imagen del lab (`disk.img`) es un archivo común con el formato de un disco FAT32.
- Un **cluster** es la unidad mínima que se le da a un archivo. En la imagen del lab, **1 cluster = 512 bytes**.
- Suele haber 2 copias de la FAT, por seguridad.
- La FAT está **mapeada en memoria** con `mmap()`: se usa como un arreglo y los cambios se reflejan en la imagen. Los datos de los clusters se leen y escriben con `pread()`/`pwrite()`.

### La tabla FAT

La FAT es un arreglo: en la posición de cada cluster está el número del **siguiente** cluster del archivo. Cada entrada mide 4 bytes, así que la del cluster `n` está en el offset `n × 4`.

| Valor en la FAT             | Significa                       |
| --------------------------- | ------------------------------- |
| `0x00000000`                | Cluster libre                   |
| Un número (ej. `9`)         | El archivo sigue en el cluster 9 |
| `0x0FFFFFF8` a `0x0FFFFFFF` | Fin de la cadena                |
| `0x0FFFFFF7`                | Cluster dañado                  |

Los números se guardan en **little endian** (primero el byte menos significativo): `0A 00 00 00` es el 10, y `FF FF FF 0F` es `0x0FFFFFFF`.

Ejemplo de la filmina:

| Cluster | Valor | Cluster | Valor | Cluster | Valor | Cluster | Valor |
| ------- | ----- | ------- | ----- | ------- | ----- | ------- | ----- |
| 0       | reservado | 1   | reservado | 2   | FIN   | 3       | 4     |
| 4       | 5     | 5       | 6     | 6       | FIN   | 7       | 10    |
| 8       | 9     | 9       | 13    | 10      | 14    | 11      | FIN   |
| 12      | libre | 13      | FIN   | 14      | FIN   | 15      | libre |

Las cadenas que quedan son:

```
Raíz:      2 → FIN
Archivo:   3 → 4 → 5 → 6 → FIN     contiguo
Archivo:   8 → 9 → 13 → FIN        fragmentado
Archivo:   7 → 10 → 14 → FIN       fragmentado
Archivo:   11 → FIN                un solo cluster
```

**Ejemplo de truncate.** Con clusters de 512 B, truncar el archivo que empieza en el cluster 7 a un offset de 600 B deja la cadena en `7 → 10 → FIN`: 600 B necesitan 2 clusters. El cluster 14 queda libre.

### Entradas de directorio (dentries)

En FAT no hay inodos. Un directorio es un archivo cuyo contenido es una lista de **dentries de 32 bytes**, igual de grandes todas.

| Campo                      | Qué guarda                                     |
| -------------------------- | ---------------------------------------------- |
| Nombre (8) + extensión (3) | Formato 8.3                                    |
| Atributos                  | Directorio, oculto, solo lectura, etc.         |
| Fechas y horas             | Creación, último acceso, última modificación   |
| Primer cluster             | Dónde empieza la cadena en la FAT              |
| Tamaño                     | En bytes                                       |

```
dentry: nombre = file.dat, primer cluster = 40, tamaño = 6230
FAT:    40 → 41 → 46 → EOF
```

El primer byte del nombre tiene significados especiales:

| Valor  | Constante           | Significa                   |
| ------ | ------------------- | --------------------------- |
| `0xE5` | `FILE_FOR_DELETION` | Dentry borrada              |
| `0x00` | `DENTRY_END_OF_DIR` | Fin del directorio          |

Como los datos de un archivo están en su dentry y no en un inodo aparte, **no se pueden hacer hard links** en FAT.

### Imagen vs memoria

Cada dato existe en dos lugares, y al escribir hay que mantener los dos iguales:

| Dónde vive   | Estructura        | Ejemplo de campos                                       |
| ------------ | ----------------- | ------------------------------------------------------- |
| En la imagen | `fat_dir_entry_s` | `base_name`, `extension`, `start_cluster_low`, `attribs` |
| En memoria   | `fat_file_s`      | `filepath`, `start_cluster`, `is_dir`                   |

Ejemplo de un sector de datos con `/pregunta.txt` y `/dir/f1.txt`:

```
0x00 Reservado    0x01 Reservado    0x02 raíz (dentries)    0x03 contenido de /pregunta.txt
0x04 dentries     0x05 dir .audit   0x06 contenido de       0x07
     de /dir                             /dir/f1.txt
```

- El cluster `0x02` guarda las dentries de `pregunta.txt` (empieza en `0x03`) y de `dir` (empieza en `0x04`).
- El cluster `0x04` es el contenido de `/dir`: una lista de dentries, entre ellas `f1.txt` (empieza en `0x06`).
- `is_dir` en realidad sale de `fat_file_is_directory`.

### Cómo está armado el código

| Módulo                               | Qué hace                                                                       |
| ------------------------------------ | ------------------------------------------------------------------------------ |
| `fat_fuse.c`                         | `main`: arma el volumen, completa `fuse_operations` y llama a `fuse_main`      |
| `fat_volume.c`                       | Monta: abre la imagen, lee el sector de boot y la FAT, crea el árbol con la raíz |
| `fat_fuse_ops.c`                     | Las operaciones que llama FUSE: lógica de alto nivel                           |
| `fat_file.c`                         | TAD `fat_file`: lectura y escritura de bajo nivel en clusters                  |
| `fat_table.c`                        | TAD `fat_table`: seguir cadenas, buscar clusters libres, modificar la FAT      |
| `fat_fs_tree.c`, `hierarchy_tree.c`  | Árbol de directorios en memoria                                                |
| `fat_filename_util.c`, `fat_util.c`  | Nombres 8.3, fechas, conversiones de bytes                                     |

Funciones útiles:

| Función                         | Para qué                         |
| ------------------------------- | -------------------------------- |
| `fat_file_pread()`/`fat_file_pwrite()` | Leer y escribir datos de archivos |
| `fat_table_get_cluster_value()` | Leer el valor de la FAT de un cluster |
| `fat_table_set_cluster()`       | Modificar un valor en la FAT     |
| `fat_tree_search()`             | Buscar un archivo por path       |

---

## 3. Operaciones en FAT

### Borrado de archivos

```
fat_fuse_ops.c                 fat_file.c
fat_fuse_unlink  ───────────►  fat_file_unlink
                                     └──► fat_file_remove_child_direntry
```

```python
def fat_file_unlink(file, parent):
    table = file.table
    cluster = file.start_cluster

    while not is_end_of_cluster(cluster):                # recorre toda la cadena
        siguiente = table.next_cluster[cluster]          # guarda el siguiente
        table.next_cluster[cluster] = FAT_CLUSTER_FREE   # libera este
        cluster = siguiente

    fat_file_remove_child_direntry(parent, file.dentry)

def fat_file_remove_child_direntry(parent, child_dentry):
    child_dentry.base_name[0] = FILE_FOR_DELETION        # 0xe5
    write_dir_entry(parent, child_dentry)
```

La cadena se pierde en este paso: al poner cada casillero en `FREE`, la FAT deja de decir qué cluster seguía a cuál. Por eso hay que guardarla en el log.

### Lectura de directorios

```
fat_fuse_ops.c                 fat_file.c
fat_fuse_read_dir  ─────────►  fat_file_read_children
                                     └──► parse_dir_entries_in_cluster (por cada cluster)
```

```python
def fat_file_read_children(dir):
    entry_list = []

    for cluster in dir.clusters():
        parse_dir_entries_in_cluster(cluster, entry_list)

    return entry_list

def parse_dir_entries_in_cluster(cluster, entry_list):
    for dentry in cluster.dir_entries():
        if is_end_of_directory(dentry):      # 0x00: corta este cluster
            break
        if ignore_dentry(dentry):            # 0xe5, por ejemplo: la salta
            continue
        entry_list.append(dentry)

def is_end_of_directory(dentry):
    return dentry.base_name[0] == DENTRY_END_OF_DIR      # 0x00

def ignore_dentry(dentry):
    return !file_basename_valid(dentry.base_name) ||
        !file_extension_valid(dentry.extension)

def file_basename_valid(base_name):
    if base_name[0] in {'\0', ' ', 0xe5}:
        return false
    ...
```

### Qué pasa al parsear

| Caso                                                | Dentries                              | `entry_list`                       |
| --------------------------------------------------- | ------------------------------------- | ---------------------------------- |
| Normal                                              | `hola.txt`, `a.out`, `test`, `nota.txt` | Las 4                            |
| Normal: una marcada como borrada                    | `hola.txt`, `a.out`, `[0xe5...]`, `nota.txt` | `hola.txt`, `a.out`, `nota.txt` |
| Erróneo: una marcada con ceros                      | `hola.txt`, `a.out`, `[0x00...]`, `nota.txt` | `hola.txt`, `a.out`         |

- `0xE5` usa `continue`: salta esa dentry y sigue.
- `0x00` usa `break`: todo lo que viene después en ese cluster **deja de verse**.

**Caso borde: múltiples clusters.** El `break` solo corta el cluster actual, y el `for` de `fat_file_read_children` sigue con el próximo:

```
dentry.cluster0                         dentry.cluster1
hola.txt, a.out, [0x00...], nota.txt    rshot.html, gadget4, plus.png, vft.sif

entry_list = [hola.txt, a.out, rshot.html, gadget4, plus.png, vft.sif]
```

`nota.txt` desaparece, pero los archivos del segundo cluster se siguen viendo.

---

## 4. El sistema de auditoría

### Parte 1: crear el log

Al montar, se crea `/.audit/events.bin`:

- Si ya existen, se cargan; si no, se crean.
- Tiene que persistir entre montajes: al desmontar y volver a montar se conservan los logs anteriores.
- Hay que decidir dónde va el código y qué funciones hace falta, por ejemplo `audit_init()`, `audit_write_event()` y `audit_read_event()`.

### Parte 2: eventos de tamaño fijo

Todos los eventos miden lo mismo, igual que las dentries. Eso facilita leer, escribir y acceder directo: el evento `k` está en la posición `k × tamaño`, y la cantidad de eventos es `tamaño del archivo / tamaño del evento`.

Esto es **serialización binaria**: la estructura se escribe tal cual está en memoria. Por eso `cat events.bin` muestra basura y hace falta `audit_reader`.

Ejemplo base del enunciado (se puede y se debe modificar):

```c
typedef enum {
    OP_WRITE = 0,
    OP_UNLINK = 1,
    OP_MKDIR = 2,
    OP_RMDIR = 3,
} operation_type_t;

typedef struct __attribute__((packed)) {
    uint64_t event_id;        // ID secuencial
    uint64_t timestamp;       // Unix timestamp
    uint32_t operation_type;  // Tipo de operación (enum)
    char username[64];        // Usuario que realizó la operación

    // Información específica de la operación
    // Sugerencia: usar union para diferentes tipos
    char filepath[256];       // Path del archivo
    uint64_t offset;          // Para write: offset
    uint64_t size;            // Para write: tamaño

    // Padding para completar tamaño fijo
    uint8_t _padding[512];
} audit_event_t;
```

- `__attribute__((packed))`: el compilador no mete huecos de relleno entre campos.
- `union`: cada evento es una sola operación, así que los campos específicos pueden reusar el mismo espacio.
- `sizeof(audit_event_t)` hay que calcularlo y justificarlo.

**Cuánto medir:** entre 512 B (1 cluster) y 1024 B (2 clusters). Si es muy grande, cada evento consume varios clusters y llena el filesystem rápido.

**Límite:** con `cluster_chain[32]` y clusters de 512 B, solo se recuperan archivos de hasta **32 × 512 B = 16 KB**. Si un archivo lo supera, hay que elegir y documentar:
1. No loguearlo.
2. Loguear parcialmente los primeros 32 clusters.
3. Implementar una estrategia para archivos grandes (punto estrella).

### Parte 3: verificar con audit_reader

```
./audit_reader /mnt/fuse/.audit/events.bin

ID   Timestamp             Operation   Path
1    2026-10-10 14:30:15   write       /file.txt
2    2026-10-10 14:30:20   unlink      /file.txt
3    2026-10-10 14:30:25   mkdir       /dir1

Total events: 3
```

Si cambiás la estructura, hay que actualizar `audit_reader.c`. Los dos comparten `src/audit.h` para mantener el mismo formato.

### Parte 4: qué guardar de cada operación

Hay que loguear `write`, `unlink`, `mkdir` y `rmdir`. Sugerencia de la filmina:

| Evento        | Campos                                                                       |
| ------------- | ---------------------------------------------------------------------------- |
| `Write`       | `u64 offset`, `u64 size`, `u32 num_clusters`, `u32 clusters[NMAX]`           |
| `Unlink`      | `u32 clusters[NMAX]`, `u32 file_size`                                        |
| `Mknod`       | `u32 dir_cluster`                                                            |
| `Mkdir/Rmdir` | `u32 dir_cluster`                                                            |

- **¿Primer cluster o cadena completa?** Cadena completa, porque el archivo puede estar fragmentado. Después de `unlink` la FAT ya no la tiene, y con el primer cluster solo se podría adivinar.
- **¿Para qué sirve loguear `write`?** Para saber qué clusters se ocuparon después de un borrado.
- **¿Por qué `mkdir`?** Un directorio nuevo también puede reusar clusters de un archivo borrado.

**Sniffing de eventos:** los eventos dan información para saber qué clusters ocupó cada archivo en el tiempo. Qué tan fácil es recuperar, y hasta qué tamaño, depende de cómo se diseñaron.

---

## 5. Recuperación de archivos

### Por qué hace falta el log

Sin una fuente adicional hay dos problemas:

1. Solo se podría asumir que los clusters eran contiguos (100 → 101 → 102), y falla si el archivo estaba fragmentado.
2. Otra operación pudo haber sobrescrito esos clusters, y recuperar dejaría un contenido inconsistente.

El log resuelve los dos: da la cadena exacta y permite detectar si hubo corrupción.

### Algoritmo

1. **Localizar** el evento que evidencia que el archivo fue borrado.
2. **Verificar** si se puede recuperar, analizando otros eventos: que ningún evento posterior haya tocado esos clusters.
3. **Reconstruir** el archivo y efectivizar sus clusters.

```
restore /dir1/file.txt
   │
   ▼
Buscar en el log el unlink de ese path ──── no hay ──► Avisar
   │
   ▼
Sacar cadena de clusters y tamaño
   │
   ▼
¿Un evento posterior usa esos clusters? ─── sí ──► Avisar y no restaurar
   │ no
   ▼
Rehacer la cadena en la FAT
   │
   ▼
Crear la dentry en el directorio padre
   │
   ▼
Actualizar el árbol en memoria
```

La consigna está poco definida a propósito: hay muchas soluciones posibles. Mientras más información guarde el log, mejor es la recuperación, pero el sistema queda más lento y ocupa más espacio.

### Casos borde

- Archivos que nunca existieron.
- Archivos que todavía existen.
- Archivos con nombres repetidos: en la entrega básica se puede restaurar el más reciente.
- El archivo nunca fue borrado o no está en los logs.
- Ya no existe el directorio padre.
- Ya hay otro archivo con el mismo nombre.
- El log se vuelve demasiado grande.
- Qué hacer con los logs al desmontar.

Se puede elegir no implementar alguno, pero hay que **notificar al usuario y no fallar en silencio**.

### Cómo invocar restore

```
./restore /mnt/fuse /dir1/file.txt
```

No se pueden implementar syscalls nuevas en el sistema operativo, así que hay dos alternativas:

| Opción                | Cómo funciona                                                                              | Contras                                         |
| --------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------------------- |
| `ioctl` (recomendada) | El programa `restore` llama a `ioctl`, y la lógica va en `fat_fuse_ioctl()`                | No anda en todas las arquitecturas sin configurar |
| Archivo de control    | Se escribe un path en un archivo especial, como `/.audit/.restore`, y se detecta esa escritura | Más simple, menos elegante                  |

Conviene implementar primero el comando y, cuando funcione, el algoritmo.

### ioctl

Es una syscall de manipulación especial de archivos:

```c
int ioctl(int fd, unsigned long op, ... /* argp */)
```

- `fd`: algún file descriptor.
- `op`: código de operación, dependiente de cada dispositivo.
- `argp`: argumento especial de usuario (`void *`).

**Desde el programa de usuario:**

```c
#include <fcntl.h>      // open
#include <sys/ioctl.h>  // ioctl
#include "fat_types.h"  // FAT_IOCTL_HELLO (definido arbitrariamente ahí)

int main() {
    const char *path = "/tmp/my_volume/.audit/events.bin";
    int fd = open(path, 0);
    int res = ioctl(fd, FAT_IOCTL_HELLO);
    return res;
}
```

**El hook en FUSE (`fat_fuse_ops.c`, caso representativo):**

```c
#define FAT_IOCTL_HELLO 0xF001

int fat_fuse_ioctl(/* path */, int op, /* arg, info, flags, data */) {
    if (op == FAT_IOCTL_HELLO) {
        DEBUG("ioctl: Hello world!");
    }
    return 0;
}
```

```
DEBUG audit.c:68 audit_init(): Audit file: /.audit/events.bin
DEBUG fat_fuse_ops.c:605 fat_fuse_ioctl(): ioctl: Hello world!
```

El `fd` es **simbólico**: puede no hacer falta estrictamente, pero tiene que referir a un archivo válido y existente.

#### Argumentos de ioctl

- El número de operación está ligado a la función del tercer argumento.
- Ese argumento puede ser de entrada y/o salida, o ignorarse.
- El número se puede codificar con las macros `_IO`, `_IOR`, `_IOW` e `_IOWR`.

Ejemplo: una operación que devuelve el estado del filesystem.

```c
enum status { STATUS_HEALTHY, STATUS_CORRUPTED, ... };

#define FAT_SAMPLE     _IO('F', 0)                // ningún significado específico
#define FAT_GET_STATUS _IOR('F', 42, enum status) // obtener status del filesystem
```

```c
int fat_fuse_ioctl(/* path */, int op, /* arg, info, flags */, void *data) {
    // op es el número de operación
    // data es el tercer argumento de ioctl
    if (op == FAT_GET_STATUS) {
        enum status *stat = data;
        *stat = STATUS_HEALTHY;
    }
}
```

#### Estructura de un número de operación

| Bits    | Campo  | Tamaño  | Qué es                                                   |
| ------- | ------ | ------- | -------------------------------------------------------- |
| 31...30 | `dir`  | 2 bits  | Dirección: lectura, escritura, ambas o ninguna           |
| 29...16 | `size` | 14 bits | Tamaño en bytes de la estructura del argumento (máx. 16383) |
| 15...8  | `type` | 8 bits  | Magic: identificador del driver o subsistema             |
| 7...0   | `nr`   | 8 bits  | Número para diferenciar nuestros comandos internos       |

---

## 6. Puntos estrella

- **Restore recursivo:** `restore -r /dir/` recupera un directorio completo. Hay que restaurar primero el padre y después los archivos, y decidir qué hacer si solo algunos se pueden recuperar.
- **Visualizador web:** timeline de eventos, filtros por operación, indicadores de qué se puede recuperar y un botón de restore.
- **Optimización del allocator:** asignar clusters secuencialmente (watermark) y reutilizar los viejos solo cuando no quede espacio. Así un archivo borrado tarda más en ser pisado.
- **Archivos grandes (más de 32 clusters):**
    1. Si son contiguos, guardar solo `start_cluster + length`.
    2. Eventos de continuación: un `OP_UNLINK_CONTINUATION` con el resto de la cadena.
    3. Archivo auxiliar `/.audit/chains.bin`: más complejo, pero más eficiente en espacio.

---

## 7. Debugging y comandos

| Comando                                 | Qué hace                                       |
| --------------------------------------- | ---------------------------------------------- |
| `make`                                  | Compila `fat-fuse`                             |
| `./fat-fuse disk.img mnt`               | Monta la imagen en `mnt`                       |
| `./fat-fuse -f disk.img mnt`            | Monta en primer plano: se ven los `DEBUG`      |
| `./fat-fuse disk.img /mnt/fuse -d`      | Muestra todos los mensajes                     |
| `fusermount -u mnt`                     | Desmonta                                       |
| `./audit_reader mnt/.audit/events.bin`  | Muestra el log en forma legible                |

- Usar `DEBUG()` generosamente (`fat_util.h`).
- `audit_reader` sirve para ver qué se está logueando realmente.
- Para ver una cadena de clusters, crear un archivo grande y hacer `DEBUG` de la cadena: `yes A | head -n 5000 > mnt/bigfile.txt`.

---

## 8. Cómo lo implementamos (INFORME.md)

### Arquitectura

- El código de logging y de restore va en `fat_fuse_ops.c`: si las operaciones de FUSE ya están ahí, no hacía falta complejizar la lectura.
- `audit.h` tiene lo compartido entre `fat-fuse`, `audit_reader` y `restore`.
- La creación de `.audit` y de `events.bin` está en funciones separadas (`create_audit_dir`, `create_events_bin`).
- Restore usa ioctl y su lógica está separada de las llamadas estándar de FUSE, así la auditoría queda desacoplada de la lectura y escritura normales.

`audit_init()` se llama en `fat_fuse_init`, después de cargar los hijos de `/`, porque hacen falta para saber si `.audit` existe. Es `void` por diseño: es un sistema forense, así que si no se puede crear el log, hace `exit(1)` y no sigue andando sin su función principal.

| Función                              | Para qué                                                 |
| ------------------------------------ | -------------------------------------------------------- |
| `fat_tree_node_search()`             | Buscar `/`, `/.audit` y `/.audit/events.bin` en el árbol |
| `fat_tree_get_file()`                | Sacar el `fat_file` de un nodo                           |
| `fat_file_init()`                    | Crear el `fat_file` en memoria                           |
| `fat_tree_insert()`                  | Meterlo en el árbol (memoria)                            |
| `fat_file_add_child_direntry()`      | Escribir la dentry en el cluster del padre (imagen)      |
| `fat_fuse_load_directory_children()` | Cargar los hijos de `.audit` desde el disco              |
| `fat_error()`                        | Imprimir errores antes de abortar                        |

### Bug de primer montaje

Con la imagen limpia, `ls mnt/.audit` salía vacío en el primer montaje, y en el segundo andaba bien.

`create_audit_dir` recibía `audit_node` como parámetro y le asignaba el nodo adentro. En C los parámetros son copias, así que el del llamador seguía en `NULL`:

1. `create_events_bin` recibía `audit_node = NULL`.
2. `fat_tree_insert(tree, NULL, events_file)` insertaba `events.bin` sin padre.
3. `ls` lista los hijos de `.audit` en el árbol, y no tenía ninguno.
4. En la imagen la dentry se escribía bien, porque `audit_dir` sí era correcto.

En el segundo montaje no se crea nada: se lee del disco con `fat_fuse_load_directory_children`, que inserta con el padre correcto.

**Arreglo:** `create_audit_dir` devuelve el nodo: `audit_node = create_audit_dir(...)`.

### Cambio en el código base

Al recuperar un `.txt` aparecía un `'\0'`. Esa marca la pasamos de `fat_file_unlink` a `fat_file_init`, solo para directorios nuevos, para que no se interpreten datos viejos como entradas válidas. Si no, ningún archivo volvía intacto.

### Estructura del evento

`audit_event_t` es `packed`, con una `union` que separa los datos según la operación.

| Campo            | Para qué                                         |
| ---------------- | ------------------------------------------------ |
| `event_id`       | ID secuencial, para el orden cronológico         |
| `timestamp`      | Unix timestamp de la operación                   |
| `operation_type` | `OP_WRITE`, `OP_UNLINK`, `OP_MKDIR` u `OP_RMDIR` |
| `username`       | Usuario, vía `fuse_get_context()`                |
| `filepath`       | Ruta absoluta del archivo o directorio           |

**`write_info` (para `OP_WRITE`):**

| Campo          | Para qué                                     |
| -------------- | -------------------------------------------- |
| `offset`       | Dónde se realizó la escritura                |
| `size`         | Cantidad de bytes escritos                   |
| `clusters[32]` | Clusters del archivo, para detectar colisiones |

**`unlink_info` (para `OP_UNLINK`, `OP_RMDIR` y `OP_MKDIR`):**

| Campo                | Para qué                                                         |
| -------------------- | ---------------------------------------------------------------- |
| `first_cluster`      | Inicio de la cadena, para reconstruir la dentry                  |
| `file_size`          | Tamaño original, para restaurarlo en la dentry                   |
| `parent_dir_cluster` | Padre, para reinsertar la entrada o detectar que ya no existe    |
| `clusters[32]`       | Cadena al momento del borrado, para verificar si fue sobrescrita |

**Por qué 512 bytes:** coincide con 1 cluster de la imagen. Se fuerza con `_padding[512]` y `static_assert(sizeof(audit_event_t) == 512)`. Los offsets salen directo (`índice * 512`) y cada evento ocupa exactamente un cluster del log.

**ID secuencial:** al montar, `file_size / sizeof(audit_event_t)`. Después se incrementa la global `current_event_id`, y así hay continuidad entre montajes.

**Registro de `write`:** después de `fat_file_pwrite()`, en `fat_fuse_write()` se arma el evento, se recorre la cadena con `fat_table_read_cluster_value()` para llenar `clusters[32]`, y `audit_log_write()` lo agrega al final de `events.bin`.

### Por qué cada operación guarda eso

- **`write`:** para detectar si alguien pisó los clusters de un archivo borrado.
- **`mkdir`:** por lo mismo. Si hacés `rm b.txt` y `mkdir dir` toma el cluster 7 de `b.txt`, ya no se puede recuperar.
- **`unlink`:** cadena completa, porque los archivos pueden estar fragmentados (`b.txt = [8, 9, 11]`).

No guardamos la dentry completa: alcanza con nombre, primer cluster, tamaño y si es archivo o directorio. Las fechas no hacen falta: el archivo aparece con la fecha de restauración.

Un archivo contiguo y uno fragmentado se guardan igual, y restore los reconstruye igual porque sigue la lista.

**Más de 32 clusters:** elegimos loguear parcialmente. El `while` corta a los 32, y se detecta el corte porque la lista tiene menos clusters de los que indica `file_size`.

### Por qué ioctl

Descartamos el archivo especial por ser menos robusto. Como FUSE rechaza ioctl sobre directorios (`ENOTTY`), `restore.c` abre `/.audit/events.bin` dentro del punto de montaje y emite `FAT_IOCTL_RESTORE`, definido como `_IOW('f', 1, char[256])`.

### Las 5 etapas de audit_restore()

1. **Existencia previa:** si el archivo ya existe en el árbol, `-EEXIST`.
2. **Búsqueda:** recorre `events.bin` de atrás hacia adelante buscando el último evento de ese path. Si no hay, o no fue un `OP_UNLINK`, `-ENOENT`.
3. **Validación:** chequea el directorio padre y la integridad de la cadena, contrastando `file_size` con los clusters guardados. Si está truncada, `-EFBIG`.
4. **Colisiones:**
    - **Por log:** barre los eventos posteriores al `UNLINK`. Si un `OP_WRITE` u `OP_MKDIR` usó un cluster de la cadena, `-EBUSY`.
    - **En la FAT actual:** `fat_table_is_cluster_used()` por cada cluster, que protege de cambios no logueados. También `-EBUSY`.
5. **Reconstrucción:**
    - **FAT:** rehace los enlaces con `fat_table_set_next_cluster()` y cierra con `FAT_CLUSTER_END_OF_CHAIN_MAX`.
    - **Dentry:** crea una que apunta a `c[0]`, con su tamaño, y la escribe en el padre.
    - **Árbol:** `fat_tree_insert`, y el archivo se ve en `ls` y `cat` sin volver a montar.

| Retorno de `audit_restore()` | Significa                                    |
| ---------------------------- | -------------------------------------------- |
| `0`                          | Restaurado en su ubicación original          |
| `1`                          | El padre ya no existe: restaurado en `/`     |
| `-EEXIST`                    | Ya existe un archivo con ese nombre          |
| `-ENOENT`                    | Nunca fue borrado o no figura en los registros |
| `-EFBIG`                     | Cadena truncada                              |
| `-EBUSY`                     | Colisión                                     |

### Casos borde y limitaciones

La idea es no adivinar qué quiso hacer el usuario: lo que no se puede resolver termina en un error específico, no en un fallo en silencio.

- **Ya no existe el padre:** se evalúa `parent_dir_cluster`. Si fue eliminado o reutilizado, el archivo va a `/` y se retorna `1`.
- **Nunca fue borrado o no está en los registros:** `-ENOENT`.
- **Mismo nombre:** `-EEXIST`, también si ya existe `/nombre` al restaurar en la raíz.
- **Borrado varias veces:** se restaura el más reciente.
- **Persistencia:** cada evento se escribe en la imagen en el momento, y `audit_init` carga lo que ya existe. Al desmontar no pasa nada especial.

**Limitaciones:**
- Solo se recuperan archivos, no directorios.
- Más de 32 clusters no se recupera.
- El log puede pisar archivos borrados: `events.bin` crece y toma clusters libres sin generar eventos.
- `touch` no se loguea (no hay `OP_MKNOD`).
- Las fechas originales se pierden.

### Punto estrella: visualizador web

Express sobre Node.js, y una web estática. El diseño se hizo con IA.

- `audit_reader --json` convierte `events.bin` a JSON para la web.
- El botón ejecuta `./restore <montaje> <path>` con `execFile`.
- El server captura la salida de `fat-fuse` y la muestra.

```bash
make
cd web && npm install && npm start
```

### Tests del restore

```bash
cp resources/fatfs.img disk.img
./fat-fuse -f disk.img mnt

# Test 1: restore exitoso (datos intactos)
yes C | head -c 3000 > mnt/c.txt     # archivo de 6 clusters
md5sum mnt/c.txt
rm mnt/c.txt
./restore mnt /c.txt                 # "Restaurado exitosamente..."
md5sum mnt/c.txt                     # mismo hash

# Test 2: restore con conflicto
echo hola > mnt/b.txt
rm mnt/b.txt
mkdir mnt/dir
./restore mnt /b.txt                 # "Device or resource busy"
./tools/audit_reader -v mnt/.audit/events.bin
# UNLINK de /b.txt y MKDIR de /dir comparten un cluster
```

---

## Glosario que necesito saber (en FAT32 + FUSE)

- **FUSE:** mecanismo para implementar un filesystem como programa de usuario. El kernel le reenvía las operaciones.
- **VFS:** capa del kernel con la misma interfaz para todos los filesystems. No confundir con VFAT, la extensión de FAT para nombres largos.
- **FAT:** tabla con un casillero por cluster, que guarda el siguiente cluster del archivo o una marca de libre, fin o dañado.
- **Cluster:** unidad mínima de espacio que se le da a un archivo. En el lab, 512 B.
- **Sector de boot:** ficha técnica del volumen: cómo está organizado y dónde está cada cosa.
- **Dentry:** entrada de directorio de 32 bytes, con nombre 8.3, atributos, primer cluster y tamaño.
- **Cadena de clusters:** secuencia de clusters de un archivo, que se sigue por la FAT.
- **Fragmentación:** cuando los clusters de un archivo no son contiguos.
- **Little endian:** orden en que el byte menos significativo va primero.
- **Borrado lógico:** marcar la dentry con `0xE5` y liberar la FAT, sin tocar los datos.
- **Borrado físico:** que los datos se destruyan o se sobrescriban.
- **`0xE5`:** primer byte de una dentry borrada. Es una marca de dentry, no un valor de la FAT.
- **`0x00`:** primer byte que marca el fin del directorio.
- **`events.bin`:** log binario de eventos de tamaño fijo, en `/.audit/`. Persiste entre montajes.
- **Serialización binaria:** escribir una estructura como bytes crudos, tal cual está en memoria.
- **`packed`:** atributo para que el compilador no agregue relleno entre campos.
- **`audit_reader`:** herramienta que muestra `events.bin` en forma legible.
- **`restore`:** comando que busca el borrado, chequea conflictos y rehace la FAT y la dentry.
- **Conflicto:** un evento posterior al borrado que usa alguno de los clusters del archivo.
- **`ioctl`:** syscall para mandar comandos especiales a un archivo o dispositivo.
- **`mmap`:** usar un archivo como si fuera memoria. Así se accede a la FAT.
- **Hard link:** dos nombres para los mismos datos. FAT no los tiene porque no tiene inodos.
