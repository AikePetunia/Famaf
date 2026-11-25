# Final simulado 3 — Solución

> Enunciado: [[Final simulado 3]]. Verificaciones:
> - Ej 1: compilado y corrido.
> - Ej 2 y Ej 4: simuladores.
> - Ej 5: se enumeraron todas las intercalaciones, y la solución con semáforos se chequeó explorando todos los estados (siempre da 3969, sin deadlock).

---

## Ejercicio 1

### a) Árbol

Se crean **3 procesos nuevos**: 4 en total con el original.

```
O  (fork en i=0)        → padre: wait, "p", break
└── H0 (nace en i=0)    → "h", sigue el for: fork en i=1 → padre: wait, "p", break
    └── H1 (nace en i=1) → "h", fork en i=2 → padre: wait, "p", break
        └── H2 (nace en i=2) → "h", i=3: sale del for
```

Cada **padre** hace `break`, así que sólo el último hijo sigue el `for`. Es una **cadena**, no un árbol binario.

### b) Salida

**`hhhppp`**, y es la **única** posible. Cada padre está bloqueado en `wait` hasta que su hijo termina, y cada hijo escribe su `h` antes de crear al suyo. Las `p` salen al volver: primero H1, después H0 y al final O.

### c) Sin `wait`

Restricciones de orden:

- Cada `h` va antes de la `h` del hijo (el hijo nace después del `write`).
- Cada `h` de H0 y H1 va antes de su propia `p`.
- La `p` de O puede salir en cualquier momento después del primer fork, incluso antes de toda `h`.

Hay **14** salidas posibles:

`hhhppp, hhphpp, hhpphp, hhppph, hphhpp, hphphp, hphpph, hpphhp, hpphph, phhhpp, phhphp, phhpph, phphhp, phphph`

Criterio: leyendo de izquierda a derecha, antes de la k-ésima `h` puede haber como mucho k `p`.

---

## Ejercicio 2

Cómo se deduce cada paso:

- El `size` de un bloque **usado** nuevo es el parámetro del `malloc`.
- El puntero es la dirección del header + 8.
- Para ubicar cada header, se suma `8 + size` desde 16384.

Direcciones de los headers (fijas desde la Foto 3): 16384 (120), 16512 (56), 16576 (300), 16884 (resto).

| Entre | Operación | Cómo se ve |
|---|---|---|
| 0 y 1 | **`16392 = malloc(120)`** | Aparece un usado de 120 y el libre baja a 4088−120−8 = 3960. |
| 1 y 2 | **`16520 = malloc(56)`** | El header nuevo está en 16384+8+120 = 16512, y el puntero es 16520. |
| 2 y 3 | **`16584 = malloc(300)`** | El header en 16576 y el resto libre en 16884. |
| 3 y 4 | **`free(16520)`** | El de 56 pasa a `next: 16884` y `head` apunta a él (16512). |
| 4 y 5 | **`free(16392)`** | El de 120 pasa a `next: 16512` y `head` apunta a 16384. |
| 5 y 6 | **`16392 = malloc(56)`** | ¡First fit toma el **primero de la lista**, el de 120, y lo **parte**! Queda un usado de 56 y un libre de 120−56−8 = **56** en 16448. |
| 6 y 7 | **`16456 = malloc(40)`** | El primero de la lista es el de 16448 (56 ≥ 40). Lo parte: un usado de 40 y un libre de 56−40−8 = **8** en 16496. |

> Trampas:
> - En 5→6 parece que reusa el hueco exacto de 56 (en 16512), pero first fit recorre **desde head**, y head es el bloque de 120.
> - El `free` recibe el puntero (header + 8), no la dirección del header.
> - En 6→7 queda un bloque libre de 8 bytes útiles: fragmentación.

---

## Ejercicio 3

### a)

| VA | dir | tab | Física |
|---|---|---|---|
| `0x00001234` | 0 | 1 | 0x0B000[1] = 0x10001 → **`0x10001234`** |
| `0x00401234` | 1 | 1 | 0x0C000[1] = 0x10001 → **`0x10001234`** (¡la misma!) |
| `0x00402ABC` | 1 | 2 | 0x0C000[2] = 0x20000 → **`0x20000ABC`** |
| `0x007FF010` | 1 | 0x3FF | 0x0C000[0x3FF] = 0x0B000 → **`0x0B000010`** |
| `0x00800000` | 2 | — | PDE ausente → **page fault** |

### b)

Las page tables 0x0B000 y 0x0C000 tienen **contenido idéntico**, así que la PDE 1 puede apuntar a la misma tabla que la PDE 0:

```
0x0A000:  0x001: 0x0B000, UWP     (antes 0x0C000)
```

Ahora el marco 0x0C000 no lo usa nadie y se libera: se ahorran **4 KiB**. Todas las traducciones dan lo mismo, porque la tabla consultada tiene las mismas entradas.

### c)

**No.** Ahora las tablas **no** son iguales. Con las originales, `0x007FF010` (dir 1, tab 0x3FF) iba a 0x0C000[0x3FF] = 0x0C000, o sea a **0x0C000010**. Si la PDE 1 apunta a 0x0B000, iría a 0x0B000[0x3FF] = 0x0B000, o sea a **0x0B000010**. Cambió el mapeo.

Además, 0x0C000 no se podría liberar: sigue mapeado como página.

> Antes de compartir dos tablas, hay que comparar **todas** sus entradas, incluidas las que apuntan a la propia tabla.

### d) Inverso de `0x10001ABC`

En las dos tablas, la entrada [1] apunta a 0x10001. La 0x0B000 se alcanza con dir 0 y la 0x0C000 con dir 1.

Resultado: **`0x00001ABC`** y **`0x00401ABC`**.

---

## Ejercicio 4

### a)

| t | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| CPU | A | A | B | B | C | D | D | A | C | B | B | D | C | A | A | A | A |
| cola | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 |
| I/O | · | · | · | · | · | C | C | C | · | C | C | C | · | · | · | · | · |

Paso a paso:

- **t=0–2:** A agota el quantum 2 de Q0 y baja a Q1. B llegó en t=1 y espera en Q0.
- **t=2–4:** B corre 2, agota y baja a Q1. Q1 queda `[A, B]`.
- **t=4:** C (llegó en 3) está en Q0: corre 1 y se bloquea **antes** de agotar el quantum, así que se queda en Q0. Su I/O va de 5 a 8.
- **t=5–7:** D (llegó en 5) corre 2 en Q0, agota y baja a Q1. Q1 queda `[A, B, D]`.
- **t=7:** Q0 está vacía y corre A desde Q1 (quantum 4).
- **t=8:** C vuelve de I/O a Q0 y **desaloja** a A. A va al final de Q1: `[B, D, A]`. C corre 1 y se bloquea (I/O de 9 a 12).
- **t=9–11:** B corre los 2 que le faltaban y termina en 11.
- **t=11:** D corre 1 (le quedaba 1) y termina en 12.
- **t=12:** C vuelve, corre su última ráfaga y termina en 13.
- **t=13–17:** A corre los 4 que le faltan y termina en 17.

### b)

| Proceso | Llegada | 1ra vez | Fin | T<sub>turnaround</sub> | T<sub>response</sub> |
|---|---|---|---|---|---|
| A | 0 | 0 | 17 | **17** | **0** |
| B | 1 | 2 | 11 | **10** | **1** |
| C | 3 | 4 | 13 | **10** | **1** |
| D | 5 | 5 | 12 | **7** | **0** |

C es interactivo: nunca agota el quantum, se queda en Q0 y por eso tiene buena respuesta cada vez que vuelve de I/O.

### c)

E y F se alternan: mientras uno hace I/O, el otro usa la CPU. Así **siempre hay alguien en Q0** y nunca agotan el quantum, porque se bloquean a 1 de 2. A, que ya está en Q1/Q2, **no vuelve a correr nunca**: **starvation**.

Lo soluciona la regla del **priority boost**: cada S unidades de tiempo todos vuelven a Q0. Además, con la regla de contabilizar el tiempo acumulado por nivel (*allotment*), E y F bajarían de cola aunque se bloqueen antes del quantum.

---

## Ejercicio 5

### a) 73 valores

Con `i = 1`: `i*i` no cambia nada mientras `i = 1`. Todos los valores son **impares**, porque se arranca en 1 y +2, ·3 y ² conservan la paridad impar.

**21, 23, 25, 27, 29, 33, 35, 39, 41, 45, 47, 49, 51, 53, 57, 59, 63, 75, 77, 81, 83, 121, 123, 147, 149, 153, 169, 171, 225, 227, 243, 245, 249, 289, 291, 361, 363, 365, 369, 441, 443, 507, 509, 513, 529, 675, 677, 681, 729, 731, 841, 867, 869, 873, 1083, 1085, 1089, 1091, 1225, 1323, 1521, 1523, 1681, 2025, 2027, 2209, 2601, 2603, 2809, 3249, 3251, 3481, 3969**

Cómo pensarlo:

1. El último valor que pasa alguna guarda es `x ≤ 19`.
2. A partir de ahí, cada componente que pasó su guarda con un valor `< 20` y todavía no hizo el cuerpo aplica **un** cuerpo más, en cualquier orden.
3. Por ejemplo, 3969 = ((19 + 2) · 3)²: los tres pasaron su guarda y quedaron "colgados" hasta el final.
4. 21 es el mínimo: 19 + 2 y nadie más pendiente.

> Ojo con el parcial 2025 (mismo formato, `i=0`, `i+1`, `i+i`, `i*i`, `i<32`): con esta semántica también aparecen valores impares como 33 y valores mayores que 961, como 1024 = 32·32. Para "todos los valores" conviene sistematizar con "último valor que pasó la guarda + cuerpos pendientes".

### b) Siempre 3969

Idea: que P1 y P2 pasen su guarda **al principio** (con `i = 1`) y esperen. P0 lleva `i` hasta 21. Después P1 hace ·3 = 63 y por último P2 hace ² = 3969.

```c
// Init: i = 1;  g1 = 0, g2 = 0, s1 = 0, s2 = 0
P0:                         P1:                         P2:
down(g1); down(g2);         while (i < 20) {            while (i < 20) {
while (i < 20) {                up(g1);                     up(g2);
    i = i + 2;                  down(s1);                   down(s2);
}                               i = i * 3;                  i = i * i;
up(s1);                         up(s2);                 }
                            }
```

- P0 espera a que P1 y P2 hayan pasado su guarda (con `i = 1 < 20`).
- P0 termina en 21 y libera a P1, que hace 63 y libera a P2, que hace 3969.
- Las guardas siguientes fallan. Cada `down` tiene su `up`, así que no hay deadlock.

---

## Ejercicio 6

### a)

Índices por bloque: 2048 / 4 = **512**.

| Hasta | Cuenta | KiB acumulado |
|---|---|---|
| Directos | 10 · 2 | **20** |
| + Indirectos | 2 · 512 · 2 = 2048 | **2068** |
| + Doble | 512² · 2 = 524288 | **526356** |
| + Triple | 512³ · 2 = 268435456 | **268961812** (≈ 256.5 GiB) |

### b)

- 4 KiB = 2<sup>12</sup> B.
- Índices de 32 bits: hay 2<sup>32</sup> bloques direccionables.

| | 2<sup>16</sup> i-nodos | 2<sup>22</sup> i-nodos | Cuenta |
|---|---|---|---|
| i-bmap | **8 KiB** | **512 KiB** | 1 bit por i-nodo: 2<sup>16</sup> / 8 B, o 2<sup>22</sup> / 8 B |
| d-bmap | **512 MiB** | **512 MiB** | 2<sup>32</sup> bits = 2<sup>29</sup> B |
| inode table | **16 MiB** | **1 GiB** | 2<sup>16</sup> · 2<sup>8</sup> B, o 2<sup>22</sup> · 2<sup>8</sup> B |
| data region | **16 TiB** | **16 TiB** | 2<sup>32</sup> · 2<sup>12</sup> B |

La cantidad de i-nodos **no cambia** la d-bmap ni la data region: esas dependen del ancho del índice.

### c)

- **Tamaño máximo:** (12 + 1024 + 1024² + 1024³) · 4 KiB = 48 KiB + 4 MiB + 4 GiB + 4 TiB ≈ **4.004 TiB**.
- **Bloques que ocupa cada archivo máximo:**
  - datos: 1074791436 bloques;
  - índices: 1 (indirecto) + (1 + 1024) (doble) + (1 + 1024 + 1024²) (triple) = 1050627 bloques;
  - total: 1075842063 bloques.
- **Cuántos entran:** ⌊2<sup>32</sup> / 1075842063⌋ = **3 archivos**, o sea ≈ **12.01 TiB** usados (no 4, porque 4 · 4.004 TiB > 16 TiB).

---

## Ejercicio 7 — V/F

| | | |
|---|---|---|
| a | **V** | Con muchos procesos interactivos en la cola alta, los de abajo pueden no correr nunca. |
| b | **V** | Es el "gaming" del scheduler. La regla del *allotment*, que cuenta el tiempo total usado en el nivel, lo evita. |
| c | **V** | Es la versión apropiativa de SJF: siempre corre el que menos le falta. Es óptimo en turnaround si se conocen las duraciones. |
| d | **F** | Es una función de biblioteca (libc). Usa syscalls (`brk`/`sbrk`, `mmap`) **sólo a veces**, cuando necesita más memoria. |
| e | **F** | Apunta **8 bytes después** del header. `free(p)` encuentra el header en `p − 8`. |
| f | **F** | La reduce, pero puede seguir habiendo huecos libres no contiguos entre bloques usados. |
| g | **F** | Las condition variables no tienen memoria: un `signal` sin nadie esperando se pierde. Los semáforos sí "recuerdan" con su contador. |
| h | **V** | Por la semántica Mesa: al despertar, la condición puede ya no valer, ya sea porque otro hilo se adelantó o por un *spurious wakeup*. Hay que re-chequearla. |
| i | **F** | El hard link es otra entrada de directorio con el **mismo** i-nodo. El symlink es un archivo **aparte**, con su propio i-nodo, que guarda la ruta. |
