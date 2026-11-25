# Final simulado 4 — Solución

> Enunciado: [[Final simulado 4]]. Verificaciones:
> - Ej 1: compilado y corrido con los 4 llamados.
> - Ej 3: simulador.
> - Ej 4: se enumeraron todas las intercalaciones, y los semáforos se chequearon con exploración exhaustiva.

---

## Ejercicio 1

Lo clave: **tanto el hijo como el padre** hacen `execvp(argv[1], argv+1)`, o sea los dos se reemplazan por `argv[1]` con **un argumento menos**. Cada nivel **duplica** la cantidad de procesos.

### a) `./a.out ./a.out ./a.out` (argc = 3)

```
O: [a.out, a.out, a.out]      fork → hijo H; O imprime "P" y hace exec
├─ O  exec → [a.out, a.out]   (argc 2) fork → hijo N1; O imprime "P" y hace exec
│   ├─ O  exec → [a.out]      (argc 1) imprime "F"
│   └─ N1 exec → [a.out]      (argc 1) imprime "F"
└─ H  exec → [a.out, a.out]   (argc 2) fork → hijo N2; H imprime "P" y hace exec
    ├─ H  exec → [a.out]      imprime "F"
    └─ N2 exec → [a.out]      imprime "F"
```

- **4 procesos** en total: O, H, N1 y N2. Se crean 3 nuevos.
- Se imprimen **4 `F`**, **3 `P`** y **0 `X`**. `X` sólo sale si el `exec` **falla**, porque si funciona, el código siguiente ya no existe.
- Una corrida real dio `PPPFFFF`.

### b) Con n veces `./a.out`

- Procesos: **2<sup>n−1</sup>**.
- `F`: **2<sup>n−1</sup>**.
- `P`: **2<sup>n−1</sup> − 1**, uno por cada fork.

Ejemplo con 7 `./a.out`: 64 procesos, 64 `F` y 63 `P`.

La salida **no** es siempre la misma: el orden depende del planificador. Lo que sí vale es que cada proceso escribe su `P` antes de su propio `exec`. Por eso las `P` de un proceso salen antes que las `F` de **su misma imagen**, pero un hijo puede imprimir `F` antes que la `P` de otro.

### c) `./a.out ./a.out echo hola`

1. Nivel argc 4: fork. Los dos (padre e hijo) hacen exec de `./a.out` con `[./a.out, echo, hola]`. Sale 1 `P`, la del padre.
2. Cada uno de esos 2 procesos (argc 3): fork, y los dos hacen exec de `echo` con `[echo, hola]`. Salen 2 `P` más.
3. Los 4 `echo` imprimen `hola\n`.

Salida: **3 `P`** y **4 líneas `hola`**. Una corrida dio:

```
PPPhola
hola
hola
hola
```

### d) `./a.out ./noexiste`

- argc 2: hace fork.
- El hijo: `execvp` **falla** (devuelve −1) y sigue con la línea siguiente, así que imprime `X`.
- El padre: imprime `P`, su `execvp` también falla, y retorna 0.
- Salida: `PX` o `XP`, según cuál corra primero.

---

## Ejercicio 2

- Dirección de una PDE = (CR3 << 12) + 4·dir.
- Dirección de una PTE = (marco de la tabla << 12) + 4·tab.

Para las direcciones usadas:

| Dirección | dir | tab | PDE en | PTE en | Física |
|---|---|---|---|---|---|
| `0x00001000…` (código) | 0 | 1 | `0x00010000` | `0x00020004` | `0x0A0A0xxx` |
| `0x00400FFC` | 1 | 0 | `0x00010004` | `0x00030000` | `0x0B0B0FFC` |
| `0x00401000` = 0x00400FFC+4 | 1 | 1 | `0x00010004` | `0x00030004` | `0x0C0C0000` |
| `0x00401004` = 0x00400FFC+8 | 1 | 1 | `0x00010004` | `0x00030004` | `0x0C0C0004` |

### a) Sin TLB: cada referencia cuesta 3 accesos (PDE, PTE y el acceso)

| # | Qué | PDE (R) | PTE (R) | Acceso |
|---|---|---|---|---|
| 1 | fetch `0x1000` | 0x00010000 | 0x00020004 | R 0x0A0A0000 |
| 2 | fetch `0x1005` | 0x00010000 | 0x00020004 | R 0x0A0A0005 |
| 3 | load `(%ebx)` | 0x00010004 | 0x00030000 | R 0x0B0B0FFC |
| 4 | fetch `0x1007` | 0x00010000 | 0x00020004 | R 0x0A0A0007 |
| 5 | store `4(%ebx)` | 0x00010004 | 0x00030004 | **W** 0x0C0C0000 |
| 6 | fetch `0x100A` | 0x00010000 | 0x00020004 | R 0x0A0A000A |
| 7 | load `8(%ebx)` | 0x00010004 | 0x00030004 | R 0x0C0C0004 |

Total: 7 referencias · 3 = **21 accesos físicos**.

Hay que notar que `4(%ebx)` = 0x00401000 **cruza a otra página** y usa otra PTE y otro marco, aunque esté "al lado".

### b) Con TLB

Hay 3 páginas virtuales distintas: 0x00001, 0x00400 y 0x00401.

- Primer acceso a cada una: miss (3 accesos).
- Resto: hit (1 acceso).

| # | TLB | accesos |
|---|---|---|
| 1 fetch | miss (0x00001) | 3 |
| 2 fetch | hit | 1 |
| 3 load | miss (0x00400) | 3 |
| 4 fetch | hit | 1 |
| 5 store | miss (0x00401) | 3 |
| 6 fetch | hit | 1 |
| 7 load | hit | 1 |

Total: **13 accesos**, con **3 misses** y **4 hits**.

### c)

La página de código 0x00001 se mapea con la PTE 0x00020[1] = `URP`, que es de **sólo lectura**. Escribir ahí da un **page fault por protección**, y el SO normalmente mata al proceso con SIGSEGV. Así se protege el código.

### d)

Un `movl` lee 4 bytes: 0x00400FFE, 0x00400FFF, **0x00401000** y 0x00401001. El acceso **cruza el límite de página**, así que hacen falta **dos traducciones**:

- 2 bytes en 0x0B0B0FFE;
- 2 bytes en 0x0C0C0000.

Sin TLB son 2 page walks.

---

## Ejercicio 3

### a)

| t | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| CPU0 | A | B | B | D | D | · | A | A | B | B | D |
| CPU1 | · | · | C | C | E | E | E | E | E | · | B |
| CPU2 | · | · | · | B | C | C | C | C | C | · | · |
| HDD | · | A | A | A | A | A | B | B | D | D | · |

Paso a paso:

- **t=0:** A corre 1 en CPU0 y en t=1 se va al HDD (1–6).
- **t=1:** llega B y toma CPU0.
- **t=2:** llega C y toma CPU1.
- **t=3:** a B se le vence el quantum (1–3) y llega D. La cola queda `[D, B]`, porque el que llega va primero. D va a CPU0 y B a CPU2. B termina su ráfaga de 3 en t=4.
- **t=4:**
  - a C se le vence el quantum (2–4) y llega E: la cola queda `[E, C]`. E va a CPU1 y C a CPU2.
  - B quiere el HDD, pero está ocupado por A hasta 6: B **espera** en la cola del disco.
- **t=5:** D termina su ráfaga de 2 y también espera el HDD. La cola del HDD queda `[B, D]`.
- **t=6:**
  - A vuelve de I/O; a E y a C se les vence el quantum. La cola queda `[A, E, C]`: A a CPU0, E a CPU1, C a CPU2.
  - El HDD atiende a B (6–8).
- **t=8:**
  - A termina.
  - B vuelve de I/O; a E y a C se les vence el quantum. La cola queda `[B, E, C]`.
  - E y C terminan en t=9 (les quedaba 1 a cada uno).
  - El HDD atiende a D (8–10).
- **t=10:** a B se le vence el quantum con 1 pendiente, y D vuelve de I/O. La cola queda `[D, B]`: D a CPU0 y B a CPU1. Los dos terminan en 11.

### b)

| Proceso | Llegada | Fin | T<sub>turnaround</sub> |
|---|---|---|---|
| A | 0 | 8 | **8** |
| B | 1 | 11 | **10** |
| C | 2 | 9 | **7** |
| D | 3 | 11 | **8** |
| E | 4 | 9 | **5** |

Promedio = 38/5 = **7.6**.

### c)

D terminó su CPU en t=5 y el HDD lo atendió recién en t=8: esperó **3 unidades**. Primero estaba A (hasta 6) y después B (6–8).

---

## Ejercicio 4

### a) Resultados posibles: 5

`{0,0,0,0}`, `{1,0,0,0}`, `{1,1,0,0}`, `{1,1,1,0}`, `{1,1,1,1}`. Es decir, **algunos 1 al principio y 0 al final**: 1<sup>k</sup>0<sup>4−k</sup>.

Escenarios:

- `{0,0,0,0}`: P1 completo primero (A B C D … E) y después P0 completo.
- `{1,1,1,1}`: P0 completo primero y después P1.
- `{1,0,0,0}`:
  1. P1 escribe a[3], a[2] y a[1].
  2. P0 escribe a[0], a[1], a[2] y a[3] (pisa todo).
  3. P1 escribe a[0] = 1.
- `{1,1,0,0}`:
  1. P1 escribe a[3] y a[2].
  2. P0 escribe todo.
  3. P1 escribe a[1] y a[0].
- `{1,1,1,0}`:
  1. P1 escribe a[3].
  2. P0 escribe todo.
  3. P1 escribe a[2], a[1] y a[0].

### b) ¿`{0,0,1,1}`? **Imposible**

Notación: `X.k` es la escritura de X en `a[k]`. Para ese resultado haría falta:

- `a[1] = 0`: P0 escribió último en 1, o sea **P1.1 < P0.1**.
- `a[2] = 1`: P1 escribió último en 2, o sea **P0.2 < P1.2**.

Pero cada proceso tiene un orden de programa fijo:

- P0 escribe en orden creciente: **P0.1 < P0.2**.
- P1 escribe en orden decreciente: **P1.2 < P1.1**.

Encadenando: P1.1 < P0.1 < P0.2 < P1.2 < P1.1. Es un **ciclo**, así que es una contradicción. ∎

(Lo mismo prohíbe cualquier "0 antes de un 1" en el arreglo final.)

### c) Siempre `{1,1,0,0}`

Se necesita:

- P0.0 < P1.0 y P0.1 < P1.1: P1 escribe 0 y 1 **después** que P0.
- P1.2 < P0.2 y P1.3 < P0.3: P0 escribe 2 y 3 **después** que P1.

```c
// Init: s0 = 0, s1 = 0
P0:                                 P1:
1: i = 0;                           A: j = 3;
2: while (i < 4) {                  B: while (j >= 0) {
       if (i == 2) wait(s1);               if (j == 1) wait(s0);
3:     a[i] = 0;                    C:     a[j] = 1;
       if (i == 1) post(s0);               if (j == 2) post(s1);
4:     i++;                         D:     j--;
5: }                                E: }
```

Qué garantiza:

- P0 escribe a[0] y a[1] libremente y avisa. Para escribir a[2] espera a que P1 haya escrito a[3] y a[2].
- P1 escribe a[3] y a[2] libremente y avisa. Para escribir a[1] espera a que P0 haya escrito a[0] y a[1].

No hay deadlock: cada uno hace su `post` **antes** de su `wait`. Es lo más concurrente posible: sólo se fuerzan las 2 dependencias necesarias.

La exploración exhaustiva da siempre `{1,1,0,0}`.

---

## Ejercicio 5

### a) Sí

`TestAndSet` es atómica. De todos los hilos que la ejecutan mientras `flag == 0`, exactamente **uno** lee 0 (y la deja en 1): ese entra. Los demás leen 1 y siguen girando hasta que el dueño haga `unlock`.

### b) No es justo

No hay orden de llegada. Cuando se libera, gana el que ejecute `TestAndSet` primero, y un hilo puede perder siempre: **starvation**. Para que haya justicia hace falta, por ejemplo, un *ticket lock* con fetch-and-add.

### c) Un solo núcleo

- **No apropiativo:** si el hilo que gira encuentra el lock tomado, **nunca suelta la CPU**. El dueño no puede correr para liberarlo: se cuelga para siempre.
- **Apropiativo:** funciona, pero cada vez que le toca la CPU **desperdicia el quantum entero** girando. Por eso existen las versiones con `yield()` o con colas y `park()`.

### d) No

Vuelve a ser el error del *Simple Flag*: chequear y setear no es atómico.

```
flag = 0
T0: while(flag==1)  → sale (flag==0)
T1: while(flag==1)  → sale (flag==0)
T0: TestAndSet(&flag,1)  → entra a la CS
T1: TestAndSet(&flag,1)  → entra a la CS   ¡los dos adentro!
```

(Tampoco se usa el valor de retorno de `TestAndSet`, que es justamente lo que hace segura la versión original.)

### e) Incorrecta

Re-testear no sirve: el problema es la ventana entre el último test y `mutex = 1`.

```
1 2 1 2 1 2   (P0 testea 3 veces mutex==0 y sale del for)
A B A B A B   (P1 testea 3 veces mutex==0 y sale del for)
3 4           (P0: mutex=1, CS0)
C D           (P1: mutex=1, CS1)   ¡ambos en la CS!
```

---

## Ejercicio 6

### a) `create` + `write` (OSTEP Fig. 40.4)

| # | Acceso | ¿Por qué? |
|---|---|---|
| 1 | **read root inode** | Para recorrer el path hay que saber dónde están los datos de `/`. |
| 2 | **read root data** | Buscar la entrada `foo` y obtener su número de i-nodo. |
| 3 | **read foo inode** | Saber dónde están los datos del directorio foo. |
| 4 | **read foo data** | Buscar `bar`: no existe y hay que crearlo. |
| 5 | **read inode bitmap** | Buscar un i-nodo libre. |
| 6 | **write inode bitmap** | Marcarlo como usado. |
| 7 | **write foo data** | Agregar la entrada `(bar, #inodo)` al directorio. |
| 8 | **read bar inode** | Leer el bloque que contiene el i-nodo, para modificarlo. |
| 9 | **write bar inode** | Inicializarlo: tipo, size 0, permisos, etc. |
| 10 | **write foo inode** | Actualizar el mtime (y el size, si creció) del directorio. |
| 11 | **read bar inode** | `write()`: saber qué bloques tiene. No tiene ninguno. |
| 12 | **read data bitmap** | Buscar un bloque libre. |
| 13 | **write data bitmap** | Marcarlo como usado. |
| 14 | **write bar data[0]** | Escribir los 4096 bytes. |
| 15 | **write bar inode** | Agregar el puntero al bloque, el size nuevo y el mtime. |

`close()` no hace I/O al disco.

Cada `write()` que agrega un bloque nuevo cuesta **5 I/O**: leer el i-nodo, leer y escribir el bitmap, escribir el dato y escribir el i-nodo.

### b) `open` (lectura) + `read()`

- `open`: read root inode, read root data, read foo inode, read foo data, read bar inode.
- `read()`: **read bar inode**, **read bar data[0]** y **write bar inode**.

El `read()` escribe porque actualiza el **atime** (último acceso) en el i-nodo.

### c) HDD

1. Una vuelta: 60000 / 7200 = **8.333 ms**.
2. Por pista: 250 MiB/s · 8.333 ms = **2.083 MiB** (≈ 2133 KiB).
3. Tasas al azar (T = seek + media vuelta + transferencia):

   | Bloque | Seek | Media vuelta | Transferencia | T | R |
   |---|---|---|---|---|---|
   | 4 KiB | 9 ms | 4.167 ms | 0.0156 ms | 13.182 ms | **≈ 303.4 KiB/s** |
   | 8 MiB | 9 ms | 4.167 ms | 32 ms | 45.167 ms | **≈ 177.1 MiB/s** |

---

## Ejercicio 7 — V/F

| | | |
|---|---|---|
| a | **F** | Pasa a modo kernel, pero salta a la dirección que indica la **trap table**, que configuró el kernel al bootear. Si el proceso eligiera el destino, podría ejecutar cualquier cosa en modo kernel. |
| b | **V** | El handler puede decidir que el proceso siga, por ejemplo porque no venció el quantum o porque no hay nadie más listo. |
| c | **V** | Ya hizo `exit`, pero guarda su exit status hasta que el padre haga `wait()`. |
| d | **F** | Quedan **huérfanos** y los adopta init (PID 1), que es quien después les hace `wait`. |
| e | **V** | Padre e hijo comparten las páginas marcadas como sólo lectura. La primera escritura da page fault y recién ahí se copia esa página. |
| f | **V** | Las traducciones son del espacio de direcciones viejo. Hay que hacer flush, o tener ASID para distinguirlas. |
| g | **V** | La FAT es una lista enlazada de clusters. Para llegar al N hay que seguir N−1 punteros: el acceso aleatorio es O(N), como se vio en el Lab 3. |
| h | **V** | Al montar se rejuega (*replay*) el journal: sólo las transacciones confirmadas que no llegaron a su lugar final. Es mucho más rápido que fsck. |
| i | **V** | `exec` conserva la tabla de fds. Así funciona `cmd > archivo` en la shell: fork, en el hijo `dup2(fd,1)` y después `exec`. |
