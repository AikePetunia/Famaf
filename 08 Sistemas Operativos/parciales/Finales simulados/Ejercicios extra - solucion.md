# Ejercicios extra — Solución

> Enunciado: [[Ejercicios extra]]. El dbmap, las políticas de ajuste y el RR se calcularon con scripts.

---

## X1 — dbmap con doble indirecto

- Un bloque guarda 512 / 4 = **128** índices.
- Un archivo de más de 8 bloques usa el **bloque dind**. Las entradas del dind apuntan a bloques **de nivel 1**, y las entradas de esos apuntan a los datos.
- Por cada archivo así se ocupan: el bloque dind, ⌈(n−8)/128⌉ bloques de nivel 1 y los n−8 bloques de datos.

Sólo cuentan los i-nodos con bit 1 en el ibmap: **0, 2, 3, 5 y 7**. El 1 está libre: es basura idéntica al 2, y no cambia nada porque el 2 sí está usado.

| i-nodo | size | n = ⌈size/512⌉ | ocupa |
|---|---|---|---|
| 0 | 96 | 1 | 9 |
| 2 | 4600 | **9** (4600/512 = 8.98) | 10–17 (directos) + **18** (dind) + **19** (nivel 1: 18[0]) + **20** (dato: 19[0]) |
| 3 | 1 | 1 | 21 |
| 5 | 2000 | 4 | 22, 23, 25, 26 (el `dind = 24` es basura: no hace falta) |
| 7 | 0 | 0 | — |

Más los metadatos 0–8: boot, superbloque, **kernel image (2–4)**, ibmap, dbmap y tabla de i-nodos.

| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | **0** | 1 | 1 | **0** | **0** | **0** | **0** | **0** |

Trampas:

- 18[1] y 18[2] (27 y 28), y 19[1] (29), son basura: con 9 bloques sólo hace falta **un** dato por el doble indirecto.
- El i-nodo 5 tiene `dind = 24` pero usa 4 bloques, así que el 24 está **libre**.
- El 30 y el 31 aparecen en i-nodos libres o en posiciones que no se usan.

### b)

(8 + 128²) · 512 = 16392 · 512 = **8392704 B = 8196 KiB ≈ 8.004 MiB**.

### c) 100 KiB = 200 bloques de datos

- 8 van por directos.
- 192 van por el doble indirecto: hacen falta ⌈192/128⌉ = 2 bloques de nivel 1, más el dind.
- Total: 200 + 1 + 2 = **203 bloques**.

---

## X2 — Políticas de ajuste

Huecos: `#0=8, #1=15, #2=6, #3=22, #4=11, #5=9, #6=18, #7=5`.

| Pedido | First fit | Best fit | Worst fit | Next fit |
|---|---|---|---|---|
| 9 | #1 (15 → 6) | **#5 (9 → 0)** | #3 (22 → 13) | #1 (15 → 6) |
| 12 | #3 (22 → 10) | #1 (15 → 3) | #6 (18 → 6) | #3 (22 → 10) |
| 5 | #0 (8 → 3) | **#7 (5 → 0)** | #1 (15 → 10) | #3 (10 → 5): sigue desde el último |
| 16 | #6 (18 → 2) | #6 (18 → 2) | **✗ no entra**: el mayor hueco es 13 | #6 (18 → 2) |

- **Worst fit** rompe los huecos grandes y termina sin lugar para el pedido de 16.
- **Best fit** deja huecos de 0 (perfectos) y de 2–3 (inútiles).
- First y next fit difieren en el pedido de 5: first vuelve a mirar desde el principio y toma el #0; next sigue en el #3.

---

## X3 — TLB

- **Hit:** se busca en la TLB y se hace el acceso: 2 + 80 = 82 ns.
- **Miss:** se busca en la TLB, se recorren los niveles de la tabla (un acceso por nivel) y se hace el acceso.

### a) i386, 2 niveles

- Miss: 2 + 2·80 + 80 = 242 ns.
- EAT = 0.98 · 82 + 0.02 · 242 = 80.36 + 4.84 = **85.2 ns**.

### b) x86-64, 4 niveles

- Miss: 2 + 4·80 + 80 = 402 ns.
- EAT = 80.36 + 0.02 · 402 = **88.4 ns**.

### c)

- EAT = 82 + (1−h) · 160 < 84, o sea (1−h) < 0.0125.
- Hace falta **h > 98.75 %**.

---

## X4

### a) Base + bounds

El chequeo es `virtual < bounds` y después `física = base + virtual`.

| Instrucción | Accesos físicos |
|---|---|
| fetch 0 | R 8192 |
| fetch 5 | R 8197 |
| load `(%ebx)` = 512 | 512 < 1024 ✓, así que R **8704** |
| fetch 8 | R 8200 (`shll` no accede a memoria: ebx = 1024) |
| fetch 10 | R 8202 |
| load `(%ebx)` = 1024 | 1024 ≥ bounds: **excepción** (fuera de límites). El SO mata el proceso y `retq` no se ejecuta. |

### b) Segmentación en páginas

- **Páginas de 4 KiB** (16 páginas):
  - código ⌈20000/4096⌉ = 5;
  - heap ⌈24600/4096⌉ = 7;
  - stack ⌈12300/4096⌉ = 4;
  - total 16 = 16: **entra, justo**.
- **Páginas de 8 KiB** (8 páginas):
  - código ⌈20000/8192⌉ = 3;
  - heap ⌈24600/8192⌉ = 4;
  - stack ⌈12300/8192⌉ = 2;
  - total 9 > 8: **no entra**.

Con páginas más grandes hay más **fragmentación interna** en la última página de cada segmento.

---

## X5 — Variables de condición (Mesa)

```
C1: 19 20 21          (count==0 → duerme en fill, suelta el mutex)
P : 9 10 12 13 14     (put: count=1; signal(fill) → C1 pasa a listo, pero todavía no corre)
C2: 19 20 22 23 24    (C2 toma el mutex antes que C1: count==1 → get(), count=0)
C1: (vuelve de 21 con el mutex) 22  → get() con count==0 → assert falla
```

**Causa:** con semántica **Mesa**, `signal` sólo pasa al hilo a *listo*. Para cuando corre, la condición puede haber cambiado (acá C2 "le robó" el dato). Con `if`, C1 no la vuelve a chequear.

**Arreglo:** `while (count == 0)` y `while (count == 1)`.

Además, con **una sola** variable de condición, un consumidor podría despertar a otro consumidor en lugar del productor, y se dormirían todos. Por eso se usan **dos**, `empty` y `fill`, como en este código.

---

## X6 — FCFS, SJF, STCF y RR

**FCFS:** `A 0–8 | B 8–12 | C 12–14 | D 14–19`

- T<sub>turnaround</sub>: 8, 11, 12, 16, promedio **11.75**.
- T<sub>response</sub>: 0, 7, 10, 11, promedio **7**.

**SJF (no apropiativo):** en t=0 sólo está A, así que `A 0–8 | C 8–10 | B 10–14 | D 14–19`.

- T<sub>turnaround</sub>: A 8, B 13, C 8, D 16, promedio **11.25**.
- T<sub>response</sub>: 0, 9, 6, 11, promedio **6.5**.

**STCF:** `A 0–1 | B 1–2 | C 2–4 | B 4–7 | D 7–12 | A 12–19`

- En t=1 B (4) le gana a lo que le queda a A (7).
- En t=2 C (2) le gana a lo que le queda a B (3).
- En t=3 D (5) no le gana a C (1).
- T<sub>turnaround</sub>: A 19, B 6, C 2, D 9, promedio **9**.
- T<sub>response</sub>: 0, 0, 0, 4, promedio **1**.

**RR Q=2:** `A A B B C C A A D D B B A A D D A A D` (t = 0…18)

- T<sub>turnaround</sub>: A 18, B 11, C 4, D 16, promedio **12.25**.
- T<sub>response</sub>: 0, 1, 2, 5, promedio **2**.

Conclusión: STCF da el mejor turnaround. RR y STCF dan buena respuesta, pero RR tiene el peor turnaround. SJF sin desalojo queda trabado detrás de A, que es largo y llegó primero: es el *convoy effect*.
