---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
Virtualización ^FwV6dcoe

Virtualización Del CPU ^8XFwsNHh

Virtualización De la memoria ^1UGfNRJ2

Es el mecanismo mediante el cual el Sistema Operativo crea la ilusión de que cada proceso tiene una CPU dedicada y propia, cuando en realidad los procesos se turnan para usar los núcleos físicos de la computadora mediante un planificador (scheduler).
Un procesador como tal, está diseñado para procesar justamente 1 cosa. La virtualizacion del mismo permite el manejo de multiples procesos virtualizandose. ^LqWn5vFJ

Sobre los procesos ^dmJNLDRK

Políticas de Planificación y Métricas ^fjHeg2uD

Cuando múltiples procesos quieren correr y la CPU es una sola, el planificador (scheduler) del Sistema Operativo debe decidir el orden de ejecución. Para evaluar qué tan "buena" es una política, utilizamos dos métricas clave: ^0QYAUq1y

Turnaround ^AFXG0mar

Time Response ^a1Plkizo

El tiempo total que sufre el proceso desde que llega al sistema hasta que termina de ejecutarse por completo ^kvfW6QLL

El tiempo que pasa desde que el proceso llega hasta que la CPU lo ejecuta por primera vez. Es vital en sistemas interactivos ^BYQ2mdBW

Real Time (Wall-clock time / real): ^89FZrzML

Es el tiempo total que transcurre en el mundo real desde que lanzás el comando en la terminal hasta que el proceso termina por completo. Mide el tiempo de reloj de pared. ^EvoPGIma

CPU Time (User / System): ^mKAYLA2h

Es el tiempo neto que el procesador estuvo dedicado exclusivamente a ejecutar instrucciones de ese proceso (o del kernel en su nombre). No cuenta el tiempo que el proceso estuvo bloqueado esperando recursos o pausado por el planificador. ^B4jyiyq9

time: ^ll8r2mhN

herramienta del sistema operativo que se utiliza para medir el tiempo que tarda en ejecutarse un proceso. Cuando lo ejecutás en la terminal, el SO intercepta el inicio y el fin del proceso y calcula cuánto tiempo pasó en total, cuánto fue tiempo de CPU, etc. Es la herramienta fundamental para analizar el rendimiento de tus programas. ^CvZQR1Mz

time {command} ^dBy1obe8

real    0m3.005s   # Wall-clock time (actual time elapsed)
user    0m0.001s   # CPU time spent in user-mode
sys     0m0.003s   # CPU time spent in the kernel (system calls) ^0hJOEZVE

Si real > user: Tu proceso pasó tiempo esperando (seguramente en la Ready Queue porque otros procesos estaban usando la CPU).

Si real ≈ user: Tu proceso fue el único que usó la CPU y no tuvo que esperar a nadie.

Si real < user: Esto solo ocurre en programas multihilo (multithreaded), donde el proceso usa varios núcleos a la vez. El tiempo total de CPU (user) es la suma de lo que usó cada hilo, por lo que puede ser mayor que el tiempo del reloj de pared. ^CaQGazjq


Núcleo (core) 
 Unidad de procesamiento capaz de ejecutar instrucciones. 
 Si hay 2 núcleos, pueden ejecutarse 2 procesos al mismo tiempo en términos de ejecución paralela. 

Scheduling (planificación) 
 Mecanismo mediante el cual el sistema operativo decide qué proceso usa cada núcleo y cuándo. 
 Si hay más procesos que núcleos, los procesos deben alternarse. 

Walltime / Real time:
 Tiempo real transcurrido desde que comienza hasta que termina un proceso. 
 Incluye tanto tiempo ejecutándose como tiempo esperando. 

Cputime / CPU time 
 Tiempo durante el cual el proceso efectivamente utilizó CPU. 
 No incluye el tiempo que estuvo esperando sin ejecutar. ^xEcA2aMj

El sistema operativo virtualiza la CPU, haciendo que múltiples procesos puedan compartir los recursos de CPU mediante el scheduler (planificador). ^djosUXhF

 Un proceso es simplemente un programa en ejecución. 
 Una misma aplicación puede tener varias ejecuciones independientes. ^DAWItAJR

Proceso ^XGCgIUyD

Hilos ^MfP4fugw

1 núcleo
 ├── Thread A
 ├── Thread B
 ├── Thread C
 └── Thread D ^XZSMSuB2

Instancia 
 Una ejecución concreta de un proceso/programa. 
 Ej.: ejecutar pi 1000000 cuatro veces → 4 instancias.


Si hay más procesos que núcleos, algunos procesos deben esperar o alternarse mediante scheduling, por lo que su walltime puede aumentar aunque su cputime sea aproximadamente igual. ^UQQsaDaT

Los Hilos, no son ejecutados simultáneamente en un único núcleo. El scheduler los va alternando: ^inthKM90

A → B → A → C → B → A → ^ci2uJBwF

Con 2 núcleos, sí podrías tener dos hilos ejecutándose físicamente al mismo tiempo:

CPU 0 → Thread A
CPU 1 → Thread B ^CAx996zi

PROCESO
│
├── Memoria compartida
│   ├── Código
│   ├── Variables globales
│   └── Heap
│
├── Thread 1
│   ├── Stack propio
│   └── Estado propio
│
├── Thread 2
│   ├── Stack propio
│   └── Estado propio
│
└── Thread 3
    ├── Stack propio
    └── Estado propio ^Plt5Xirj

PROCESO
┌──────────────────────────────┐
│       MEMORIA COMPARTIDA     │
│                              │
│ variables                    │
│ código                       │
│ heap                         │
│                              │
│ ┌────────┐  ┌────────┐       │
│ │Thread 1│  │Thread 2│       │
│ │ stack  │  │ stack  │       │
│ │ estado │  │ estado │       │
│ └────────┘  └────────┘       │
└──────────────────────────────┘ ^NwQtRCXp

Si Thread 1 modifica una variable global, Thread 2 puede observar esa modificación porque ambos comparten el espacio de memoria del proceso. ^N6jn2r1B

Walltime/real → cuánto tiempo pasó en el reloj real.
Cputime/user → cuánto tiempo de CPU se consumió, sumando los hilos. ^el5ecJaB

Un proceso puede estar en uno de los tres estados. ^6ejSXIQD

Running: el proceso esta corriendo en el procesador, o sea ejecutando instrucciones

Ready: El proceso esta list para ir a Running, pero por alguna razon el OS ha decidido no correrlo.

Blocked: El proceso realizao alguna operacion que haga que no este listo para correr hasta que otro evento tome lugar.
Por ejemplo, un proceso se bloquea si tiene que esperar una operacion dentrada o salida ^cdcfxPDy

Un proceso, es creado mediante un `fork()` que lo que hace, crea un nuevo proceso que inicialmente tiene una copia lógica del espacio de memoria del padre y se le tiene que asignar un id y una parte de memoria distinta. 

La creacion de un proceso, lleva a la creacion de un Proceso Hijo, (que, si se mata el proceso padre, el hijo queda "huerfano") que devuelve un valor distinto de 0, además obtiene una copia del espacio de memoria del proceso padre en el momento del fork. (El proceso nº 0, es el padre de todos los procesos. Si a este lo matamos (fpkill -9 pid(0)), matamos el sistema literalmente. 
Por esta metodología de creación de procesos se crea un arbol del estilo: ^KW2NTpHt

fork(), es una llamada al sistema (syscall) que cloca el espacio de direcciones virtuales, los registros de la CPU (salvo el valor de retorno) y los descriptores de archivos abiertos. Gracias a la memoria virtual, los espacios de memoria del padre y del hijo son completamente independientes. Por cada fork, se producen: ^ywrOTNae

(donde $n$ es la cantidad de llamadas sucesivas a fork()). ^Bn4Q0mlv

Syscalls ^2is21QQ8

fork() ^7f2l62SC

exec() ^SI3A57oo

Es una llamada al sistema que carga un archivo ejecutable desde el disco, sobrescribe el segmento de código, datos estáticos, pila y montículo del proceso actual con los del nuevo programa, y comienza a ejecutarlo desde su función main. Si la llamada es exitosa, nunca retorna al código anterior. ^zpLIDzbl

Bloquea al proceso padre hasta que cualquiera de sus hijos termine, permitiendo al SO limpiar los recursos de la tabla de procesos y evitar que el hijo quede en estado zombie. ^IlB9Cguo

wait() ^XhmoaLva

No confundir con instancia: Una instancia es una ejecución concreta de un proceso. ^RQIxkPxO

¿Qué se copia?

Conceptualmente, el hijo recibe una copia de:

variables globales
heap
stack
código / espacio de direcciones
estado necesario para continuar la ejecución ^zGWciXN1

Proceso padre
├── memoria propia
└── thread principal

        fork()
           ↓

Proceso padre          Proceso hijo
├── memoria             ├── copia lógica de memoria
└── thread              └── thread ^Z2TBmSxX

execv() → cambia el programa que ejecuta un proceso ^n08nHP0b

Si hago
Fork();
tengo proceso P, y proceso H.
Si en H hago, execv("./programa2", args)
pasa a ser:
Proceso P, proceso "Programa2" ^dkrnq8ky

rc < 0  → fork falló
rc = 0  → estoy en el hijo
rc > 0  → estoy en el padre ^vUJwsZAA

Hubo un tiempo en cuando las computadoras eran caras y la gente empezó a compartir las computadoras de una manera más eficiente. Acá llego la multiprogramación, que múltiples procesos se hacian en el sistema operativo en simultaneo y el sistema operativo intercalaria entre los programas, esto incrementaba el uso de CPU, ayudando a incrementar la efiencia de uso pues, el no usar una computadora era desperdiciar dinero en ese tiempo. Finalmente, llegaría la epoca de tiempo compartido y el noción de interactividad se volvio importante pues varios usuarios podrían usar una computadora concurrentemente ^MDFDMvyw

Multiprogramación ^uLwOoXYX

En los sistemas antiguos, la memoria física se exponía tal cual a los programas, lo que era sumamente ineficiente y complicado (por ejemplo, guardar toda la memoria en disco al hacer un cambio de contexto era muy lento). Para solucionar esto y hacerle la vida más fácil a los programadores, el sistema operativo crea una ilusión: la virtualización. ^VxAFfLuH

Gracias al espacio de direcciones virtual, cada programa cree que tiene a su disposición una memoria grande, privada y contigua, por lo que el programador no tiene que preocuparse por dónde colocar físicamente cada variable. ^lXsezhXa

El espacio de direcciones de un proceso representa todo su estado de memoria e incluye principalmente tres componentes: ^50XJd1S1

*El head crece hacia abajo y el stack hacia arriba por que
es la única manera de permitir el crecimiento en memoria
*Las posiciones son una convecion, las posiciones pueden cambiar si multiples hilos existen ^BUiPnpVd

El Sistema Operativo le otorga a cada programa una posición abstracta de memoria: el proceso cree que arranca en la dirección 0, pero en realidad no va a cargarse en el rango de 0 a 16KB físicos de forma fija, sino que se ubica en cualquier dirección de la memoria física disponible (por ejemplo, en 320KB).
Esto es la virtualización de memoria: alojarle un espacio abstracto y privado de la memoria total existente a un programa. 
Para lograrlo de forma exitosa, el sistema operativo persigue tres metas fundamentales:Transparencia: 

El programa no debe enterarse de que la memoria está siendo virtualizada; actúa como si poseyera su propia memoria física privada.

Eficiencia: Debe ser rápido (apoyándose en hardware como los TLBs para acelerar la traducción de direcciones) y no desperdiciar demasiado espacio en las estructuras de control.

Protección / Aislamiento: Es un principio clave para la fiabilidad. Permite aislar los procesos entre sí (y al sistema operativo de los procesos) para que un programa defectuoso o malicioso no pueda leer ni corromper la memoria de otro. ^J27YgVMp

Api de memoria ^ZqOUv3Lc

Alojo y manejo de memoria ^KioH5LmJ

Stack (Pila) ^uCbkAhq0

Heap (Montón) ^0Eubag5U

Su asignación y liberación (deallocation) se gestionan de forma automática e implícita por el compilador. Se utiliza para almacenar variables locales, argumentos de funciones y direcciones de retorno. Crece hacia arriba (desde las direcciones más altas hacia las más bajas). Debido a su naturaleza temporal, cualquier dato que deba persistir después de que una función termine no debe quedarse en el stack. ^r5gv7xDz

Es la memoria destinada a datos de larga duración o estructuras dinámicas (como listas enlazadas, árboles o tablas hash). A diferencia del stack, todas las asignaciones y liberaciones deben ser manejadas explícitamente por el programador, lo que otorga una gran flexibilidad pero también una enorme responsabilidad que suele ser fuente de errores. El heap se sitúa usualmente por encima del código del programa y crece hacia abajo. ^ymFXOGWW

malloc() ^HhCJ1wxg

Se utiliza para solicitar un bloque de memoria de un tamaño determinado (en bytes).

Toma como argumento el tamaño requerido (generalmente calculado mediante el operador sizeof()) y devuelve un puntero genérico (void *) que apunta al inicio del espacio asignado, o NULL si la asignación falla. ^dBlNbRbu

free() ^KqPfcw6B

Se utiliza para liberar un bloque de memoria del heap que ya no se necesita.

Recibe como único argumento el puntero previamente retornado por malloc(). La biblioteca de asignación de memoria se encarga internamente de recordar el tamaño de ese bloque sin necesidad de que el usuario lo especifique de nuevo. ^LUdNquJ1

Olvidar asignar memoria: Usar punteros no inicializados (como en strcpy) lo que provoca un segmentation fault.

Asignar memoria insuficiente (Buffer Overflow): Calcular mal el espacio requerido (por ejemplo, omitir el byte nulo de fin de cadena), lo que puede corromper datos adyacentes o generar vulnerabilidades de seguridad.

Olvidar liberar memoria (Memory Leaks): No invocar free(), provocando fugas de memoria que degradan el sistema a largo plazo.

Punteros colgantes (Dangling Pointers): Liberar memoria antes de terminar de usarla, generando accesos a zonas de memoria inválidas o recicladas.

Liberación repetida (Double Free) y liberaciones inválidas: Pasar punteros incorrectos a free() o liberar el mismo bloque varias veces, corrompiendo el estado de la biblioteca de asignación. ^oH2VVDty

Errores comunes: ^sdqEPSG3

Otras llamadas como calloc() (Aloja en memoria un espacio con 0's)
Realloc() copia regiones grandes de memoria a otro lugar. ^msdoWOmG

Traduccion de direcciones  ^srLPxyKL

La traducción de direcciones mediante registros base y límites (también llamada relocalización dinámica) es el mecanismo de hardware que hace posible la virtualización de la memoria de forma eficiente y segura.
El procesador cuenta con dos registros especiales en la MMU (Memory Management Unit) por cada núcleo de CPU: ^VQwcuePu

Solo hay una o pocas unidades de procesamiento (núcleos de CPU) físicas. No se pueden dividir físicamente para que 10 programas corran en el mismo milisegundo exacto en un solo núcleo. Se multiplexa el tiempo. El sistema operativo divide el tiempo de ejecución en pequeños intervalos (cuantos) usando una Interrupción de Reloj (Timer Interrupt). El procesador ejecuta un proceso un ratito, lo frena (haciendo un cambio de contexto), guarda su estado y le da la CPU a otro. ^xn0ITQsy

Multiplexación en el Tiempo (Time-Sharing) ^BsmCm8ku

Multiplexación en el Espacio (Space-Sharing) ^z0aF9XIx

La memoria RAM física es una sola, grande pero finita, y múltiples programas necesitan guardar sus datos e instrucciones en ella de forma simultánea. Se multiplexa el espacio. La memoria RAM se divide físicamente en porciones (marcos, páginas o segmentos) para que convivan varios procesos al mismo tiempo en diferentes direcciones físicas de la memoria principal. ^FBXGM54Z

Registro Base: Contiene la dirección física de inicio donde fue cargado el proceso en la memoria principal.  

Registro Límites (o Bounds): Contiene el tamaño del espacio de direcciones del proceso (o la dirección final). ^YF6UIhJb

Cada vez que el programa genera una dirección lógica o dirección virtual (por ejemplo, al buscar una instrucción o acceder a una variable), el hardware realiza automáticamente la siguiente operación en tiempo de ejecución, siempre comprobando los límites y que la direccion virtual solicitada sea >= 0: ^Z0xh4aXG

Si el proceso intenta acceder a una dirección fuera de ese rango (por ejemplo, un número negativo o mayor al tamaño de su memoria), el hardware genera una excepción (fault), el sistema operativo interviene y el proceso suele ser abortado (Segmentation Fault). ^jYqvEuni

El rol del Sistema Operativo ^2Ufd6KcK

Creación del proceso: Busca un espacio libre en la memoria física (usando estructuras como una lista de libres o free list) y configura los registros base y límites iniciales.  

Terminación del proceso: Libera el espacio asignado devolviéndolo a la lista de memoria disponible. ^kjvZaeRr

Paginación ^jv3AvJAv

Segmentacion ^GLmPlVgj

En lugar de dividir el espacio de direcciones en segmentos de tamaño variable, la paginación divide tanto el espacio de direcciones virtual como la memoria física en unidades de tamaño fijo. ^7wUN3xOK

Páginas (Pages): El espacio de direcciones virtual de un proceso se divide en bloques de tamaño fijo llamados páginas. ^PwzbotQ8

Marcos de página (Page Frames): La memoria física se divide en bloques del mismo tamaño llamados marcos de página. ^A2OOZplF

Flexibilidad y Espacio Libre: Permite que las páginas virtuales de un proceso se ubiquen en cualquier marco de página físico disponible (por ejemplo, la página virtual 0 puede ir al marco físico 3, la página 1 al marco 7, etc.). El sistema operativo maneja esto fácilmente utilizando una lista de marcos libres (free list). ^onUg1lgG

Cómo funciona la Traducción de Direcciones ^XEtL3iFN

VPN (Virtual Page Number - Número de Página Virtual): Los bits más altos de la dirección, que sirven para identificar a qué página específica pertenece la dirección. ^sV4FbfuP

Offset (Desplazamiento): Los bits restantes, que indican exactamente a qué byte dentro de esa página se quiere acceder. El offset no se traduce, ya que la distancia respecto al inicio de la página se mantiene idéntica tanto en la memoria virtual como en la física. ^38rBuPyn

El hardware toma la dirección virtual y extrae el VPN.

Utiliza el VPN como índice para consultar la tabla de páginas (page table) del proceso actual. La tabla de páginas es la estructura de datos que almacena las traducciones (mapeando cada página virtual a un PFN - Physical Frame Number).

Obtiene el PFN correspondiente de la tabla.

Combina el PFN con el offset original para construir la dirección física final donde se realizará la lectura o escritura. ^2EagwPMD

proceso de traducción ^9OFWdOn7

Estructura de la tabla de paginas y entradas (PTE) ^2BrgkKWn

Cada proceso tiene su propia tabla de páginas. Cada entrada de la tabla (Page Table Entry o PTE) contiene el número de marco físico (PFN) junto con bits de control esenciales:

    Bit de Validez (Valid Bit): Indica si la traducción es legal o si pertenece a una zona no utilizada (como el espacio entre el heap y el stack), lo que previene accesos indebidos generando un trap o segmentation fault.

    Bits de Protección: Indican los permisos de lectura, escritura o ejecución permitidos en esa página.

    Bits de Presencia, Modificados y de Acceso: Sirven para saber si la página está en memoria RAM o en disco (swapping), si fue modificada, o si ha sido recientemente consultada. ^bMEFa1cj

Aunque la paginación elimina la fragmentación externa y otorga gran flexibilidad, presenta dos problemas principales que el sistema operativo debe resolver:

    Consumen mucha memoria: Las tablas de páginas pueden volverse enormemente grandes si los espacios de direcciones son amplios (por ejemplo, millones de entradas por proceso).

    Es lenta (Too Slow): Como las tablas de páginas residen en la memoria principal, por cada instrucción o acceso a memoria que un programa quiera hacer, la CPU necesita hacer un acceso extra previo a la memoria solo para leer la tabla de páginas y traducir la dirección, reduciendo drásticamente el rendimiento a la mitad si no se optimiza. ^HP4sHUvI

El vpn se agranda segun el numero de pagians que tenga, si tengo 16 paginas, necesito 16 VPNS que identifican asi:
pagina 0 -> VPN 0 0 0 0
pagina 1 -> VPN 0 0 0 1
...
pagina 16 --> VPN 1 1 1 1
 ^6J5TQ0ro

Los VPN se siguen usando hoy en dia aplicando Caché en el procesador. ^d8YvQULC

Cerebro del Programa (Lo que vos crees que ves):
[ Pág Virt 0 ] -> [ Pág Virt 1 ] -> [ Pág Virt 2 ] -> [ Pág Virt 3 ]

                     | (La MMU traduce usando la Tabla de Páginas)
                     v

Realidad en la RAM (Cómo se guardan los datos físicamente en la compu):
[ Marco Físico 3 ]   [ Marco Físico 7 ]   [ Marco Físico 5 ]   [ Marco Físico 2 ] ^62Ffd64Z

## Embedded Files
9f3d4af1ecd86540adb09a33588567bd65fff450: $$$$\text{Total de procesos} = 2^n$$$$

926a7ce27c76c5f3516e54b6d13693225b2426be: $$($T_{\text{completion}} - T_{\text{arrival}}$).$$

1b36298a2b383288a967582e911c3cb849f8a174: $$($T_{\text{firstrun}} - T_{\text{arrival}}$)$$

84e8073fc2bbcc336aaf4fb7c85a5680b877e8f4: $$\text{Dirección Física} = \text{Dirección Virtual} + \text{Base}$$

c4c4cb92914f7afab74560ba755a400058a97b60: [[Pasted Image 20260820161154_724.png]]

2567ecc04bb1052ef06cc300584fd516abec8e48: [[Pasted Image 20260821075336_403.png]]

026e6fc569620674e8522209ae7a27ef9b959555: [[Pasted Image 20260825155138_593.png]]

91513547b7e7748f7649352211f7cd84c8a2b107: [[Pasted Image 20260829081617_118.png]]

ed6e347aff5e2f21cd9711f0f288088a2b58f0a0: [[Pasted Image 20260829082113_184.png]]

0b45de471bcd3146e9d71f412721faeaf78f9fe4: [[Pasted Image 20260906093105_386.png]]

2f7c435959436222ff4f2b02f9fb7f7db73c94f3: [[Pasted Image 20260906093200_589.png]]

725a387d4938718695504eadb54ed7c924be4694: [[Pasted Image 20260906093229_833.png]]

1b3eac9070c1c05d76cdf6db9fe090036b9a583f: [[Pasted Image 20260906093337_838.png]]

%%
## Drawing
```compressed-json
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
```
%%