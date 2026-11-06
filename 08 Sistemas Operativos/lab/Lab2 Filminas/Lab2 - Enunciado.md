# Laboratorio 2: Semáforos en XV6

## Programando nuestras propias llamadas al sistema

Sistemas Operativos 2026 \- FaMAF \- UNC

Original 2014: Rafael Carrascosa  
Versión 2017: Matías David Lee  
Versión 2018: Ignacio Moretti  
Versión 2022: Facundo Bustos  
Versión 2023: Matias Cuenca  
Versión 2025: Pablo Ventura - Julio Bianco  
Versión 2026: Ignacio Moretti

# Introducción

En este laboratorio se implementará un sistema de [Semáforos](https://es.wikipedia.org/wiki/Sem%C3%A1foro_\(inform%C3%A1tica\)) para espacio de usuario, que sirven como mecanismo de sincronización entre procesos. Se implementarán en la versión RISC-V de XV6 (sistema operativo con fines académicos) en espacio de kernel y deberá proveer syscalls accesibles desde espacio de usuario.

Como los semáforos vienen en varios estilos, en este laboratorio vamos a implementar sólo un estilo de semáforos llamado [semáforos nombrados](http://linux.die.net/man/7/sem_overview) inspirándose en los semáforos nombrados que define POSIX.

Características de los semáforos nombrados:

* Son administrados por el kernel.  
* Están disponibles globalmente para todos los procesos del sistema operativo (i.e. no hay semáforos "privados").  
* Su estado se preserva mientras el SO esté activo (i.e., se pierden entre reinicios).  
* Cada semáforo tiene un "nombre" que lo identifica con el kernel, en nuestro caso los nombres son números enteros entre 0 y un límite máximo (idea similar a los file descriptors).

# Su trabajo

1. Implementar 4 syscalls: `sem_open()`, `sem_up()`, `sem_down()`, `sem_close()`.  
2. Implementar el programa de espacio de usuario **`pingpong`**.  
3. Implementar el programa de espacio de usuario **`prodcons`** (productor-consumidor con buffer acotado).  
4. *(Punto estrella, opcional)* Extender `prodcons` para varios productores y consumidores en paralelo.

## Fechas importantes

El laboratorio se desarrolla entre el **15/09/2026** y el **07/10/2026**. Hay dos hitos de entrega (ambas hasta las **23:59**):

| Entrega | Alcance | Fecha límite |
|---------|---------|--------------|
| **Intermedia** | Syscalls de semáforos + programa **`pingpong`** | **28/09/2026, 23:59** |
| **Final (completa)** | Todo lo anterior + **`prodcons`** (+ punto estrella si aplica) + video | **07/10/2026, 23:59** |

Las primeras semanas del laboratorio se dedican a xv6, a registrar e implementar las syscalls de semáforos y al programa **`pingpong`** (entrega intermedia). Después se trabaja el problema de productores–consumidores (`prodcons`) y el video para la entrega final.

En ambas entregas: commits + push al repositorio Bitbucket del grupo. En la entrega final también deben cumplir lo indicado en la sección *Entrega y video*.

## Las Syscalls

`int sem_open(int sem, int value)` -> Abre y/o inicializa el semáforo "sem" con un valor arbitrario "value".

`int sem_close(int sem)` -> Libera el semáforo "sem".

`int sem_up(int sem)` -> **Libera / señala** el semáforo `sem`: incrementa su contador en 1. Si había procesos bloqueados esperando (porque hicieron `sem_down` cuando el valor era 0), los **despierta** para que puedan continuar. El valor puede superar el valor con el que se abrió el semáforo.

`int sem_down(int sem)` -> **Toma / espera** el semáforo `sem`. Si el valor es mayor que 0, lo decrementa en 1 y sigue. Si el valor es 0, el proceso se **bloquea** hasta que otro proceso haga `sem_up` (o hasta que el semáforo se cierre). El valor del semáforo nunca puede ser menor a 0.

### Convenciones generales

* **Identificador `sem`:** entero entre **1** y **64** inclusive (pueden reservar un arreglo de tamaño 65; el índice **0 no se usa** porque todas las syscalls devuelven **0** para indicar error).
* **Valor de retorno:** **0** = error; en caso de éxito devuelven el **id del semáforo** (`sem` > 0).
* Los semáforos son **contadores** (estilo Dijkstra/POSIX): el valor puede **crecer con `sem_up` más allá del valor con el que se abrió** (necesario para `prodcons`, donde `full` arranca en 0).

### Políticas obligatorias (deben implementarse tal cual)

Estas reglas son parte del laboratorio. Los tests de auto-corrección (`make grade-parcial` / `make grade-final`, incluidos en el kickstarter) las verifican.

| Syscall | Éxito | Error (retorna 0) |
|---------|-------|-------------------|
| **`sem_open(sem, value)`** | El semáforo `sem` no estaba abierto; queda abierto con valor inicial `value` (>= 0). | `sem` fuera de rango; `value` < 0; el semáforo **ya estaba abierto**. |
| **`sem_close(sem)`** | El semáforo estaba abierto; queda **cerrado**, su valor pasa a **0** y se hace **`wakeup`** de procesos bloqueados en ese semáforo. | `sem` fuera de rango; el semáforo **no estaba abierto**. |
| **`sem_down(sem)`** | Decrementa el valor en 1 (nunca queda < 0). Si el valor es 0, **bloquea** hasta un `sem_up` o un `sem_close`. | `sem` fuera de rango; semáforo **no abierto**; o fue **cerrado mientras el proceso esperaba** (debe despertar y fallar). |
| **`sem_up(sem)`** | Incrementa el valor en 1. Si el valor era 0, **`wakeup`** de procesos bloqueados. **No** hay tope en el valor inicial: puede superarlo libremente. | `sem` fuera de rango; semáforo **no abierto**; valor ya igual a **`SEM_VALUE_MAX`** (usar **1 000 000**). |

**Casos que suelen generar dudas (respuesta fija):**

1. **`sem_close` con procesos bloqueados:** está **permitido**. El cierre despierta a quienes esperaban en `sem_down`; esas llamadas deben **fallar** (retornar 0) porque el semáforo ya está cerrado. Tras el cierre, cualquier `sem_down` / `sem_up` sobre ese id también falla.
2. **`sem_up` con valor "alto":** está **permitido** incrementar por encima del valor de `sem_open`. Solo falla al llegar a `SEM_VALUE_MAX` (1 000 000). **No** usen un tope igual al valor inicial (rompe `prodcons`).
3. **Reabrir un id cerrado:** `sem_open(sem, value)` sobre un semáforo cerrado es válido y lo inicializa de nuevo.
4. **Doble `sem_open`:** abrir un id **ya abierto** es error (no se re-inicializa en caliente).

Para implementar las syscalls deberán usar `acquire()`, `release()`, `wakeup()`, `sleep()` y `argint()`. Es parte del laboratorio que investiguen y aprendan sobre estas funciones del kernel (ver las ayudas al final).

También es parte del laboratorio que:

* Lo que implementen esté libre de problemas de concurrencia y condiciones de carrera.  
* Hagan validación de los argumentos de sus syscalls.

## El programa "pingpong"

Deberán escribir un programa de usuario que sincroniza la escritura por pantalla de la cadena "ping" y "pong" usando nuestro sistema de semáforos.

El comando "pingpong" deberá tomar como argumento un entero N (rally) que será la cantidad de veces que aparecerá la palabra "ping" y la palabra "pong" por pantalla.

El programa pingpong deberá hacer **un solo fork** y con los dos procesos resultantes:

* Uno deberá imprimir "ping" N veces, pero nunca imprimir dos "ping" seguidos sin que haya un "pong" al medio.  
* El otro deberá imprimir "pong" N veces, pero nunca imprimir dos "pong" seguidos sin que haya un "ping" al medio.  
* La secuencia resultante siempre debe empezar con "ping". Por ejemplo

  `$ pingpong 1`  
  `ping`  
  	`pong`

* En caso de que haya un error, el comando el mensaje de error debe empezar con ERROR en mayúsculas. Todo error tiene que arrancar con ERROR.

  `$ pingpong -1`  
  `ERROR: El numero de rounds tiene que ser mayor a 1`

* Se debe retornar el prompt de consola solo cuando el juego haya terminado por completo (obviamente siempre que el comando pingpong se haya ejecutado en modo foreground).

Es decir, deberá haber 2N líneas con "ping" y "pong" intercalados. Esta sincronización entre procesos es posible de realizar usando semáforos, y así deberán hacerlo. Al terminar la ejecución del programa, los semáforos deberán estar liberados para nuevos usos.

---

# El problema productor-consumidor (contexto)

Antes de implementar `prodcons`, conviene entender el problema clásico que modela. Es uno de los patrones de sincronización más usados en sistemas operativos y en software concurrente.

## Conceptos básicos

* **Productor:** proceso (o hilo) que **genera** datos o "ítems" y los deposita en un buffer compartido.  
* **Consumidor:** proceso que **retira** ítems del buffer y los procesa.  
* **Buffer acotado (*bounded buffer*):** cola de capacidad finita `B`.  
  * Si el buffer está **lleno**, el productor debe **esperar** (no puede producir).  
  * Si el buffer está **vacío**, el consumidor debe **esperar** (no puede consumir).  
* **Condición de carrera:** sin sincronización, productores y consumidores pueden corromper el estado del buffer o violar la capacidad.  
* **Invariantes** que la solución correcta debe preservar:  
  * `0 <= cantidad_de_ítems_en_el_buffer <= B`  
  * no se consume un ítem antes de que exista (haya sido producido)  
  * el acceso a la estructura del buffer ocurre en **exclusión mutua**

### Relación con `pingpong`

`pingpong` fuerza una **alternancia estricta** (un ping, un pong, …). Es un caso extremo de sincronización por turnos.  
`prodcons` **desacopla** ritmos: con buffer de tamaño `B > 1`, el productor puede adelantarse varios ítems respecto del consumidor (hasta llenar el buffer), y viceversa cuando el consumidor "alcanza". Eso es más cercano a pipelines, colas y spoolers reales.

### Solución clásica con tres semáforos

La formulación habitual (Dijkstra / textos de SO) usa:

| Semáforo | Tipo | Valor inicial | Rol |
|----------|------|---------------|-----|
| `empty` | contador | `B` | lugares **libres** en el buffer |
| `full` | contador | `0` | ítems **disponibles** para consumir |
| `mutex` | binario | `1` | exclusión mutua al modificar el buffer |

Protocolo (esquema):

* Productor: `down(empty)` -> `down(mutex)` -> depositar ítem -> `up(mutex)` -> `up(full)`  
* Consumidor: `down(full)` -> `down(mutex)` -> retirar ítem -> `up(mutex)` -> `up(empty)`

**Importante:** hacer `down` del semáforo de recurso (`empty`/`full`) **antes** del `mutex` evita un deadlock clásico (un proceso toma el mutex y luego se bloquea esperando espacio/ítems mientras otro no puede entrar).

En XV6, tras un `fork()`, los procesos **no comparten** memoria de usuario. En este laboratorio el buffer puede modelarse de forma **lógica** con semáforos; la evidencia de corrección será la **salida por pantalla** (líneas `produce` / `consume` con el **pid** del proceso que actúa) y el respeto de los invariantes.

## Aplicaciones reales del esquema productor-consumidor

El mismo esquema aparece una y otra vez fuera del aula:

* **Pipelines de shells Unix** (`cmd1 | cmd2 | cmd3`): el kernel usa buffers entre procesos; el escritor se bloquea si el pipe está lleno y el lector si está vacío.  
* **Colas de mensajes / brokers:** RabbitMQ, Apache Kafka, Amazon SQS - productores publican mensajes y consumidores los procesan; la cola tiene límites de capacidad o retención.  
* **Spoolers de impresión:** varias aplicaciones encolan trabajos; un demonio impresor los consume.  
* **Buffers de red / sockets:** la pila TCP mantiene buffers entre quien envía y quien recibe.  
* **Multimedia:** un decodificador produce frames; el renderer los consume al ritmo de la pantalla.  
* **Colas de trabajo / thread pools:** un front-end encola requests; workers las consumen (servidores web, sistemas de build, pipelines tipo MapReduce/Spark a alto nivel).  
* **Logging asíncrono:** la aplicación produce registros; un logger dedicado los escribe a disco.

`prodcons` en XV6 es un **modelo simplificado** de ese patrón: mismos semáforos e invariantes, sin la complejidad de red o disco.

---

## El programa "prodcons" (obligatorio)

Deberán escribir un programa de usuario que simule un **productor y un consumidor** sincronizados con el buffer acotado mediante semáforos.

### Interfaz

```text
prodcons B N
```

* `B`: capacidad del buffer (entero >= 1).  
* `N`: cantidad total de ítems a producir y a consumir (entero >= 1).  
* Errores: el mensaje debe empezar con `ERROR` (mismo convenio que `pingpong`).

Ejemplos de error:

```text
$ prodcons
ERROR: uso: prodcons B N  |  prodcons B N P C

$ prodcons 0 5
ERROR: B y N deben ser enteros >= 1
```

### Procesos (modo obligatorio)

El programa debe hacer **un solo `fork`**:

* Un proceso es el **productor**: produce los ítems `1 .. N`.  
* El otro es el **consumidor**: consume exactamente `N` ítems.  
* El proceso que retorna al shell debe hacerlo **solo cuando ambos hayan terminado** (foreground) y los semáforos deben quedar **liberados** (`sem_close`).

### Salida esperada

Cada producción imprime una línea con el formato:

```text
produce K pid=P
```

donde `K` es el número de ítem (`1 .. N`) y `P` es el **pid** del proceso productor (`getpid()` en XV6).

Cada consumo imprime una línea con el formato:

```text
consume pid=P
```

donde `P` es el **pid** del proceso consumidor.

El pid en la salida permite verificar en demos y en el **video** que productor y consumidor son procesos distintos (y, en el punto estrella, que intervienen varios procesos).

Ejemplo con buffer de tamaño 1 (obligatoriamente alternado; los pids son ilustrativos):

```text
$ prodcons 1 3
produce 1 pid=4
consume pid=5
produce 2 pid=4
consume pid=5
produce 3 pid=4
consume pid=5
```

Con `B > 1` el productor puede adelantarse (varios `produce` seguidos) mientras no se viole la capacidad `B`. Por ejemplo, con `B = 2` es válido que aparezcan dos `produce` antes del primer `consume`, pero **nunca** tres ítems "en vuelo" (producidos y aún no consumidos) si `B = 2`.

### Reglas que deben cumplirse

1. Exactamente `N` líneas que contengan `produce` (con ítems `1 .. N`) y `N` líneas `consume`.  
2. Cada línea `produce` / `consume` incluye el **pid** del proceso que actúa (`pid=<entero>`).  
3. Nunca hay más de `B` ítems producidos pendientes de consumir.  
4. La sincronización debe hacerse con las **syscalls de semáforos** del laboratorio (sin busy-wait).  
5. Deben usarse semáforos **contadores** de forma coherente con capacidad `B` (no alcanza con solo alternar como en pingpong).  
6. Al terminar, liberar los semáforos para nuevos usos.  
7. Agregar `prodcons` a `UPROGS` en el `Makefile` (como con `pingpong`) para que quede en la imagen de usuario.

### Semáforos sugeridos

* `empty` inicializado en `B`  
* `full` inicializado en `0`  
* `mutex` inicializado en `1`

---

## Punto estrella (opcional): varios productores y consumidores

Quienes quieran profundizar pueden extender el programa:

```text
prodcons B N P C
```

* `B`, `N`: igual que en el modo obligatorio.  
* `P`: cantidad de procesos **productores** (>= 1).  
* `C`: cantidad de procesos **consumidores** (>= 1).  
* En total se producen y consumen **N** ítems, repartidos entre los `P` productores y los `C` consumidores.  
* Se requieren **varios `fork`**. Los mismos tres semáforos (`empty`, `full`, `mutex`) se comparten entre todos.  
* Los invariantes de capacidad y de conteo total (`N` produce + `N` consume) siguen valiendo; la salida puede intercalarse entre procesos. En modo estrella, los distintos pids en `produce` / `consume` ayudan a ver la concurrencia real.

En el **video**, si implementan el punto estrella, demuestren `prodcons B N P C` con `P > 1` y `C > 1` y expliquen **por qué el `mutex` es imprescindible** cuando hay más de un productor o más de un consumidor.

Este punto **no** es requisito mínimo para aprobar; suma como logro extra (test `@CREDIT` en `make grade-final`, 0 puntos extra en el score).

Ejemplo ilustrativo:

```text
$ prodcons 2 10 2 2
produce 1 pid=6
produce 2 pid=7
consume pid=8
consume pid=9
...
```

(el orden exacto entre procesos puede variar; lo que no puede variar son los invariantes).

---

## Cómo probar su implementación (auto-corrección)

El archivo **kickstarter** (`lab2-kickstarter.tgz`) incluye scripts de prueba automática. Después de aplicar el patch del kickstarter sobre su xv6, tendrán:

| Archivo | Rol |
|---------|-----|
| `user/semtest.c` | Prueba las syscalls (políticas del enunciado) |
| `grade-lab2-parcial` | Batería **entrega intermedia** |
| `grade-lab2-final` | Batería **entrega final** |
| `lab2_tests.py` | Definición compartida de tests (alumnos y docentes) |

### Entrega intermedia — `make grade-parcial`

Correr **antes de la entrega del 28/09**:

```bash
make grade-parcial
```

Debe mostrar **`Score: 11/11`**. Incluye:

| Bloque | Tests | Puntos |
|--------|-------|--------|
| Syscalls (`semtest`) | noinit, init, closeuse, exhaust, grow, reopen | 6 |
| `pingpong` | args, orden, concurrencia | 5 |

Si falla algún test, leer el mensaje en pantalla y corregir antes de hacer push.

### Entrega final — `make grade-final` (o `make grade`)

Correr **antes de la entrega del 07/10**:

```bash
make grade-final
# equivalente:
make grade
```

Debe mostrar **`Score: 15/15`**. Incluye todo lo anterior más:

| Bloque | Tests | Puntos |
|--------|-------|--------|
| `prodcons` | args, B=1, B=3 | 4 |

Además corre el **punto estrella** (`prodcons` multi P/C) marcado `@CREDIT`: no suma al 15/15, pero sirve para auto-verificar el extra.

### Flujo recomendado

```bash
# 1. Compilar y probar a mano en xv6
make qemu

# 2. Auto-corrección (elegir parcial o final según la fecha)
make grade-parcial    # entrega intermedia
make grade-final      # entrega final

# 3. Limpiar artefactos antes del push
make clean
```

### Docker (opcional)

```bash
make grade_docker-parcial
make grade_docker-final
```

### Prueba manual de syscalls

Dentro de `make qemu` también pueden probar casos individuales:

```text
$ semtest noinit
$ semtest init 3
$ semtest grow
$ semtest reopen
```

---

## Entrega y video

### Entrega intermedia (hasta el 28/09/2026, 23:59)

Deben tener implementadas las **4 syscalls** de semáforos y el programa **`pingpong`**, con commits + push al repositorio del grupo.

**Antes del push:** `make grade-parcial` debe dar **11/11**.

### Entrega final / completa (hasta el 07/10/2026, 23:59)

Deben entregar el laboratorio completo: syscalls, **`pingpong`**, **`prodcons`** (y el punto estrella si lo realizaron), más un **video** de demostración con duración máxima de 7 minutos. En el video se deben presentar las decisiones de diseño más importantes y explicar cómo resolvieron los desafíos técnicos clave del laboratorio.

**Antes del push:** `make grade-final` (o `make grade`) debe dar **15/15**.

* Antes de entregar correr la batería correspondiente y luego `make clean` para borrar todos los artefactos  
* La entrega es via "commits+push" en bitbucket al repositorio asignado al grupo  
* El *coding style* deberá respetar las convenciones de XV6.

Se recomienda mostrar en el video: syscalls, `pingpong`, `prodcons B N` (con `B > 1` y salida `produce K pid=P` / `consume pid=P`), y si aplica el punto estrella `prodcons B N P C`. También una corrida concurrente, por ejemplo:

```text
$ pingpong 5 & ; prodcons 3 10
```

# Instalación de XV6 y puesta en marcha

1. Crear directorio para el lab2  
   `mkdir lab2;cd lab2`  
2. Clonar repositorio de xv6 en el commit f5b93ef:   
   `git clone https://github.com/mit-pdos/xv6-riscv.git`  
   `(cd xv6-riscv; git reset --hard f5b93ef)`  
3. Copiar los archivos clonados al repo de Bitbucket asignado a su grupo.  
   `git clone https://user@bitbucket.org/sistop-famaf/so26lab2gXX.git`  
   `cp -a xv6-riscv/* so26lab2gXX`  
   `rm -rf xv6-riscv`  
4. Bajar archivo kickstarter y descomprimir en `lab2`. Luego aplicar el patch

   `(cd so26lab2gXX; patch -t -p1 < ../xv6-riscv-semaphore.patch)`

5. Hacer el primer commit+push del proyecto.  
   `cd so26lab2gXX`  
   `git tag -a original_code -m "Solo el codigo de la catedra"`  
   `git add *`  
   `git commit -m 'first commit'`  
   `git push origin; git push origin --tags`  
6. Instalar qemu  
   `sudo apt-get install qemu-system-riscv64 gcc-riscv64-linux-gnu`  
7. Compilar e iniciar xv6: posicionarse en el directorio `so26lab2gXX` (debe haber un archivo `Makefile`) y ejecutar el comando `make qemu`.  
8. *Opcional: En vez de instalar y correr qemu en el SO local se puede correr en un container usando esta [imagen pre-definida](https://github.com/wtakuo/xv6-env) que ya contiene qemu y todas las dependencias necesarias para compilar XV6. Para instanciar un shell dentro del contenedor hay que correr:*  
   *`docker build --tag 'xv6-env-so' - < Dockerfile.xv6 # Correr esto una sola vez`*  
   *`docker run -it --rm -v $(pwd):/home/xv6/xv6-riscv xv6-env-so`*

## Comandos y shortcuts útiles de XV6

* `ls` lista todos los programas de usuario disponibles del sistema.  
* \<CTRL-p\>: Lista todos los procesos que están corriendo en el sistema.  
* \<CTRL-a\> x: Sale del sistema operativo.

## Ayudas

* Como el "id" de un semáforo es un número entero entre 0 y N, entonces se pueden implementar los semáforos como un arreglo dentro del espacio de kernel.  
* Mini explicación de las syscalls que utilizarán:  
* `acquire()`: Toma un lock haciendo busy waiting hasta que esté disponible, similar al down de un semáforo. Útil para crear zonas de exclusión mutua (mutex).  
* `release()`: Libera un lock tomado, similar a un up de un semáforo.  
* `sleep()`: Pone a "dormir" el proceso que realizó la syscall hasta un wakeup().  
* `wakeup()`: Permite al scheduler volver a ejecutar un proceso que hizo una llamada a `sleep()`.  
* `argint`: Permite leer un argumento dado en la llamada de la syscall.  
* Implementar `sem_down()` es la parte más desafiante y requiere una buena comprensión de `sleep()` y `wakeup()`. Pueden buscar ideas e inspiración en la implementación de pipewrite y piperead en `pipe.c`.  
* Para `prodcons`, piensen primero el caso `B = 1` (muy parecido en espíritu a un turno) y luego generalicen a `B > 1`. Usen `getpid()` en los `printf` (`produce K pid=P` / `consume pid=P`). El punto estrella obliga a razonar por qué hace falta el `mutex` con varios productores.

# Bibliografía y material de consulta

### Semáforos y productor-consumidor

* Remzi H. Arpaci-Dusseau, Andrea C. Arpaci-Dusseau - *Operating Systems: Three Easy Pieces* (OSTEP), gratis en línea. Empezar por concurrencia y semáforos; incluye el patrón productor/consumidor.  
  * Libro: [https://pages.cs.wisc.edu/~remzi/OSTEP/](https://pages.cs.wisc.edu/~remzi/OSTEP/)  
  * Cap. semáforos (PDF): [https://pages.cs.wisc.edu/~remzi/OSTEP/threads-sema.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/threads-sema.pdf)  
* Abraham Silberschatz, Peter Galvin, Greg Gagne - *Operating System Concepts*: capítulos de sincronización de procesos; sección *The Bounded-Buffer Problem* / *Producer-Consumer*.  
* Andrew S. Tanenbaum, Herbert Bos - *Modern Operating Systems*: sincronización, semáforos y problema productor-consumidor.

### Semáforos nombrados (POSIX) y práctica

* `sem_overview(7)` - semáforos POSIX (nombrados vs no nombrados):  
  [https://man7.org/linux/man-pages/man7/sem_overview.7.html](https://man7.org/linux/man-pages/man7/sem_overview.7.html)  
* `sem_wait(3)` / `sem_post(3)` - semántica cercana a `sem_down` / `sem_up` en Linux.

### XV6 (implementación en kernel)

* "xv6: a simple, Unix-like teaching operating system" (RISC-V):  
  [https://pdos.csail.mit.edu/6.828/2022/xv6/book-riscv-rev3.pdf](https://pdos.csail.mit.edu/6.828/2022/xv6/book-riscv-rev3.pdf)  
  Útil para `sleep` / `wakeup` y locks (`acquire` / `release`).

### Orientación inicial (no usar como única fuente)

* [Semáforo (informática)](https://es.wikipedia.org/wiki/Sem%C3%A1foro_(inform%C3%A1tica))  
* [Problema productor-consumidor](https://es.wikipedia.org/wiki/Problema_productor-consumidor)

**Sugerencia de lectura:** OSTEP (semáforos + producer/consumer) -> Silberschatz o Tanenbaum para el buffer acotado -> man pages POSIX para semáforos nombrados -> libro xv6 para la parte de kernel del lab.
