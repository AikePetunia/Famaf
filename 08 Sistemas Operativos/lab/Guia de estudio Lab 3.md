# 1. Material de estudio

## Fuentes principales

1. **La consigna del laboratorio**, en especial:
   - *Conceptos que van a aprender* (introducción)
   - Parte 2: *Consideraciones sobre el tamaño de la estructura*
   - Parte 4: qué información guardar para recuperar un archivo
   - Parte 5: *El problema*, *Comando restore* y *Algoritmo de recuperación*
2. **Lo visto en las clases del laboratorio** (sus apuntes):
   - Clase 1: sistemas de archivos, VFS, FUSE
   - Clase 2: niveles de abstracción del código (`fat_file`, `fat_tree`, `fat_table`)
   - Clase 3: estructura de FAT32 (boot sector, FAT, área de datos), clusters vs. sectores
   - Clase 4: tabla FAT, cadenas de clusters, valores especiales, fragmentación
   - Clase 5: borrado lógico vs. físico, `0xE5`, `ioctl`
   - Clase 6: algoritmo de recuperación y detección de conflictos
3. **OSTEP – *Operating Systems: Three Easy Pieces*** (https://pages.cs.wisc.edu/~remzi/OSTEP/)
   - **Cap. 39 – *Interlude: Files and Directories*** ([PDF](https://pages.cs.wisc.edu/~remzi/OSTEP/file-intro.pdf)). Prestar atención a:
     - La sección sobre `mmap`, y cómo está implementada en el laboratorio.
     - *Files And Directories* (las dos abstracciones)
     - *Reading And Writing, But Not Sequentially* (lo que hablamos del offset)
     - *Removing Files*
     - *Making And Mounting A File System*
   - **Cap. 40 – *File System Implementation*** ([PDF](https://pages.cs.wisc.edu/~remzi/OSTEP/file-implementation.pdf)). El capítulo usa un sistema de archivos de ejemplo (vsfs) basado en *inodes*. **No hace falta aprender los detalles de vsfs**: léanlo buscando las partes que tiene *todo* sistema de archivos y cómo se corresponden con FAT32.
     - *The Way To Think*: estructuras de datos y métodos de acceso
     - *Overall Organization*: bloques, región de datos, metadatos, registro de espacio libre, superbloque
     - *File Organization: The Inode*: leer la idea de "estructura que guarda los metadatos de un archivo" y el recuadro sobre enfoques basados en listas enlazadas, que es justamente FAT
     - *Directory Organization*: un directorio es un archivo especial que contiene pares (nombre, referencia)
     - *Free Space Management*
     - *Access Paths: Reading and Writing*: qué estructuras se leen y escriben para abrir, leer y crear un archivo

## Fuentes de consulta

4. **Wikipedia – *Design of the FAT file system*** (https://en.wikipedia.org/wiki/Design_of_the_FAT_file_system). Solo FAT32, sin VFAT ni nombres largos:
   - *Boot Sector* (campos del BPB de FAT32, en particular el cluster del directorio raíz)
   - *File Allocation Table* (valores especiales de las entradas)
   - *Directory table* (formato de la entrada de 32 bytes, significado de `0x00` y `0xE5`)
5. **Páginas de manual** (`man 2 <nombre>` o https://man7.org): `unlink(2)`, `rmdir(2)`, `mkdir(2)`, `ioctl(2)`, `mmap(2)`, `pwrite(2)`.
6. **Documentación de libfuse**: `struct fuse_operations` (https://libfuse.github.io/doxygen/structfuse__operations.html), en particular `unlink`, `rmdir`, `mkdir`, `write` e `ioctl`.
7. **El código del esqueleto**: los comentarios de `fat_table.h`, `fat_file.h`, `fat_fs_tree.h` y `audit.h`.

## Apunte de la cátedra

El archivo **[SO26] Apunte Lab3.md** tiene seis secciones:

1. Anatomía común de un sistema de archivos: información del volumen, metadatos, espacio libre y datos
2. FAT32 en una página: del número de cluster al byte en la imagen
3. Vida de un archivo en FAT32: `mkdir`, `create`, `write`, `unlink`, `rmdir` a nivel de clusters y entradas de directorio
4. Borrado lógico vs. físico: qué queda en el disco después de un `unlink`
5. Hablarle al sistema de archivos desde un programa de usuario: `ioctl` vs. archivos de control
6. Memoria y disco en el esqueleto: `mmap`, `pwrite` y la consistencia con `fat_tree`
