# Sistemas Operativos — Final simulado 2

> Todos los ejercicios valen lo mismo. Tiempo sugerido: 3 h.
> Solución: [[Final simulado 2 - solucion]]

---

## Ejercicio 1

Se encontró este `dup.c` en un pendrive. Se lo compiló y, antes de ejecutarlo, se quiere predecir qué hace a medida que aumenta la cantidad de argumentos, llamándolo así:

```
$ ./a.out ./a.out ... ./a.out
```

```c
int main(int argc, char **argv)
{
    int fd = open("test.txt", O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR);
    for (int i = 0; i < argc; ++i) {
        close(i % 3);
        dup(fd);
        write(1, "b", 1);
        write(2, "c", 1);
    }
}
```

Completar (`# de ./a.out` cuenta **todos**, incluido el primero, o sea es `argc`):

| # de ./a.out | # `b` en consola | # `c` en consola | # `b` en test.txt | # `c` en test.txt | Explicación |
|---|---|---|---|---|---|
| 1 | | | | | |
| 2 | | | | | |
| 3 | | | | | |
| 4 | | | | | |
| 5 | | | | | |
| 6 | | | | | |
| 7 | | | | | |

---

## Ejercicio 2

En una PC con **4 núcleos físicos con hyperthreading** (8 núcleos lógicos) se corren procesos al mismo tiempo y se reportan los pares **(walltime, cputime)** de cada uno. No hay otros procesos en el sistema.

**a)** `./pi` es CPU-bound y monohilo. Se lanzan N instancias iguales a la vez. Completar con valores aproximados:

| N | Mediciones |
|---|---|
| 1 | `(2.00, 2.00)` |
| 4 | `(2.01, 2.00)`, `(_.__, _.__)`, `(_.__, 2.01)`, `(2.02, _.__)` |
| 8 | `(3.21, 3.19)`, `(_.__, _.__)`, …(las 8 son similares) |
| 12 | `(_.__, _.__)`, …(las 12 son similares) |
| 16 | `(6.41, _.__)`, …(las 16 son similares) |

**b)** `./dgemm` es un único proceso CPU-bound que reparte el trabajo en T hilos. Completar:

| T (hilos) | (walltime, cputime) |
|---|---|
| 1 | `(8.00, 7.98)` |
| 2 | `(_.__, _.__)` |
| 4 | `(_.__, _.__)` |
| 8 | `(_.__, _.__)` |
| 16 | `(_.__, _.__)` |

**c)** `./backup` copia un archivo grande del HDD a otro lugar del **mismo** HDD. Solo, mide `(10.0, 0.4)`.
- Se corren 2 `./backup` a la vez (cada uno con su archivo): `(__.__, _.__)` cada uno.
- Se corre 1 `./backup` junto con 8 `./pi`: `./backup` = `(__.__, _.__)`, cada `./pi` = `(_.__, _.__)`.

**d)** Unir cada medición con la caracterización del proceso:

| Medición | | Caracterización |
|---|---|---|
| `(12.1, 0.3)` | | CPU-bound & multihilo |
| `(12.0, 11.9)` | | IO-bound |
| `(3.1, 11.8)` | | CPU-bound |

---

## Ejercicio 3

Esquema de paginación RISC-V de 3 niveles con páginas de 4 KiB: (9, 9, 9, 12) → (44, 12).

```
 Virtual address (64 bits)
 ┌─────────┬────┬────┬────┬────────┐
 │  EXT    │ L2 │ L1 │ L0 │ offset │     satp → tabla L2 → tabla L1 → tabla L0 → marco
 │ 25 bits │ 9  │ 9  │ 9  │   12   │
 └─────────┴────┴────┴────┴────────┘
 PTE: | PPN (44 bits) | ... | X | W | R | V |
```

Se avanza de nivel con cualquier entrada que tenga V=1. Los permisos R/W/X se consideran en la entrada del último nivel.
`satp = 0x00000000ACE`. La fila superior es el marco (11 dígitos hexa). Las entradas no listadas son `0x00000000000, ----`.

| 0x00000000ACE | 0x00000000B0B | 0x00000000CAB |
|---|---|---|
| `0x1FF: 0x00000000CAB, XWRV` | `0x1FF: 0x00000000ACE, XWRV` | `0x1FF: 0x00000000B0B, -WRV` |
| ⋮ | ⋮ | ⋮ |
| `0x002: 0x00000000CAB, XWR-` | | `0x003: 0x00000DECADA, X-RV` |
| `0x001: 0x00000000ACE, XWRV` | `0x001: 0x00000000B0B, -WRV` | `0x001: 0x00000000ACE, --RV` |
| `0x000: 0x00000000B0B, XWRV` | `0x000: 0x00000000CAB, XWRV` | `0x000: 0x00000C0FFEE, -WRV` |

Traducir (si da fault, decir en qué nivel):

a) `0x0000000000003666` → `0x______________`
b) `0x0000000040201ABC` → `0x______________`
c) `0x0000000000201010` → `0x______________`
d) `0x0000000080000FFF` → `0x______________`
e) `0x000000000003F234` → `0x______________`
f) `0x0000000040000777` → `0x______________`

g) ¿Se puede **ejecutar** código en la virtual de a)? ¿Y **escribir** en ella?

h) Mapeo inverso de la física `0x00000000ACE123` a todas sus virtuales con EXT = 0.

i) Para este esquema, la cantidad **mínima** de RAM que ocupan las tablas de páginas para mapear al menos una página es ______ KiB, y la **máxima** que puede ocupar un esquema válido es ______ MiB.

---

## Ejercicio 4

Multiprograma con atomicidad **línea a línea**. `a[]` es compartido; `i` y `j` son locales.

| Pre: `a[6] = {9, 9, 9, 9, 9, 9}` | |
|---|---|
| **P0** | **P1** |
| `1: i = 0;` | `A: j = 1;` |
| `2: while (i < 6) {` | `B: while (j < 6) {` |
| `3:     a[i] = 0;` | `C:     a[j] = a[j-1] + 1;` |
| `4:     i = i + 1;` | `D:     j = j + 2;` |
| `5: }` | `E: }` |

a) Dar **todos** los valores finales posibles de `a`.

b) ¿Puede terminar `a[1] == 10`? Justificar.

c) Dar un escenario (secuencia de etiquetas) que termine en `a = {0, 1, 0, 0, 0, 1}`.

d) Agregar semáforos (sólo `wait`/`post`, se permiten `if` sobre `i` o `j` sólo para hacer `wait`/`post`) para que el resultado sea **siempre** `{0, 1, 0, 1, 0, 1}`, maximizando la concurrencia y sin riesgo de deadlock.

---

## Ejercicio 5

**a)** Escribir la inicialización y las tres componentes de un multiprograma para que **haya riesgo de deadlock en las tres componentes**. Sólo usar `down()` de semáforos y sus valores iniciales; no hace falta hacer `up()`.

| Inicialización: | | |
|---|---|---|
| P0: | P1: | P2: |
| | | |

**b)** Esta es una implementación del problema de la región crítica que tiene errores.

| Inicialización: `!flag[0] && !flag[1] && turn == 0` | |
|---|---|
| `A: while (flag[1] && turn == 1);` | `1: while (flag[0] && turn == 0);` |
| `B: flag[0] = true;` | `2: flag[1] = true;` |
| `C: turn = 1;` | `3: turn = 0;` |
| `D: -CS-` | `4: -CS-` |
| `E: flag[0] = false;` | `5: flag[1] = false;` |

1. Dar una planificación lo más corta posible que muestre que **no** se resuelve el problema de la región crítica.
2. Modificar el programa **in situ** para arreglarlo.

---

## Ejercicio 6

**a)** Completar la columna vacía con la permutación de 0…3 que hace coincidir cada disco con su velocidad de transferencia. Es una permutación: todos los valores están y ninguno se repite. (1 MB = 1000 KB).

| Características del HDD (nombre, rotación, seek, transferencia pico) | # |
|---|---|
| Laptop 2.5", 5400 RPM, 12 ms, 120 MB/s | |
| WD Gold, 7200 RPM, 4.5 ms, 270 MB/s | |
| Cheetah, 10000 RPM, 3.8 ms, 170 MB/s | |
| Mini 1.8", 3600 RPM, 15 ms, 30 MB/s | |

| # | R<sub>I/O</sub> random [4 KB], R<sub>I/O</sub> secuencial [1 MB] |
|---|---|
| 0 | 586.21 KB/s, 78.85 MB/s |
| 1 | 170.45 KB/s, 17.65 MB/s |
| 2 | 460.75 KB/s, 80.84 MB/s |
| 3 | 227.42 KB/s, 38.63 MB/s |

**b)** Un HDD de 7200 RPM, 8.5 ms de seek promedio y 220 MiB/s de transferencia máxima cuesta **80 USD**. Hay dos versiones mejoradas:
- **UpRPM**: 14400 RPM; la transferencia máxima pasa a 440 MiB/s. Cuesta 40 USD más.
- **DownSeek**: el seek pasa a 4.25 ms. Cuesta 30 USD más.

Para lecturas **al azar de bloques de 1 MiB**, calcular R<sub>I/O</sub> y R<sub>I/O</sub>/precio de los tres discos, y ordenarlos del más conveniente al menos conveniente. Repetir el orden para bloques al azar de 4 KiB.

---

## Ejercicio 7 — Verdadero o Falso. Justificar.

a) Con atomicidad línea a línea, dos componentes que ejecutan una sola vez `x = x + 1;` partiendo de `x = 0` siempre terminan en `x = 2`.

b) Un spinlock hecho con test-and-set garantiza exclusión mutua y además es justo (ningún hilo espera para siempre).

c) El algoritmo de Peterson funciona correctamente en un multiprocesador moderno sin barreras de memoria.

d) Un semáforo inicializado en 1 se puede usar como lock.

e) Si todos los procesos toman los locks en el mismo orden global, no puede haber deadlock.

f) En un HDD, la lectura secuencial es mucho más rápida que la aleatoria porque evita seek y latencia rotacional.

g) `rm archivo` libera siempre el i-nodo del archivo.

h) Un `read()` de un archivo nunca provoca escrituras en el disco.

i) Aumentar el tamaño de bloque del sistema de archivos aumenta la fragmentación interna.
