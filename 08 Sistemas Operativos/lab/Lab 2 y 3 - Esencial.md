---
tags: [sistemas-operativos, xv6, semaforos, fat32, fuse, parcialito]
curso: Sistemas Operativos 2026 - Labs 2 y 3, lo esencial respondido
---

# Lab 2 y 3 — Esencial (checklist respondido)

Cada punto de las checklists de las guías de estudio y cada cosa que piden los enunciados está **respondido de forma explícita**. Fuentes: enunciado del Lab 2, `Guia de estudio Lab 2`, enunciado del Lab 3, `[SO26] Apunte Lab3`, `Guia de estudio Lab 3`, filminas del Lab 3 y el código e informe de tu grupo.

---

# LAB 2 — Semáforos en xv6

## A. Qué pide el enunciado (y cómo se cumple)

- [x] **Implementar 4 syscalls: `sem_open`, `sem_up`, `sem_down`, `sem_close`.**
  Viven en el kernel (`kernel/semaphore.c`), en un arreglo `sem_table[65]` (índices 1..64, el 0 no se usa). Cada semáforo tiene `value`, `is_open` y un `spinlock`.
- [x] **Semáforos nombrados.**
  Los administra el **kernel**, son **globales** a todos los procesos (no hay privados), duran mientras xv6 esté prendido (se pierden al reiniciar) y su "nombre" es un **entero** (como un file descriptor).
- [x] **Ids y retornos.**
  `sem` va de **1 a 64**. Todas devuelven **0 si hay error** y el **id** (`sem` > 0) si salen bien. Por eso el 0 no puede ser un id: se confundiría con el error.
- [x] **Son contadores, no binarios.**
  El valor puede crecer con `sem_up` por encima del valor de `sem_open` (hace falta para `prodcons`, donde `full` arranca en 0). Tope: `SEM_VALUE_MAX` = 1 000 000.
- [x] **Usar `acquire`, `release`, `sleep`, `wakeup`, `argint`.**
  `argint` lee los argumentos; `acquire`/`release` protegen la estructura del semáforo; `sleep`/`wakeup` implementan la espera.
- [x] **Sin condiciones de carrera y validando argumentos.**
  Toda lectura y escritura del semáforo, **incluida la validación**, se hace con su lock tomado.
- [x] **`pingpong N`.**
  Un solo `fork`; un proceso imprime `ping` y otro `pong`, N veces cada uno (2N líneas), siempre empieza con `ping` y nunca hay dos iguales seguidos. Los errores empiezan con `ERROR`. El prompt vuelve recién cuando termina el juego, y los semáforos quedan liberados.
- [x] **`prodcons B N`.**
  Un solo `fork`: el productor produce los ítems `1..N` e imprime `produce K pid=P`; el consumidor consume N e imprime `consume pid=P`. Nunca hay más de B ítems "en vuelo", sin busy-wait, con semáforos contadores. Al final se cierran los semáforos y se agrega el programa a `UPROGS`. Errores: `ERROR: ...` si faltan argumentos o B, N < 1.
- [x] **⭐ Punto estrella `prodcons B N P C`.**
  P productores y C consumidores (varios `fork`) comparten `empty`, `full` y `mutex`; en total se producen y consumen N ítems y el padre espera a los P+C hijos. Es opcional (`@CREDIT`, 0 puntos extra).
- [x] **Auto-corrección.**
  `make grade-parcial` → **11/11** (syscalls 6 + pingpong 5). `make grade-final` → **15/15** (+ prodcons 4). Antes del push, `make clean`.
- [x] **Entregas.**
  Intermedia (28/09): syscalls + pingpong. Final (07/10): todo + prodcons + **video de 7 min como máximo** con las decisiones de diseño (se sugiere mostrar `pingpong 5 & ; prodcons 3 10`). Coding style de xv6. Commits + push a Bitbucket.

## B. Políticas obligatorias (respuesta fija, no inventar otras)

| Syscall | Éxito | Error (devuelve 0) |
|---|---|---|
| `sem_open(sem, value)` | No estaba abierto → queda abierto con `value` | `sem` fuera de 1..64; `value < 0`; **ya estaba abierto** |
| `sem_close(sem)` | Estaba abierto → queda cerrado, **valor 0**, hace **`wakeup`** | fuera de rango; **no estaba abierto** |
| `sem_down(sem)` | Si valor > 0, resta 1; si es 0, **bloquea** hasta un up o un close | fuera de rango; **no abierto**; **lo cerraron mientras esperaba** |
| `sem_up(sem)` | Suma 1 y despierta a los que esperaban; **sin tope en el valor inicial** | fuera de rango; **no abierto**; ya vale `SEM_VALUE_MAX` |

Casos con respuesta fija:
1. **Doble `sem_open`** del mismo id abierto → **error** (no se reinicializa en caliente).
2. **`sem_close` con procesos esperando en `sem_down`** → **permitido**: los despierta y esos `sem_down` **devuelven 0**. Después, todo `up`/`down` sobre ese id falla.
3. **`sem_up` por encima del valor inicial** → **permitido**; solo falla al llegar a 1 000 000. No poner como tope el valor inicial, porque rompe `prodcons`.
4. **Reabrir un id cerrado** → `sem_open` **vale** y lo inicializa de nuevo.
5. El valor **nunca es < 0**: esperar es **dormir**, no dejar el contador en −1.

## C. Checklist de la guía — respondido

### Lab / enunciado / clase 4

- [x] **¿Qué retorna cada `sem_*` en éxito y en error?**
  Éxito: el **id** del semáforo (> 0). Error: **0**. Los casos de error de cada una están en la tabla B.

- [x] **Políticas fijas (doble open, close con waiters, up sin tope al init, reopen).**
  - Doble open → error.
  - Close con waiters → permitido, los despierta y sus `down` devuelven 0.
  - Up → puede pasar el valor inicial (tope 1 000 000).
  - Reopen de un id cerrado → válido.

- [x] **Los 5 invariantes de la clase 4.**
  1. `value` **nunca negativo**: si no hay fichas, se duerme.
  2. `sem_close` marca cerrado y hace **`wakeup`**; los que esperaban devuelven **0**.
  3. `sem_up` **sin tope** en el valor inicial (solo `SEM_VALUE_MAX`).
  4. Todo se toca con el **lock tomado, incluida la validación**.
  5. `sleep` va **dentro de un `while`**, nunca de un `if`.

- [x] **Spinlock (`acquire`/`release`) vs espera (`sleep`/`wakeup`).**
  El **spinlock** da **exclusión mutua** por un ratito: el que llega y lo encuentra ocupado **da vueltas** gastando CPU (busy waiting), y mientras lo tiene se **apagan las interrupciones**. Sirve para proteger los **datos** del semáforo. **`sleep`/`wakeup`** implementan la **espera larga**: el proceso deja la CPU y duerme hasta que lo despierten. **No se reemplazan entre sí**: el lock protege, sleep/wakeup esperan.

- [x] **Contrato de `pingpong`.**
  - **Un `fork`.**
  - **2N líneas**, siempre empieza `ping`, nunca dos iguales seguidos.
  - Errores con **`ERROR`**.
  - El padre hace **`wait`** (el prompt vuelve al final) y **`sem_close`** de los dos semáforos.
  - Dos semáforos inicializados en **1 (ping)** y **0 (pong)**.

- [x] **Síntomas típicos → causa.**

  | Síntoma | Causa |
  |---|---|
  | QEMU se cuelga | un `sem_down` sin su `sem_up`, o `sleep` con el lock o el canal equivocado |
  | `panic: acquire` | se tomó **dos veces** el mismo lock |
  | `panic: sched locks` | se durmió dejando un spinlock tomado de forma incorrecta |
  | Todo devuelve 0 | los stubs de la syscall no se reemplazaron (no llega a la lógica) |
  | Anda con 1 proceso y falla con varios | validación **fuera** del lock |
  | Empieza con `pong` | valores iniciales **invertidos** |
  | A veces dos `ping` seguidos | **`if` en vez de `while`** al despertar |
  | Anda solo y falla la corrida concurrente | **ids hardcodeados** |
  | Se cuelga con N grande | falta un `sem_up` en algún camino |
  | Termina bien pero el prompt vuelve antes | falta **`wait`** |

- [x] **¿Por qué los ids son globales?**
  Porque son **semáforos nombrados**: viven en el kernel y el id es su nombre para **todos** los procesos. Es lo que permite que procesos que no comparten memoria (padre e hijo después de `fork`) se sincronicen. La contracara: si dos programas usan el **mismo id**, comparten (y se pisan) el semáforo.

### Prodcons / clases 5–7

- [x] **Inicializar `empty`/`full` y el invariante del buffer.**
  `empty = B` (lugares libres), `full = 0` (ítems listos), `mutex = 1`. Invariante: **`0 <= ítems <= B`**; no se consume nada que no se haya producido; el buffer se toca en exclusión mutua. Errores clásicos:
  - `full = B` → se "consume basura".
  - `empty = 0` → deadlock de entrada.
  - Topear `up` al valor inicial → rompe `full`.

- [x] **¿Por qué 1P + 1C no necesita mutex sobre los índices?**
  Cada índice tiene **un solo dueño**: `in` lo mueve solo el productor y `out` solo el consumidor. No hay ninguna variable que escriban los dos. Y `empty`/`full` garantizan que nunca trabajen sobre la **misma celda** (uno escribe celdas libres, el otro lee celdas ocupadas).

- [x] **La carrera de dos productores sobre `in`.**
  1. Los dos hacen `down(empty)` y pasan (había 2 lugares: los contadores hicieron bien su trabajo).
  2. Los dos **leen el mismo `in`**.
  3. Uno escribe en `buf[in]` y avanza `in`; el otro **escribe en la misma celda** (pisa el ítem) y avanza `in` otra vez.
  4. `full` dice "2 ítems" pero hay **uno válido y una celda con basura**.

- [x] **"Permiso" (empty/full) vs "exclusión" (mutex).**
  *Los contadores dan permiso, no exclusión.* `empty`/`full` dicen "**podés entrar**, hay lugar o hay ítem"; si dos reciben permiso a la vez, **entran los dos**. El `mutex` es el que hace que entren **de a uno**. Por eso con **P > 1 o C > 1 el mutex es obligatorio**. En el `prodcons` del lab además evita que se **mezclen las líneas** de `printf` de varios procesos.

- [x] **Riesgo de deadlock por el orden de los downs.**
  El orden correcto es **primero `down(empty|full)`, después `down(mutex)`**. Al revés: un consumidor toma el mutex, encuentra el buffer vacío y **se duerme con el mutex tomado**; el productor no puede entrar a producir y nadie lo despierta → **deadlock**.

- [x] **Relación con pipes / `pipe.c`.**
  Un **pipe es un buffer acotado en el kernel**: si el escritor va más rápido, el buffer se llena y el escritor se bloquea; si el lector va más rápido, el buffer queda vacío y el lector se bloquea.

  | `prodcons` | `kernel/pipe.c` |
  |---|---|
  | capacidad `B` | `PIPESIZE` (512) |
  | `full` (ítems listos) | `nwrite - nread` |
  | `empty` (lugares libres) | `PIPESIZE - (nwrite - nread)` |
  | lleno → productor espera | `sleep(&pi->nwrite, &pi->lock)` |
  | vacío → consumidor espera | `sleep(&pi->nread, &pi->lock)` |
  | `up(full)` / `up(empty)` | `wakeup` del canal **del otro** |
  | `mutex` | `pi->lock` (spinlock) |

  - xv6 **no trae semáforos**: el pipe resuelve lo mismo con **1 spinlock + 2 canales** de sleep/wakeup (estilo variable de condición). Con semáforos, **el contador ya es el estado**; con sleep/wakeup el estado se lleva aparte (`nread`/`nwrite`).
  - El pipe tiene un buffer **real** en memoria del kernel. Dos procesos de usuario después de `fork` **no comparten memoria**, por eso en `prodcons` el buffer es **lógico**: solo los semáforos y la salida por pantalla.

- [x] **¿Por qué `sleep`/`wakeup` en el pipe (y en `sem_down`) usa `while`?**
  `wakeup` despierta a **todos** los que duermen en ese canal, y entre que te despiertan y volvés a correr otro proceso puede haber cambiado el estado (por ejemplo, llevarse el único ítem). Al despertar hay que **volver a chequear** la condición; si sigue sin cumplirse, a dormir de nuevo.

- [x] **¿Por qué no hay que fijar (hardcodear) ids de semáforo?**
  Porque los ids son **globales**. Si `pingpong` usa siempre el 1 y el 2 y `prodcons` también, o si corren dos `pingpong` a la vez, **se pisan los semáforos**: además `sem_open` sobre un id ya abierto **falla** (política del lab). La solución es buscar un id libre probando `sem_open` del 1 al 64 hasta que dé bien (`sem_get` en tu código).

### Bibliografía / xv6

- [x] **Lost wakeup / ¿por qué `sleep` lleva el lock?**
  Si `down` hiciera "veo valor 0 → **suelto el lock** → me duermo", en el hueco entre soltar y dormir otro proceso podría hacer `up` + `wakeup`. Como todavía no estaba dormido, **ese aviso se pierde** y el proceso se duerme para siempre: eso es el *lost wakeup*. `sleep(chan, lk)` recibe el lock **ya tomado** y lo suelta **en el mismo paso** en que el proceso queda dormido (internamente toma primero el lock del proceso). Al despertar **lo vuelve a tomar** antes de volver.

- [x] **¿Qué es el canal y por qué `sleep` y `wakeup` deben coincidir?**
  El **canal** (`chan`) es solo un **número que hace de etiqueta** (en el lab, la dirección del semáforo: `&sem_table[sem]`). `wakeup(chan)` despierta a los que duermen **con esa misma etiqueta**. Si `sleep` usa un canal y `wakeup` otro, **nadie se despierta** → cuelgue.

- [x] **Named vs unnamed en POSIX y la analogía wait/post.**
  - **Nombrados** (`sem_open("/nombre", ...)`): tienen un **nombre** global y los puede usar **cualquier proceso**, aunque no compartan memoria; se borran con `sem_unlink`. **Los del lab son de este estilo** (el nombre es el entero 1..64).
  - **No nombrados** (`sem_init`): viven **en una zona de memoria** que tienen que compartir los que los usan (hilos de un proceso o memoria compartida); se destruyen con `sem_destroy`.
  - Analogía: **`sem_wait` ≈ `sem_down`** (bloquea si vale 0) y **`sem_post` ≈ `sem_up`**.

- [x] **Patrón "join" de OSTEP (semáforo en 0).**
  El padre hace `down(s)` con `s = 0` y se bloquea; el hijo, al terminar, hace `up(s)`. Funciona corra quien corra primero (si el hijo terminó antes, el valor ya es 1 y el padre pasa).

### Auto-chequeo en voz alta (los 8 de la guía)

| Pregunta | Respuesta corta |
|---|---|
| `acquire`/`release` vs `sleep`/`wakeup` | Lock = exclusión mutua corta con busy-wait; sleep/wakeup = dormir esperando una condición |
| Doble `sem_open` y `sem_close` con waiters | Doble open = error; close con waiters = permitido, los despierta y sus `down` devuelven 0 |
| `pingpong`: semáforos, valores, `wait` | Dos semáforos, ping = 1 y pong = 0; sin `wait` el padre termina y el prompt vuelve antes de que el hijo imprima |
| `empty = B`, `full = 0` | B lugares libres al empezar, ningún ítem listo |
| `while` después de `wakeup` | `wakeup` despierta a todos; hay que rechequear la condición |
| `empty`/`full` no alcanzan con varios productores | Dan permiso, no exclusión: dos productores escriben la misma celda de `in` |
| Validar "ya abierto" fuera del lock | Dos procesos ven "no abierto" a la vez y los dos lo abren (o uno lo usa mientras otro lo cierra): anda con 1 proceso, falla con varios |
| Ids hardcodeados con `pingpong` + `prodcons` | Ids globales → comparten semáforos y el segundo `sem_open` falla |

### Camino de una syscall (por si preguntan "anatomía")

`user.h` (prototipo) → `usys.pl` genera `usys.S` (`li a7, SYS_x` + **`ecall`**) → trampa al kernel → `syscall()` en `syscall.c` mira **`a7`** y busca en la tabla `syscalls[]` → `sys_sem_x()` en `sysproc.c` lee los argumentos con **`argint`** (de `a0`, `a1` guardados en el trapframe) → `ksem_x()` en `semaphore.c` → el resultado vuelve en **`a0`**. También se tocan `syscall.h` (números), `defs.h` (prototipos del kernel) y el `Makefile` (`OBJS` y `UPROGS`). Estilo xv6: los semáforos van en **su propio archivo**, no en `sysfile.c`.

---

# LAB 3 — Auditoría forense en FAT32 con FUSE

## A. Qué pide el enunciado (y cómo se responde)

- [x] **Parte 1 — Crear `/.audit/events.bin` al montar.**
  - En `fat_fuse_init` (después de cargar los hijos de `/`) se llama a `audit_init()`, que busca `/.audit` y `/.audit/events.bin`.
  - Si **no existen**, los crea: escribe la dentry en la imagen **y** el nodo en el árbol.
  - Si **existen**, los **carga** del disco. Así el log **persiste** entre montajes.

- [x] **¿Dónde va el código de logging? ¿Qué funciones? ¿Cómo modularizar?** *(decisión de tu grupo)*
  - **Dónde:** dentro de `fat_fuse_ops.c`, porque ahí ya están las operaciones FUSE que hay que interceptar.
  - **Funciones:** `audit_init`, `create_audit_dir`, `create_events_bin`, `audit_log_write`, `audit_make_delete_event` y `audit_set_username`. Del esqueleto usan `fat_tree_node_search`, `fat_file_init`, `fat_tree_insert`, `fat_file_add_child_direntry` y `fat_fuse_load_directory_children`.
  - **Modularización:** crear el directorio y el `.bin` está en funciones separadas.
  - **Si falla:** `audit_init` es `void` y aborta, porque un FS "forense" sin log no tiene sentido. Como pasa en el init, no queda nada montado que desmontar.

- [x] **Parte 2 — Estructura de eventos de tamaño fijo.**
  `audit_event_t` es una `union` `packed` con `_padding[512]`, así que **cada evento mide 512 bytes**. Un `static_assert` lo verifica en compilación.
  - **Por qué tamaño fijo:** igual que las dentries de 32 bytes, permite **acceso directo** (el evento k está en `k × 512`) y contar eventos con una división.
  - **Por qué 512:** es **un cluster** de la imagen del enunciado. Más grande gastaría varios clusters por evento y llenaría el FS.

- [x] **¿Qué información guardar por operación?**
  - **Comunes:** `event_id`, `timestamp`, `operation_type`, `username` y `filepath`.
  - **`write`:** `offset`, `size` y los **clusters** del archivo, para detectar si una escritura posterior pisó clusters de un borrado.
  - **`unlink`/`rmdir`:** la **cadena completa** de clusters, `file_size` y el cluster del **directorio padre**.
  - **`mkdir`:** su cluster y el del padre, porque un `mkdir` también puede reutilizar clusters de un borrado.
  - Una `union` interna reusa el espacio porque cada evento es **una** operación.

- [x] **¿Cómo garantizan el mismo tamaño?**
  Con `__attribute__((packed))` (sin relleno entre campos), la `union` con `_padding[512]` (mide lo que el miembro más grande) y `static_assert(sizeof(audit_event_t) == 512)`.

- [x] **¿Cómo manejan el ID secuencial?**
  Con una variable global `current_event_id` que **al montar** se calcula como `tamaño de events.bin / sizeof(audit_event_t)` y se incrementa en cada evento. Así sigue la numeración entre montajes sin leer todo el archivo.

- [x] **Parte 3 — Verificar con `audit_reader`.**
  Montar, hacer operaciones (`echo`, redirecciones, `rm`, `mkdir`, `rmdir`) y correr `./tools/audit_reader mnt/.audit/events.bin`. Si se cambia la estructura, hay que actualizar `audit_reader.c`: los dos comparten `audit.h`.

- [x] **Parte 4 — Loguear `write`, `unlink`, `mkdir`, `rmdir`.**
  Se intercepta cada operación en su función de `fat_fuse_ops.c` y se escribe el evento al final de `events.bin`. El log de `write` se hace **después** de que la escritura salió bien.

- [x] **¿Solo el primer cluster o la cadena completa?**
  La **cadena completa**: el archivo puede estar **fragmentado** (ej. `b.txt = [8, 9, 11]`). Después del `unlink` la FAT queda en 0 y **la cadena se pierde**; con el primer cluster solo se podría **adivinar** que eran contiguos.

- [x] **¿Hace falta la dentry completa?**
  No. Alcanza con **nombre** (path), **primer cluster**, **tamaño** y si es **archivo o directorio**. Las fechas no hacen falta: el archivo recuperado aparece con la fecha de la restauración. El **tamaño** sí es necesario porque la cadena dice cuántos clusters ocupa el archivo, no cuántos bytes del último son válidos.

- [x] **¿Cómo manejan archivos fragmentados?**
  Igual que los contiguos: se guarda la lista de clusters **en orden de la cadena** y `restore` la sigue tal cual.

- [x] **¿Y los archivos de más de 32 clusters?**
  Tu grupo eligió la **opción 2: loguear parcialmente** (los primeros 32). Se nota que la cadena quedó truncada porque `file_size` pide más clusters de los guardados. Con clusters de 512 B el límite es **16 KB**. El apunte dice que `fatfs.img` usa clusters de **1024 B**, y ahí el límite es 32 KB. Las opciones del punto estrella para archivos grandes:
  1. Si el archivo es contiguo, guardar solo `primer cluster + largo`.
  2. Eventos de **continuación**.
  3. Un archivo aparte `chains.bin`.

- [x] **Parte 5 — Comando `restore`: ¿cómo se le habla al FS?**
  No se puede crear una syscall nueva porque habría que modificar el kernel. Hay dos opciones:
  1. **`ioctl(fd, cmd, arg)`** (la recomendada): la syscall genérica para operaciones sin syscall propia. `fd` tiene que ser un archivo **válido dentro del punto de montaje**. `cmd` se arma con `_IO`, `_IOR`, `_IOW`, `_IOWR` y codifica **dirección, tamaño, tipo y número**; FUSE usa ese tamaño para copiar los datos. FUSE lo entrega a `fat_fuse_ioctl()`; si esa función devuelve `-ENOENT`, el programa ve −1 con `errno = ENOENT`. No anda en todas las plataformas.
  2. **Archivo de control** (ej. `/.audit/.restore`): se escribe ahí el path y `fat_fuse_write` lo detecta. Funciona en todos lados, pero es "feo": `write` cambia de significado según el path y devolver el resultado es indirecto.

- [x] **Algoritmo de recuperación.**
  1. Buscar en el log el evento que **evidencia el borrado**: el **último `unlink`** de ese path, que es el más reciente si hay repetidos.
  2. Sacar la cadena de clusters, el tamaño y el cluster del padre.
  3. **Verificar conflictos:** recorrer los eventos **posteriores** a ese `unlink` (`write`, `mkdir`, creación de archivos) y ver si alguno usa **alguno** de esos clusters. Si pasa, **no se puede** restaurar. Mirar que hoy `FAT[c] = 0` **no alcanza**, porque el cluster pudo usarse y liberarse de nuevo.
  4. Si no hay conflicto, **rehacer la cadena en la FAT** (en la imagen **y** en memoria) y **crear la dentry** en el directorio padre (en la imagen **y** en el árbol).

- [x] **¿Por qué `unlink` permite recuperar aunque se "borró"?** (lo piden explicar en el video)
  Porque FAT hace **borrado lógico**: pone `0xE5` en el primer byte del nombre y las entradas de la FAT en 0, pero **no borra los datos**. Siguen en los clusters hasta que el allocator los **reutiliza** y los sobrescribe.

- [x] **Casos borde (decidir y avisar, nunca fallar en silencio).**
  - El archivo **nunca existió** o no está en el log → avisar.
  - El archivo **todavía existe** → no restaurar encima.
  - Ya hay **otro con el mismo nombre** → avisar.
  - El **directorio padre ya no existe** → avisar o no restaurar.
  - **Varios borrados del mismo nombre** → el más reciente.
  - El **log crece mucho** → para la entrega se asume que no; si molesta, se usa la imagen limpia.

- [x] **Limitaciones (lo piden en el video).**
  - Archivos de más de 32 clusters se recuperan parcialmente.
  - Si los clusters fueron reutilizados, no se puede recuperar.
  - Se pierde el **primer byte de cada cluster** (lo pisa el esqueleto, ver más abajo).
  - Nombres solo 8.3.
  - Un directorio solo tiene las entradas que entran en su primer cluster.

- [x] **Evaluación y entrega.**
  - Compila **sin warnings**.
  - Loguea `write`/`unlink`/`mkdir`/`rmdir`.
  - `audit_reader` muestra bien los eventos.
  - `restore` recupera cuando se puede y **detecta cuando no** (clusters sobrescritos).
  - Pasan los tests de la cátedra.
  - **Tests propios** (logging, restore exitoso, restore con conflicto).
  - Commits chicos de todos y **clang-format**.
  - `INFORME.md` de 5 páginas como máximo.
  - **Video de 7 min como máximo** con todos los integrantes.
  - Entrega el **05/11/2026**.

## B. Temas de la guía de estudio — respondidos

### Sistemas de archivos en general (OSTEP 39 y 40)

- [x] **¿Qué es un sistema de archivos?**
  Una forma de organizar los bloques de un disco (que solo es una secuencia de bloques numerados) para ofrecer dos abstracciones: **archivos** (bytes con nombre que se leen y escriben desde cualquier *offset*) y **directorios** (listas nombre → archivo que forman el árbol).

- [x] **Las 4 partes que tiene todo FS y su equivalente en FAT32.**

  | Parte | En FAT32 |
  |---|---|
  | Información del volumen (superbloque en OSTEP) | **Sector de boot** |
  | Metadatos de cada archivo (inodo en OSTEP) | **Entrada de directorio de 32 bytes** |
  | Datos | **Área de datos** (clusters) |
  | Registro de espacio libre (bitmap en OSTEP) | Entradas con valor **0** en la **FAT** |

  En FAT la tabla cumple **dos roles**: dice qué está libre y en qué **orden** se encadenan los clusters. Es la "**asignación basada en listas enlazadas**" del recuadro del cap. 40.

- [x] **Un directorio también es un archivo.**
  Su contenido es la lista de entradas, guardada en clusters de datos como cualquier archivo.

- [x] **Access paths: ¿cómo se llega a un archivo?**
  Recorriendo **desde la raíz**. Para `/docs/notas.txt`: sector de boot → cluster de la raíz → buscar `docs` → leer ese directorio → buscar `notas.txt` → con su primer cluster y la FAT, llegar a los datos. Un cluster al que no lleva ningún camino es **inalcanzable**, aunque tenga datos.

- [x] **Offset y acceso no secuencial (cap. 39).**
  Cada archivo abierto tiene un **offset actual**: leer o escribir N bytes lo avanza N, y `lseek` lo mueve sin hacer I/O. `write` de FUSE recibe el `offset` explícito (como `pwrite`), y por eso el evento de write lo guarda.

- [x] **Removing files (cap. 39).**
  `rm` llama a **`unlink`**: saca el **nombre** del directorio. En FAT eso es marcar la dentry con `0xE5` y liberar los clusters.

- [x] **Making and mounting (cap. 39).**
  `mkfs.vfat -F 32` crea un FS vacío en la imagen; **montar** pega ese FS en un punto del árbol (`./fat-fuse disk.img mnt`); se desmonta con `fusermount -u mnt`.

- [x] **`mmap` (cap. 39) y cómo se usa en el lab.**
  `mmap` hace que un archivo se vea **como memoria**: la FAT se accede como un arreglo (`fat_map[N]`) y el SO carga las páginas a medida que se usan. El esqueleto usa **`MAP_PRIVATE`**: **escribir en la memoria mapeada NO modifica el archivo** (queda una copia privada). Con `MAP_SHARED` sí llegaría al archivo. Por eso `fat_table_set_next_cluster()` hace **las dos cosas**: `pwrite` a la imagen **y** actualiza `fat_map`. Si solo cambiás la memoria, todo anda hasta que **desmontás y volvés a montar**, y ahí se pierde. Es el error más común del lab.

### VFS, FUSE y capas del código (clases 1 y 2)

- [x] **VFS.**
  La capa del **kernel** que da la **misma interfaz** (`open`, `read`, `write`, `unlink`...) para cualquier FS y le pasa cada pedido al FS que corresponde a ese path.

- [x] **FUSE.**
  Permite que un FS sea un **programa de usuario**. Camino: programa → **syscall** → **VFS** → **módulo FUSE** del kernel → proceso **`fat-fuse`** → la función de `struct fuse_operations` (ej. `fat_fuse_unlink`). Las funciones devuelven `-errno` si fallan; `read`/`write` devuelven la cantidad de bytes.

- [x] **Syscall de alto nivel vs escrituras de bajo nivel.**
  Una sola syscall (un `write`) puede causar **varias escrituras** en la imagen: una entrada de la FAT (cluster nuevo), los datos, y la dentry (tamaño y fecha) en el cluster del padre.

- [x] **Niveles de abstracción del código.**

  | Capa | Qué es | ¿Está en la imagen? |
  |---|---|---|
  | `fat_table` | La FAT mapeada con `mmap` | Sí: `fat_table_set_next_cluster()` hace `pwrite` + actualiza la memoria |
  | `fat_file` | Un archivo o dir: copia de su dentry, cluster inicial, posición en el padre | Sí: `fat_file.c` reescribe la dentry en el padre con `pwrite` |
  | `fat_tree` | El árbol de directorios en memoria (BST + listas) | **No**: se arma al montar y se mantiene a mano con `fat_tree_insert`/`fat_tree_delete` |

- [x] **Consistencia memoria ↔ imagen.**
  Toda modificación va **en los dos lugares**. Si escribís la dentry en la imagen pero no insertás en el árbol, el archivo **no aparece** hasta volver a montar. Si insertás en el árbol pero no escribís en la imagen, se ve mientras está montado y **desaparece** al volver a montar. El bug de tu Parte 1 fue de este tipo: `events.bin` estaba bien en la imagen pero colgado de un padre `NULL` en el árbol, porque en C los parámetros son **copias**. La pregunta clave es siempre la misma: **¿alguien escribió en la imagen?**

- [x] **El árbol se lee una sola vez.**
  Cada directorio se lee del disco **la primera vez** que se recorre (`children_read`); después se usa la memoria.

### Estructura de FAT32 (clase 3)

- [x] **Cluster vs sector.**
  El **sector** es la unidad física (512 B). El **cluster** es la unidad de **asignación** del FS: varios sectores seguidos. Un archivo ocupa siempre una cantidad **entera** de clusters, así que lo que sobra del último es **fragmentación interna**. Con clusters más grandes la FAT tiene menos entradas, pero los archivos chicos desperdician más. El código del lab trabaja solo con clusters.

- [x] **Regiones del volumen.**
  - **Región reservada**, que empieza con el **sector de boot**.
  - **FAT #1** y **FAT #2**: la segunda es una copia por redundancia, y el esqueleto actualiza solo la primera.
  - **Área de datos**: en FAT32 el **directorio raíz** está **acá**, en el cluster que dice el sector de boot (no tiene región fija).

- [x] **Campos del sector de boot que importan.**
  Bytes por sector, sectores por cluster, sectores reservados, cantidad de FATs, sectores por FAT y **cluster del directorio raíz**. Todos en *little endian*. No hace falta saber los offsets.

- [x] **Las cuentas (del cluster al byte).**
  `inicio_FAT = reservados × bytes_sector`; `inicio_datos = (reservados + nFATs × sect_por_FAT) × bytes_sector`; la entrada FAT del cluster N está en `inicio_FAT + 4N`; los datos del cluster N están en `inicio_datos + (N − 2) × bytes_cluster`. Se resta 2 porque **el primer cluster de datos es el 2** (las entradas 0 y 1 están reservadas).

### Tabla FAT y cadenas (clase 4)

- [x] **Valores especiales de la FAT.**

  | `FAT[N]` | Significa |
  |---|---|
  | `0x00000000` | libre |
  | `2` … `0x0FFFFFEF` | usado; es el **siguiente** cluster |
  | `0x0FFFFFF7` | dañado |
  | `0x0FFFFFF8` … `0x0FFFFFFF` | **fin de cadena** (EOC) |

  Solo hay **28 bits útiles** (los 4 altos están reservados), así que `0xFFFFFFFF` no es un valor especial.

- [x] **Un archivo es una lista enlazada.**
  El primer cluster está en la **dentry** y los siguientes en la FAT. Ejemplo: `5 → 9 → 6 → fin`.

- [x] **Fragmentación.**
  Los clusters de un archivo **no tienen por qué ser contiguos** ni ascendentes (el 6 puede venir después del 9): el archivo está **fragmentado** y **solo la FAT sabe el orden**. Esto es fragmentación **del archivo** (afecta al rendimiento), distinta de la **interna** (espacio perdido en el último cluster).

- [x] **¿Cómo elige un cluster libre el esqueleto?**
  **First fit**: `fat_table_get_next_free_cluster()` recorre desde el cluster 2 y devuelve el **primero libre**. Consecuencia clave: un cluster recién liberado por un borrado es **candidato inmediato** a ser reutilizado. Por eso el punto estrella propone un allocator secuencial (*watermark*).

- [x] **¿Qué hacen `mkdir`/`create`, `write`, `unlink`/`rmdir`?**
  - **`mkdir` / `create`:** buscar un cluster libre C, poner `FAT[C] = EOC`, armar la dentry (cluster inicial C, tamaño 0), escribirla en el directorio **padre** e insertar en el árbol. El esqueleto le da un cluster **aunque el archivo esté vacío** y **no escribe `.` y `..`** (las agrega `readdir`).
  - **`write`:** escribe los datos en los clusters del offset. Si se pasa del último, pide uno nuevo (`FAT[7] = 12`, `FAT[12] = EOC`) y actualiza el tamaño y la fecha de la dentry.
  - **`unlink` / `rmdir`:** recorren la cadena poniendo cada entrada de la FAT en 0 (antes escriben `'\0'` al principio de cada cluster), ponen **`0xE5`** en la dentry y la sacan del árbol. El esqueleto **no chequea** que el directorio esté vacío en `rmdir`.

### Entrada de directorio y borrado (clase 5)

- [x] **La dentry de 32 bytes.**
  Nombre (8) + extensión (3) en formato **8.3**, atributos (`0x10` dir, `0x02` oculto, `0x01` solo lectura), fechas, **cluster inicial** partido en 16 bits altos y 16 bajos, y **tamaño en bytes** (**0 para directorios**). Un cluster de 1024 B tiene lugar para 32 dentries.

- [x] **`0x00` vs `0xE5`.**
  - `0x00`: entrada libre **y no hay más entradas** en el directorio; la lectura del directorio **corta ahí**.
  - `0xE5`: entrada libre porque se **borró** un archivo, pero **puede haber entradas válidas después** (se salta y se sigue).
  - Por eso una entrada en ceros en el medio **esconde** a todas las que vienen después (es el "caso erróneo" de las filminas).

- [x] **Borrado lógico vs físico.**
  - **Físico:** se destruyen los datos (por ejemplo, llenando de ceros).
  - **Lógico:** solo se cambian los **metadatos**. Es lo que hacen FAT32 y la mayoría de los FS, porque es mucho más barato.

- [x] **¿Qué queda en el disco después de `rm /dir/a.txt` (clusters 40 → 41)?**
  - **Se pierde:** el **primer carácter del nombre** (pasa a `0xE5`), la **cadena** (`FAT[40] = FAT[41] = 0`) y el **primer byte de cada cluster** (el `'\0'` del esqueleto).
  - **Se conserva:** el resto del nombre, la extensión, el **cluster inicial**, el **tamaño**, las fechas y casi todos los datos.
  - Los datos quedan **inalcanzables**: ninguna entrada válida apunta al 40.

- [x] **¿Por qué el esqueleto escribe `'\0'` al principio de cada cluster que libera?**
  Para que, si ese cluster se reutiliza como **directorio**, la primera entrada se lea como **fin de directorio** (`0x00`) y no como basura. Para la recuperación, significa que **se pierde el primer byte de cada cluster** del archivo borrado.

- [x] **¿Cuándo se pierden de verdad los datos?**
  Cuando otra operación que pide cluster (crear un archivo, `mkdir`, agrandar con `write`) toma esos clusters y los **sobrescribe**. Con first fit eso puede pasar enseguida.

- [x] **¿Por qué sin el log "recuperar es adivinar"?**
  Mirando solo el disco se ve la dentry con `0xE5`, que tiene el cluster inicial y el tamaño (o sea, cuántos clusters). Pero **no se sabe cuáles eran** los siguientes: solo se puede suponer que eran **contiguos** y que **nadie los pisó**. Si el archivo estaba fragmentado o los clusters se reutilizaron, sale basura. Por eso hay que guardar la información **antes** de que se pierda: ese es el log.

### Recuperación (clase 6 / filmina 3)

- [x] **Qué guarda cada evento según las filminas.**
  - **Write:** offset, size y clusters.
  - **Unlink:** file_size, num_clusters y clusters.
  - **Mknod**, **Mkdir** y **Rmdir:** el cluster del directorio.
  - Cuánto se puede recuperar depende de cómo diseñaron los eventos.

- [x] **Los 3 pasos de la recuperación.**
  1. **Localizar** el evento que evidencia el borrado.
  2. **Verificar** con los demás eventos que se pueda recuperar (que nadie haya ocupado esos clusters después).
  3. **Reconstruir** el archivo y **efectivizar** sus clusters (FAT + dentry, en la imagen y en memoria).

- [x] **Estructura de un número de `ioctl`.**
  32 bits: **dir** (2 bits: lectura, escritura, ambas o ninguna) | **size** (14 bits, tamaño del argumento, como máximo 16383) | **type** o *magic* (8 bits, identifica al driver o subsistema) | **nr** (8 bits, número del comando). Se arma con `_IO`, `_IOR`, `_IOW`, `_IOWR`.

- [x] **Recomendaciones de la cátedra.**
  Cuidar los casos borde: archivos que **nunca existieron**, que **todavía existen** y con **nombres repetidos**. Usar `DEBUG` (y montar con `-f -d`). El `fd` del `ioctl` es simbólico, pero tiene que referirse a un archivo **válido y existente** del montaje.

### Herramientas que conviene reconocer

| Comando | Para qué |
|---|---|
| `./fat-fuse -f disk.img mnt` | Montar en primer plano (se ven los `DEBUG`) |
| `-d` | Además, mensajes internos de FUSE |
| `fusermount -u mnt` | Desmontar |
| `./tools/audit_reader -v mnt/.audit/events.bin` | Ver el log |
| `xxd -s 0x0B -l 6 img` | Leer campos del sector de boot |
| `make test` | Tests de la cátedra (Check) |
| `git-clang-format` | Formato antes del commit |
