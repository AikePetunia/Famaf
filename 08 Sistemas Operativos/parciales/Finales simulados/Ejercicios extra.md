# Sistemas Operativos — Ejercicios extra

> Temas de los prácticos que no entraron en los 4 finales simulados, y una variante del dbmap del P2 2026 con **doble indirecto**.
> Solución: [[Ejercicios extra - solucion]]

---

## Ejercicio X1 — dbmap con doble indirecto

Se borró el **dbmap**. Disco de 32 bloques de **512 bytes**, índices de bloque de 32 bits, todos los índices empiezan en 0 y en los bitmaps 1 = ocupado, 0 = libre. El dbmap tiene un bit por cada bloque del disco.

| bloque | 0 | 1 | 2–4 | 5 | 6 | 7–8 | 9–31 |
|---|---|---|---|---|---|---|---|
| contenido | boot | superbloque | kernel image | ibmap | dbmap | tabla de i-nodos | datos |

Cada i-nodo tiene `size`, **8 bloques directos** y **1 puntero a bloque doble indirecto** (`dind`). No hay indirecto simple.

**i-node table**

| #inode | size | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | dind |
|---|---|---|---|---|---|---|---|---|---|---|
| 0 | 96 | 9 | 30 | 30 | 30 | 30 | 30 | 30 | 30 | 0 |
| 1 | 4600 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 |
| 2 | 4600 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 |
| 3 | 1 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 |
| 4 | 0 | 30 | 31 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 5 | 2000 | 22 | 23 | 25 | 26 | 30 | 31 | 0 | 0 | 24 |
| 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 7 | 0 | 27 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 28 |

**ibmap**

| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| 1 | 0 | 1 | 1 | 0 | 1 | 0 | 1 |

**Contenido de algunos bloques** (primeras entradas, índices de 32 bits)

| bloque | [0] | [1] | [2] |
|---|---|---|---|
| 18 | 19 | 27 | 28 |
| 19 | 20 | 29 | 0 |

a) Reconstruir el dbmap (32 bits).

b) Tamaño máximo de archivo en este sistema de archivos.

c) ¿Cuántos bloques del disco (datos + índices) ocupa un archivo de exactamente 100 KiB?

---

## Ejercicio X2 — Políticas de ajuste

Memoria contigua con huecos libres, en orden de dirección: **8, 15, 6, 22, 11, 9, 18, 5 KiB**. Llegan, en este orden, pedidos de **9, 12, 5 y 16 KiB**. Al satisfacer un pedido, lo que sobra del hueco queda como hueco en el mismo lugar.

Para cada política, ¿qué hueco toma cada pedido? ¿Alguno no se puede satisfacer?

a) First fit
b) Best fit
c) Worst fit
d) Next fit (la búsqueda arranca en el hueco donde se hizo la última asignación)

---

## Ejercicio X3 — TLB

Una TLB tarda 2 ns en una búsqueda y la memoria principal tarda 80 ns. La tasa de aciertos de la TLB es del 98 %.

a) Tiempo promedio de un acceso a memoria con paginación i386 de 2 niveles.

b) Lo mismo con paginación x86-64 de 4 niveles.

c) Con 2 niveles, ¿qué tasa de aciertos hace falta para que el tiempo promedio sea menor a 84 ns?

---

## Ejercicio X4 — Base + bounds y segmentación

**a)** Mostrar la secuencia de accesos a memoria **física** al ejecutar este código x86-32, con `base = 8192` y `bounds = 1024` (cada instrucción se lee con un solo acceso):

```
 0: movl $512, %ebx
 5: movl (%ebx), %eax
 8: shll $1, %ebx
10: movl (%ebx), %eax
13: retq
```

**b)** Un proceso tiene 64 KiB (65536 B) de espacio de direcciones, dividido en páginas. Una página no puede mezclar segmentos de distinto tipo. El programa tiene: código de **20000 B**, heap de **24600 B** y stack de **12300 B**. ¿Entra en el espacio de direcciones con páginas de 4 KiB? ¿Y con páginas de 8 KiB?

---

## Ejercicio X5 — Variables de condición

Productor/consumidor con buffer de 1 lugar (`count` es 0 o 1). `put()` hace `count = 1` y `get()` hace `assert(count == 1); count = 0`.

```c
 7  void *producer(void *arg) {           17  void *consumer(void *arg) {
 8    for (int i = 0; i < loops; i++) {   18    for (int i = 0; i < loops; i++) {
 9      mutex_lock(&mutex);               19      mutex_lock(&mutex);
10      if (count == 1)                   20      if (count == 0)
11        cond_wait(&empty, &mutex);      21        cond_wait(&fill, &mutex);
12      put(i);                           22      int tmp = get();
13      cond_signal(&fill);               23      cond_signal(&empty);
14      mutex_unlock(&mutex);             24      mutex_unlock(&mutex);
15    }                                   25      printf("%d\n", tmp);
16  }                                     26    }
                                          27  }
```

Con un productor P y dos consumidores C1 y C2, dar una secuencia de líneas (indicando qué hilo ejecuta cada una) que termine en una condición no deseada. Explicar qué la causa y cómo se arregla.

---

## Ejercicio X6 — Políticas por lote e interactivas

Procesos CPU-bound puros, 1 núcleo:

| Proceso | T<sub>arrival</sub> | T<sub>CPU</sub> |
|---|---|---|
| A | 0 | 8 |
| B | 1 | 4 |
| C | 2 | 2 |
| D | 3 | 5 |

Dibujar la línea de tiempo y calcular el T<sub>turnaround</sub> y el T<sub>response</sub> promedio para **FCFS**, **SJF** (no apropiativo), **STCF** y **RR (Q = 2)**. En RR, si en el mismo instante llega un proceso y otro agota su quantum, el que llega se encola primero.
