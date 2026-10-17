## II. Explicación Sintética de las Syscalls y Mecanismo de Invocación
### 1. Definición de Syscalls y Políticas de Fallo

**¿Qué es una Syscall y por qué existe?**

- El hardware asiste al sistema operativo proveyendo dos modos de ejecución: **modo usuario** (donde los programas están restringidos y no tienen acceso directo al hardware) y **modo kernel** (donde el SO tiene acceso total a la máquina).
    
- Si no existiera esta separación, cualquier proceso de usuario podría hacer operaciones de I/O directo al disco, leer o sobrescribir archivos sin chequear permisos y romper toda la protección del sistema.
    
- Las **syscalls** son el mecanismo controlado por hardware y software para que un programa de usuario solicite un servicio privilegiado al kernel (hacer I/O, crear procesos o sincronizarse con semáforos). El proceso ejecuta una instrucción especial de **trap** (`ecall` en RISC-V) que eleva el privilegio a modo kernel, ejecuta la operación de forma segura y vuelve al usuario mediante un **return-from-trap** (`sret`).
    

**Políticas de fallo implementadas:**

- Siguiendo la convención del laboratorio, todas nuestras syscalls retornan **`0` en caso de error** y el **ID del semáforo (`sem > 0`) en caso de éxito**:
    
    - **`sem_open(sem, value)`**: Falla si `sem` está fuera del rango ($1 \le sem \le 64$), si `value < 0`, o si el semáforo ya estaba abierto (no permitimos reinicializar en caliente).
        
    - **`sem_close(sem)`**: Falla si `sem` está fuera de rango o no estaba abierto. Si hay procesos bloqueados esperando en ese semáforo, los despierta para que su espera falle inmediatamente.
        
    - **`sem_down(sem)`**: Falla si `sem` está fuera de rango, no está abierto, o si otro proceso cierra el semáforo mientras este proceso estaba bloqueado esperando.
        
    - **`sem_up(sem)`**: Falla si `sem` está fuera de rango, no está abierto, o si el contador ya alcanzó el tope `SEM_VALUE_MAX` (1.000.000).
        

### 2. Mecanismo de Invocación (Recorrido en el código)

**En Espacio de Usuario:**

- **`user/user.h`**: Declaramos los prototipos de las syscalls para que el usuario las llame como funciones normales de C. Por la convención ABI de RISC-V, al invocar por ejemplo `sem_open(1, 5)`, el compilador guarda el primer argumento en el registro **`a0`** y el segundo en **`a1`**.
    
- **`user/usys.pl` ($\to$ `usys.S`)**: Agregamos las entradas en este script de Perl para que al compilar genere los _stubs_ en ensamblador (`usys.S`). Este código puente carga el número identificador de la syscall en el registro **`a7`** y ejecuta la instrucción **`ecall`** (el _trap_) para saltar al kernel.
    

**En Espacio de Kernel:**

- **`kernel/syscall.h`**: Funciona como el contrato entre usuario y kernel. Como la CPU en el _trap_ no entiende nombres de funciones de C, asignamos con `#define` un número único a cada syscall (del 22 al 25), que es el valor que el _stub_ carga en `a7`.
    
- **`kernel/syscall.c`**:
    
    1. Arriba vemos `argraw()` y `argint()`, que sirven para rescatar los argumentos pasados de riscv
        
    2. Declaramos los prototipos `extern uint64 sys_sem_...` avisando que la implementación está en otro archivo (`sysproc.c`), y los mapeamos en el arreglo de punteros a función **`syscalls[]`**.
        
    3. La función **`syscall()`** hace el despacho: lee el número de syscall desde `p->trapframe->a7`, ejecuta la función en `syscalls[num]()`, y guarda el resultado final en **`p->trapframe->a0`** para que el usuario reciba ahí el código de éxito o error al volver del _trap_.
        
- **`kernel/defs.h`**: Declaramos los prototipos internos `ksem_open`, `ksem_close`, `ksem_up` y `ksem_down` para conectar `sysproc.c` con la lógica del semáforo.
    
- **`kernel/sysproc.c`**: Actúa como wrapper y primer filtro:
    
    1. Extrae los argumentos del `trapframe` usando `argint(0, &sem)` y `argint(1, &value)`.
        
    2. Valida los rangos iniciales (`sem < 1 || sem > 64` y `value < 0`), retornando `0` si fallan.
        
    3. Si los parámetros son válidos, delega la sincronización y las validaciones de estado a las funciones internas `ksem_*`.




1. **Definición de Syscalls:** Proveer una explicación sintética de las syscalls.

inspo de q decir:
"The hardware assists the OS by providing different modes of execution.
in user mode, applications do not have full access to hardware resources. In kernel mode, the OS has access to the full resources of the machine. Special instructions to trap into the kernel and return-from-trap back to user-mode programs are also provided, as well instructions that allow the OS to tell the hardware where the trap table resides in memory.

One approach would simply be to let any process do whatever it wants in terms of I/O and other related operations. However, doing so would prevent the construction of many kinds of systems that are desirable. For example, if we wish to build a file system that checks permissions before granting access to a file, we can’t simply let any user process issue I/Os to the disk; if we did, a process could simply read or write the entire disk and thus all protections would be lost. Thus, the approach we take is to introduce a new processor mode, known as user mode; code that runs in user mode is restricted in what it can do. For example, when running in user mode, a process can’t issue I/O requests; doing so would result in the processor raising an exception; the OS would then likely kill the process. In contrast to user mode is kernel mode, which the operating system (or kernel) runs in. In this mode, code that runs can do what it likes, including privileged operations such as issuing I/O requests and executing all types of restricted instructions.
"

El hardware asiste al sistema operativo proveyendo distintos modos de ejecucion. En modo usuario los programas no tienen acceso completo al hardware, pero en modo kernel sí tiene acceso completo al hardware. Por esto, están las syscalls que son un mecanismo proveido por el sistema operativo, siendo controlado por hardware y software para que un programa en espacio de usuario pase a kernel mode para poder solicitar algo  privilegiado como algo I/O (disco, teclado, etc), crear procesos o hacer algo con semaforos, provocando un "trap", sin darle al usuario control directo sobre el hardware, para que cuando se ejecute esto la syscall y vuelva a usuario se haga un "return from trap".

si no fuera por esto, cualquier proceso podria hacer cualquier cosa en terminos de i/o y otro tipo de operaciones, por ejemplo si quisieramos hacer un sistema de archivos, que checkea permisos hacentes de darle permisos al rchivo, no podriamos dejar que ningun proceso de usuario haga un i/o al disco, pues si lo hicieramos literalmente podria leer o escribir todo el disco y toda la proteccion se perderia.

Gracias a las syscalls, se nos permite interactur de manera indirecta con el hardware si creamos una adecuadamente (como para este caso, semaforos en xv6.), crear procesos, pasar argumentos, etc.
def

   - Analizar y definir las políticas de fallos.

Para las syscalls implementadas, ademas de que el Mecanismo de Invocación que se explica mas adelante, tomamos la convencion que se nos pidio en el pdf del laboratorio, siendo que en caso de error de que las syscalls fallen, todas las syscalls retornan `0`. Si la operación tiene éxito, retornan el identificador del semáforo, en detalle: 

- `sem_open(sem, value)`: Falla si `sem` está fuera del rango permitido ($1 \le sem \le 64$), si `value < 0`, o si el semáforo ya se encuentra abierto (no se permite re-inicialización en caliente).
    
- `sem_close(sem)`: Falla si `sem` está fuera de rango o si el semáforo no estaba abierto. Si se cierra con procesos bloqueados en él, los despierta para que su espera falle inmediatamente.
    
- `sem_down(sem)`: Falla si `sem` está fuera de rango, no está abierto, o si el semáforo es cerrado por otro proceso mientras estaba bloqueado esperando.
    
- `sem_up(sem)`: Falla si `sem` está fuera de rango, no está abierto, o si su valor alcanzaría el límite máximo `SEM_VALUE_MAX` ($1\,000\,000$).


1. **Mecanismo de Invocación:** Explicar el flujo desde el modo usuario hasta el modo kernel.
   - Tener en cuenta el pase de argumentos a través de los registros **a0, a1, ...**.

sobre el mecanismo de invocacion, sabemos que la syscalls empiezan por llamarse en el espacio de usuario, o sea el user mode, pasando por el kernel (y haciendo sus operaciones propias / logica propia), hasta volver al espacio de usuario de nuevo con un codigo de retorno (En caso de fallo o exito) + la operacion hecha (si es que no fallo)

### Espacio de usuario: 

	user.h
En user.h se declara el protitipo, el programa hace la llamada de función habitual, como un semaforo por ejemplo. 

**Paso de argumentos:** Según la ABI de RISC-V, el compilador ubica los argumentos en los registros de propósito general:
- `a0` $\leftarrow 1$ (primer argumento: `sem`)
 - `a1` $\leftarrow 5$ (segundo argumento: `value`)

	`usys.pl`

Luego, se declara en el pequeño script en perl para poder generar los .asm para hacer una funcion como "puente" entre C y CPU, creando usys.s, o sea los stubs para las syscalls. 

### Espacio Kernel

	syscall.h
"Son los identificadores numéricos que usaba el stub en el registro `a7`"

El archivo `syscall.h` es el "contrato". Con los #define se le asignan un número único. Luego, el código ensamblador generado (el _stub_) simplemente guarda el `22` en un registro predecible (en RISC-V es el `a7`) justo antes de ejecutar la instrucción de _trap_. Una vez dentro, el kernel lee ese número del registro y sabe exactamente qué rutina ejecutar, sin necesidad de lidiar con nombres, cadenas de texto o direcciones de memoria del espacio de usuario.

"Therein, whether for open() or any of the other system calls provided, the library uses an agreed-upon calling convention with the kernel to put the arguments to open in well-known locations (e.g., on the stack, or in specific registers), **puts the system-call number into a well-known location as well (again, onto the stack or a register), and then executes the aforementioned trap instruction.**"


	syscall.c


Se declaran los Prototipos (`extern uint64 sys_sem_...`), para avisar al compilador que las funciones que manejan los semáforos están definidas en `sysproc.c`, retornan `uint64` porque coinciden con el tamaño de los registros de 64 bits de RISC-V donde se guardará el resultado.

Estos protitpos, se agregan a la tabla de ruteo `syscalls[]` , que es un arreglo de punteros a función. Funciona como un diccionario que empareja el número de identificación que viene de espacio de usuario (por ejemplo, `SYS_sem_open`) con la función real del kernel que debe ejecutarse (`sys_sem_open`), siendo la funcion `syscall()`
Es el motor principal que ejecuta la llamada. Hace tres cosas exactas:
1. Lee el ID de la syscall que el hardware guardó en el registro `a7` (`p->trapframe->a7`).
2. Usa ese número como índice en el arreglo `syscalls[]` para invocar la función correspondiente.
3. Toma el valor que retorna tu función (el ID del semáforo o `0` por error) y lo guarda en el registro de retorno `a0` (`p->trapframe->a0`) para que llegue de vuelta al programa del usuario.

	`defs.h`

Declara la existencia de las funciones `ksem_*` para que el compilador sepa qué parámetros reciben y permita invocarlas desde otros archivos del kernel (en este caso, desde `sysproc.c`).

	`sysproc.c` 

Actúa como un escudo protector entre el espacio de usuario y la lógica central del sistema operativo. Hace exactamente dos cosas:

1. **Extrae argumentos:** Usa `argint` para leer los parámetros (`sem`, `value`) desde el `trapframe` del usuario, ya que el kernel no puede leerlos como argumentos normales de C.
    
2. **Aplica las políticas de fallo:** Valida estrictamente las reglas del laboratorio (que el id esté entre $1$ y $64$, que el valor inicial sea $\ge 0$). Si algo es inválido, aborta la operación retornando `0`. Si es válido, recién ahí delega la ejecución real llamando a las funciones internas `ksem_*`



