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

Un sistema de archivos simplemente es una Lookup Table para tener rastro de donde estan los archivos ubicados en el disco.

> [!warning] Revisar
> La que funciona como tabla de búsqueda es la **FAT**. El sistema de archivos es más que eso: también tiene el sector de boot, las entradas de directorio y los datos (las 4 partes de la tabla de arriba).

En FAT32 la tabla FAT cumple **dos roles**: registra el espacio libre e indica en qué orden se encadenan los clusters de cada archivo.

Dos ideas que valen para cualquier sistema de archivos:

- **Un directorio también es un archivo.** Su contenido es la lista de entradas (nombre -> metadatos) de lo que contiene, y se guarda en bloques de datos.
- **Para llegar a un archivo hay que recorrer el camino desde la raíz.** Para abrir `/docs/notas.txt` se lee la información del volumen para encontrar la raíz, se busca `docs` en la raíz, se lee ese directorio, se busca `notas.txt` y con sus metadatos se llega a los datos. Un bloque al que no lleva ningún camino es **inalcanzable**, aunque tenga datos.

##### **La FAT no guarda nombres ni fechas; es una tabla de asignación y seguimiento**

// Tabla fat32
![[Pasted image 20261106234716.png]]
![[Pasted image 20261108093821.png]]

Aun que las tablas se hacian gigantes, y no se podia leer una tabla y daba dramas
#### ¿Que es un Dentry (data entry)? 

Un data entry, es la informacion de un archivo:
- Nombre y extensión (formato 8.3, ej. `1984 TXT`).
- Atributos (archivo regular, directorio, solo lectura, oculto).
- Fechas y horas (creación, último acceso, última modificación).
- **Tamaño exacto en bytes** (`file_size`).
- **Primer cluster:** El número de cluster donde empiezan los datos (`start_cluster_low` y `start_cluster_high`).
**No contiene la informacion interna del archivo***.

> [!warning] Revisar
> - *Dentry* viene de *directory entry* (entrada de directorio), no de *data entry*.
> - En el código, el campo alto se llama `fat32_start_cluster_high`, no `start_cluster_high`.

Cuando se "Borra" un archivo en `fat32`, en realidad se marca el archivo como "Pisable", perdiendo rastro de donde están los clusters. Un archivo es recuperable si no se pisaron todos los clusters y si la informacion (esos clusters), nunca se pisaron.

> [!warning] Revisar
> - No se pierde todo el rastro: la entrada borrada **conserva el primer cluster** y el tamaño. Lo que se pierde es la cadena (la FAT queda en 0).
> - Para recuperarlo **intacto**, no tiene que estar pisado ninguno de sus clusters. Si se pisaron algunos, los que quedan se pueden recuperar **parcialmente**, pero el archivo vuelve con huecos o datos ajenos en esos clusters. Nuestro `restore` no lo hace: ante cualquier colisión devuelve `-EBUSY`.

- Si el primer byte del nombre es `0xE5`, indica que el archivo fue borrado (`FILE_FOR_DELETE`), pero que la entrada puede reutilizarse si se crea otro archivo.
- Si el primer byte es `0x00`, marca el final del directorio (no hay más entradas válidas después).

> [!warning] Revisar
> - La constante se llama `FILE_FOR_DELETION` (`fat_file.h`).
> - Según la especificación de FAT la entrada se puede reutilizar, pero **el esqueleto no lo hace**: las entradas nuevas siempre van al final.


---

## 2. FAT32 en una página

### Sectores y clusters

- **Sector/Numero de cluster:** la unidad física del disco. En nuestras imágenes mide 512 bytes.
- **Cluster:** Un cluster en este lab son 512 bytes. Un cluster por asi decirlo, es como una "medida de almacenamiento", almacena bytes (Informacion) con una asignacion de numero de cluster. 
Ejemplo 
![[Pasted image 20261106234638.png]]
(El verde). Es un cluster 2, y tiene `FF FF FF 0F` como informacion. 

> [!warning] Revisar
> - **Sector y número de cluster no son lo mismo.** El sector es la unidad física (512 B). El número de cluster es el índice que identifica a un cluster.
> - **Depende de la imagen.** En `resources/fatfs.img` (y en `disk.img`, que es su copia) un cluster son 2 sectores = **1024 bytes**. En `resources/test_empty.img` es 1 sector = **512 bytes**. Lo dice el campo *sectores por cluster* del sector de boot.
> - `FF FF FF 0F` no es la información del cluster 2: es su **entrada en la FAT** (bytes `0x08`–`0x0B` de la tabla). En little endian es `0x0FFFFFFF` = EOC, o sea que el cluster 2 es el último de su cadena. Sus datos (las dentries de la raíz) están en el área de datos.

Si el archivo no llena su último cluster, el resto queda desperdiciado (**fragmentación interna**). Con clusters más grandes la FAT tiene menos entradas, pero los archivos chicos desperdician más espacio.

Un cluster, como tamaño minimo puede tener 512bytes.
Un cluster, como tamaño maximo puede tener 32kb.

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
![[Pasted image 20261108094943.png|325]]

> [!warning] Revisar
> Esta imagen es la jerarquía de directorios de Linux, no las regiones del volumen. Encaja mejor en la sección 1, donde dice que los directorios forman un árbol.
### Campos del sector de boot

No hace falta aprender los offsets, solo que estos campos existen.

| **BPB Field Name** | **Description**         | **Value**      |
| ------------------ | ----------------------- | -------------- |
| `BPB_BytsPerSec`   | Bytes per sector        | 512            |
| `BPB_SecPerClus`   | Sectors per cluster     | 2 (1024 bytes) |
| `BPB_RsvdSecCnt`   | Reserved sector count   | 32             |
| `BPB_NumFATs`      | Number of FATs          | 2              |
| `BPB_FATSz32`      | Sectors per FAT (FAT32) | 1016           |
| `BPB_RootClus`     | Root directory cluster  | 2              |
Todos los números están en *little endian*.

Se diseño que FAT sea little endian por rapidez, almacenamiento directo, y simplicidad de diseño en el hadrware. 

> [!warning] Revisar
> La razón de fondo es que FAT nació para PCs con CPU x86, que es little endian: guardar los números en el mismo orden que usa la CPU evita convertirlos. Por eso en el código aparecen los tipos `le16` y `le32`.
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

> [!info] Respuesta: qué es cada cosa
> La imagen es un solo archivo, y cada cuenta dice **en qué byte de ese archivo** empieza algo. Con `fatfs.img`:
>
> ```
> byte 0          16 384                536 576               1 056 768
> │               │                     │                     │
> ▼               ▼                     ▼                     ▼
> ┌───────────────┬─────────────────────┬─────────────────────┬──────────────┬──────────────┬────
> │ Reservada     │ FAT #1              │ FAT #2 (copia)      │ cluster 2    │ cluster 3    │ ...
> │ 32 sectores   │ 1016 sectores       │ 1016 sectores       │ 1024 B       │ 1024 B       │
> └───────────────┴─────────────────────┴─────────────────────┴──────────────┴──────────────┴────
>                 │ FAT[0] FAT[1] FAT[2] ...                  │
>                 │ 4 B    4 B    4 B                         │
> ```
>
> - `sectores_reservados × bytes_por_sector` = cuántos bytes ocupa la región reservada. Ahí termina y **empieza la FAT**.
> - Después vienen las 2 copias de la FAT, de 1016 sectores cada una. Sumando todo lo anterior se llega a **donde empieza el área de datos**.
> - **Entrada FAT del cluster N:** cada entrada mide 4 bytes, así que la del cluster N está N × 4 bytes después del inicio de la FAT.
> - **Datos del cluster N:** el área de datos arranca con el cluster 2, así que el cluster N está N − 2 clusters más adelante.

Se resta 2 porque las entradas 0 y 1 de la FAT están reservadas: **el primer cluster de datos es el 2**.

Con `fatfs.img`:

- `inicio_FAT` = 32 × 512 = 16 384
- `inicio_área_datos` = (32 + 2 × 1016) × 512 = 1 056 768
- La entrada FAT del cluster 100 está en el byte 16 384 + 400 = 16 784.
- Los datos del cluster 100 empiezan en el byte 1 056 768 + 98 × 1024 = 1 157 120.

En el código, estas cuentas las hacen `fat_table_cluster_offset()` y `fat_table_set_next_cluster()`.

y si quiero ir al cluster 2, seria 2 x 512? no entiendo, dame ejemplos?!

> [!info] Respuesta: ejemplos con `fatfs.img`
> No es 2 × 512, porque hay que saltar la región reservada y las 2 FATs, y porque el cluster mide 1024 B. Cada cluster tiene **dos** direcciones distintas: su casillero en la FAT y sus datos.
>
> | Cluster | Su entrada en la FAT      | Sus datos                                   |
> | ------- | ------------------------- | ------------------------------------------- |
> | 2       | 16 384 + 2 × 4 = 16 392   | 1 056 768 + 0 × 1024 = 1 056 768            |
> | 3       | 16 384 + 3 × 4 = 16 396   | 1 056 768 + 1 × 1024 = 1 057 792            |
> | 10      | 16 384 + 10 × 4 = 16 424  | 1 056 768 + 8 × 1024 = 1 064 960            |
>
> Por ejemplo, para leer el contenido de la raíz (cluster 2) vas al byte 1 056 768. Para saber qué cluster le sigue, mirás los 4 bytes del byte 16 392.
### La tabla FAT

Es un arreglo con una entrada de 4 bytes por cluster. La entrada `N` dice qué pasa con el cluster `N`:

| Valor de `FAT[N]`           | Significado                                         |
| --------------------------- | --------------------------------------------------- |
| `0x00000000`                | Cluster libre                                       |
| `2` … `0x0FFFFFEF`          | Cluster usado: el valor es el **siguiente** cluster |
| `0x0FFFFFF7`                | Cluster dañado (*bad cluster*)                      |
| `0x0FFFFFF8` … `0x0FFFFFFF` | Último cluster del archivo (*end of chain*, EOC)    |
|                             |                                                     |

// La info nunca tiene esos valores hexa? O la info se guarda en otro lugar de valor del cluster

> [!info] Respuesta
> La información se guarda en otro lugar. La FAT solo guarda **punteros**: "después de este cluster viene tal otro", o una marca de libre, dañado o fin. Esos valores especiales solo tienen sentido dentro de la FAT.
>
> El contenido del archivo está en el **área de datos**, en la dirección del cluster (ver las cuentas). Ahí puede haber cualquier byte, incluso `FF FF FF 0F`, y no significa nada especial.

Los valores tienen 28 bits útiles, y los 4 altos están reservados. Por eso `0xFFFFFFFF` no es uno de los valores especiales de la tabla.

Un archivo es una **lista enlazada de clusters**: el primero se guarda en la entrada de directorio y los siguientes salen de la FAT.

// muy mal representado
```
Entrada de directorio:  nombre = "NOTAS   TXT", cluster inicial = 5, tamaño = 2500

FAT:  ...  [5] = 9   [6] = EOC   [7] = 0   [8] = 0   [9] = 6  ...

       5 ──→ 9 ──→ 6 ──→ fin
```

> [!info] Otra forma de verlo
> ```
> Entrada de directorio:  NOTAS.TXT   inicio = 5   tamaño = 2500
>                                        │
>                ┌───────────────────────┘
>                ▼
> FAT:       FAT[5] = 9 ──────► FAT[9] = 6 ──────► FAT[6] = EOC
>                │                  │                  │
>                ▼                  ▼                  ▼
> Datos:     cluster 5          cluster 9          cluster 6
>            bytes 0–1023       bytes 1024–2047    bytes 2048–2499
>                                                  (+ 572 B sin usar)
> ```
> - La fila **FAT** es el mapa: cada casillero dice cuál sigue.
> - La fila **Datos** es donde está el contenido, en el orden en que se lee el archivo.

Los clusters no tienen por qué ser contiguos: el archivo está **fragmentado**, y la FAT es la única que sabe el orden. Tampoco tienen que estar en orden ascendente: acá el 6 va después del 9.

(Vengo de debatir: Si los clusters son listas enlazadas, o sea uno atras del otro, si pierdo el cluster 8, pierdo todos los clusters contiguos que le queda, provocando una fragmenteacion (espacio interno no usado))

> [!warning] Revisar
> - La idea de la cadena está bien: si se pierde el **enlace** de un cluster en la FAT, se pierden todos los que vienen **después en la cadena**. No son "los contiguos": pueden estar en cualquier lugar del disco.
> - Eso no es fragmentación. Los clusters quedan **inalcanzables** (sección 1).
> - La fragmentación interna es otra cosa: el espacio sin usar dentro del último cluster.
### La entrada de directorio (32 bytes) DENTRY.

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

// igual, lo veo y no se si seria ideal ver una tabla. creo que es mejor decir "mira, fat tiene estos campos y significan esto"

> [!info] Los campos, con los nombres de `struct fat_dir_entry_s` (`fat_file.h`)
> - `base_name[8]`: el nombre, relleno con espacios. Su primer byte marca si la entrada está borrada (`0xE5`) o si se terminó el directorio (`0x00`).
> - `extension[3]`: la extensión, por ejemplo `TXT`.
> - `attribs`: qué es: directorio, oculto, solo lectura.
> - `create_time`, `create_date`, `last_access_date`: cuándo se creó y se usó por última vez.
> - `fat32_start_cluster_high` y `start_cluster_low`: el primer cluster, partido en dos mitades de 16 bits. Juntas dan el número de 32 bits que la entrada de directorio pasa a la FAT.
> - `last_modified_time`, `last_modified_date`: cuándo se modificó.
> - `file_size`: cuántos bytes válidos tiene el archivo (0 en un directorio).
>
> En memoria, `fat_file` ya guarda el primer cluster armado, en `start_cluster`.

El primer byte del nombre:

- `0x00`: la entrada está libre **y no hay más entradas** en este directorio.
- `0xE5`: la entrada está libre porque se borró un archivo, pero **puede haber entradas válidas después**.

El tamaño en bytes hace falta porque la cadena solo dice cuántos clusters usa el archivo, no cuántos bytes del último son válidos. Un archivo de 2500 bytes usa 3 clusters (3072 bytes), y los últimos 572 no son parte del archivo.

Un cluster de 1024 bytes tiene lugar para 1024 / 32 = **32 entradas de directorio**.

Ademas, como los clusters son listas enlazadas, con el primer cluster alcanza para buscar el resto.

Es facil de saber si un archivo se corrompio, por que podemos seguir los clusters, y el dentry guarda cuanto pesaba el archivo originalmente. 

> [!warning] Revisar
> Con eso solo se detecta que la **cantidad** de clusters no coincide. No se puede saber si el **contenido** de un cluster fue pisado. Por ejemplo, después de un borrado la cadena ya no existe, y ver un cluster en 0 no prueba que sus datos sigan ahí (sección 4).
$$\text{Clusters esperados} = \left\lceil \frac{\text{file\_size}}{\text{tamaño\_cluster}} \right\rceil$$
Dato: si en algun momento llenaste tu disco, y lo seguiste usando siempre, siempre estas pisando archivos. siempre. 

> [!warning] Revisar
> Lo que se pisa son clusters de archivos **borrados**, no archivos vigentes: el sistema nunca le da a un archivo nuevo un cluster que esté en uso. Con el disco lleno, cada cluster nuevo sale de uno liberado, así que los borrados se vuelven irrecuperables más rápido.

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

Esto pasa cuando se crea un nuevo archivo o directorio.

> [!warning] Revisar
> No: pasa cuando una **escritura se pasa del último cluster** del archivo, o sea cuando el archivo crece. Al **crearse**, un archivo o directorio recibe su primer cluster en `fat_file_init()` (ver `mkdir` y `create` arriba).

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

**O sea: desvicula del FAT y marca 0xE5 para poder ser pisable**

Después se saca el archivo del árbol en memoria (`fat_tree_delete()`).

`rmdir(2)` debería fallar con `ENOTEMPTY` si el directorio tiene contenido, pero el esqueleto no lo verifica. Si se borrara un directorio con archivos, sus clusters quedarían marcados como usados sin que ninguna entrada los referencie. Normalmente no pasa, porque `rm -r` borra primero el contenido.

---

## 4. Borrado lógico vs. físico

- **Borrado físico:** se destruyen los datos, por ejemplo sobrescribiendo los clusters con ceros.
- **Borrado lógico:** solo se modifican los **metadatos**, para que el sistema de archivos deje de considerar el archivo y su espacio. Los datos quedan donde estaban.

FAT32 hace borrado lógico, porque es mucho más barato: se escriben unos pocos bytes en lugar de todos los clusters.

// esto medio q lo psue, no se si borrarlo
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

Literal es un mapa; si pise algo de info en algun cluster, se pierde el mapa

> [!warning] Revisar
> Son dos pérdidas distintas:
> - **El mapa (la cadena)** se pierde con el borrado mismo, porque la FAT queda en 0, aunque nadie pise nada.
> - **Los datos** se pierden cuando otro archivo pisa un cluster.
>
> Por eso el log tiene que guardar el mapa **antes** del borrado.

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

// No dice que significa cada uno.

> [!info] Respuesta: las 4 macros
> La dirección se mira desde el programa de usuario:
>
> | Macro                       | Datos que viajan                                 | Ejemplo                                   |
> | --------------------------- | ------------------------------------------------ | ----------------------------------------- |
> | `_IO(tipo, nr)`             | Ninguno: es solo una orden                       | `_IO('F', 0)`                             |
> | `_IOR(tipo, nr, T)`         | Del filesystem al programa (el programa **lee**) | `_IOR('F', 42, enum status)`: pedir un estado |
> | `_IOW(tipo, nr, T)`         | Del programa al filesystem (el programa **escribe**) | `_IOW('f', 1, char[256])`: mandar un path |
> | `_IOWR(tipo, nr, T)`        | En los dos sentidos                              | Mandar un pedido y recibir una respuesta  |
>
> - `tipo` (*magic*) identifica al driver o subsistema.
> - `nr` diferencia los comandos propios.
> - `T` es el tipo del dato: de ahí sale el **tamaño** que FUSE copia.
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

`mmap()` hace que una región de un archivo se vea como memoria: se accede como a un arreglo (`fat_map[N]`), y el sistema operativo carga las páginas a medida que se usan. Mapea memoria y el hace un acceso mas rápido.

```c
uint32_t siguiente = table->fat_map[cluster_actual];
```

> [!warning] Revisar
> Así no compila tal cual: `fat_map` es un puntero genérico y los valores están en little endian. En el código se castea a `le32 *` y se convierte, y para no hacerlo a mano está `fat_table_read_cluster_value(table, cluster_actual)`.

Luego, cuando la memoria mapea, hay que elegir como la escritura se comporta:
- **Si usara `MAP_SHARED`:**
    - La memoria y el archivo en disco están sincronizados en ambos sentidos.
    - Si hacés `table->fat_map[3] = 4;`, el kernel marca esa página como "sucia" (_dirty_) y tarde o temprano la vuelca automáticamente al archivo `disk.img` en el disco.
        
- **El esqueleto usa `MAP_PRIVATE` (Copy-On-Write):**
    - La memoria mapeada se considera **privada del proceso**.
    - Si modificás `table->fat_map[3] = 4;`, el sistema operativo crea una copia privada de esa página en la memoria RAM solo para tu programa.
    - **Ese cambio NUNCA viaja al archivo `disk.img`** en el disco.

El esqueleto mapea la FAT con `MAP_PRIVATE`. Con esa opción, **escribir en la memoria mapeada no modifica el archivo**: los cambios quedan en una copia privada del proceso. Con `MAP_SHARED` sí llegarían. Por eso `fat_table_set_next_cluster()` hace las dos cosas:

```c
// 1. Escritura física en la imagen (PERSISTENCIA)
pwrite(table->fd, &next_cluster_le32, sizeof(le32), entry_offset);

// 2. Escritura en la memoria mapeada (CONSISTENCIA EN RUNTIME)
((le32 *)table->fat_map)[cur_cluster] = next_cluster_le32;        // memoria
```

Si solo se modificara `fat_map`, todo funcionaría mientras el volumen está montado, pero los cambios se perderían al desmontar. **Es el error más común del laboratorio**, y solo se ve al desmontar y volver a montar.

// esto no lo entiendo, profundizar despues.
### El árbol se lee una sola vez

Al montar, `fat_fuse_init()` lee el directorio raíz y arma el árbol. Cada directorio se lee del disco **la primera vez** que se lo recorre (`children_read`), y después se usa solo lo que está en memoria:

- Si se escribe una entrada en la imagen sin insertar el `fat_file` en el árbol, el archivo **no aparece** hasta desmontar y volver a montar.
- Si se inserta en el árbol sin escribir la entrada en la imagen, el archivo se ve mientras está montado y **desaparece** al volver a montar.

> [!info] Respuesta: qué significa
> Leer el disco es lento, así que `fat-fuse` no lee todo al montar. Lee **un directorio recién cuando alguien entra en él**:
>
> 1. Al montar, solo lee la raíz y arma el árbol con sus hijos.
> 2. La primera vez que hacés `ls mnt/dir`, `dir` tiene `children_read = 0`. Entonces lee sus dentries del disco, crea un `fat_file` por cada una, las mete en el árbol y pone `children_read = 1`.
> 3. Las siguientes veces ve `children_read = 1` y **ya no mira el disco**: usa el árbol.
>
> De ahí salen los dos casos de arriba:
> - Si escribís una dentry en el disco de un directorio que ya se leyó, nadie la vuelve a leer, y `ls` no la muestra hasta volver a montar.
> - Si solo la ponés en el árbol, se ve ahora, pero al volver a montar se lee del disco y no está.
![[Pasted image 20261108111329.png|532]]
Para saber si un cambio es persistente, la pregunta es siempre: **¿alguien escribió en la imagen?**

| Función                                  | ¿Escribe en la imagen?              |
| ---------------------------------------- | ----------------------------------- |
| `fat_table_set_next_cluster()`           | Sí (entrada de la FAT)              |
| `fat_file_add_child_direntry()`          | Sí (entrada en el directorio padre) |
| `fat_file_pwrite()`                      | Sí (datos y entrada de directorio)  |
| `fat_tree_insert()`, `fat_tree_delete()` | No, solo memoria                    |
- **`fat_tree_search(vol->file_tree, parent_path)`**
    - **Qué hace:** Recorre el árbol en memoria buscando el nodo padre correspondiente a la ruta donde se alojará el nuevo archivo (por ejemplo, `"/"` o `"/dir1"`). Retorna el puntero al `fat_file` del directorio contenedor.
    - **Qué pasa si no se llama:** No tenés la referencia en memoria del directorio contenedor. No podés determinar a qué carpeta agregar el nuevo archivo ni obtener sus metadatos (como su cluster de inicio) para ubicar dónde registrarlo.
        
- **`fat_file_init(vol, parent, &dentry, filepath)`**
    - **Qué hace:** Reserva e inicializa la estructura `fat_file` en el heap. Asocia el volumen, el directorio padre, la ruta completa (`filepath`), y carga los datos de la entrada de directorio: tamaño (`file_size`), cluster inicial (`start_cluster`) y el flag de tipo (`is_dir`).
    - **Qué pasa si no se llama:** No existe la estructura `fat_file` en la memoria RAM del proceso. Al no existir el objeto representativo del archivo, ningún componente de FUSE puede interactuar con él en tiempo de ejecución.
        
- **`fat_tree_insert(vol->file_tree, new_file)`**
    - **Qué hace:** Inserta el nuevo `fat_file` en la estructura de búsqueda global del sistema de archivos (el árbol binario indexado por ruta absoluta).
    - **Qué pasa si no se llama:** Las operaciones directas que buscan el archivo por su ruta completa (como `open("/archivo.txt")`, `read`, `write`, `getattr` o `stat`) fallan con error de archivo inexistente (`-ENOENT`), ya que el lookup del filesystem no lo encuentra en el índice de rutas en memoria.
        
- **`fat_file_add_child(parent, new_file)`**
    - **Qué hace:** Vincula el puntero `new_file` dentro de la lista enlazada de hijos del directorio padre (`parent->children`).
    - **Qué pasa si no se llama:** El archivo **no aparece al listar el directorio** (`ls`, `readdir`). Aunque el archivo esté insertado en la tabla de búsqueda global y se pueda abrir si se conoce el nombre exacto, el directorio padre no sabe que lo contiene entre sus entradas hijas y `readdir` lo saltea por completo (el clásico error donde el archivo existe internamente pero `ls` muestra el directorio vacío).

> [!warning] Revisar: estas firmas no son las del esqueleto
> - **`fat_tree_search(tree, path)`:** está bien.
> - **`fat_file_init`:** es `fat_file_init(fat_table table, bool is_dir, char *filepath)`. No recibe el padre ni una dentry: busca un cluster libre, lo marca EOC y **arma la dentry ella misma** (sección 3).
> - **`fat_tree_insert`:** es `fat_tree_insert(fat_tree tree, fat_tree_node parent, fat_file file)`, y devuelve el árbol. Recibe el **nodo padre**: el árbol (`hierarchy_tree`) guarda ahí quién es hijo de quién.
> - **`fat_file_add_child(parent, new_file)`:** no existe. No hay una lista `parent->children` aparte: los hijos de un directorio salen del árbol, con `fat_tree_flatten_h_children()`.
>
> El síntoma "se encuentra por path pero `ls` muestra el directorio vacío" es real, pero lo causa pasarle **mal el padre** a `fat_tree_insert`. Es justo nuestro bug de primer montaje (sección 9). Y ninguna de estas funciones escribe la entrada en la imagen: eso lo hace `fat_file_add_child_direntry()`.


---

## 7. VFS y FUSE (clase 1)

### VFS

El **VFS** (*Virtual File System*) es la capa del kernel que da **la misma interfaz** (`open`, `read`, `write`, `unlink`…) para cualquier sistema de archivos. Los programas no saben si el archivo está en ext4, en FAT o en red: llaman siempre a las mismas syscalls, y el VFS se las pasa al sistema de archivos al que pertenece ese path.

### FUSE

**FUSE** (*Filesystem in Userspace*) permite que ese sistema de archivos sea un **programa común**, en espacio de usuario, en lugar de código del kernel. Un módulo FUSE del kernel recibe el pedido del VFS y se lo reenvía a nuestro proceso (`fat-fuse`), que responde (el diagrama está en la sección 5).

Nuestro programa le dice a FUSE qué hacer completando `struct fuse_operations` con punteros a funciones. Las que importan para el lab:

| Operación | Firma (libfuse)                                                    | Qué hace                     | En el esqueleto     |
| --------- | ------------------------------------------------------------------ | ---------------------------- | ------------------- |
| `write`   | `int (*write)(const char *path, const char *buf, size_t size, off_t offset, struct fuse_file_info *fi)` | Escribir `size` bytes en `offset`. Devuelve los bytes escritos | `fat_fuse_write()` |
| `unlink`  | `int (*unlink)(const char *path)`                                  | Borrar un archivo            | `fat_fuse_unlink()` |
| `mkdir`   | `int (*mkdir)(const char *path, mode_t mode)`                      | Crear un directorio          | `fat_fuse_mkdir()`  |
| `rmdir`   | `int (*rmdir)(const char *path)`                                   | Borrar un directorio         | `fat_fuse_rmdir()`  |
| `ioctl`   | `int (*ioctl)(const char *path, int cmd, void *arg, struct fuse_file_info *fi, unsigned int flags, void *data)` | Comando especial (sección 5) | `fat_fuse_ioctl()` |

- Todas reciben el **path** relativo al punto de montaje, no un número de inodo.
- Si fallan devuelven un error **negativo** (`-ENOENT`, `-EISDIR`…). Al programa le llega como `-1` con ese `errno`.

### Las tres capas del código (clase 2)

| Capa        | Qué abstrae                                    | Header          |
| ----------- | ---------------------------------------------- | --------------- |
| `fat_table` | La tabla FAT: leer y escribir el siguiente cluster, buscar uno libre | `fat_table.h`   |
| `fat_file`  | Un archivo o directorio: su dentry, leer y escribir datos | `fat_file.h`    |
| `fat_tree`  | El árbol de directorios en memoria             | `fat_fs_tree.h` |

Las funciones de `fat_fuse_ops.c` son las de alto nivel: usan estas tres capas. Cómo se mantienen iguales en memoria y en la imagen está en la sección 6.

---

## 8. Lo que pide la consigna

La guía pide leer estas partes del enunciado del lab.

### Conceptos que van a aprender

| Concepto | Dónde está en estas notas |
| -------- | ------------------------- |
| Operaciones de alto nivel (syscalls) vs cambios de bajo nivel (escrituras al disco) | Abajo |
| VFS como capa de abstracción | Sección 7 |
| Estructuras de un sistema de archivos: sector de boot, tablas de archivos, sector de datos | Secciones 1 y 2 |
| Mapeo de memoria | Sección 6 (`mmap`) |
| Borrado lógico vs físico | Sección 4 |
| Serialización de estructuras en formato binario | Abajo |
| Detección de conflictos de recursos (clusters) | Sección 9 |

**Alto nivel vs bajo nivel.** Una sola syscall puede terminar en varias escrituras al disco. Por ejemplo, un `echo hola > mnt/a.txt` sobre un archivo nuevo hace:
1. `mknod` → `fat_file_init()`: marca un cluster como EOC en la FAT y escribe la dentry en el padre.
2. `write` → `fat_file_pwrite()`: escribe los datos en el cluster y reescribe la dentry con el tamaño nuevo.

**Serialización binaria.** Es guardar una estructura de C **tal cual está en memoria**, como bytes crudos, en lugar de texto. Por eso `cat events.bin` muestra basura y hace falta `audit_reader`, que lee los bytes con la misma `struct`.

### Parte 2: consideraciones sobre el tamaño de la estructura

- **Todos los eventos miden lo mismo**, igual que las dentries de 32 bytes. Así el evento `k` está en el byte `k × tamaño`, sin recorrer el archivo.
- **No conviene que sean grandes:** el log vive en la misma imagen, y cada evento consume espacio de clusters. Si cada uno ocupa varios clusters, el filesystem se llena rápido.
- **El arreglo de clusters limita lo recuperable:** con `cluster_chain[32]` solo se guarda la cadena de archivos de hasta 32 clusters. En `fatfs.img` son 32 × 1024 B = **32 KB**. El enunciado dice 16 KB porque supone clusters de 512 B.
- **Tareas:** calcular `sizeof(audit_event_t)` y justificar el tamaño elegido.

### Parte 4: qué información guardar

Las preguntas del enunciado, con su respuesta:

- **¿Solo el primer cluster o la cadena completa?** La cadena completa. Después del borrado la FAT queda en 0 (sección 4), y con el primer cluster solo se podría adivinar que eran contiguos.
- **¿Hace falta la dentry completa? ¿Para qué?** Para rearmar la entrada hacen falta el nombre, el primer cluster, el tamaño y si es directorio. Las fechas no son imprescindibles.
- **¿Cómo se manejan los archivos fragmentados?** Igual que los contiguos: guardando la lista de clusters en orden.
- **¿Y si el archivo supera el límite del arreglo?** Hay que elegir y documentar: no loguearlo, loguear solo los primeros clusters (recuperación parcial), o resolver archivos grandes (punto estrella).

### Parte 5: el problema

Al hacer `rm file.txt`, el filesystem marca la dentry con `0xE5`, pone sus clusters en `0` en la FAT, y **no** sobrescribe los datos (salvo el byte de la sección 4).

Sin otra fuente de información hay dos problemas:
1. Solo se podría asumir que los clusters eran contiguos (100 → 101 → 102…), y falla si el archivo estaba fragmentado.
2. Entre el borrado y la recuperación, otra operación pudo sobrescribir esos clusters, y el archivo volvería inconsistente.

Con un registro de las operaciones se obtienen **la cadena exacta** y **si hubo corrupción**.

### Parte 5: el comando restore

```
./restore /mnt/fuse /dir1/file.txt
```

No se pueden crear syscalls nuevas, así que se usa `ioctl` (recomendada) o un archivo de control (sección 5). Elegir es parte del lab, y conviene que primero funcione el comando y después el algoritmo.

### Parte 5: el algoritmo de recuperación

1. Buscar en los logs el registro del borrado original.
2. Extraer sus datos relevantes.
3. Verificar si los clusters fueron modificados **después** del borrado.
4. Si no hay conflictos, reconstruir el archivo.

Está poco definido a propósito: hay muchas soluciones, y se evalúa distinguir un buen diseño de uno malo. Más información en el log da mejor recuperación, pero hace al sistema más lento y ocupa más espacio.

Casos borde que hay que pensar:
- El log se vuelve demasiado grande.
- Qué hacer con el log al desmontar.
- Ya no existe el directorio padre.
- Ya hay otro archivo con el mismo nombre.
- El archivo nunca fue borrado o no está en el log.

Se puede elegir no resolver alguno, pero hay que **avisarle al usuario y no fallar en silencio**.

---

## 9. Nuestra implementación, a nivel técnico

Cómo está resuelto en el código del repo (`fat_fuse_ops.c`, `audit.h`, `restore.c`).

### 9.1 El log: crearlo y cargarlo

`fat_fuse_init()` lee la raíz y después llama a `audit_init()`:

```
audit_init()
 ├─ ¿/.audit en el árbol?
 │    ├─ no → create_audit_dir():  fat_file_init(table, true, "/.audit")     cluster nuevo, FAT = EOC
 │    │                            fat_tree_insert(tree, root_node, ...)       memoria
 │    │                            fat_file_add_child_direntry(root, ...)      imagen
 │    └─ sí → fat_fuse_load_directory_children()   lee sus dentries del disco
 └─ ¿/.audit/events.bin en el árbol?
      └─ no → create_events_bin(): lo mismo, con .audit como padre
```

- Crear hace las dos escrituras de la sección 6: el árbol (memoria) y la dentry (imagen). Si faltara una, `.audit` desaparecería al volver a montar o no se vería hasta remontar.
- Como `.audit` ya leyó sus hijos, `events.bin` se encuentra en el árbol al buscarlo.
- Si no se puede crear, `exit(1)`: un sistema forense sin log no tiene sentido.

**El bug de primer montaje** es un caso de esa sincronización. `create_audit_dir` recibía `audit_node` por parámetro, y en C los parámetros se copian: el del llamador seguía en `NULL`. Entonces `events.bin` entraba al árbol con padre `NULL`. En la imagen estaba bien, pero en el árbol no era hijo de `.audit`, y `ls` (que lista los hijos en el árbol) lo mostraba vacío. Al volver a montar, se leía del disco con el padre correcto. Se arregló devolviendo el nodo.

**El próximo ID** se calcula después de `audit_init`, como `file_size(events.bin) / sizeof(audit_event_t)`, y se guarda en la global `current_event_id`. Como el log es solo de agregar al final, eso da la cantidad de eventos.

### 9.2 El evento

```c
typedef union __attribute__((packed)) {
    struct __attribute__((packed)) {
        uint64_t event_id;
        uint64_t timestamp;
        uint32_t operation_type;     // OP_WRITE, OP_UNLINK, OP_MKDIR, OP_RMDIR
        char username[64];
        char filepath[256];
        union {
            struct { uint64_t offset, size; uint32_t clusters[32]; } write_info;
            struct { uint32_t first_cluster, file_size, parent_dir_cluster;
                     uint32_t clusters[32]; } unlink_info;
        };
    } data;
    uint8_t _padding[512];
} audit_event_t;
```

- **Union externa con `_padding[512]`:** una union mide lo que su miembro más grande, así que el evento mide 512 B aunque los datos ocupen menos. `static_assert(sizeof(audit_event_t) == 512)` hace que no compile si alguien se pasa.
- **`packed`:** sin huecos de alineación, para que el formato en el disco sea exactamente esos bytes en `fat-fuse`, `audit_reader` y `restore` (los tres incluyen `audit.h`).
- **Union interna:** un evento es una sola operación, así que `write_info` y `unlink_info` comparten el espacio.
- **En `fatfs.img` entran 2 eventos por cluster.**
- **`first_cluster` no se usa:** el primer cluster es siempre `clusters[0]`.

### 9.3 Dónde se registra cada operación

| Operación | Función FUSE        | Cuándo se loguea                          | Qué guarda                                                        |
| --------- | ------------------- | ----------------------------------------- | ----------------------------------------------------------------- |
| `write`   | `fat_fuse_write`    | **Después** de `fat_file_pwrite`          | `offset`, `size` y la cadena **completa** del archivo (hasta 32), ya con los clusters nuevos |
| `mkdir`   | `fat_fuse_mkdir`    | Después de `fat_file_init`                | `clusters[0]` = cluster del directorio nuevo, y el del padre      |
| `unlink`  | `fat_fuse_unlink`   | **Antes** de `fat_file_unlink`            | La cadena, `file_size` y el cluster del padre                     |
| `rmdir`   | `fat_fuse_rmdir`    | **Antes** de `fat_file_unlink`            | Lo mismo                                                          |

El orden importa:
- En `unlink` y `rmdir` hay que leer la cadena **antes** de liberar los clusters, porque `fat_file_unlink` deja la FAT en 0.
- En `write`, hay que hacerlo **después**, para incluir los clusters que se acaban de pedir.

En los cuatro, la cadena se recorre con `fat_table_read_cluster_value()` desde `start_cluster` hasta un valor ≥ `0x0FFFFFF8` (EOC) o 32 clusters.

El usuario sale de `fuse_get_context()->uid`, que es quien hizo la operación, y se traduce a nombre con `getpwuid()`. Si no se encuentra, se guarda el número.

**`mknod` no se loguea.** Un `touch` toma un cluster (`fat_file_init` le da uno aunque esté vacío) sin dejar evento.

### 9.4 Escribir el evento: `audit_log_write`

1. Busca `events.bin` y `.audit` en el árbol.
2. Usa como offset el tamaño actual del archivo, así el evento va al final.
3. Llama a `fat_file_pwrite()`, que escribe los datos en la imagen, pide clusters si hace falta y actualiza el tamaño en la dentry.

Escribe con `fat_file_pwrite` directo, **no** con `fat_fuse_write`, así que escribir en el log no genera otro evento. Por lo mismo, cuando `events.bin` crece toma clusters libres (*first fit*) **sin dejar registro**: puede pisar un archivo borrado. Esa colisión solo la detecta el chequeo de la FAT de 9.6.

### 9.5 Cómo llega el pedido de restore

```
restore mnt /a.txt
  │  open("mnt/.audit/events.bin")            fd dentro del punto de montaje
  │  char path[256] = "/a.txt"
  │  ioctl(fd, FAT_IOCTL_RESTORE, path)        _IOW('f', 1, char[256])
  ▼
kernel → FUSE: como el comando es _IOW de 256 bytes, copia 256 bytes al proceso
  ▼
fat_fuse_ioctl(path, cmd, arg, fi, flags, data)
  │  cmd == FAT_IOCTL_RESTORE → audit_restore((char *)data)
  ▼
return 0, 1 o -errno → ioctl() devuelve eso → restore imprime el mensaje
```

- Se abre `events.bin` porque el `fd` tiene que ser de un archivo dentro del montaje, y FUSE no acepta ioctl sobre directorios (`ENOTTY`).
- Como `_IOW` codifica el tamaño, FUSE sabe cuántos bytes copiar. Por eso `restore.c` llena con ceros un `char[256]` completo.
- Los comandos que no reconoce devuelven `-ENOTTY`.

### 9.6 `audit_restore()` paso a paso

**0. Cargar el camino:** `fat_fuse_load_path()` lee los directorios intermedios. Por `children_read` (sección 6), un directorio que nadie abrió todavía no tiene sus hijos en el árbol.

**1. ¿Ya existe?** Si el path está en el árbol, `-EEXIST`.

**2. Buscar el borrado:** `audit_find_last_unlink()` lee `events.bin` desde el último evento hacia atrás, de a 512 B (`fat_file_pread` en `i × 512`). El **primer** evento con ese path decide:
- Si es `OP_UNLINK`, ese es el borrado, y se guarda su índice.
- Si es otra cosa (por ejemplo, un `write` posterior), `-ENOENT`.
- Si no hay ninguno, `-ENOENT`.

Así se restaura el borrado más reciente.

**3. Validar.**
- **Padre:** se busca el directorio del path. Tiene que existir, ser directorio y tener `start_cluster == parent_dir_cluster`. Si el padre se borró y se creó otro con el mismo nombre, tiene otro cluster y no pasa. En ese caso se restaura en `/`, y si ya existe `/nombre`, `-EEXIST`.
- **Cadena completa:** se cuentan los clusters guardados (hasta el primer 0) y se comparan con `fat_table_get_clusters_for_size(file_size)`. Si hay menos, la cadena se cortó en 32, y es `-EFBIG`.

**4. Colisiones** (`audit_check_collisions`):
- **En el log**, desde el evento siguiente al borrado hasta el final:
    - `OP_WRITE`: si alguno de sus `clusters` está en la cadena, `-EBUSY`.
    - `OP_MKDIR`: si su `clusters[0]` está en la cadena, `-EBUSY`.
- **En la FAT actual:** si `fat_table_is_cluster_used()` da verdadero para alguno, `-EBUSY`. Cubre lo que el log no ve: `touch` y el crecimiento de `events.bin`.

Hacen falta los dos chequeos: la FAT en 0 no prueba que nadie lo usó y lo liberó (sección 4), y el log no ve lo que no se loguea.

**5. Reconstruir**, en la imagen **y** en memoria (sección 6):

| Paso | Función | Dónde |
| ---- | ------- | ----- |
| Rehacer la cadena `c[0] → c[1] → … → EOC` | `fat_table_set_next_cluster()` | `pwrite` en la imagen + memoria mapeada |
| Armar la dentry con `c[0]` y `file_size` | `fat_file_init_direntry()` | Memoria |
| Leer los hijos del padre si hacía falta, para que `nentries` sea el real | `fat_fuse_load_directory_children()` | Memoria |
| Crear el `fat_file`, con `pos_in_parent = nentries` | `init_file_from_dentry()` | Memoria |
| Escribir la dentry en el cluster del padre | `fat_file_add_child_direntry()` | Imagen |
| Insertarlo en el árbol bajo el padre | `fat_tree_insert()` | Memoria |

Devuelve `0` si quedó en su lugar, o `1` si quedó en `/`.

| Retorno   | Causa                                       |
| --------- | ------------------------------------------- |
| `0`       | Restaurado en su ubicación                  |
| `1`       | El padre ya no estaba: restaurado en `/`    |
| `-EEXIST` | Ya existe ese nombre                        |
| `-ENOENT` | No hay un borrado como último evento        |
| `-EFBIG`  | Cadena cortada en 32 clusters               |
| `-EBUSY`  | Colisión en el log o en la FAT              |
| `-EIO`, `-ENOMEM` | Fallo al leer el log o al reservar memoria |

### 9.7 El cambio al esqueleto

El esqueleto escribía un `'\0'` al principio de cada cluster en `fat_file_unlink` (sección 4), y el archivo recuperado perdía un byte por cluster. Lo movimos a `fat_file_init`, y solo para directorios nuevos. Se sigue cumpliendo el objetivo (un directorio que reusa un cluster ve `0x00` = fin del directorio), sin tocar los datos de los archivos borrados.

### 9.8 Limitaciones, a nivel técnico

| Limitación | Por qué pasa |
| ---------- | ------------ |
| Solo se recuperan archivos | El borrado de un directorio es `OP_RMDIR`, y la búsqueda solo acepta `OP_UNLINK`: da `-ENOENT` |
| Más de 32 clusters (32 KB) no se recupera | La cadena se guarda cortada, y el chequeo da `-EFBIG` |
| Colisión no detectada en archivos grandes | Un `write` solo guarda 32 clusters. Si pisa uno más allá y después se libera, ni el log ni la FAT lo ven |
| `touch` no deja evento | No hay `OP_MKNOD`. Solo lo detecta la FAT mientras siga en uso |
| `events.bin` puede pisar archivos borrados | Crece con `fat_file_pwrite` sin generar eventos |
| Se pierden las fechas | La dentry se arma nueva, con la fecha de restauración |

### 9.9 Punto estrella: visualizador web

Un servidor Express (Node.js) y una web estática:
- `GET /api/events` ejecuta `audit_reader --json`, que serializa los eventos a JSON con el mismo `audit.h`.
- `POST /api/restore` ejecuta `./restore <montaje> <path>` con `execFile` y vuelve a leer los eventos.
- El server lanza `fat-fuse -f` y captura su salida para mostrar los `DEBUG`.

### 9.10 Tests del restore

```bash
cp resources/fatfs.img disk.img
./fat-fuse -f disk.img mnt

# Restore exitoso: 3000 B = 3 clusters de 1024 B
yes C | head -c 3000 > mnt/c.txt
md5sum mnt/c.txt
rm mnt/c.txt
./restore mnt /c.txt                 # "Restaurado exitosamente..."
md5sum mnt/c.txt                     # mismo hash: datos intactos

# Restore con conflicto: mkdir toma por first fit el cluster liberado
echo hola > mnt/b.txt
rm mnt/b.txt
mkdir mnt/dir
./restore mnt /b.txt                 # "Device or resource busy" (-EBUSY)
./tools/audit_reader -v mnt/.audit/events.bin
```

---

## 10. Lecturas de la guía

### OSTEP cap. 39: *Files and Directories*

- **Files and Directories:** las dos abstracciones. Un **archivo** es un arreglo de bytes con un nombre de bajo nivel (en Unix, su número de *inode*). Un **directorio** es un archivo que guarda pares (nombre legible, nombre de bajo nivel). En FAT no hay número de inode: la dentry tiene los metadatos directamente.
- **Reading and Writing, But Not Sequentially:** cada archivo abierto tiene un **offset** actual, que `read`/`write` avanzan y `lseek` mueve. `pread`/`pwrite` reciben el offset como parámetro y no lo modifican. El lab usa esa idea: `fat_fuse_write` recibe `offset`, y `fat_file_pwrite`/`fat_file_pread` escriben y leen en posiciones explícitas (así se lee el evento `i` en `i × 512`).
- **mmap:** mapea un archivo en el espacio de direcciones del proceso, para usarlo como memoria. En el lab se mapea la FAT con `MAP_PRIVATE`, y por eso hay que hacer `pwrite` además (sección 6).
- **Removing Files:** `rm` usa `unlink()`, porque borrar es sacar el **enlace** entre un nombre y el archivo. En Unix el archivo se libera cuando ya no le quedan enlaces. En FAT no hay contador de enlaces ni hard links: `unlink` marca `0xE5` y libera la cadena.
- **Making and Mounting a File System:** `mkfs` escribe un sistema de archivos vacío en un disco o imagen, y `mount` lo cuelga de un directorio del árbol (el punto de montaje). En el lab, `fatfs.img` ya viene formateada, y `./fat-fuse disk.img mnt` la monta en `mnt`.

### OSTEP cap. 40: *File System Implementation*

No hace falta aprender vsfs: sirve para ver qué tiene **todo** sistema de archivos y cómo se corresponde con FAT32.

- **The Way To Think:** un sistema de archivos son **estructuras de datos** en el disco más **métodos de acceso** (qué se lee y escribe en cada syscall).
- **Overall Organization:**

| vsfs (OSTEP)                     | FAT32                                         |
| -------------------------------- | --------------------------------------------- |
| Bloques                          | Clusters                                      |
| Superbloque                      | Sector de boot                                |
| Tabla de inodes (metadatos)      | Dentries, dentro de los directorios           |
| Bitmaps de espacio libre         | Entradas en 0 en la FAT                       |
| Región de datos                  | Área de datos                                 |

- **File Organization: The Inode:** el inode guarda los metadatos y punteros a los bloques. El recuadro sobre **listas enlazadas** cuenta la alternativa: guardar solo el primer bloque, y que cada bloque diga cuál sigue. Así el acceso aleatorio es lento (hay que recorrer la lista), y la solución es sacar los "siguiente" a una tabla en memoria. **Esa tabla es la FAT.**
- **Directory Organization:** un directorio es un archivo especial con pares (nombre, referencia). En FAT, la referencia es el primer cluster, y la entrada lleva todos los metadatos.
- **Free Space Management:** vsfs usa bitmaps para saber qué está libre. FAT usa la misma tabla: `FAT[N] = 0` es libre, y el esqueleto elige *first fit*.
- **Access Paths:**
    - **Abrir** `/foo/bar`: se parte de la raíz y se lee directorio por directorio hasta la entrada de `bar`. En FAT: sector de boot → cluster raíz → dentry de `foo` → su cluster → dentry de `bar`.
    - **Leer:** se lee la entrada para saber dónde están los datos, y después los bloques. En FAT se sigue la cadena.
    - **Crear y escribir:** hay que tocar el registro de espacio libre, los datos y los metadatos. En FAT es la FAT, el cluster de datos y la dentry en el padre (sección 3).

### De consulta

- **Wikipedia, *Design of the FAT file system* (solo FAT32):** *Boot Sector*, *File Allocation Table* y *Directory table* son lo de la sección 2.
- **Man pages:**

| Página      | Qué dice                                                                          |
| ----------- | --------------------------------------------------------------------------------- |
| `unlink(2)` | Borra un nombre del sistema de archivos. Si era el último enlace, se libera el archivo |
| `rmdir(2)`  | Borra un directorio, que tiene que estar vacío (si no, `ENOTEMPTY`)               |
| `mkdir(2)`  | Crea un directorio                                                                |
| `ioctl(2)`  | Manda un comando especial a un dispositivo o archivo abierto                      |
| `mmap(2)`   | Mapea un archivo en memoria. `MAP_SHARED` lleva los cambios al archivo, `MAP_PRIVATE` no |
| `pwrite(2)` | Escribe en un offset dado sin mover el offset del archivo                         |

- **libfuse, `struct fuse_operations`:** está en la sección 7.
- **Comentarios del esqueleto:** `fat_table.h` (la FAT), `fat_file.h` (dentries y archivos), `fat_fs_tree.h` (el árbol) y `audit.h` (el evento).

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
- **VFS:** capa del kernel que da la misma interfaz para cualquier sistema de archivos.
- **FUSE:** mecanismo para que un sistema de archivos sea un programa de usuario.
- **`struct fuse_operations`:** punteros a las funciones que FUSE llama por cada operación.
- **Dentry:** *directory entry*, la entrada de directorio de 32 bytes.
- **Offset:** posición dentro de un archivo desde donde se lee o escribe.
- **Montar:** colgar un sistema de archivos de un directorio del árbol (el punto de montaje).
- **Serialización binaria:** guardar una estructura tal cual está en memoria, como bytes crudos.
- **`packed`:** atributo para que el compilador no agregue relleno entre campos.
- **`_IO`/`_IOR`/`_IOW`/`_IOWR`:** macros que arman un comando de `ioctl` con su dirección y tamaño.
- **`events.bin`:** el log binario de eventos, en `/.audit/`.
- **Colisión:** un uso posterior al borrado de alguno de los clusters del archivo.
- **Inode:** estructura de metadatos de un archivo en sistemas tipo Unix. FAT no tiene: usa la dentry.
