# Lab 3: Sistemas de archivos y FAT32

## 1. Anatomía común de un sistema de archivos

Un disco, o una imagen de disco, es solo una secuencia de bloques numerados: no sabe nada de archivos ni de directorios. El **sistema de archivos** es una forma de organizar esos bloques para ofrecer dos abstracciones:

- **Archivos:** secuencias de bytes con un nombre, que se pueden leer y escribir desde cualquier posición (*offset*).
- **Directorios:** listas que asocian nombres con archivos u otros directorios. Al anidarse forman el árbol que vemos con `ls -l` y `cd (Change Directory)`.

Todo sistema de archivos guarda cuatro tipos de información:

| Parte                     | Para qué sirve                                                                        | En FAT32                         |
| ------------------------- | ------------------------------------------------------------------------------------- | -------------------------------- |
| Información del volumen   | Describe cómo está organizado el resto del disco. Es lo primero que se lee al montar. | Sector de boot                   |
| Metadatos de cada archivo | Nombre, tamaño, fechas, atributos y dónde están sus datos.                            | Entrada de directorio (32 bytes) |
| Datos                     | El contenido de los archivos, y también el de los directorios.                        | Área de datos (clusters)         |
| Registro de espacio libre | Qué bloques se pueden usar para datos nuevos.                                         | Entradas con valor 0 en la FAT   |

#### ¿Que es Fat32? 

Fat32, (_File Allocation Table 32_) es un sistema de archivos creado por Microsoft en 1996 que organiza y almacena datos en unidades de almacenamiento, como memorias USB, tarjetas SD y discos externos

En FAT32 la tabla FAT cumple **dos roles**: registra el espacio libre e indica en qué orden se encadenan los clusters de cada archivo.

Dos ideas que valen para cualquier sistema de archivos:

- **Un directorio también es un archivo.** Su contenido es la lista de entradas (nombre -> metadatos) de lo que contiene, y se guarda en bloques de datos.
- **Para llegar a un archivo hay que recorrer el camino desde la raíz.** Para abrir `/docs/notas.txt` se lee la información del volumen para encontrar la raíz, se busca `docs` en la raíz, se lee ese directorio, se busca `notas.txt` y con sus metadatos se llega a los datos. Un bloque al que no lleva ningún camino es **inalcanzable**, aunque tenga datos.

// Tabla fat32
![[Pasted image 20261106234716.png]]

---

## 2. FAT32 en una página

### Sectores y clusters

- **Sector/Numero de cluster:** la unidad física del disco. En nuestras imágenes mide 512 bytes.
- **Cluster:** Un cluster en este lab son 512 bytes. Un cluster por asi decirlo, es como una "medida de almacenamiento", almacena bytes (Informacion) con una asignacion de numero de cluster. 
Ejemplo 
![[Pasted image 20261106234638.png]]
(El verde). Es un cluster 2, y tiene `FF FF FF 0F` como informacion. 

Si el archivo no llena su último cluster, el resto queda desperdiciado (**fragmentación interna**). Con clusters más grandes la FAT tiene menos entradas, pero los archivos chicos desperdician más espacio.

`fat_file` y todas sus operaciones solo usan clusters e ignoran los sectores. Los sectores se mencionan en `fat_volume`.
##### Entradas de directorio y sector de datos
![[Pasted image 20261106234135.png]]
### Regiones del volumen

```
 byte 0                                                              fin
 ┌──────────────────┬──────────┬──────────┬─────────────────────────────┐
 │ Región reservada │  FAT #1  │  FAT #2  │       Área de datos         │
 │ (sector de boot) │          │ (copia)  │ cluster 2 │ cluster 3 │ ... │
 └──────────────────┴──────────┴──────────┴─────────────────────────────┘
```

- **Región reservada:** empieza con el **sector de boot**, que tiene los parámetros del volumen.
- **Tablas FAT:** suele haber dos copias iguales, por redundancia. El esqueleto actualiza solo la primera.
- **Área de datos:** los clusters con el contenido de archivos y directorios. En FAT32 **el directorio raíz también está acá**, en el cluster que indica el sector de boot.

### Campos del sector de boot (esto deberia de tener el nombre tal cual, no lo tiene...)

No hace falta aprender los offsets, solo que estos campos existen.

| Campo                       | `fatfs.img`                         |
| --------------------------- | ----------------------------------- |
| Bytes por sector            | 512                                 |
| Sectores por cluster        | 2, o sea clusters de **1024 bytes** |
| Sectores reservados         | 32                                  |
| Cantidad de tablas FAT      | 2                                   |
| Sectores por FAT            | 1016                                |
| Cluster del directorio raíz | 2                                   |

Todos los números están en *little endian*. Se pueden leer de la imagen:

```bash
xxd -s 0x0B -l 6 resources/fatfs.img   # bytes/sector, sectores/cluster, reservados, #FATs
xxd -s 0x2C -l 4 resources/fatfs.img   # cluster del directorio raíz
```

### Las cuentas

```
inicio_FAT        = sectores_reservados × bytes_por_sector
inicio_área_datos = (sectores_reservados + cant_FATs × sectores_por_FAT) × bytes_por_sector

entrada FAT del cluster N  →  inicio_FAT + N × 4
datos del cluster N        →  inicio_área_datos + (N − 2) × bytes_por_cluster
```

// No me sirve de nada ver "Las cuentas" sin saber a que pertenecen.
// Principalmente a algo que le falta a estos apuntes es lo "Visual", por que parece todos conceptos muy abstractos.
// Tampoco me indica que significa cada cosa

Se resta 2 porque las entradas 0 y 1 de la FAT están reservadas: **el primer cluster de datos es el 2**.

Con `fatfs.img`:

- `inicio_FAT` = 32 × 512 = 16 384
- `inicio_área_datos` = (32 + 2 × 1016) × 512 = 1 056 768
- La entrada FAT del cluster 100 está en el byte 16 384 + 400 = 16 784.
- Los datos del cluster 100 empiezan en el byte 1 056 768 + 98 × 1024 = 1 157 120.

En el código, estas cuentas las hacen `fat_table_cluster_offset()` y `fat_table_set_next_cluster()`.

### La tabla FAT

Es un arreglo con una entrada de 4 bytes por cluster. La entrada `N` dice qué pasa con el cluster `N`:

| Valor de `FAT[N]`           | Significado                                          |
| --------------------------- | ---------------------------------------------------- |
| `0x00000000`                | Cluster libre                                        |
| `2` … `0x0FFFFFEF`          | Cluster usado: el valor es el **siguiente** cluster  |
| `0x0FFFFFF7`                | Cluster dañado (*bad cluster*)                       |
| `0x0FFFFFF8` … `0x0FFFFFFF` | Último cluster del archivo (*end of chain*, EOC)     |

Los valores tienen 28 bits útiles, y los 4 altos están reservados. Por eso `0xFFFFFFFF` no es uno de los valores especiales de la tabla.

Un archivo es una **lista enlazada de clusters**: el primero se guarda en la entrada de directorio y los siguientes salen de la FAT.

```
Entrada de directorio:  nombre = "NOTAS   TXT", cluster inicial = 5, tamaño = 2500

FAT:  ...  [5] = 9   [6] = EOC   [7] = 0   [8] = 0   [9] = 6  ...

       5 ──→ 9 ──→ 6 ──→ fin
```

Los clusters no tienen por qué ser contiguos: el archivo está **fragmentado**, y la FAT es la única que sabe el orden. Tampoco tienen que estar en orden ascendente: acá el 6 va después del 9.

(Vengo de debatir: Si los clusters son listas enlazadas, o sea uno atras del otro, si pierdo el cluster 8, pierdo todos los clusters contiguos que le queda, provocando una fragmenteacion (espacio interno no usado))
### La entrada de directorio (32 bytes)

// Nuevamente, esto deberia de tener los nombres del struct que hicismo

| Offset | Tamaño | Campo                                                                    |
| ------ | ------ | ------------------------------------------------------------------------ |
| 0      | 8      | Nombre, relleno con espacios. **El primer byte es especial**             |
| 8      | 3      | Extensión                                                                |
| 11     | 1      | Atributos (`0x10` = directorio, `0x02` = oculto, `0x01` = solo lectura…) |
| 13–19  |        | Fecha y hora de creación y último acceso                                 |
| 20     | 2      | 16 bits altos del cluster inicial                                        |
| 22–25  |        | Fecha y hora de modificación                                             |
| 26     | 2      | 16 bits bajos del cluster inicial                                        |
| 28     | 4      | Tamaño en bytes (**0 para directorios**)                                 |

El primer byte del nombre:

- `0x00`: la entrada está libre **y no hay más entradas** en este directorio.
- `0xE5`: la entrada está libre porque se borró un archivo, pero **puede haber entradas válidas después**.

El tamaño en bytes hace falta porque la cadena solo dice cuántos clusters usa el archivo, no cuántos bytes del último son válidos. Un archivo de 2500 bytes usa 3 clusters (3072 bytes), y los últimos 572 no son parte del archivo.

Un cluster de 1024 bytes tiene lugar para 1024 / 32 = **32 entradas de directorio**.

(estaria bueno decir que borrar no es literal borrar, es solo marcar q es escribible y no se borra la informacion, por eso si no pisamos la dentry, podemos recueprar archivos)

---

## 3. Vida de un archivo en FAT32

### Cómo elige un cluster libre el esqueleto

`fat_table_get_next_free_cluster()` recorre la FAT **desde el cluster 2** y devuelve el primero con valor 0 (*first fit*). Un cluster liberado por un borrado vuelve a ser candidato enseguida, y si es el libre de menor número, la próxima operación que pida un cluster lo va a reutilizar.

### `mkdir /dir` y `create /dir/a.txt`

Las dos pasan por `fat_file_init()` y hacen lo mismo en el disco:

1. Buscan un cluster libre `C`.
2. Marcan `FAT[C] = EOC`: el archivo ocupa un cluster.
3. Arman la entrada de directorio con nombre, atributos, fechas, cluster inicial `C` y tamaño 0.
4. Escriben esa entrada en los clusters de datos del **directorio padre** (`fat_file_add_child_direntry()`).

Después, en memoria, se inserta el nuevo `fat_file` en el árbol (`fat_tree_insert()`).

Por ejemplo, al crear `/.audit` en una imagen vacía se toma el primer cluster libre, se marca como EOC y se agrega una entrada en el cluster raíz (el 2). Al crear `/.audit/events.bin` se repite lo mismo, pero la entrada va en el cluster de `/.audit`.

Diferencias del esqueleto con la especificación:

| Tema                  | Según FAT                                                    | En el esqueleto                                                |
| --------------------- | ------------------------------------------------------------ | -------------------------------------------------------------- |
| Archivos vacíos       | Pueden tener cluster inicial 0 y no ocupar ningún cluster    | Se les asigna uno igual                                        |
| `.` y `..`            | Están en el primer cluster del directorio nuevo              | No se escriben: `readdir` las agrega al listar                 |
| Nuevas entradas       |                                                              | Van al final: no se reutilizan los lugares con `0xE5`          |
| Directorios llenos    | Crecen como un archivo: se les encadena otro cluster         | No se implementa: solo entran las entradas de su primer cluster |

### `write`

`fat_file_pwrite()` escribe los bytes en los clusters que correspondan al offset. Si la escritura sigue después del último cluster, pide uno nuevo (`next_or_new_cluster()`):

```
Antes:   FAT[7] = EOC                          (archivo: 7)
Pide un cluster libre → 12
Después: FAT[7] = 12,  FAT[12] = EOC           (archivo: 7 → 12)
```

Al final actualiza el tamaño y la fecha de modificación de la entrada, y la reescribe en el cluster del padre.

### `unlink` y `rmdir`

`fat_fuse_unlink()` y `fat_fuse_rmdir()` llaman a `fat_file_unlink()`, que:

1. Recorre la cadena y pone cada entrada de la FAT en 0. Antes de liberar cada cluster, escribe un byte `'\0'` al principio del cluster.
2. Reemplaza el primer byte del nombre por `0xE5` y reescribe la entrada en el directorio padre.

Después se saca el archivo del árbol en memoria (`fat_tree_delete()`).

`rmdir(2)` debería fallar con `ENOTEMPTY` si el directorio tiene contenido, pero el esqueleto no lo verifica. Si se borrara un directorio con archivos, sus clusters quedarían marcados como usados sin que ninguna entrada los referencie. Normalmente no pasa, porque `rm -r` borra primero el contenido.

---

## 4. Borrado lógico vs. físico

- **Borrado físico:** se destruyen los datos, por ejemplo sobrescribiendo los clusters con ceros.
- **Borrado lógico:** solo se modifican los **metadatos**, para que el sistema de archivos deje de considerar el archivo y su espacio. Los datos quedan donde estaban.

FAT32 hace borrado lógico, porque es mucho más barato: se escriben unos pocos bytes en lugar de todos los clusters.

### Qué queda en el disco después de `rm /dir/a.txt`

Supongamos que `a.txt` ocupaba los clusters 40 → 41 y medía 1500 bytes.

```
                    ANTES                               DESPUÉS
Entrada en /dir:    "A       TXT"  inicio=40 tam=1500   0xE5 "       TXT"  inicio=40 tam=1500
FAT:                [40]=41  [41]=EOC                   [40]=0  [41]=0
Clusters 40 y 41:   contenido del archivo               contenido del archivo
                                                        (salvo el primer byte)
```

- **Se pierde:** el primer carácter del nombre y **la cadena de clusters**. Con la FAT en 0 no queda forma de saber que después del 40 venía el 41.
- **Se conserva:** el resto del nombre, la extensión, el cluster inicial, el tamaño, las fechas y casi todos los datos.

Los datos se vuelven **inalcanzables**: ya no hay ninguna entrada válida que apunte al 40.

### Cuándo se pierden de verdad los datos

Los clusters 40 y 41 ahora figuran como libres. En cuanto otra operación pida un cluster (crear un archivo, `mkdir`, agrandar un archivo con `write`), el allocator *first fit* puede elegirlos y **sobrescribirlos**.

Ver que hoy `FAT[40] = 0` **no alcanza** para saber que los datos siguen ahí: el cluster pudo ser usado por otro archivo y liberado de nuevo.

### Sin información extra, recuperar es adivinar

Una herramienta que solo mira el disco ve la entrada con `0xE5`: sabe que el archivo empezaba en el 40 y ocupaba 2 clusters, pero no cuál era el segundo. Solo puede **suponer** que eran contiguos y que nadie los sobrescribió. Si el archivo estaba fragmentado o los clusters se reutilizaron, el resultado es basura.

Para recuperar con certeza hace falta información guardada **antes** de que se pierda. Esa es la idea del sistema de auditoría.

### El byte que escribe el esqueleto

`fat_file_unlink()` escribe un `'\0'` al principio de cada cluster que libera. Lo hace para que, si ese cluster se reutiliza como directorio, la primera entrada se lea como "fin del directorio" (`0x00`) y no como basura. Para la recuperación, significa que **el primer byte de cada cluster del archivo borrado se pierde**.

---

## 5. Hablarle al sistema de archivos desde un programa de usuario

Un programa de usuario solo puede pedirle cosas al sistema de archivos mediante **llamadas a sistema**. El VFS las recibe, ve que el path pertenece a un volumen montado con FUSE y se las pasa a nuestro proceso, que ejecuta la función correspondiente de `struct fuse_operations`.

```
 programa ──syscall──→ VFS (kernel) ──→ módulo FUSE (kernel) ──→ fat-fuse (usuario)
                                                                   fat_fuse_unlink(), ...
```

`restore` no es ninguna de esas operaciones, y no podemos crear una llamada a sistema nueva porque habría que modificar el kernel. Hay dos formas de hacerle llegar el pedido.

### Opción 1: `ioctl`

`ioctl(fd, cmd, arg)` es una llamada a sistema genérica para operaciones que **no tienen una llamada a sistema propia**. Se usa mucho con dispositivos: por ejemplo, para preguntarle a una terminal su tamaño.

- `fd`: un descriptor de archivo abierto. El comando va al sistema de archivos o dispositivo de ese archivo, así que el programa tiene que abrir algo **dentro del punto de montaje**.
- `cmd`: un número que identifica el comando. Se arma con las macros `_IO`, `_IOR`, `_IOW` e `_IOWR` de `<sys/ioctl.h>`, que codifican la dirección de los datos y su **tamaño**. FUSE usa ese tamaño para saber cuántos bytes copiar entre el programa y nuestro proceso.
- `arg`: un puntero a los datos del comando.

Del lado del filesystem, FUSE llama a `fat_fuse_ioctl()`, que en el esqueleto devuelve `-ENOSYS`. Recibe el `cmd` y los datos, hace el trabajo, y su valor de retorno le llega al programa como resultado de `ioctl()`. Devolver `-ENOENT` hace que `ioctl()` retorne -1 con `errno = ENOENT`.

El soporte de `ioctl` en FUSE varía según el sistema operativo y la plataforma. Por eso existe la segunda opción.

### Opción 2: un archivo de control

El programa escribe un pedido (por ejemplo, el path a restaurar) en un archivo especial como `/.audit/.restore`. En `fat_fuse_write()` se detecta ese destino y, en lugar de guardar los bytes, se ejecuta la restauración.

Funciona en cualquier plataforma, porque solo usa `write`, pero tiene desventajas:

- Una operación que normalmente guarda datos pasa a tener otro significado según el path.
- Devolver el resultado es más indirecto: hay que codificarlo en el retorno de `write` o dejarlo en otro archivo.

---

## 6. Memoria y disco en el esqueleto

Mientras el volumen está montado, la información vive en la **imagen** y en **estructuras en memoria** de `fat-fuse`. Las operaciones FUSE consultan la memoria, pero lo único que sobrevive a desmontar es la imagen. Toda modificación tiene que hacerse **en los dos lugares**.

### Las tres capas

| Estructura  | Qué es                                                              | Cómo se sincroniza con la imagen                                                                       |
| ----------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `fat_table` | La tabla FAT, mapeada en memoria con `mmap`                         | `fat_table_set_next_cluster()` escribe en la imagen con `pwrite` **y** actualiza la memoria mapeada    |
| `fat_file`  | Un archivo o directorio: copia de su entrada, cluster inicial, posición en el padre | Las funciones de `fat_file.c` reescriben la entrada en el padre con `pwrite`             |
| `fat_tree`  | El árbol de directorios con todos los `fat_file`                    | **No existe en la imagen**: se construye al montar y se actualiza con `fat_tree_insert()` y `fat_tree_delete()` |

### `mmap` y `MAP_PRIVATE`

`mmap()` hace que una región de un archivo se vea como memoria: se accede como a un arreglo (`fat_map[N]`), y el sistema operativo carga las páginas a medida que se usan.

El esqueleto mapea la FAT con `MAP_PRIVATE`. Con esa opción, **escribir en la memoria mapeada no modifica el archivo**: los cambios quedan en una copia privada del proceso. Con `MAP_SHARED` sí llegarían. Por eso `fat_table_set_next_cluster()` hace las dos cosas:

```c
pwrite(table->fd, &next_cluster_le32, sizeof(le32), entry_offset); // imagen
((le32 *)table->fat_map)[cur_cluster] = next_cluster_le32;         // memoria
```

Si solo se modificara `fat_map`, todo funcionaría mientras el volumen está montado, pero los cambios se perderían al desmontar. **Es el error más común del laboratorio**, y solo se ve al desmontar y volver a montar.

### El árbol se lee una sola vez

Al montar, `fat_fuse_init()` lee el directorio raíz y arma el árbol. Cada directorio se lee del disco **la primera vez** que se lo recorre (`children_read`), y después se usa solo lo que está en memoria:

- Si se escribe una entrada en la imagen sin insertar el `fat_file` en el árbol, el archivo **no aparece** hasta desmontar y volver a montar.
- Si se inserta en el árbol sin escribir la entrada en la imagen, el archivo se ve mientras está montado y **desaparece** al volver a montar.

Para saber si un cambio es persistente, la pregunta es siempre: **¿alguien escribió en la imagen?**

| Función                                  | ¿Escribe en la imagen?             |
| ---------------------------------------- | ---------------------------------- |
| `fat_table_set_next_cluster()`           | Sí (entrada de la FAT)             |
| `fat_file_add_child_direntry()`          | Sí (entrada en el directorio padre) |
| `fat_file_pwrite()`                      | Sí (datos y entrada de directorio) |
| `fat_tree_insert()`, `fat_tree_delete()` | No, solo memoria                   |

---

## 7. Cómo lo implementamos (INFORME.md)

### Arquitectura

- El código de logging y de restore va en `fat_fuse_ops.c`: si las operaciones de FUSE ya están ahí, no hacía falta complejizar la lectura.
- `audit.h` tiene lo compartido entre `fat-fuse`, `audit_reader` y `restore`.
- La creación de `.audit` y de `events.bin` está en funciones separadas (`create_audit_dir`, `create_events_bin`).
- Restore usa ioctl y su lógica está separada de las llamadas estándar de FUSE.

`audit_init()` se llama en `fat_fuse_init`, después de cargar los hijos de `/`, porque hacen falta para saber si `.audit` existe. Es `void` por diseño: es un sistema forense, así que si no se puede crear el log, hace `exit(1)`.

### Bug de primer montaje

Con la imagen limpia, `ls mnt/.audit` salía vacío en el primer montaje, y en el segundo andaba bien.

`create_audit_dir` recibía `audit_node` como parámetro y le asignaba el nodo adentro. En C los parámetros son copias, así que el del llamador seguía en `NULL`:

1. `create_events_bin` recibía `audit_node = NULL`.
2. `fat_tree_insert(tree, NULL, events_file)` insertaba `events.bin` sin padre.
3. `ls` lista los hijos de `.audit` en el árbol, y no tenía ninguno.
4. En la imagen la dentry se escribía bien, porque `audit_dir` sí era correcto.

En el segundo montaje no se crea nada: se lee del disco con `fat_fuse_load_directory_children`, que inserta con el padre correcto. Es el caso de la sección 6: estaba en la imagen, pero no bien en el árbol.

**Arreglo:** `create_audit_dir` devuelve el nodo: `audit_node = create_audit_dir(...)`.

### Cambio en el código base

El `'\0'` de la sección 4 hacía que ningún archivo volviera intacto. Lo pasamos de `fat_file_unlink` a `fat_file_init`, solo para directorios nuevos, y sigue evitando que se interpreten datos viejos como entradas válidas.

### Estructura del evento

`audit_event_t` es `packed`, con una `union` que separa los datos según la operación.

| Campo            | Para qué                                         |
| ---------------- | ------------------------------------------------ |
| `event_id`       | ID secuencial, para el orden cronológico         |
| `timestamp`      | Unix timestamp de la operación                   |
| `operation_type` | `OP_WRITE`, `OP_UNLINK`, `OP_MKDIR` u `OP_RMDIR` |
| `username`       | Usuario, vía `fuse_get_context()`                |
| `filepath`       | Ruta absoluta del archivo o directorio           |

**`write_info` (para `OP_WRITE`):** `offset`, `size` y `clusters[32]`, para detectar colisiones.

**`unlink_info` (para `OP_UNLINK`, `OP_RMDIR` y `OP_MKDIR`):**

| Campo                | Para qué                                                         |
| -------------------- | ---------------------------------------------------------------- |
| `first_cluster`      | Inicio de la cadena, para reconstruir la dentry                  |
| `file_size`          | Tamaño original, para restaurarlo en la dentry                   |
| `parent_dir_cluster` | Padre, para reinsertar la entrada o detectar que ya no existe    |
| `clusters[32]`       | Cadena al momento del borrado, para verificar si fue sobrescrita |

**Tamaño:** cada evento mide 512 bytes, forzado con `_padding[512]` y `static_assert(sizeof(audit_event_t) == 512)`. Los offsets salen directo (`índice * 512`). En `fatfs.img` entran 2 eventos por cluster.

**ID secuencial:** al montar, `file_size / sizeof(audit_event_t)`. Después se incrementa la global `current_event_id`.

**Registro de `write`:** después de `fat_file_pwrite()`, en `fat_fuse_write()` se arma el evento, se recorre la cadena con `fat_table_read_cluster_value()` para llenar `clusters[32]`, y `audit_log_write()` lo agrega al final de `events.bin`.

### Por qué cada operación guarda eso

- **`write`:** para detectar si alguien pisó los clusters de un archivo borrado.
- **`mkdir`:** por lo mismo. Si hacés `rm b.txt` y `mkdir dir` toma el cluster 7 de `b.txt`, ya no se puede recuperar.
- **`unlink`:** cadena completa, porque la FAT la pierde y el archivo puede estar fragmentado (`b.txt = [8, 9, 11]`).

No guardamos la entrada completa: alcanza con nombre, primer cluster, tamaño y si es archivo o directorio. El archivo aparece con la fecha de restauración.

**Más de 32 clusters:** se loguea parcialmente. El `while` corta a los 32, y el corte se detecta porque la lista tiene menos clusters de los que indica `file_size`.

### Por qué ioctl

Descartamos el archivo de control por ser menos robusto. Como FUSE rechaza ioctl sobre directorios (`ENOTTY`), `restore.c` abre `/.audit/events.bin` dentro del punto de montaje y emite `FAT_IOCTL_RESTORE`, definido como `_IOW('f', 1, char[256])`.

### Las 5 etapas de audit_restore()

1. **Existencia previa:** si el archivo ya existe en el árbol, `-EEXIST`.
2. **Búsqueda:** recorre `events.bin` de atrás hacia adelante buscando el último evento de ese path. Si no hay, o no fue un `OP_UNLINK`, `-ENOENT`.
3. **Validación:** chequea el padre y contrasta `file_size` con los clusters guardados. Si la cadena está truncada, `-EFBIG`.
4. **Colisiones:**
    - **Por log:** si un `OP_WRITE` u `OP_MKDIR` posterior usó un cluster de la cadena, `-EBUSY`. Hace falta porque ver la FAT en 0 no alcanza (sección 4).
    - **En la FAT actual:** `fat_table_is_cluster_used()` por cada cluster, que protege de cambios no logueados. También `-EBUSY`.
5. **Reconstrucción:**
    - **FAT:** rehace los enlaces con `fat_table_set_next_cluster()` y cierra con `FAT_CLUSTER_END_OF_CHAIN_MAX`.
    - **Entrada:** crea una que apunta a `c[0]`, con su tamaño, y la escribe en el padre.
    - **Árbol:** `fat_tree_insert`, y el archivo se ve en `ls` y `cat` sin volver a montar.

| Retorno de `audit_restore()` | Significa                                      |
| ---------------------------- | ---------------------------------------------- |
| `0`                          | Restaurado en su ubicación original            |
| `1`                          | El padre ya no existe: restaurado en `/`       |
| `-EEXIST`                    | Ya existe un archivo con ese nombre            |
| `-ENOENT`                    | Nunca fue borrado o no figura en los registros |
| `-EFBIG`                     | Cadena truncada                                |
| `-EBUSY`                     | Colisión                                       |

### Casos borde y limitaciones

Lo que no se puede resolver termina en un error específico, no en un fallo en silencio.

- **Ya no existe el padre:** si fue eliminado o reutilizado, el archivo va a `/` y se retorna `1`.
- **Nunca fue borrado o no está en los registros:** `-ENOENT`.
- **Mismo nombre:** `-EEXIST`, también si ya existe `/nombre` al restaurar en la raíz.
- **Borrado varias veces:** se restaura el más reciente.
- **Persistencia:** cada evento se escribe en la imagen en el momento, y `audit_init` carga lo que ya existe.

**Limitaciones:**
- Solo se recuperan archivos, no directorios.
- Más de 32 clusters no se recupera.
- El log puede pisar archivos borrados: `events.bin` crece y toma clusters libres sin generar eventos.
- `touch` no se loguea (no hay `OP_MKNOD`).
- Las fechas originales se pierden.

### Punto estrella: visualizador web

Express sobre Node.js, y una web estática.

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
yes C | head -c 3000 > mnt/c.txt     # archivo de 3 clusters
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

## Qué leer

**OSTEP cap. 39, *Files and Directories*** ([PDF](https://pages.cs.wisc.edu/~remzi/OSTEP/file-intro.pdf)):
- La sección sobre `mmap`, y cómo está implementada en el laboratorio
- *Files And Directories*
- *Reading And Writing, But Not Sequentially*
- *Removing Files*
- *Making And Mounting A File System*

**OSTEP cap. 40, *File System Implementation*** ([PDF](https://pages.cs.wisc.edu/~remzi/OSTEP/file-implementation.pdf)). Usa un sistema de ejemplo (vsfs) basado en *inodes*. No hace falta aprender sus detalles: hay que buscar las partes que tiene todo sistema de archivos y cómo se corresponden con FAT32.
- *The Way To Think*
- *Overall Organization*
- *File Organization: The Inode*: la idea de estructura con metadatos, y el recuadro sobre listas enlazadas, que es justamente FAT
- *Directory Organization*
- *Free Space Management*
- *Access Paths: Reading and Writing*

**De consulta:**
- Wikipedia, *Design of the FAT file system*, solo FAT32: *Boot Sector*, *File Allocation Table* y *Directory table*.
- Man pages: `unlink(2)`, `rmdir(2)`, `mkdir(2)`, `ioctl(2)`, `mmap(2)`, `pwrite(2)`.
- libfuse, `struct fuse_operations`: `unlink`, `rmdir`, `mkdir`, `write` e `ioctl`.
- Comentarios de `fat_table.h`, `fat_file.h`, `fat_fs_tree.h` y `audit.h`.

---

## Glosario que necesito saber

- **Sistema de archivos:** forma de organizar los bloques del disco para ofrecer archivos y directorios.
- **Sector:** unidad física del disco, de 512 bytes en nuestras imágenes.
- **Cluster:** grupo de sectores consecutivos, la unidad de asignación. En `fatfs.img`, 1024 bytes.
- **Sector de boot:** parámetros del volumen. Es lo primero que se lee al montar.
- **FAT:** arreglo con una entrada de 4 bytes por cluster. Registra el espacio libre y encadena los clusters.
- **EOC:** *end of chain*, valor que marca el último cluster de un archivo.
- **Entrada de directorio:** 32 bytes con nombre, atributos, fechas, cluster inicial y tamaño.
- **Fragmentación:** clusters de un archivo que no son contiguos.
- **Fragmentación interna:** lo que queda sin usar en el último cluster.
- **First fit:** elegir el primer cluster libre, buscando desde el 2.
- **Inalcanzable:** bloque al que no lleva ningún camino desde la raíz.
- **Borrado lógico:** modificar solo los metadatos. Los datos quedan.
- **Borrado físico:** destruir los datos.
- **`0xE5`:** entrada libre por un borrado. Puede haber entradas válidas después.
- **`0x00`:** entrada libre, y no hay más en el directorio.
- **`ioctl`:** syscall genérica para operaciones sin syscall propia.
- **Archivo de control:** archivo especial cuya escritura dispara una operación.
- **`mmap`:** hacer que una región de un archivo se vea como memoria.
- **`MAP_PRIVATE`:** los cambios en la memoria mapeada no llegan al archivo.
- **`fat_tree`:** árbol de directorios en memoria. No existe en la imagen.
- **`children_read`:** indica si un directorio ya se leyó del disco.
