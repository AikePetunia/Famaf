
## Ej 1

```c
int main(int argc, char** argv)
{
    int fd = open("test.txt", O_CREAT | O_WRONLY, S_IRUSR);
    for (int i = 0; i < argc; ++i) {
        close(i);
        fd = dup(fd);
        write(1, "a", 1);
    }
}
```

#### pre-eliminar

Cuando arranca un programa en unix, ya se ocupa: 

- **`0`**: Entrada estándar (`stdin`):
Donde el programa lee datos por defecto (Pipes, teclado y redirecciones). Input. 
Si se cierra con `close()`, si el programa intenta leer datos usando `scanf()`, `getchar()`, `gets()`, `read(0, ...)` manual, la operación **fallará de inmediato** o interpretará un **EOF **, devolviendo `0` bytes leídos y error `-1`. 

- **`1`**: Salida estándar (`stdout`)
Donde el programa imprime A LA PANTALLA ! como `printf()`, `puts()`, `write(1,...)`.  Escritura.
Si se intenta escribir con `printf` o `write(1, ...)`, **fallará y devolverá un error** (generalmente `-1`), porque el descriptor `1` ya no apunta a ningún destino válido en la consola.

> El descriptor `1` (`stdout`) y el descriptor `2` (`stderr`) son **completamente independientes** en la tabla de archivos del kernel. Comparten el que si el programa no emite errores por `stderr`, la ejecución continúa silenciosamente hasta que se intente usar.

- **`2`**: Error estándar (`stderr`)
Para imprimir errores o warnings (Separado de out, cerrar `out` no rompe la impresion de `err`).
En caso de error, el reportarlo usando `perror()`, `fprintf(stderr, ...)` o un `write(2, ...)`, **el error se perderá como `in` y `out`**

Siempre falla con `-1` en error.

Cerrarlos no es el fin, es posible re-abrirlos con:

```c
close(0);
int fd = open("test.txt", O_RDONLY); // Abierto SOLO para lectura (recuperamos stdin)
```
---
#### argc, argv: 

`argc`: Argument Count. Cuenta cuantos argumentos hay. `./a.out (el primero)`

`argv`: Argument Vector, donde `argv[0]` es `./a.out` y `argv[1]` es el siguiente argumento.

¿Por que es un parametro? por que si fuese otro comando, estaria:
- separado por otra linea 
- usaria alguno de: `;, &&, ||, &`

Tenemos que hacer hasta la 6ta iteracion (por el cuadro de abajo)

 ---- 
#### fd 
Ahora, el `fd`:

El file descriptor ocupa un `id`, devuelto por la llamada de `open()`, sus flags ahora mismo son:

`O_CREATE`: Crea el archivo si este no existe 
`O_WRONLY`: Escribe en este archivo (No lee lo que hay)

`S_IRUSR` es una constante simbólica POSIX (habitualmente `0400` en octal) (es simplemente para que lo pueda leer el usuario creador del file descriptor, Si llega otro usuario, no puede leerlo)

Devolvería `3` de id o `-1` si da un error. 

 ---- 
#### close 
El `for` tiene `i<argc`, y comando siempre hay 1. Por lo tanto, siempre entra. 

```c
int close(int fd);
```

`close()`: Cierra un `fd` 
- Retorna **`0`** si salió todo bien.
- Retorna **`-1`** si hubo un error (por ejemplo, si pasás un descriptor que ya está cerrado o que no es válido).

--- 
#### dup 

Crea un nuevo descriptor de archivo que sea un duplicado exacto de otro descriptor existente, con el FD más bajo posible.

```c
int nuevo_fd = dup(int oldfd);
```

En este caso: Como cerramos el fd 0 (`close(0)`), el dup elije el `fd 0`

---
#### write 

```c
ssize_t write(int fd, const void *buf, size_t count);
```

- **`int fd` (File Descriptor):** El número de descriptor donde querés escribir (por ejemplo, `1` para la salida estándar o el entero que te devolvió `open`).
- **`const void *buf` (Búfer):** Un puntero al espacio de memoria donde tenés guardados los datos que querés escribir (por ejemplo, una cadena de texto como `"a"` o un arreglo de bytes).
- **`size_t count` (Cantidad):** La cantidad exacta de **bytes** que querés leer del búfer y escribir en el archivo. (Por eso en el código del parcial veíamos `write(1, "a", 1)`, que significa: _"escribí `1` byte desde el búfer `"a"` en el descriptor `1`"_).

--- 
#### Respuesta (sabiendo q la tabla tiene 7 ./a.out ):

Pre eliminar:
Abro el fd 3. 

Primera vez: 
close 0. (Cerro in)
dup: fd 3->0 que se cerro (Libre, `test.txt` está en el fd 0).
write: Escribe "a" en el fd 1.

Segunda vez: 
close 1. (Cerro out, libre fd 1)
dup: fd 0->1 ("duplica" 0 a 1, `test.txt` está en el fd 0,1)
write: Escribe "a" en el fd 1 (en `test.txt`, pues está en fd 1.)

Tercera vez:
close 2. (Cerró errores, libre 2)
dup: fd 1->2 ("duplica" 1 a 2, `test.txt` está en el fd 0,1,2.)
write: Escribe "a" en el fd 1. (en `test.txt`, pues está en fd 1.)

Cuarta vez:
close 3. (Cerró 3, libre 3)
dup: fd 2->3 ("duplica" 2 a 3, `test.txt` está en el fd 0,1,2,3)
write: Escribe "a" en el fd 1. (en `test.txt`, pues está en fd 1.)

Quinta vez:
close 4. (Cerró 4, libre 4)
dup: fd 3->4 ("Redirige" 3 a 4, `test.txt` está en el fd 0,1,2,3,4)
write: Escribe "a" en el fd 1. (en `test.txt`, pues está en fd 1.)

y así

| # de ./a.out | # de `a` en consola | # de `a` en `test.txt` | Explicacion                                                                                                                  |
| ------------ | ------------------- | ---------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| 0            | 1                   | 0                      | Escribe en el fd de stdout, no en el fd de test.txt                                                                          |
| 1            | 1                   | 1                      | Escribe en el fd 1, que 1 es el FD de test.txt. De aca, no se cierra más close(1), por lo tanto solo se acumula output en 1. |
| 2            | 1                   | 2                      | Sigue escribiendo en fd 1, y en fd 1 está `test.txt` por que nunca se cerro el fd 1.                                         |
| 3            | 1                   | 3                      | Sigue escribiendo en fd 1, y en fd 1 está `test.txt` por que nunca se cerro el fd 1.                                         |
| 4            | 1                   | 4                      | Sigue escribiendo en fd 1, y en fd 1 está `test.txt` por que nunca se cerro el fd 1.                                         |
| 5            | 1                   | 5                      | Sigue escribiendo en fd 1, y en fd 1 está `test.txt` por que nunca se cerro el fd 1.                                         |
| 6            | 1                   | 6                      | Sigue escribiendo en fd 1, y en fd 1 está `test.txt` por que nunca se cerro el fd 1.                                         |

> Más detalles sobre Ejercicio 1.:

```c
int open(const char *pathname, int flags, ... /* mode_t mode */);
```

#### Parámetro 1: `pathname` (Ruta)

Es una cadena de caracteres (`char*`) que especifica la ruta o el nombre del archivo que se desea abrir o crear.

- **Ejemplos:** `"test.txt"`, `"/tmp/salida.log"`, `"datos.bin"`
    
#### Parámetro 2: `flags` (Modales y Opciones)

Indican el propósito con el que se abre el archivo y cómo debe comportarse el kernel. Se pueden combinar múltiples flags usando el operador bitwise OR (`|`). Se dividen en:

- **Modos de acceso (es obligatorio incluir exactamente uno de estos tres):**
    - `O_RDONLY`: Abre el archivo **solo para lectura**.
    - `O_WRONLY`: Abre el archivo **solo para escritura**.
    - `O_RDWR`: Abre el archivo para **lectura y escritura**.
- **Flags de creación y modificación (opcionales):**
    - `O_CREAT`: **Crea el archivo** si este no existe previamente. _(Si se usa este flag, se vuelve obligatorio proveer el tercer parámetro `mode`)_.
    - `O_TRUNC`: Si el archivo ya existe y se abrió en modo escritura, **trunca su tamaño a 0 bytes** (borra todo el contenido anterior).
    - `O_APPEND`: Hace que cualquier operación de escritura agregue los datos **al final del archivo** automáticamente, en lugar de sobrescribir desde el principio.
    - `O_EXCL`: Se usa junto con `O_CREAT`. Si el archivo ya existe, la llamada `open()` **falla y retorna -1**, garantizando que el proceso sea el creador exclusivo.
#### Parámetro 3: `mode` (Permisos, opcional)

Este parámetro solo se especifica si en el segundo argumento (`flags`) se incluyó `O_CREAT`. Define los permisos iniciales de acceso para el archivo creado (afectados por la máscara `umask` del proceso).

- **Macros comunes para el propietario (_User_):**
USER: (es simplemente para que lo pueda leer el usuario creador del file descriptor. Si llega otro usuario, no puede leerlo..)
    - `S_IRUSR`: Permiso de lectura. 
    - `S_IWUSR`: Permiso de escritura. ()
    - `S_IXUSR`: Permiso de ejecución.
    - `S_IRWXU`: Atajo para lectura, escritura y ejecución del propietario (`S_IRUSR | S_IWUSR | S_IXUSR`).
Si fuera para un grupo de usuarios, sería GRP.

---
## Ej 2

Secuencia de fotos en un heap de 4KiB = 4096 bytes. Solo una operacion ocurre entre fotos del heap, complete el que corresponde, tache la otra. Se usa la estructura de datos de OSTEP, CAP 17 "Free Space Managment". 
En el `malloc` debe dar el parametro de entrada y el valor del puntero de entrada. Escribir todo en decimal. La base del header es la direccion virtual `16KiB`, o sea en **Foto 0** head = 16384. 

#### 📸 Foto 0 (Estado Inicial)
El heap está completamente libre. Hay un solo bloque gigante apuntado por `head`.
- **Bloque Libre 1:**
    - Dirección: `16384`
    - `size`: `4084` (4096 - 12 bytes del header)
    - `magic`: `1234547`
    - `next`: `NULL` (fin de la lista de libres)
#### 📸 Foto 1 (Después de la 1era operación)
- **Estado en la Foto 1:**
    - **Bloque Ocupado (`ptr1`):** Dirección `16384`, `size = 112`, `magic = 1234547`.
    - **Bloque Libre Restante:** Dirección `16496` (`16384 + 112`), `size = 3972`, `magic = 1234547`, `next = NULL`.
    - _Head ahora apunta al nuevo bloque libre en `16496`._
#### 📸 Foto 2 (Después de la 2da operación)
- **Estado en la Foto 2:**
    - **Bloque Ocupado 1 (`ptr1`):** `16384` (size: 112)
    - **Bloque Ocupado 2 (`ptr2`):** `16496` (size: 208)
    - **Bloque Libre Restante:** Dirección `16704` (`16496 + 208`), `size = 3764`, `magic = 1234547`, `next = NULL`.
#### 📸 Foto 3 (Después de la 3er operación)
- **Estado en la Foto 3:**
    - El bloque de la dirección `16384` vuelve a la lista de libres. Dependiendo de si la política pone los libres al principio o al final de la lista de libres (`head`):
    - **Bloque Libre (el viejo `ptr1`):** Dirección `16384`, `size = 112`, `magic = 1234547`, `next` apunta al bloque libre grande de `16704`.
    - **Bloque Ocupado (`ptr2`):** `16496` (size: 208)
    - **Bloque Libre Grande:** `16704` (size: 3764), `next = NULL`.
    - _Head ahora apunta al inicio de la lista libre (`16384`)._
#### 📸 Foto 4 (Después de la 4ta operación)
- **Estado en la Foto 4:**
    - **Bloque Ocupado (`ptr3`):** Dirección `16384`, `size = 64`.
    - **Pequeño Bloque Libre sobrante:** Dirección `16448` (`16384 + 64`), `size = 48`, `next` apunta al bloque de `16704`.
    - **Bloque Ocupado (`ptr2`):** `16496` (size: 208)
    - **Bloque Libre Grande:** `16704` (size: 3764).

#### 📸 Foto 5 (Después de la 5ta operación)
- **Estado en la Foto 5:**
    - Ahora hay tres bloques libres fragmentados (o dos si hubo coalescencia inmediata con el sobrante de 48). Supongamos coalescencia si son contiguos:
    - El bloque libre de `16448` (size 48) se une con el liberado `16496` (size 208).
    - **Bloque Libre Unido:** Dirección `16448`, `size = 256`, `next` apuntando al resto.

#### 📸 Foto 6 (Estado Final / 6ta operación)
- **Estado en la Foto 6:**
    - Como se liberaron todos los mallocs, el heap vuelve a unificarse por completo en un único bloque libre gigante.
    - Dirección: `16384`, `size = 4084`, `magic = 1234547`, `next = NULL`.

**Siempre se hace un malloc o un free**
$$\text{Header (12 bytes)} + \text{Datos útiles (100 bytes)} = 112\text{ bytes en total}.$$
Cuando hago malloc, siempre hay un size y magic. Suma head.
Cuando hay free, siempre hay un size, magic y next. Nunca suma head.

| **Transición / Evento** | **Operación malloc**                  | **Operación free**                                        |
| ----------------------- | ------------------------------------- | --------------------------------------------------------- |
| **Entre 0 y 1**         | `16384 + 12 = malloc( 100 )` (16496)  | `free( ____________ )`                                    |
| **Entre 1 y 2**         | `16496 + 12 = malloc( 200 )` (16708)  | `free( ____________ )`                                    |
| **Entre 2 y 3**         | ` 16708 + 12 = malloc( 100 )` (16820) | `free( ____________ )`                                    |
| **Entre 3 y 4**         | `_____________ = malloc( _________ )` | `free( 16496)` (El head apunta al bloque creado en 16496) |
| **Entre 4 y 5**         | `_____________ = malloc( _________ )` | `free( 16708 )` (mismo)                                   |
| **Entre 5 y 6**         | `16384 + 12 = malloc( 200 )`          | `free( ____________ )`                                    |

--- 
### Diagrama de Gantt (Round Robin $Q=3$, 3 Núcleos)

![[Pasted image 20261123133320.png]]
Fundamentacion:
El scheduler, solamente da turnos para el **CPU***.

Por ejemplo:
En A, cpu ocupa 1 quantum, y luego hace TODO In. Finalmente, se pone en cola de ready en el tiempo 7.
El cpu estaba libre, entonces mientras se hacia ese in, en el 4, ocupo el cpu B por 2 quantums. Luego hace los 3 ins que le correspondia, cuando termina, pasa a ready. 
Como el C estaba en 6 y justo termino b, lo agarro al cpu por 3 quantums.
en el 9, lo agarro A, por que ya estaba en ready (antes q B) y termina usandolo por 1 quantum y sale.,
en el 10, lo agarro B al cpu, y lo usa por los 2 tiempos que le quedaron.
y dsps todo C, que era el ultimo en el ready.