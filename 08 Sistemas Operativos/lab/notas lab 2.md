# Lab 2: Semaforos en xv6

Son 4 piezas: las 4 syscalls en el kernel, `pingpong`, `prodcons` y (opcional) el punto estrella con varios productores y consumidores.

## 0. Que es xv6

xv6 es un sistema operativo didactico (Unix simplificado) para RISC-V. Corre en QEMU, asi que no hace falta hardware real. Reimplementa Unix V6 en C y para multiprocesador. Son 4.400 lineas

- **User mode:** procesos aislados, que no acceden directamente a la memoria del kernel.
- **Kernel mode:** planifica procesos, atiende interrupciones e implementa las syscalls.
- **Comunicacion:** solo por system calls (`write`, `fork`, `exit` y las nuevas `sem_*`).

| Idea     | En la practica                         |
| -------- | -------------------------------------- |
| `fork()` | Crea un proceso hijo (copia del padre) |
| `wait()` | El padre espera que el hijo termine    |
| `exit()` | Termina el proceso                     |
| Shell    | Loop que lee comandos y los ejecuta    |

`pingpong` y `prodcons` usan `fork`: padre e hijo son procesos distintos que comparten los semaforos globales del kernel.

## 1. Conceptos base

### Que es un semaforo?

Un semaforo es una herramienta de sincronizacion usada en Sistemas Operativos para manejar el acceso compartido a recursos en un ambiente multi-proceso o multi-hilo. Usa una variable del tipo entero (`value`) que controla el proceso de ejecucion con dos operaciones atomicas: ***`down/wait` (Decrementar/bloquear (`sem_down`)) y `up/post` (Incrementar/despertar (`sem_up`))***

Ayudan a prevenir Race Conditions y se aseguran de la buena sincronizacion entre procesos.

Los semaforos, al final del dia son una capa de abstraccion mas arriba de los Locks y Condition Variables.

https://www.geeksforgeeks.org/operating-systems/semaphores-in-process-synchronization/

### Y de que me sirve todo esto? Race conditions

Hay algo, llamado race conditions. Las race conditions son basicamente, cuando dos o mas flujos de ejecucion acceden a un mismo dato compartido sin sincronizarse, al menos uno lo modifica, y el resultado depende de como se intercalaron.

Por ejemplo, demos que en un banco pepito y juan comparten una cuenta con 100 pesos. Ponele que el banco esta programado del orto: los dos sacan 100 pesos al mismo tiempo, los dos leen saldo 100, los dos ven que alcanza y los dos retiran. Salieron 200 pesos de una cuenta que tenia 100.

En xv6, despues de `fork` los procesos de usuario **no comparten memoria**: cada uno tiene su copia. Lo compartido esta en el kernel, por ejemplo `sem_table`, y la carrera se da entre CPUs que corren codigo del kernel al mismo tiempo. Si dos CPUs hacen `sem_down` sin lock con `value == 1`, las dos pueden ver una ficha y tomarla.

#### El incremento perdido

`contador += 1;` parece una operacion, pero son tres: leer a un registro, sumar y escribir. El scheduler puede interrumpir entre cualquiera de ellas. Con `contador` en 5, dos procesos deberian dejarlo en 7:

| Proceso | Que hace                        | `contador` |
| ------- | ------------------------------- | ---------- |
| A       | Lee `contador`, se lleva un 5   | 5          |
| B       | Lee `contador`, se lleva un 5   | 5          |
| B       | Escribe 5 + 1                   | 6          |
| A       | Escribe 5 + 1, con su 5 viejo   | 6          |

Dos incrementos, un solo efecto. El codigo no cambio: cambio cuando se ejecuta cada parte. Por eso no alcanza con leer el programa, hay que pensar en todos los entrelazados posibles.

En xv6 hay paralelismo real (3 CPUs, `-smp 3`) y los procesos comparten recursos del kernel: tablas, buffers y semaforos. El temporizador puede interrumpir en cualquier instruccion, incluso en la mitad de un `contador++`.

### Locks
Un lock es un objeto o variable de control que tiene básicamente **dos estados** (abierto/libre o cerrado/ocupado)

- **Propósito:** Proteger una **sección crítica** para asegurar que solo un hilo o proceso pueda ejecutarla a la vez.
- **Mecanismo:** Si un hilo adquiere el lock (`lock()` o `acquire()`), cualquier otro hilo que intente adquirirlo deberá esperar (ya sea mediante _spinning_ o yéndose a dormir) hasta que el dueño lo libere (`unlock()` o `release()`).
- **Garantía:** Evita condiciones de carrera (_race conditions_) y mantiene los invariantes de las estructuras de datos.

Un ejemplo es codigo que accede a recursos compartidos o modifica variables (Ej, en xv6, dos CPUs que corren `ksem_up` y `ksem_down` sobre el mismo casillero de `sem_table`).

En el lab, el lock es el campo struct spinlock lock de struct sem: cada semáforo tiene su propio spinlock, que se toma con acquire y se suelta con release.
```c
struct sem {
	int value; // Cantidad de fichas / ítems disponibles
	int is_open; // 1 si está creado, 0 si está libre para usar
	struct spinlock lock; // El LOCK.
};
```

Ejemplo:
```c
acquire(&sem_table[sem].lock);
if (sem_table[sem].is_open) {
	release(&sem_table[sem].lock);
	return 0;
}
```
#### Ejemplo: libre / ocupado
La idea más simple: una variable que diga libre u ocupado. Si sólo uno puede entrar a la vez, el incremento no se pierde.

```c
lock(&l);
contador += 1;   // sección crítica
unlock(&l);
```

Pero si el lock se implementa con un `if` comun:

```c
if (libre) {     // ← A mira: libre    ← B mira: libre (¡también!)
  libre = 0;     // ← los dos entran
}
```

- El candado tiene la misma carrera que queríamos evitar.
- Verificar y tomar tiene que ser una sola operación indivisible: la da el hardware (en RISC-V, la instrucción `amoswap`).

#### Busy wait / Spinning (O sea, dentro de la funcion Acquire)

Si el candado está tomado, el que espera gira quemando CPU:

```c
// acquire() en kernel/spinlock.c: en RISC-V, esto es la instrucción amoswap
while (__sync_lock_test_and_set(&lk->locked, 1) != 0) ; // no hace nada, sólo gasta ciclos
```

- Aceptable si la espera dura nanosegundos.
- Un desperdicio si hay que esperar a otro proceso, a un disco o a una tecla.

![[Pasted image 20261106075936.png]]

### Condition Variables

Una **variable de condición** es una primitiva de **señalización y ordenamiento**.

- **Propósito:** Permite que un hilo se ponga a dormir explícitamente a la espera de que el estado del programa cumpla una condición específica (por ejemplo, esperar a que un búfer deje de estar lleno o vacío, o que un hilo hijo termine).
- **Mecanismo:** Cuenta con una cola interna de espera y dos operaciones principales:
    - `wait()`: Libera el lock asociado y suspende al hilo de forma atómica, volviéndolo a adquirir automáticamente antes de retornar.
    - `signal()` (o `broadcast()`): Despierta a uno (o a todos) los hilos que están esperando en la cola una vez que otro hilo modificó el estado.
- **Garantía:** Evita la espera activa (_busy waiting_ o _spinning_) ineficiente de ciclos de CPU cuando se depende de eventos externos.

En xv6 no hay un tipo "condition variable": el equivalente es `sleep`/`wakeup` junto con un spinlock.

### De Locks y CV a semaforos

Finalmente, los **Locks y Condition Variables** desencadenan a los **semaforos programados** en el lab:

- **Unificación en una sola primitiva:** Para resolver la mayoría de los problemas de sincronización (ej; prodcons), los programadores necesitaban combinar obligatoriamente **ambas cosas**: locks para la exclusión mutua y variables de condición para la señalización. Dijkstra y sus colaboradores diseñaron el semáforo como una primitiva abstracta y unificada capaz de resolver ambos aspectos.
- **Doble rol natural del semáforo:** Un semáforo posee un contador interno entero y dos operaciones atómicas (en el lab, `sem_down()` / `P` y `sem_up()` / `V`):
    - **Como Lock (Semáforo Binario):** Si se inicializa en `1`, actúa como un lock garantizando exclusión mutua.
    - **Como Mecanismo de Señalización/Ordenamiento:** Si se inicializa en `0` (o según la cantidad inicial de recursos disponibles), actúa como un mecanismo de espera y señalización entre hilos sin requerir explícitamente una variable de condición.
- **Persistencia del estado (evitar wakeups perdidos):** Las variables de condición clásicas no tienen "memoria"; si un hilo ejecuta un `signal()` y no hay nadie esperando en ese instante, la señal se pierde. En cambio, el semáforo lleva una cuenta entera de los eventos o recursos disponibles; hacer un `sem_up()` incrementa el contador incluso si ningún hilo está durmiendo, evitando problemas como el _lost wake-up_ cuando los hilos cambian su orden de ejecución. (esto no aplica a los semaforos de xv6)

### Semaforo binario y contador

**Binario: un candado.** Arranca en 1 y solo un proceso entra a la seccion critica.

```c
sem_open(mutex, 1);
sem_down(mutex);
// sección crítica: un solo proceso
sem_up(mutex);
```

**Contador: fichas en una caja.** `sem_open(fichas, 3)` deja 3 fichas: `sem_down` toma una (espera si no hay) y `sem_up` devuelve una. Es un estacionamiento con 3 lugares: el cuarto auto espera afuera.

**Patron join (OSTEP): esperar a otro.** Arranca en 0: el padre hace `down` y el hijo hace `up` al terminar.

```c
done = sem_get(0);

if(fork() == 0){
  // trabajo del hijo
  sem_up(done);      // avisa que termino
  exit(0);
}
sem_down(done);      // el padre espera al hijo
```

Si el hijo termina primero, `value` queda en 1 y el padre no se bloquea: el aviso no se pierde.

| Valor inicial | Para que sirve            |
| ------------- | ------------------------- |
| 1             | Exclusion mutua           |
| 0             | Orden o aviso (join)      |
| N             | N recursos disponibles    |

Entonces, terminamos con **Tres mecanismos que combinan los semaforos**:

![[Pasted image 20261106075946.png]]

---

## 2. Semaforos en xv6

### Semaforos del lab

En el lab 2 son **nombrados y contadores**. Viven en el kernel (xv6) en una tabla global de 65 casilleros. El valor representa fichas libres (nunca es negativo) y se implementan como llamadas al sistema (`sem_open`, `sem_close`, `sem_down`, `sem_up`) usando las primitivas internas `sleep` y `wakeup`.

O sea, tenemos 64 semaforos.
![[Pasted image 20261106080016.png|401]]
### Como se constituye un semaforo
Adentro del kernel de xv6 (`kernel/semaphore.c`), cada semáforo es una estructura que contiene:

```c
#define SEM_VALUE_MAX 1000000

struct sem {
  int value;             // Cantidad de fichas / ítems disponibles
  int is_open;           // 1 si está creado, 0 si está libre para usar
  struct spinlock lock;  // El patoba que cuida este semáforo en particular
};

// La tabla global: índices del 1 al 64 (el 0 queda sin uso, es para errores)
struct sem sem_table[65];

void seminit(void) {
  for(int i = 1; i < 65; i++) {
    initlock(&sem_table[i].lock, "semaphore");
    sem_table[i].is_open = 0;
    sem_table[i].value = 0;
  }
}
```

Tres decisiones de diseño:

- **El id es el indice:** `sem_table[id]`, sin busqueda ni tabla de slots.
- **Un lock por semaforo, no uno global:** dos procesos que usan semaforos distintos no se estorban.
- **El 0 se descarta:** el retorno es 0 = error, id > 0 = exito. Si el 0 fuera un id valido, no se podrian distinguir. Por eso los ids van de 1 a 64 y el arreglo tiene 65 lugares.

`seminit()` se llama desde `main.c`, antes del primer uso. Es la convencion de xv6: `kmem`, `bcache`, `ftable`, `itable` y los demas llaman a `initlock` en su init.

### Primitivas de xv6

Cuando hacés `sem_down` o `sem_up`, internamente el kernel combina **dos primitivas**: `acquire`/`release` y `sleep`/`wakeup`. Para leer los argumentos usa ademas `argint`.

`acquire`/`release` **no reemplazan** a `sleep`/`wakeup`: los locks protegen los datos, y `sleep`/`wakeup` implementan la espera del semaforo.

- **`acquire(&lock)` / `release(&lock)`**: Manipulan un _spinlock_ interno para lograr exclusión mutua al acceder a la celda del semáforo en el kernel. Mientras se tiene el _spinlock_, la CPU deshabilita las interrupciones.
    - Se usan para proteger la estructura del semáforo en memoria compartida.
    - Garantizan que leer y decrementar/incrementar `value` ocurra de forma atómica sin condiciones de carrera entre CPUs.
- **`sleep(chan, lock)` / `wakeup(chan)`**: Manejan la espera bloqueante.
    - `sleep` duerme el proceso en un "canal" (direccion de memoria, ej `&sem_table[id]`) y suelta el spinlock de forma atomica al dormirse para evitar la condicion de lost wakeup. Asi no quema CPU dando vueltas.
    - `wakeup` despierta a **todos** los procesos bloqueados en ese canal.
- **`argint(n, &var)`**: Extrae los argumentos enteros pasados desde el espacio de usuario desde la estructura del proceso (_trapframe_).

> [!question] Duda
> Se deshabilitan las interrupciones... y el deadlock? (ask)

### Sleep y wakeup (espera bloqueante)

**El problema:** `sem_down` encuentra el valor en 0. No puede seguir, y tampoco puede girar: quemaria CPU por algo que depende de otro proceso, una espera sin cota. Hace falta soltar la CPU para que otro corra.

El **canal** (`chan`) es cualquier puntero estable que sirva de etiqueta. En el lab, `&sem_table[id]`.

Son **funciones internas del kernel** (`kernel/proc.c`): un programa de usuario no las llama directo, sino que llega a ellas a traves de una syscall como `sem_down` o `sem_up`. Lo que hacen es **cambiar el estado de un proceso**:

| Funcion  | Transicion             | Nombres en xv6           |
| -------- | ---------------------- | ------------------------ |
| `sleep`  | running → blocked      | `RUNNING` → `SLEEPING`   |
| `wakeup` | blocked → ready        | `SLEEPING` → `RUNNABLE`  |

El que cambia de estado es el **proceso**, no el semaforo:

```
                    el planificador lo elige
    RUNNABLE  ─────────────────────────────────►  RUNNING
    (ready)                                      (corriendo)
       ▲                                             │
       │                                             │
       │ wakeup(chan)              sleep(chan, lock) │
       │ (lo llama otro proceso)   (lo llama el      │
       │                            mismo proceso)   │
       │                                             ▼
       └───────────────── SLEEPING ◄─────────────────┘
                          (blocked)
```

`wakeup` no lo pone a correr: lo deja listo, y corre cuando el planificador lo elige.

Dormir no es lo mismo que esperar girando: el proceso suelta la CPU.

**Que hace `sleep(chan, lock)`:**
1. El proceso reconoce que no puede continuar (por ejemplo, `sem_down` encuentra el contador en 0).
2. Pasa su estado en el kernel de `RUNNING` a `SLEEPING`.
3. **Suelta el spinlock** y entrega la CPU al planificador (`sched()`) de forma atómica.
4. La CPU queda libre para que otro proceso avance.
5. Al despertar, el proceso re-adquiere automáticamente el spinlock antes de retornar de `sleep`.

**Que hace `wakeup(chan)`:**
1. Cuando otro proceso produce el recurso o incrementa el semáforo (`sem_up`), llama a `wakeup` sobre ese mismo canal.
2. El kernel busca a los procesos que dormían en ese canal y los pasa a `RUNNABLE`, para que el planificador los vuelva a ejecutar cuando haya CPU libre.

#### Por que `sleep()` DEBE recibir el lock? 

En xv6 la firma es:

```c
sleep(chan, &lock);
```

Si hicieras esto por separado:

```c
// ¡ESTO ESTÁ ROTO (Lost Wakeup)!
release(&lock); // acá otro CPU hace sem_up y wakeup() no despierta a nadie
sleep(chan); // nos dormimos para siempre
```

Ocurriría una condición de carrera fatal: otra CPU podría intercalarse justo después del `release`, modificar el valor y llamar a `wakeup(chan)`. Como tu proceso todavía no terminó de dormirse, el `wakeup` no despierta a nadie y se pierde en el aire (**Lost Wakeup**). Cuando tu proceso finalmente llama a `sleep`, se queda dormido para siempre.

Por eso `sleep(chan, lock)` se encarga de dormir al proceso y soltar el lock en un solo paso indivisible adentro del kernel.

#### Caso de lost wakeup en `pingpong`

Si `sem_down` soltara el lock y **recien despues** mandara a dormir al proceso (`value` de `turn_pong` en 0):

```
CPU 1: hijo en sem_down               CPU 2: padre en sem_up

acquire(&lock)
ve value == 0
release(&lock)
      │  ← ventana: el hijo todavia
      │    no esta dormido
      │                               acquire(&lock)
      │                               value++            (value = 1)
      │                               wakeup(chan)       ← no hay nadie dormido: se pierde
      │                               release(&lock)
      ▼
sleep(chan)
hijo → SLEEPING                       ← duerme aunque value == 1
```

Nadie lo vuelve a despertar: el padre sigue, se bloquea en su `sem_down(turn_ping)` esperando al hijo, y quedan los dos dormidos.

Con `sleep(chan, lock)` la ventana no existe: el padre no puede tomar el lock hasta que el hijo ya este dormido, asi que su `wakeup` lo encuentra.

### Como funciona una syscall en xv6: el camino completo de una sem_*

![[Pasted image 20261106081113.png]]

Con una syscall que ya existe, `uptime()`:

```
usuario:            int t = uptime();
user/usys.S:        li a7, SYS_uptime  +  ecall
                         │  cambia a modo supervisor
kernel/trap.c:      usertrap() → syscall()
                         │  despacha por a7
kernel/sysproc.c:   sys_uptime()
                         │  el resultado vuelve en el registro a0
```

El numero de syscall viaja en `a7`, y los argumentos en `a0`, `a1`, etc.

`sys_uptime` toma un spinlock para leer `ticks` porque esa variable es compartida entre las 3 CPUs.

#### Los 6 lugares donde se agregan las sem_*

| Capa     | Archivo              | Que se agrega                     |
| -------- | -------------------- | --------------------------------- |
| User API | `user/user.h`        | `int sem_open(int, int);`         |
| Stub asm | `user/usys.pl`       | `entry("sem_open");`              |
| Numeros  | `kernel/syscall.h`   | `#define SYS_sem_open 22`         |
| Tabla    | `kernel/syscall.c`   | una entrada en `syscalls[]`       |
| Wrapper  | `kernel/sysproc.c`   | `sys_sem_open()`: lee los args    |
| Logica   | `kernel/semaphore.c` | tabla, down/up, sleep/wakeup      |

Ademas, en el `Makefile`: `UPROGS += $U/_pingpong $U/_prodcons` y `OBJS += $K/semaphore.o`. Si un programa no esta en `UPROGS`, no entra en la imagen y no se puede correr desde el shell.

#### El wrapper en sysproc.c

```c
uint64
sys_sem_open(void)
{
  int id, value;
  argint(0, &id);
  argint(1, &value);
  return sem_open(id, value); // 0 = error, id > 0 = ok
}
```

En este xv6 `argint` devuelve `void`: no se chequea su retorno. La validacion del id va adentro de `sem_open`.

#### Estilo xv6

- Cada archivo tiene una responsabilidad clara: los semaforos van en `kernel/semaphore.c`, no en `sysfile.c`.
- Nombres cortos, y mayusculas para macros y constantes.
- Los argumentos se validan en el kernel, y si el semaforo no esta abierto se falla limpio.

---

## 3. Las 4 Syscalls (Interfaz y Políticas Obligatorias)

### sem_open(id, value)

**Parametros**
- `id` (`sem` en el codigo): el "nombre" del semaforo, entero de 1 a 64.
- `value`: cantidad de fichas con la que arranca, no puede ser negativa.

**Errores (retorna 0)**
- `id` fuera de 1..64.
- `value < 0`.
- El `id` ya estaba abierto.

**Ejemplo en el flujo:** es lo primero que se llama. En `pingpong`, antes de usar los semaforos se abren `turn_ping` con 1 y `turn_pong` con 0. Si otro programa ya abrio ese `id`, retorna 0 (asi `sem_get()` detecta que no esta libre y prueba con otro). Recien despues se pueden usar `sem_down` y `sem_up`.

```c
int ksem_open(int sem, int value) {
  if (sem < 1 || sem > 64 || value < 0) return 0;   // id o valor invalidos
  acquire(&sem_table[sem].lock);                    // desde aca, todo bajo lock
  if (sem_table[sem].is_open) {                     // ya estaba abierto: error
    release(&sem_table[sem].lock);                  // soltar el lock antes de cada return
    return 0;
  }
  sem_table[sem].is_open = 1;                       // lo marca como abierto
  sem_table[sem].value = value;                     // carga las fichas iniciales

  release(&sem_table[sem].lock);

  return sem;                                       // exito: devuelve el id
}
```

### sem_close(id)

Libera el semáforo `sem`.

**Parametros**
- `id` (`sem` en el codigo): semaforo a cerrar, entero de 1 a 64.

**Errores (retorna 0)**
- `id` fuera de 1..64.
- El `id` no estaba abierto.

**Ejemplo en el flujo:** es lo ultimo que se llama. En `pingpong`, el padre hace `wait(0)` y despues `sem_close` de los dos semaforos. Si habia procesos durmiendo en `sem_down`, el `wakeup` los despierta, ven `is_open == 0` y su `sem_down` retorna 0. Una vez cerrado, el mismo `id` se puede volver a abrir con `sem_open`.

```c
int ksem_close(int sem) {
  if (sem < 1 || sem > 64) {                        // id invalido
    return 0;
  }

  acquire(&sem_table[sem].lock);

  if (!sem_table[sem].is_open) {                    // no estaba abierto: error
    release(&sem_table[sem].lock);
    return 0;
  }

  sem_table[sem].is_open = 0;                       // lo marca como cerrado
  sem_table[sem].value = 0;                         // pone el valor en 0

  wakeup(&sem_table[sem]);                          // despierta a los que esperaban en sem_down
  release(&sem_table[sem].lock);

  return sem;
}
```

### sem_down(id)

Toma / espera el semáforo `sem`. Si el valor es mayor que 0, lo decrementa en 1 y sigue. Si el valor es 0, el proceso se bloquea hasta que otro proceso haga `sem_up` (o hasta que el semáforo se cierre). El valor del semáforo nunca puede ser menor a 0.

**Parametros**
- `id` (`sem` en el codigo): semaforo a tomar, entero de 1 a 64.

**Errores (retorna 0)**
- `id` fuera de 1..64.
- El `id` no estaba abierto.
- Se cerro mientras esperaba.

**Ejemplo en el flujo:** en `pingpong`, el hijo hace `sem_down(turn_pong)` con valor 0 y se duerme. Cuando el padre imprime y hace `sem_up(turn_pong)`, el hijo despierta, rechequea el `while`, ve valor 1, lo baja a 0 e imprime.

```c
int ksem_down(int sem) {
  if (sem < 1 || sem > 64) {                        // id invalido
    return 0;
  }

  acquire(&sem_table[sem].lock);
  if (!sem_table[sem].is_open) {                    // no estaba abierto: error
    release(&sem_table[sem].lock);
    return 0;
  }
  while (sem_table[sem].value == 0) {               // while, no if: al despertar se rechequea
    sleep(&sem_table[sem], &sem_table[sem].lock);   // duerme en el canal &sem_table[sem]
    if (!sem_table[sem].is_open) {                  // lo cerraron mientras dormia: error
      release(&sem_table[sem].lock);
      return 0;
    }
  }
  sem_table[sem].value--;                           // toma una ficha

  release(&sem_table[sem].lock);

  return sem;
}
```

### sem_up(id)

Libera / señala el semáforo `sem`: incrementa su contador en 1. Si había procesos bloqueados esperando (porque hicieron `sem_down` cuando el valor era 0), los despierta para que puedan continuar. El valor puede superar el valor con el que se abrió el semáforo.

**Parametros**
- `id` (`sem` en el codigo): semaforo a incrementar, entero de 1 a 64.

**Errores (retorna 0)**
- `id` fuera de 1..64.
- El `id` no estaba abierto.
- El valor llego a `SEM_VALUE_MAX`.

**Ejemplo en el flujo:** en `pingpong`, cada proceso imprime y hace `sem_up` del semaforo del otro: asi le pasa el turno. Si el otro estaba dormido, `wakeup` lo despierta. Si todavia no llego a su `sem_down`, la ficha queda guardada en `value` y no se pierde.

```c
int ksem_up(int sem) {
  if (sem < 1 || sem > 64) {                        // id invalido
    return 0;
  }
  acquire(&sem_table[sem].lock);

  if (!sem_table[sem].is_open || sem_table[sem].value >= SEM_VALUE_MAX) { // cerrado o en el tope
    release(&sem_table[sem].lock);
    return 0;
  }

  sem_table[sem].value++;                           // agrega una ficha
  wakeup(&sem_table[sem]);                          // despierta a los dormidos en ese canal
  release(&sem_table[sem].lock);

  return sem;
}
```

### Resumen

| Syscall               | Función principal                                                            | Retorno éxito / error                                                     |
| --------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `sem_open(id, value)` | Abre e inicializa el semáforo con `value` fichas.                            | `id` / **0** (si `id` fuera de rango, `value < 0` o id ya estaba abierto). |
| `sem_close(id)`       | Marca como cerrado, pone `value` a `0` y despierta (_wakeup_) a quienes esperaban. | `id` / **0** (si no estaba abierto).                                 |
| `sem_down(id)`        | Decrementa el valor en 1. Si el valor es 0, **bloquea el proceso**.          | `id` / **0** (si no estaba abierto o fue cerrado mientras esperaba).      |
| `sem_up(id)`          | Incrementa en 1 y despierta a los procesos bloqueados en ese canal.          | `id` / **0** (si no está abierto o llegó a `SEM_VALUE_MAX = 1.000.000`).  |

### Politicas obligatorias (no las inventan ustedes)

- Doble `sem_open` en ID ya abierto da error. 
- `sem_up` puede incrementar más allá del valor inicial: es un contador real, no un binario forzado.
- `sem_close` está permitido con procesos bloqueados: el cierre despierta a los procesos dormidos y sus invocaciones a `sem_down` deben fallar y retornar `0`.
- Reabrir un `id` cerrado: `sem_open` vuelve a ser valido.
- El valor del semaforo nunca es menor a 0.
- Valor máximo: `SEM_VALUE_MAX = 1 000 000`.
- El tamaño de tabla es 65. 64 id's, y 1 de error (0)

- No podes abrir dos veces un mismo semaforo que ya esa abierto.
- Podes re abrir un semaforo que anteriormente se cerro (Sleep).
- El valor máximo de open es 1 millon. 
- La tabla son de 65, 64 sems y 1 de error (0)
- **`sem_close(id)` despierta (Hace wakeup) e invalida (Pone open = 0, value = 0.):** Los semaforos dormidos en `sem_down` cuando el semaforo se cierra deben ser despertados por `sem_close` y retornar `0`. Es válido que se llame desde un proceso que está blocked. 

**Por que no topear `sem_up` en el valor inicial:**

```c
sem_table[sem].value++;                      // correcto
if(sem_table[sem].value < valor_inicial)     // INCORRECTO
  sem_table[sem].value++;
```

Es un contador, no un binario forzado. El unico techo es `SEM_VALUE_MAX`, para evitar overflow. Topear rompe `prodcons`: `full` arranca en 0 y nunca podria subir.
### Invariantes del kernel

1. **`value` nunca es negativo:** es un contador que indica fichas disponibles. Esperar significa dormirse liberando la CPU, no dejar el valor en -1.
2. **`sem_up(id)`el contador puede crecer indefinidamente más allá de ese número inicial
3. **`sem_close(id)` despierta e invalida: (Marca is_close = 0 y hace wakeup)** quienes se durmieron en un `sem_down` cuando el semaforo se cierra deben ser despertados por `sem_close` y retornar `0`.
4. **Validacion bajo lock:** tanto el chequeo de si el semaforo esta abierto como la manipulacion de variables deben ocurrir despues de `acquire()`. Con validaciones fuera del lock, dos CPUs pueden ver el espacio libre al mismo tiempo y generar una *Race Condition*.
5. **`sleep()` siempre va dentro de un `while` y no un `if`:** `wakeup()` despierta a todos los procesos en ese canal, y al despertar el proceso debe volver a evaluar si el valor sigue siendo mayor a 0. En un `if`, varios procesos podrian pasar de largo con una sola ficha: decrementan un valor en 0, queda negativo y el semaforo deja de funcionar.

![[Pasted image 20261111182859.png]]
---

## 4. Los semaforos en el programa de `pingpong`

```
$ pingpong 3
ping
pong
ping
pong
ping
pong
```

**Contrato:**
- Son **2N lineas** alternadas, y siempre empieza con ping. Nunca hay dos ping ni dos pong seguidos.
- Hace **un solo `fork`**.
- Todo error empieza con `ERROR` en mayusculas (ej: `$ pingpong -1`).
- El prompt vuelve solo cuando el juego termino por completo.
- Al terminar, los semaforos quedan liberados.

- Estan los dos semaforos `turn_ping` en 1 y `turn_pong` en 0, para alternar la impresion de "ping" y "pong" entre un proceso padre e hijo: los dos corren concurrentemente y los semaforos los sincronizan. El hijo se crea con un `fork` y hereda una copia de la memoria del padre, incluidos los ids de los semaforos.
- Para no tener conflictos de concurrencia para varios `pingpong` a la vez, no se usan `id`s hardcodeadas. Hay una rutina, llamada `sem_get()`, que busca dinamicamente un `id` libre, probando `sem_open`.
- El proceso padre (en este caso `ping`) debe ejecutar `wait(0)` antes de hacer `sem_close` para sincronizarse con el hijo: que termine antes de que retorne el prompt del shell.

![[Pasted image 20261106080001.png|499]]

```
padre: sem_down(turn_ping) → printf ping → sem_up(turn_pong)
hijo:  sem_down(turn_pong) → printf pong → sem_up(turn_ping)
```

Cada proceso baja el suyo y sube el del otro. Nunca sube el propio.
#### Por que dos semaforos y no uno?

Con un solo semaforo en 1, los dos procesos compiten por la misma ficha:

```
ping hace down(S), imprime, up(S)     S: 1 → 0 → 1
y ahora ping puede volver a tomarla él mismo
```

Un semaforo en 1 da **exclusion mutua** ("uno a la vez"), no **orden** ("vos, despues yo"). Con dos, ping solo puede subir el de pong: darse un turno a si mismo es imposible, no improbable.

#### Esqueleto

```c
turn_ping = sem_get(1);
turn_pong = sem_get(0);

if(fork() == 0){                  // hijo
  for(i = 0; i < n; i++){
    sem_down(turn_pong);
    printf("pong\n");
    sem_up(turn_ping);
  }
  exit(0);
}
for(i = 0; i < n; i++){           // padre
  sem_down(turn_ping);
  printf("ping\n");
  sem_up(turn_pong);
}
wait(0);
sem_close(turn_ping);
sem_close(turn_pong);
```

#### sem_get: ids dinamicos

Los semaforos son globales. Si dos `pingpong` corren a la vez y los dos usan los ids 1 y 2, se pisan. Uno de los tests corre `pingpong` tres veces en paralelo.

```c
static int
sem_get(int value)   // reserva el primer id libre
{
  int id;
  for(id = 1; id < 65; id++)
    if(sem_open(id, value))
      return id;
  return 0;          // no hay ninguno libre
}
```

Funciona porque `sem_open` falla si el id ya esta abierto.

---

## 5. Los semaforos en el programa `prodcons`

- Un proceso produce ítems; otro los consume.
- Entre los dos, un buffer de capacidad B.
- Si el buffer se llena, el productor espera.
- Si se vacía, el consumidor espera.

**Invariantes:** `0 <= items en el buffer <= B`, no se consume un item que todavia no se produjo, y el acceso a la estructura del buffer es en exclusion mutua.

| | `pingpong` | `prodcons` |
| --- | --- | --- |
| Sincronizacion | Alternancia estricta | Ritmos desacoplados |
| Semaforos | Binarios (1 y 0) | Contadores (B y 0) |
| Adelantarse | Nunca | Hasta B items |

Con B = 1, `prodcons` se comporta como `pingpong`. Con B > 1, el productor puede ir varios pasos adelante, como un pipe (`cmd1 | cmd2`).

B (El buffer) es como el intermedio, el punto de stock para el productos y retiro de el consumidor.

El productor, puede encolarse N items, pero tiene una cantidad de almacenamiento B.

Y el consumidor puede consumir N items, pero consume 1 por 1 los que hay en B.

```c
// --- Creación de los semáforos ---
// Se crean ANTES del fork para que padre e hijo usen los mismos ids.
int sem_empty = sem_get(b); // lugares libres: al principio el buffer está vacío -> B libres
int sem_full = sem_get(0); // ítems disponibles: al principio no hay ninguno -> 0
int sem_mutex = sem_get(1); // mutex: 1 = "la sección crítica está libre"

// produce
for (k = 1; k <= n; k++) {
    sem_down(empty);  // ¿Hay lugar libre en el depósito?
    sem_down(mutex);  // Pide permiso para imprimir
    printf("produce %d pid=%d\n", k, getpid());
    sem_up(mutex);    // Suelta el permiso de impresión
    sem_up(full);     // Avisa: "agregué un ítem al depósito"
}

// consume 
for (i = 0; i < n; i++) {
    sem_down(full);                       // 1. ¿Hay algún ítem listo? Si full == 0, duerme
    sem_down(mutex);                      // 2. Pide el turno para imprimir
    printf("consume pid=%d\n", getpid()); // 3. Consume el ítem
    sem_up(mutex);                        // 4. Suelta el permiso de impresión
    sem_up(empty);                        // 5. Devuelve un lugar libre en el depósito
}
```

**### 1. ¿Qué define cada semáforo?

| **Semáforo** | **Arranca en** | **Rol exacto**                                                                                                              |
| ------------ | -------------- | --------------------------------------------------------------------------------------------------------------------------- |
| **`empty`**  | **`B`**        | Cuenta los **lugares libres** en el depósito. El productor hace `down(empty)` para gastar un lugar libre antes de fabricar. |
| **`full`**   | **`0`**        | Cuenta los **ítems disponibles de retiro. El consumidor hace `down(full)` para llevarse un ítem.                            |
| **`mutex`**  | **`1`**        | Candado binario de exclusión mutua. En este lab protege el `printf` para que las líneas de texto no se mezclen.             |

### Dos semaforos contadores

![[Pasted image 20261106080016.png]]

El productor gasta un lugar libre y suma un item. El consumidor gasta un item y devuelve un lugar.

```
productor:  down(empty) → produce → up(full)
consumidor: down(full)  → consume → up(empty)
```

Igual que en `pingpong`, cada uno baja el suyo y sube el del otro. La diferencia es que ahora hay hasta B fichas circulando, no una sola.

Paso a paso con B = 3:

| Que pasa               | `empty` | `full` | En vuelo             |
| ---------------------- | ------- | ------ | -------------------- |
| Estado inicial         | 3       | 0      | 0                    |
| P produce 1, 2, 3      | 0       | 3      | 3                    |
| P quiere producir 4    | 0       | 3      | Bloqueado en `empty` |
| C consume              | 1       | 2      | 2                    |
| P despierta, produce 4 | 0       | 3      | 3                    |
| C consume todo         | 3       | 0      | 0                    |
| C quiere consumir      | 3       | 0      | Bloqueado en `full`  |

`empty + full = B`, salvo en el instante entre un `down` y su `up`.

### Donde esta el buffer?

Despues de `fork`, padre e hijo no comparten memoria de usuario: un `int buffer[B]` en cada uno son dos arreglos distintos. En este lab el buffer es **logico**: lo que importa es cuantos items hay "en vuelo", y eso lo cuentan los semaforos. La evidencia es la salida.

### El tercer semaforo: mutex

El `printf` de xv6 hace un `write` por caracter. Si productor y consumidor imprimen a la vez, las lineas se mezclan:

```
prcoondsuucmee 1p ipdi=d5=
4
```

`mutex` arranca en 1 y protege la impresion: una linea completa por vez. Los tests cuentan por linea, asi que una linea partida no cuenta como `produce` ni como `consume`.

### El orden de los down importa

```c
down(empty); down(mutex);   // bien: primero el recurso
down(mutex); down(empty);   // MAL
```

1. Con el buffer lleno, el productor toma el mutex y se duerme en `empty` con el mutex tomado.
2. El consumidor baja `full` y se bloquea en `mutex`: nunca llega a subir `empty`.
3. **Deadlock:** cada uno espera algo que tiene el otro.

### Interfaz y salida

```
$ prodcons
ERROR: uso: prodcons B N | prodcons B N P C
$ prodcons 0 5
ERROR: B y N deben ser enteros >= 1
$ prodcons 1 3
produce 1 pid=4
consume pid=5
produce 2 pid=4
consume pid=5
produce 3 pid=4
consume pid=5
```

- `B`: capacidad del buffer. `N`: items a producir y a consumir.
- **Un solo `fork`:** un productor (items 1..N) y un consumidor (N consumos).
- Con B = 1 es alternado, obligatoriamente. Con B = 2 puede haber dos `produce` seguidos, pero nunca tres items en vuelo.
- El pid muestra que son procesos distintos.
- La sincronizacion se hace sin busy-wait.

### Esqueleto

```c
empty = sem_get(B); full = sem_get(0); mutex = sem_get(1);

if(fork() == 0){                  // hijo: consumidor
  for(i = 0; i < n; i++){
    sem_down(full);
    sem_down(mutex);
    printf("consume pid=%d\n", getpid());
    sem_up(mutex);
    sem_up(empty);
  }
  exit(0);
}
for(k = 1; k <= n; k++){          // padre: productor
  sem_down(empty);
  sem_down(mutex);
  printf("produce %d pid=%d\n", k, getpid());
  sem_up(mutex);
  sem_up(full);
}
wait(0);
sem_close(empty); sem_close(full); sem_close(mutex);
```

- `sem_get` es el mismo de `pingpong`: nada de ids hardcodeados.
- El `printf` va entre el `down` y el `up`: asi la salida refleja el orden real de los semaforos.
- `wait(0)` va antes de cerrar: si el padre cierra con el hijo bloqueado, el `sem_down` del hijo devuelve 0.

### Por que 1 productor y 1 consumidor no necesitan mutex sobre el buffer

Un buffer acotado real tiene dos punteros: `out` dice de donde leer e `in` donde escribir. Al llegar al final vuelven al principio: por eso es circular, y por eso aparece el `% B`.

```
        out                 in
         ▼                  ▼
       | A | B | C |   |   |   |     ocupados: full = 3    libres: empty = 3
```

Con un productor y un consumidor, cada puntero tiene un solo dueño: `in` lo mueve solo el productor y `out` solo el consumidor. No hay ninguna variable que los dos escriban. Y nunca trabajan sobre la misma celda: `empty` garantiza que el productor escribe en un lugar libre, y `full` que el consumidor lee uno ocupado.

### Que se rompe con varios

Con dos productores, `in` pasa a ser compartida:

| Productor A   | Productor B   | `in` |
| ------------- | ------------- | ---- |
| `down(empty)` ok |            | 0    |
|               | `down(empty)` ok | 0 |
| Lee `in` → 0  |               | 0    |
|               | Lee `in` → 0 (¡el mismo!) | 0 |
|               | `buffer[0] = B; in = 1` | 1 |
| `buffer[0] = A` (pisa a B) |  | 1    |
| `in = 1` (no 2) |             | 1    |

`full` dice 2 items, pero en el buffer hay 1.

`empty` y `full` hicieron su trabajo: habia lugar para dos y pasaron dos. Lo que se corrompio fue `in`, que ningun semaforo protegia.

> **Los contadores dan permiso, no exclusion.** Te dicen "podes entrar"; si dos reciben permiso a la vez, entran los dos.

Por eso el mutex es obligatorio apenas hay P > 1 o C > 1. En el `prodcons` del lab no hay indices, pero si una seccion critica: la impresion. Mismo rol, distinto objeto: en el buffer real el mutex protege la estructura, y aca protege la salida.

### Punto estrella: prodcons B N P C

Son P productores y C consumidores, con varios `fork`. Los mismos tres semaforos se comparten entre todos, porque son globales del kernel.

```
cada uno de los P productores:      cada uno de los C consumidores:
  por cada item que le toca:          por cada item que le toca:
    down(empty)                         down(full)
    down(mutex)                         down(mutex)
    imprimir produce                    imprimir consume
    up(mutex)                           up(mutex)
    up(full)                            up(empty)
```

- **Repartir:** entre todos, exactamente N. Cada consumidor tiene que saber cuantos le tocan: si no, el ultimo se queda esperando un item que nunca llega.
- **Terminar:** el padre espera a los P+C hijos, y recien ahi cierra los semaforos.

### Un caso real: los pipes

Un pipe (`cat archivo | wc -l`) **es** un buffer acotado en el kernel:

- Si `cmd1` escribe mas rapido de lo que `cmd2` lee, el buffer se llena y `cmd1` se bloquea.
- Si `cmd2` lee mas rapido, el buffer se vacia y `cmd2` se bloquea.

```c
#define PIPESIZE 512
struct pipe {
  struct spinlock lock;
  char data[PIPESIZE];
  uint nread;     // cuántos bytes se leyeron (en total)
  uint nwrite;    // cuántos bytes se escribieron (en total)
  int readopen;
  int writeopen;
};
```

`nread` y `nwrite` nunca se reinician: crecen para siempre. `nwrite - nread` es cuantos items hay en vuelo, y `% PIPESIZE` convierte el contador infinito en el indice circular.

```c
// pipewrite: esperar cuando está lleno
if(pi->nwrite == pi->nread + PIPESIZE){
  wakeup(&pi->nread);
  sleep(&pi->nwrite, &pi->lock);
} else {
  pi->data[pi->nwrite++ % PIPESIZE] = ch;
}

// piperead: esperar cuando está vacío
while(pi->nread == pi->nwrite && pi->writeopen){
  sleep(&pi->nread, &pi->lock);
}
...
ch = pi->data[pi->nread++ % PIPESIZE];
...
wakeup(&pi->nwrite);
```

Otra vez aparece el `while`, por lo mismo de siempre. En `pipewrite` no se ve porque la filmina recorta: ese `if` esta adentro del loop `while(i < n)` que recorre los bytes, asi que despues de `sleep` el loop vuelve y rechequea la condicion.

| `prodcons`                   | `pipe.c`                       |
| ---------------------------- | ------------------------------ |
| `B`                          | `PIPESIZE` (512)               |
| `full` (items listos)        | `nwrite - nread`               |
| `empty` (lugares libres)     | `PIPESIZE - (nwrite - nread)`  |
| Lleno → el productor espera  | `sleep(&pi->nwrite)`           |
| Vacio → el consumidor espera | `sleep(&pi->nread)`            |
| `up(full)`                   | `wakeup(&pi->nread)`           |
| `up(empty)`                  | `wakeup(&pi->nwrite)`          |
| `mutex`                      | `pi->lock`                     |

| Lab                           | xv6                          |
| ----------------------------- | ---------------------------- |
| 3 semaforos contadores        | 1 spinlock + 2 canales de `sleep` |
| El contador es el estado      | El estado son `nread`/`nwrite` |

- xv6 no trae semaforos en el kernel: tiene `sleep`/`wakeup`, que es una condition variable. Con una CV hay que llevar el estado aparte; con un semaforo, el contador ya lo es.
- **Por que el pipe si tiene un buffer de verdad?** Porque vive en el kernel, cuya memoria es compartida por construccion. Dos procesos de usuario, despues de `fork`, no comparten nada.

### los id's de semaforos son globales
No podés hardcodear IDs (como poner `sem_open(1, ...)` y `sem_open(2, ...)`) porque **los semáforos son un recurso global compartido en el kernel entre todos los procesos del sistema operativo**

### Mismo patron en otros lados

- **POSIX:** `sem_open`, `sem_wait` (≈ `sem_down`), `sem_post` (≈ `sem_up`). Con valor 0, `sem_wait` bloquea hasta un post. Hay dos tipos (`sem_overview(7)`):
    - **Con nombre (named):** se identifican por un nombre, asi que los pueden usar procesos no relacionados. Los del lab son de este estilo, con un entero como nombre.
    - **Sin nombre (unnamed):** no tienen nombre y viven en memoria compartida por quienes los usan.
- **Java:** `java.util.concurrent.Semaphore`.
- **Go:** un canal con buffer, `make(chan T, B)`.
- **Otros productor-consumidor:** colas de mensajes (Kafka, RabbitMQ), spoolers de impresion, buffers de red, logging asincrono.

---

### Distingo spinlock (acquire/release) de espera (sleep/wakeup)

Spinlock es lógico usarlo si la operacion dura nano segundos, que usa para quemar tiempo de cpu en lo que se hace un acquire, que se apropia un lock, y permita que 1 proceso modifique 1 solol semaforo.

  

Sleep simplemente DUERME el proceso, (algo similar a blocked), haciendo que no pueda hacer nada. Es posible despertarlo si se llama wakeup() que lo hace sem_close o sem_up. Si vlaue = 0, se duerme al pingo


## 6. Debugging [Relaciono síntomas típicos (cuelgue, dos ping, prompt temprano) con su causa  ]

Cuando las `sem_*` fallan o `pingpong` no anda, hay que ir del sintoma a la causa.

**Kernel**

| Sintoma                              | Causa probable                                        |
| ------------------------------------ | ----------------------------------------------------- |
| QEMU se cuelga y no vuelve           | Un `sem_down` sin su `sem_up`, o `sleep` con el lock equivocado |
| `panic: acquire`                     | Tomaron el mismo lock dos veces                       |
| `panic: sched locks`                 | Se durmieron con un spinlock tomado                   |
| Todo devuelve 0 siempre              | Los stubs sin reemplazar                              |
| Anda con 1 proceso, falla con varios | Validacion fuera del lock                             |

**pingpong**

| Sintoma                              | Causa probable                            |
| ------------------------------------ | ----------------------------------------- |
| Empieza con pong                     | Valores iniciales invertidos              |
| A veces salen dos ping seguidos      | `if` en lugar de `while` (contador negativo) |
| Anda solo, falla el test de concurrencia | Ids hardcodeados                      |
| Se cuelga con N grande               | Falta un `sem_up` en algun camino         |
| Sale bien pero el prompt no vuelve   | Falta `wait(0)`                           |

**prodcons**

| Sintoma                           | Donde mirar                                               |
| --------------------------------- | --------------------------------------------------------- |
| Se cuelga                         | Un `down` sin su `up`, o `empty`/`full` mal inicializados |
| Mas de B producidos sin consumir  | ¿`empty` arranca en B?                                    |
| Faltan o sobran items             | Los loops de N, en productor y consumidor                 |
| Lineas partidas                   | El `printf` quedo fuera del mutex                         |
| Algo despues del `DONE`           | El padre no espera al hijo                                |
| Anda solo, falla con otro al lado | Ids de semaforo fijos                                     |

| Error en `prodcons`            | Que pasa                                      |
| ------------------------------ | --------------------------------------------- |
| `full` arranca en B            | El consumidor consume lo que no existe        |
| `empty` arranca en 0           | Deadlock desde el primer item                 |
| `mutex` antes del recurso      | Deadlock con el buffer lleno o vacio          |
| `printf` fuera del par down/up | La salida viola la capacidad                  |
| Sin `wait` o sin `sem_close`   | El shell vuelve antes / ids que no se liberan |

**Otros errores frecuentes**

- `id == 0` no validado.
- Devolver el indice del arreglo en lugar del id.
- `sem_close` sin `wakeup`: los bloqueados no se enteran (falla `closeuse`).
- `sem_up` topeado en el valor inicial (falla `grow`).
- Imprimir sin `sem_down` previo.
- No liberar los semaforos al terminar.

**Los 6 tests de semtest**

| Test       | Que mira                               |
| ---------- | -------------------------------------- |
| `noinit`   | Usar un semaforo que nunca se abrio    |
| `init`     | Que el valor inicial sea el pedido     |
| `closeuse` | Usar uno ya cerrado                    |
| `exhaust`  | Quedarse sin ids, y reusar tras cerrar |
| `grow`     | Que `sem_up` pase el valor inicial     |
| `reopen`   | Cerrar y volver a abrir el mismo id    |
|            |                                        |

**Que miran los tests de prodcons**

- Sin argumentos o con argumentos invalidos, aparece una linea que empieza con `ERROR`.
- Hay N lineas `produce` y N `consume`.
- Recorren la salida contando: `produce` suma 1 y `consume` resta 1. El maximo no pasa de B y al final da 0.
- Corren `prodcons B N; echo DONE`: despues del `DONE` no puede aparecer nada. Si el padre termina antes que el hijo, el shell sigue y el hijo imprime despues.

**Corrida concurrente:** con `pingpong 5 & ; prodcons 3 10` las lineas de los dos programas se mezclan letra por letra, y esta bien. Usan semaforos distintos y xv6 corre en 3 CPUs, asi que nada ordena un programa respecto del otro. Lo que tiene que valer es el orden dentro de cada programa.

**Tecnicas**

- `Ctrl-p` dentro de xv6 lista los procesos y su estado. Si ven varios en sleep, es un deadlock.
- Trazas desde user space: un `printf` con `getpid()` antes y despues del `sem_down`.

**Antes de pedir ayuda**

1. ¿Que test falla? `make grade-parcial` lo dice.
2. ¿Pasa siempre o a veces? A veces = carrera; siempre = logica.
3. ¿Anda con un proceso y falla con varios? Mira los locks.
4. ¿Cuelga o devuelve mal? Cuelga = `sleep`; mal = validacion.


### Deadlock en prodcons:
es acquire, luego sleep, entonces causa el deadlock. por eso sleep tiene el sem y el lock.

Aca pasaria, que el consumidor se duerme, por que esta esperando al productor producir algo, pero nunca produce algo por que esta esperando que el consumidor consuma.

es esperar un resultado que nunca llega. O una notificacion pero nuncca llega

### Explico 1P+1C sin mutex vs multi P/C con mutex 

- **1P + 1C:** no necesitan mutex porque cada variable hay **un único dueño**. Un consumidor, y un productor. El productor es el único que modifica `in` y el consumidor es el único que modifica `out`. Como `empty` y `full` impiden que ambos operen en la misma celda a la vez, no hay accesos concurrentes destructivos.
    
- **Multi P o Multi C ($P > 1$ o $C > 1$):** los contadores (`empty`/`full`) dan **permiso de entrada, no exclusión mutua**. Si hay 2 lugares libres, dos productores pasan el `sem_down(empty)` al mismo tiempo, leen la misma variable compartida `in` y **uno pisa al otro corrompiendo la estructura de datos**. Ahí el `mutex` es estrictamente obligatorio para proteger la estructura del buffer.

En realidad en el lab, lo que pasa es que no se imprime correctamente.,

###  Sé por qué no hay que fijar ids de semáforo entre programas  

No es lo mismo q con globales?
pero basicamente si usamos id's fijas, podemos mezclar semaforos de distintos procesos por que los semaforos son globales en el kernel.

### relaciono el problema con pipes
Pensalo así de simple:

1. **El escritor es el Productor:** mete bytes con `write()`.
2. **El lector es el Consumidor:** saca bytes con `read()`.
3. **El pipe es el Buffer ($B$):** es una cajita fija de **512 bytes** en el kernel.

 ¿Cómo se frenan? (Igual que en tu código)

- **Si el pipe se llena:** el escritor se va a dormir (`sleep`) hasta que el lector saque bytes y haga espacio.
    
- **Si el pipe está vacío:** el lector se va a dormir (`sleep`) hasta que el escritor meta datos.
    
 La única diferencia con tu lab

- En tu `prodcons` usás **3 semáforos** (`empty`, `full`, `mutex`).
    
- En el kernel de xv6 (`pipe.c`) no hay semáforos: usan directamente **1 lock + `sleep` / `wakeup`**.

### 1. Lost Wakeup y por qué `sleep` lleva el lock (Ítem 13)

Tu intuición de "olvidarse de despertarlo" va por el camino del síntoma, pero la causa técnica no es olvido: es una **condición de carrera temporal** donde el aviso ocurre **demasiado temprano**.

- **La analogía:**
    
    Querés irte a dormir la siesta y le decís a tu amigo: _"Cuando llegue el cartero, tocame el timbre"_.
    
    Si primero abrís la puerta y después te vas caminando lento a la cama, tu amigo puede tocar el timbre **mientras todavía estás caminando por el pasillo**. Vos no lo escuchás porque aún no estabas en la cama con el oído atento. Tu amigo cree que ya te avisó y se va; vos te acostás y **te quedás esperando un timbre que ya sonó y nadie volverá a tocar**.
    
- **En el código de xv6:**
    
    Si soltaras el spinlock antes de llamar a `sleep`:
    
    1. La CPU 1 ve `value == 0`, suelta el lock con `release(&sem->lock)`.
        
    2. En esa milésima de segundo, la CPU 2 toma el lock, hace `value++` y llama a `wakeup()`.
        
    3. Como el proceso de la CPU 1 **todavía no terminó de registrarse como dormido** en el kernel, el `wakeup()` busca en la tabla de procesos, no encuentra a nadie en `SLEEPING` y el grito se pierde en la nada.
        
    4. La CPU 1 retoma y se duerme (`sleep`). Se queda esperando un `wakeup` que ya ocurrió y no volverá a suceder.
        
- **Por qué `sleep(chan, &lock)` recibe el lock:**
    
    Para que **soltar el lock y marcar el proceso como `SLEEPING` sea una operación indivisible (atómica)**. La CPU 2 no puede hacer `acquire`, sumar la ficha ni mandar el `wakeup` hasta que el proceso que duerme esté 100% acostado y registrado en la lista de espera.
    

### 2. Qué es el canal y por qué deben coincidir (Ítem 14)

- **¿Qué es un canal (`chan`)?**
    
    Un canal es simplemente un **número o dirección de memoria que sirve de etiqueta o cartel identificador**. No es un cable ni un buffer; es una dirección de memoria como `&sem_table[id]` o `&pi->nread`.
    
- **Por qué deben coincidir:**
    
    Cuando un proceso duerme con `sleep(chan, lock)`, el kernel anota en su ficha interna: `p->chan = chan`.
    
    Cuando otro llama a `wakeup(chan)`, el kernel recorre la lista de procesos buscando estrictamente:
    
    `if (p->state == SLEEPING && p->chan == chan) p->state = RUNNABLE;`
    
    Si `sleep` duerme usando un puntero (ej. `&sem_table[1]`) y `wakeup` usa otro distinto (ej. `&sem_table[2]` o una dirección local errónea), la comparación da falso: el proceso **nunca se entera del despertar y queda congelado para siempre**.
    

### 3. POSIX: Named vs. Unnamed y wait/post (Ítem 15)

POSIX es el estándar que siguen Linux y Unix para semáforos (`man 7 sem_overview`):

- **Named (con nombre):**
    
    Tienen un identificador visible en el sistema (en Linux un nombre tipo `"/mi_semaforo"`, en tu lab un número `id` del 1 al 64). Viven administrados globalmente por el kernel, por lo que **cualquier proceso independiente puede abrirlo y usarlo para sincronizarse**. Son exactamente los que programaste en xv6.
    
- **Unnamed (sin nombre):**
    
    No tienen nombre ni entrada en el kernel; son una simple variable tipo `sem_t` que colocás en la memoria RAM compartida entre hilos (`threads`) o entre procesos con memoria compartida explícita (`shm_open`).
    
- **Analogía `wait` y `post`:**
    
    - `sem_wait()` en POSIX es equivalente a tu **`sem_down()`** (operación P de Dijkstra): descuenta 1 o bloquea si no hay fichas.
        
    - `sem_post()` en POSIX es equivalente a tu **`sem_up()`** (operación V de Dijkstra): incrementa 1 ficha y despierta a los que esperan.
- 
---

## Glosario que necesito saber (en xv6)

- **Deadlock:** procesos o CPUs esperando algo que solo puede liberar otro que tambien esta esperando, asi que nadie avanza. Ej: en `prodcons`, tomar el mutex y bloquearse en `empty` o `full` con el mutex tomado.
- **Spinlock:** el lock del kernel de xv6 (`struct spinlock`, `kernel/spinlock.c`). `acquire` gira hasta conseguirlo y apaga las interrupciones de esa CPU; `release` lo suelta. Es para secciones cortas. Tomar dos veces el mismo da `panic: acquire`.
- **Race Condition:** dos o mas flujos acceden a un dato compartido sin sincronizarse, al menos uno escribe, y el resultado depende del intercalado. En xv6 pasa entre CPUs sobre datos del kernel, como `sem_table`.
- **Lost wakeup:** un `wakeup` que ocurre antes de que el proceso termine de dormirse: no despierta a nadie y el proceso queda dormido para siempre. `sleep(chan, lock)` lo evita.
- **sem_table:** arreglo global del kernel con 65 `struct sem`. Se usan los ids 1..64; el 0 queda sin uso porque retornar 0 significa error. Es uno solo para todos los procesos.
- **Semaforos:** contador del kernel con `sem_down` (toma una ficha o duerme) y `sem_up` (agrega una ficha y despierta). En el lab son nombrados por un id entero y se usan desde usuario con syscalls.
- **lock:** mecanismo de exclusion mutua: solo quien lo tiene entra a la seccion critica. En el lab, el kernel usa spinlocks.
- **mutex:** un lock usado para exclusion mutua. xv6 no trae un tipo `mutex`: en el kernel se usa un spinlock, y desde usuario se arma con un semaforo inicializado en 1.
- **trapframe:** estructura de cada proceso (`struct trapframe`, `kernel/proc.h`) donde se guardan los registros de usuario al entrar al kernel. `argint` lee de ahi los argumentos de la syscall.
- **busywait:** esperar girando en un loop y gastando CPU. Es lo que hace `acquire`; `sleep` existe para no hacerlo en esperas largas.
- **QEMU:** emulador donde corre xv6: simula una maquina RISC-V con varias CPUs, sin necesidad de hardware real. Se arranca con `make qemu` y se sale con `Ctrl-a x`. Si "se cuelga QEMU", suele ser xv6 trabado, por ejemplo un `sem_down` sin su `sem_up` o un `sleep` con el lock o canal equivocado.

---

## Auto-chequeo

Explicar cada uno en voz alta, 2 o 3 minutos.

- [ ] `acquire`/`release` vs `sleep`/`wakeup`
- [ ] Doble `sem_open` y `sem_close` con waiters
- [ ] `pingpong`: dos semaforos y valores 1/0; por que falta `wait` rompe el prompt
- [ ] `empty=B`, `full=0`
- [ ] Por que `while` despues de `wakeup`
- [ ] Por que `empty`/`full` no alcanzan con varios productores
- [ ] Que falla si validas "ya abierto" fuera del lock
- [ ] Por que hardcodear ids rompe la corrida concurrente `pingpong` + `prodcons`
