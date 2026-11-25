# Sistemas Operativos — Final simulado 1

> Estilo parciales 2026. Todos los ejercicios valen lo mismo. Tiempo sugerido: 3 h.
> Solución: [[Final simulado 1 - solucion]]

---

## Ejercicio 1

Se compila y ejecuta el siguiente programa (`./a.out`, sin argumentos). Suponga que ninguna llamada falla.

```c
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main(void) {
    pid_t a = fork();
    pid_t b = fork();
    if (a == 0 && b == 0) printf("c\n");
    else if (a == 0)      printf("h\n");
    else if (b == 0)      printf("p\n");
    else { wait(NULL); printf("P\n"); }
    return 0;
}
```

a) ¿Cuántos procesos hay en total (contando el original)? Dibujar el árbol de procesos indicando cuánto valen `a` y `b` en cada uno.

b) Dar **todas** las salidas posibles por pantalla (cada letra en su línea; escribirlas en una fila, ej: `hpcP`). ¿Cuántas son?

c) Se reemplaza `wait(NULL);` por `while (wait(NULL) > 0);`. Dar todas las salidas posibles. ¿Cuántas son?

---

## Ejercicio 2

Secuencia de fotos en un heap de 4 KiB = 4096 bytes. Sólo una operación ocurre entre fotos. Se usa la estructura de datos de OSTEP, Capítulo 17: *"Free Space Management"*; el header de un bloque (`size`+`magic` si está alocado, `size`+`next` si está libre) ocupa 8 bytes y `size` cuenta sólo los bytes útiles. `malloc` es *first fit* sobre la free-list empezando por `head` y aloca al principio del bloque elegido; `free` inserta al principio de la free-list y no hay coalescing.

**Todo en decimal y en bytes.** La base del heap es la dirección virtual 16 KiB, o sea en Foto 0, `head = 16384`. La memoria empieza arriba y crece hacia abajo. `next = 0` es NULL.

| Entre | Operación |
|---|---|
| 0 y 1 | `p1 = malloc(100)` → `p1 = ______` |
| 1 y 2 | `p2 = malloc(40)` → `p2 = ______` |
| 2 y 3 | `p3 = malloc(200)` → `p3 = ______` |
| 3 y 4 | `free(p1)` |
| 4 y 5 | `p4 = malloc(64)` → `p4 = ______` |
| 5 y 6 | `free(p3)` |

a) Completar los punteros de la tabla.

b) Completar todos los campos `size` y `next` de las fotos y marcar a qué bloque apunta `head` en cada una.

```
  Foto 0            Foto 1            Foto 2            Foto 3
┌─────────────┐   ┌─────────────┐   ┌─────────────┐   ┌─────────────┐
│size:        │   │size:        │   │size:        │   │size:        │
│next:        │   │magic:1234567│   │magic:1234567│   │magic:1234567│
├─────────────┤   ├─────────────┤   ├─────────────┤   ├─────────────┤
│    ...      │   │size:        │   │size:        │   │size:        │
└─────────────┘   │next:        │   │magic:1234567│   │magic:1234567│
                  ├─────────────┤   ├─────────────┤   ├─────────────┤
                  │    ...      │   │size:        │   │size:        │
                  └─────────────┘   │next:        │   │magic:1234567│
                                    ├─────────────┤   ├─────────────┤
                                    │    ...      │   │size:        │
                                    └─────────────┘   │next:        │
                                                      ├─────────────┤
                                                      │    ...      │
                                                      └─────────────┘

  Foto 4            Foto 5            Foto 6
┌─────────────┐   ┌─────────────┐   ┌─────────────┐
│size:        │   │size:        │   │size:        │
│next:        │   │magic:1234567│   │magic:1234567│
├─────────────┤   ├─────────────┤   ├─────────────┤
│size:        │   │size:        │   │size:        │
│magic:1234567│   │next:        │   │next:        │
├─────────────┤   ├─────────────┤   ├─────────────┤
│size:        │   │size:        │   │size:        │
│magic:1234567│   │magic:1234567│   │magic:1234567│
├─────────────┤   ├─────────────┤   ├─────────────┤
│size:        │   │size:        │   │size:        │
│next:        │   │magic:1234567│   │next:        │
├─────────────┤   ├─────────────┤   ├─────────────┤
│    ...      │   │size:        │   │size:        │
└─────────────┘   │next:        │   │next:        │
                  ├─────────────┤   ├─────────────┤
                  │    ...      │   │    ...      │
                  └─────────────┘   └─────────────┘
```

c) En la Foto 6, ¿cuántos bytes útiles libres hay en total? ¿Cuál es el `malloc(x)` más grande que se puede satisfacer?

d) Sobre la Foto 6 se ejecuta `p5 = malloc(20)`. ¿Cuánto vale `p5`? ¿Cómo queda la free-list (en orden desde `head`)?

---

## Ejercicio 3

Esquema de paginación i386 de 32 bits (10, 10, 12) → (20, 12), páginas de 4 KiB, 2 niveles.
`CR3 = 0x0C0DE`. Cada entrada muestra el marco físico (5 dígitos hexa) y los bits de protección:
primera letra `S` sistema / `U` usuario, segunda `W` lectura-escritura / `R` sólo lectura, tercera `P` presente / `-` ausente. Las entradas no listadas son `0x00000, SR-`.

| 0x0C0DE | 0x0BEEF | 0x0FACE |
|---|---|---|
| `0x3FF: 0x0C0DE, SWP` | `0x3FF: 0x0C0DE, SWP` | `0x3FF: 0x0BEEF, URP` |
| ⋮ | ⋮ | ⋮ |
| `0x003: 0x12345, SW-` | `0x003: 0x12345, UWP` | `0x002: 0x12345, UW-` |
| `0x002: 0x0FACE, URP` | `0x002: 0x0FACE, URP` | `0x001: 0x12345, UWP` |
| `0x001: 0x0BEEF, UWP` | `0x001: 0x0BEEF, UWP` | `0x000: 0x0C0DE, SWP` |
| `0x000: 0x0BEEF, UWP` | `0x000: 0x00000, SR-` | |

Suponiendo **modo kernel**, traducir (si no se puede, indicar por qué):

a) `0x00003ABC` → `0x________`
b) `0x00401010` → `0x________`
c) `0x00800FFF` → `0x________`
d) `0xFFFFF004` → `0x________`
e) `0x00000123` → `0x________`
f) `0x00C00777` → `0x________`

g) Ahora en **modo usuario**: ¿qué pasa al **leer** `0x00800FFF`? ¿Y al **escribir** `0x00801234`?

h) Mapeo inverso de la física `0x12345678` a **todas** sus virtuales.

i) Mapeo inverso de la física `0x0BEEF0A0` a **todas** sus virtuales.

---

## Ejercicio 4

Planificar con **Round Robin Q = 3** los siguientes procesos monohilo. Hay **2 núcleos** de ejecución (CPU0, CPU1). Toda la I/O es contra **un único HDD** que atiende los pedidos de a uno, en orden FIFO.

Convenciones: si en un mismo instante un proceso llega (nuevo o vuelto de I/O) y otro agota su quantum, el que llega se encola primero. Llegadas simultáneas en orden alfabético. Un núcleo libre toma el primero de la cola; si hay dos núcleos libres, CPU0 elige primero.

| Proceso | Inicio | CPU | IO | CPU |
|---|---|---|---|---|
| A | 0 | 2 | 4 | 3 |
| B | 0 | 4 | 3 | 1 |
| C | 2 | 6 | | |

a) Completar el diagrama:

| t | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| CPU0 | | | | | | | | | | | | | |
| CPU1 | | | | | | | | | | | | | |
| HDD | | | | | | | | | | | | | |

b) Calcular T<sub>turnaround</sub> y T<sub>response</sub> de cada proceso.

c) ¿Qué cambia si cada proceso tuviera su propio dispositivo de I/O (las I/O pueden solaparse)?

---

## Ejercicio 5

Atomicidad **línea a línea**.

**a)**

| Inicialización | `i = 1` |
|---|---|
| P0 | P1 |
| `while (i < 33) {`<br>`    i = i * 2;`<br>`}` | `while (i < 33) {`<br>`    i = i * 4;`<br>`}` |

Dar todos los valores finales de `i` de menor a mayor, y un escenario para el mayor.

**b)**

| Inicialización | `i = 1` |
|---|---|
| P0 | P1 |
| `while (i < 20) {`<br>`    i = i * 2;`<br>`}` | `while (i < 20) {`<br>`    i = i + 3;`<br>`}` |

Dar todos los valores finales de `i` de menor a mayor. Dar un escenario para el menor y otro para el mayor.

---

## Ejercicio 6

Se borró el **dbmap**. El disco tiene 32 bloques de **512 bytes**, índices de bloque de 32 bits, todos los índices empiezan en 0 y en los bitmaps 1 = ocupado, 0 = libre. El dbmap tiene un bit por **cada bloque del disco**. Layout:

| bloque | 0 | 1 | 2 | 3 | 4–5 | 6–31 |
|---|---|---|---|---|---|---|
| contenido | boot | superbloque | ibmap | dbmap | tabla de i-nodos | datos |

Cada i-nodo tiene `size` (bytes), 8 bloques directos y 1 puntero a bloque **indirecto simple** (`ind`).

**i-node table**

| #inode | size | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | ind |
|---|---|---|---|---|---|---|---|---|---|---|
| 0 | 64 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 |
| 1 | 4097 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
| 2 | 1500 | 17 | 18 | 19 | 20 | 0 | 0 | 0 | 0 | 0 |
| 3 | 1024 | 21 | 20 | 22 | 23 | 24 | 25 | 26 | 27 | 28 |
| 4 | 0 | 29 | 30 | 31 | 0 | 0 | 0 | 0 | 0 | 0 |
| 5 | 0 | 24 | 25 | 0 | 0 | 0 | 0 | 0 | 0 | 26 |
| 6 | 5000 | 25 | 26 | 27 | 29 | 30 | 31 | 17 | 18 | 19 |
| 7 | 513 | 16 | 16 | 16 | 16 | 16 | 16 | 16 | 16 | 16 |

**ibmap**

| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| 1 | 1 | 0 | 1 | 0 | 1 | 1 | 0 |

**Contenido de algunos bloques de datos** (primeras entradas, como índices de 32 bits)

| bloque | [0] | [1] | [2] | [3] |
|---|---|---|---|---|
| 15 | 16 | 3 | 30 | 30 |
| 19 | 22 | 24 | 0 | 21 |

**rootdir** (i-nodo 0)

| name | #inode |
|---|---|
| . | 0 |
| .. | 0 |
| kernel.img | 1 |
| notas.txt | 3 |
| vacio | 5 |
| juego | 6 |

a) Reconstruir el dbmap:

| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |

b) ¿Cuál es el tamaño máximo de un archivo en este sistema de archivos? ¿Y si se agregara un puntero a bloque doble indirecto?

---

## Ejercicio 7 — Verdadero o Falso. Justificar en una o dos líneas.

a) `fork()` le devuelve al hijo el PID del padre.

b) Después de un `execvp()` exitoso, los descriptores de archivo que estaban abiertos siguen abiertos en el programa nuevo.

c) Un proceso monohilo puede reportar `cputime` significativamente mayor que `walltime`.

d) Round Robin con un quantum muy chico mejora el T<sub>turnaround</sub> promedio.

e) `free(p)` siempre devuelve la memoria al sistema operativo.

f) En i386 (10,10,12), un page directory o una page table ocupa exactamente un marco de 4 KiB.

g) Un TLB miss implica siempre un page fault.

h) Dos procesos distintos pueden usar la misma dirección virtual y acceder a marcos físicos distintos.

i) Con 4 núcleos y 8 procesos CPU-bound monohilo idénticos, el walltime de cada uno es aproximadamente el doble que con 4 procesos, pero el cputime se mantiene.
