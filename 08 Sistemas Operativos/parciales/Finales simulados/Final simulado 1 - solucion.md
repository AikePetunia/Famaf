# Final simulado 1 — Solución

> Enunciado: [[Final simulado 1]]. Todos los resultados están verificados con código: los programas compilados y corridos, y lo demás con simuladores en Python.

---

## Ejercicio 1

### a) Árbol de procesos

Hay dos `fork()` seguidos y nadie los saltea, así que hay **4 procesos**.

```
O  (a>0, b>0)  ── imprime "P" después de esperar a UN hijo
├── H  (a=0, b>0)   ── imprime "h"      (hijo del 1er fork)
│   └── N (a=0, b=0) ── imprime "c"     (nieto: hijo de H en el 2do fork)
└── Q  (a>0, b=0)   ── imprime "p"      (hijo de O en el 2do fork)
```

- `a` vale 0 en H y en N, porque N nace de H y hereda su `a`.
- `b` vale 0 en los creados por el 2do fork: Q y N.

### b) Salidas con `wait(NULL)`

- O espera **un solo** hijo, el que termine primero de sus hijos directos (H o Q). Por eso `P` sale después de `h` **o** de `p`.
- `c` es el nieto, y O nunca lo espera. Puede salir en cualquier momento, incluso después de `P` (queda huérfano y lo adopta init).

La restricción es "`P` no está antes que `h` y `p` a la vez". En el orden relativo de `P`, `h` y `p` eso descarta 2 de los 6 órdenes. Quedan 24 · 4/6 = **16 salidas**:

`chPp, chpP, cpPh, cphP, hPcp, hPpc, hcPp, hcpP, hpPc, hpcP, pPch, pPhc, pcPh, pchP, phPc, phcP`

### c) Salidas con `while (wait(NULL) > 0);`

Ahora O espera a **todos** sus hijos (H y Q), pero sigue sin esperar al nieto. `P` va después de `h` y de `p`, y `c` puede ir en cualquier lado. Quedan 24 · 2/6 = **8 salidas**:

`chpP, cphP, hcpP, hpPc, hpcP, pchP, phPc, phcP`

> Lo que se evalúa: `wait` espera sólo a hijos **directos**, nunca a nietos. Y `wait(NULL)` espera a **uno**, no a todos.

---

## Ejercicio 2

Regla de oro (header de 8 B):

- `malloc(n)` sobre un bloque libre con header en X y `size = S`:
  - devuelve **X + 8**;
  - el bloque alocado queda con `size = n`;
  - el sobrante queda en **X + 8 + n**, con `size = S − n − 8`.
- `free(p)`: el header está en **p − 8**. `size` no cambia, `magic` pasa a ser `next`, y el bloque va primero en la lista.

### a) Punteros

| Entre | Operación | Resultado |
|---|---|---|
| 0 y 1 | `p1 = malloc(100)` | **16392** (16384+8) |
| 1 y 2 | `p2 = malloc(40)` | **16500** (sobrante en 16384+8+100=16492; +8) |
| 2 y 3 | `p3 = malloc(200)` | **16548** (sobrante en 16492+8+40=16540; +8) |
| 3 y 4 | `free(16392)` | |
| 4 y 5 | `p4 = malloc(64)` | **16392**: first fit encuentra primero el bloque liberado (100 ≥ 64) y lo **parte** |
| 5 y 6 | `free(16548)` | |

### b) Fotos (de arriba hacia abajo; `@` = dirección del header)

**Foto 0**: `head → @16384`

| @ | estado | size | magic / next |
|---|---|---|---|
| 16384 | libre | **4088** (4096−8) | next 0 |

**Foto 1**: `head → @16492`

| @ | estado | size | magic / next |
|---|---|---|---|
| 16384 | usado | **100** | 1234567 |
| 16492 | libre | **3980** (4088−100−8) | next 0 |

**Foto 2**: `head → @16540`

| @ | estado | size | magic / next |
|---|---|---|---|
| 16384 | usado | 100 | 1234567 |
| 16492 | usado | **40** | 1234567 |
| 16540 | libre | **3932** (3980−40−8) | next 0 |

**Foto 3**: `head → @16748`

| @ | estado | size | magic / next |
|---|---|---|---|
| 16384 | usado | 100 | 1234567 |
| 16492 | usado | 40 | 1234567 |
| 16540 | usado | **200** | 1234567 |
| 16748 | libre | **3724** (3932−200−8) | next 0 |

**Foto 4** (`free(16392)`): `head → @16384`

| @ | estado | size | magic / next |
|---|---|---|---|
| 16384 | libre | **100** | next **16748** |
| 16492 | usado | 40 | 1234567 |
| 16540 | usado | 200 | 1234567 |
| 16748 | libre | 3724 | next 0 |

**Foto 5** (`malloc(64)` parte el bloque de 100): `head → @16456`

| @ | estado | size | magic / next |
|---|---|---|---|
| 16384 | usado | **64** | 1234567 |
| 16456 | libre | **28** (100−64−8) | next **16748** |
| 16492 | usado | 40 | 1234567 |
| 16540 | usado | 200 | 1234567 |
| 16748 | libre | 3724 | next 0 |

**Foto 6** (`free(16548)`, el header está en 16540): `head → @16540`

| @ | estado | size | magic / next |
|---|---|---|---|
| 16384 | usado | 64 | 1234567 |
| 16456 | libre | 28 | next 16748 |
| 16492 | usado | 40 | 1234567 |
| 16540 | libre | **200** | next **16456** |
| 16748 | libre | 3724 | next 0 |

Free-list en la Foto 6: `head → 16540 → 16456 → 16748 → NULL`.

> Errores típicos:
> - Poner `next = 16548`: `next` apunta al **header**, no al puntero del usuario.
> - Al hacer `free`, olvidar que el `size` **no cambia**.

### c)

- Libres: 28 + 200 + 3724 = **3952 bytes útiles**.
- El `malloc` más grande que se puede satisfacer es **3724**: ningún pedido puede ocupar dos bloques, porque no hay coalescing y además no son contiguos. Esto es **fragmentación externa**.

### d) `malloc(20)` sobre la Foto 6

First fit recorre desde `head`, y el primero es @16540 (size 200 ≥ 20). Así que **p5 = 16548**. Ojo: no elige el de 28, que es el que elegiría best fit.

El sobrante queda en 16540+8+20 = 16568, con size 200−20−8 = 172, y ocupa el lugar del original en la lista:
`head → 16568 → 16456 → 16748 → NULL`.

---

## Ejercicio 3

La virtual se parte en `dir = va >> 22`, `tab = (va >> 12) & 0x3FF` y `off = va & 0xFFF`.

| VA | dir | tab | Camino | Física |
|---|---|---|---|---|
| a) `0x00003ABC` | 0x000 | 0x003 | 0x0C0DE[0]→0x0BEEF, 0x0BEEF[3]→0x12345 | **`0x12345ABC`** |
| b) `0x00401010` | 0x001 | 0x001 | →0x0BEEF, 0x0BEEF[1]→0x0BEEF | **`0x0BEEF010`** |
| c) `0x00800FFF` | 0x002 | 0x000 | →0x0FACE, 0x0FACE[0]→0x0C0DE | **`0x0C0DEFFF`** |
| d) `0xFFFFF004` | 0x3FF | 0x3FF | →0x0C0DE (el dir usado como tabla), 0x0C0DE[0x3FF]→0x0C0DE | **`0x0C0DE004`** (lee el propio page directory) |
| e) `0x00000123` | 0x000 | 0x000 | →0x0BEEF, 0x0BEEF[0] es `SR-` | **page fault** (PTE ausente) |
| f) `0x00C00777` | 0x003 | — | 0x0C0DE[3] es `SW-` | **page fault** (PDE ausente; tiene marco, pero sin P no vale nada) |

### g) Modo usuario

Para que el acceso pase, tienen que permitirlo **las dos** entradas, PDE y PTE.

- **Leer `0x00800FFF`:** la PDE[2] es `URP` y deja pasar, pero la PTE 0x0FACE[0] es `SWP`, de sistema. **Fault de protección.**
- **Escribir `0x00801234`:** la PDE[2] es `URP`, de sólo lectura, aunque la PTE 0x0FACE[1] sea `UWP`. **Fault de protección.**

### h) Inverso de `0x12345678` (marco 0x12345, offset 0x678)

1. Buscar qué entradas de page table **presentes** apuntan a 0x12345:
   - 0x0BEEF[3] (`UWP`);
   - 0x0FACE[1] (`UWP`);
   - descartadas: 0x0FACE[2] es `UW-`, ausente, y 0x0C0DE[3] es `SW-`, ausente.
2. Buscar qué PDE presentes apuntan a esas tablas:
   - 0x0BEEF lo apuntan las PDE 0 y 1;
   - 0x0FACE lo apunta la PDE 2.
3. Ver qué pasa con la PDE 0x3FF, que usa como tabla al propio 0x0C0DE. Su única entrada hacia 0x12345 es la [3], que está ausente, así que no aporta.

| dir | tab | VA |
|---|---|---|
| 0 | 3 | **`0x00003678`** |
| 1 | 3 | **`0x00403678`** |
| 2 | 1 | **`0x00801678`** |

### i) Inverso de `0x0BEEF0A0`

Las tablas con entradas presentes que apuntan a 0x0BEEF son:

- 0x0BEEF[1], que se alcanza con dir 0 y dir 1;
- 0x0FACE[0x3FF], que se alcanza con dir 2;
- 0x0C0DE[0] y 0x0C0DE[1], que se alcanzan con dir 0x3FF (el autoreferenciado).

| dir | tab | VA |
|---|---|---|
| 0 | 1 | **`0x000010A0`** |
| 1 | 1 | **`0x004010A0`** |
| 2 | 0x3FF | **`0x00BFF0A0`** |
| 0x3FF | 0 | **`0xFFC000A0`** |
| 0x3FF | 1 | **`0xFFC010A0`** |

> Trampa clásica: con una entrada autoreferenciada (0x3FF → el propio directorio), **el directorio funciona también como page table**. Entonces cualquier marco al que apunte una PDE se ve además en `0xFFC00000 + dir·0x1000`.

---

## Ejercicio 4

### a) Diagrama

| t | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| CPU0 | A | A | C | C | C | C | C | C | · | B | |
| CPU1 | B | B | B | B | · | · | A | A | A | · | |
| HDD | · | · | A | A | A | A | B | B | B | · | |

Paso a paso:

- **t=0:** A va a CPU0 y B a CPU1.
- **t=2:** A termina su ráfaga de 2 y va al HDD (2–6). C llega y toma CPU0.
- **t=3:** a B se le vence el quantum (0–3). La cola está vacía, así que vuelve a correr enseguida y termina su ráfaga de 4 en t=4.
- **t=4:** B quiere el HDD, pero **está ocupado por A**: B **espera en la cola del disco** de 4 a 6.
- **t=5:** a C se le vence el quantum (2–5). Nadie espera, así que sigue y termina en t=8.
- **t=6:** A vuelve de I/O y toma CPU1. B empieza su I/O (6–9).
- **t=9:** A termina (6–9). B vuelve y corre 1 en CPU0, y termina en t=10.

### b)

| Proceso | Llegada | 1ra vez en CPU | Fin | T<sub>turnaround</sub> | T<sub>response</sub> |
|---|---|---|---|---|---|
| A | 0 | 0 | 9 | **9** | **0** |
| B | 0 | 0 | 10 | **10** | **0** |
| C | 2 | 2 | 8 | **6** | **0** |

Promedios: T<sub>turnaround</sub> = 25/3 ≈ 8.33; T<sub>response</sub> = 0.

### c)

B haría su I/O de 4 a 7, solapada con la de A, y volvería en t=7. En ese momento los dos núcleos están ocupados: C en CPU0 hasta t=8 y A en CPU1 de 6 a 9. Así que B espera en la cola y corre en CPU0 de 8 a 9.

Resultado: **B termina en 9 en vez de 10** (turnaround 9). A y C no cambian.

La diferencia son los **2 ticks que B esperó en la cola del HDD**.

---

## Ejercicio 5

"Línea a línea" quiere decir que la evaluación de la guarda del `while` es una acción atómica y el cuerpo es **otra**. En el medio se puede meter el otro proceso: esa es toda la gracia del ejercicio.

### a) `i = 1`, `i*2` y `i*4`, guarda `i < 33`

Valores finales: **64, 128, 256**.

`i` siempre es potencia de 2. Al terminar, cada proceso hizo su último cuerpo después de haber pasado la guarda con `i ≤ 32`, y la evaluación de la guarda y el cuerpo **no son atómicos juntos**.

- **El mínimo, 64:** el último valor que pasa la guarda es 32, y uno solo lo multiplica: 32·2 = 64.
- **El mayor, 256:** se llega a `i = 32` (por ejemplo 1→4→8→32 con P1, P0, P1). Con `i = 32` evalúan la guarda los **dos** (32 < 33). Después P0 hace 32·2 = 64 y P1 hace 64·4 = **256**. Las dos guardas siguientes fallan.
- **128:** puede salir como 32·4, o como 16 → ambos pasan la guarda → 16·2·4.

### b) `i = 1`, `i*2` y `i+3`, guarda `i < 20`

Valores finales (16): **20, 22, 23, 25, 26, 28, 29, 31, 32, 34, 35, 37, 38, 40, 41, 44**.

- **El menor, 20:**
  1. P0 evalúa su guarda con `i = 1` (pasa) y se queda ahí.
  2. P1 hace tres vueltas completas: 1 → 4 → 7 → 10.
  3. P0 hace su cuerpo pendiente: 10·2 = **20**.
  4. P1 evalúa la guarda (20 < 20 es falso) y termina. P0 también la evalúa, falla y termina. Final 20.
- **El mayor, 44:** se llega a 19 (1 → +3 = 4 → ·2 = 8 → ·2 = 16 → +3 = 19). Con `i = 19` evalúan la guarda los dos. Después P1 hace 19+3 = 22 y P0 hace 22·2 = **44**. Las guardas siguientes fallan.

> Método general para "todos los valores":
> 1. El último valor que pasa alguna guarda es `x < L`.
> 2. Después de eso, cada proceso que pasó la guarda con un valor `< L` puede aplicar **un** cuerpo más, en cualquier orden.
> 3. Hay que enumerar los `x` alcanzables y qué combinación de "cuerpos pendientes" puede quedar.

---

## Ejercicio 6

### a) dbmap

Primero los bloques de **metadatos** 0–5: van **ocupados**. Después, **sólo los i-nodos con bit 1 en el ibmap**: 0, 1, 3, 5 y 6. Los i-nodos 2, 4 y 7 están libres, así que sus `addrs` son basura y no cuentan.

Bloques usados por cada i-nodo = ⌈size / 512⌉:

| i-nodo | size | bloques | ¿usa ind? | ocupa |
|---|---|---|---|---|
| 0 | 64 | 1 | no | 6 |
| 1 | 4097 | **9** (8 directos + 1) | **sí**: el bloque 15 **y** su entrada [0] = 16 | 7–14, **15**, **16** |
| 3 | 1024 | 2 | no | 21, 20 |
| 5 | 0 | 0 | no | — (basura) |
| 6 | 5000 | **10** | sí: el bloque 19 y sus entradas [0], [1] = 22, 24 | 25, 26, 27, 29, 30, 31, 17, 18, **19**, 22, 24 |

| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | **0** | 1 | 1 | 1 | 1 | **0** | 1 | 1 | 1 |

Trampas:

- **El bloque indirecto ocupa un bloque**: 15 y 19 van en 1.
- Del indirecto sólo cuentan las entradas que hacen falta. Del 15 sólo `[0]`: el 3 y el 30 de `[1..3]` son basura.
- `size = 0`: no ocupa nada.
- `size = 4097` necesita **9** bloques: 4097 / 512 = 8.002, que se redondea para arriba.
- El i-nodo 7 apunta al 16, pero está libre. El 16 igual está ocupado, porque lo usa el indirecto del i-nodo 1.
- El 23 y el 28 aparecen en la basura del i-nodo 3 (posiciones 3 y `ind`), pero como `size = 1024` sólo usa 2 bloques, quedan **libres**.

### b) Tamaño máximo

- Un bloque indirecto guarda 512 / 4 = **128** índices.
- Máximo: (8 + 128) · 512 B = **69632 B = 68 KiB**.
- Con un doble indirecto: (8 + 128 + 128²) · 512 = 8458240 B = **8260 KiB ≈ 8.07 MiB**.

---

## Ejercicio 7 — V/F

| | | Justificación |
|---|---|---|
| a | **F** | Al hijo le devuelve **0**. El PID del padre lo da `getppid()`. Al padre le devuelve el PID del hijo. |
| b | **V** | `exec` reemplaza el espacio de direcciones, pero la tabla de fds se conserva (salvo `O_CLOEXEC`). Por eso funciona la redirección `fork → close/dup → exec`. |
| c | **F** | Con un solo hilo no se puede estar en más de un núcleo a la vez, así que cputime ≤ walltime, salvo ruido de medición. cputime > walltime es señal de **multihilo**. |
| d | **F** | Mejora el T<sub>response</sub>. El turnaround **empeora**, porque estira a todos, y encima suma overhead de context switch. |
| e | **F** | Normalmente devuelve el bloque a la free-list del allocator, en espacio de usuario. Sólo a veces devuelve memoria al SO (`munmap` o achicar con `brk`). |
| f | **V** | 1024 entradas · 4 B = 4096 B = un marco. |
| g | **F** | Un TLB miss hace un *page walk*. Si la PTE está presente, se llena la TLB y listo. El page fault ocurre sólo si la entrada no es válida, no está presente o no tiene permiso. |
| h | **V** | Cada proceso tiene su propia tabla de páginas (su propio CR3/satp). Es la base de la virtualización de memoria. |
| i | **V** | Con el doble de procesos que de núcleos, cada uno recibe la mitad de CPU: el walltime se duplica y el cputime (trabajo real) es el mismo. |
