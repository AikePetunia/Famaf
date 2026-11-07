# Apunte – Lab 3: Sistemas de archivos y FAT32

Sistemas Operativos 2026 – FaMAFyC

Este apunte acompaña la guía de estudio. Explica las partes de un sistema de archivos que necesitan para el laboratorio, cómo se implementan en FAT32 y cómo las maneja el código del esqueleto. No cubre el diseño del log ni el algoritmo de restauración: eso depende de cómo lo implemente cada grupo.

Cuando un ejemplo usa números concretos, son los de la imagen `resources/fatfs.img`. Otras imágenes (por ejemplo `test_empty.img`) tienen otros valores, y en la sección 2 se explica cómo leerlos.

---

## 1. Anatomía común de un sistema de archivos

Un disco, o una imagen de disco como la del laboratorio, es solo una secuencia de bloques numerados. No sabe nada de archivos ni de directorios. El **sistema de archivos** es una forma de organizar esos bloques para ofrecer dos abstracciones:

- **Archivos**: secuencias de bytes con un nombre, que se pueden leer y escribir desde cualquier posición (*offset*).
- **Directorios**: listas que asocian nombres con archivos u otros directorios. Al anidarse forman el árbol que vemos con `ls` y `cd`.

Para eso, todo sistema de archivos, sea FAT32 o cualquier otro, guarda en el disco cuatro tipos de información:

| Parte | Para qué sirve | En FAT32 |
|---|---|---|
| **Información del volumen** | Describe cómo está organizado el resto del disco: tamaño de bloque, dónde empieza cada región, dónde está el directorio raíz. Es lo primero que se lee al montar. | Sector de boot |
| **Metadatos de cada archivo** | Nombre, tamaño, fechas, atributos y dónde están sus datos. | Entrada de directorio (32 bytes) |
| **Datos** | El contenido de los archivos, y también el de los directorios. | Área de datos (clusters) |
| **Registro de espacio libre** | Qué bloques se pueden usar para datos nuevos. | Entradas con valor 0 en la tabla FAT - Esto no es tan obvio en FAT y no lo vimos como una parte del sistema de archivos independiente |

En FAT32 la tabla FAT cumple dos roles: registra el espacio libre y además indica en qué orden se encadenan los clusters de cada archivo.

Dos ideas que valen para cualquier sistema de archivos:

- **Un directorio también es un archivo.** Su contenido es la lista de entradas (nombre → metadatos) de lo que contiene, y se guarda en bloques de datos como cualquier otro archivo.
- **Para llegar a un archivo hay que recorrer el camino desde la raíz.** Para abrir `/docs/notas.txt`, el sistema de archivos lee la información del volumen para encontrar la raíz, busca la entrada `docs` en la raíz, lee ese directorio, busca `notas.txt` y con sus metadatos llega a los datos. Un bloque al que no lleva ningún camino es inalcanzable, aunque tenga datos.

**Leer en OSTEP**: cap. 40, secciones *Overall Organization*, *Directory Organization*, *Free Space Management* y *Access Paths*.

---

## 2. FAT32 en una página: del número de cluster al byte en la imagen

### Sectores y clusters

- El **sector** es la unidad física del disco. En nuestras imágenes mide 512 bytes.
- El **cluster** es la unidad de asignación del sistema de archivos: un grupo de sectores consecutivos. Un archivo siempre ocupa una cantidad entera de clusters.

Si el archivo no llena su último cluster, el resto queda desperdiciado (**fragmentación interna**). Con clusters más grandes la FAT tiene menos entradas, pero los archivos chicos desperdician más espacio.

En el código del laboratorio existen los sectores, pero nuestra abstracción de `fat_file` y todas las operaciones sobre ellos sólo utilizan los clusters e ignoran los sectores. Si lo buscan, en `fat_volume` se los menciona.

### Regiones del volumen

```
 byte 0                                                              fin
 ┌──────────────────┬──────────┬──────────┬─────────────────────────────┐
 │ Región reservada │  FAT #1  │  FAT #2  │       Área de datos         │
 │ (sector de boot) │          │ (copia)  │ cluster 2 │ cluster 3 │ ... │
 └──────────────────┴──────────┴──────────┴─────────────────────────────┘
```

- **Región reservada**: empieza con el **sector de boot**, que contiene los parámetros del volumen.
- **Tablas FAT**: suele haber dos copias iguales, por redundancia. El esqueleto actualiza solo la primera.
- **Área de datos**: los clusters con el contenido de archivos y directorios. En FAT32 **el directorio raíz también está acá**, en el cluster que indica el sector de boot (no tiene una región fija propia).

### Campos del sector de boot que usamos

| Offset | Tamaño | Campo | `fatfs.img` |
|---|---|---|---|
| `0x0B` | 2 | Bytes por sector | 512 |
| `0x0D` | 1 | Sectores por cluster | 2 → clusters de **1024 bytes** |
| `0x0E` | 2 | Sectores reservados | 32 |
| `0x10` | 1 | Cantidad de tablas FAT | 2 |
| `0x24` | 4 | Sectores por FAT | 1016 |
| `0x2C` | 4 | Cluster del directorio raíz | 2 |

Los pueden leer directamente de la imagen. Todos los números están en *little endian*:

```bash
xxd -s 0x0B -l 6 resources/fatfs.img   # bytes/sector, sectores/cluster, reservados, #FATs
xxd -s 0x2C -l 4 resources/fatfs.img   # cluster del directorio raíz
```

Nota: no tienen que aprenderse las direcciones de memoria, sólo que esos campos existen.

### Las cuentas

```
inicio_FAT        = sectores_reservados × bytes_por_sector
inicio_área_datos = (sectores_reservados + cant_FATs × sectores_por_FAT) × bytes_por_sector

entrada FAT del cluster N  →  inicio_FAT + N × 4
datos del cluster N        →  inicio_área_datos + (N − 2) × bytes_por_cluster
```

Se resta 2 porque las entradas 0 y 1 de la FAT están reservadas: **el primer cluster de datos es el 2**.

Con `fatfs.img`:

- `inicio_FAT` = 32 × 512 = 16 384
- `inicio_área_datos` = (32 + 2 × 1016) × 512 = 1 056 768
- La entrada FAT del cluster 100 está en el byte 16 384 + 400 = 16 784.
- Los datos del cluster 100 empiezan en el byte 1 056 768 + 98 × 1024 = 1 157 120.

En el código, estas cuentas las hacen `fat_table_cluster_offset()` y `fat_table_set_next_cluster()`.

### La tabla FAT

Es un arreglo con una entrada de 4 bytes por cluster. La entrada `N` dice qué pasa con el cluster `N`:

| Valor de `FAT[N]` | Significado |
|---|---|
| `0x00000000` | Cluster libre |
| `2` … `0x0FFFFFEF` | Cluster usado; el valor es el **siguiente** cluster del archivo |
| `0x0FFFFFF7` | Cluster dañado (*bad cluster*) |
| `0x0FFFFFF8` … `0x0FFFFFFF` | Último cluster del archivo (*end of chain*, EOC) |

Los valores tienen 28 bits útiles; los 4 bits altos están reservados. Por eso un valor como `0xFFFFFFFF` no es uno de los valores especiales de la tabla.

Un archivo es una **lista enlazada de clusters**. El primero se guarda en la entrada de directorio y los siguientes se obtienen de la FAT. Ejemplo: un archivo que ocupa los clusters 5, 9 y 6, en ese orden.

```
Entrada de directorio:  nombre = "NOTAS   TXT", cluster inicial = 5, tamaño = 2500

FAT:  ...  [5] = 9   [6] = EOC   [7] = 0   [8] = 0   [9] = 6  ...
            │                                         │
            └─────────────────────────────────────────┘
       5 ──→ 9 ──→ 6 ──→ fin
```

Los clusters no tienen por qué ser contiguos: el archivo está **fragmentado**. La FAT es la única que sabe el orden. Es totalmente válido también que el archivo utilize el cluster 6 *después* del cluster 9, nada dice que tienen que ser en orden ascendente.

En las filminas que están subidas en el aula virtual tienen grafiquitos más bonitos.

### La entrada de directorio (32 bytes)

| Offset | Tamaño | Campo |
|---|---|---|
| 0 | 8 | Nombre (relleno con espacios). **El primer byte tiene significado especial**, ver abajo |
| 8 | 3 | Extensión |
| 11 | 1 | Atributos (bit `0x10` = directorio, `0x02` = oculto, `0x01` = solo lectura, …) |
| 13–19 | | Fecha y hora de creación y último acceso |
| 20 | 2 | 16 bits altos del cluster inicial |
| 22–25 | | Fecha y hora de modificación |
| 26 | 2 | 16 bits bajos del cluster inicial |
| 28 | 4 | Tamaño del archivo en bytes (**0 para directorios**) |

El primer byte del nombre:

- `0x00`: la entrada está libre **y no hay más entradas** en este directorio.
- `0xE5`: la entrada está libre porque se borró un archivo, pero **puede haber entradas válidas después**.

El tamaño en bytes es necesario porque la cadena de clusters solo dice cuántos clusters usa el archivo, no cuántos bytes del último son datos válidos. Por ejemplo, un archivo de 2500 bytes con clusters de 1024 usa 3 clusters (3072 bytes), y los últimos 572 bytes no son parte del archivo.

Un cluster de 1024 bytes tiene lugar para 1024 / 32 = **32 entradas de directorio**.

**Leer**: Wikipedia, *Design of the FAT file system*, secciones *Boot Sector*, *File Allocation Table* y *Directory table* (solo FAT32, sin VFAT). NO tienen que aprenderse cosas como la posición exacta de cada campo ni direcciones de memoria.

---

## 3. Vida de un archivo en FAT32

En esta sección vemos qué cambia en el disco con cada operación. Para cada una se indica qué hace el esqueleto y en qué se diferencia de la especificación de FAT, cuando corresponde.

### Cómo elige un cluster libre el esqueleto

`fat_table_get_next_free_cluster()` recorre la FAT **desde el cluster 2** y devuelve el primero con valor 0 (*first fit*). Esto tiene una consecuencia importante para el laboratorio: un cluster liberado por un borrado vuelve a ser candidato enseguida, y si es el libre de menor número, la próxima operación que pida un cluster lo va a reutilizar.

### `mkdir /dir` y `create /dir/a.txt`

Las dos operaciones pasan por `fat_file_init()` y hacen lo mismo en el disco:

1. Buscar un cluster libre `C`.
2. Marcar `FAT[C] = EOC`: el archivo ocupa un cluster.
3. Armar la entrada de directorio con nombre, atributos (directorio o no), fechas, cluster inicial `C` y tamaño 0.
4. Escribir esa entrada en los clusters de datos del **directorio padre** (`fat_file_add_child_direntry()`).

Después, en memoria, se inserta el nuevo `fat_file` en el árbol (`fat_tree_insert()`).

Por ejemplo, la primera vez que se monta una imagen vacía y se crea `/.audit`, se toma el primer cluster libre, se marca como EOC y se agrega una entrada en el cluster del directorio raíz (el 2). Al crear `/.audit/events.bin` se repite lo mismo, pero la entrada se escribe en el cluster de `/.audit`.

Diferencias del esqueleto con la especificación:

- **Archivos vacíos**: según FAT, un archivo vacío puede tener cluster inicial 0 y no ocupar ningún cluster. El esqueleto le asigna uno igual, así el código de escritura puede suponer que todo archivo tiene al menos un cluster.
- **`.` y `..`**: según FAT, un directorio nuevo tiene en su primer cluster las entradas `.` y `..`. El esqueleto no las escribe; `readdir` las agrega al listar.
- **Nuevas entradas**: se agregan al final de las entradas del directorio. No se reutilizan los lugares de archivos borrados (`0xE5`).
- **Directorios de un solo cluster**: en FAT, un directorio que llena su cluster crece como un archivo (se le encadena otro cluster). El esqueleto no lo implementa: un directorio solo puede tener las entradas que entran en su primer cluster.

### `write`

`fat_file_pwrite()` escribe los bytes en los clusters que correspondan al offset. Si la escritura sigue después del último cluster del archivo, pide uno nuevo (`next_or_new_cluster()`):

```
Antes:   FAT[7] = EOC                          (archivo: 7)
Pide un cluster libre → 12
Después: FAT[7] = 12,  FAT[12] = EOC           (archivo: 7 → 12)
```

Al final actualiza el tamaño y la fecha de modificación de la entrada de directorio y la vuelve a escribir en el cluster de datos del padre.

### `unlink` y `rmdir`

`fat_fuse_unlink()` y `fat_fuse_rmdir()` llaman a `fat_file_unlink()`, que:

1. Recorre la cadena de clusters y pone cada entrada de la FAT en 0 (libre). Antes de liberar cada cluster, escribe un byte `'\0'` al principio del cluster (ver sección 4).
2. Reemplaza el primer byte del nombre por `0xE5` y vuelve a escribir la entrada en el directorio padre.

Después se saca el archivo del árbol en memoria (`fat_tree_delete()`).

`rmdir(2)` debería fallar con `ENOTEMPTY` si el directorio tiene contenido. El esqueleto no lo verifica: si se borrara un directorio con archivos, los clusters de esos archivos quedarían marcados como usados sin que ninguna entrada los referencie. Normalmente no pasa, porque `rm -r` borra primero el contenido y después el directorio.

---

## 4. Borrado lógico vs. físico

Hay dos maneras de borrar un archivo:

- **Borrado físico**: se destruyen los datos, por ejemplo sobrescribiendo los clusters con ceros.
- **Borrado lógico**: solo se modifican los **metadatos** para que el sistema de archivos deje de considerar el archivo y su espacio. Los datos quedan donde estaban.

FAT32, como la mayoría de los sistemas de archivos, hace borrado lógico: es mucho más barato (se escriben unos pocos bytes en lugar de todos los clusters).

### Qué queda en el disco después de `rm /dir/a.txt`

Supongamos que `a.txt` ocupaba los clusters 40 → 41 y medía 1500 bytes.

```
                    ANTES                               DESPUÉS
Entrada en /dir:    "A       TXT"  inicio=40 tam=1500   0xE5 "       TXT"  inicio=40 tam=1500
FAT:                [40]=41  [41]=EOC                   [40]=0  [41]=0
Clusters 40 y 41:   contenido del archivo               contenido del archivo
                                                        (salvo el primer byte, ver abajo)
```

- **Se pierde**: el primer carácter del nombre y **la cadena de clusters**. Con la FAT en 0 no queda forma de saber que después del 40 venía el 41.
- **Se conserva**: el resto del nombre, la extensión, el cluster inicial, el tamaño, las fechas y casi todos los datos.

Los datos se vuelven **inalcanzables**: el sistema de archivos solo llega a un cluster siguiendo un camino desde la raíz, y ya no hay ninguna entrada válida que apunte al 40.

### Cuándo se pierden de verdad los datos

Los clusters 40 y 41 ahora figuran como libres. En cuanto otra operación pida un cluster (crear un archivo, hacer `mkdir`, agrandar un archivo con `write`), el allocator *first fit* puede elegirlos y **sobrescribirlos**. Desde ese momento los datos originales ya no existen.

Ver que hoy `FAT[40] = 0` no alcanza para saber que los datos siguen ahí: el cluster pudo ser usado por otro archivo y liberado de nuevo.

### Sin información extra, recuperar es adivinar

Una herramienta que solo mira el disco ve la entrada con `0xE5`, que conserva el cluster inicial y el tamaño. Sabe que el archivo empezaba en el 40 y ocupaba 2 clusters, pero no sabe cuál era el segundo. Lo único que puede hacer es **suponer** que eran contiguos (40, 41, …) y que nadie los sobrescribió. Si el archivo estaba fragmentado o los clusters se reutilizaron, el resultado es basura.

Para recuperar con certeza hace falta información guardada **antes** de que se pierda. Esa es la idea del sistema de auditoría del laboratorio.

### El byte que escribe el esqueleto

Como se vio en la sección 3, `fat_file_unlink()` escribe un `'\0'` al principio de cada cluster que libera. Lo hace para que, si ese cluster se reutiliza como directorio, la primera entrada se lea como "fin del directorio" (`0x00`) y no como basura. Para la recuperación, significa que **el primer byte de cada cluster del archivo borrado se pierde**.

---

## 5. Hablarle al sistema de archivos desde un programa de usuario

Un programa de usuario solo puede pedirle cosas al sistema de archivos mediante **llamadas a sistema** (`open`, `read`, `write`, `unlink`, …). El VFS las recibe, ve que el path pertenece a un volumen montado con FUSE y se las pasa a nuestro proceso, que ejecuta la función correspondiente de `struct fuse_operations`.

```
 programa ──syscall──→ VFS (kernel) ──→ módulo FUSE (kernel) ──→ fat-fuse (usuario)
                                                                   fat_fuse_unlink(), ...
```

`restore` no es ninguna de esas operaciones, y no podemos crear una llamada a sistema nueva porque habría que modificar el kernel. Hay dos formas de hacerle llegar el pedido al sistema de archivos usando operaciones que ya existen.

### Opción 1: `ioctl`

`ioctl(fd, cmd, arg)` es una llamada a sistema genérica para operaciones que **no tienen una llamada a sistema propia**. Se usa mucho con dispositivos: por ejemplo, para preguntarle a una terminal su tamaño o a un disco su capacidad.

- `fd`: un descriptor de archivo abierto. El comando va dirigido al sistema de archivos o dispositivo de ese archivo, así que el programa tiene que abrir algo **dentro del punto de montaje**. (¿Se acuerdan de los file descriptors en el lab 1? Bueno, es exactamente lo mismo)
- `cmd`: un número que identifica el comando. Se arma con las macros `_IO`, `_IOR`, `_IOW` e `_IOWR` de `<sys/ioctl.h>`, que codifican en el número la dirección de los datos (hacia el kernel, desde el kernel o ambas) y su **tamaño**. FUSE usa ese tamaño para saber cuántos bytes copiar entre el programa y nuestro proceso.
- `arg`: un puntero a los datos del comando.

Del lado del sistema de archivos, FUSE llama a la operación `ioctl` de `fuse_operations`; en el esqueleto es `fat_fuse_ioctl()`, que hoy devuelve `-ENOSYS`. La función recibe el `cmd` y los datos, hace el trabajo y su valor de retorno le llega al programa como resultado de `ioctl()`. Así es fácil reportar errores: devolver `-ENOENT` hace que `ioctl()` retorne -1 con `errno = ENOENT`.

El soporte de `ioctl` en FUSE varía según el sistema operativo y la plataforma (la consigna lo menciona). Por eso existe la segunda opción.

**Leer**: `man 2 ioctl` y la documentación de `ioctl` en `struct fuse_operations`.

### Opción 2: un archivo de control

El programa escribe un pedido (por ejemplo, el path a restaurar) en un archivo especial como `/.audit/.restore`. En `fat_fuse_write()` se detecta que el destino es ese archivo y, en lugar de guardar los bytes, se ejecuta la restauración.

Funciona en cualquier plataforma, porque solo usa `write`, pero tiene desventajas:

- Una operación que normalmente guarda datos pasa a tener otro significado según el path.
- Devolver el resultado es más indirecto: hay que codificarlo en el valor de retorno de `write` o dejarlo en otro archivo para que el programa lo lea.

O sea, es una opción fea, pero funciona.

---

## 6. Memoria y disco en el esqueleto

Mientras el volumen está montado, la información del sistema de archivos vive en dos lugares: en la **imagen** (el "disco") y en **estructuras en memoria** del proceso `fat-fuse`. Las operaciones FUSE consultan la memoria, pero lo único que sobrevive a desmontar es la imagen. Toda modificación tiene que hacerse **en los dos lugares**.

### Las tres capas

| Estructura | Qué es | Cómo se sincroniza con la imagen |
|---|---|---|
| `fat_table` | La tabla FAT, mapeada en memoria con `mmap` | `fat_table_set_next_cluster()` escribe la entrada en la imagen con `pwrite` **y** actualiza la memoria mapeada |
| `fat_file` | Un archivo o directorio: copia de su entrada de directorio, cluster inicial, posición en el padre, etc. | Las funciones de `fat_file.c` reescriben la entrada en el directorio padre con `pwrite` cuando cambia |
| `fat_tree` | El árbol de directorios con todos los `fat_file` | **No existe en la imagen**: se construye al montar leyendo los directorios, y se actualiza a mano con `fat_tree_insert()` y `fat_tree_delete()` |

### `mmap` y `MAP_PRIVATE`

`mmap()` hace que una región de un archivo se vea como memoria: en lugar de llamar a `read` para cada entrada de la FAT, se accede como a un arreglo (`fat_map[N]`). El sistema operativo carga las páginas a medida que se usan.

El esqueleto mapea la FAT con `MAP_PRIVATE`. Con esa opción, **escribir en la memoria mapeada no modifica el archivo**: los cambios quedan en una copia privada del proceso. (Con `MAP_SHARED` sí llegarían al archivo.) Por eso `fat_table_set_next_cluster()` hace las dos cosas:

```c
pwrite(table->fd, &next_cluster_le32, sizeof(le32), entry_offset); // imagen
((le32 *)table->fat_map)[cur_cluster] = next_cluster_le32;           // memoria
```

Si solo se modificara `fat_map`, todo funcionaría mientras el volumen está montado, pero los cambios se perderían al desmontar.

**Leer**: OSTEP cap. 39, el recuadro sobre `mmap`, y `man 2 mmap` (diferencia entre `MAP_PRIVATE` y `MAP_SHARED`).

Este es el error más común que cometen en el laboratorio. Es difícil de identificar también, porque sólo se ve cuando se desmonta la imagen y se la vuelve a montar. Nota: Claude tampoco detectó este error hasta que un humano se lo dijo.

### El árbol se lee una sola vez

Al montar, `fat_fuse_init()` lee el directorio raíz y arma el árbol. Cada directorio se lee del disco **la primera vez** que se lo recorre (`children_read`), y después se usa solo lo que está en memoria. Eso implica:

- Si se escribe una entrada de directorio directamente en la imagen sin insertar el `fat_file` en el árbol, el archivo **no aparece** (`ls` y `cat` no lo ven) hasta desmontar y volver a montar.
- Al revés, si se inserta en el árbol pero no se escribe la entrada en la imagen, el archivo se ve mientras el volumen está montado y **desaparece** al volver a montar.

Para saber si un cambio es persistente, la pregunta es siempre la misma: **¿alguien escribió en la imagen?**

| Función | ¿Escribe en la imagen? |
|---|---|
| `fat_table_set_next_cluster()` | Sí (entrada de la FAT) |
| `fat_file_add_child_direntry()` | Sí (entrada en el directorio padre) |
| `fat_file_pwrite()` | Sí (datos y entrada de directorio) |
| `fat_tree_insert()`, `fat_tree_delete()` | No, solo memoria |
