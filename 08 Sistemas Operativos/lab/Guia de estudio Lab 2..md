# Guía de estudio — Parcialito Lab 2 (Semáforos en XV6) · 2026

Esta guía resume **qué estudiar** para el parcialito de opción múltiple. Indica temas, fuentes y checklist. Si entendés estos puntos con tus propias palabras (y podés explicarlos con un ejemplo), estás en condiciones de responder.

---

## 1. De dónde sale el contenido

Hay **7 clases** con filminas publicadas en el **aula virtual**, más el enunciado y la bibliografía.

| Fuente | Qué cubre |
|--------|-----------|
| **Enunciado del Lab 2** (aula virtual) | Spec de las 4 syscalls, políticas, `pingpong`, `prodcons`, ayudas de kernel |
| **7 filminas de clase** (aula virtual) | Todo el recorrido del lab (detalle en la tabla de abajo) |
| **Bibliografía del enunciado** | OSTEP, Silberschatz, Tanenbaum, POSIX, libro xv6 |

El examen mezcla preguntas **más directas** (API del lab, `pingpong`, políticas) con otras **más profundas** (razones de diseño, OSTEP/POSIX/xv6 book, productor–consumidor, mutex, pipes).

---

## 2. Las 7 clases (filminas) → temas de examen

Las filminas están en el **aula virtual** del curso (sección del Lab 2 / clases). Buscá por número o título:

| Clase | Título de las filminas                 | Temas que suelen aparecer                                                                              |
| ----: | -------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| **1** | Vistazo al lab e introducción a xv6    | Kernel vs usuario; 4 syscalls; `pingpong`/`prodcons` como programas de usuario                         |
| **2** | Carreras, semáforos y syscalls         | Race conditions; busy-wait vs sleep; down/up; nombrados; anatomía de syscalls; `argint`                |
| **3** | El kernel completo y pingpong          | `sleep`/`wakeup`; tabla de semáforos; `sem_down`/`sem_up`; diseño de pingpong                          |
| **4** | Cierre de pingpong y debugging         | Invariantes; `while` no `if`; validación bajo lock; síntoma→causa; `semtest`; `wait`; ids globales     |
| **5** | Post-intermedia y arranque de prodcons | Buffer acotado; `empty=B`, `full=0`; protocolo base `prodcons B N`                                     |
| **6** | Varios productores y consumidores      | Por qué 1P+1C sin mutex; carrera en `in`; mutex; analogía con **pipes** / `pipe.c`                     |
| **7** | Entrega final y cierre                 | Invariantes que miran los tests de prodcons; ids no fijos; estrella P/C + orden mutex; repaso del lab! |

**Prioridad para el parcialito:** clases **2, 3, 4, 5, 6** (contenido conceptual). La **1** da el marco; la **7** refuerza invariantes de prodcons, ids globales y el protocolo multi P/C (aunque también hable de video/entrega).

---

## 3. Bloque A — Contenido “del laboratorio” (prioridad alta)

Estudiá esto **primero**: enunciado + clases 1–4. Base de la bolsa más directa.

### 3.1 Qué son los semáforos del lab

- Semáforos **nombrados**, administrados por el **kernel**, globales a todos los procesos.
- El “nombre” es un **entero** (en el lab: **1..64**; el **0** se reserva porque el retorno **0 = error**).
- Son **contadores** (no solo 0/1): el valor puede **crecer** con `sem_up` por encima del valor de `sem_open` (salvo el tope `SEM_VALUE_MAX`).

**Preguntate:** ¿por qué “nombrados”? ¿qué pasaría si dos programas usan el mismo id?

### 3.2 Las cuatro syscalls (saber de memoria el efecto)

| Syscall | Idea | Retorno éxito / error |
|---------|------|------------------------|
| `sem_open(sem, value)` | Abre e inicializa si no estaba abierto | id / **0** |
| `sem_close(sem)` | Cierra; valor a 0; despierta waiters | id / **0** |
| `sem_down(sem)` | Si valor > 0: decrementa; si 0: **bloquea** | id / **0** |
| `sem_up(sem)` | Incrementa; si había gente dormida: **despierta** | id / **0** |

**Políticas fijas del enunciado 2026 (no inventar otras):**

1. **Doble `sem_open`** del mismo id ya abierto → **error**.
2. **`sem_close` con procesos en `sem_down`** → **permitido**; hace `wakeup`; esos downs deben **fallar** (retornar 0).
3. **`sem_up` por encima del valor inicial** → **permitido** (necesario para `prodcons`).
4. Reabrir un id **cerrado** → `sem_open` válido otra vez.
5. Valor del semáforo **nunca < 0**.

Tabla de errores típicos (repaso clase 4):

| Syscall | Error (retorna 0) |
|---------|-------------------|
| `sem_open` | id fuera de 1..64; ya abierto; `value < 0` |
| `sem_close` | id no abierto |
| `sem_down` | no abierto; **cerrado mientras esperaba** |
| `sem_up` | no abierto; llegó a `SEM_VALUE_MAX` |

### 3.3 Primitivas del kernel de xv6

| Función | Rol en el lab |
|---------|----------------|
| `acquire` / `release` | Exclusión mutua al tocar la estructura del semáforo (spinlock) |
| `sleep(chan, lk)` | Bloquear el proceso cuando no hay “ficha” (`value == 0`) |
| `wakeup(chan)` | Despertar a quienes dormían en ese canal |
| `argint` | Leer argumentos enteros de la syscall desde usuario |

**Importante:** `acquire`/`release` **no reemplazan** a `sleep`/`wakeup`. Los locks protegen datos; sleep/wakeup implementan la **espera** del semáforo.

Inspiración del enunciado (y de la **clase 6**): `pipewrite` / `piperead` en `kernel/pipe.c`.

### 3.4 Invariantes del kernel (clase 4 — memorizar)

Las filminas de la clase 4 resumen cinco invariantes que aparecen mucho en el parcialito:

1. **`value` nunca negativo** — esperar es **dormir**, no dejar el contador en −1.
2. **`sem_close`** marca cerrado y hace **`wakeup`**; quienes esperaban deben **devolver 0**.
3. **`sem_up` sin tope** en el valor inicial (solo falla en `SEM_VALUE_MAX`).
4. Todo se toca con el **lock del semáforo tomado** — **incluida la validación** (si validás fuera del lock, puede andar con 1 proceso y fallar con varios).
5. `sleep(...)` va **adentro de un `while`**, nunca de un solo `if` (al despertar hay que rechequear).

### 3.5 Programa `pingpong`

- **Un solo `fork`** → dos procesos: uno imprime ping, el otro pong.
- Siempre empieza en **ping**; **nunca** dos ping seguidos ni dos pong seguidos.
- Con `N`: **2N** líneas.
- Típicamente **dos semáforos**, inicialización estilo **1 y 0** para que empiece ping.
- Al terminar: **`sem_close`**; en foreground el prompt vuelve cuando terminó → hace falta **`wait`** (si no, el prompt vuelve antes).
- Errores de usuario: mensaje que **empieza con `ERROR`**.
- Ids **globales**: varias instancias en paralelo con los mismos ids **se pisan** (falla el test de concurrencia si hardcodeás ids fijos).

### 3.6 Debugging: síntoma → causa (clase 4)

Útil para razonar preguntas del estilo “qué pasa si…”.

**Kernel**

| Síntoma | Causa probable |
|---------|----------------|
| QEMU se cuelga | `sem_down` sin su `sem_up`; o `sleep` con el lock/canal equivocado |
| `panic: acquire` | tomaron el mismo lock dos veces |
| `panic: sched locks` | se durmieron dejando un spinlock tomado mal |
| Todo devuelve 0 siempre | stubs sin reemplazar |
| Anda con 1 proceso, falla con varios | validación **fuera** del lock |

**pingpong**

| Síntoma | Causa probable |
|---------|----------------|
| Empieza con pong | valores iniciales **invertidos** |
| A veces dos ping seguidos | `if` en lugar de `while` (carrera al despertar) |
| Anda solo, falla concurrencia | ids hardcodeados (globales) |
| Se cuelga con N grande | falta un `sem_up` en algún camino |
| Sale bien pero el prompt no vuelve | falta `wait` |

**Qué miran los tests `semtest`** (para entender políticas, no para rendir el grader):

| Test | Idea |
|------|------|
| `noinit` | usar un semáforo que nunca se abrió |
| `init` | el valor inicial es el pedido |
| `closeuse` | usar uno ya cerrado |
| `exhaust` | quedarse sin ids y reusar tras cerrar |
| `grow` | `sem_up` pasa el valor inicial |
| `reopen` | cerrar y volver a abrir el mismo id |

### 3.7 Estilo xv6 y organización del código

- Validar argumentos en el kernel (`sys_sem_*`), preferentemente **bajo el lock**.
- Fallar limpio si el semáforo **no está abierto**.
- Estilo xv6: nombres cortos, archivos con responsabilidad clara (no meter semáforos en `sysfile.c`), mayúsculas para macros/constantes.

---

## 4. Bloque B — Productor–consumidor (clases 5 y 6)

### 4.1 Lo esencial (clase 5 + enunciado)

- Buffer de capacidad **B**; productor deposita, consumidor retira.
- Invariante: **`0 <= ítems <= B`**.
- Semáforos típicos:
  - **`empty`**: lugares libres → inicial **B**
  - **`full`**: ítems disponibles → inicial **0**
- Protocolo: productor `down(empty)` … `up(full)`; consumidor `down(full)` … `up(empty)`.
- Buffer circular: índices con **`% B`**.
- Errores clásicos: `full` inicial = B (basura); `empty` inicial = 0 (deadlock al empezar); topear `sem_up` al valor inicial (rompe `full`).

Relación con el lab: `pingpong` es alternancia estricta; `prodcons` **desacopla** ritmos gracias a B.

### 4.2 Por qué 1 productor + 1 consumidor puede ir sin mutex (clase 6)

Idea central de las filminas de la clase 6:

- Con **un** productor y **un** consumidor, cada puntero tiene un solo dueño:
  - **`in`** lo mueve solo el productor
  - **`out`** lo mueve solo el consumidor
- No hay variable que los dos escriban.
- `empty`/`full` evitan que trabajen sobre la misma celda (uno escribe libre, el otro lee ocupado).

### 4.3 Qué se rompe con varios productores o consumidores (clase 6)

- Con **dos productores**, `in` pasa a ser **compartida**.
- Escenario típico de las filminas:
  1. Ambos hacen `down(empty)` OK (había lugar para dos: los contadores hicieron bien su trabajo).
  2. Ambos leen el mismo `in`.
  3. Uno escribe y avanza `in`; el otro **pisa** la misma celda y deja `in` inconsistente.
  4. Resultado: `full` puede decir “2 ítems” pero en el buffer hay basura / un solo ítem válido.

**Frase clave de la clase:** *los contadores dan permiso, no exclusión*. Te dicen “podés entrar”; si dos reciben permiso a la vez, entran los dos.

Por eso el **mutex** se vuelve obligatorio apenas hay **P > 1** o **C > 1** (protege `in`/`out` / la estructura del buffer).

Orden clásico (también en bibliografía / punto estrella):

```
down(empty)   // o down(full) del lado consumidor
down(mutex)
  // sección crítica del buffer
up(mutex)
up(full)      // o up(empty)
```

Si tomás el **mutex antes** y después te bloqueás en empty/full, podés generar **deadlock**.

En el `prodcons` del lab, aunque el buffer sea “lógico”, el mutex también importa para no **mezclar líneas** de `printf` cuando hay varios procesos imprimiendo (los tests miran líneas enteras).

### 4.4 Analogía con pipes de xv6 (clase 6 — muy útil para preguntas difíciles)

Ya usaron pipes en el Lab 1 (`cmd1 | cmd2`). Un pipe **es** un buffer acotado en el kernel:

- Si el escritor va más rápido → buffer lleno → el escritor **se bloquea**.
- Si el lector va más rápido → buffer vacío → el lector **se bloquea**.

Mapeo que aparece en las filminas (`prodcons` ↔ `kernel/pipe.c`):

| Idea en `prodcons` | En `pipe.c` |
|--------------------|-------------|
| Capacidad `B` | `PIPESIZE` (512) |
| `full` (ítems listos) | `nwrite - nread` |
| `empty` (lugares libres) | `PIPESIZE - (nwrite - nread)` |
| Buffer lleno → productor espera | `sleep(&pi->nwrite, …)` |
| Buffer vacío → consumidor espera | `sleep(&pi->nread, …)` |
| `up(full)` / `up(empty)` | `wakeup` del canal opuesto |
| Mutex | `pi->lock` (spinlock) |

Otras ideas de la clase 6 para estudiar:

- xv6 **no** trae semáforos de fábrica: resuelve el mismo problema con **1 spinlock + 2 canales** de `sleep`/`wakeup` (estilo condition variable).
- Con semáforos, el **contador ya es el estado**; con CV hay que llevar el estado aparte (`nread`/`nwrite`).
- El pipe tiene buffer **real** en el kernel (memoria compartida por construcción). Dos procesos de usuario tras `fork` **no** comparten memoria: por eso el `prodcons` del lab modela el buffer de forma lógica / pensada para el enunciado.

### 4.5 Lo que refuerza la clase 7 (útil aunque sea “de cierre”)

Las filminas de la clase 7 repasan invariantes que también sirven para el parcialito:

- En `prodcons`, la cantidad de ítems “en vuelo” nunca supera **B**, y al terminar debe quedar en **0**.
- Líneas `ERROR` si faltan o sobran argumentos / son inválidos.
- El padre debe **esperar** a los hijos antes de cerrar (si no, puede imprimirse después de que el shell siga).
- **No fijar** ids de semáforo (`#define MUTEX 5`, etc.): con `pingpong` y `prodcons` a la vez se pisan; `sem_open` falla si el id ya está abierto (política del lab).
- Punto estrella `prodcons B N P C`: `down(empty|full)` → `down(mutex)` → sección crítica → `up(mutex)` → `up(full|empty)`; repartir exactamente N ítems; el padre espera a P+C hijos.

### 4.6 Checklist mental clases 5–7

- [ ] Explico por qué 1P+1C no necesita mutex sobre índices  
- [ ] Dibujo la carrera de dos productores sobre `in`  
- [ ] Distingo “permiso” (empty/full) de “exclusión” (mutex)  
- [ ] Relaciono empty/full/mutex con lo que hace `pipe.c`  
- [ ] Sé por qué sleep/wakeup en el pipe usa `while`  
- [ ] Sé por qué no conviene hardcodear ids de semáforo  

---

## 5. Bloque C — Bibliografía (prioridad alta para la bolsa difícil)

Orden sugerido en el enunciado: **OSTEP → Silberschatz/Tanenbaum → POSIX → libro xv6**.

### OSTEP (*Operating Systems: Three Easy Pieces*)

- Capítulos de **concurrencia / semáforos**.
- Qué estudiar:
  - Semántica de **down/up** (P/V).
  - Patrón **join** con semáforo en 0 (padre espera; hijo señala).
  - **Producer–consumer** / bounded buffer.
  - Rechequear la condición al despertar.
  - *Lost wakeup* / races al dormir sin el lock correcto.

Libro: https://pages.cs.wisc.edu/~remzi/OSTEP/  
Semáforos: https://pages.cs.wisc.edu/~remzi/OSTEP/threads-sema.pdf

### Silberschatz y Tanenbaum

- **Bounded-Buffer / Producer-Consumer**.
- Semáforo **binario** vs **contador**.
- Rol de empty/full y del mutex.

### POSIX (man pages)

- `sem_overview(7)`: **named** vs **unnamed**.
- `sem_wait(3)` ~= `sem_down`; `sem_post(3)` ~= `sem_up`.
- Wait con valor 0: **bloquea** hasta un post.

https://man7.org/linux/man-pages/man7/sem_overview.7.html

### Libro xv6 (RISC-V)

https://pdos.csail.mit.edu/6.828/2022/xv6/book-riscv-rev3.pdf

- Por qué `sleep(chan, lk)` recibe el lock **ya tomado**.
- Qué es el **canal** (`chan`); `wakeup` despierta a quienes dormían en **ese** canal.
- En xv6, `wakeup` puede despertar a **varios** → en `sem_down` se usa **`while`**, no solo `if`.
- Canales distintos en sleep/wakeup → waiters pueden no despertarse.
- Complementar con la lectura de **`pipe.c`** vista en clase 6.

---

## 6. Cómo estudiar (método práctico)

1. **Releer el enunciado** (syscalls + políticas + pingpong + prodcons).
2. **Repasar las 7 filminas** en orden; priorizar **2 → 3 → 4 → 5 → 6** (y de la **7** los invariantes / ids / estrella).
3. En **clase 4**: los 5 invariantes, tablas síntoma→causa, `while`, validación bajo lock.
4. En **clase 6**: carrera multi-P, mutex, tabla `prodcons` ↔ `pipe.c`.
5. En **clase 7**: invariante “nunca más de B en vuelo”, ids no fijos, orden mutex en multi P/C.
6. **Leer OSTEP** (semáforos + producer/consumer) y dibujar empty/full.
7. **Libro xv6**: sleep/wakeup + spinlocks; mirar `pipe.c` al lado.
8. **POSIX**: named vs unnamed y wait/post.
9. **Auto-chequeo** (2–3 min en voz alta cada uno):
   - acquire/release vs sleep/wakeup  
   - doble `sem_open` y `sem_close` con waiters  
   - pingpong: dos semáforos y valores 1/0; por qué falta `wait` rompe el prompt  
   - `empty=B`, `full=0`  
   - por qué `while` después de `wakeup`  
   - por qué empty/full no alcanzan con varios productores  
   - qué falla si validás “ya abierto” fuera del lock  
   - por qué hardcodear ids rompe la corrida concurrente pingpong+prodcons  

---

## 7. Checklist final (antes del parcialito)

### Lab / enunciado / clase 4

- [x] Sé qué retorna cada `sem_*` en éxito y en error  
- [ ] Memoricé las políticas fijas (doble open, close con waiters, up sin tope al init, reopen)   (Costo)
- [x] Puedo listar los **5 invariantes** de la clase 4 ()  
- [x] Distingo spinlock (`acquire`/`release`) de espera (`sleep`/`wakeup`)  
- [x] Sé el contrato de `pingpong` (fork, 2N líneas, orden, ERROR, close, wait)  
- [ ] Relaciono síntomas típicos (cuelgue, dos ping, prompt temprano) con su causa  
- [x] Entiendo por qué los ids son globales  

### Prodcons / clases 5–7

- [x] Sé inicializar empty/full y el invariante del buffer (`0 <= ítems <= B`)  
- [x] Explico 1P+1C sin mutex vs multi P/C con mutex  
- [x] Sé el riesgo de deadlock por el orden de downs  
- [ ] Relaciono el problema con pipes / `pipe.c`  
- [x] Sé por qué no hay que fijar ids de semáforo entre programas  

### Bibliografía / xv6

- [ ] Puedo explicar lost wakeup / por qué sleep lleva el lock  
- [ ] Sé qué es el canal y por qué sleep y wakeup deben coincidir  
- [ ] Sé named vs unnamed en POSIX y la analogía wait/post  

---

## 8. Material concreto

| Material | Dónde conseguirlo |
|----------|-------------------|
| Enunciado del Lab 2 | **Aula virtual** |
| Filminas de las 7 clases | **Aula virtual** (Clase 1 … Clase 7) |
| OSTEP | https://pages.cs.wisc.edu/~remzi/OSTEP/ |
| OSTEP — semáforos (PDF) | https://pages.cs.wisc.edu/~remzi/OSTEP/threads-sema.pdf |
| Libro xv6 (RISC-V) | https://pdos.csail.mit.edu/6.828/2022/xv6/book-riscv-rev3.pdf |
| POSIX — `sem_overview(7)` | https://man7.org/linux/man-pages/man7/sem_overview.7.html |
| Código de referencia en xv6 | `kernel/pipe.c` (`piperead` / `pipewrite`) en el árbol de xv6 del lab |

**Orientación:** Wikipedia solo como repaso rápido; **no** alcanza como única fuente.

---

## 9. Qué *no* hace falta memorizar

- Números de línea de su código o nombres internos exactos de cada grupo  
- Toda la arquitectura de RISC-V o todo el libro xv6  
- APIs POSIX que el lab no usa (`sem_timedwait`, etc.), más allá de named/unnamed y wait/post  
- Guión completo del video / checklist de entrega (clase 7 lo tiene; para el parcialito alcanza el repaso conceptual)

---

*Lab 2 — Sistemas Operativos 2026 · FaMAF · UNC*