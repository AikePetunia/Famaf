# Finales simulados — Sistemas Operativos (final 3/12/2026)

Cada final tiene su enunciado limpio (sin pistas) y la solución en un archivo aparte. Hacelo con reloj (3 h), corregilo con la solución y anotá en qué fallaste.

| Final | Enunciado | Solución | Estilo |
|---|---|---|---|
| 1 | [[Final simulado 1]] | [[Final simulado 1 - solucion]] | Calcado de los parciales 2026 |
| 2 | [[Final simulado 2]] | [[Final simulado 2 - solucion]] | Parciales 2025 con vueltas de tuerca |
| 3 | [[Final simulado 3]] | [[Final simulado 3 - solucion]] | Mixto: inversos, MLFQ, tamaños de FS |
| 4 | [[Final simulado 4]] | [[Final simulado 4 - solucion]] | Finales 2021–2024: trazas, spinlocks, create |
| + | [[Ejercicios extra]] | [[Ejercicios extra - solucion]] | dbmap con **doble indirecto** + kernel image (como el P2 2026), ajustes first/best/worst/next, TLB, base+bounds, segmentación, variables de condición, FCFS/SJF/STCF/RR |

Orden sugerido: 1 → 2 → 3 → 4, y después los finales reales de `parciales/Finales/` (sobre todo 2023-12-07 y 2024-02-09).

---

## Mapa de temas

| Tema | F1 | F2 | F3 | F4 | Parcial/final real parecido |
|---|---|---|---|---|---|
| fork + salidas posibles (wait / sin wait) | Ej1 | | Ej1 | | P1 2026 Ej1 |
| fork + exec + argv | | | | Ej1 | Final 2021-12, 2023-12 |
| close / dup / tabla de fds por argc | | Ej1 | | | P1 2025 Ej1, Final 2024-02 Ej1 |
| walltime / cputime (HT, multihilo, IO) | V/F | Ej2 | | | P1 2024 Ej1, Práctico 1 Ej1-3 |
| malloc / free: completar fotos | Ej2 | | | | P1 2024 Ej2 / P1 2026 Ej2 |
| malloc / free: deducir operaciones | | | Ej2 | | P1 2025 Ej2 |
| Paginación i386: traducir + inverso + permisos | Ej3 | | Ej3 | Ej2 | P1 2024 Ej4-5 |
| Paginación RISC-V + RAM mín/máx de tablas | | Ej3 | | | P1 2025 Ej4-5, Final 2023-12 |
| Ahorrar memoria compartiendo tablas | | | Ej3 | | Final 2024-02 Ej2 |
| Traza de accesos físicos + TLB | | | | Ej2 | Final 2023-12 Ej3, Práctico 2 Ej4 |
| RR multinúcleo + HDD FIFO | Ej4 | | | Ej3 | P1 2026 Ej4, P1 2024/2025 Ej3 |
| MLFQ | | | Ej4 | | Práctico 1 Ej17 |
| "Todos los valores finales" de `i` | Ej5 | | Ej5 | | P2 2026 Ej1, P2 2025 Ej3 |
| Semáforos para el valor máximo | | | Ej5 | | P2 2025 Ej4 |
| Arreglo compartido con índices distintos | | Ej4 | | Ej4 | P2 2026 Ej2, P2 2022/2023 |
| Deadlock con sólo `down` | | Ej5 | | | P2 2025 Ej1 |
| Región crítica rota + arreglo in situ | | Ej5 | | Ej5 | P2 2025 Ej2, Final 2022-02 Ej4 |
| Spinlock / test-and-set / Simple Flag | V/F | V/F | | Ej5 | P2 2026 Ej3, P2 2023 Ej2 |
| Reconstruir dbmap (con indirecto y metadatos) | Ej6 | | | | P2 2026 Ej4, P2 2025 Ej5 |
| Tamaño máx. de archivo (mixto de indirectos) | Ej6 | | Ej6 | | P2 2023 Ej5, P2 2022 Ej5 |
| i-bmap / d-bmap / inode table / data region | | | Ej6 | | Final 2023-12 Ej6, 2024-02 Ej6 |
| HDD: permutación disco ↔ velocidad | | Ej6 | | | P2 2025 Ej6 |
| HDD: precio / conveniencia | | Ej6 | | | P2 2023 Ej4, Final 2024-02 Ej5 |
| HDD: vuelta, MiB por pista, random | | | | Ej6 | P2 2022 Ej4, Final 2022-02 Ej5 |
| Cuadro create /foo/bar + write + read | | | | Ej6 | Final 2023-12 Ej5 |
| Verdadero / Falso | Ej7 | Ej7 | Ej7 | Ej7 | Prácticos (V/F de cada guía) |

---

## Convenciones que usan los ejercicios (las mismas que la cátedra)

- **Heap OSTEP cap. 17:**
  - el header ocupa **8 bytes**; `malloc(n)` devuelve `header + 8`;
  - el sobrante queda en `header + 8 + n`, con `size = S − n − 8`;
  - `free(p)` mete el bloque `p − 8` **al principio** de la free-list.
- **Atomicidad línea a línea:** la guarda del `while` es una acción y cada línea del cuerpo es otra.
- **HDD:** T = seek + ½ vuelta + tamaño/transferencia y R = tamaño/T. En la tabla de la cátedra (P2 2025) 1 MB = 1000 KB.
- **Round Robin:** si en el mismo instante alguien llega y otro agota su quantum, el que llega se encola primero. (Cada enunciado lo vuelve a aclarar.)

## Un error en tu resolución del P1 2025

En `Parcial 1 2025-10-09 (Trabajadores) rta.md`, Ej 2, usaste un header de **12 bytes** (Foto 0 con `size = 4084`), y las sumas no cierran: "16384 + 12 = malloc(100) (16496)", pero 16384 + 12 = 16396.

El enunciado del P1 2024 dice explícitamente que la estructura ocupa **8 bytes**: `16392 = malloc(100)`, `16500 = malloc(100)`, etc.

Rehacelo con 8 bytes. El Ej 2 del Final 1 y el del Final 3 practican exactamente eso.
