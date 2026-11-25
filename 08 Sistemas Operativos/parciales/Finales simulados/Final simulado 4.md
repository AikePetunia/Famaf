# Sistemas Operativos — Final simulado 4

> Estilo finales 2021–2024. Todos los ejercicios valen lo mismo. Tiempo sugerido: 3 h.
> Solución: [[Final simulado 4 - solucion]]

---

## Ejercicio 1

Explicar detalladamente qué hace el programa, cuántos procesos se crean, qué hacen los padres, etc. El ejecutable se llama `a.out` y está en el directorio actual.

```c
#include <unistd.h>

int main(int argc, char **argv) {
    if (argc < 2) {
        write(1, "F", 1);
        return 0;
    }
    int rc = fork();
    if (rc == 0) {
        execvp(argv[1], argv + 1);
        write(1, "X", 1);
    } else {
        write(1, "P", 1);
        execvp(argv[1], argv + 1);
    }
    return 0;
}
```

a) `$ ./a.out ./a.out ./a.out`: ¿cuántos procesos hay en total? ¿Cuántas `F`, `P` y `X` se imprimen? Dibujar el árbol de procesos indicando qué `argv` tiene cada imagen.

b) Generalizar para `$ ./a.out ./a.out … ./a.out` con n veces `./a.out`. ¿La salida es siempre la misma?

c) `$ ./a.out ./a.out echo hola`: ¿qué se imprime?

d) `$ ./a.out ./noexiste` (no existe ese archivo): ¿qué se imprime?

---

## Ejercicio 2

Esquema de paginación i386 (10, 10, 12), `CR3 = 0x00010`. Bits: `S`/`U` sistema/usuario, `W`/`R` lectura-escritura/sólo lectura, `P`/`-` presente/ausente. Las entradas no listadas son `0x00000, SR-`. Cada entrada ocupa 4 bytes.

| 0x00010 | 0x00020 | 0x00030 |
|---|---|---|
| `0x001: 0x00030, UWP` | `0x001: 0x0A0A0, URP` | `0x001: 0x0C0C0, UWP` |
| `0x000: 0x00020, UWP` | | `0x000: 0x0B0B0, UWP` |

Se ejecuta el siguiente código x86-32 en modo usuario. Suponga que leer una instrucción es **un** acceso a memoria en la dirección de la instrucción, sin importar su largo.

```
0x00001000:  movl $0x00400FFC, %ebx
0x00001005:  movl (%ebx), %eax
0x00001007:  movl %eax, 4(%ebx)
0x0000100A:  movl 8(%ebx), %ecx
```

a) Escribir la **traza de accesos a memoria física** completa (instrucciones, datos y lecturas de las tablas de páginas), suponiendo que **no hay TLB**. Indicar para cada acceso si es lectura o escritura. ¿Cuántos accesos hay en total?

b) Repetir suponiendo una TLB inicialmente vacía y lo suficientemente grande. ¿Cuántos accesos físicos hay? ¿Cuántos TLB hits y misses?

c) ¿Qué pasa si después el programa ejecuta `movl %eax, 0x00001000`?

d) Si la primera instrucción fuera `movl $0x00400FFE, %ebx`, ¿qué cambia en la lectura de la segunda instrucción?

---

## Ejercicio 3

Planificar con **Round Robin Q = 2** los siguientes procesos monohilo. Hay **3 núcleos** (CPU0, CPU1, CPU2) y la I/O va a un **único HDD** que atiende de a un pedido, en orden FIFO.

Convenciones: en un mismo instante, los que llegan (nuevos o que vuelven de I/O) se encolan antes que los que agotan el quantum. Llegadas simultáneas en orden alfabético. Los núcleos libres toman de la cola en orden CPU0, CPU1, CPU2.

| Proceso | Inicio | CPU | IO | CPU |
|---|---|---|---|---|
| A | 0 | 1 | 5 | 2 |
| B | 1 | 3 | 2 | 3 |
| C | 2 | 7 | | |
| D | 3 | 2 | 2 | 1 |
| E | 4 | 5 | | |

a) Completar:

| t | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| CPU0 | | | | | | | | | | | | | | |
| CPU1 | | | | | | | | | | | | | | |
| CPU2 | | | | | | | | | | | | | | |
| HDD | | | | | | | | | | | | | | |

b) Calcular el T<sub>turnaround</sub> de cada proceso y el promedio.

c) ¿Cuánto tiempo estuvo D esperando el disco (listo para hacer I/O, pero con el HDD ocupado)?

---

## Ejercicio 4

Atomicidad **línea a línea**, `a[]` compartido, `i` y `j` locales.

| Pre: `a[4] = {2, 2, 2, 2}` | |
|---|---|
| `1: i = 0;` | `A: j = 3;` |
| `2: while (i < 4) {` | `B: while (j >= 0) {` |
| `3:     a[i] = 0;` | `C:     a[j] = 1;` |
| `4:     i++;` | `D:     j--;` |
| `5: }` | `E: }` |

a) Dar todos los valores finales posibles de `a`, con un escenario para cada uno.

b) ¿Es posible terminar con `a = {0, 0, 1, 1}`? Justificar rigurosamente.

c) Agregar semáforos entre líneas (se pueden usar `if` sobre `i` o `j` sólo para hacer `wait`/`post`) para que el resultado final sea **siempre** `{1, 1, 0, 0}`. Cuanto más concurrente, mejor.

---

## Ejercicio 5

```c
int TestAndSet(int *old_ptr, int new) {   // se ejecuta atómicamente (instrucción de HW)
    int old = *old_ptr;
    *old_ptr = new;
    return old;
}
typedef struct { int flag; } lock_t;     // init: flag = 0

void lock(lock_t *l)   { while (TestAndSet(&l->flag, 1) == 1) ; }
void unlock(lock_t *l) { l->flag = 0; }
```

a) ¿Garantiza exclusión mutua? Justificar.

b) ¿Es justo? ¿Puede haber starvation?

c) ¿Qué pasa con este lock en un sistema de **un solo núcleo** con planificador **no apropiativo**? ¿Y con uno apropiativo?

d) Alguien "optimiza" el lock así:
```c
void lock(lock_t *l) {
    while (l->flag == 1) ;
    TestAndSet(&l->flag, 1);
}
```
¿Sigue garantizando exclusión mutua? Si no, dar un contraejemplo.

e) Se intenta mejorar el *Simple Flag* re-testeando la guarda N veces:

| `{ mutex = 0, N = 3 }` | |
|---|---|
| `1: for (i=0; i<N; i++)` | `A: for (k=0; k<N; k++)` |
| `2:     while (mutex == 1);` | `B:     while (mutex == 1);` |
| `3: mutex = 1;` | `C: mutex = 1;` |
| `4: CS0;` | `D: CS1;` |
| `5: mutex = 0;` | `E: mutex = 0;` |

Si es correcta, dar argumentos rigurosos. Si no, dar un contraejemplo.

---

## Ejercicio 6

**a)** En un FS tipo UNIX (vsfs de OSTEP) existe el directorio `/foo` (vacío) y se ejecuta:

```c
int fd = open("/foo/bar", O_CREAT | O_WRONLY);   // crea el archivo
write(fd, buf, 4096);                             // escribe 1 bloque
close(fd);
```

Llenar el cuadro, en orden temporal, con `read` / `write` en la columna que corresponda, explicando brevemente por qué se hace cada acción. Suponer que no hay caché.

| | data bitmap | inode bitmap | root inode | foo inode | bar inode | root data | foo data | bar data[0] | ¿Por qué? |
|---|---|---|---|---|---|---|---|---|---|
| `open(create)` | | | | | | | | | |
| | | | | | | | | | |
| `write()` | | | | | | | | | |

**b)** Ahora `open("/foo/bar", O_RDONLY)` y un `read()` de 1 bloque. ¿Qué accesos hay? ¿Por qué el `read()` **escribe**?

**c)** Un HDD tiene 7200 RPM, 9 ms de seek promedio y 250 MiB/s de transferencia máxima.
1. ¿Cuánto tarda una vuelta completa?
2. Si la transferencia máxima se logra leyendo una pista entera por vuelta, ¿cuántos MiB entran en una pista?
3. Tasa de transferencia para lecturas al azar de bloques de 4 KiB y de 8 MiB.

---

## Ejercicio 7 — Verdadero o Falso. Justificar.

a) Una syscall se hace con una instrucción `trap`, que pasa a modo kernel y salta a una dirección que elige el proceso de usuario.

b) Puede haber interrupciones de timer que no terminen en un cambio de contexto.

c) Un proceso zombie ya terminó, pero sigue ocupando una entrada en la tabla de procesos.

d) Si el padre termina, sus hijos terminan inmediatamente.

e) Gracias a copy-on-write, `fork()` no copia las páginas del padre hasta que alguno de los dos escribe.

f) En un cambio de contexto entre procesos hay que invalidar la TLB, salvo que tenga identificadores de espacio de direcciones (ASID).

g) En FAT, para encontrar el cluster N de un archivo hay que recorrer la cadena de la FAT desde el primer cluster.

h) Con journaling, después de un crash no hace falta recorrer todo el disco (`fsck`) para recuperar la consistencia.

i) Si se hace `dup2(fd, 1)` y después `execvp(...)`, el programa nuevo escribe su salida estándar en el archivo de `fd`.
