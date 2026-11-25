# Sistemas Operativos — Final simulado 3

> Todos los ejercicios valen lo mismo. Tiempo sugerido: 3 h.
> Solución: [[Final simulado 3 - solucion]]

---

## Ejercicio 1

```c
#include <unistd.h>
#include <sys/wait.h>

int main(void) {
    for (int i = 0; i < 3; i++) {
        if (fork() == 0) {
            write(1, "h", 1);
        } else {
            wait(NULL);
            write(1, "p", 1);
            break;
        }
    }
    return 0;
}
```

a) ¿Cuántos procesos se crean en total? Dibujar el árbol de procesos indicando en qué valor de `i` nace cada uno.

b) ¿Qué se imprime? ¿Hay más de una salida posible?

c) Se borra la línea `wait(NULL);`. Dar **todas** las salidas posibles. ¿Cuántas son?

---

## Ejercicio 2

Secuencia de fotos en un heap de 4 KiB = 4096 bytes. Sólo una operación ocurre entre fotos del heap: **complete la que corresponde y tache la otra**. Se usa la estructura de datos de OSTEP, Capítulo 17: *"Free Space Management"* (header de 8 bytes). En el `malloc` debe dar el parámetro de entrada y el valor del puntero de salida; en el `free`, sólo el valor del puntero de entrada. **Escribir todo en decimal.** La base del heap es la dirección virtual 16 KiB, o sea en Foto 0 `head = 16384`.

```
         Foto 0                       Foto 1
       ┌───────────────┐            ┌───────────────┐
head → │ size: 4088    │            │ size: 120     │
       │ next: 0       │            │ magic: 1234567│
       ├───────────────┤            ├───────────────┤
       │      ...      │     head → │ size: 3960    │
       └───────────────┘            │ next: 0       │
                                    ├───────────────┤
                                    │      ...      │
                                    └───────────────┘
```

```
         Foto 2                       Foto 3
       ┌───────────────┐            ┌───────────────┐
       │ size: 120     │            │ size: 120     │
       │ magic: 1234567│            │ magic: 1234567│
       ├───────────────┤            ├───────────────┤
       │ size: 56      │            │ size: 56      │
       │ magic: 1234567│            │ magic: 1234567│
       ├───────────────┤            ├───────────────┤
head → │ size: 3896    │            │ size: 300     │
       │ next: 0       │            │ magic: 1234567│
       ├───────────────┤            ├───────────────┤
       │      ...      │     head → │ size: 3588    │
       └───────────────┘            │ next: 0       │
                                    ├───────────────┤
                                    │      ...      │
                                    └───────────────┘
```

```
         Foto 4                       Foto 5
       ┌───────────────┐            ┌───────────────┐
       │ size: 120     │     head → │ size: 120     │
       │ magic: 1234567│            │ next: 16512   │
       ├───────────────┤            ├───────────────┤
head → │ size: 56      │            │ size: 56      │
       │ next: 16884   │            │ next: 16884   │
       ├───────────────┤            ├───────────────┤
       │ size: 300     │            │ size: 300     │
       │ magic: 1234567│            │ magic: 1234567│
       ├───────────────┤            ├───────────────┤
       │ size: 3588    │            │ size: 3588    │
       │ next: 0       │            │ next: 0       │
       ├───────────────┤            ├───────────────┤
       │      ...      │            │      ...      │
       └───────────────┘            └───────────────┘
```

```
         Foto 6                       Foto 7
       ┌───────────────┐            ┌───────────────┐
       │ size: 56      │            │ size: 56      │
       │ magic: 1234567│            │ magic: 1234567│
       ├───────────────┤            ├───────────────┤
head → │ size: 56      │            │ size: 40      │
       │ next: 16512   │            │ magic: 1234567│
       ├───────────────┤            ├───────────────┤
       │ size: 56      │     head → │ size: 8       │
       │ next: 16884   │            │ next: 16512   │
       ├───────────────┤            ├───────────────┤
       │ size: 300     │            │ size: 56      │
       │ magic: 1234567│            │ next: 16884   │
       ├───────────────┤            ├───────────────┤
       │ size: 3588    │            │ size: 300     │
       │ next: 0       │            │ magic: 1234567│
       ├───────────────┤            ├───────────────┤
       │      ...      │            │ size: 3588    │
       └───────────────┘            │ next: 0       │
                                    ├───────────────┤
                                    │      ...      │
                                    └───────────────┘
```

| Entre | malloc | free |
|---|---|---|
| 0 y 1 | `______ = malloc(____)` | `free(______)` |
| 1 y 2 | `______ = malloc(____)` | `free(______)` |
| 2 y 3 | `______ = malloc(____)` | `free(______)` |
| 3 y 4 | `______ = malloc(____)` | `free(______)` |
| 4 y 5 | `______ = malloc(____)` | `free(______)` |
| 5 y 6 | `______ = malloc(____)` | `free(______)` |
| 6 y 7 | `______ = malloc(____)` | `free(______)` |

---

## Ejercicio 3

Esquema de paginación i386 (10, 10, 12), `CR3 = 0x0A000`. Bits: `S`/`U` sistema/usuario, `W`/`R` lectura-escritura/sólo lectura, `P`/`-` presente/ausente. Las entradas no listadas son `0x00000, SR-`.

| 0x0A000 | 0x0B000 | 0x0C000 |
|---|---|---|
| `0x3FF: 0x00000, SR-` | `0x3FF: 0x0B000, SWP` | `0x3FF: 0x0B000, SWP` |
| ⋮ | ⋮ | ⋮ |
| `0x002: 0x00000, SR-` | `0x002: 0x20000, URP` | `0x002: 0x20000, URP` |
| `0x001: 0x0C000, UWP` | `0x001: 0x10001, UWP` | `0x001: 0x10001, UWP` |
| `0x000: 0x0B000, UWP` | `0x000: 0x10000, UWP` | `0x000: 0x10000, UWP` |

a) Traducir a física (modo kernel): `0x00001234`, `0x00401234`, `0x00402ABC`, `0x007FF010`, `0x00800000`.

b) Modificar las tablas para que **baje el consumo de memoria** sin cambiar a dónde apunta ninguna dirección virtual. ¿Cuánta memoria se ahorra?

c) Supongamos que en lugar de `0x3FF: 0x0B000, SWP`, la tabla 0x0C000 tuviera `0x3FF: 0x0C000, SWP` (y 0x0B000 queda como está). ¿Sigue valiendo la modificación de b)? Justificar con una dirección virtual concreta.

d) Mapeo inverso de la física `0x10001ABC` a todas sus virtuales (con las tablas originales).

---

## Ejercicio 4

Planificar con **MLFQ** de 3 colas en **1 núcleo**:

| Cola | Prioridad | Quantum |
|---|---|---|
| Q0 | alta | 2 |
| Q1 | media | 4 |
| Q2 | baja | 8 |

Reglas:

- Un proceso nuevo entra a Q0.
- Si agota su quantum, baja una cola (en Q2 se queda).
- Si se bloquea por I/O antes de agotar su quantum, se queda en la misma cola.
- Siempre corre el primero de la cola más alta no vacía.
- Si un proceso de mayor prioridad pasa a listo, desaloja al que corre. El desalojado va al final de su cola y, la próxima vez que corra, recibe un quantum completo.
- En el mismo instante, los que llegan (o vuelven de I/O) se encolan antes que el que fue desalojado o agotó su quantum.
- No hay priority boost.

| Proceso | Llegada | CPU | IO | CPU | IO | CPU |
|---|---|---|---|---|---|---|
| A | 0 | 7 | | | | |
| B | 1 | 4 | | | | |
| C | 3 | 1 | 3 | 1 | 3 | 1 |
| D | 5 | 3 | | | | |

a) Completar el diagrama, indicando también en qué cola estaba el proceso que corre:

| t | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| CPU | | | | | | | | | | | | | | | | | | | |
| cola | | | | | | | | | | | | | | | | | | | |
| I/O | | | | | | | | | | | | | | | | | | | |

b) Calcular T<sub>turnaround</sub> y T<sub>response</sub> de cada proceso.

c) Se agregan dos procesos E y F que llegan en t=1 y t=2 y hacen, indefinidamente, CPU 1, IO 1. ¿Qué le pasa a A? ¿Qué regla de MLFQ lo soluciona?

---

## Ejercicio 5

Atomicidad **línea a línea**.

| Inicialización: | `i = 1` | |
|---|---|---|
| `while (i < 20) {` | `while (i < 20) {` | `while (i < 20) {` |
| `    i = i + 2;` | `    i = i * 3;` | `    i = i * i;` |
| `}` | `}` | `}` |
| | `i = ?` | |

a) Dar todos los valores finales de `i` de menor a mayor.

b) Sincronizar con semáforos para que **siempre** dé el valor máximo. No se puede cambiar la *computation proper*: sólo se pueden agregar `down`/`up` en cualquier parte de las componentes, e `if`s sólo si hacen `down`/`up`. No se aceptan riesgos de deadlock.

---

## Ejercicio 6

**a)** Un sistema de archivos UNIX-like *rarote* tiene bloques de **2 KiB**, índices de bloque de **32 bits** y en el i-nodo: **10** punteros directos, **2** indirectos, **1** doble indirecto y **1** triple indirecto. Dar la secuencia estrictamente creciente de tamaños de archivo (en KiB) que marcan el paso de directos → indirectos → dobles → triples, hasta el máximo tamaño de archivo posible.

```
0 KiB  ──▶  ______ KiB  ──▶  ______ KiB  ──▶  ______ KiB  ──▶  ______ KiB
   Directos      Indirectos       Dobles            Triples
```

**b)** Otro FS UNIX con 12 directos, 1 indirecto, 1 doble y 1 triple, bloques de 4 KiB e índices de 32 bits. Cada entrada de la tabla de i-nodos ocupa 256 bytes, y la data region es la máxima posible usando todos los índices. Completar con KiB, MiB, GiB o TiB según corresponda:

| Parte del disco | 2<sup>16</sup> i-nodos | 2<sup>22</sup> i-nodos |
|---|---|---|
| i-bmap | | |
| d-bmap | | |
| inode table | | |
| data region | | |

**c)** Para el FS de b), calcular el tamaño máximo de archivo y cuántos archivos de tamaño máximo entran en la data region.

---

## Ejercicio 7 — Verdadero o Falso. Justificar.

a) MLFQ sin priority boost puede producir starvation.

b) Si MLFQ no contabiliza el tiempo de CPU acumulado en cada nivel, un proceso puede quedarse siempre en la cola más alta haciendo I/O justo antes de que se le termine el quantum.

c) STCF minimiza el T<sub>turnaround</sub> promedio, aun si los procesos llegan en distintos momentos (conociendo sus duraciones).

d) `malloc()` es una syscall.

e) En el esquema de OSTEP, el puntero que devuelve `malloc()` apunta al header del bloque.

f) Con coalescing de bloques libres contiguos desaparece la fragmentación externa.

g) Una variable de condición recuerda los `signal()` que se hicieron cuando nadie estaba esperando.

h) Conviene que `pthread_cond_wait()` esté dentro de un `while` y no de un `if`.

i) Un hard link y un symbolic link al mismo archivo tienen el mismo número de i-nodo que el archivo.
