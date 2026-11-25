# Final simulado 2 — Solución

> Enunciado: [[Final simulado 2]]. El programa del Ej 1 se compiló y se corrió para argc = 1…7. Las cuentas de los demás ejercicios se hicieron con scripts.

---

## Ejercicio 1

Al arrancar: 0 = stdin, 1 = stdout y 2 = stderr (los tres a la consola), y `fd = 3` = test.txt.
`dup(fd)` siempre duplica el **3** y elige el fd libre **más bajo**, que es justo el que se acaba de cerrar.

| iteración | close | dup → | escribe `b` (fd 1) en | escribe `c` (fd 2) en |
|---|---|---|---|---|
| i=0 | 0 | 0 = test.txt | **consola** (1 sigue siendo stdout) | **consola** |
| i=1 | 1 | 1 = test.txt | test.txt | consola |
| i=2 | 2 | 2 = test.txt | test.txt | test.txt |
| i=3 | 0 | 0 = test.txt | test.txt | test.txt |
| i≥3 | … | … | desde acá 0, 1 y 2 son test.txt | test.txt |

| # de ./a.out | `b` consola | `c` consola | `b` test.txt | `c` test.txt | Explicación |
|---|---|---|---|---|---|
| 1 | 1 | 1 | 0 | 0 | Sólo i=0: se reemplaza stdin, que nadie usa. Las dos van a la consola. |
| 2 | 1 | 2 | 1 | 0 | En i=1, fd 1 pasa a ser el archivo: `b` va al archivo y `c` sigue en la consola. |
| 3 | 1 | 2 | 2 | 1 | En i=2, fd 2 también pasa a ser el archivo. |
| 4 | 1 | 2 | 3 | 2 | De acá en adelante, cada vuelta suma una `b` y una `c` al archivo. |
| 5 | 1 | 2 | 4 | 3 | |
| 6 | 1 | 2 | 5 | 4 | |
| 7 | 1 | 2 | 6 | 5 | |

Fórmula para argc = n ≥ 2: la consola tiene 1 `b` y 2 `c`; test.txt tiene n−1 `b` y n−2 `c`.

> Método: hacer una tabla de fds (0, 1, 2, 3, …) y actualizarla en cada vuelta: qué se cierra y dónde cae el `dup`, que siempre es el fd libre más bajo. Recién después mirar a qué fd escribe cada `write`.

---

## Ejercicio 2

Modelo:

- Con HT, dos hilos en el **mismo núcleo físico** rinden juntos ≈ 1.25 veces lo que rinde uno solo. Cada uno avanza a 0.625 de la velocidad.
- Ese dato sale de la fila N=8, que es la única con una medición completa: 2.00 / 3.2 = 0.625, y 2 · 0.625 = 1.25.
- **cputime** = tiempo que el proceso estuvo *corriendo* en un núcleo **lógico**. Si el núcleo físico rinde menos por HT, el proceso necesita **más** cputime para el mismo trabajo.

### a) `./pi`

| N | (walltime, cputime) | Por qué |
|---|---|---|
| 4 | ≈ **(2.0, 2.0)** | Un núcleo físico para cada uno. |
| 8 | ≈ **(3.2, 3.2)** | Los 8 lógicos ocupados. Cada uno corre todo el tiempo, pero a 0.625: 2 / 0.625 = 3.2. ¡El cputime **también** sube! |
| 12 | ≈ **(4.8, 3.2)** | Hay 12 procesos para 8 lógicos, así que cada uno corre 8/12 del tiempo. Walltime = 3.2 · 12/8 = 4.8. El cputime sigue en 3.2: el trabajo en un lógico no cambia. |
| 16 | ≈ **(6.4, 3.2)** | 16/8 = 2, así que walltime = 3.2 · 2 = 6.4. |

> La clave del ejercicio:
> - Sin HT, el cputime de un proceso CPU-bound queda **constante** aunque haya más procesos que núcleos.
> - Con HT, al pasar de 4 a 8 procesos el cputime **aumenta**, porque cada núcleo lógico es más lento.
> - Más allá de 8, sólo crece el walltime (por time sharing).

### b) `./dgemm` con T hilos (trabajo total = 8 s de un núcleo)

| T | (walltime, cputime) | Por qué |
|---|---|---|
| 2 | ≈ **(4.0, 8.0)** | 2 núcleos físicos. |
| 4 | ≈ **(2.0, 8.0)** | 4 físicos. |
| 8 | ≈ **(1.6, 12.8)** | Los 8 lógicos rinden 4 · 1.25 = 5 núcleos: walltime = 8/5 = 1.6. El cputime suma los 8 hilos corriendo 1.6 s cada uno, o sea 8 · 1.6 = 12.8. |
| 16 | ≈ **(1.6, 12.8)** | Ya no hay más hardware, así que el walltime no baja. Si se descuenta el overhead de cambios de contexto, todo queda igual. |

Para un proceso multihilo, **cputime = suma de los cputime de los hilos**. Por eso cputime > walltime.

### c) `./backup` (IO-bound, cuello de botella en el disco)

- **2 `./backup` en el mismo HDD:** cada uno ≈ **(20, 0.4)**, o algo más, porque el cabezal salta entre los dos archivos y se agregan seeks. El disco es un solo recurso. El cputime casi no cambia.
- **1 `./backup` + 8 `./pi`:** backup ≈ **(10, 0.4)**, quizás un poco más porque cuando su I/O termina tiene que esperar un núcleo lógico. Cada `./pi` ≈ **(3.2, 3.2)**: backup casi no usa CPU.

### d)

| Medición | Caracterización |
|---|---|
| `(12.1, 0.3)` | **IO-bound**: casi todo el tiempo bloqueado. |
| `(12.0, 11.9)` | **CPU-bound**: un núcleo propio todo el tiempo. |
| `(3.1, 11.8)` | **CPU-bound & multihilo**: cputime > walltime, ≈ 4 hilos. |

---

## Ejercicio 3

Índices:

- L2 = `(va >> 30) & 0x1FF`
- L1 = `(va >> 21) & 0x1FF`
- L0 = `(va >> 12) & 0x1FF`

Truco para leer las virtuales: `0x40000000` → L2 = 1, `0x00200000` → L1 = 1, `0x00001000` → L0 = 1.

| VA | L2, L1, L0 | Camino | Física |
|---|---|---|---|
| a) `…0000003666` | 0, 0, 3 | ACE[0]→B0B, B0B[0]→CAB, CAB[3]→DECADA `X-RV` | **`0x00000DECADA666`** |
| b) `…0040201ABC` | 1, 1, 1 | ACE[1]→ACE, ACE[1]→ACE, ACE[1]→ACE `XWRV` | **`0x00000000ACEABC`** |
| c) `…0000201010` | 0, 1, 1 | ACE[0]→B0B, B0B[1]→B0B, B0B[1]→B0B `-WRV` | **`0x00000000B0B010`** |
| d) `…0080000FFF` | 2, 0, 0 | ACE[2] es `XWR-`: V=0 | **fault en L2** |
| e) `…000003F234` | 0, 0, 0x3F | ACE[0]→B0B, B0B[0]→CAB, CAB[0x3F] no listada | **fault en L0** |
| f) `…0040000777` | 1, 0, 0 | ACE[1]→ACE, ACE[0]→B0B, B0B[0]→CAB `XWRV` | **`0x00000000CAB777`** |

### g)

La hoja de a) es `X-RV`:

- **Ejecutar:** sí (X=1).
- **Escribir:** no (W=0), da *page fault* por protección.

### h) Inverso de `0x00000000ACE123` (marco 0xACE, offset 0x123), EXT = 0 (L2 < 0x100)

Hay que buscar todos los caminos L2 → L1 → L0 válidos que terminen en una entrada que apunte a 0xACE: CAB[1], B0B[0x1FF] y ACE[1].

| L2 | L1 | L0 | hoja | VA |
|---|---|---|---|---|
| 0 | 0 | 1 | CAB[1] `--RV` | **`0x0000000000001123`** |
| 0 | 1 | 0x1FF | B0B[0x1FF] | **`0x00000000003FF123`** |
| 0 | 0x1FF | 1 | (L1 = ACE[0]→B0B[0x1FF]→ACE, L0 = ACE[1]) | **`0x000000003FE01123`** |
| 1 | 0 | 0x1FF | ACE[0]→B0B, B0B[0x1FF] | **`0x00000000401FF123`** |
| 1 | 1 | 1 | ACE[1] | **`0x0000000040201123`** |
| 1 | 0x1FF | 1 | ACE[0x1FF]→CAB, CAB[1] | **`0x000000007FE01123`** |

> Con L2 = 0x1FF aparecen dos más (`0xFFFFFFFFC0201123` y `0xFFFFFFFFFFFFF123`). Ahí el bit 38 es 1, así que EXT se llena de unos (extensión de signo).

Procedimiento: no se puede hacer "al revés" de forma directa. Hay que **recorrer el árbol desde satp** y anotar cada camino que llega al marco. Las autorreferencias (ACE[1]→ACE, B0B[1]→B0B) multiplican los caminos.

### i)

- **Mínimo para mapear una página:** una tabla por nivel, o sea 3 · 4 KiB = **12 KiB**.
  - Si sólo se pide "esquema válido" sin mapear nada: alcanza con la raíz, **4 KiB**.
- **Máximo:** raíz + 512 tablas L1 + 512² tablas L0 = 1 + 512 + 262144 = 262657 marcos.
  - 262657 · 4 KiB = 1050628 KiB ≈ **1026 MiB** (1 GiB + 2 MiB + 4 KiB).

> En i386 (10,10,12) la misma cuenta da: mínimo 8 KiB y máximo (1 + 1024) · 4 KiB = **4100 KiB ≈ 4 MiB**.

---

## Ejercicio 4

### a) Todos los finales (8)

- P0 escribe 0 en **todas** las posiciones.
- P1 sólo toca las **impares** (1, 3, 5).
- Las pares terminan en 0 siempre.
- Cada impar termina en 0, si P0 escribió último, o en **`a[j-1]+1`**, si P1 escribió último.
- Si P1 escribió **después** que P0 en la posición `j`, entonces P0 ya había escrito `a[j-1] = 0` antes (va en orden creciente y `j-1 < j`). Por eso el valor es **1**.

Resultado: cada impar ∈ {0, 1}, de forma independiente, o sea 2³ = **8** finales:

`{0,0,0,0,0,0} {0,0,0,0,0,1} {0,0,0,1,0,0} {0,0,0,1,0,1} {0,1,0,0,0,0} {0,1,0,0,0,1} {0,1,0,1,0,0} {0,1,0,1,0,1}`

### b) ¿`a[1] == 10`?

**No.** Para que quede 10, P1 tendría que hacer `a[1] = a[0] + 1` leyendo `a[0] = 9`, o sea antes de que P0 escriba `a[0]`. Pero entonces P0 todavía no escribió `a[1]`, y cuando lo haga lo **pisa** con 0.

Pasa en ejecuciones intermedias, pero nunca en el estado final.

### c) Escenario para `{0, 1, 0, 0, 0, 1}`

```
P0: 1 2 3(a0=0) 4 2 3(a1=0) 4                       i=2
P1: A B C(a1=a0+1=1) D B C(a3=a2+1=10) D            j=5
P0: 2 3(a2=0) 4 2 3(a3=0) 4 2 3(a4=0) 4 2 3(a5=0) 4 i=6
P1: B C(a5=a4+1=1) D B E                            j=7, sale
P0: 2 5                                             sale
```

### d) Semáforos para `{0,1,0,1,0,1}` siempre

Hace falta que P1 escriba cada `a[j]` (j impar) **después** de que P0 escribió `a[j]`. Así también `a[j-1]` ya es 0.

```c
// Init: s = 0
P0:                               P1:
1: i = 0;                         A: j = 1;
2: while (i < 6) {                B: while (j < 6) {
3:     a[i] = 0;                         wait(s);
       if (i % 2 == 1) post(s);   C:     a[j] = a[j-1] + 1;
4:     i = i + 1;                 D:     j = j + 2;
5: }                              E: }
```

- P0 hace 3 `post` (i = 1, 3, 5) y P1 hace 3 `wait`, así que no hay deadlock.
- P0 nunca espera: concurrencia máxima.

---

## Ejercicio 5

### a)

```
Inicialización:  s0 = 1, s1 = 1, s2 = 1
P0: down(s0); down(s1);
P1: down(s1); down(s2);
P2: down(s2); down(s0);
```

Si cada uno hace su primer `down`, todos se bloquean en el segundo. Es una **espera circular**: P0 → s1 (lo tiene P1) → s2 (lo tiene P2) → s0 (lo tiene P0).

### b) 1. Contraejemplo

El error es que **se chequea antes de levantar el flag**. Los dos pueden pasar el `while` cuando ningún flag está levantado.

```
A   (flag[1]=false → P0 pasa)
1   (flag[0]=false → P1 pasa)
B C D      P0 en la CS
2 3 4      P1 en la CS  → ¡los dos adentro!
```

Son 8 pasos: cada uno tiene que hacer 4 para llegar a su CS, así que no hay una más corta.

### b) 2. Arreglo in situ

Mover el `while` **después** de `flag` y `turn`. Queda **Peterson**:

| | |
|---|---|
| `B: flag[0] = true;` | `2: flag[1] = true;` |
| `C: turn = 1;` | `3: turn = 0;` |
| `A: while (flag[1] && turn == 1);` | `1: while (flag[0] && turn == 0);` |
| `D: -CS-` | `4: -CS-` |
| `E: flag[0] = false;` | `5: flag[1] = false;` |

---

## Ejercicio 6

Fórmula de la cátedra:

- T = T<sub>seek</sub> + T<sub>rot</sub>/2 + tamaño / R<sub>max</sub>
- R<sub>I/O</sub> = tamaño / T
- T<sub>rot</sub>/2 = 60000 / RPM / 2 ms

### a)

| Disco | rot/2 | T(4 KB) | random 4 KB | T(1 MB) | sec 1 MB | # |
|---|---|---|---|---|---|---|
| Laptop 2.5" | 5.556 ms | 17.589 ms | 227.42 KB/s | 25.889 ms | 38.63 MB/s | **3** |
| WD Gold | 4.167 ms | 8.681 ms | 460.75 KB/s | 12.370 ms | 80.84 MB/s | **2** |
| Cheetah | 3.000 ms | 6.824 ms | 586.21 KB/s | 12.682 ms | 78.85 MB/s | **0** |
| Mini 1.8" | 8.333 ms | 23.467 ms | 170.45 KB/s | 56.667 ms | 17.65 MB/s | **1** |

> Trampa: el **Cheetah** gana en random (rota más rápido y tiene menos seek), pero el **WD Gold** gana en 1 MB porque su transferencia pico es mucho mayor. En bloques chicos manda el seek + rotación. En bloques grandes manda la transferencia.

### b)

Bloques de **1 MiB**:

| Disco | T | R<sub>I/O</sub> | Precio | R/precio |
|---|---|---|---|---|
| Base (7200, 8.5 ms, 220) | 8.5 + 4.167 + 4.545 = 17.212 ms | 58.10 MiB/s | 80 | **0.726** |
| UpRPM (14400, 8.5 ms, 440) | 8.5 + 2.083 + 2.273 = 12.856 ms | 77.78 MiB/s | 120 | 0.648 |
| DownSeek (7200, 4.25 ms, 220) | 4.25 + 4.167 + 4.545 = 12.962 ms | 77.15 MiB/s | 110 | 0.701 |

Orden con 1 MiB: **#1 Base, #2 DownSeek, #3 UpRPM**.

Bloques de **4 KiB**:

| Disco | R<sub>I/O</sub> | R/precio |
|---|---|---|
| Base | 315.35 KiB/s | 3.94 |
| UpRPM | 377.64 KiB/s | 3.15 |
| DownSeek | 474.25 KiB/s | **4.31** |

Orden con 4 KiB: **#1 DownSeek, #2 Base, #3 UpRPM**.

Conclusión: duplicar las RPM "parece" duplicar todo, pero **el seek no cambia**. Con bloques al azar el seek domina, así que la mejora de UpRPM es chica para lo que cuesta.

---

## Ejercicio 7 — V/F

| | | |
|---|---|---|
| a | **V** | Con atomicidad línea a línea, `x = x + 1` es **una** acción atómica: no se puede intercalar a la mitad. Distinto sería si estuviera partido en `a = x; a = a + 1; x = a;` (o en LDUR/ADD/STUR), y ahí podría dar 1. |
| b | **F** | Da exclusión mutua, pero **no es justo**: un hilo puede perder siempre la carrera (starvation). Para ser justo hace falta algo como el ticket lock (fetch-and-add). |
| c | **F** | El hardware y el compilador pueden reordenar loads y stores. Peterson asume consistencia secuencial y necesita barreras (fences). |
| d | **V** | Un semáforo binario: `wait` = lock y `post` = unlock. |
| e | **V** | Rompe la condición de **espera circular**, que es una de las 4 de Coffman. |
| f | **V** | Una vez posicionado, el secuencial sólo paga la transferencia. El aleatorio paga seek + rotación en cada pedido. |
| g | **F** | `rm` hace `unlink`: borra la entrada del directorio y decrementa el link count. El i-nodo se libera recién cuando el count llega a 0 **y** ningún proceso lo tiene abierto. |
| h | **F** | Actualiza el **atime** (fecha de último acceso) en el i-nodo, que después se escribe al disco, salvo que se monte con `noatime`. |
| i | **V** | En promedio se desperdicia medio bloque por archivo. Bloques más grandes desperdician más. |
