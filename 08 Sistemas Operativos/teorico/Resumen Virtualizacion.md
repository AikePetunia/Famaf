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

OSTEP — Cap. 16, 17 y 18: Segmentación, Espacio Libre y Paginación ^HNCwRg2N

Segmentación ^URXGr0RC

(Capítulo 16) ^d9rhDS2b

El problema de un solo base/bounds ^pzwZMgmq

Con un único par base y bounds para todo el espacio de direcciones, el hueco libre entre el heap y el stack también tiene que
reservarse en memoria física aunque nunca se use. En espacios de direcciones grandes y dispersos (sparse), esto desperdicia
muchísima memoria física. ^gH5WWilH

La idea: un base/bounds por segmento ^YfRPbJxt

En vez de un único par base/bounds, la MMU tiene un par por cada segmento lógico del espacio de direcciones (típicamente Código, Heap y Stack). Así el SO puede ubicar cada segmento en una zona distinta —y mucho más chica— de la memoria física, sin reservar el hueco intermedio. ^UKnxD8J9

Espacio Virtual ^hsQMzT5s

Código ^anPLtIC5

(libre) ^DlpXu2At

Heap ^4f8OYa3H

Stack ^LvuIrPu3

Memoria Física ^VYGqG4Wq

Sistema Operativo ^ZDJMk02Q

(libre) ^nMMxTyNJ

Stack ^nRZg1o99

Código ^E75b7r7v

Heap ^nLT4ZIJp

(libre) ^SfW3AfRP

Segmento ^WdbHGpGt

Base ^o3sR84tv

Tamaño ^5FYnvLmH

Código ^zLxXBOvt

32K ^OeB7k2wX

2K ^3cxignk4

Heap ^dM4hKPBv

34K ^HneSmLj3

2K ^f4qWHuX9

Stack ^JBhrHnRc

28K ^8WKuUmAq

2K ^JAxidOYu

¿Cómo sabe el hardware en qué segmento estoy? ^qBhYrOu4

Enfoque explícito: los bits más altos de la dirección virtual seleccionan el segmento —por ejemplo con 2 bits: 00 = código, 01 =heap, 11 = stack— y el resto de los bits es el offset dentro de ese segmento. ^yyVSbSuV

Dirección Física  =  Base[segmento]  +  Offset ^018Z1yg1

Segmentation fault: nace de acceder fuera de los límites (bounds) de un segmento. El hardware detecta el desborde, dispara un trap al SO, y este termina el proceso. El término sobrevivió aunque el hardware moderno ya no use segmentos. ^ttclK1yO

El stack crece al revés ^K28F302I

El stack crece en sentido negativo, por lo que el hardware necesita un bit extra por segmento que indique la dirección de
crecimiento (1 = positivo, 0 = negativo). Al traducir una dirección de un segmento que crece hacia abajo, se resta el tamaño
máximo del segmento al offset antes de sumar la base. ^NY9kvkH5

Protección y compartición ^J1FcDn6X

Sumando bits de protección (lectura / escritura / ejecución) por segmento, el SO puede compartir un mismo segmento de código
—marcado solo lectura+ejecución— entre varios procesos sin romper el aislamiento: cada proceso sigue creyendo que tiene su propia copia privada. ^TgnDRXZS

Fragmentación externa ^F2DISwoI

El problema real de la segmentación: como los segmentos tienen tamaño variable, la memoria libre queda picada en huecos de
distinto tamaño. Puede haber 24KB libres en total y aun así no poder satisfacer un pedido de 20KB, porque están repartidos en
varios pedazos no contiguos. ^BIfHrNOl

No compactada ^QT8xhe98

SO ^YPsMDMa9

(libre) ^gDxAC6CF

Asignado ^JmFvC1oF

(libre) ^kKiHMlft

Asignado ^rLWZ6vWp

(libre) ^cVAhNIw9

Asignado ^hPl03WKH

Compactada ^fbHjMjRA

SO ^oErJREaS

Asignado ^wd2lcx65

Asignado ^LvS3W0Pq

Asignado ^aIhakAGv

(libre, todo junto) ^OiEF0kO2

Compactar (mover todo para juntar los huecos) funciona, pero es carísimo: hay que pausar procesos y copiar memoria. La alternativa más común es un
buen algoritmo de manejo de listas libres → el tema del próximo capítulo. ^B8iQkkM8

Manejo del Espacio Libre ^1BiLxJvG

(Capítulo 17 — malloc / free) ^tsru3Pfe

La free list ^qb9uXQVj

La biblioteca de malloc()/free() administra el heap con una free list: una estructura (no necesariamente una lista enlazada) que registra los pedazos libres de memoria. Como free(ptr) no recibe el tamaño a liberar, la biblioteca necesita poder recuperarlo a partir del puntero. ^HY3boyYK

header
size, magic ^oIBR3mhZ

datos devueltos al usuario  (ptr) ^T7MFwlAz

ptr apunta acá ^aMYhRhTj

free(ptr) calcula ptr − sizeof(header) para encontrar el header y saber cuánto liberar. ^6bVcqvHf

Splitting (partir un hueco) ^ByrWZqFP

Si el pedido es más chico que el hueco libre elegido, el allocator lo parte en dos: devuelve un pedazo del tamaño pedido y deja el resto como un hueco más chico en la lista. ^rRUgmdW8

Antes: ^RVAmkPN0

addr:0
len:10 ^cTlCN94N

addr:20
len:10 ^VPvKM9HU

NULL ^Ip8OyVuK

Después de pedir 1 byte: ^s6yZ8zft

addr:0
len:10 ^6C666hYI

addr:21
len:9 ^qmv7ErVI

NULL ^S2XD0zmE

Coalescing (fusionar huecos vecinos) ^E06OMdjI

Al liberar, si el hueco nuevo queda pegado a otro(s) hueco(s) libres, el allocator los fusiona en uno más grande. Si no se
hiciera, memoria totalmente libre podría aparecer fragmentada en varios pedazos chicos, incapaz de satisfacer un pedido grande. ^H1VBsQTL

Sin coalescing: ^ZlM6Ihvq

len:10 ^J8M8HfWI

len:10 ^dpxYmXUf

len:10 ^A4OEr8Ht

Con coalescing: ^QUYwvMvS

len:30 ^ijfjy2Cb

Crecer el heap ^9muqYTNK

Si el heap se queda sin espacio, la biblioteca puede pedirle más memoria al sistema operativo (por ejemplo con la syscall sbrk),típicamente arrancando chico y creciendo bajo demanda en vez de reservar todo de entrada. ^ao8hJbEf

Estrategias básicas de asignación ^MZFyB7uv

Best Fit ^e8NIakDu

Busca el hueco más chico que alcance.
Poco desperdicio, pero hay que recorrer
toda la lista. ^8LJ7GEUJ

Worst Fit ^ry99wNSk

Busca el hueco más grande. En la
práctica fragmenta mucho y también
recorre toda la lista. ^pPW87L2C

First Fit ^YHAJjmPS

Usa el primer hueco que alcance. Rápido, no recorre todo, pero puede ensuciar el principio de la lista. ^p2sR8Gqr

Next Fit ^mcK6aNrK

Como first fit, pero arranca donde quedó la última búsqueda: reparte mejor el desgaste de la lista. ^1tuQMZ1M

Otros enfoques ^wAkW4QHw

Listas segregadas: reservar una lista aparte para los tamaños de pedido más comunes de una app → asignación casi instantánea y
poca fragmentación para esos tamaños. Buddy system: divide la memoria en mitades sucesivas de potencias de 2, lo que hace la
fusión de huecos vecinos muy simple y rápida. ^fRPaJnXB

(Capítulo 18 — complemento) ^YlNBIeHt

¿Dónde vive la tabla de páginas? ^gWIOBX0x

Las tablas de páginas son demasiado grandes para guardarlas en hardware dedicado dentro de la MMU. Por eso se guardan en la RAM
común, una tabla por proceso, y un registro del hardware (page-table base register) apunta a dónde está la del proceso que está
corriendo ahora. ^ouzxZ8Zw

Ejemplo real: direcciones de 32 bits + páginas de 4KB (12 bits de offset) → 20 bits de VPN → 2^20 (≈1 millón) de entradas. A 4 bytes por entrada:
¡4MB de tabla por proceso! Con 100 procesos corriendo a la vez: 400MB de RAM sólo en tablas de traducción. ^vogREqGk

Qué hay adentro de una entrada (PTE) ^DjjVTwRt

PFN (marco físico) ^B4yIbmOK

P ^esYgWInq

R/W ^0sNDcV6v

U/S ^RRpjYA47

A ^klFQ0tZu

D ^ZUuODjSS

P (Present): si la página está en RAM o fue swapeada a disco.  
•  R/W: si se puede escribir en la página.  
•  U/S: si un proceso de usuario puede acceder (o es sólo del kernel).  
•  A (Accessed): si la página fue usada — útil para decidir qué reemplazar.  
•  D (Dirty): si la página fue modificada desde que se cargó. ^EAPweL2F

La paginación también es lenta ^DqUj5iBQ

Cada referencia a memoria del programa ahora implica DOS accesos reales a memoria: uno para leer la entrada de la tabla de páginas (traducción) y otro para el dato o instrucción real. En el peor caso, esto puede llegar a duplicar el tiempo de cada acceso. ^NaQ7Rx8r

La solución de hardware para esto es una caché llamada TLB (Translation Lookaside Buffer) — tema del próximo capítulo. ^plZR73QQ

Segmentación vs Paginación ^gJUbj4mX

Segmentación ^wN6kfz7E

Paginación ^EXTypoL4

Fragmentación externa ^50V6DA1k

Sí ^PYNZo54h

No ^Ao7bbiOl

Tamaño de las unidades ^HCqSSTAr

Variable ^3KdsRNOn

Fijo ^kNSgjy5b

Tamaño de la tabla ^OiNhjB0Z

Chica ^HlPdirJn

Grande ^W76lxl4K

Soporta espacios dispersos ^Fqq6XV1P

Limitado ^ir1cBETm

Bien ^oSDUZEX8

Costo de traducción ^GafCviEd

Poca aritmética ^kp7QeP7L

Un acceso extra a memoria ^XGQO4MEA

Profundizando (con más detalle del libro) ^RKUy2soF

Segmentación — más detalle ^3KCLtpVv

Soporte del SO: cambio de contexto ^SY9WppoO

En cada cambio de contexto, el SO debe guardar y restaurar los registros de segmento de cada proceso (cada proceso tiene su propio
espacio de direcciones, con sus propios pares base/bounds). Y como los segmentos tienen tamaños distintos, el SO también tiene que
resolver un segundo problema: encontrar espacio libre en la memoria física para los segmentos de un proceso nuevo, cosa que era
trivial cuando todos los "espacios" eran del mismo tamaño. ^LV92Nmbl

Segmentación fina vs. gruesa ^35kGEPrv

Lo que vimos hasta acá es segmentación gruesa (coarse-grained): pocos segmentos grandes (código, heap, stack). Sistemas antiguos
como Multics o la Burroughs B5000 permitían segmentación fina (fine-grained): miles de segmentos chicos, uno por función o
estructura de datos. Esto exige una tabla de segmentos completa guardada en memoria (no alcanza con un puñado de registros), pero
le da al SO mucha más información fina sobre qué partes del programa están realmente en uso. ^JqNuhXY6

Espacio Libre — ejemplo numérico ^fituk19E

Best Fit vs. Worst Fit vs. First Fit, en números ^f3CPKPBh

Free list con tres huecos: 10, 30 y 20 bytes. Llega un pedido de 15 bytes. ¿Qué hace cada estrategia? ^y4c1w9UV

Original: ^N7zLzYY8

10 ^DFLEQenk

30 ^IDTWeXxO

20 ^n4qgZnHA

Best fit: ^NZZGFFYz

10 ^hnRqTBBw

30 ^VuQKShb1

5 ^dzChuTzG

(usó el hueco de 20, quedó un resto de 5) ^IP2n8zEa

Worst fit: ^7IBhtf1U

10 ^GDdnWv42

15 ^usNl5KAo

20 ^qum9WmRx

(usó el hueco de 30, quedó un resto de 15) ^Hlu1U8sa

First fit: ^D58SAONH

10 ^MHzRX3iX

15 ^I3BAXODV

20 ^r0jjOElI

(mismo resultado que worst fit en este ejemplo) ^RPL6F5qC

Slab allocator: cachés por tipo de objeto ^6E9qc0Bg

Una implementación real y prolija de "listas segregadas": el kernel de Solaris reserva, al arrancar, una caché de objetos por cada
estructura que se pide seguido (locks, inodos, etc.). Cada caché es una free list segregada de tamaño fijo, así que asignar y
liberar es casi instantáneo. Cuando una caché se queda corta, le pide más "slabs" de memoria al allocator general; cuando sobra,
se los devuelve. Un plus: guarda los objetos liberados ya inicializados, así se ahorra el costo de inicializar/destruir de nuevo
cada vez. ^Gp0CHIeA

Buddy Allocation ^org8OH6L

Pensá toda la memoria libre como un único bloque de tamaño potencia de 2 (por ejemplo 64KB). Para un pedido de 7KB, el allocator
parte el bloque a la mitad recursivamente hasta llegar al bloque potencia-de-2 más chico que alcance (8KB) — partir una vez más ya
sería demasiado chico. ^Vhz9M7nC

64 KB ^KXKEzLz3

32 KB ^hf5M8SOF

32 KB ^azA7lsY9

16 KB ^ctcFzBiw

16 KB ^bwhhFFFT

16 KB ^WlWYUCs8

16 KB ^MScVxBLC

8 KB ^jUDFecEq

8 KB ^apP2YKme

8 KB ^jyAGcxAu

8 KB ^XGCmHXru

8 KB ^v6voERbg

8 KB ^65E1Bpgx

8 KB ^OyjdQf7J

8 KB ^gdVii96Y

(en gris: el bloque de 8KB entregado al pedido de 7KB — sufre fragmentación interna, porque sólo se pueden dar bloques potencia de 2) ^Kh70IrK0

La gracia de buddy allocation está en liberar: al devolver un bloque, el allocator revisa si su "buddy" (el bloque hermano con el
que se partió) también está libre; si es así, los fusiona en el bloque del doble de tamaño, y repite el proceso hacia arriba.
Encontrar al buddy es barato: las direcciones de dos bloques hermanos difieren en un único bit, que depende del nivel del árbol en
el que están. ^JUAFg8Gf

Otras ideas para escalar mejor que una lista: árboles balanceados, y allocators pensados para multiprocesador/multi-hilo (por ejemplo Hoard o jemalloc),
que evitan que varios núcleos se peleen por el mismo lock del allocator. ^2rsogrsH

Paginación — complemento del libro ^Ph82FzHL

(Capítulo 18.1 a 18.4) ^iDqG8TQz

¿Dónde vive la tabla de páginas? ^bih6wCwj

La tabla de páginas es demasiado grande para vivir en hardware dedicado dentro de la MMU (a diferencia de los pocos registros que
alcanzaban para base/bounds o para segmentación). Por eso se guarda en la RAM común, una tabla completa por proceso. Un registro
de hardware —el page-table base register— apunta a dónde está la tabla del proceso que está corriendo en este momento. ^byKcEnQq

Ejemplo real del libro: direcciones de 32 bits + páginas de 4KB (12 bits de offset) → 20 bits de VPN → 2^20 (≈1 millón) de traducciones posibles.
A 4 bytes por entrada (PTE): ¡4MB de tabla por proceso! Con 100 procesos corriendo a la vez: 400MB de RAM sólo en tablas de traducción. ^jLiHhee0

Ejemplo completo: traducir una dirección ^jeznJ4fA

Espacio de direcciones de 64 bytes (6 bits) con páginas de 16 bytes → 2 bits de VPN + 4 bits de offset. Queremos traducir la
dirección virtual 21 (binario 010101). Tabla del proceso: VPN 0→PFN 3, VPN 1→PFN 7, VPN 2→PFN 5, VPN 3→PFN 2. ^iydI5xgj

Dirección Virtual (21): ^9v76jyn9

0 ^ojFhbkqo

1 ^YhbCd1EM

0 ^LViCxkdh

1 ^FClweYem

0 ^01vBtvb0

1 ^VA8dRK6a

VPN = 01 (1) ^fHUwgKR8

offset = 0101 (5) ^XIulukNG

La tabla de páginas dice: VPN 1 → PFN 7 (binario 111). ^3Vev4CDv

Dirección Física (117): ^0Zv8Wz5x

1 ^XtmHnU8h

1 ^M0opiXeF

1 ^VjcsSUTD

0 ^eYpgqg2d

1 ^BHlae3FQ

0 ^O2UPnrEW

1 ^yFUkzhFW

El offset (0101) queda igual —no se traduce—; sólo se reemplaza el VPN por el PFN. El resultado: dirección física 1110101, o sea 117 en decimal. ^ohira3lX

Qué hay adentro de una entrada (PTE) ^pjWjfHfc

PFN (marco físico) ^iHuXRZ5i

P ^b4KKKNdC

R/W ^wNxQlvhZ

U/S ^qIPIBKHD

A ^k5ofnT4T

D ^N4uTEW74

P (Present/Valid): si la traducción es válida — si la página está en RAM o fue swapeada a disco. Marcar como inválidas todas las páginas no usadas (el hueco
entre heap y stack) es justamente lo que permite soportar espacios de direcciones dispersos sin gastar memoria física de más.  •  R/W: si se puede escribir
en la página.  •  U/S: si un proceso de usuario puede acceder, o es sólo del kernel.  •  A (Accessed): si la página fue usada — útil para elegir qué
reemplazar.  •  D (Dirty): si fue modificada desde que se cargó. ^7c7aY8IR

La paginación también es lenta ^QT3BwFiC

Cada referencia a memoria del programa implica ahora DOS accesos reales a memoria: uno para leer la entrada de la tabla de páginas
(traducción) y otro para el dato o instrucción real. Esto es lo que hace el hardware en cada acceso: ^3j55qAkC

VPN     = (VirtualAddress & VPN_MASK) >> SHIFT
PTEAddr = PTBR + (VPN * sizeof(PTE))
PTE     = AccessMemory(PTEAddr)

if (PTE.Valid == False)
    RaiseException(SEGMENTATION_FAULT)
else if (CanAccess(PTE.ProtectBits) == False)
    RaiseException(PROTECTION_FAULT)
else
    offset   = VirtualAddress & OFFSET_MASK
    PhysAddr = (PTE.PFN << SHIFT) | offset
    Register = AccessMemory(PhysAddr) ^9AE3B6IY

PTBR es el page-table base register. Notá que hay dos accesos a memoria por cada referencia del programa: uno a
AccessMemory(PTEAddr) para la traducción, y otro a AccessMemory(PhysAddr) para el dato real — en el peor caso, esto duplica el
costo de cada acceso. ^6EqswlJ6

Ejemplo: recorrer un arreglo de 1000 enteros ^hJL5q9Zy

int array[1000]; for (i=0;i<1000;i++) array[i]=0; El compilador genera 4 instrucciones por iteración del loop (mov, inc, cmp,
jne). Cada iteración entonces genera: 4 instruction fetches + 1 escritura explícita al arreglo = 5 referencias a memoria "del
programa". Con paginación, cada una de esas 5 referencias necesita además su propio acceso a la tabla de páginas para traducirse: ^FTnPPnVG

5 referencias "reales" del programa × 2 (una a la tabla + una al dato) = 10 accesos a memoria por iteración ^avM04uZX

La solución de hardware para esto es una caché llamada TLB (Translation Lookaside Buffer), que guarda traducciones VPN→PFN usadas hace poco — tema
del próximo capítulo. ^BX88V191

Segmentación vs Paginación ^ry9buOKK

 ^W8xlxJBS

Segmentación ^GvTGRNtQ

Paginación ^CKMyc06k

Fragmentación externa ^4lXHrzef

Sí ^3Lb4oElY

No ^fLWa7Ufg

Tamaño de las unidades ^c9xJHsxt

Variable ^TU9zpjZH

Fijo ^KVx3u7ma

Tamaño de la tabla ^sDUc2nOA

Chica ^VPTJWixU

Grande ^PqdIAP3T

Soporta espacios dispersos ^NEfqjuSd

Limitado ^qeVKP8Hk

Bien ^WcrTqFIB

Costo de traducción ^JgDpT5Hf

Poca aritmética ^kSg63RJK

Un acceso extra a memoria ^TrCYv5Pz

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
N4IgLgngDgpiBcIYA8DGBDANgSwCYCd0B3EAGhADcZ8BnbAewDsEAmcm+gV31TkQAswYKDXgB6MQHNsYfpwBGAOlT0AtmIBeNCtlQbs6RmPry6uA4wC0KDDgLFLUTJ2lH8MTDHQ0YNMWHRJMRZFFgA2RQAWMiRPVRhGMBoEAG1QPAQQADEiADUw3BU4ckhYTLAUMBjkBEsIgFYwlnryCFqwgA4ABkUAZgBOeo7ekdGRyPIiPFkEAEZegHYQ4cil1

aWWBf6F8n4YbElBOYXZxS7z+pYu4bHV8kNJTwQu9jB8egBrGABhekx6fCZADEsxgoNBMXk6FQH0k704jFwv3+gMQb0MNCg6HciRiADNsJhMABlSBPRAcOwxGhvT4wADq034rFe7y+pIg5JAlIy5Hhh0YvmS8Fm5HoWNQMjaIvO5DhXCgAElcMKUgBdch4wjxZUIRicInkbCIlCZdBdGLwxGCmjC/WG7kwGC4Oa9WbDLpXWYvSjUOhMVhbchUWgMR

gAOSYvAQTTCYUiXQWTSNNAAIh4YBUXfA8VgfOR5FxEQBROIJJKpdLZkCGACOqEwLAAgoCStA+DX8O8SABfUhVzJNrLijTfXD9GKlDvY7sgHsakCcKC4dBZ44dJaXSI3Jbkf4w50IXOYfPgSqZXLYfBgThYbAaaHYADPzD5xAAKufEJfr7ecA/JRffEmDAYl7z4WZIhCepzkiXoE02BYkI6fpNRArJ0FUQlpV6EpKibHBJGYRBPDxKpg2oMBdCwAi

DmI8BxRiFREnQY1qF1eB7UwMV8AOY0sE/ZAqm/K8bzvADn1fGtODAegACVfHAo88xgPc2IACX2Q5hNONgQH4bxBLAAAZY0PmUk9VJAHBGHMziDUwPsB0QDoAA0chocN1OZNsyjRc9yBqeBLFmIZIjOWZIsifprg6epIlmHYQGlEKWHCsIRkTFh+lmOM413EAplwGZ4CQ/ooi2fpukiToFhafStKOUroI6WZmnODqOtFGtGEePgfRpNkfj+AFgXBM

FihAKEYXlBEkRG1FwEIRhMWxct8UJEkyQ7HkXVZOlGWK5l4D0wa6Q5LldstLgBSFOYxQlKU5llEBZqVFVUgXLVMJgDiuKNE0gprWZrrmm07Qc9gnWzZp4K6eCwgo0MA3gAZEd9ZGIyjPh4w6FCOjCArsDTDM1xzFSCyLXBSxgeJElVZyevrRsW0ndszS7ehewXJcVzJxK8c2b1Qsijo93oA9s2PU8KiEi9RL/e9HxfAACdNMBV74AAUAFVLQ/L8Q

B/MT/2Vxg1Y8TXdeAxIwI0HGem3OC6s6rq0MSDCsMwHC8KE2iiMyUjyIxqjbH9+jZKgJiQNYwV8D+yGQABPjGAEw3jcViTVfVq29fuGT5MU+2EDeTgrJsmBNIOJrdN2QzKlM2yLNPGy7K4pyQAyRBZh1gBxPFwzkgApFg2b8s85cC442sULZNn6OCMuGfo9JS+fZ6WLoqpYSCWDiuLJiZBB+hXs4wni7LavqvZq+EpZFCGNqYNd85uoeckBtpL5k

VGxAQQmiEBZoSwitPNFE5RlqrRxMHAkRILo7T+LybkX8GRHxOvtdk21MhXT5Ddfg4N7pJ0epAZ6Po3rKlVF9bUv1sz/U7oDM0o9cFgzuvZB0PhDzwDjMMDoCUWB6RDP6Yi8VUIYyEZGRg0YRRIXqPUXoTQiYk08GTaWVlCxzRpnTCs8A0id2rEOEcY4Jy+WnJzbm5Beark4QLDoQtEqNEguLSWzcrKy2EkbBW4kzYWxVpgdAKt4iqGTugfWRAjLy

1/F4wC5t0y+P8YE4JNtQJKS4Y7Xhixn6u26nidCmFsIIFwhPMA4dA4wDIjEEMocaKEQjoxcgzEAhsXjrQxOydXBpzliJSJptok+L8QE2miT86yQUnQYu8BS7lw0o1HSoQ640CMo3Oyqi1JNzYY5fseizSMGZs2Vs4B2aIBnFzaotQZ6NHai/Dqq9ahDHqGcOqSEyr1CWBlQ+R0EALDioofonRuFhFmNsHKSUb7aQQDVcqBN3SdC6JERoLzeH3F6h

/DBw1wF/3GoAqawDZqIh/otdEK0sTQI2nArBFJEF7WQUNQ6JVTooPgdgyloNbq2kIeKR8JCZRkPhO9ShmpqEJwdMaXApojm9FBtaVhoApysD7I6ThYRBgbHggIv0YY5jbiRuI7GrBIKLF6Lw7oKZ1aZk4SsqaVNNHln5YuZcVjsw2KFl0EWgLVlt0TvuL4UsKYgCgPQY02iUgpBeF0DUKRLBfPub8gmfzAVbESqQCFigoUE2qvCr5kQ1QLhpNiMA

AAhEVxpJAIFABmLRHFsh5AKEUGIQTRWZABPIGQG1kDOi1gG3EOiehb3apFeGoxIIwTFj2leMF+1jCHdlNU8qEi4ELYiYtpbYi03LJWtyHkvI+RAPWjsTaW2amwG23AHbA2pB6Hjfohr5gxS6GET0LqR0ppQtegY5x71eg6DO14eaWzdj2OgFpDo51/q5gB6sxySDkA8IWIg5rfUGQWQ3MyLjyBBKoAAWTwKe+mjJZDWq7aojuXcQAGKgKOccY9TG

ziniKXefR4IxoSkqk+Ytkq3NCqEKCLrvRCzjBMQqaDGjhThV85oC9OgDAE6CpqzQFgP3ipFWRCxEyRWaEivqzxUX4rGgAya00QFUx02iSBxL1qHrJZyBBVJUW0uOvSoajKKU2ZAPyfBrDuocslFy70PKFQUM+gKn6QruL0NFUDdA0RmFSrZfAGVhyWDyo4Y6+KSFRaem1Rq6RarMYSKke6VVvDOhseJqalRvr1EljLPTQLdq+bWK+bYk49iAUCdb

nqT1EtvWob9Z2oNIbSBhtICkYTUQEXiZqsvCYcmFMJVCi81TT9s0/uvAu8wvVl3lrXdWHI+RCj0EmruzIxozCTQJMenDwkQ0pvkRuX5hNuiGsNTsHovyhixSK7Y6K7pv1IERGtpdcWV0VurD3fug8R51voA2xA+6YFHvbX189ZwYorwWHBIYSFsqJkGz8reWVhNtU2FvL9SWAjXlA0QcDHXgOIkp9To5ZiYgwa5vByy8zFkofJuznd9BMPYb6zQP

D/ACPCSI5skjxlaz0kYPUCgWQh5UfKAFEAQVLA70JlEGq1woLbHjPVFKCUzj8LgmlPenQBbvJKoC7KPy1gjFsV0F5aVdgzOOBEO9vR4Vw1Rzjnqmn4CfyGsZkA/9xqQhxaAkPhKoHmZALAraVmmUubOl8OzLJqXnXJdyZlzDWXCk88Q6Uvm5S8oCzoqhwWgOhZFWKmsYRJW4AIesqGnCTiRDhfMAmmWUZNAE4IsMeWIJ3PR4CzoJrSZs9PJV6m1W

g083tfzRrzqrhDDY16qfrjDbFhoCrS28QMCMGJkEgZ5hDAVD3xrVAf5L8qzAjSWm/iADysBCBUQoPQFWqB3D+P6YSTgdAqsoqKstYZcX+gG/iUA7wvAHAKsVECQMAKsCI/i2sOsKsoq5gGAK4AAOowBACrFAeKAYKQF/reIiJ/gkCrD/nYIBr4vQLvoQTAfQSrD4HAdwKnObMSv4gAdiHQbvowAAF8NgwDMF4gAC3dAKgu+wB/SKgqgUAMkgGAI8

SzoFgF+CIuBTghg2ABIWBAIKsAAFDQKgHsLgAaNQAAJSKC4E6ycHQG+BKH4Bf5qCf4BDcR740gACH6BxMMAAAj0oQQdiJAfYTQLwQAFYAEBBaKIGzDOFhGKAqzGT+I6DdJKyShMDoH77H6f6v5YQX4eC4GqCGAwDhGf7AGqAGhUROC+AEGhHMGpEmxKzkE+CKChLhKIA7634H7aE0An7xBn6JCIGWzX5YC3734VDFEqwv7UCrjYAf5f4/5xIqz/6

AHmzAGgGIFYEhESy+CuHYAIFIGpy5xZGYEQEqz4GEFQDEGkGGC4AUHmzUF4C0H/AMH1G76sE3j4AcFBGEBIFhFOGvEqyCHCGiESG6DMEyH+JyEKEBD3F/EDFqGIEIgEF+JH66GOGGHGGmHmH4BWE2F2G7FhHwnOEn5uEkG+BgDeHmA+ABH3G/E7EwERFRE/RDEqxxFSHoCJHJEqyNGZyPiZGioaxYR9G5HUD5HDHCklFlFZEBJVHYA1FvFEkNGeK

mwtEwBtHuzJLjK27wQDCbCyIW6tRsY5Iex5LewFK+zFI1KlLlJIxVKYAlJoh1IgANKxzsTV48QpwdLuJdH74wCH45Gn5Im36jEayWwTGP7TGv5zELHf5eDLGrGSSymbHgErh1HKlwEHGChHEoG6ynHUTpmXHvDXHoAkGjHkF76PFeA0G4B8EZlMEfGIFfE/FcH/G8FAkgmeBgmSGQmIGyFqCwmOEqGDHqGcFok6GFn6FGEmHOi4n4mMC2ENkOEkl

yGuFYAUleE+G0mBFtmMEOFOGRG5oxHsnxFclJEpGqnpFhhZHClBl5EyCSkBLSnlGIGVGYDVGeBKmNm8lXkPjqmanSQjJFx8AWoVxVxgoihzL6T1xCRLI9btbrLEbVi4CqBDzhjGSphyQADSSu/kk8quZy96jsAKV6CYIw/C58rQ4KAKDy6O8EiUC83Q9URUJUGU8mdUGUqw58TQ18buzUD8rUlyL8b8yK/U2mC0wILAeI/QMAHeEeM0UeklJmGIZ

muIFmiel0uemeaeaCDmWeSezmSCbmzehenKxeL05CH0FeQWOonpYWde6ACwjezedCyWx8wwyEW8PexEdUOWOqkifALAXuhMW4JWSiZqPqPOM+outqliS+gsJwsKcErUTi3W3OMshsxIJg7g9Z+5HAyQb4YSWVOV/ZzB+V9BSSdsDsUQ6SLsIlWpns+SqMVpTp1kZSwclS1EjpNpzpUc9SMcTSIWXp7SmAHRIA2V8guVQJFVhVQFhcYyfAkyqylc/

FtcMFSGcFXOYFXO7cEu1YeI4RmkkgLAnAqYeFRSpywUCE0acU8MWwcEOUAmxecU8mIwTQXu1w5wO8SUrFx0vGHQKO+qd68Yd66mDUt8CAjQPyiUROeM9QVU3oHeGmKKOlaKv8oe0lsl8lQCilRmylS0qla06l8em0TmOeKeKC6e6CaN5NOCrmeCplD05lpCpe/m1l6otlNCNONeDCRyiu0WTerCbl0MnyAwTFLqSUA+KMvyPo0tWMgVz07oVUsiu

UE+yim+lMGic+cVi+DWG4vCSmcKmwaVmtl1iAHamAYhVS0hiBWsE5GJvS+BGGAAl28NRHNYQMVZ0iAJbdbR7bKfbdoY7cmc7W7bxBgHNaadqXwKsFEL0FvF7gsE9vYgJtHU1RaS1UUm1UHBUpRN1W1ZHNHCxENfZW0vxGNYbH7TbYHQ7dRE7SrK7e7ZHTEOgAXKMikstdZNMpDVBXpIhpzmsjtWsntYzF0AAIoACaTYOstYswbQJiyuBFauCUKED

83ojugwGUci1FIoW9ig8YzGoVSEyVVu/1sikKNucKrUhMq+ruvdG9ZwciCNgKim3Q6M784laNIeYeE0Clhmc00epmxN8OlmWllNNKelqKdN2lJlHmzN3mFlfmS45enN8egq9lteEWuFgtrlic7l8ACUK8xF0UPlnyVwPlQ+cw0KVw6OsK6tkVPWMVOttW8V+tmaRtlwSUG+UVmVPt3wZB9JqgAhH5CpX5y5BVIBnABxOIzhXY1AFxyxqBHhuZLBf

wZZt+Wh6JU5+AuBM5OJngeJt5d+xMkxz+MZ7+r58giBoqko5gThlsAIoq6xwx4RAZnA0SiRWswRe+FAWAt4ThoBLtuBAQ5s2BU0Zcqc4TKjyBBBfw/tGAJBMkhISsQS0hzBqg4dAdDY6AVAiARV41Ajdxn+wjojipEjzBoBMjlBKg8jTh+B/SyjtRsTlIGjlsWjk5ehTh+jc5hjFhxjkZUxMxb+8xVjNjAZeAV4t+TjlBwBpR7jnjKs3jfxMAfjz

gvBQTcBhgKs4T8gkT6A0TzTxx/qVtVSSTVEpsaT6BGTWTkdX+fieTVVKSCdEU24saciV6MUQwjV5pPs2dvV7VdpIcBdALRdA1Jdccw1ScvEo1hTgjJTIjn5tRs1Uj1T5stT7g9TSj+ZRz/irTFJGsHTGJJJPTZhfTAzpjUZwzsZYzWRdjUzjj+Azjsp8z1+izyz/iqz/jGznALtWzYTETCQBzIAMTxz8TZzSBFzqTkJNzzd3g9zuTMA+T81Hd4yw

9q1D90FA9yGQ9vqiFo9WyiAQ4rkvcXQxR+ysq+FwcK9O8pwEmTum8UEjQu9VwVUfQEK9iWwsiyNgmHyJ024s824ZUl8G4fFvdMEPypFNUc26OGOKNX9qe6Ni0II2wswqATC2KeNgDBNMealoDml1mSCib1N+lmChlFNxljN8DRCLN3KbNKDHNledlPNAM4WZoxkLlwt+Dot0i8Ui8Xu3U8tcw2UUt6qTAVDqMvQ4QcUAKekpWk+vDaiVqLDNldWD

q64HDoUxt3DXWZtbimQ747B2IVM7Rhsh73xx7c0Tz4yUEUQnQe8BMSYcK8i4N6dvzlp/zdEtpnV+dYcoLLpbppdLb0L3pldPt57qcoCrd7dIFJc+AZcK1EFNcWrsFJk21eru1DkyFZosw9tHw949AF1+7tGlgTrgNwVMUb6uMO8LrDud7z9kEHoiwZ9BSwVfQydCUCdcUV6dU99kFEbvygK0bkUsbXu8bWm39BNKbJw6b/9uKYCGNubIDpKBbyeR

bVNUDtN2e9NcDsWZliDrNr0ZejbXNULWDZoGGnbsWItnCrUUEgKwwZDIo8ioi8tE7NU7ohp96DD5W0Vy7q6NWq7bDjqXym78UXDpti7VpB72A8QKsoy/qK0k0Xt4174sXiBCXTAPg17sdIQk2D7hM+uL79Ub7XsfzbiOdHVed14ILX7fVxdjSkLZdMLFdqX6X8XvgiX2XwyC1nd8HUygoSHsy/dqH8FGVA3HqRI2HiAHwFAeI9IYQ49xkHbi9VrV

1lgAwU7B9qw2wiw2UbzBueq8MKaSqnocY+Ozrvr1uaU5HCiXyDuXr/d/F988MzuWwSqz7yd4ngeEl6KoemK+mke+Nf3SnJKGlMDEDB0mnibEPlbLg7menCDT0dbRn7Ntq30zbLeDlEW4YVnEM7CPboUIwmO8Yo7mMCAG4/eY7Ct+Wqw72hXAm87GtUXlq2tAX8+FietIXBtc24XJt1ku7LP+7nRGs8B8hrh9AbhUjiBNAnAWoT5FVWRNAGxYBRIM

Akg/iYxdAD+UxiGAQuBqZFQ+AWExxczbj1+5OrB/qThMJyihHBT2+ovBx4vcBkvYxqZsv8vmj9RSvKv/ZngGvKsWvlLuv3gAQ0vcB4p/ELL5vihtAiB1vpJNRskOXBSPajH7zm3XzJpuSZXH7FXALud9ptXAc9X4LjXHpwH5dqcYHvpTvtM/qrvUvHvcvuV7TPvoqyviBqZavgfwfOv/iev/ihvUfpvrj7jlvCf+htvmY9vKrsH43iHa1KHm1aHu

rPO+rWH+1mQrkvQ+aRA9IeIio9IF1sXgQk0auU70Uz6Cd+UDu4QLrIsQNtiSq9QkE0KLH8AjQ8m6SU7boTy3oQpDJmEgI0N42UVqM9jajo5vuQeOkD/RfhyclKIPYBmD1JpgMOwBkEwtwEmjFs0E3UGHtp1gZVtEeNbAzij1AR4MCeiqDcPzyHaow8YlDXVCKCKyLBYUSYTnvVm55hdt2PnM2lZVtTMN2etqTfg6B4Y9YMe3NLHtqy2rr9TwsCSQ

SAGIZOVeAmwVAEmFQD1A8QA7MIDAHijyACg8wJVFO2aDyAzcYQaxkxCiJqBUwq4EJEDj8SyxMgBhAACTvgAA+sAGwLYE3EwAGflRCYA9gewKsSwCrHcGeDvBlQYADOHmJYBAhzgqwnOHYC2A+AKQUULMAXDmcjkT+akAEBvDCg/Uc6JdPUhLI81puIAekL0FTD4BjItMBegcnHhn9JAF/WoFO3jB9BBgXeWKH/3RjSg0oCYFNEGwBTxRFgWqK7sd

Gig9Au8HeZOrG2mF8cmo0NTNBRX/5pZ4YMA37hjSBAIDcaADPFDmxQFx4E85NTAXIHcA5DIGfrfAQykIEuZdOBeJHj5hegUCu2VA7MATETCudqe4KFCIwMVoig4ILnEdnpGC4btDaW7CLp3Aiq+dTw/A2rIIK0TCDMOogwXuIIwbAdpBa/ZZL6nkGVpZg8gF9lVHQAsB8RwwB9ugF+R1RbEMAHKGm16CoB5AvCfoHiA6DoBEoUWV0lYNUA2CAgy6

BwXXhcFhCvBPggkLQFLiMBAhwQ0IR4KFGRDohazOIRYUSHchkhqQNIRkL5o1gtYOQ1cAAUyCwBF0G2YoYxCQrb9EA+aSeuPRYCqB50J/VbpdRI4DAZ4dDAdlcG4zdRehSdUIG9mfj8IkwhqT/kpkmHbg3+uUAmPFDYzADyGFUFTMOj3h0Mnc6wyTn91/pYoDM8nIBkTVQFHCbh6nC4XSmgY5iqUdw9lEXkM6wjV2EgszhqPQDj08ewHAhpFCXhbA

tghSOgYsEHbU8J2VUBMKfUhFlYza8Im1Kwy56gjeePAgXs4kX7m0QApYLMg30/ypksQYRX3t3zALt9MyvfQfmH2H6q88yaBf4LgVZaKE4mThKAulz+JUANAiRLojoCl6UFteZjXfIGlmKoBLGntA2D7VnFi9G+i47wP4k75+9veG4gPluNzQR9Gm+Zf4Hvlj7h9E+Z4+IBeJgBXiVYN4mQGMXvEh95Wz4wgK+NGZR0QI1VNPooAc5pYBY8YXKKIl

K7NVCkBfOroCx/Y1c/2dEsFq6UGpNcq+LXGvuNS/HO8fxYBJcf+N8CAT1xTBXxCBJVhD9wJe4ugtBIn6QF9C8E2YrySQnXjd8t49CebAfGP4nxQxHCW+Og7AVFqCFHupBXWoYixuw9SbhskZgoQsgAALXwAaAMMK3eoR2GI6EVrqjWKIM0FsTbAd4QsF1venCjuhEwMEbKHvByif8NwPQJoFlDqhUdwakYr/q9ijbkS2Rcbf3KjUTY/140abDNmm

KQGKcDhJNbMeW3pq4C/WpbGALDyLHED7hpA5HiXlR4Nt0eaIrHpkJrByQ6xWPAhlcEdHBUieTnSCEql+FSIkILnQ1OFX7Es9BxgXNBiCOkQ89OG/PMQVOOF4gAFIYxNLnFwML0gsAmASwA2C6xZk4uYgKgjWQsLKsUuhsTaRrG2mIFdp+0w6V6hOmIEzp1BS6an0IZ5d72eMBnnIl4o/M8+WdWiaX3onVcHShdADmxMr5Y9q+PpTILdNCHtdHpRI

Z6cdKoinTzpWAT6T11VZLV+uS/TViN1X4WSMOI9LfozGLAf4tYvcRUMUSI4q5L+MUcKCpj8q/IIpiYJKL0IBTyZABrUdHOjhQgsU8BoUIMXFEbFhjRhSUx+icGUx943QvmD+mJQk7ZSpOAPRAcDyKmZjDhZNQsecKh6VSCxZUogfDyZoNTHhyDPlLVkrGYNqxxIbqTZxhjwwIp58OCE5zRijSIIW8d7h6B9BM9GGU42aRzzXYJVuBEI1aRanWl+l

6+LvWSM3zAIx5r88jKst0Tmif5qCK46XrgTRIaBPCu+EYmoGKapz+kRvE3mMUkmpkRJexSPsb2j7W9cCfg+gIkSwxzNY5jfYAu4H+DhFZSZmXAIBWumfiC57ciXgnObKQJk5bfc2PvnTnYyNYAE1cf2UMB5zh5pJYuZQVLmj8K524iPtXNgJlz650/Qcnbxbl4Any3418udO7m9y1o/cr6S8xInNYvk5EkafHlz7UTWqhfKrsXyYlgyWJgHdiXDM

4kIzOiq8i+U33d6JyJ53AKeWnMrKZyF5UkxgCvNDJFzKyG8/xAfJr4SSd5Vcwlj7ywXySbex82fqfLblziXencjwPQB7nAE+5gFNuoZJSTqshucwFfoPSxEb8kR1kw1jumwpNhJ6xkJsCwG3SWt7RHk0jofRTTww4ocEWFH0JdY5QIgK8FCCpnvYwo2Mf1T5LCh+SNAnck2XjhDX44cVGsUEFTObgNICZP6qslBDlNTaycdh6Y/YTrJKl6yTZkPX

SkbK07uK4e+eEsbWyanli0Gts4Dh1PQDvhHZ3bNvCcC445RWxXw76VT1yxMDcoXuKCG6HRgBzoRS7NngiOHGcDRxy07htwsi49Z1pyje6YYR1g+AnCZ04kBAB164zXMH49xBUpRnVKFGdShpZMSaXR1CJhDQGpBEo6yJXqytdGFRMzo0T8IX8oFl1V/m1J+qrEiFrDLoTwza+mQNpTtI6W1K783S2mE0sYW9dxkXdcCsvxJkcKXEZQ/NJEHCIQBs

AEAWsMYlclL1rWLQnKIDS3j3o1F0UHeIdxOhXpTg58beLVBUXd4xh1DBeD8lTavxRMN9eYTpHkQH0qoeMG4G1CvRxhExas5MRrMcWFSCUxU/NjVINmeL8x3i8Br4oR71SvMjUyysZ1alV5Ql1YvOAzRYTWcoljqO6k7l4z1Q2xjnMRIPhSVyZgqvCH1lkoHH+c8lQXEcYtPDkrSURa07fGAt4mf5BQskXefgqJKYlKSnABYhgSnJ740AzgOgH4xP

IHNBQME3gidlLioAMiNoFllbx94GFXyGsL4N8Utj3jOAwJNQFNRgBWEVYkYRuZE3D6WxwFeCiph4RvALF5A/wTYoEU66zF4F7jWgMwXoCaE26xJXIvoXaZ10umA8lpZkBjkULG+qqhcWuI1VMkSS2q3VaoT0IGqGwABGIaatkkW9LVK0a1batqJzMHVmZJ1cY1dWChwymkz1YwG9XuA/VkYUguWE5Yjz1V4aqtZ/mjX0BY19JeNctHpLuBk5kjXI

umt3JZrCWOaxwoBT6UpI94FUF9DBFO6v1HEb8s0sDKmV+wZlDEyGf+0WUAKVlrSYBestAW35wFJa2dflS1U0gdVr5M4iusNUNqTV5YRApywtVOErV8HG1WGE7XDFu1ok3tUKRVj9r3VQ6r1aoB9XjrP81+KdT+uVX/qfe86lWIuuXUUFMQCa9dUmq3VBEeC9JRPtmuDo6MGFMHIyVONOXEyOcOrThS3G4VlCiQHQfAFaP4C487R7kleoYIfhbwV4

iUTYPvF3rGDAaLY21oYKEq/U8BaUdjilV+ROwMk8KqGilKE5pTRO9UaxT9yTGbDcpDizNrsIU74qXFhK/WbZmh7XCfFtUs2dW2pWWz621sisW1LoRhLbRLKmLPj1Cy9TAB3CFzkNPdBk8AqUiFCDvG3DTteBM0iVUOKlUFKZVYIvnju0nFRzDYmMpVqex9plblWx6m9j9NsR/Sn2AM19u/MmWfy6JRfYFvMvKDQzllzSDiaB3GpVaDJRygmQh27q

Dczl/GmQYJom6lDTRIAb4BQDsnj05IswDDBoEZnL03lmuYisNIo78JfkqmyirVWuAUTBZKtAMQdpRyPZYUTuPGDVBM3+sIgboBeIClyjhBgqsiTFbYvVl6ZNZ2bZAa5pU5EqPNXiggd5pZSUr/FZAwJXSptkhbE4YS1yJEteHHwuZro0KE5w85ey5g+UcAdxUy1MNstc0hfHloFiyrilFM5EcVt9TrS9gXYPJMRow1aSpi4oWYpYwj6sFkmpsBks

GV0YDqi1pa5stiHTKUEjxk/I4hU0SJFNKyB481RP3zklzMFW89whGSfwrFdJvAKAMGo1jGhdADARRpbAJCMBcCGGxXvgVsDX5ZCnATwokH2LzigiNAJ8KnPjkblSCtutVXiDLghNSNwBVAhSTACoBVJyxendqGzLh8vdiIVklLy4K4FDAXiBxhrBxDmAsI5YS+XkIzJwhMI3gPNd7XcSh7GdLEYxizv8Rs6RmCxD3siSlYPhediJRPYLoj7k5Rd0

82DVzsJJMFpd8LGSeLsV0YLa55c1XRrGJDq7sJWunXRrv12f58CRu40MY3N3gFMAVu6Ejbrt0N6lxzuygq7vcLX4Pdn+L3c2V92IF/de+QPcHv6QF7U9ReyPSuC0RjE2y8e02PXuT2xdw96egApnu1A57754UW1vDFhT6k5E/PCZeV2mXtbv5nW6pMxJ60V8+tQCgbYbAv3h7BJGsEvSrDL00tOdVelJjXrbJ16SNDuw3iLs5Yt65J8fSXRVU73F

yoJPeguebE3l1ya+BLO/CPs10wBtd06ifRkUN0axjdc+n3hbqwBL73dq+8Bevpd1u9t9K+z3YnMP25wA9QelCbvnP3UAw9xG6/dHrv0+MH9SsJ/YUMv1qrgCGewglnuKI0BONTCtVuTI1amT2FAmy5fNvnQQBZgJgGAB0E22vLgoAwaGnGNhTCyEwRWVTaGL6CnbSRKEKCAJi0WowA2N3bKMLAuRht+OZmiTDGw7xidMpCbH7divsX5SgeAO7WUS

mU7g93NaNEtsbPJU+a/FIoB4Ug0C2oMm2kg0LdWMnoo7othPS4FVFfhDTwgPKzsUwLkSeVZ2hOoOcTpDkLTydBW8cZHNp2lb2uvgtQMUURA9gKt7iMrSrDmOqAFjuAJY1qX6W3t8uDWoroDJvVgAM6IBh9WAdmW/tIDf86A+6VgOrLP1g22Y3IU2PbH5+3Gk5SZOQ7nK7DPG4TfNq6D8Ah4T+YsHZNyDFh3D63NGLpA3DyIp0gKeRKpp+Va4F4Py

+GLDQDHuhgpvswxTLPmCzwwqCKDqG/1ETWbYB38KTniGuCoBzg/2vYYDoKNZi3F5R4lagjB1eaWTeeKHVUYtk1HmpQW4JQjuFTVjUALR1vI6m6N3oZ2HY8nlEZ6PJK/hrrCWZ6EuBDGLUwc3WmTtC4TGI5JSicelRK0+1M5KsE02a16BnAncu+E00CBVh7S0ZR0mEK9MMLQgTYTpjwOgBEDOgLCuBAAgoxNMqwzWPaF1FaZVg2nlGqx2jYkA13/F

qAlgXdLgRoANL/Tpp1QEGd6Ahmwz+ZCM/qLADRnZAiBLDRrCMJ7LVAC+k8IqId5GmayyZs0xafqAZnbTT0h0x8CdMGEXTN+VY+6c9O4BvT+oGpTWdTMWnZgDZ8M+10jO5nZ9vp/AHGehwwAEzSZgc2mZHNZmxzOZvM3sEw3UABdxZnXmWZoAVnjj/St0A/CBRQDco3CSKEDI/mfswZHWuZdcYWUNc7jULNZeNWNMpnzTFwBs3aYOnNnWz7ZsYp2b

8TdnezU5xc0OeXNoFsz5YaM1OZnOip5zIZlM0uf9OZmoLq5mC7PvzObm3VRZxM7udsDlnht+MuDmNt402Gfj02+w4zG+A1je46ADQOEVrCQmHRgwQGtFARo7x/+V6NjDhH1yhAVgz8BKK/B02XDlas8C4JNlsSbdHtXuQGgnURqJQ4wV6YKlYpVk2asVdmv7biq1kubGTus9AWpypQVTSV4OzkyysqP6caVVsuo6ZztltsjkPmyLfWMJ4JgvlMiT

4bKeNo47CGawZoG/0yVQjxVuSnLfNOlXjGxxEc+VYafcRgQ55KsAAHwxn8A8AUIZ6sV5iHwFq64uUYXV7cBo9wxOg2as2m4B8C49MuPxIBCplJe7wb8nsQLm5ooQ5sHgrLr3ELlcCcVzOYAAkiZK6lcPbhr99t+AQkfhUAR8ACzuiCWgXwIjq2CFe73TaBjJOF/EqccwBqVwIdXsA8VgADy9XFDaqykJ/glgwLCrH+7PbvnfJUR+AhIVNYwAMIXW

ZA/AH/BgQsIkF7iJoICaJJ4K8lsQDAfgkIW7K75f8KRFSShMwA+6HdW+2UsowMJTn+mtRfpLLymIyEhd/xZ3dsQknXWSCDcxgFBMXFlxgC/Z4ohAH0JhrwFGGruTQpvnuA75lZ2K5tczlJWpzfV9Kz70yukbsrlZXK5IHysnk+9JVsqxVan74BqrtIOq5I0pLoAmr7ZVq7nHauMBOr1Znq0zbSsDWy1KsYaxCTGtO7sWU1r1bNZRvZWlrwJQDAcW

sIm75b9N6szteVs759rI0NA5PJOvGHP951+Uldagl3X5SsgJ616detMByFivL63414jMEuyIhQG8sUvHXiZ1kNv3fmRhs1K4bShvFpwCRtlUtbaN84u7foBY39CuN/ifjZl4KMibJNtW2TctgU3aFCfW+UeoIknrIUL9GCB0ZeRIQrzrWm8/RDvNXGeqUB19TDPuMfr4DPtBW2MUZs1Lmb4atmw7o5v0kubPNqDUro66AYBbMASq8LbAI1Xyq7xC

NZLe2YtX6Sk1uWyPY1hK3x7KtxXoNctga3RrqZcazrcUYzXI1Bt2jYQCNsrXTb61i29td2u23P8B1h28ddTnO2zrcpURtncML3XvbXgZ637fet7zP8Qdn66Hf+vh2g+kdkGzxIhsSGob8d2GyowRup3BJMk2+9rfRvZ3c7gJFGwoWdBF2nCJdwJmXcP1J7qFVd34s6HMMjbjJE2vjRtQuV/GqdPCkjMgGLCoBhF6ADDOERYsSLwgTQdeiMGfmhT9

utHAmMRIFghS1gUETEzou6AichgxDTYEAOe6QRpFHwijuipeTfbg8v28PDpbyN6XY8riwy0ZWMsad2TjmYo8WJ5P+a+TQS+o1WIcs1gaguDF4a0cVRuh9SjIpznVCSXJa+ANIheExUZ5BWstIVknRwPXb5bIrcqmnTznWm4FwwKDz/AYVqa+qdm5sWws8TrJ0LQihetVRgCxAaAY+pBjXYNA8YdqzDZTkxjgvwIsBgShTmgFjcLskGW1ZB3pyizG

IikySyqw8ebDAAu0GDfZZtR42TJcFPAfiRIp/eJCzkyWxaQwkS3rqSR+muBRugGV6L9FVC5+J8mGVvyoH0DHO2xmfKkbBNGAgd5cejbDtT7hD9xDZ+bDisGR8CqgRXSi1TIfOBneVbe6Kmsbm2sARvSDq0TKe4Efzqxs6UjKq3HO0uDuzOUnJgV4BXyXfCPnIWzI17K5icreT6fb17EfnKsRUJImcAQBhdIh9mzBNt33FWCa5BvTPebkIvGA3wWE

u1zOmjm4u6L33flbZIjEb88DvfHiADLv4CrkrbA87tQJUuJ1xoetfS/wMu8q5QGhYpy5YKz7xd2IXPeNXyeFPDCJTo5+U6PwrgqnCfGp/ocI0emGLTTkZy0/bVIaOnxzv5+gB6d9PQSYL6h8ywNejOKmgNu8qKQ5ezP5nJvRZ0eN6SrP3TPzjq9s4NC7ODC+zjANEgtcnPAy4bxEpc9DISuUDmEtAxY1GZ0tHnmzV59CXOIfPFGO+8glS69cAugX

29kF/05IIzUIXMAKF0Hw/JbnsQ8Lz+0i/5dL2ne8QeAMK8xfVnsXXYXF1nNTKEuEgxL3BaS4YPcEKXHAKlzS7VcMu1VWV5l+qVJL26XenLxNzy75dYzBXiBSd5QtFcFEr8hbuddK9wmQa2S3O+8Iq91jKvP8qrul+fNI1aun7HhGMpWToDDO4+td22PXdng3A4wjGXbi8kKTAH8+oB28+AfvM92bjfd3rS+ceOGwTXoJM1wCFKfHOKn1r3uXa9f3

gEGnzruPq64Q3tPG3m1/5yrF6egvBnND8DxLrGfb2JnQZLK5G4We20lncb4Ims/PKbPk3NkSQHs4PWZvOnGGU50flzcXOxXD79CUW4H4lv2dZbh5yrz5ZVu0yy101xbpX3fPOnTbgJC2+VK7423frjt1vZs9ZEe3ML/t/HzPfDusZqL9LhO/NgYuXeWL6BbO/pKIKF3agIl6BPD4j8135B+olu9pecB1XoTPd0y4V2Hv2XWVl+8UzPe8vkml7lc0

K788ivlo9724uGXLU1yykMrxtQvffcaBP3Osb9xrp3cau+JKGoD7q7A9LPycHDki/w+sPfGptmIrh1ZLKG4AyiNAHWK5H4BZApHauMWdGhdkZQvcaUF+rvS9ahA7kYUInPFHRiRGhhduLesnUTBKoXcRipqAVDJMbDk2OKxzU4oZMOO3NEO0HaZY5OFsKj3JqywFv5O2X0GDK9qRqPkB3oxTCqbMEsEbEI1X5dAvePEoVNSJKOD1boP7OSdE7Uno

x8K8viSqpHUq42qyaUoVWfjNPZjbT+Xs/x8kvEOtkgpgOzL0lNiRRRFmI2Rbb2A32zGEnmimZAkN13ASRghZ5f5k83anlglJ4UZpuD18JBIbTYLVE+oydzst+T552TWqfj4OdCjdKZIsxb5VfG6z8HLs/KHu+Ln8muE/KMBfpX7Er0xF/pvHCEvw8yep9DIeQZqHzu+h+7tQzsPMB3D0Pbr56utPsvhYvL6ViU+cFkoFXxHzV+M+NfDBLX+ix181

c9f50zdYs+N+qfTfwv7ppb/F+9eF+LCybbw9+Pi5GYqYJsPSEVDFIh4XU6TUzLORjo+g3oGCONIYoPb2MqSV7ACL8qaaRZlwhOuafYqv83QiU57oDUaBI+fZboRMDj6u+2abv2lu73iogRA6ijz3ko55vceL/PHX3nx3DuC3/fGjAToH02BB8NilUGUYrImn5Uowd4bGNziksGCXBhgQ/tUxVhGOamMnTqLHylW6hTHcnhsFWEuUV61E6A8hHPjI

khJCYbEGInpJBUuthPEjH4mvE4AHOqsAG7NkCBE4TB2BgAXKx87Thrqio+oqtZDEZhssaZAP/hu40aeroAHs8wAadZTEYuhgEQBnTlAEBIMAUHxwBGbis6F2kfHHDfWvEPKyxu7rlgFsGhQlBr4BOxs8whAydHlBsy/krYiXc9vverWkFxk+ol8j5uXzPmzXJ76EBv/uRofEsXDUQnkKJMA5UB4HosykexxJM6wBOACwEIBbARUAcBqAdwE0BTAL

US14OAeHq+Amfh8aEy42gN7DcQ3mTJcKAjmUIms3wJICKgOsBADnUFfltrBQ/kqcA6OaOAvBJgkUk34AyBJreiwmpIpo7gqJ0IChRAeuO/Sg0RxklJtCwVCphvo7/FvCn+E/ppY3e2RnSbOac/vpaOOqnM46smpRmSrvekOubLeOZYpv6Cm2/ojqA+XQPmgH+hPDQKJgqwMxxn+xEEpo+WROPwjegt9A/5+caPs/4JUTWEjTv+7qMByf+fDO4haw

9RAQEW0+wcIHjIciA/Bcc58LwhN2JOG3ZnGcgWh6XGjEg+bdabvioH9asLFXRHB7xn1xkWXxt4G5+VFuNxlCGGHiBawkQF7qSAUGM8prcJHL8oxSnoJ9SGowYoUjF4O8D0Be4K3hkrROXyAGKLCvCA6y8yiWgkZNQRQawKlBwlsCiWOcAurI1BtjvSb5Gj3sDrFGJlvZhlG7QVyadBpYijy+Odloyq7+XQN8DDBnCLawnwSqHjBJaWWAY4+WfCO6

CSBiwdPhP++Si/6Y+6wdej4+MVpkDqQ11u+J56GoVqFfSpwXIjXAFwXCj44VUDcEoe5xvcEKBXWmXxLK7vqoHvBPtJqGvExFgvyfG3DhRY+B6HH4Gje82q5B2SxIBhjEgnAPmgZsYijJq1AaWhEAnABMNFAwoaUNAJN+bUN0DbciYPIp+isMJ/zTsfQGmj+GfUk/CPatrLVTOw0UCfBlh2wJSEUmyYjADomboLUEZiDQU97mWzIRnhmWbIRZafe1

Rt0Fo88On0HCmfIeEERaQtGyqo6pUGWHxohitD7JgkwROzzAYUh3jRscoTkpVYQgoqGrBzqNj4f+eptsFb4PtHEQfOxzoAA4pIAAApMeGhCj1tA4qwTYEeGnh54U9Yqw+aDeFnh74BeG0E3wMc6AAKKS3hL4feGDhg8u4j7hhTk+F3hl4deHmwJ4c+GvhdZI+HgR34VBGawn4XBG/h98vcgJhXhjcBjASHi1q3BlXA8HPqvdk+ZAccBo6EARvrt2

TARP4aBEUR8ETBEqwEESBFvhiEZBHIReMm6EeB5FoN7/Bw3oCHzaOsOPTj0YRDYIRKEQR4bq4wlimiJQAAkTzzA63nVAH0lwA7h0819B34lQlPMRLo4pFPei/IgwNJj8Uq+A/C+imwEZFLAJwJWFJsumDY4z+ulvUEMhC/s2GuOr3iv7mWa/l2FchPQX472WdeED7qQgodmDyICdOiYHwkwYGCeWsTmLQJ0UlkuFa0K4ZKphWWpolQqhOPjuHRci

ADS65okiAYB0BxxDwGqwzEPGTh8wBHoH1EYgPoESe5sMWDhEigKlZBuBBJta+YnULcS0gykjAQqwgAEmEKsJECuuhgJKA56n9htbdOVnhH4R87Hr27c2I6kNGQuYull5OEN1q54XsZBib4y8UnsWgUOxDmASy8KsEQD7SqxogFB8qdlOr86bdDsjrRnqqgAXuRdrAHvAyAGfw36C9gcB/gRrobBpRoTD1FZRMGgszJkeUe4AFRFARVQlR7wKAFUu

FUVVHdevBNcTskL8I1HvAzUbUTtRnUVardRaAWbabOzHt66DRIbsNHtuo0QiCOeP5JNHTy00Wga9usLgO5vkyfktEGMK0SeJrRMvJ6pbRRIDtFsBbdLfpLWCIC3xf450SwQJkHpldE3RcrvdFYAkHjHR6oUQEaFsiZuOEbXA5oQ76WhTvnhGKBzwYRGAKDxmoGpRbaojH+Ixge9Fssn0VGDfRRDkVHKk/0fQCAxnTsDHVRsGrVEQxrsFDFk+AZLD

EdRXURlG9R5tv1EsegLkNF2eANiQRYAY0bjH1WznlNGLWRMXNFwuZMaOQUxvTFTGJ8+drTGbR20e1y7RzMQdF7Rx0XHFnReXhdFMBvMcUS3RbJALGYAbgcwpWGrCn3RehsgrNomijMIGj8A2FBhgxQc3mciG08dAdpPwBtP6JJhwVOaYjAIoXFA+S8EBEZ4CLqD0B9C/CLIhph3rI9r3oKaApHvY8UFlD0M6RjYpWO2KtP4FS1kSpSNhjIYv4thN

NG2FGWHQX5qchsOj2Fb+mPDv5eRXQIqC+RmqCpb9GG4E5wa4Pls0CAof+gwJ9iC7Kj4xRoVqTpKhCUclSqh+pnuyGwxkMwTOh9BCQQzWHAFx5KEWgRda26XgLzbNW5sNfYqqhTtHYJmqfvWR+MxMf27kEV0vmqIAoCbvjgJYLlAmZEBrqy6kBVRAglyulBCiSoJZESITR2QvgYwKMQJDgmhxxTNVp12OpPche4b/N9goQY+J0Bp02ERaF3BcsdaF

PBtoW+oD2DoK+YgJYCVqGQJf9hQkWqVCQAE0JgoHQnIJ6tiNZoJoJCwlm+ZLOwkNEmvH24Xs+Ca6Hca2fjw7mS3oUJr+B82pKCnUQ8PvyzeIketwyhkKKd5fI7oBuAAou9PMCRQd7GlDwQL6KP6iWJUAxQPwNUBlDXACNMZrnewkC8xQQvMjFDE48iBlhLxGlpkabCVJh0A0mFoLSF1Bm8bZFoCTQRWwuOeYiyFtBB8eyFHxASrSqnxvQefH9BfI

QLRDhlAqE7ZgCYCvArw/lo/EJiM4UwK8IF/mPGBW00l/Gz4q4blp/xawQAlJR24dFbTGPtE2BtRD4ZskbJ7Ud8CbJ+aNsltRBwaRj7JhybsmnJ7UTslfSzQH0Cq0QiTlD3YiKMcanGEibhHSJmHkoF2hrwcRGtchsDslbJlyZsl7J7UQcmAprUTYnfBA3F4FsKlFtxH5+vCt8BNgyACKH6AjccFAFYgyk0A8WtiO6KugckZcDsUU7GJh5Qn/B0Zn

BjYhcCfKX2iklzAlwMRKxKb/AOw6OZkTlJrxuRnSH2OebNvH2RtSa2FveDSR2EchzSTZYmcf3u0n9hl8TgzdJITuKaaoXrEGxpGdAkJw+WwKJuCXwUUazzfxaTqHL60iyZuGbBWPMlHTivwObBseWMTQBiEcTAQBiE8rNYEKMVCdnboBaXqy6IE4hJIQFWcemG5TO84r564EyjF0CbJlEbQRgRyjHETtRQadBHHJJqax5MJECSwSWp/qNam2pyAd

cy74jqd14su9BK6ngkGAKapepx7v6i+pfPmgQBp4afBEhp+ZGGkMRkaccFBU/CXcnvKDydwhiJt6teagyUiRDIKxsif3Ye+JERsqZEZqfZ7xpVqfgA2pu+HalOEDqVqEZph7m6nUQeaQwHhuF8kWn+pgaeWl+plaWun3hQwaxG2JJcTn4OJFcWUL20YAPUCuQV4JI5eJJHO0azwV6AFF08H2j0JQ0ckS5wd4CNCoqiwn/MbRnAV/GzLom/fr3TkS

oQCpgYRmEWpYB45JuZEYobKVmwcpNkVyl2R7YbvFVSIOoKlNJMOi0ktSvYeKm80fIS5LPCI4b0mscqRh3in+0PnvDPxd6OkliBGqRqZrhuqRuEbBuPlsGrJX/j7RawckE/jfAxYMPq4EgAECkuBPRGKeQSFwFJ87PjgSMAfGf6b0R3wE+DmAkgDdZSZJpvRG5AP1pLbiMjwCYBYAvgPxn+mX4WeGaQHpvxmCZSEZeGzAumcpm3hpIMAgZk1xIpl6

Zt4bba7kJZAwDGZjAPRERprHhZl0RVmQECOmVxK5mSZDmWeFOZLGi5mKZuBPpnVpKsL0DHO0mb5k2ZAWTdbJmUWaFm5E4WcckcZXGTxlP4bmUJmDIomWz41cEmUpk+ZZ4bJnyZ9mZZlnhqmVwHRqtRJplQgX5N5lRZhmVAB5ZpmbQTmZQWdVl34fmS2ZJZLWY5m5oYWUQQRZ7mZ1l1kLAN5n0R1mf5nhZQ2SFkjZ6WWNluZUWZ5mxZ5sPFlnhc2Q

NkLZW2SaapZy2bZkMA1yeVDFY0bBepKa4ydLGyBbyZ2k2hDEC8FERKsX2kW0nGdxm8ZkmSZlnhwmcEhiZxWWaqlZMmXJkHAVWWVkqwtWQYD1Zu+I1naZNAItkqwbWR1nMRZmTNkJZ82atk9ZKsEdlwkK2XZko50WdNnY5s2f1knZ4ObjnOZWOQJmMA62fBGbZyZqTmJZ+2SlnDZeOeTkQpxyuxG/BMKeXEzaZQuGBEA49GAByQ3wK5CLK4YZX6eG

gyr2ivI2wNuC8yT6WOGA0J8IsBiYLdq/KRGySUlLvULKdY5/0pSQ2EVJpUjymGyjkQZTORdUtDrWWtRqKkhKAPnyGWcwToRmypIoI0ALwmwOMFDSfKlf5/CkkU7AgZU0p/HDGywfRnc8eqUxkiCoWEanrSWWZ9m5ZjAIAAwpKeEp5qeWnnp5GeSnmAACKTeZyZhhjFgGGE/hyQioBsnfAT+BhhawTYHJDvgioIX7JmKsDTmlZ9ec3kt5reQ3m6Zt

gTDlt53ee3lBZqAKDkKZPeUPmN5Ekl4BQAQ+RPkj5E+dPkmmI+cnkZ5WeSabz56eYvnN5I+XxmeZswEpkb58ESwBN5/puvksEZOQ3mz5R+TZkn5a+bplSZEtvSTb5O9rfkt5I+fpnp5gABikh2Znlv5l+bTmZ5P+b/kp5L+ZlkfZOWbgTL5f+WAWp5Oedjl55BeUXkl5msOXmV51ebXkbJyZlPkz5k+R3lqZXeegUH5umf3mVZOBV/lSZAGOPmEF

RBWQU95c+Znmr5oBRAWP5V+Zvnb5nmXvn0FQWVJm5ojphfnsFx+fvmz5V+ffmf4d+TfmCFrBVJnP5aeZ/niFqeZ/n15NOVIXgFYBQAW1prAHb7iJMsZInfsD2TIlPZSse+oKJeHuxlAFX2bQUKFf+ZAW8FjdDAXF5peQgVV5NeXXmoFueRQXkFneeIxkFI+fgVg5zhXwVBZJBd4W4FUBf4UBFUmSYWnhNBdQWiFDeYwWz5zBRYWH5HBS2ZcFZ+Zw

VxF/BcIVJF6RakVBZ8haeGSFH+awU5FphR/mc5o2lCmlxZkqNyOJMAALlhA4RIwAsA+ALMA7pUIeIqX80YcmHxoSimbjcy1DDVBjYGaGPhbAUsZkFJgpwDGG4mz3HpCVB+SVP6WR68XY7wZhRpUmoZyGayECpLkbybdhWGWfENGHSZfFSa0qS7mg+rACfAaRNwI/GY6oyX7lNYcYLIgUMH8czwzJsVGHnrgEeYAlR5aoWsl020WXET1onTOu4pEW

BZ4AqwcOe4TMFBBGwEmANSsHaHiy4n8Uh0CAVVZgEmEIWC74RWdYG34nXAKSykCSKJlCkmhHF7HJcVpvkBI0OP8WqMrhYgSglJBOCW7RUJdQDB2HhPEhklCJZwRIl0GnhrME6JWLrhkq0FwYVEBWZlFm6hJcoUnQqha2nt27aZoU/y2hf/I9pDob8nD2m1iSXwl1EBSVAlVJf8BNZNJbvkQlNDmgamADJbwQOEpJeYCslJ4qmQolXJTH4Yl7qnyU

G6ApSJlCl8DkXGWGfgdCllxXEb4E+AZQh4D1AAZEPDoAzRZLmRBYkVvADCSmHJYuoFjkmGegpwMJjE42UPIgIQn/FGjES8Ro9qjC0xSvF2aNIVZELF5SQhnLFTIQ5F1J+8c0GNJJAl0FuRrSR5G8hl8dkLO5UWq7kPcgyd5TBRYpTKZhR8AIjTaR5wEHmPFIeVqno+8UW8VJRrGTsGZAnnjABiAmcu1H1uKXg7piGPJVfKU21BGba5eZWmIBgW85

VIYFpl8soxsuWXKnbPgJBIjZUGzBI6mPRPtNOWzl1ZruW76a+t4Ab608sw7Xy65X6nnR25f2YPljLg7px2aBEeUrQJ5U+BnlhDrLqXlWoULH9K9xTIFtaVoVoUfJiscoEvZg9m9nlCCcfEB3lYxL+WLlLvMuWvlq5T3Ifl57pnHflCjLhX7lODoBVbEx5VhCgVLBOBUH2kFa8SulpRUTKehXpVUUGpBrCRjE2rkKmCuQ9AN66n8xRE0LrcdUOVBJ

gmOFxa0M78SiGtQNfm/zes7yilSf896ORzxBIVATDxBRISAJx0FHPMCegNUO1BTF6lpBlG5RZfMVwZhZUsUm5SGaWV8pTke2EbF1ZSfHbFbSbsUSpQMED65AN8Z2UKWxFLD5CIuOjE4Cqfwk3bzYgwHOwo+Q5bMmxRv8euFv+7xSsk5Op4Lmh5CeooUKGiaAgoJncMAGEB4gGgkf5XAhMJECuGlwPwhbw6ADAALARIgsBlI/QPICDAN/vUDUgKoj

ohqiRolHBSClRUenzaOguETEgrkIqDj0g4SGWiRkEK9jP0KEMfQsyfysmEq5N9O9ztitiHpCRGmaF6Kr4q+DGI4+eJm9SjAQUsRRKordrkkWV1ITJw5GsGWUmE0W8YhkCpqxfUkVlaGVWXHxmGQKZ1lDuZfHhaBGc2XHFzAmwJ3IbyB2UZaVxWNLhJqlgmC0ZCofMlJViUR/4Tlu4e4gaBmZLtES2DjObY4xspECRvAtRMIVCBzSjqGIAKNaJJo1

uaBjVHEl8jjXuADVnjkE1NWrHSA0KKrehvar/ImFwVHdtKUQGSFd2k4eCpVxKGwJNTXJk15OKnJY1yNuOk01AhQTWHKfXnYmcVh6TNo8VlMrwqoAhQHiDIAWsKmB1CE1d4nHmd8Yh7XIxpMEnhGPyDfSGo8QWP7rVaCO8oSRhldFAJ0F9IWFQ1Z1dd4WRBufmU2Vt1cbnMmDlbyl7x/Kc9WuVb1SKn0qOGa2yXxyOk2UuWnCBbXQmwNXQKtQctL0

Z+5CkV3i5QyPtMlxVzxbDUMZyVeOVpVSNYjIIgR+L1DVRFXrAQS2cjLxAh+K5QBrwkJBH/YJkBruQS4E8Gm07uun9vzapWs4n/5gSOADSC86UzP4hyQJddHHUAmaktaYAY0f4iEAGgBQkawT+MSA4KpuhMzmA9JDNYYs1AP8DIxjAPmg8MPdRXUZyNZErCf4vsbEzoGtqhHwGQgfCC40aF+APVqqsepIgAgmLDgpgSIttDGrMaeq7xxczgBrz4AZ

th2gOMbjIAE52sXpmSsEVGmXB4sm1vAQ5kWrsHEX1MZFfXOM6IBJl/2d4CuDHJo9YwCl1kgOXVzqYEhiw0+DxB9YrkAII3Vcx2sYoSVk7dYhoOBCOebbd1oNkQ3h8j9UPVG2uDfg1Y2E9dTHn1xxHPUL10xMvUGQ5buvUqqhGq/Xb1zcp/b71gvIfXhqTxA+Bn109cg0viN5KmQ31O4ogQzWlJP2SmM26n8Rb1ThCS6IEm9r4w/1skH/UuAhrrgT

ANskmA1JMxAVzGUaMajA16uc4gg1rihMeo04SN5Gg2EA6ZJg00E1yeKUnG77OoX3ZMpTzU6FKFcrFoVipe4jcNxaIQ1914fCQ211hFfXWUNRMT4A0NoTPST0N7Tl3XQOEAIo3pNv+KYycNaDik29QvDdDGJ8AjbPUMWwjUvU4K4jXO6b10jfgA71cjQfWsNivMo3oAqjTPUk+ApObBaNgQDo162+jb4iGNvOiY3v1UXhvZNR39SIZqA/ZLY2AN9j

VmqgNTgOA2GxoklA3uNCZHQBeNi8sB6zEThH40TNWRIkBBNpeiwRYNISLunFx7peUW2GAIZZJzajMHZLfAXQOET5oT+CwBuC+aP0DqQioAsAYY3wL0BP4tYN8D5oPkXaKNCzQsFDDADQMMC5QGdbLTsCSYb5LeS8IS7DvCKkcdCUikbM/AAos7OLSZlWwMRIDS96G6AJgjWHrkPeVleyk3VoPAZZVJ5Uo5UB1zlesVW5XjiHW25YdV5W4Zl8c0bR

1PUoTwOct6K9pOc96OjC+5Y0icD8I8iPGDQ1oebnXh5jGSlUCOnxTzgZVuoogDOBOVTiLVgqAJEBWt9IgMmQQeIHVW5g8gOjh6KUIHVD1AkWMSYsi2wPoIlJyotpmqipAOkLdV6In1X8582thT0gLAOGDvgUAOpDBwutSRwJgb/AfTyIzuJTwI0p1dKCm4i3hChiYnzN1CRGYshEBKW7wpRxfMIKPxQre9LTEpSm7oPW2FI2ZVSGrxcxRy2WVdlb

7UPVfLShkeOQrev5bFH1TyFfVPlV0B2S/lQ37bAxqB2W5QpkWDV8AsiC8gOcFGQ8WBy6pjDVxRf8ZuwmVFYUAlC8gtcQGbkixNA4lM5MZLoAABjkj4AHwAYQWEZ7eBIo2mAqpBHt67sCRlwCxIrx0+pdfrpYAJ5PA3AB0JEQS/4T4NIAYAxjFiX8lZMU6XIGQRAQCIE+BKwTAlf7dnKpwdAERC8EKJHgCKMsTMSgX4jpf9k0kVECxBnuPJPGR3Nh

UQe1iSXLGg6yEP+Kg0UBewZmSahZRCQQGEmxGeWbWrBMUQ66BJajWAY7gEwZXWMpJsTpk4THIDUAuYCOrhM/TKmSioFAGXCYAVAJLprM+hAR2Bol8i8BB8oqB7G4EJgEh2xMKgKWRgd9pZfK4lzpUfUwdsCvvibNq+hhqXtHwIkQGEpYDx2iSjAAABdAZoe3tMfHeMyu8VCZ242eiRHFacsD+DJJcdmEMwQGEeIFAD4cRIMEL9AmhHgAGEXQBYQv

Wz5NETMElsKgY4ARvD+1QaPzg41V18QLJD3E/wJIA2pspKR29I1Tk55suSxCiTYghYPPJ2lFzPQAEJRNSABC1HAIe2kdQjKe0okF7QCDXtt7fe3X10IE+2kdkuvqCrMK2aJKpkeuj1GYAv7dmT/tzhIZ2YAwHWqUYa4HQ6WQd+HV52wdijAh0H6hxJaWodkHJLqYd+BNh15oPnaZ3/ipjIGhlRuBCR20dATb9H1EHbp4CcJyxJV1vdkugx2iSTHe

A2sdCHJ42cdtguQ2wEWILB0Cd2AEJ1a+OzPpBlw+ABJ2pqIANJ1gEsnfJ2KdKJMp2TpD3TZ2IEGnYBi0wiurp3LdqjAZ1mdwHtiV4deJZK7Q9lncKTWdBhkbqDdDnb3U+8bnR50qM+3blSGG0OMwT+djZIF2bWwXQ/UlMtglcyRd0XZtBxdtUbgBJdKXSQRhdVzJl3Fu2XbMSLdeXWU4FdYEkV2C9pXeV3AEv3UAS2uNXVsR1d5sA11/ARnS108J

UHjqTlQepGjiGkxpO6C3Z8FR2kxNrvroXyJoWIok+0nXeA21EPXSe0Rx57XZ03td7T3wPtY3eWRW9r7dN3hqc3SNYGA2vWyR6dxxFT1AdIHdB3bdJnYKXQdjPXB2uNiHRT2nddEOh3mwl3aow4dt3UX3bkhHQEDEd0JK92Ck73cqSfdVHUDbPtdHf90+8QPSx1sdYPW+QQ9DPd52w98Pc6CaxSPeJ2GAaPRj3jMcnR4A495sHj1N9anbKTE9WnWT

3yAWfQB2GdW3cZ04ljfcKW8dB3SuVBIWiM6oqwdnRz3md3PRp141hLN52ykxXUL3+xBVKL1oOczVBKq9EXVF0xdGsJYD9ACvUr2pdAA6vJZdj5IQAZ9FQPl1Zq+vbPwldJscb2W9XgFV3m9P5LV0Jk9XfgCNddvddbKsstVn77p9iWG0jevzbwpuCeIEQCRt+CMWCPAGGDQDj0OsP0BZAsIFkBuCXSWIqotUJiSaBsXyhAIoQgwLvQGK8mi6iomM

Sni2RGYYpmXDFTbVWH0h7LddXttTJk47VJLQcv4W5LlX22uR7lYO1ip4rRHUjtrzYcV/VBDCirEt4+B2UAol/inX5Yi7TvCsYA5au2P+2rRu1hyYItu2U6ePru09YxrfkJmtJaBZgKCzQITABkNJpEDyA8gLX4sAZSHeg2qAUWFB4guAAFaS2AZB0ByUbhkkIBtnVUG0Lg3+MaJ0IitdRa8KEAEQD4AT+O+DhgNVWimkcVGam2xSwwpjiXF0oCGI

ltIwJJHZQvZTiF3o6kX8j44b6DGUyy/QndR9xxkUZFWa5lW7XQZrbWoPOKd1cWU7x3bWsVB1+g5sU1lHlZ9UXxI7fID+VUUPLkccDg7KZKWwVeFX5YJ8Bxb6Kbg9krRR8VT/HpO3g3Ni+DhrZOWIAUfal24sYktnrpk/fMT47mhFkv33MEsBwYF9spPYxRDndYwDy+vgA576+6vKYy1W2NdJJGEWADq4awG/VQqyQ3xPQD9MDTH2TGEvENrrEett

HHo8AV1h/iA2zaJRD0EiRL3D+N8rL313dv5N0gIjNPRkTCerI2bpv9EAKvUawgnWonR+ZAdER3RJoM4GCBXjNPznEdnWeXm9ZhLwCMAbXeNRfDh7bExEgfwxYne+gI/hbAjBLvuDgjJ/cARQjDDXapwjYLpz5IjZ0MJ6TWWJBiMUEWI1gAqdiBN9EAgI6gSP1knfN/gKkuI8hpB8lI3hJB8tI9eD0jKsIyOPgzI8sSsj8vhyMF93I2f189pfRhpC

jajCKPJ8/MRKMCBeAdKM28so4N3yjGZIqMJADvcLH/K7rPqTutRpB73PJkTXdmPqiFb73xNehQH0GF7iGqOisv+H4i5x2o6gZAj+0iCMOmRo49CXypo5gEWjHI+4DSANo6iMnE6Iwp2Oj31iiCykbo3iOejQJN6Mkjfo8J7YgJhEGOS2MjLJAdOEYz1ER2/SDGOqkcY8Z0JjUHXPp8jxjKmPQJSfMoiZj2AdmMVAHTg43o2co642EExY8qMlFXDh

6UVFpMtxXMZVcbwodAk9PIA6wHwCMDj0qAFkBQA/QFACpgpHBQAaAlgMSBzUfA2JVotG3C/Q1+TuECrbASYNiFJB+3N5IXqRKa8jUpkRnooSWpxcnTzAQbBGL8UHeDPGEwiNHdRDFZlRBlzDoeNsKe1nLQSrcpGAtCCnCOAny1XCArRsO+ar1cKnStTsjGBfIqmPVpOcmbTMESyamAJhjG2pq8NYpSUGKos83IZqmPD2qR8UBDU4vbmlDlA9ZOEg

CgkyK9AuAJEDoAeIKCBq1Usl0CAYQPv0DoAxPPDSEw8gLgDnweIGFMmhlgjSDWCtgryJWIQMM4LOCMokJDAA74Ng7VdjZEEIAAvKx4AAeowAJTSosYT5DqQoUOmDmQED6imP6JlWmt2VaEOukJQhBMkY+aIwCRA49GawKdDQ8mW6QLra0JyWMEM9RQ0GrT+kvxlUBLKaKaCFxMH0obM7WstWlgsNOa6g9y0rFaw09VaDlZVSoitP3nblCmErSO1O

Ww4ZYOE8FbefCg1dAgu1ShisglBbgWrcOUrB7DD4OGTytdToGmXxU4JvWwBM4L5T+DtW6JAlTtjXdjEBB8QeMikH4wR2Xw9b7/hb0/7aIEn084LfT4BL9PkeMhADMrgQMzAQxCYM4N03t1vgzUqFnvZzUkQzvo8GxNcpXzVvBSTVDPvWsM/DOH4VEEjP+8Wo2jMgzUY+DNsVpFmUUHpdk/CkkYLAMTA7w/EbkMtFEYZ4bjxKaK9pYtiwLNVK59nD

/zbwffliaa5aCMmXBG/GGDR6Vx8OaZxiTQKlqEwm8I22zDk/lJQyUclOyLWVIk/P4rDpuSSpllgdWtMvVG04pNbTYrf46XxyXFTA9JruS8gcWIwqcMhVPZT7mOD3soSlE4mdcHlrtng4lX3TBkyOzvDRdYgD1KRU0SDah41AnOEW+Eo718ASELPBowMUFjij+awrWN3qXvVzUYeTY18moV+harETUDSmnOATEyNzkehnEWUP8OvoYzALAeICwCYA

TQMSAChV6RIpQQ/CPJp+ij7KRk3IhDF7iQopIbROGopLa6DlQ6JtvD2c00zSm+WJ2vI7hAw8QjTgZWUjMVjQeZWbOLTjQctP+1Pbav6bDble9W/eNk3sUjteIP5UnwQ6MmUJay7Sq2ZzJ3ufABRN0+ZMjlm7Q9MxzVk+qGfDWMweaQzQC1e03t98uVCNAH3GlihUHFvjNSlhM/LGPZpM/aHkzAtT7RfDdc+6HATXzXCnkyrc7wrEgioL0BNgLyPQ

Bz8ibf3PiWsKAjSwokka/S70fbJMJTsjFEJxj4AYgMA/pS7UvMTFvdHHTbgA6K8ibzC8LNPVBl1fWFLDPtZoO8tJ8+sN2zwdY7OmT1895XlTXQHVO/VMdSlirAXcaMJKpL2j5Yv0LgwTort9w2ZM51Xg1HNRQj0wAuvTiACgABkEC5L72LbaKgBOLNvuMhcL0C/EEnAcC2IOFzbaY74lzLvi+p+9vaRTMuLjiweakD7gT8GNzfwc3M/NjU9WAaAU

AMZC15GgNGoNDCYO6AH07eEkmw0bUMiFQ0cKPwnG07FOEDRVAYs+ybeLyCpaRQInLpEP08EKEAPsHwnTyDFYi+7WpibbVItFl9lV21yLq0zpznzm08os7TZU4gBA+26Josytsdb4YJhZ3nQLnwXZZcPD4WkRuDvcX8xYuMww8FNRUmuAAsCcAuQMZDj0eIMWAfAxILMD4c4RBQAXUkGHOCRzXAn/M7tlkzHmKqqjJqM9jvbjqNRkC7tiCB8+A3uM

6uFqvVlZylsDSQqAZ5aVTEj2ANYyX4CZurw39FXQPngNfMBl1eEocHGnXE/SAC4gQYhFbq39ivABZX4mRBuOFEeDW+0rZoASQQW64Xku6a8oMb014uBNp6qR6vSMUTGgP/f0hfL5xHjXXRR42WS4E+oJIiz1s/Bew/LnhYPmXOIdoA3HJXRBqMozvY8W7/L+AICvW9gYyCtySYK4goQrxMFCtqMPqrCvwrmXUis/1JvaiuvWq4BitUkWK/66Eg/i

HiuJABKwaBErPvCSvOEdBn2QawU3e+0Axn+rSukkEXr/2waUEogobR7K8mScrjANytdjWo7z0Cr9BBowiroHauPHEYxFKtn1ukgwByropZsCRsAItFAoQINJpMBLkpUEtIL7yWXNyJ4Sxgu+ku+IqvxrAI38tgEGAGqsvtu41SMUEoK8CW6r88vqvgNHAEas+jJqygZmrhPV/iWr6BNau01nhHatY2Dq4oxBIzq4St8GmZB6vMQXo5bC+r1KwGt1

u9K8gqMrQbmGtCSccZGuqw0a7Gu/D3y/ysyASa5AkIgqa+KvprV+KitB82awCBsz/Xp82wp3pdUXzaioJgDgtQQZwCULhyK0W1ACECED8InlK9rzYZ3h0Nsyt6TtzBUVLadVFtNS/5YaaDS2yKPavmHksZ1kPp7jbAMw/xOGz8wx7UHzfSx20yL2lI9XllCi6MtKL7kUO17Dai9gCHDdPMnRyIatB2UyIMweEDdDr3FMlhzHg7dMvFmTtYv/z7yz

7TyNsaj8sZWb/WY1leVTEpKsraaXD3MEWCk+0Pk8DfSRjEX2TgDyEBgHH4G+PPkvJbM0akQ4os0+upIMOT5KmPCdJ1sIW4E89Xhqm2xyXJseNd+qzZKbK7lsR/gqm38TqbGNhN796bEA035EpDT8vD68zcZsdkzBGZuLOpcupnWb29rZtoS9m7fiObbAVNHs5bm7SPQVJ6vJiGa4wFVAxQtxTu0c1iC+DI+9oS82P+9I1BEsgAXm9zHmdJfcs0zN

YZEFtEOsvBpthb2m5FsyA0WwZvq6Rm6WSmbDGsluYKqWxR5OeGW6LVhqOW/qV5bgRAVsebbzW6VOJuC7+tgTUeQEH8AQSOgDGQfjNkuMUqjh8KPzjYkwsqY6UH1KPssUITCcL88y9pfYF/nwuQUAi49h7c96LX6iLrteRv/c+870tstNGzy10bK0wxsjL8kw7MYZoddhkmD2PGouXpFg1ovHwMUDcBCUQ0gImUZGUJFBjoMVVnXhz4mzq2FKe2q8

uI1KUYVCsQYAO4ugL1OzIDuLuM6jBQLylusAztIiCVxqF9Y/IGNj9W+XMJNlc+hVbRjO9EtcakKRxVNzXMwQvUDJGHJDj0ioMgAfAWsMgCNlQs1LkbcyJobRCLqRn7gdDybTB6U8L/PVqFtNtdPE8c6s/6xdLf8DWHhOIMIbnUbGg+DseKbJubllsluTDvW533uMt9hu02ovmQSk+yrfCC8Grm8bZ0zRxzt64LEZyIowsZNPFK7JYvPL0cxTuF1V

OxOrMQ1+lMybrCMc7GpW9ATnuvRPwzlHR+kiPrGykRzZS7HJ6e0wCZ7xCjX3qxue0QH+IBe5lFF7NAblF6xmYAbHEBRWzqThNLyVE0NjdWwRENbtayAogA1e4wC17nq07E9Ree8cQt7wXaozF7nq/lHd7UutgsNzO23zlUDyS5kAaAvcPSCSgrkOGD276u6GXJtTNfYPyOK8OiF/KqwAMObAjLZLOhcpu36xcMFYx9uyYvG0oNQZQOxIsO7oO07v

HzZuTbOyTjG57vCtzG7WWsbN82ouYA9818qrAfCFjoxlr87joa4u8Mu1x72dQntPLZO28O2LbGe4gAA/eVZ8sR5aWQAA/J/YmpY+n+AxEU/cfWSg8K/p2AdWREWmUlsOVqXw5uBCQUJm/WY3JvrZ0hCMmjV4NCOMNsJezmCgTJCHaLNIEMaABMyxMXvHJZB7yyuNOfTQfm2dB2wYmwjB9luab8fnCsrdOfRwef2XByCU8HzWYwD8H6sTCBCHBBSI

fGjNjOIdmjOmTaDSH9sQCQG6bZA0iKHHZDQ3RIYTQgsVrtW9zXVr8pegvj7ahxQe0V1B7QfYw2ugwdQaTB0YesH2feweionBxqXcHWmdYe2HCRQ4deFThyOOQjrhyU0eHgRDIcHkPhz4x+H+oAEfgBQEJtvsVngT+s77Lc7LvVgdkiwDvg+aKoDEgyAFHXn7okc0CDznuKDSGoJ02PNv8NyW9hNpiNE9uZBmbfJEFBekS7W/7digAfCTh802F+1o

B05W6DgrZAf9t2w0YMqLfu1Mtms/lbQwGkflGFXn+iqYHPUM92pknecpi8FYk7iewQc2Lby5TvTiAPcLXedP2QMi3jAWWapRZUDrQRniGUViBg25tq3lfDcWW3mAAyYSf2gJ1D1v9beRief4QoyCesjQ+fRGmH63Xn2n9UHZFm3hUJ3WQT5kJ1BGZZvm7B34njfeCcUnZ4VSd1EqrgqRYAn9oifALyJ63lon5tjicWdiBNic+8eJxNlnhBJz3lEn

7BySebdu3VwGsncBPBE0nlJ3Sd5r/e3WPFzla3zsj7Auy2NNbda5kDCnJfUydgnLmRCfqn94TCeSgcJzyct5SJwdkCn6Jwye5UYp5mQSn9EdKfd5sp2t0bdoHXT0GAyp+ydqnbJxqdfBXOXEvb7XFf1WMwjANcCMA6kFrBdABw33OyadLbOysYCaJjhMLvFM+h/S1wGm070mQd6B0tAVr9sZlK83BB9AH89cA/UNUFOykmBs1UF7z2x1RtAHS0yW

VDLUO6bKWWBg5fPbTvu5MtTQXQFJCzLyk27k8Y97Hi3Q+7spHtZBxOHcWqmHxyk5fH+B5Jvk7fgyxmp704g4uoAFADe2bJuac2gcGpUbvIWqEDUwTHJ+54ef9M85SiWt7GqqAEXnckled7E98l0MyIoiY1hIHIR7LHBLxMxEdkzPycaeRLB50ecPn7m2ef+r2eq+ctq75xwCb70Z+0exn4bbstDw+y10CHLxy6cvnLly9ctw9dy3aIPLMIRfRRAo

UHlB/b/ix0MIo3kg/PncnytEn/UcKKECJQW8ORRpoPwivM9AQwOfBv8d1PqgPYfEzvM5l4i3lKSLnZ0fPdnBx/y1HHck/2dbDhg1fMTLSO1cdz8sy/Fh+QiWK7kqYYwWVDKtCSl6AzBr8AJdpo2y3gfPDVi1udPT0ef8f+ogaKqADYQ2KkKsXP1BxcyKxWKhCWAvF2GICX46IvBiYy2Mgh5oAOBthA4W2IkCVoqS+kupgmSwgdoYs5o2gEDB6KTQ

XYSON2g/IpVfPAfoc2E9uvY2V+9zGVInPBC/Yc6GFcloPUuTjFIZiAzh0IIGLVfQOHMDRixAsGGbSJLvqOhgwArcpdhC4D1qLjlDJGLgAfA3xLWAdAHwDrXgbws+rhq5KOGlD3Y8wCcCiI+uymGqoW86irXq9E7YjAZHzGrN4bXyFldo4rUHcVxlysmRutnGKMDuLDUl3seDLsl6fMe7ilxfPw7OxS7MjtiyhOdB7YpY+wI06kx2XE8MwW/x3oj6

Hi04HxO9/N3TSe1Jsp7L08QeZAXrgpm4Ew4OAsWEAANwhMCQIPmK8WsIGuK86kGbZxWlBOpA4KCmRSSuLh5+EyKAxsaAHTZZAAGOSA+5mmrLieLNQC+ewpzjfhq4TAx0034TESWoxiN4wDI3Q3ejdDEvUDN01yHN8WSMdBN5tZE3JNyH3k3BhJTfU3n+rTc+xaq4zcvOf4mg7j29jT7wc3ivFzewXxRLTfXJ4UBLIFcrQspa2D1W6Edd2QF/zs1r

/NePsI3N1kLc3tIt9YFY3+t7jeD9Mt6nLE3N9QrcBkFNyABU3pUWrf03mtwJI63rN3reZkBtz7xG3Jsare83LR+zOS7CS9Ls+hXR5kAUAOsEPBEANAHZJNg+/umeQbA6IJTvKF9JRe8W4KLLQbwQKKMAJQiYVrm5QosWse90l3i2e7zl1+2cg7Kg2DsgH1s4cfu7egyccDnL155VvXai8xaB7o4Tbi7wCUHosJKASSqlug4XLFIWXcyd8ebnhB38

e7n60jwAqwO1gGmbJdnXf37ST4LgTH32U2fftRlJPQDT6hFRKfH3SVvfcRqT96nJJjxycfen3Jpu1EX3x4Ot033qACrB33AD5/fP3Bh2USgPiVgGaQPj99A8/3mp/+caFup8PtYeYS87dfqrmGA//3594N2X3RINfeMAt9wg+bJSD9/eCjmm3A/v3iD1FPIPr/bB3IXHMxQOgTcZ7woYYqYFkCpgGGBQCVDaKaFAqOBXOOgXABpKpoptBl79ekUl

F3t54C8YM9qbL3YvDAVbztREBvMD8+sDGR1u/9wwZC047tdnqwz2e2z0O09djLLG8YMz3Vx/sifXC91pH9lVVUNKlLMwTbjnAhqIvFg3YmxDcSbNiN9Rph2wD6Ayb7iOpAKACDrM7s26LF3p+IaJYOSKE8JNwHLQ4BIQC74DTP4hNCYrvIRISzugB3yEuvnEhMNMJPE/KEwnrEwLGSkh7FSu+ujr1NgqAN4S98n+OePykpUdEgkEqZGH6KkznQHG

sE1PtswrltzqW46umkrFxVEJRJ87q9PvoM8/umulgBqZMzrjXguKd2dabkaqqq7uAt+lCC34ABAeW6wPsRACcAK4JWTN7pe+zyNHZSNmSvRhURwCaEZcGC7brCDgCSU9cT3jkrMwW6uqYEJmz4RxwZDb4DHd4vIkRZAFdPoebio6UDaHi/qIGd/PjfOiVzu0+j6sSwyZMATYSLpvMR/TrBB/gKdButoEAgyXgny3PnAb9Y+msvEg4ME0OKC/NWjz

2wfyExT8Y1Rgx1kMQxExyaE+FgkugJ63ErVrE/UvLz4k+s+wRKk/LEGTwURZP9Xmg4wvgJPKxFP3L6U8mBJRAiS96uhC4GJEtT/U8B8jT/EjNPxt2bBtPYBB0/iMKLD0+Rj08oRUDPOnkM/UJH5GM/cGvy6zpTPGukby2AamVWQLP/naAF3PUU817rPU6ps+Ww2z9RV7PBz8XLHP8ZCzHKHBIAkCXPyJFD23PTBjNY8ENzRkdcvw5HvhvPL9h8+8

E62Hw1TRUL1y6AvNfMC8gSoL8ocQvRDuAowv9JHC9eqWA3a8vi7+Gi+IEGLzoA/u4vNeD5u1DmpIkv/xAEy/WI6TakUv1fbk9DkCT6vv0vkxFBpnZFY671D+9bTnwSlOEUPvhHjt5EegX4+8y/hPEbuy8H2Er88/DkBckk9tr8rGk8glC9g3zZPorzaUc+W74m8JP0r/Eiyv8SPK/VPQxEq91PlHYPlNPZTJq+tPofgz7lM+r4gS9PRrzc7Fuvvm

Q1aJFr4KDjP0vja+mv0z/a+zPomeWDTUjnq68rP0z8G9evHBr68AV/r4c/6bHr6c/ivVT+G/Ol/xLkTRvt+LG+UvCb4O/KEyb4JKpv37fj3fP3958TKqAL0C8pHr79iDld/SGwZgj7/aRplvkH5W+IviBMi8vudb7yR/AjbysTNvuL3qXtvIdg2vEvSnz2972VHwO80vAHZIgjv5AXXPy1Uuxw9K14E7xXVgnAMZBEAT+PQCuQk9MMdULQUMI/lQ

IUnCbyOneANMnQeMD8i/pBtMhDzBX6cdyIeGlQMB1UluwGzxgfQgmh5QcC7o9AgWNCbOSXg98AcyXI93Jdj3xx+Y/QHOw7AeqLVx57TuzMqf9XnmxE6vS+zWWBuCrL47Ckq3b28M/Db3CVVZfh5/jyqYFQwT5kAYYGr0s/FEQR84sgA7Xx++dfZsF9L9Cz9AaiCbzNZq1lrc77zuYPnyU7dRHuD31/VEn75JCsPmd7zloXu+6Z8XgyAEOB4gxkJw

DItIx1dShQtuApEnAzWCzJ3ou9CFDo4B9L2g8UPFGtUBiQlGfAtVIyizLThYw/JjCUVyA/wA7F13o/zT93ol9GPVs67tgH8lxAcZfcO6K0I71j6OfBwdj0Rk9lCMKFyXc0PmaELnZZ+2LbgU7HV9PDOqbq1PySYGd4H3sNx8MziXq1oED8gNr9Pc2caeeON9c6aB2sEKAIlzldUvNc6/4yHy7YOeu8oQAJmhDieRsQCrwvZ0rgAfqppuezQ3z/AJ

BNzZEGThMV0sjjfbMwDrPy4+3xv4BO5s3WJvSBCVAFBAiSJeviGnp+qHLGozOAtqsaXuv+BBr/Al/SDoDpklT3iCeEkoBrDc/SpKAHwk8IwisrQwH7a8TdsTEmQvgqVvb9/kZsNeW+kVP9a/MjdP6BuWjKhLePM/LNwars/M2+p5u/izyh80xdH4xXFEwv4KCi/bJOL/MBgRFL8gNMv+A3y/TLLwRK/0Yyr/rEav9vK8Amvyec7dnq24gG/6rw0w

m/XjD4yUgyzkwBW/aqjb9jdvTRZsO/977vjO/rv9R08/fw2SNMGJr6T7PtqjEH/KjkdmH+eM98jFIn0oGWMBBRttwBcYPC7/qdzfy77g/FgUfyXq0/VEPT/x/oJ/9lJ/rjWz9MAHPxms347v5QHeAfP1XJ/E55fn/nPYPxF/Z8aS/VjT7NWX4glAJgrgRX7Q4ZX63jVX7GEVRpB+BRgokVv6XyBpD6/HP6VEbv526U359/P4AD/c7qP3RRi2/cf7

PEdGLT/QkCz/D36f6L353PKD6l6f35W9ZvZGqSSAh/S8hpELOAxrfT7kDBWrZ3H0rzaTACuQHwAaAfgCuQcwb2fXHSnwTHB4hDixweOu570U4AuoK4ACyFzhE8a2qXCOpahAE7zzXQ0jXBFeayIUIB7cUKC+4DHZJQTY5ScW3YhJBL6cpIe7JfcH6j3aqS9tCe5KXQc7OzTyIjtTgCHDH6jg+R3CPxGCAzBWNhxlJGj4/bVJ6TBKIyhU3CxzKnYn

jNAI/LUQ4uHDdTjjS8ZGeL/5HtS5pIdFOzbkf1CSEZMhlPRvpZ6E0BY2XiB+MCTJ0rWP4aMGOIG2Z860A/QiP2Cvr8SdwBHWYlBW8FTovgXX6GjJwhJ/E8jo2SkoR/TICxA5ka8lUo5iHJIG8BWMapA887xkDIEU9LIE0kHIH66VWD5A28aFA0VDFAmIRFkdv4CxVaKxxICSe/OoH26bxq2uEQjX4FoFC2dAjtA2iqdAu/o5pOVy9AjUq97IKifm

ebAg0OMQG0KiiTfV5LzvUuaLvEC6vZZraDA0NycjNv5jjcYEpA9GxTA9wAzAw4hzA4mALA3pDLA/7KrAnTYlA84jlA2/63gHYHVAr/4kkeoEndRoEnApcCkxamK4AS4HOEa4HdAhez3AurKeAL9YGfLO5GfTb4q1EjCpmYyD4ABYBP4VAA4TcDb8DWjDdDPmRTsS9Bj4DmTufXKDhQLjjwQZsR1tURD0Tec5JSCYS6PLlok0Ds4g/aS7GPe67yLM

x6dhVwFT3XYZwHK47EXVHZzLbMAsyIVQrnZZb+UNZa3xKjKpsQnaibJYLrnBr6vFOxCrAWaq2XaIEhXaqYFCA0R1TC1qZAHKCMpVLDOtWqpCyB1rxgK9CVVSKAOtTybWtFkTEiMs7tVYqZdVeqYlDROAdXSyBlCeYD5oSQCT0fgC4AKlC4Tc/jHfF5ARADXDjJNNrpJBQHJ0c0zQoAlJTsL2YFQeiYuoWqjZQcLhwodsFfcAwH5rUfwIQI1BjxRU

GiTQA6qg267PVejamPPs7ag566w/V64eAtRaQhJH6u5UigneDJRDSWdroHeADFrLcDDoUIE/zVYLuPW1gAoIJ6pVcn5WQIIZZVH0GkoBQTOgHQSSgtyZ4gf0rSUHeBq1VNizAKkwdzPGCxQIkTyAIYBUmc0CJg8kAlTYNopgnqq2TRkE8RRmAwQVyBDwXACzAK5ZCPFuw1+UfBihMeLLtaUDhglNDY4cpaCJGSKlnboZTTDVoaVd7hNLSChyRFQG

YRTCLmAnu5iXNs4SXIcG2ApL7qglL4PXce7Q/G3JOzOH6zgq45BOI0GTnJtJwQJ2BDSJY7rgpGhJUeCArnLx4Ognx6k7RaRI+VhbYtI8EGtIg4U/WcQJAnwhjAxhrl7FxruAKAi/PIvQf9RioCFLIhFEFX7NeP9wcnWE65dTPpS1GEgOBPAIqjR3jAg0cblHXgLkdJRpsGGmrEafSEbRdIpBnTlimQxLy2uTk5wnX9rWQwci2Qj8aljI8ynAd6jM

UBdpxQpKCH/dB5hHH4Gn/Jd7/AsC4ziYYG09RIESHO1SuQoZruQ3SHh8LyGeqHyGKnVvb+Q9Vy2nLk7wDceSh9MKGCgOyE8Aj5qczMCHczasD5oHWDYALWAvOXIAFgqa5S5NqCJQUWIP7HjBiyPH5N+dJDusUyrFBcZLyPP1hpKCSzCqLeAKRboCHaFeY24GL63eFUH0Q0H77HJiGagicFCpGH7sQmcH1lEdp1CBcH/VPNoDsCaHLLMjLPHGUCjF

NqAmLCSHyhCOZOgmSH7gxsTegD0HrSAABUs4nAwR7V4AQfkyiu9hlI/IwF0CRTBhmvFncmz0T4n7Xhs/iGvst7zjg1myj4VEH50IxA3UL+h/qlBDu6uBH+hyRFJeuQI0hT42QIjciYAVAFtUHbnlY8IJhGiAXRYj514I5zXusnTxsO06RQAlLHHOhCRAAgMMFGl4XjIoMN6ewY3QAkMJucZOVFh0QgRhpdjnMdqn6QqMOfI6MN7kmMIZYV+Fxh9r

lTkhMMYAxMPph9BEn0dqgphGR1hGEzCYAdMNJhhsORYQzi1+p5ycIbMOae4jHTS3MIfwUkGZ2sFW52Op2ShIS1ShfwMSaGUIFho+VoIwsP/ekYzFhEsMy6UsLDhMsKIUyHWRh+iTVK5TzeeBBDVh9emFheMNX0BMKL6RMJJhcTDJhRsMyIbB1NhtMIKeecKthkfk48tsM+eDsLKYTsK5h10VdhzUO22qF3TBTiUIWJGBHgCwEnokgFyAGGAlyA0M

iCKgPKg/ljIocHmGK0oHRwIQGIYj1EzaHQhlBNtU9AxEh1wJkURCHHEe0/Uy2h+j2B+u0LVBYP1aCvZ1uETGxOhPu3Dqalymg3oEOGMiAESMGw9k2UBmCbln6SdoMHK4NwsWG5z8e8MFFCTuEKQrXxF4JjC081LA50wJUl4AID74kwM1edfQNhvSElsg0BdMgkmMhUHTSaPvGmBEfBnA3UTAC/SFBBqsA06r+DIaTxHI8knVhGjKzbWADVZ+hFWW

gg+WAIAaX8QuUGwoByWZ+izkvaUxAJA4RA0YYHhRsPgB9MzaFA6NTEC20jHtSzkLN6df0T+twOyBTADhWwJTL+jjQOapABmcMWSuAtCIXIv9nhm/vi4BZJ2CQqVmdGLCLH+kughG0CPRAr4in0BJQ2BVNQT+/2UhsLsOsCF+BfapUXy6PjFK6r9hPWd/QBAVAUTWYREX+fvxg+KcNDA3Njqh51i72TDXUMt+i/I8AHfAxUjn23Lk56A3z1sk0Sde

1zVYIgEkZ+8AK3IdABD8KiIgIItxdMAhFyef9k2sOQJgA9Lj/+LNnYOrIyf+Z4lKBXJE/sxYEL+4SPTA8K37M+AE8I1xFnsHpifumaVIROCiZYW0Vyo7LiBI74GMg+aAYIwRDj0vAEMYjR3QaHdUERoIMYanoxmsnfFfwab0nS2kgMAK6mM6siJieEagQ0XxHlYuvweafwF3qDHQqAiGlVgZ0ibAxMG7Gr+h7qDazsIQUIN0OTEU6bZH6QBIAPGt

ZC8YmMPlhrEBoAfiDj8KLEQ+MvEtSBhHwIza2g+y/wlqIbn6Yz9VvsIAU/0WRGfcN4HoIh1mfI5gV+skjT1K6ZE8ACjCPw1dUHI7CVMRSp3esm9n6Bv8MGY5jE8RQCNxGoCIhB4COw6kCOTIeiL0kRDju6iCMzIyCMtKDOlFWi9kwR5sGwRmb2rILzTrIM1m+6xCOJBK5XIR6nTQcNCLoROaQYRziP8QzCNYRxoHYRyJC4RYAW62fCPx6YwMERiS

Mf+IiPmBYiLBWkiPmYTjVTkU7C6ACiLNsSiPjhaSKrejKN7cNCmxAwJRRIuiNMA+iOH+HJ1KBJiIf+omXMRDcMsR0GggapsXsadiKWezK1lIjCM5YriLaYDAPGaHOlfwqHSgUtRCK68rECRU6mCRoSJcU4SMqRNQLgusyO7chVhy6ZBgSRuKNb2ySOi2aSJXAqNyD4r4iyRR7k8aeSIKRWQPBOnqMyipSNRBK4F3qVSMfeNSNzRXMScIDSKaRRTh

aREADaRJ1gMgnSLWgNaN6R/SMGRfxDG6oyMI+4yKORLjDUhuUN8AMyLxc8yMY+WRFMMyyJo0pRwwUtNU2R+VmE8DSHeAhcVdOkvGhGxyKvCZyNqcrXUUMsXhuRhGgeY1dj+IjyOhyKTGtcryLrkViJvR3yO3svyOHSAKJ+WS/wwMoKNmo4KJ8YkKLSBoqFhRcfwRRxRCRR8KL1sLPmN+GKM2sGLGxRhHx5G5jVpAjwLxmnwMH203xP+WD1H2OD24

kQ+mLcACLLcZKJARRCPOI552pRuQNVgdKNgRaiK4CTKNEkLKORKbKO4RRVmXRi6J56OCNTkeCNoIAqLox7azIMIqIeAYqOoRYQFoRNwN7IwnjDRd/Th68qJmsleiQIyqNTkqqJkY/GKreWqNEyT/11RR+H1RYAIr+FJHNgJqLNRuBAtRydjZGTRFURvkI0R3cntRFASdRMCIMRijDKRgRChITaMwU2DgsRC9msRmr1sRr6ODRjiOUx3MMFW7iMme

niNjR90V8RAyACAU/zmgGhlTRYSIMAqVkzRaQJzRJq10kxIMLRfmIjU3hBSRlZDLR6AArRmSOyRtaKzS9aIMhjaJKRIiO8xbaMqR1SMyxFsDqRCjD7Rc7jbM/qCHRh7koIo6NwAXSNoqJ+EnRAyN50s6OuayxAXRVbymRNoDXRSvA3RPUUWR26LjUJ/X3RGyI8YWyOPRIEFPR+yPeAhyN6QJyJvR9rkuRD6NhOtyOfRvOjfRzyMqcX6IlIQfF/Ri

zx/IAGItShhEBRUaJA+2NS/69BAgxfxCgx55xgxMrjgxRMQQxk+lgIM1hQx6KKcImKIwxWTywxiYzQMuGKbhbDz4BbUJl2e+0QAdklrAT+B1gFAF6AxkEqmR31owXFnNMbMk+o/Rm1mwSXrBt6Qv86ISGE40z9Yi8AfgxFDuQFuyni5pkCSa1SUU4gTYwFgOTEcXxxoOx0Meu8P2hDgNS+TgLPmLgKnBp0OnunEPPhZ+yuhBDHSSF/k+UQ0l7E64

K8MgeVBusVRfhll0J+rxROq0TjvQRWhPBVOybA4MV8hxyUtxm1mtxopVOCwVClMJYMmk+MC52s7y+BRGJShJGINOjWxA46FVtxbGIMAq3zaOrUL4cSSy2+iAGwoDAHUg9QGMgaFDRSXFh/0gi3ly/Uz12roE8+H1DYE3YldYzF3BQWcwv8CiAGSV8FksTnwaWp5ii+0Ti2hV1wMeN1zEmd1wOhwyyOh6GTYhJ8MR2HUjiGGbGVxR014wr2hfmq9y

7wz8TdEjFCfh7g0khOy14UXukwAQkABadn3A2DyzKE3QG+A49FUy6vHuWTOHnAn0KdQcHmIYLX3+O60gIgNCk+c5TxlI9uMJq41EPxEsJPxhfSg698mggxDHDBjtUNIWEQ9xhGIQqM32QqvuLH2uD0vxx+JfIQePMGMSwl2oePYe4eMxxkeMXA3wHkAHwCbA/AFrAfrUkBIoFBoOQTkQoxXagHwOLw3rGAyS8BD2HeDkwWYVtwNoOXue1xXmXCxw

2FePEC8UGrx/d2uuw4Prxo4Mh244MPhMuIseMByseCuLiGEqHnuyP0GAnyhfkCWg+BwkM+Y18Knab0OXCUkN0QJGCnxM+K6Ac+PHgC+Lfhy+HkBjZ3qgP8ImoZOQMIWsAdWICz5hu2UMIWhL8QB5mZ2W3E4s/GCvQTuGfxaD2iaxGNm+aUP9hLtw0JBhPQAYuwsMrRw4iDILAJOdyxxIAC6AxYAUAgQHqAzKkQJBpFOAL0KeoA6GsGwSQYmc4SfY

/EPSS80LpQAbCJ4fyAUizsEt2ZBPLxkX0oJ28wyM1EL7utEJFxdePuqDBJMe4By1Bx0NbxljwuOI5ziG7Im7x1iGdg3YhygloJRgswQE2csg6E9xTEJDwwnxJGCXxK+JqqdUzEUChK3xShKbEfeD+hhsDayhhAwwIEBfAOhPa60xIMIsxMSA8xLvxJ5hkcDtQsJjQBfxETSLmBM29hDt19haC3P+41CWJKxLAAaxPTu9cxQuYeLz84BOZB1YHwA9

QEkAFAAWAyADiuQjw8e8dBI2X1BFUf32LwGlXdYoxR7iBpH8Wcg3CArS3fQz8jUwtiELCLS29Es7D6EwsjOuol2bac00o2A9x3hI4LtmY4LKJzeIUmx8KqJqlw7xoUE42d2lfSDxymCboFce0lRBuo+LMWdGWkh2+OP8FtXRgZP2ASw9k9U3gCr6DdBwA1jH8aqsAMIoqH2kYI38EjAH6YrBCaENIDDA2zF58ymMOUgLiqQe+Fk+TgAJWaEmpihc

mM2fiHhIgXXlhdXkgIWhkW6Y3XO6Fh0NGX5HVu3Nhv65Iyn2j614C+BHmx/ozTWXLm+AG6lDhr0RjhejEQU6yMdJ51kV0MLnlYosPWRlTyhALCP3MZtlqRc7iyBqcC2RngBr0kxGt4buh0x9qWtWEfEhcZqnixMpMWRmIF5YwnkhRsqLtJqsG020SNzRBvC18kmONe/WUJRE1G5JZ3W8QDTGMOgpPNgwpJrIho3FJkpKpKlJFlJS6IVJBcCVJapT

E+gAXVJsEj3USfAdWupLvwWBh509+mNJSo14IZpLBGFpPpu+0Tt0SmLtJGkIdJzkI0hOI3dGLpLdJsMIDGvEE2eLZPxcPpK3JdqkqeAZLTSYcODJiulDJ3gD9UkZLw+G0RjJ+VjjJyumbeSZN4RumPRWaZO7ckBHVQWZKWxuZJTIYBFiY561mco/F0atLGE6wqMrJwCDwx/rAqgymAGSMszg8VhO+BPsJ9xZ/3ShLt1rJvJNDo8zQFJ3iBbJopIw

A7ZNca0pPFJcpNdSMqL2i1jTnWA5NVJVtG8wscK1JOK0PUk5Plc05KNJXXyFYKARyOdBGSEYLgBWK5KPGoaPXJdqk3J6kLyhro2fWe5PtiB5JjhhhG9J2yPPJCaP9JFr2vJr0VvJu+HvJ4ZI6xUZIMhr5LgGSEg/JiZMkMWACC206zVUMnX/JXiIfEUzDmRIFMAk4FMLJkFIYM0FMDi0vGgB7SMjhCFNRxa309KrcP/WjMAgAqgCyArkCfwh+3C0

wRN+2YsyaAaUE9ARkT5UgJPDKRSxh8wm1P8cg2v4SB0YwHzFaw8JNECejj3gi7SggIqk3hQP1n8tlQYhe8J0GaXwUuk4NYJWX3YJ50PKmuUEOGIoS5U9/mnawxS1x53ECqSTiJ23j1fhoxL+kpEzuKv0JM+nWEPuHywMxzpRlJK1kZW6K1tGAK3/E+Vl6QN1kpIh6JSeXz08IWEDuYxThcI8zVzQtBj8QD4FRmJBE8IBAz+AtRBusAQCs215JoA/

AD9UGyTNK1AGI+0HQSKJBCV+ydiYaPJLQ6mAQbJxFMwC+MR7RysNKIgM0PEyADVJrFJPIrGizRucVyauwOAR7a1UYhQNwIeIE8A10WbQtZC8R65Hc2LtGQSxBmcRclMxAWXDux5Hk/asvAzA4NP30bJDmYnMBpqLCT8KrBDoAYAGrRABGSOQxE0IWagyiadlfWBBXP6L5wt0+5OlhoZObk8qzsx2GMWp5xH/EM61RGaNLMITZKJi21O2xR6L2pB1

PlYR1LGxpjG4CONgYsgMyupN1PEY65Eep79RepSrx8I0rhxAEbxQM/WR+psAL+pQfDrJQNKIpGjW3JuaM0kxdmlIgMxT+LFLQk8NNHJpUQbq2f1Rp6q3SeSTyxp3MNxpf0yEx0RGbQRNOX2I6mN4ZNK64lNNoILfFpp/ZnppuHWGITNNcCrDVZpMvBkAnNOJetUM1J/NOg6mazXWItJBh7pPBhEtMQpemlW84PleQr8UXCBGJ527+JsJn+Jwp9hI

v+0tMTGstP+GNlOm2StI2pyZHvqO1LUpjAH2pAdB1pjTz1pZ1MNpl1JVg11Ma6d1Ms26yMQwltKvC1tI+pzsWL0DtN868rHWRANNTgbtP5JHtNkpPbkJsvtNRm/tOHJcrgRpOIORpKNnDpAJRBKUdOxpcKw/R0Jz4aCdOwASdNiYCQFJp50nJpK0AzpdZCzpwJRzpQah86KhjJGLNLHyrjXZpZdO5pF+FY0VdOMYNdOFp0KNFpilPFp4sMlp1xPp

B63xCpZQmkJYAFnx6+JauQUEwO0ik3gSmDCMO7WLwAImzm4RjoW1wBJ+WYRUcd/gXa93FuwbEwfow0OVQZZ1UUNAn4QlVMxJtBOxJ9BNxJjBPxJzBNYh3u2JJw5zPhcQ2co0rS0uQVCSwhPH7K7Rlu0irVK+lXwiqsYUEWvG26J5iwNx4QJf4GUF3x38OPBZtAcuc0mcu4aHVw/DIESymFg8DAhE4uiiSoXyEnaGwBYAwV3JqBaCLQ4VzLQc+ErQ

0ePoAsePjxXSSOwsOBSu8OHSuZ6EyuE6Du0QNzHiTGFxwl6A+4jHFImCEHSEs6H+wkTMqu0TPZ4laE4AUBJgJcBL9ayTOhYzaDSZiOAyZ12BKCimlCkooS9YuEB6AnTNRCnFGRU0ZV+w4TPpwTVyx4DV3/QEzM7ALVxZwcGBZ4XVx6uguGFwA1ynElDPm0/RNXxQxPnxTOFJxiHjYuS7TECish6K/whGAnDNW8qQV4ZpZxOAMNCTKaKkeQHwJlkL

zBXg3FAKwiwDLCpGzRJyg1mKsjNrxdBOKJijNKJkP3KJLeLUZbBOqJmjPdA3Ul0ZcqFdycNBv8N3Cc4O7XXBCNEfgoxRE2z8JGptjIx8gsB3xYgS3CikKNSrjP6woaHDQsNDuZAKhHYJYJaARlSyubzJ3AnzLCZ1Vwqum2BiZ1YDiZCTITxiVxhwzTNSu52DaZXaGuwwiUJgU1XvQz9CIY+TKUU7eGBuErO3AZV3KZF4Iiu7LMyAvhP8JkgECJUO

F5ZcOFbQgrKuwLCwzqD7BiUMG3YEF6EkwL4PNwpElGZ1V3GZgGGA4UzLAwMzNIurV1ZwizL5w3VwFwjl1WZc+B6wGzMZg3kG+AQ8FmARAGQAOzPHgwszFk7Fk44W7BoEHzGCSYRgGEh9CCZJgMHilUmGhOlTFZAGUgotFBygX1CWAvOPvYMX0KSxSRsBixVqp4uP3hTBIpUFRPBZLVMhZpJKeU9RIlMJ8BdQMKCGkiQXXBrrHNwNUEu41jKZJu9x

ZJwYnMU7oKUhccx3QZFLp2fMIQx+4CZ2vCVjoUC27ZQwDAy4yjUKbGBq29t3wi2FLsJQu2a207Ilg7iyAJUZzRx3xmvg/ANCpvCnnQmAHDA8gDkgezHghtFFfiBOGFk/PGLwgwC5xPyhRU76CCiRbUfoAIlRwSrRUslbV7orrAPocYARM073raMjJ6WcjLLZe0IbxEuOYh6XyapmX3OOJJMB8swDLuPEK+u/aHmCTsFMZUwXfi64KGKjZzagocyx

Z4+JxZo5U2Jr1BySHJL3aw9inJAfjbIPIFYpmv2gaDfVvGrkOiI6AD8Ir5EIU9xD0YlBHkAEAA/GctlSmUxHZcolORWIamz0vHPOkmxF4gs9gyeWvR6BghgNAgREWih4g1g6BhJIi1HoAeIGxmijCx6q/V+iCICN4n+Aye8zk1sBhA/wmHX+hIIw9MZnLNUYxHm6O3SyhXBgvpShCoa4YB1gy3E8a/SE85vSGAeXJCJKjHJwM+AKRRotRRI7HIAJ

mkK2YxRDk5oqH45RTiE5InNXRu9XE51WKk5+MNF4snOPqCnJ6xynLgGqnMX06nN66EfUcYMZF054EH05hnIdJqzGx6pnN0kFnISAVnNGsNnIDQdZHs5KCIUIRehc5afVv6uiLrJ9xG85vnOMg/nM14rtOTIwXObpJWxUqEsQlilxXt8a7LtuRM03ZthL9hO7IyhxIDC5hpL/+iCFY5kuhi5vkLi53HMS5ZqDXcs9lS5onIy5RchrR2XMzhuXIS5+

XOR6hXOQClkIvwlujK54fRDIlXNmI1XPtgtXJS6RnIa5JnPIMZnL4alnIjoRTls5XXIc5vXPD4/XMn0RnVKOnnJG5RMR85fnPOaAXKm5qsBm5gVJAJFFlPZGOIzBEbVrAWsCKqRADCAwZQHhHhiGUyihdQXDP/0QKkf4bQjeYDtQRgN6FTZ1uFuZJQQ1wdxQ44HcUKC9yGIm7vTF5PrAFxBSWpMtJjohsHLFx8HMrZyjOrZYLI38ELLQ5u/iaK/l

VBoD6RXuZwwTqj0JvQeuC44dw0+OEhMUJeLNxgC2D0gdHLKUhsHl4MAEnZ7XXt5s7IzmUNBCAtC3bBbYNSw7uL2JzVBW5R/0OJ63L7p27NbGVc2d5LhM4cNxOPZw3GJ5nhIEBjMGMgOsFwA4YFAIQbPvZywCE4/lju0mP16EFHCmm3G1FCplVnmMoGniQbGTosRhYwlxSSkqlj6AYxzxCvuFS0UHMB4MHJqpcHJKJGoKbxKjOQ5RJLV5GjNJJvcy

w5C91eQKwjaggkNCiVoL3onoFUmvhh3BkN2dB/GBo51vOcZ9HNisu3JuxjZOr6bjSXUmPXKh0HT8KqZAgAy1ibqwqy8OaEl3qCkBYOo2M/wjCQe5aqnaYEPMaa7gB0AcrjTWu6n50e7LcWfqh5IzaGjUDAEORRDkC5onyKxpCKFR1bwvYMRFXq8ficYxpSe5PHMvkvzy35HvFn01RzMAtBGEkGsC5pSDjoIsJVgAkoAJAdlKT6H+GrJO3O4pTHLs

RG/LY5pzVi5KY1QZB/KP5rjRQFZ/NKal/JrRN/LVWYlMXGCPL4aOkOf5J5Ff5LGn0IH/Jva3JH8QP/JwAF6MheLtIIpgiNZGIArWpYAtTgJ5CoUtTGgBP6jy59qkQIMXK68jAvpms6kwFch2oMtGjwF2AAIFO62bp0YVkhaUFCoV/DuABGP95SUI3ZXaTiaX+LIxWVDX5DyIoFR3KoFJ3JoFHpgj4h/L1srBEYFLfWYFxh1YFBiWXJ0nMJYD/PSy

qzAMAfAufWb/MRRM7K/5ogvERf/NOcspEAFMgsb6cgrRp2EkUFC9mUF0Avr0Z3PgFJzW35JdPNgOgrQFlzR9eKnwN0hgtwFk5FMFVKzpBvAJPZHR3ahjaHUgLAFyAuQFTAJCHLuJ0GO8LcUCeGSgUBwoIGE2SUL5MEEKQG1RygUKkySepC/2wkBNCTfNLZrfPl57fMbxB8OV5hJMqJvfNPhpJL/C+XyOKBDBJ+wYhoEyLPFCZjKcGYNDjAEQ1n5v

jzGJQ7No5y/Nt5PtCfwmL1UFnnLocRfTz2jzy4FKIxmsrnK8QVCUXpqckGgZ0QgAvZl2BhBA/woHRRIPgEkAt+nFJl9yqIu9SbAdZP+Ft4xOwcvEfeF+AMI+aDl4NtOmIIYCxpXMEukmsDU5XyMRRmJVWRZDxgABXNnsZmKNR4Xixht+GE5F+HtAl8l4MJvRJ6qcFS6scRue+pXhxr+DHpgNlKsJpI/GRMSK585INA6MNjp1rmQ0iK25sinMAwu9

W+FE/0BIngtZGyxIKy+BBqE6AA+A+5lSsKrlhGYIy6BUIJvaxQL5wYI1bqtpI14N43+ydlKz0hzyA+WniBsaq1yI51NkaQpxiFsT2nqlzl3wBhBsEyKF2cl2D9A1ItMgxFNxF/2RDFRkN0k5ckWR7ZF6aGjHlFRzxtUAcX8Q89RQ6sXONAFAE8INBF3wN1lxhOTFRmu9VjFGjVVg2kMzA5ALDFXADBWWQChB64w35mAULFxYueIogCWYf4n50wIu

YIqrmkaBiLBmNov6YS9LjF3RCDIMXNsCaki8OMiJfqnMGM2tdV5K7OV8xYgoyFkguyF3AJ6+2oueIS1hxFfmMBFYMUDFetjBFpsAhF7LnvEbwBhF/THhF7wERFL7RRFaIpvIuYExFn9mxFVfXjFomXxFhfyJFJIrCmCjCfwFIv+ARAGpFtFlK5dIoQxDItKO7gBZFRTjZF0iLQMUW3r03It0arq1DRs+gFFzjGcJP/wLsYotfqmGMlFmnUP5So1l

FLXPRhKAUVFsxGVFJPWE8KIu4A92M/se4tUF19NfsRWINFImSNFXgFNF1IotFj4utFToFtFGZEfFlZHBC2yN35f5PdFfTyjR3oqxufov2Rp4pUAwYrwChhHDFjwEjFfWGjFqVmrF7EtZGiYsMMW8lTFcbz8Qcv3e5WYp/IuYsH+Lop/FsIy7Fj9OYOugB1JLsWe67YuTIdYrpm/iEbFCgGBKLYqdAbYpBpvAU7FJYtSs3jCBFp4qHF8jBHFaDnD5

RMTYlMAsXSJ+BnFamTnFMBHLIhEuXF6ClXFPmIs2G4okFAAtx5O4o8WQVC1OwMnsF1hO9xG3JOJuFNweLEt4IfwqPFP/nClzXP4I0z2/aF4oi6V4s0kN4qgAsIuz+CIv4+yIvHWuQlfFbdA/IWIsPFrI1/FhIoekAErJFwEvE6oEvAltIt4I0ErtKsEuZFr3NZF0v3ZFKEq5FaXNfaEWKwlWxEFFuEv6lbAXFFKZPEpy9hlFW9PlFVEswASov/pn

fFlIDEo1F/cmYlPwo7Ieosb6nEoBA3EpNFZov9U0zwEld/THFdotEl9JHElNksyiboseaxr2Lcckt9FrTUUlLUvJBGvFUlYYvfgmkuwkQMt0lq0sb6BkqQCa7mMlAJFMlR73RhFkpzFKsDzFEkqKxwUu7FRMXLFzkrMMn9nxlvSA8lDYtTATYt8lrYsUY8Uo7FdkpClvYual5nJ0kW9WilsqLHFcUs8F2RHDcyUq4CqUu9+4oui2zXRylyxDyl//

KyFhUvaFLUOJksfPuJpPMZgyvFrAxYC1gxIF7gXBJJxHkliMfMlVyYoWToEs2CScSjtw/hiGZH1ASJx0EdqFFxPg723SJZePx2WRPygVBP++vd3/2BRJ2hcvJxJsiw75ewo+8NbNV5dbPV5XkVmAEJm4JruXCA5FC+YhlzOGgoJMuuP0XmzwuZJrwsX5kxM/EBdM5eCIF8A9kPLl7wFChlRBtAkUJECGxLMJT+J2JGFK9xWFKql3yRql3EgrlpJC

rlogBDx7hIoZZ7NsuZQlUAyvHoA9ICfwqgF7g8ENAE4PlzmzFAuCpzPmu5OLWC4rK5UeeJL5aSHGkFfIfmluzjAuin7Kksixao/NDleRNDwVgLrCsvK2F0coh2wLIapUP275hwqTlffPQ5niUH5yP38kxOCTAL0DoEblkoyVHE2hq53j2O93N59jOEwuczLl7iCfw6ICUMSq05eDriJA+7P6YBhEvxYAVZGjqJP6m6y6AAAHJNbrdIUhat1MolON

eAsiCYZYysLGv/VDXMcl4FbtTeVo/T2XIRY0FYYRMFdrDG+jgrSjngrCFb2ZiFWwrTDuQqNIZQrYuaXomorQrc1sVLWABYL9wTVB4pBF9pYuVLMKUcSt2ZtzQ+ehUGFWfSkFTWjWFZ/z2FS5jOFbeNuFdiVeFUQrWyYIr2DsIq7VKIqTueIroYpIrdZc3CzlAbLvmg8SpuPNoaANUIVdhABsKC5JgiVFAU0MazKqpRwaxjzJ27vwhlNMLJ+pvMK0

EEnUCTI9Rn2AWEV5hlAglfewK+XziYvkLjTZliSo5QoyY5bsKq2fHKVeQO0VLh/KNefPL05f9Vt6LNVUTAlp2yuuDugA+wVLCby1zmbyxqU1hEwApZT/GoS00YqN++r6SVYMck+lR3UO+npjeAvqFNZrfxXqEvBL0Af9PYQcTHBSgtbjBXMNFc1sRlWaMyjjJTaiMPKecsFSx5dNSPFYzBcgOPQiAERotYF4DhhexdQieiYQbqtDilidBX+M+gWJ

uPEZHLErLhEagN4H35PqAY4rvhtDwykMVVHmDRSwju1Jeb8zoOf8z5GYCyClQhzDoV3yE5aUqhzscL0OYd8m2euApBnGFk6mcNEwsJCv2bnjMWWPj3oY6DDcTJChYDI4nvqOyqdjyRZsUALBlYtFzpNONRbJRpvAKX0raBKRQxUAyk6UwqxVuaTryEARjQPPSMAEnYffj0RlPCfhgCENiRsaN1QYQsCwVqH9OAd4hfMdhinEcbxOWH+LS+m9KKkY

wBIkRWpp+EGptPqmkGVciMMVs0L4covYMMBhg0CH9L8AM7R49E0ItEEQEZAOCiZRumRa3ABUa5e4hqVUE0JkUui6Vae1yFTOMoQKwQGmGIR2VYYROVXQYlVquVbAHyqG/nPStacKr/SDm5xVaHCx0blQpmjKqDYXKqOAQ5jFVRZtlVZFj1VYd08rIQBzURXVMSERoi9JusqEgGqmVfGoFunjU+MRaqrVX9kbVY3Q7VezxHVWABnVXmNXVaa53VeO

9EICsKQVWWFdiQPtlFZ3LVFd3LVlUadx9l6rAMD6qtlSui/ERH1a1SiMg1ayrQ1Y+QOVY+cuVVGqKbDGrHMQKqE1bz1hSEp4gyBKqRdFKqM1VPw6ANmr7MfyR9MUWiiHIWqZpcWr1RVqqdVRQ0bePqqZ9jWrrRnWqjBen1G1csRm1TMTDRe2rU4PaqYLBU5u1dTF3nP2qj9LrASBuLstttHyYUq4r8Fl4SICcgAEzoqB3wAJFJruGyNdowzKqj2C

POHCSkwkMAz4P0lFrsvdKOAGJuxDB4vWKKz5cmkYZZNsBiJOVSyqaVTu7udcw5SmJm+ZCq8ldCrH5bHKilYfEDhbWzUOeUqU5dfEqlQ2JiGBkhiJhcVbhTTx1lq/RXuAyTTeaNSSVa/5a/N6B1oWoTsqFBIWPBfU4mHcwEQJU5/RgBotYQYRQXNRV+mEn8OnBOoreDbDzAA78pmJSC2SG2RP2t6Av/rE82UdQ9EpSUwUmAxL0FMgAXTGQ1kRfbYP

nHqTQHEixIta14uXLOIS9Dp1bXh5rHnCGpZDCvtKCLABNiLxydJEbxlOqGKKyEeN+mPvZwnv4gaXEbx4OFAAq3gpBr5AYR7pPzoatSoYlwN2qWEjk1y/ghcK9rAQUSCMxZIHz95eMcQDCNT4Q/KgDHzugC9fkJB8RnL8oASnYpDoERu/tOt77PYrSGefiSqKZq0YuZri3lcjrNcJ5bNVR57Nf05HNQpiPaIkRXNXi9K4Zlr7GOdrc0gvZfNWAR/N

aVFAtUk8r+kGQvYL4QxomBootWLVNJLFr0ElxT2YdjSODBfJjEh4iQUai9yFOXYmjoB98tWXBCtWAKStWa4yCOVrpbPSRYmG1quwEuAGtSw5DCC1rqXLpI6tZ1rBmjU5K1Jec+tWu9BteA0oJCNqvJeNrKyJNrtfhV0ZtbJBUulX90yN5Djsitq0UdJJ1tYhTjzBfBRlNxq5ZEoqvYUsrZSisrBdmsrtufbYzNccRM1JZqrXHRK5tkyQ7NQ5qAKk

5rbgS5qm6qijVfp5qugbcD4aZBjntQGlXtdXU+noRVJnKFqB6nlYItX9r6EgDqoJHFrgdY7CUAGDq2Pqw0QMfc5odf+5/yuPwdYqrA8tZtL/CIOLdJCjrinGjq/sRjqqtUTratbjqgBY1rKbM1rzxPHr2tdro/VF+qM1D1rjxFTrJdDTrhtTiAGdcr4mdczCWdTsiO/hzqFtQZD0irzre+sowBdQTyR5X3RMNX+tx5fNoBkaoBvgKoBxrpcrrZWr

g54MxqSNsINF4Nd8DrnX524jBs+pDvKPOEsKJ5kZVuOMRDZMF8zcieiTxLg5pI5ffL8lWJrClUrzilVJrE5TJrkVRryukmirUYHvB5rm8wNcVSSJ2F7MiTK0rwFfV89NcqFEtJSJYFW193dZFrekCuV/PI3xU9fEAsJqOji0AsTxqIt9GfN/rkyL/rSNAAaYAEAafrL1AjCXOz8MctyJdWtynBagse5QPSwDV/rvENAaHdLAb4DbxBEDbsr4lhhq

uhe4rBHCktvJlkB+gCNVuIcESZhBJYyJpBBHkLIprvu1AMISZEyJgjAT4FFI+ik0B5gJLMKtlmymoDWdHZcvBeNVNUwVGCqaIZvrcldvrRNS7tFeSCyCSbDs35cfr28ehypUufqQkjotW2Y/EE6JRkv4UpoJvn2z12pAq7EEmBREiOy1CeAaaiJAbg9YRUd8KUcDCMSAJQHAbiQMAaSDT197DaDqf9c4aT+m4aPDUQaQDd/ooVGWdd4KMogDKuy0

Dcgspdc9kZdbOqFvrgaAjbfgXDdiVgjWN1QjT4bIzm4S9lbpA29VUUyhFkB80CawMMPFAx2lcrwuGcFbsJMc0oLilgoM70qoGopkSaRMljpEYTcPJhuEHdQRlJBBl9TpAs5jGh0cOWFywpRD+NVfLBNZsLvav0tO2jsLYVZ3z9heobpNWUqT9SnL8MmcLDpg1hvsN2Ip2m2J1ocJCaBDxQ4wkXKB2a/q7/FegP9UQln1fFwmwBhh7tUvsWmOow5f

muoE+Hw1jdGhJA1rq8mfAN9+CKfzQmJACFfoxVpCArT5YcU1eAjyUMEbRTVVea8qSDol4tSDqPdTBKBSCIKisXJA7ja41btdml3UkgleaTwBeAndZdxtitPCO0hSxVzFURWnp9zLzowvLCMYhOv0O3uM580uu93qdAh3DoMrnNbONWRtVC4TtWSeSKyN0Tfcan/j8N8WN/S7iG8boYh8aAgF8af3nq9NXn8b0ZgCbOdazD39CtSVSeCaNIZCaX1X

RSwPnCavAAibcDciaMiKib+TRib4kX7qHjUgkTxJgFCTTwBiTaSa8msNKY9U9raKrSa/GPSbVPoyaQtcyadCIfTZReyaddZybmTsQa7ToLEUIieYRhKMbywuLrFlegbllYkbDTv7jmtnybG+gKaHjZ2NzfhmLXjfjSVMUfgpTUusZTT8bXXsCR/jdswlTfbCVTaCb6PKMq7VJqbQ0dqaRnh+RaEvqba4Uib1pSiaLyGibTTS4cHftib50se82Svi

aNITaapCFjYSTfxAyTc+LKTf9iuttTC6TQS9fsUCCbdd6abaYIFxlRpCOTUqqgzUFDQzWQyOhTHyKDdhrHiZkBJ6FkAwgDrBFQECY0zgPrjgM2C4TExdL9cy0XWMddazjGIhoUJRbBUW0ZsJlAFLArk46oWFmwZzJeKC/BUSWvqfmXIarqsJrFDZbMK2fVSpcY9dX5SsakVVoaNeQcVz9SWE3tPcUlUnfCFzuMEVLD2JTjZYb28MCgVzmoSFIIyr

oYvmgWValYTUkh0MEQIjzYEZixPgNzrmO9ZBrEKiBOQLo//HxiuTcGaaoYkRuXGRbjVUkQt1bKLe1PmgqYEDKaLRT0ZOc9yUedlDTdOpTbaOZ1e1HRaNUQxaK6BDM+YYJazoA+EqLZrAFDocRVLZeiGLTqimLcjz3pq6lW1mtSV1OZ0+9DxbtzYXETTKU1yLZ/hjICJbaiGJaJLeBKDLTmQZLXAK5LRB01zbJTlLWq9xlXjyNLYLroNmrMrkC6ho

zeuzYzQkbsHvN9xqNpamopRafANRafLRZtOUWmakXsxaLLXf0rLe2sbLXOpuLVuaLIY5aBLQBroYm5aw1Z5a5oJJasrWoLZLcf0RgTlC3Dkpbw1Cpb7umpaczTjInFehrW9Qea24bndscV0BkAPwBXJiawhHnpc4khopZKmMFVNPdRiJGYTZcuD4AxNWDZ4O9oQpDCgjBHhsdFIAZNlkFIivs2cJjevrulkJrt4SJroLQrzYLahlFFj3z35WsafK

rMA1droaOLkFVF4m2Jded2U2RB7lFgO8dzDR9CX9QlFtwIjQgnvvjDYLRZ0yJeIyNFEj5RaowcrfKdQOuUR6LQ+qxiAajwAeA0xiHswipvG9jnq05F0Tp1K0bwBRUEbZYmJSVvhoKMr1eOjhmvRS1AIxSHtWyQEbPdEXAuM00jbDri9guKUkfIRukYOR3gE1ZmKkoZ3Lfy8e+D1bcoejaUDAdy0JFzqEyAlY77h6qNlOcRYbWGpzzgjbYmEjaAzk

80crfL49nDtKkJTjaACG2tV/m2oGPFPSSbTQ5ybccRKbQJ0abblQ6bYqTGbXK4WbdzY2bZfUoDRE8A9XDr2Og3w+bbzatMhBVhbWGr8CGLagrZLbzfvro4SCzd/EPLaAzE3KdSD/xonHDBEIEhBYwHFbVufEaSZtLqEzYH1WlMrakJHDaXzurbTeGjbkbdra0bbrbMbeZiflrjbjbYH9TbYuqz6tmKybWg4KbRqUqbR0jhsbTaT6jXpHbVUgTyC7

a+EWyR3bU4aG9GbwPoi+AfbbzbRsYQRBbY08heiLbFGKHb5seHaWOTLbo7YlYFbc3qCjZt5hrZXEcNVkBIgO+B6gFrAEgKJUiwaTieMD+kPuJWdYaGPMMlM70JYnBBsWuRQtHPcgkfPNgwOa9R14eTit6OkFDaPEkYvkJMt9TMa7AeWwThNgJtBpcI4VUsavdnyZz9QDaYoE5wH4lj8PsKrMOlULBhMEqhuoNYzTJv2yFwDbzrJqpcQqWEN10OVV

ugMnQiqsSJ5AMkN5EOgA3JmCFnWqgA4oOgAh/KmdNlq4Y8QOyJr8FFMuRDFN7BHFNMgElMwAMABUwGjasgLcCspjswIhMlMxHb1aM4LEIVYAABqaR0+CdK3VFQqYdVQCHqiDXlaiKqYmtb0HrYOqbFDECFHmxADhESei1gCgB+Eo/BCPYrBgCPXC7wZ+CnMv/gvbS4BKaGPZBgG5nxQE7iGCYYQUidGAyya4C6KBo3aPFeHjG75l/7KY13y0B3ls

261uOVQ3wqkpVnHVY3IWlOW1iBTU9sWRBPYaBZUkuYAdsx6GaaVNCKIYakUciBUYOuWQk/TsGEOwBYTUWW7mdZ8R9c5u0KML+k5W/fTJwhAWiovW3l/I1EokQQgISFVTq8DAyS9YmxT1EJjqC1lZ+Yju2Sq8dHF28NFa6XpCRdMaXdqmLHE+b7HYSHQCHECt4VUQX7Z0lp2FgFt6z2HbkUmliDoijCBVETS3tdQm4NO0W6I85p1W28W0CY9p1EOT

p3SY7p1SIiAF9OgQgDO4s0a8DnQjO/QiAWCZ1xxO7rTOu22dklWGgMtABsGRZ1vij8gd2n3VluDZ0U9bZ0+8GmlwM/Z04vUv7HOl8WZEc53wu5unzzD5hY4EyJGRfxaoGmM2Z24C7VS7A1ZUep3hqRp13O0m0tOxG1o2550aCqghvOqu29O6oXfOvhqCgP51luAF1T1eLn+WyZ2gu221pqiF1KSKF0LO5MhLOi52rOmXy2vZF1bOyHp/2eTq0OYM

ZYuo53DSuYh4u5Z3W+Q9mgUPc3kGjb7gQ3hQsAHWBpDOTGoAKVKIEiiTRoVg0QoSaRmKVTQTzASwfMriYvoH1iRGCYRBKps5xGTu6QULhavUHSJe8k0I5E5eLnWv+DZK6Y1Kgh+XKGu63OA1RlH61J3w/OIbl+b+Xws40LdDREwdlHHzCQkYQccQRYEWip2pKGkSqEj4UE+L3ynoilj/wqZ7yrJPS29DDTEo6Mgwfe+QxBAmD+RVknH+EZIUu+K1

Uu34E0urbnj7WcR1u1t2UYxt3XEnBY/rIo2cPEjAfAW5Z2SGqpyQC1i08474fcbObCqVO0Tzec44QfpK3pAKz/6doxPJItoZQDPnCWGHyp0QJ1rUGs4YWnz4G0Ch3UEiOUKG2J1t8oFnia/fWSa5Y1pupC0Zu2CFa8vS4NnPJ3MCHOW/W0eJ/pIan2golXtKkG2byhCD+LNQmukzAaifI+qpWEkVFTHREn9fkmwKeamyokREJ2deSE2nbE1ojUZ6

0pMW4eren28k6lwa8oEEgD9X1kNdXMEDdX8yxe3niwuncuT8BruLAboepIgb8w00G6NHmvkBt7AM8ghQSXvqP1BlFn9OEF6o2kFRpV7pm9Pj2YepEUExUo5UexeyNY91KGESrVbY18Qa09lzkesCQyEOFZS1PfRQg2j2ejDPb3RMLGIjFy16UllVsesNUcejpxcereS8eipg6SgT1tmjznDckT3SfMT2oDajpVNYz2SS4zHiIjUjXJQGhLwOTAvI

OL2jFBKGxGyl1VrYd1YG0d24PFD15q5T1G2l9oQjDT12Wpn6Ee3T1q0/T27Uwz3HEKT3Y1Uz3Ueiz2P1Kz017Gz2f/Zj0Oe4NW+Idj1p9eHL8Wz+zce8uQeeiqhee4imCes+p+erIiieomlBeyT0UenwWyekzHye3c16yonl72jvWMwW5akLCgBDwJsCGg4InomG7ByICJK2sCASqaC92zwVfDEUMIy6zdSoHXbt2XAXa7BumuBcLCwlSYMSHCqL

MpUQmN2Y0Y2bC4kB0JunfVJuhJ3Py0FmH6xFXuAtqlTLWYDCRbN2FfdLQaRfN1KpETg+WCeaCwBcJlu+D3G4xkQ0kylUAnQID8Qbr6ba9jLY+y+krfUUpKYIJUJOW/wJBWEwdynumVS4PnqK5I3jUbxjtIXH3GujO6E8wz5x8/e1mOkAALAIgA6wcMC9AVXb2ujd20YDOryYN7jRVZTUTBHCBiYeSIsyJ9hyWN/Y88nx1QoCsFowPFpJSe+BcUEP

YQcr7AbCmJ0/epQ25iL92JO2B1QHR62aGgD1+VTJ1ChDqCg0a7Yg1J45w+CCAc8+EKx7PXHYs8p2o+ydppaCaFqEy/6+IbZplHQ3VDepdUdWqEWOm4TxlCgl7qZJ9r9ILEBM+xF7mm5LyOjHAXZQoK21EXW09Im41Cm5BIHa9/rqC5hEba+nb++yRVB+yZj16VSGDK+8QR+/P2yWykp0woIgJ+/lU9m/lh389zkggxS3h2rP1FYnP1HEPP2GGAv2

abQl1P0AYAkuqYbkupL2DulL3HEtL2y6sd10GQP1iHYP0+ejv3bK2gzkm60m1+/y31+5Yjx+nH2J+lv3J+kP2jA5dVd+46n4etM1O6/v3C6WS2F+ga1BUwo1Lew5VUGk05EATJaS8ceiCzB11bzeOiOsSng3+JXJTHCIDncbHCKYLjhZhJ3AxSBOhL3D3K9iJKTbXQ2g4mTJCr66N1gW/InyGlvnvu7YWfuvfUm+g/W/u4H0cQ0H3nwqo2Q+mLT2

cFuwFQNsSXmLH4KK+KQu1IG3EquxknVY0gDzWw2Q29jJjm/MWaE8/hAylSHOHdP1qSVUhxcxXhmmlv1Cc05qR+wf0ykJhX0ETQhcBr/Q9fLWAKB0MWM+1dGKNSv2d+3W35QtF3dmrLXmwdjlSB2/2GHWQMMEFQOC6msHyIcYqZIHJIDujO3T+tRUjuuf24PZQP2mngPSk6kX8Btq2CB8O06ByBp6BuZgGByQNb+uTmF+69awJAgjmB7e1kGoa3mu

7oVGsFgBP4J/B2SJwBfy7/0nwM+CzHcZJdxF9kFIBu4UcVVBiYCFCXaSFQsyAmBxiPRwDGinjBSEGgPJN7SDJF90YByC1YBxN1G+3AMA+tQ1wOwgNnQ4drtU8wbn62di6zJ+bTtDuLrg+7BjfJ5KMBuD3MBydoK5F6A1Ouxa9fIk2HahQP6E8/gqwFsU/QPGXZ+kRFiB/QOIC254CjL01R+0wPPkW00rB9pDVkjDDLB3uSrB9wOIETYPxAbYM9+3

YMBBk6yGB4xhLmk4MozDJg3BuhQKBiwPbccIBkTQrhJgd+J2BgPmS6rO3xmv3G52tr5/BhPh3BtQMbB6hDPBrT1qlPYOBBg4PIaJk3fB+f7nWBEORBy4PRBnbbzu9C68KJgA6wSQCzAaeqVK681u5UoP/paia5QS7jZtO9DxlWYKNYSUFM463ABg2qhJ0R0TfKvDbDQ0paPoYQnxBU62ROrY6vuzAMG+m63zGlQ0dBpJ1A+lJ3/ujgl4iQ4aq0cH

wfw9tktE9TX54j4Rb0aD3kc2D26amYOZobSLbnQ1IcB9xBZAX+m0Susj4EDI1cGWMXuAUKVvIqSRmB+00WjEQO6BzTEmCyJjaY78k+0201JiqACrB+hGiI2b0PSRCUQAuP2rB3W3m6tgLD1KUihhyMO4QXf2rBuIgTOIk0qwHYCHiU/RZ6r7G2vE/Hi9PfQu/QkC6BavTFyIz0/RM4NSEIilS1SLq1e0xiXO8ah2hmOnPSxRjOhg3SuhpVhLMD0N

i2r0PjmyW3+jfPVc6ZtCbEQD7Jkuhy5h/4PtIe7Wo2yBkRe952GopCXxhhcOJh/XUrEEV3msUazphhv3hhhcPZh1MOjWHYAn6IPRFh6P7Rostylhz+539CsMV0g0ll6kL11hvcNC9ar2himj11ewXXRQsnE8IJ7BQodO2QhhK3QhpK2nEw2AdhnGldhp0Mn9PsPuh79GXNdZFHhkcM+hvwPHNJVEBhsXRRPKylqo+sOXyFCPHESMPhe0zH62uMOQ

EBMPCBpMP6lFMP4RxcMxZQ8NZhn5bvhvMPyGRQBXhxF0LEO8PEAygFPh6sMvh2j0Mom4NUer8MthmkBGu1DUmuhb2dCuIMqQIELG8YyAdAGgBdABNo8gvCZXUEKiiBehZ+iZA6XGpvz6kXi4jCRnkLwJJLqVb5CQCLhhPIMqBTxY7jkUE908WCigDgi2bfewcHyhnAMLGuOU/uroOqhkH29BsH3E4gYNegIYCYW1e4BAhc6lVIaEb0Y0OEq8Qlmh

3Fk6VZ+SyKBSH+DI1JngmqYXg0h3VgVM5woUVCrAPERq1Jlo6CfoCHLV8F8IcHy5gLwAOtDoAyUaVzsiROYpCZMEmO0Nok8+Pm8KVyDFgEyC9AbABZAA4rpB+TBLeVgT+GG73iDK4DLAB6hE8FYDHXUlJusARIrLOKC7ed+JJSHx0fw6+jkQ2K2Xy972xfT705K2UOuRgZYKh5N3S41N3dB+XHEBuIb7TD2b/VJYDohQJKgerx1CEn2RFrfN1TBu

KOjlFgNihC+ULBuG6IAWTIn4SNaD/ZYgbKqt5yO5dVRpJ8B/RySm99IGNACkGMdWob6azDJVRffjDZISf32BvU6OB2f30+qG3gxvfSQxwGPeqgTHAEWGPtOUg2khve1lCGgC5ASIBZAeQBe6PR30hjOpRsmRBphRLSvybNrAhm7C/bDeYLYd5XW4LAn8YLFLytOMp4bAyqRKsWNix2wayGijYQqq61QW/aPuRxUNwWliEIWv92+RtjZg+t2asqLY

3aLDJABJUD2DSLH7zVUMQXyl6OUchZInVGkQGodgOzUn2i5ALWDhgQwgKOjWDIh8MCp2AUmSiApw/O4AiuB6PhOxmMUsemQB+k0NxHjSAVGWxdHavEun4AKgCcEHxhnyX6YYkI2yVuVYP1qsQgYkTQiUQBAigwsONb/Hr52xh2MGEJ2O9ipoT+qN2MKMEISexvhrex1YN+xnSUBxpIDoxGFzTbMK2MACON6uKON5a2ONoNf4qJx9Q6ER4Lq4C1ON

qlV/B2pLOOPOnOPSKlnabeMdDTx8TADAYCMOC0CPUuzGOJmjKF5xx2PCBl2Olxpwjlxvl3QxKuMLhmuNJEOuNBx4mJNxzlGtxugDtxmON/EOONUQBONoOJOMLhlOMYkLxEjx7K30W+/1s+/c2yRo2UXs1QBEAUKDG8SEKFg8Soi+nXCvMBeDwhJeBhK8FCCbYIynFROgI+L9LegAkwHaJOhbAVqDdQGWSpKyM2Rm/nFvetAMtB+N17RuY0Kxw6Pw

WhFU+RogN+R8+F3za32OoXihccFlr/XW/VjJceKAGQG3u+sp3P680O37MWTWx83Geggx0hDS8GVoaSgLAK1oTzLeYvsfhDhTDuZA+LGh4gZ1oOtXADOtOkQLwLQT/ghqOlTYCHNRjn1lCQ1D4AEkVawCABSQB11Ak8oICyNyyXAEZLZtMxQEbes6QBxjjF89QEw0ToC/XX648cPDZXoBTDwwHRbixkC2oBqJ3bQt91yh+WMwqxWP3Wo+EaG9N3qh

jRabGtHb+zUqkPYLFV+zFib5yiJLlBx/W4HT328Jt0ArAAROckuBVhTHwC5mMMWdcc6m3o/2N6UwOMQM3F5guVPpnEaeTf6sUZskM1SbMNCX3NJqJdqCiMLh1ghBbaDT3OlhL6cvEClJwIXywhdFPtAIXL2vWlH0mmq4CtVRI8wK0bh6Pjg9X6YIENuq4AImnKko/0Fe28aZ+46l96JP7Vkp/AlJzMBqSipOG0+1zVJyjS1Jmmr1J1uNFoQ/AGqW

BFNqDpMHSwJrlC3pOrJ1cTVMC21k24ZNnJ3MxQJceQLq3gC0rGZp0W9KKvReZMyuJAGucj1F9x1xoLGJDp4AbZNqlXZNlW/ZPCBrqXLEY5P3ydTRKyVEwLhbyx2CuI0OB6dVJGlePj7U5OjJ85PlJzECVJ65O1xmpP1x+5Mhix5OLoZ5Me618RyuHcR8sTpOfJ+1TfJ44j9JtVGDJ5l2ANVhojJsZMgpuAgExqZOQp+7rQpshX1qxZO66fK0WbJF

NrJ1FNbJ36agdTFNCI/7IHJk/BHJ24GfxlvWP+n+OtRnmZyQOSAQAe2OYAUgMgJtFocyH2Xtgp+B/y8Qb2J2+ju9QYOf8Pb3BGS+BaVD5mGOfhYHXdYByKOKHZOpyPLDFyMWzcJO76jyMSa9abeR5S5qhs6OzAGZYJJ40EU8MdBcUH1hKpL60G85WjdFF6Cmxne67LegDYULWB9I/NAB7FoojEr30YJ9VqiIL6PpVXITCJ2qaiJ6sCbgfyYbgFyY

8WGMKv8fqbQOb8HlVQ5aoAV5nWMCFB1RrR2NRhqagQ/RPzaFgDFgQIBEALWDcPOx224Ms5zYZmr2ccQYxhLa2e5cr4W4FxOJ0A+jFBKMppKdIl0tY7yZJKyP8bDaOEJ6J2FEgFluRiJPkJ5WOUJ9NNqx/UHnwjjb0Jl473sC+CpJrLBigmYL+RUPYMBrhOmhs2OrBC2NesReLtpsdlAw8F2/1Xvo624QPT6ISCEAJ8h5x3eo6wasO34NePsuMQhc

pl9HafWXgWvedGzbecMjhtNzn8cZ31Zfpjn9USQkrVE0PUqE1EhkcPxwkr1bIyEYzrMsnQaWclCsUuE0qoc3FEWADFyCEGUR7pCt282BawHqPBCexr8ABpTdUFEM/QEuN4aSwhai/frSW52PKZreqQM3AJ50mbGpbXeq/AdzbZRQzMOxzdaOMIFNoGT9TyHBu0XvZuMPGzGkV0Fi0E2OSkJ6ep6/4EHF/EGjQ+jLZHVktDNSujDPLELDPyZnDPog

fDP2xwjPEZy2CkZ46nkZzAiUZz1bUZ0WopbKza3BtwPx+4XQsZtdbsZ/T2CxDs1cZ6zYqB+Gb8Z/KyCZ8SmWlUTMVe21IEx601SZrwCVkWTObh4QMvtJTMOxkIRawNTPupDWCPBxAiuxnTN4kPTNIdS2C9Z6uqdcf2xs23zEVZyzPeqaPjTZozPCNGVPnJtZQuZ1pxuZtp0iI43RjEAq2sEYZoNI5YieAUr1PNXwAhZ/Kyzcg+gztAZLhSO1rzxi

qVdy2n1OBrGOE+Tu1Sq6xqYZiu3YZg1RxZkjMJZz+xEZ7AwcGFLMn4NLO6ADLPMQLLNjIujOIh/LPrBrjOlONjM1yDjPlZxHM8Z/MV8Zkj21Zk0YK0hrN8UprOS1MFOtZj0ztZ+kidZ6Pi62nrPKZ/rODZjTMjZ7TMCkuWxP4fTOHENbN2Z6RomZhbMWbJbMJHazMcGGbP2Z7TmOZ7bO+HLLilwPbNsug7NeZ47O+Zx/T+Z436XZ1WmwrULMkhud

3kx+bT9AJ/BZAekC4AJ/CMAbRkMxhxlnwYRLlbTBM4Q7Nrhfd1gtsoZRwoFeABpulqO1bSLCqPeAXywoJaRvf5jAAuZSxj73Y0HaPNBsJOkJz9P/epWNIcn9NuA6hPqx8+Eo7NC1KtZlph7Ve4FzdcHhfIKRP7FH28JqNDvxFDNU7RXiGGFrNE+vH3uIQvOgp/pUl55nYRsc8xIxqL4ZBCEMLxod0z+mdXUp3B7l5+VPk5kvMs+qPkP+3e3Wp89l

y7atO1p/pENp4Yl7MjyRDKVCLGVBCD+RY2pN+B/Y1g1eXtiC3BwoS7QlbWFCpsE6Z6KEYCPaaQFGCd3LCPWKRRuvJKTGkJO7RhNNh5pNPU0NjCeR1NNm+mJMZpmhNxDBtOaXKEI6XK6MrwYG6BJepUzBVeVcUMjkxRnonwZ3VIWxvGBq5QpMs8EllOXMlnDYKAR44aKC+LG73P7UgD75iMHYOvi6uiZlmhXCplss6pnVgFgB2ph1PhgJ1NasjsAn

YM+S6sk9AZXa7BlhYyoj62RR9+XHDxe8xSjRr6jKVBVnzoXAtVXX9CNXO1mTMunB8FiDAT5+ZntXM9llCSejYUYkB4gcehQASIAMGtSMX2yfOMtM4IuwGND1nIJJJBA7yMpFaGfMHUOlnYKjQQYyqisp3BvKvDaGA5O2Pp3z4RO0C1/7OUPxp5YaJpv72qRGB34BtNMx5noNx5uIYJXMgOE8XGDXR4G6rg+UzdlW/jisgKzZ5+KOfwybCJBfPNCJ

4IbdpzKOZAPES9ATAa5zLoCoANNhO4Q5ZhANWp4gAoDNVaVz44D+HNVVh3DAOhP+tACELp1MEOgP1mWu/NBqrD4CRtMxPC+5Qu5LMihSM5eDjwqGhFLKaaEwCeKM879l4CD5leiDowGKI+U+58iGjAf3MEJqJ1xu/X0kJ2jbOFiH5Kh032nHX9Ox5/9NxDVQCIHHbguoO6Gr3HFUG8u6j2DOhgRFt6MdGAeLThP33455OE5Z7jN7+/MXP3dBra02

tPFgUA2Kqa1QCZxbPY5h4sHvJ16PNVQPvgN4v6hSYR15pGMN51GMgR5vMYx1vNwh0BSfFgnMC5n4sE+v4uIfP2maEoEsR8vryzulxVP+/bbzaeQD55DCBpsFHbmJ5sGwmD+H7p1CHdFkR5mAlfN2cYvk/UaL0XqX5RhSWhYKDEICJQLvxJUuhgfAgPOvphwvSLZ3ZtBiXG35lNP2zdwu6g7L6XHc+HjnHNOTnLTQPYd4RDSdH6PQ7SL3YV5lnF82

OjFsG1OMolk2hpW3pkRXhIdDaKNoirN5Z8c3S6PlYPNc4jfF3LP3B0IQx+lCQPNfAif4V4v9MPw5c5n1a7x18hFEXMORhzQk9R/piREVfSbrFpm7Y3ZG8lT6nBIh04mmQtC5mYAiqZOwAF2guNYNB8JOq1Kw0uM4gTczvOV54PVKGIZ3ac2tEZx6o4KZqyXHEWN7Vh9MiQilf1bUh5oObVBkVvBIrCiqhxP82YHZiyRi14ZtBUJTMWY62ZyEAcfJ

N1E50jSzIhwusAC71ZMzxl4TwHI4y2ZlrlPbMGahR8czaq5rZGbkG7NBZuHVeIqLZUJKaIiprVX8nKcuB0DyHOxEgizEs0pTkfl7AEWp5MEVKxgQK+O86MIjux7Hl7l4rFGK/7KpmshqQrIpw0ALaJQAa4iIG7m2bWQayqlbYhUNc5piNMwCOSqDQ9A48oWvNtFRpejEEKCnqmly07b0yrOkmq0vN6Z4uzjc0sOl98BOly/5vAV0tLMTEtbAr0t9

OL2Nj9NMNSo/QlBllWAhlupyZEcMus6yMseEaMvVy2MvplhMuIEJMtnyRpypluwBcV6kVZljEObWUuTF5/MvG/DXhFl85rDxzON+o2Ji0yvWwGk6stXi9v0PEBZ6WwPwpNl/rItliPg8C9ss/kLsu4uWHLmSvsud5wcsb+qdToiscsTl/0yHl72OHY2ctE6ppN5UJcvJbQLNtMDXO1Z7tYT2zghqwncsExPct2VuMu1Jxyu6QnqKnllkoXlkHlXh

Dst3ou8vRxh8uZDe2FiVl8uUkbwhZw28Yfl1ORflrEi/l/8uSAVLrnNYCvRV0Ct5NVGJ6uejRAA0d5skOHOjPeCuilLbhcl8ZKcWNqt6QRvOvZqdXvZ5eNwlhbSIVzMgmlopGGdc0v0ZlDqYV4gzYVu0v9IPCsEVl0tExd0tkV3y3elyit0RgMu9Z4MtmcqRoGBsKsum2kBRl52IxlhE72VmQCykXiuiofivnVoStzl7MvPl3MuLq+GyFliquvx+

StllmmUAxysvg51SuHJ9Sv/Fhst+CnSvAIPSuLiNsswg+Ks6SSFwmVimV0aNd7ogSyuTm052jS98XHV0Kv1xxysSC6JA3V6iBR/B8jLli7Orljwjrlq7Pt7fyvfoqGu7lnHP7l504OVu2jHlyKuN0MqsRB+rlxVm8smMe8vMclKs5lpFMZVt8uiZHKsIA9rk/lj0yFV4qtAVnV6M1lcBgVyquQVow7QVqkGwVqO0Wpne2JScQvzaZM6RAGgDqQfH

Hyas3PQ0VjDvodsRptJXKPwYAMePFqpvofN1FtP6QXbIWDBM4YPyg3JZGCM3DuO27AxfG+Vn7QUuzGxYsilm/OuFryMP5xC1/pnL7nwjS7ylr66fcOJR9U1e6Ecx6GSVW7bgBsBU5JnhORFjoyKPN1DP+q42kYNmK7iRv37+4PVGbaPiPIwgDDlvA1CQftyKMT+mimhi32h56XFAoqH/iOQMvOAW1xAemG8WuE61EMNScR2lg01aT5x3FGv6W4Cp

0wOUgmEZ9U6S21KpbC4MjhpmFSfBTp+gQqyk0k8iiK7HkmqgUhMNE/1h+p8aYQOAIRdWMPgNL2D/AWSn/Fv2lwSeohy2ZMxdETwBF6ZrUULO/BLSzK1jY8evm0savysGmpxxzT3lWkM3uERPjbENuoN2gTFN29jNFYwHHgInrbIA/AAN+5RjBCrcTN/SXTQgUSSVAAX5N1uIVn1I1OiZf+wPIp0C0Z3LPP1/l4Lo2XNqWkgjU2ZZwq+U3QNImUlM

20rzP6LWEsjGW2eNOVPigTGRKwaslNgbOtaplEs/6gutNZsGWBAW/Q/6susSrV0vkoyOnbMaOnQR2sh11nwBF6KhKz2lutvEBy0d1tWxd17yk912espWTismpRGwEwjxhiNG1G5wirOT1/MXT1ht5z1qsgL1hexL1sSsr1rkah+zAKb1iX471siN71zaCe0o+uP0k+vKkM+v+mC+vEaa+uf4YkB31/S0P18dIT1i0v5i1+uBuLFP/Zbk1u6b+vnE

cE2qwABsY5oBtgUqFFwXUBsa/CBv5kKBtgN2BvxVwHN/EAysoNi/3oNuxGYN8zPYNpHMjh/Ah4Nwj7nx86SKjaLYEAfOT92497MORdDUN6Ma0N85r0N7XQv6B8CAhjixO5nJYqYOpVkp5L3oxylM52tsaDgVhu7+9htQGzhu99b6Al1vhskxCutCNqut39GuviNuoj11w1UyN7STmQz+sKNp8hKNmJEqNkMBFpZMwaNlcnD1nRsAii8jBNp+uVNw

xs2w4xsVksxtskCxv1keMY2N3gJ2N7euhi3esq9ZxuH1tEtuNhSSn1kKv3oy+vh8Xxu31qkX31tV5PNn0kvNl+uKQCJuoNzKLRNr+suqgm1uuBJsW22Ag3G4BtRI9Juj/TJtoEbJsa/XJvwN3DMhEZBvBe4AX22DBs4otCuhNv4s1NqLP0WwhtzkIAEheMhstNwXxUNqjw0NuEh0NvXUMNvpshc+b3OK/WU65xmBhAIeD1AAjVdAd4CJ4sEMYQ7X

A8YHd337PKCvfEkzjxVg2kpReEfcJRQL69aPV8o3CKPHiwhJPvzrQ/kvn5kPMLF4Us1JY30rFtwsB11WMbF4OtxDD65h10cInwe/XKAjSYNKg3nKWAAOcJ0p1wZ3JPxR8xSUXMXWY+6ORYjKADe0oPirAlm5jRCj77RPePV2aQAYgRvSY3eVEY3MW7skMIC51lDqQJf42f4XKCQ5e2PL1ObpdxjEjW9OgC+eX4sIPSwBJWNeMBpHtsBmNNTHh4IR

dt+2MIPXtvdZRQDjt/tvR8WtuWATtt1th2NxEBdvskXAhNu3kipt1xqBANdSZtx1E+rHNsER7H0Ftkfi9QeVHsBQfK1t34tkJattltudsNtsAi3x/4ott7ABttlEsdtodsOx3ts9tydvHEOIizt7tsjtpdsxrCdta3Y8Pltmduvt08iLt7rLXJbo0PZp7NPZlGOv4idXU+t7O81D7Nt58jGrttNsbtu4hbtwir6gVat7+g9ukuI9vsdE9s1t8tvn

tqtsKmsjvXtiPh3t5ttSCp9sLhgNI/t4dvvtvttAdqduDtudt/tgNJjtwDvtt6dssd+dvgd/9ta53EsD55b0XsqCYUANgbGQAfl9R1pafaSSIaRaktcIPeDJ4lUyQJh1g7y11jk4sEPesEvEpKpappEl+D+LfktzFt9NQqj9PX5uJV+1+/NrFjwunR5/OzAOe6+Fhok/UQFCalkGohy4SGUiC2p30ROv642NvxRcwk6OfQ2Z14hLcdtmkJYvt6Vk

fgBf3VX5mBbGv0kWiwmEPlh11cnWfrY5KRdtePRdnxGxd+kjxd6B5n4JgLmBYuSpd/gDpd7JqZdqRXV5+5CEhGK14tTqsqKoPkod3qvTNohLMEXLsl0/Lux6iSQJdhv5Jdw/ApdiSZVdyHqHqUmPa5iTvP+soRNALIA2uyIDOplotBQbJLyWDe6lhFzgFzDoZgcwShcx8VlqKLMIwQeruVLDzilLD/jVnZqsuDOcJNK8YIn586rJiYtky8yzvXWp

ws+12zuLGz1sOdqUutU5zu2PANvI/IJlfw8IsO+i4Z3CkqV+iYiYmx2DOxRkAvh5VgsuwK4sGln6MfUqai39bm7QogwigJCPjUjdIG2eMAhUAM0W4EFIBLMEk2Q5USAIPNUBcd4nuuBsnvXgU8iU92dvU90nvGwGNIM9pKxM9mTws93oAqwNUCcVnAoAAH0MIPJDA1kyb67/SHwrFTZJ7pJt7MzhQoApTT5Ri9lTNBhF+jeuqVNUf1VN3moKIfGK

Kel0iJ77atDDEjt7IMWR57/pmJ71wYN7NFYWAJvZNMZvdzDhvc1s9QGt7KsFt7FvaN7vTjVAUaRR7ubedj4CMx7KNhx70wLx79b3UDevZp7LPYDSbPed7Uvdp7uZjiIkfY57MfdZ7VPej7XPZ57fPfQKgvcx7/iBF7CqbF7/iAl73GZ9jKHRl7FBTl7zDRPq5Hj5sGJuV7OMcopC2vV7CtM17J1gHI1L117jABd7o1nt7o1m57lPZt7+vc77lvad

7Hfc/wXfc/wjvd77UffN7A/bd7PPfhjbFyu7UZTQiL2Za7GBuztsIY67C2i97aPd97WPdTIAfahBQfeUkhPfb7KffJ7EfeT7YffJ7cfYv7zPfJ77vZv7nPfJ7PffT7M+Uz7wvctV91dBhunvF72OaL7D5P5OOBTL7uBFukf0yr79xpr7J+ClJ9fa9GjfeN1/Zp+6cTzb7w/Y2DNFZ77pvf77I/cH7E/eQHo/ZVg4/fQHU/cwHM/Y97srcGtVqZId

M3bVr4YG+ARADkgJ1F6jLRYn8r3bdb7QcjzjVOjz33chZuhsZEqlhj2KpcCBf+jiUp/grTydZC7CdCQgnHGXasRan9EzZ6rreZ7zXdAoHntaWKDnxWOfyn1wHynbEidEMUn5paWgxXGkaRMzK0EAEmQIEe7CBMNgS9SBLWsBVggABQCGkVQARIhq0dkhW9/AjugW8t6ur949h1y3VexRiM+vOu8w9rqWDs2W2D+weODxGDODxRhuDyckrNySAkEL

wf8en1S+D+ZvNHNDsWD4kBWDkIe0WBwdltkgiJQSIcdAdwcxDye2KGUo59hpIdN+t2HIGqIzRmy1P950knJAMoQ6wOSAmsfABdAUXJSOJgdX5pYuOAqJMsElDmxJ4DhoW88yZoWwbQ+SDPXRwAzznEQcE/cIHmEhIKoEvUspRm0NdV1rvOC/ukOgBQceBJQehJ1yMOfYii70MDk+gDaqGoASzJKmWR/fAH5bRoPOTgNwVFDgIcpzDwcl5vqs4uqd

S4+5na1+fGa1DudjocqoBjefoD4AfgCpgYkDEiDocGzZgdQOt3ZsDl+UcD6cFOduhC6GveCts1WjIOvUOzhd4TKAljBalhKihdkG4fA6Qdoxj/Ftd+QeSR1n3bDi/PLDBhlD+fCFhGJ3HzDg4c8UGGhqKY7wJBDQF0oU9SCLMYsKDEwcWd9aTK9j0zW0DCW5Qd4s+0PkdQAAUdQSIUcxAPquij8UdkdpA2u8i/U1D5Wv1QUkleAsoTkYIgB2SDDC

oi1ztULTofe1lgfJp7932dye6wjvUEOgc/UGkX5TBUR+KQZiMFigmgPTDsIG4suYe9+ap3VumKwrD1fswhqFibDsbRkj51sWzPYcvQNCGqTdSpe4W9I3AbsTa5dibGDwHbScAonJtjMj1ZNOyS6f+wbqsQAz4ZOYOQg5upjmLVQSDMdZjqUcb9yJEpj9fbpjllWZjiS3f6JUcxBq1Okku5ZlCSQCx4+kCMgTACHfPUdgjrodvdiPO9D46NUJzwuJ

wXQ1aaSUF6hjPCNK9x6ncU6pOj3cH60V0dvs90f6lm2NN5ilNyDqlM95i1ABj2WNEJkX37DpvySYRktNSPExxjy4e3ecpSFwlBIRC4lDMq1r1Zj3nT6Q2st/NxhoCdMuCjWfL31l7LaNlyWE2ZCNUXNZDoeQqONwUl4Paeo6IguR9bJ/X0zXiNT2r1p8c2K142XluEF+gCLpQIHwDfDd15zI6gBpvIojaN8EhTEdEMYAasnRpBhJXj3gise/Ah3j

tsgPj36vr19pwvjgMgTiqeSaVwWEA178eOmX8dIdT9oAT4OztI/Cea8WZsprCCfwuf32/NmicUK+CdGcxCeG+LEhnAtCes9Bj49RbCcmEXCc7B91KAUPqtETy8ea2a8dkTyjQSW+8eC9Y/3tW2ifZbV8cMTvNFt8Zifj5QGtsT3dWe2o4E33X56ATisnATtUqgTsAgCT1xqQT50uOQ4TyDK0RWbkl+ySMIwgyT1D5LYzCfftRSf8AZScuTgifb/W

sdkxqFm9gebST0PEByQLWDyAIeAEUTsdkbcEcveZYtQjwH0EBgcdwjocf/d+FlO5kVTvYZB2uPBi6CyIybQ94AvBdv+JzD6sEutSAufClceyDokfrjkke956bvKD1ATBjn0BoQ0iZeiQzv7eZOjESReZ+yowcPwEwf2aMMIgJZvYik1KzRcyscUT/QgI1lPg9fHkhnydACrTgwPrTvSeJ8Ladz8Pqu7TladHco6cNW6mKnTmsdjNr4cqj9Dk1ARo

fYURgAfEjoBDwJ5TZT1Gi5Tpfy9jlN0qxk6Pmj0LDcD5+DzR3fMg1MDNg92lIkmP/jtlGcdz8xaQ4jsKAJQWBVejuM3gRuhAbjhDAHKgadx4YMfQbboxHGCeEPodjgRRcad6UI8drUc5DzT6fzRydfoF21yGMJbSfXTxED3/EXsU9PQJgxPFtWV1fTI2wbkCBwZUGEMABiEa4gUN+WEVZMHIkEaYn4EXbKvU97Fq6bcMKAaiC9qzNvSc4mnvVku2

LU8Pg2DgFzaNkpiK6PcYYAOwebm4RHupdjrm2LicJSsTqjWbCSIkIv18w/32w25mckTpwiFjiS0N+zmeHEbmeniXmenT3xABnQWfeB4Weiz8WdyuKWek3JHJfj+WdKvRWdD6dXS7RFWfG29GwBzp3Xll5VPN9fxB6zu5uGztEpXWE2eBm82fUQS2cQMo0r16W2ewfcUiqEDbV9V52dMzigIsz0idszlUBezj/tZ9X4jwa84gBzgWcBW1f2n+kWdi

zvs1skSOfgNWWd9ZIGtxzy1JKzpOfKotWd8zu/mazpSuqdIvQ5zyogmEPOdf4AufoAU2f5qwr0WzvVzVkaEo2z0ydgCh2eC60qV+8vvPg0UkltAMoRL1BYA0AMIDDwZlT6j11sQj/Kd9joGfFTkGfws2eKHgnCFjDhc4XqCYeXFRGcvCl9AneBceLDnc6CJsRQbqUJiaYXcchj8hgR7P133FJaPvHU8dbw6qk7jo0Gws1GDyoUkkbaBVu8KfgCsD

dbTH27kHEagihvz4e5GjvAP+1r7tmj6UtAZsD1hQWRQVfKYLj8mGeEMOcKvMqYcNTmxlNT7EdccYFVIej0dfFNqhkS6gBdTtYch80gdP+/Gck0PYeDAB+D+JcGgTwxjjscRkuiGu+D3djElYoaOSMip2NS00o6mLz7P1rcxeqkKL3xTqbsd4q4CJCRmDhgWQnFgeGAPgVuhdjg0cfznoeAzmEdy43+dQ+1vw2J/Dnjjx6HCYWDz88cBfFyyBfzDq

2MZ1pNvgbBBfWKZBfDT1BeK+8YQYL/ihIO+MdOt7cdAgVh24AaqPlFq6EOLs/a1FkjCGALWDGQMACKgb4BtVPuZ0L+wGRJvxfJO9YuDji0dlTwr5X8T6htT6dqojlJTW55OjxBLEdzjsRdweGMr4jgPkyL/ZA0+7qcJmnGc84Lce4LuUMOfBILredqDTRrz5N2IYSIhW9290Ewl0zyyLlKVFZgxyrLFjquajz65IrshDvXzp6e7+fhBOL3hQ0AGC

DoAXICp2KSBNLxiEMLj1tML00cBL1hfdL/NmkcmsZKpNTWzhU3HY/G0eBdj32iD5qfiDx2WShBJcx5JJcyuFJfKFlBelQRWRfpLJfAcl2rYLqqkbxPBelLwHzBUGIAVL6sCpgTABQAVyCcAZsCqRmhfBwL5d1UgGdHR7+ftLkqedLrWOJJt5gTLgOa5ywxYsMpGgqjoRf4Osak4jh7ASLpcdwL0I4zLuReYG4keuE31l4znYdBj93BjzUfAuJjiZ

QCTi4ecfoyyWE8cCas8eGwAwhUe4UfuIU1fVeg8zSjs1fXLuxfidhxfRAMoS5AegCKeDQApBw77MrmC2srihNtLxzuBLhsTK0InhpKW0fhRwRJNYLx3RLs42xLt0cwL60OH3VFe8plWSpL9bzIjzILcYPfMGL8FWXW3BdAgUwTyJq80krh5cNLgfNlCMEIdAJ/CT0fyYdjxgdeL9+d5T3xdsr/xdt4qFgIj1SZ9sfXlnDAZd+5PvDDDsBeiriw3i

r8Ze37NtOSL4g7SLqDSzL5DvyLun15G5VctRtRCqrikdR7VNdTtDarLAcwkPsPVdPYA1dzT3Jf0zqYlj5Jl5HryxcahE9cTxv74Uux6c1E8IBPLvomKgMa7GQLIAaAJ5Rer+J2Qjr+fNr9Rmnw3qSPsBNCFuoy75yjoRcl0RBRr83nzjhYftTtaSJrxBdPAFNdN+J9gZL2BM+gMYZZri63TG0wdFVfoBTpkHwOL03MUrzIAnbTgCKgfAAXKq2U/T

r+h/TvEmMLk0c6glhc/d+EddLw/xTVehYp52UxLLWOsJhYYQ3zgdfA22YdiLtmTUpKZdJQuVeEjmdeodxZengZZdEr1ZfHAQxQTw1/gBiZsGnaZkeneDH065Q1dn5g9fD2frJElXTenr+Ob6bi9c3L33mZ0dfDKjm9duGAXIiAdE30uK81vrg6M+r79N+rzgeqXAhjBRpdkhrkGo+WWarTKwpBgboddQLyDfIr/fEwb9FeUjzFcbAJDffSFDf8UP

RRHLv5nbjuUNv5y1i9AIhekrp5QEb78CT0XuC1gXuCRAekC6j2tc5T7seGjlpdNrlzf0brgdMbgxmkcuL1sbtJM8L/UNge6So5nUZfc8CVcucKt3SropMTr3STyrtfu+j3qebjlVfkjipIMMpVrusXZdFYLdgPK9vDhQeRSm48QeneLMJTUjX1ob6WOTQdaStq4M6C3W4HHJHbf+ILvvmDPquHblAfupWxcPTizeaM5sB3r6sA0Kb4D8AOSCRAcM

BUoBzdkJpzdR5yrcArhjfYcuFDhg1RRqasJdO+4+DLeEn5v8drfrgCDfxL6Qdhb5Nc2y2r4IbuYI4r2LeiMjbeA/RLe5rwCVTpxtldLhxfNFLLcgAOySpgIeAYYD4CegDJ3Wy97fh5j9etLlUMcrwJfcD8r7BfcD0ShQG5JU7eDYWgLcg26HeLjpYfLjvrdG8Abc+j+yiSbqyDSbgsp4LibfrRieHhAaLcX+GyMJboxd0ugfi4EKjEf4Pm4Nujt0

Gbup1a70nxm3e1fytm7cChMoRyQBOhvAJ/Dj0biHU7mzufb9gffbltf2UBsRdKrwyxGUNfCQ9qAYJ5ebc7/jdBbmHdjrmWBw7pBcI7yLfdDFHePaKdoErzHcyb1yNFrryIsAQcKE7xgAWq5ADvgCADhgXgbFb36elbnxeS4z9cO779eI7BEcJhDRege2gSPQsxRJJNFmQ75GdiLzBN4tYTeC72RdibhVc9TpVfrM0beBj5dePKiNjcYQmDLb2/Zz

bxaGiwFtl7Ly4pFtFNr4hW/ZQL8JKyWdHevp3ke2rnr6Wr/DQXL9Cor7sdQG7q7d1juoekriEz3z2YBDwfgD9AN4D0xm3fdDvPd07oqcM7wFcEMf9nuPKgOAb8KPJURCB+4H3cujgffBb2HfjwZJfw7iLdpL0qBzYcPcrzFTBK7nNdErzDdTpnDdVKhxdfypPdyQOyTUh+gAnwUEclb7xcNry/cVb+nf+rwFeWjv9KKPfgcLnBJKuOjH3v7sQd5s

3ldQbz0cAsUTe90+Zd+4sXdKLpdfjbmRXkTCeHP2qKRM1IVSRlIrDSM0gnz741c6b4BB6b4Q8673bJb7q9fXbhxfzyzMGpgfNDwwd8DvLzxdoH+tf/T2ndYH6/c4H37ejhQKqxsYIts71B364TOVRL3jdMBj/d+7vnewLvdhB7uDch7gA9CyaLcZrkA8CHnBcQHwpfFL3Dekrw76E74sB1QZ1rsgrb1Z7yjc57jA+Ic+3fYH1zcaM3Q2+febAQ77

zuBAj3JSM+qfRtmHsiLsZd5s24rdb/ncyr6ZeTr4XdYzxOCMH/qfMHosoTbyafFBDowsjplqprxeF2cSjgzbks5FtYJ3dAS9DpKKBe2CnXIuH45fYx85c9fK5c67/o8XrltKmb6UDmbnfc3z0lfXxU3e9AfABZAbmzFgLN3n7nsfqH31cRHqrdubnthpaZTAt3LhfA73607EgJItGmvcCwXndxruhAorn/dorv/esARHcTwtNfoL1HckQro/R7yX

d5rx8GxDTw8PLrpJJ74yDvgRbuKgIeD9wxlfKH7PfoHtQ+fzq/eSl9Y9RHmrcNYGHzdugDddrwxbxgcYD3UY49BMgTcYJ0dc9blflN7qdfdV+g9Db9vcjbhdfzFtVePKoKJ3H2dr7eCICbLXVe7L/N2dHsA83Dp0Lnr+nZtZNffNbDk95rYY/jqu5c3r3ChlCeQDfAVMD1AbEW5Aa3d1r+hflb1Y+aHyI8/rrJ3A3INceyGYK3oZNn9rlI+NTuFe

iLvNkyhdkkB71xA2HtFq6A2qi6ze7RDCfd2fIQQ04r8KCMpOYITR0TBhp0yRYLo1euHyXfJbvHekrlySE76QsVCJsCpT+mMUbiThUbpRk0biUtet4Ge4H2E/OyW2vmKVnfn+LSbCDfqYirzU/CL7U/pHuJeWH+Nc5HkTd5HlveDb0XfDb3Gekn57tQWibcYEq09gqSIw5LwoLPH5Xcijqj24Ec1dOCJfepDhs9WriQ9Je69c3byzim73AATW2mRK

RkE/BHsE+7xQpB358M/MLn7eQs3qQfzVLDu7g3ld+S4IjLmFfcJmYfmHzM9nHmalwL3Zn0MlQr3FWXcYqdNdTtavlhR08c14pLex7nNMELj/PQF1IDuM4bClu9qDBXGJ40M+YwyALMCXYesQss7gv1XRVlGO78+8F6Zn8Fv8+4AW1nCFuZmYANq4s8CgcOL3HgC5VQAnUXoDmynWtLHsrdKzOzuTn/5eO7xJOlVP/hVVMvd/5hcJJ0daNkH+FcWH

rc/PTaw/yEifMMMh9Cpr9aF+uk89rUefcWd5ReI/a8/v5+VB3nnRAPnlIClukKBhoAh1h8KzP5ET88ZXNyg/npVmgX1lk8FinBCF+1mCF4C8QXk5DQYKC+us+dcc+m9fZCMoT1AK9quQSIDGQXoAo7NC+578c/ilh62P5oOvI/IaFFnVR6EXrH4icciQrnsi86nzc9UH2nS7n1S82y+i8Ib5rBfpZi/Acj4GXD92vEJi2YpbhLDcXwXD3n2Av8X4

1Dq4c+AvnkS/vnoQB6swC+rYX8+Jwcq6ZX9hA2shS8CFsC/5X2ZneX0QswXg5UOLrURlCb4C1gfABEAb4Avbky9Sn5pdfpr7drH6c8bH2ziKPM7gjJJVLxn5reWMiTA4Q1y/pHpOo8WZKNWHoXhGnzd2RbnFKplQK+QUJx77rwlevH9yZaCe8GfH+PeU7wndYAVyDIAdSC1gbACQhUy+hHzC+WXwOs+tmy+egS76dGbzcLnEjbMtXH7onmNfQLjy

+5OKa/wbieGzXkYrzXhYT1QKPcyx3Ne4ALoDduMKYbXnyqEF8leq1xmBe6M2VxQMoCJiEM/+1GSZhns6/etjpc/yoAPmKfQ8Jnhc4b3LFIO1J6+nH16+B78eAVwY77KlhDdfXyIyPH2TD3Ff6/gH909Xn7ldY8Hi/BoWK8vAKqpJXmkCiXj89pXuS8RM6S9ZX/8+A4SS9AXx1kgXoW+FX5S9nRlgAOyJ/0nMCAAKZYiDxBpADGQdSDhEPEC9wEmj

HX8E+EICc+o3yM/aHmy+bcRLSedhc8g7qc5jxBII4O0w/TBjc+xr4m+Gn0m9sQK6j+Sew9U3tBA034SCLX+m9hX5YZXQ1m98Xjm9XALm9vnjYy836gsZM0W8ZXwW+04Lgux36LR5X6W8FX8C8y3iH0UDhW9K3wa7VgJPkLAASJbRT1dNX75fU0ZG+/L2jey4nC+5plH68yW7RNbvY8T8ljcgBtfOrnmNvpnjref7/3c4nspTgbMm8fXz5A/5769e

3oJOspZa9e1D0/M3uhCB32K9hjoS97gZK/h31K+R3rtDR3gW8AXgq+yXle+p3lO/5XrwtWuyG8lnzO8owFW/oAOSAYYd8DyALWB2SNXY633eKl3gqedBiM8/z2/dHTPyhigwQlP7ztnyKEUJAHlu+pHtu9Q7ju9Zn84+hb52+Cgaa/2HgFRzXoe+n5zaN5LlZdM35yws36K+8X6e/GoWe/WQee9iXvm8r3je+S33B+5XsW9U4CZmgXre+73q33Td

w+/K3uSOeKjoCKgeoCCgF4nDn4M8hH3W88mfW/RJ86/o33S4dElqp9Xj9jCQwRmIF6lLDX9u+naQAQ0B7/cdgXu8YrlKTROCh1qbubfIqLjCSVabcfmtBBhjni7Mnsk/+3rpdT3wbDhoGe+h3nm+L3r8/83/B+hYbK8J3lbA1XZO8kPne+bFlgDhaDO9/ARW9H36h+MwQ3PyAdSC9wKAC9wBlduSFXA330M9l3rC90b9q8wnie9/bglJ9sPg9YW2

kmuiKwMpnmD1/39c/kHlo+j+pfld3mt14n/I+kY4DhFHiXdj33Ye46Lx2fX+CCXaeMqnFSHwOnzsFMn3Jd5ldaQvDu3Shc4ctnTjftNP7adDHw3eLem7fI6MoT0AdMxyQXhBgAQI/AnhG8sP6jchPg29P3o29sLzKCUUa9R0CJrezhZNrKVcTCE3sRctVJ5KN7mg95nug/ib5eMFPzveXn8k9j4P5T3cbnnHQEkLvKSpa0jz75VtAQ8NPw2DqOzz

Ysqzk8ZQl588n7p8yRhxfNGXS9ZASeiwjePE1rsZ8A7RG/ut++/KhuU/Qn0+HDj8GdtVj2TQz5rfdGeRyGajZ+naMYIdxHZ90SWg9zLg5+KryPkknrS+lnqXesALizyaQ2ic8qnHreO/zAZek8TR0lIlbFiaqP+wb7LkN2PP7Y7rSfCvPc4ZV5c95/j7bl9wCzs+3Lr+NmuhxdjtMoQaAYyBDHYFoUAfx8vKJh82acF+sD/PdtXyu+MbyJ8L3YG5

cyaAMa4qUKL3NKTovlo8dGQlnZH3re7P/rf5nkXf5Pos9LL45/wP058rbym/cXas+VP7jYlg6fcFQOp++3qnaDH+naDH9SenLr5/b7hKcOLkJD3zmAD5oBYAfAFgBEAOQkBP2hdF3llcrH5zdqvwvetr6M+sAN0QPUJF8FIcFdjJcvmFrUDe2316PkXtaGd4LI8TXjqc5Pq18FHjYe2vqTf2vmPenPwTjPof60z7ubeXobQGm4NTcneKKT3INquC

LKo/qbh59aP6cRTsHQ18wid/8v3B7Tv4N+SH8Y/3L+PcHDAxOoAa6JEQD4DsiIM9KviZ/BPyF+rF7C/pv+yi6GgBeqYe6NGXbG/Ivp3BBtzJLFv1M9irnndcceYK/KR29ew3F/Tr1vcLLht/i7pt+M38k/qtU5mNYeeHM4+rtUvsfdlUufdjv9aQsASd/tdGD8zv8ajwf+d9dnqQ+kr0UxjeDDCRAWuJawfNCjPhN9MrpN/erlN+tX6F/hP2F+Zv

tTtwbXGBROKUJLAXzdoz3+9an1J9lv8oL+SV98HE998En/F9t7wl/Fn4l/sX474xidbyjN+iYLs1JTbr3hDutSD9LXj2rrSbk+l5s9cemBD+HrpT/IfkV/dnhxcugMoTqQQUDEgVQDGQcIjkboI/MP0c97v1V+kf9V+lTzV/I/QQ1xKDVpdGP/PE4XbikXkt+w9gB9iP9LDsfmracf1Yefvhg/fvpg9jb0o/5O2doTwkT8TTHtB0nmRR6r1bzSfn

1/jvyICwf8ajwQKVJ9VlL/CvkY8U8fk83buABUMyIDS4UJ6uQb6fGfnd+mfp+X7vz7uHvo4VF7ij+Y4L+HlfR+L4cidjg+fJMHpxj9pn5j86npOpq5bE9mv3E8WvoXe1vvJ9Y8I58lngT+k44oLCf311CYC9AdvmfdVB1GB1nrbeGwJD8KfxACrfvqurf92G8nyJpjH0N+kru+ZlCdxKPWHT9yQYnHbvu3y7v8r/mfqE9kfmr/Wf13KU8EnDMJpV

KXvidiFRyTC2CkR/uftaEvxMY99f6t8Df5vf7Pvz9En3j92vsb8lHlQdSAqsFlhJTdOfD7RSDO5+LR0d8yf+s+xWIzf07cQ9iHozfbf75/fxhxcloRfH0gbCicAHWCqAJsBFb0F9BP67+Qnx+8372Z9udx1CnmJ2A/W8DNIv2cIfMHVdxH77+17sR9VVSt/Zn8184vvZ94v0H+Fn4k98fw2XT4KH+DTkL+NGyqDAfkqB0pVtkv8T1/t4OL+un7o8

+0PeBJflb8dAVL8b93X8Zfvk+iv2IMOL5kBHfpFJ4AStf96i7+G+9C9276EcF76r8Zvh7//VDFp3YUsLtsgTZJ1S+AI0I19I0CWRef2Vei/j98Fnm1+S/iH/8f2X8Ezsl9S+z5Bw/zIKLAIwEYJub96R719a/2T8rfvX86/w39VzLb9VDs7wLv/b8PLjjZlCWsD5ofgCT0aoacALd8lfy79lfiF83f+n9aH6rfu/i4VXTITiQzoBda40jJncPlS8

/k4+APyi92XAXcr9zGfDf7Ge9TxQe/vop+OvzFdJ1aLdD61+Ck8BJwX+ERmfbDl+Jjw2AkHFXvPNUdbfZ8dGUETZhpzxh5UHVQ77/x8sObdDMn/9Q5n/2SAQAC/867vf+196//ZbW/+TNe/+OmqB7P/ieMTQkv97F1JXSRwyhAgACABcgGJAeQBgwnIfe39rOwv3MI9nfzTfV39j3wo/Ra5KlmydXN8s6FxVRH8/E2SPZJ8mP2dHNJ86t2hXYJ4M

Z0StKf9CjwC/Yo8gv2h/JAlF/0ouVbcXoA19P68s/3R/AtQp9kqFJ+lvMDvRIEhmK0vJD8gz43+zeTMfAAuzS35jXh//Gwdd6xn2Xpxwy1Ssc4BwHknWSrISCBdQXAhMphIKXIc4iGymBIo7Bwree5MqamPjU9U0DEczIVMu1CLsVp8wsw4AquQYaQDpWSAQ/gMA/gDxKV8xaLNXTBEA3KEZJQXnT/BJAMcbaQDbkySAOQCA0mymTNZlAM0A9QD2

SE0A5IoPgB0A2/A9AJ+xVlMGrGmYYwDEPnKFMwCb+jUnEsdLALXEawDhyR4A+wDNKUcA9+NerV1tVwCzRncAgOcvAJ6dA5ofANkAgMwAgMUA6WcAzBCAsfINAIUA7QCrXhiA0FFmKxf6IwC6U24rXZEOXVOnC+d8fzFfUldzIDKER9A7JHnoakNUD1BPVQ9Jnwq/P5cwn0s/LldEH0nOQUMLgkwAqakPd1/NW7YknxNDFJ9CALLfOGgSAINPN98w

/y4/cX9I/3B/Rt9IfxoAuX8ToF9EHMIJPz1XU5kpAh+kKTA7n0SCOQYJgngDFgDJjTMHFk93EGJjZMhjtxNMbKZdLR8AFIBTp177JR01dyBTY5IgQNVgEECFAPBAmABIQMdNaECTTFpTUpNlPx9oBEDzYCRAsED1HTRA1p8MQOmIOECmqx2/MqVsvwcXBA4yhEFuMIA7JEVAUcBhjhp/Zv86fynPJYCbL0S0KTBDwXNvX600wlkUN/g8AL2AggDZ

x1Efdy8QtwTXS48k12D3Iadd6BWAeXdqZwfoM88BNX+AmJ1MNy0EWmMYWShCNLcb122LUhcSMCEABsBsKHnoNXZYAOVfH5d5gPLvZqkLfRQAjv9XLG4wesEA/w7KVhM/cgHQUKQg20D/MqMzcWF/JDtzgIj/Eb8qAMKfc2Zu91SUAA8MWnl3YxkUlV+A2B9tN1X5EusbK2WdVKxL6R86OBtLbUKtNTYyqCDtbdVDCCzHVjMKAgGAoul0MyS5NFdb

8E74A501gWyBHxgUSDhrGLYn8FpWKQ5iZXLkdV0WEjmcBZxDVjbLHQAcnlmbLSt0M13QPEYLiHoFX0wPAIJqLH89XUTAqohkwLG6LIV7nQzA24sF7TqtPMC4uULA8LMu7X56M1BeUzLA3wAKwKfaeYFqwP7LPwVRtkDWOZpCFBbA1ho2wOjcDsC4hS7A1OIltj7A2cwBwICFSj4UgMpNNICq5g6ffV0GLSTA42xQYWAINMCW7XZdUFE2VRzAgwgl

wNchFcDqbQizEsDNwIhWbcCZmFesOEF9wIsrOsDjwJC6U8CXSnPAqNwFUSvAnQAbwLcnG/8Is37AmawnwIeeF8DVyXMFIYDzf1JXZgAyhGwoPeAsgAToFgAda3NAq782QI0PW79OQLYXeNA0lHs4By8BH2MBQzV/N1c/NI9xQIdvSUCczzIAsCMKAPrfdvdZ/xuArvcWDzoA8MDFMH8+c25+ygHmCWQqznlBbf8HNCTHGGEQ4R+WJ/kXaGzHL7N9

IP3JMYgjILmoOud7aRsyAyCLINWYYyC78Uog+sdSV0I4AXJJ6H6AWbgPgFjxaYCRz1mAsz92QKq/J617vxWA7DlTCzMUciQ+QIn5dvAQpG44dF8JQOxfP0DfPwDA6f8o/2uAmP9bgLj/JSD5QMh8RgDoHzUwPdd4vz0gsnIDIOr9RGZBnUFdD/AsQVnUGZ1cqGybaLlTqwQbWOEA50aTLCNuW16tXnx04Ts1cICFgUsYZQCFAIFdGlhXqVF4AmMp

mA1tNG1wIJ//BdwxaWjhCWlCxnZTZq04BSKITwhrohTVMdZWnx+WTbNczCJlXP5Gjg3VMLMbIMdMUqDvaXKg350aWGqgu8CIs3qgnatczCag26cpoNvbRdAZkw6g+WEuoOO1HqCDYT6ghB5spkGgyxhhoM/7MaCS7RegtMcHoIwGEWFZoJIZeaCq6j8tXjlloNWg2/oA5zGILaD31j9NWmJzWA1lFlU3wPQqVLUSoP3JMqC6Zgqg86DqYl2BXsCr

oJLNI7lGoPpbe6CNoNag56DjLSTFN6Cf6gMID6D2aVGYfqCfoKGdP6ClXhGgsFNAYLHjIAUhpRpg1tYZoI9JOaDXGgWgmGCbrEBceGDi9B//JGDHMx2g88pCPn2guKcQ3yAAh5co4CO/WYAsgFQAVMBGADCAeN8FX3GfJv8VX0CgxYCj30GHCj8m7g1aMNt2Nx8sZSxwkjfSeKCxIMSg73oQfxSgygDZIK2HOf8QwMUgjOpwwKrxdNd+hA6gAMEu

GBWFUL4dIMWndjInKwExYv52fFx9enYZy1jggHJQ4CeHDfsk4IboGF43hyqHAACUP0XfG9dmLDKEd8AiICwof0I5byp3Qj931whPdiDW/3lPEKCDplwvU7QtwWpSQBVn4nEHEwFSD2Eg/+8+f1agBBN18GWHCf9yAJcFS4C5ail/NxVoqFj/FRdcdEX/NaE8oOFDTTdYwO1/WKwmKgXUXasMyCOxeV18a1qzJw4iaxVgEQ4Sax7VDwCmDFi2XaIx

Xkl0Jc0A5wtWSrJcCBsHPcNAiH/sLeDCACUdYvY7BwAxVAIFzUPnKggiJUtgD5FzkTT0VKxKUUgaBLEj2npcSshDeGQrTgAeOkM6Uw5msRlbNb8ayU2MVeC0a3N6DeChSUfg/xAd4N4gATN94L8rQ+DTp2PgxOcLpXPeTX4L4J//K+Cwchvgu+D6SAfgzytn4JJrV+CPx3fgoaIuvHeABHFb8F/g29EAEIGrY5pgEPjIUBDafBkMQ4gUK3YOGBDW

0TgQ54cV4N8Aw7UY4MWddBC94MJrLBDt4Lh1PBDHTQIQ7cMz4JRIUhCNoPIQgW5b4N3Ge+D7bHQQuhC/KwYQhZ4mEIxiFhDv4Ld+U7ELkTARIBCfERAQkPxwEKEQ4atMolEQjYE4EOMJS+czN2pA0ldAQBKNBPdFQGJAIgB6AGYghv8Hf1z3BADCpw4gi2CseAQdMqoFHEvfeu9eF084ezg+0Gdgl69xIN9At2Cxfw9gmSDI+TkgjKCFIOC/bKDJ

oW3gT/gXODu+KBcv70M7bSCTB1CvKnZNgzuHQHN+3GOSJpDeGygNfhtU4BxA20Ni6w6Q4PUukPMGYwkOqzzg0v949waHTvVFQDxAdSB8AHDAb4VfIJM/fyDafxrgjkDYkI1fUKDRwleQVRRc2SiglJC00C3YN112vwffX3cEoJOA8Zshv2HgwMC0oJ/feSCTn1DAvcdpQCQTTIJUQnyg2mc0f2W/L7NcxzFWI7MLNi2nM2AAEPP9ZghTp3HSZbpZ

nHUFHf0L/Q09WClaonRsQbFTJxtJFec93Dy5Lxg2AgMgd2M0oHkxESNxDCl4QFF6unexKHEHwOeaKiAaAFzAGBs9AlUIELxECHkRfNAKHEA8W3RzpBw6cmtzbHMQ2AAVwHnqVqUtgTv+A6DkxxbreKxfMT+QzGsJ0SBQmv0/2jBQuv0NSgb9VkYoUIR6cOdm9AkkeFCkxURQgmk4BRRQ/Uo0UIUYDFCDkixQzfRsHFxQlttLUgJQlu0wiGJQ0lCU

AX8rCRpZSGpQ2lCfGjhNBlDxMgy6ZlCGTRn6dlC9bD8OLlCekKl8HlCoyAQUX5DHh2D+IVCmyFafEFCECDFQ7f0JUKxbKppEh2hQ2VCwAkrnBFCCeiRQ57lVUMvVdFDEvy1Qz8NsULGIPVCXaQNQzNQjULmIElDR/nIMClDL5CtQi0obUPpQ7SF7UNoMXAgWUOdQ0OxtqwxBekZVYMAAh1dSV1+HebRjcwoAQ/ctYHqAAflWQNNglZCgoNtAxJMe

DW6GXY8aaFRZMG1ythc/e99B10ffCi8vP3evGR9d6C6ZCpCmALi3Om9WAIZvef8dH2ZvAhddQJu3fvVCd3Hod8AOgAmtakQv/XCQuADlj2rg2U8YkOQAy2D7QIaJHRZU6zrvDcFAbh1wK69Z2iH/DE96zmUqUA8skP6/EX9LX3dg618rkKuAm5CikLuQv2DzuFXQiDNSzkWFaqAr4GAtXdcYwJfTQQ93EGr2PJ5eU2waHr5sMIlAKO0PUMQAAjDY

ETww4zdnIN33B5dGx02ZPDQ8QAwwXIBBckVfRv8lkLYg+9Da4JhfRHZFNV9kIdldkOa3HxIAnkhnX9Dnry/3M5D4FyuPWUDp4IAPNdDk/w3Qru4xSy03Ue8bqkw3AMgUDxgPUldIQkJ3SegtYBoAbh5rg2K/an9K4Mc3Yj9wjws/NZCrPw2Q5H5VaAewUnhqp2f3Xa5EnyNfQTZE21dgzIAfP29HOt9QsFG/aDCHX1DA04sm/Fv2HeVjzAodRGNx

AnY1PSJ0MOCTOMD4bjetXQk1dmeHNXZ3YW8Q0Y9fEIeXF6cBqnkAKAB+jmJAJsAXJAHQy0CW/1WQx9Cq73YuEn5MkgnQ7tcpEBCoXlcudy7gzr8MzxdgsTDl0LlAgLCH2HXQ6B9yJni/cb9IfQcXOoRCd0kAVMAdvm+AMIBvgDSDa9CLQJlPVN8zMOKw9ZCG4JKwsqAyglh9Ve5KsMzmeYAGjUuCJzDBDWGKVzDEAHcwyf9LkNSgyDDAv2KQ2gDY

aAeVAFRi+V+Qdeh6FjBLWp8IsKg/E1dWz3p2DfdfVGIwkAAXsPlHMsYPYXU/VD8Hlw20MoRjIEnodSA5IHpABqpXO3ywybCSPwfQ4KCoWAbEQWBu3SB3SdDY623oGPY733wAjr8DgLcvRrCsnyjkZrCpMNXQ+z9ZMI6whTDF4JePL2oCl3qAIpdQb3Uw3fwE6H3vZdNGYCHgCKkKAG+AZwwxsMMwlQ9pTxavUzDocJHQuJDUAO9YCh0Q9kIPVFk0

WTlmXYCgCwxwsUCfv26MOYUQ/1yPUDDckPAww7DR4Oj/aX9F10ygqeDpEFCSBKMC2XECAnCYoC41G3AQMmbuJTctI2dwPXDCuELCSLCR72z/dZI/PRtxB3Cdd0/FNDp7iGCONWC20NpwkGAi4N7geoBwiDCAXIBFQEWPIzCPtxMwxADpsJhwp3dCeGtHYVQjz17/R6EFEBSpCPZhMKJvIDDu72lA2Dc0Wn9g1dDkfSJwx7ROsO3Qv28Kkjj3Hyop

2Hpw9XCyhEaLbAB1IAwwTAAgWBYgk2CCsLNgiu9zMOWAubCFS3SQWhYIomx2BH0b6GFkTuC50L43cw8X+BKCU18q32yfIH98T2Sg5XDPYKOw6gCTsLuA2GhxQSaVIs5yIRzw6k8bajGKYY0bAzdgFeZwaCKgx7COz2X3Vs8bVyPwi9dksKy/M38XINpwiVAyhCbAOyQIAGLAZAB5AHpAUgMIcO5w8PDecIGHKu9JpEdqFTAKsOMNeeIYwjRwkUCp

cKRnYf9F0LTw6DcM8PC3fHCAsMqqdrD88JJwjDC3T3Jw/NdqHTBvcqZ4IHLw8eCbUyeJYyBX8LCACgB6QCBPfD9mMIiQk68PuwWAlvCZsIsw9vDw6yawZMpy91lMJr9r/ESSCkRuLhTwrjhp2EkweXDcz0Vw8P8Z8PyQ1XD0oPVw7R8/YLZkVdCREFJSe5AYlEUwOvNEwlPPB7D7cKr6N3Cevhdwlaw2nyrmDQilCHdw1tCjdw7xL3A7t0yAfgBc

gDkgCgAaAEW7I68Q8Jp3O9CpsK/wp/NJzjwvUNh7Bix0QG4DaC3AQRdB8LMPNJ9gQx42JdCYCOuPUpDHkI/QE7hVo0wiVkcvZTkw/jgqpFtwgG9m3z3QyzCaiXkQHAisNTwItzDcgFgJcMBFQCIAAzCyCONg1jDB0PYworDI8KfQpIjCvnfoZolHZUVaVx5hhC63CXDGSXnQ33dOlUMEPgia3zAwzzDFF3nwmDCSkLOw1dDCqUyCRSo5hRENS3Z9

8MLwqnYPsOOSSYidd2mI8/DKMImPWnDnKDKEYsBsKAWAOegpqGsIznDmryd/aJCOMLu/WHCe2GFkR9B5sD4wzn88dHMcDJDRMJxwzy9AiMkw4IjQdxXOLXJoiIu8ZAiosKUwn+gwpigPXHd3f0MIwWZCd34Ae2h4YBJ/EF98iLBfViCiiPsIvYjOIKZ/FQokIVGjUJdSoF7wqTA0TyOQpojh8I3Cca8hf2AwsGQ9sKHg9YcvMKDAn2DdjkE/dPEe

yi4mUlIZckXZUDJsLSUI95CAQMHAJ3D4EJ0ItQi2z3cQZki5+CSw+Yil31LwicBK8MiAVyA8QFcgbCh5dnIIm9DHfzDw3YiSiL5whUttZjWwjR948ItvQ0hVcj2LS4jO7wB/aAiOwF/3O4ix4mkw1EJECK7BJb8i8KLKCK8/IEPQwwjMOUJ3JRN1bwkcdE0FkNK/Qoim8KHQ82DaCLbwy6NndxnYU3EMgiLTKUJTcSvTJzD+jEAwnbDXSDOA6fDO

iLnXDvdbkN8wxSCu4kaNJRRLn1hnYiRl5g03QqDxiONSHXxcMP6DPmErM0IwiAg3sOzIsjChkKL/EzdTfw0/QHw9+GMIxABe4HfAWsB09xYAHqFRSImwj/DJSOHQ7/CFS3S0DJRt6FOIlJQ6zjWhYQc6sMxwhrDMkMkfTIAtSNsPBhlNl1awqakniOJwsd8QHRUwnHdMCKmWXoAB+UJ3egBiwHwAMvw103LghvCHSMhwnnCoSNbw0GdUAPf4P0R5

4mRZXHY2LDLOJzDy+Qj2IMjcSKkgg7DZ8JEIqDCxCJJfWTcToDfQVdDJv2T/cKAqiOOtKL5lKmtw5QjYrFiwq514sPafRLCi/wvwj9Cr8KowryJKhArIkABawFCRXuAA0FTAKVowSMbwvcjP8IPIl0ibL2BQQN0I9gVIkIsUTxVMPsjvCLtvcg9TkOuIt69biLHIsl8wo0eQtrC88JAPV4i4iJ3Q5TD3D2pwnrCyyLTlUtd5tCIAXABO5jXfc+A7

SJYwrnCdiIfvKUjWyLoIt0jDiNLCLmRvmGnaLhdZwinzAaR/Fi4I+s46oDWwtojJ8NyfR8jhCLIGNXDcCI1whfCsoM+0dixduDYsTCI/lAuwrZcIezIhP3MFvzGIxTC7cLZIxkj6dnZIt7CvKNQeD3CDCLLI2bxfSk4AOyQ7JDyLXAA6Q3fwySioXwcI6y8/51mOLmRZzg/vA3l/DCmLG28KKNLfLHChyKawuijjTwnIx5DCcOnIpAjZyLfdN48C

10XIqaBegDpDQncTtmJAXoB6QC6ALWAqf1BIyKiJSKkolsjHCNkogr4rBiR9a9A+H0IYfV9QxCaVNKj0cOOQ9EiQSUxI4B9x/xAwwb8OiOkggkjrkOOwnojaAM+0U5lhCSikZ3okklWFG49gKIZI1QiNLj5hHyjWSN2o13COSKgorkjkiJ8iY9IugHDAXuBe4Cwga+8bCNt3VqjoqNwo0oiSsP4ufVBYnySoi28AVA/mAm9USKHwqijscPVI3HCc

qNdvPKjj4FzwwqjWKOKozANID2w3b4jyiMMInWttrwvNE0UmwF7gPD8jYMwo3cimyLao50i3qNmwuSjFUFggVEJ37zOGFSjuyNawUiYUHU0oiNcAZF0o6ajgfyVwsMjvMNfI7rCGGSTodfDotyRoVRwjUGso0YBRiJtw/XI2AKNYDyiDqMZIvqtDqM5Ivyien0MIxXBj0gMAd8BUADofN/DHqPgA068OHzRvTld8KOehWMA+IIN5f/CjKmfYVUig

H23Pai9NSIkw+ij7gMYo4+AECJYo6vlhii6wyeCOLx+IssipUkJ3J/BsAGLALIAugA+AEFoxKIoI1h8okPxomgjCaM6o84VNj0WuGhhmCL9mFbD8nTksbcBEtFNo0f90Zz0oi5D8SK6I4MDiSIm/Pg0AsIGIzo0C5iWjQ0iJiKo9R2kOLQYrfEYpiLLo3zpP8Ero61cN+xew8ui66K2rT7CYKmgovb91YPgojtgRNCe3E3MVdjqmFqivZU1ovodz

fRkohe4cmVNwGgNiKIbvcr5uOEzCAGifCPIvaiiQaJuI6jBvLwc+L/N18KOHJWY1t34oEui3yIQfObCbzyivRy4Yr30fYbBR/H0fYS9ubxSvcS8o73wYKS817xkvHK9E70IfOq5Jby3vYq9IQlKvTS9XyMMI3s95tCgAJsBcgEYAfoB6QHCIDNgh6MbXYoj2qNio/6odqg2AYKMuyL9yfVAQxF+QISD0qLc/Pn8V6PHw0GjLaJlA62js8ICwk+g5

4I2hIw16nxoJZoMgQCBvEG8Sl04vVLd0t1pwg4pCd3zQDoBsAHHoD4APgAwwK9COcJmAiSjnqIPfAmjpSIjo7WM5gFhMDHQ4jxnolJCjBFGKXXAU6MZopKCPMLmorOiiSNFxOnkEklXQ5hNC6JdqJKRONWFolto3KP7SHDDRajusd1kYARY0HxgGKwS2NNJ4UKc1SGMGmhICNtZcJzvRFjxfxDjeDGI6Vgm2PzFUTS4SWVx0YjkIYaxYSiOIXAg9

mEoIX2Jk4DAAFNUIaVPxAxpTqUbDB2IQ1CjIYUonwBlg+pxZR0IndMjTGK6uCxijGn8Qaxi4/DjQ+xiMokH+RxiVGGcYgAJXGLRidxigRXS2UhUCZSg6XxjLEhjJGIQAmLUAYaxRWFCYwMMImKwQ6Jjr8Sq9eJisUIfuUXhkmPb4VJjYuAdcMUcbwB3qPMismN4IMxiQwFro3nQCmPrIIpjCrRKY1OAymND6bj5KmNSsNxj+JB3UU8Q6mJz6b8UD

ACaYkmJ/GMqeQJiCYhCYxgAwmOt6aepImL6Y//ETPUGYjNDhmMj4AWk6iHGYk/B0mOmYjbV3YWLI3b9UsPgonS95tCaKbABpXyHgCgA6Qx3IgRi7CKhw16iRGNdIrqiDGTECIhg0DlCjWj8b/HK+BoidNWwYiAjY0Fv4Xr88GKkXQeCHyMzo8MjCkPZol2jN3RuSI+gwSyVyG98pp2JwPf5IiNdACMcOcQ2ha9RLhx5HQ2Brg3NUW/p4hz7DA7cX

mMtgYVjqvTewgVjSiCFYuCNJWNFKCf1X8T1LGM5DCMqvebQkgHg4ZC9pXEDosUjIkJHo/scGf3b/cojnd2voEUFQe2IgDjcLbzqNUjIcfDpovKB4FigI6g9J1VDIlRiqWO9gyMiEiNgwlP9QsMrxYJJGeRikIG4GWP4wANMUEwxfBaMtqMIYVi9to3pIxAAZR3+YiIc7Bw/5eRD7eWbPWNish1lHBNjkhQlgZNjWxTewuNjBRyt7RNiyKRzY/yUn

INlon58yyNrECv9mqk4AVyAV8VJLcbDwSMdI2BjhGPHoo8jn0LeEQCNDwSSQq3YFziY4Q/NhQMlw0ai0n3tYqVdV6PHXclil4wJfbEt3WJ8wz1jeiPYoL0Ra8yRjU5leMH6EFZYbsPrzVbddIFggKTAeNj0XcFBI4JjYkAAeSG/DUxhsuyllJ0BaPTew09ixIxgQHOCRkJ+w/ODNGV6ALqRtP0noXoBCwAgASQsdWMbIqKihGLDo5Fj22ONYwnht

KJO8NgRGv1VPVulUcEwYkai0SJHYswlVCQHg51jlGIMo+ai58Ozo9RjN3W9Yy3D9cNjKVsF5IiRoZdiJvk6NJUDTJDeQg/CfaG/5dIV8pRxKCdkLCDEAWKVAMBN4ZEYODD8KTdZwKTvYg6dxehnpQwgZrBQFNTJdAgq9Cj0EgEqTFcBezFTINdVP/lZQ1polDAzQ3yFpdGOpZ3ltdCMYGaxcYUP/KP1I0OuaBv1NZUyFbJtE0moABydTgWuaCT1f

iE5FM3QYhV5NNIVf+Vo4ioh6OMY46WVmOL10GBFPxz8FDjiiIy445fYbiy8lfjivDkE42rxhOLAkUTjV6WcJCPgpOLcrNlCPwyNWAAlFOL+jG0UVOP6YNTiJmA049QUtONfsHTiaOK1lfTjCUK58RaxTOMZQxZFohWa5LGCkzWs48QUtZTs41BVP+Qc4oSV+mCc45Tx0QFc48fJ3OMvYuJiwAG44vT0BM3s1QZ1ZDniFALjXw2IMMTjQuMk46q1p

OPrQuTjouIU4wJtzPSElBLi9bHU48+RUuPdpdLiNZUy4vTjyYIM43tF3GDy4lBsCuLn0SziW0NGQrujS8IdkWiCKeTskTgAwgEVARq8tiOLvPGiXqOkojqjNkPmuftAy91dA/LAPwVjAJMojX1HYwX9JqJ3PMGjdxxw44ji8OIsoSbBCOM3Y+1iCCVeQ+fc1QJJfDUDP2PoYt2jacPTvKG8KQ0VAfNAzd1UAfgAluz4YvyD4WJgYyEjHuPgY4cck

qRFUDH1vrXvhQUFBDQ+BO1jEOMUY+iB7yKnYnj9nyMWoqMiF2KzmdYBYwk83eRw/WKTo1NoV8NAyEoMI9wXglAil4JMI6BxDON9+e2AFxTEqXQBjknAwKXjFqBV6bH1icT6rRXj+dGV458gQOmuSR9jMvxgo0sjacL1gbT9UwEVAQF4YACHgPijoGMwPFtjAOLbYz2YeOGKCQDC5zhVSdxNzvlnQuDjAaLLfX7iAiIIYzPDybxeQJdjGWNXY2FBO

gAh4oNiSOPUfZ4idICmpZ2i4aK4opHikaLLI8h9Cd3fAaFocgEdIEhcK4Nu45N8EWP3I4niLrzYXUYJZqkuKNsRzWInYVRRr33K2H7j6eMdYslimaKnw1DjKWLZokyjxCJKQq4BmwXooMG0eeLSMMHjONTKqHbhl2PjIxJRFdzpIqnZVTWM5AQCgQX0FQLI03DeAVNiQAAn40Hkp+J+WGfjP8D2cefi3sKX4lfoV+LGINfiTTDn4vEgTf2BY2CiF

iPgok/gyhFTAPEB80FwAHWBMwFNza3iQ6Ie4uBjC+IqIqwN72Aehdjd3uLicE0JyggY/OnjwwT+482jJrxovPc8WtyD427C+eNPUDdiI+OH46B80jDj4syiSaBNIvRlyAD0fFy4XgC9wIx876OwfR+icCysfP7B472fovAT5L1sfT+iir2dZX+iIyOJfQwi+n3m0cRxcwTkgfgB3wAbYvHjFkIJ4m3iieJf4rh8YSI8+F/gH2AnQte5gFyw2HYCa

+MAEhni3MJDIpviFF3DIol8aWM1wunk1ImQgDQcKIT549u5x0EYg1fDeY3PoaB8VQNco0Wi/UDeAJgInOWGRTwhjkhU44wSmnTMEnXcLBMc5KwS9CKO4z3D4KL+fDLDcgFQAKx11IHKLOFjtiMEYyr9W2Ke44Dj6CPseTR43ZUfib/jxGKKWcaMxBIdYoMioQ2Z4r98FqO6I9njTsMXYn1jQeOegD6hw+OI44fiXkLQwkwcbhheQY9jlOPn4hfQh

DAsEwAAkIj1cQHkDOQ146c0qyBPRG2dJeKxYa/8f1UfKeKUpFXp2YoSjGC+5OP0jBMqEvTkahKaEuoTw3j2xRoSSemaEzmsFygnFa5oSuIyhLoSPSxWlAgg+hKqEkQhBhPGE4YSX6htLCucmhMO6SYS9ymW4uhU81iBYqkDT+O5IrAiJX071CAB8AFfw2sAsgEDPRtisKPu4gDibQPt43gTUlG/4AeY3uNVPW/x691g40Ajh2O942vjYhMXjVL1p

2LYif0c1GKKJZQtgeOD4v1i/kCyE8Esv0lIhc4BkVDiXM4d2JiPYqnZ3DWy6QjoZPEYzWPxJdErnBfjsRI/PVNw9uJRIIkS3sJJEoQAyRPyeCkTTJzbokQJzqJfY8N95tHwAOSAqQ2tEekBeGOao9Wjb0MJ4xFiC+J4E8/V3cntHR+I+rwr4hSIVvDxYtpUMqJGvH3ik2wJHWai0ONUYj1i/33uQmETIBNjKUfAERK3Y55CyOIu8AxjDFw+Q74p2

mBLQlRgrmILnbEFK5wSYy/AkRnR5H+CquOtWShwzOJOsVlxUrEn4tfoU4Ui44xgo/VZQ2F4siBYRLTk6kykaE/B6RPonAJirRMXsKT1iBXpdf0SVkUjEzWwltlPnfL0A+FxcJgwyKWdEmSR6+lyreggPROX4r0SZOPnqX0T1BXjEz5xRUBYRaIDiAXK9eVCIxMtEzWw+9BjEqkS4xPNEjSl85yTEtWwbRNTE+0SQ+jd+J0TcRmzEm7pcxJ7FT0Tf

onrQksTZLTLEkHlKxIrsasTjqXDE0ax6xNGsRsS9aUGA8tiCfzLIld95tDkgTIjVAGV2Fxdf2KbY7CjmyP8EknjUAMPBA1BvqA9kSmi/hGujUfxmKGiEsdjSWInYhvj9KOb4wki1RN3Qv2D30ggEhQi/WOESXUSoeMGI2k9BePIhDo9Uf0uHAoTTcwPxJqF1CNgko6ijWHgkvH91xOGA2nD0P3m0XoAsgCbAGvIugCfwSaBH+P1Y9lc2/w6vbMA+

i1TtYHsXeKx+D8F7OAVaRejKKMBE8QS6+Noov3jYCOkQTjU0hPygf8Tj5RgE7IToeIj3A+i5yNqqe8FuKJQEgpAmGPgoqlBCd1QAd8BMAG+AcMAF4AYHNgT7SI4Ep/jnhP6HAIS2F3Nrf1ie2MLTQp1EC2hQacd+yOlwnuCFRLvIqQT9sPfExITMOKhEhz5LgjyWBFAn4E6gMeYN6EUqHiTERMGIhbcjKkco0YA/vmLonajHLAIAQPAc5BLGC+Ee

vkAwQKSugGCk5UZQpIQkmsB8wRSsSKScbBCkv1oZaP0IuWiyyNy/ebQQGNwAcegNADAALWAHqJz4oj88+JwooUSdaPhZOWQsTD7iMISBNhc4NmR/+KMk8Ai/0NjQRiThyMQAUcjjT0WuX8SV2K4k4ANA2N4k55DcV0goSPdUyMEk9uZNBET44+idQPEk0vDyi0J3O2MKADriCFogiQeE3Gj/2L8Eu3iNJLeEu9AMGPuoCdCKeMKdE5laeMakiBdQ

u1MksTDQ/wEI/0ChCPQ41nikhPnY5ajUQm6k31jYyjxgQFR+pPckuQZ5LGjHEY1RjSA5RIx/JLikwKSrgCikmUBjknCklKwQZKSk6KS/Wj6rCGSxSlBkmKTUpMcE/yjacKJ/ebR+AHCIbxh6lyHgFkC+RPFIkqSTxM2k+Bj3SLBoSeEe2MtY7spfJAmEZu8ABJiE7Kj16MhCOi9hoQ4kpY4LKAq2QCTg2IMLaB8BJNpYnRkuLzQE5B82bwvo1IQK

GHQfV89jH3vo5e8SBNXvEW88H1fo6x9SH3IE5O9v6OZwdS8FmT/o1viX2Mt/ADYoAArXcADOACF9JSTxKJ8EwmTQ6JeEraT4kM4sZA59pPjojcFxpCCkEZI6ZKfErEjAf1fEjOiZBJb4tIjTKKWou4CzBGek9ISZQATZNyS9RPomWk8H0F9zcLDgOSNE5NgoJOPYzHl8Mj5hBOS3sOTk3yi0pIrY2nDy/08VMIAIADskDoANAHrw1aSVJMIkr9c8

KK4g1R4uKBDEfwFapIcQcZJhqP+E+DiGJPpkmiidgnaIlmjXWK9k9vVD6NOfJ2BiwmU1V2BnJPEfTmTI+IWhYYpaz3yE3glChKp2dMAcyWMg1WE7tW6yNCVFbUQAGeSFCDnkuhRVCCcIOIgl5Lew1eSXKTeNBeTKNDS5eO0gqEpAq+dThOSIkADdc2LAd8AOBgoAFWiGyKPEp4SNpItkkmTNj0gDbB1+yhqkw2M460v1euSh2Mbkrr9zpJbkp28W

JKCIicIA5M4kpMIlZGHknIShpKagEaT9BI4on+ghJImk7UDGGOSIhtNCdxGwvKBq/zCQ42Sg6LmAwrDuBPKk3gTSMhZDa98sdHL4sZI+4hyWcijPeKXooBSgRIukhXCZqPbklUTZBLHg72S2+OWo3wx1Fw9yE3DBaOCSXjBNZk0gvvAywh5DY6AVHBRPVuIkY0t2PQTScIME+GTEpMvrMGSwpPikoKToZLUU2KTlFMRklKSzqJQkqiDacNpA9VjV

MnfAJ/ACgEFmAiSqCOtA9SS35Jt9R+AL6H5XOOjwhKQJZCBX0hAIgBSveKYU1qSGZJHIq2jjT3/4SBS2ZOoYd9BYFL4kleZEFMUU5BTLAXGkkSSGGMOQM0iyyP1A/ijGYFrAVQA3iXXIwPDDxMeE9aTqCNfk1/jdDV0PWWgPZGoUv4Q3LCU7HjcsGJEgn79gFPHY1uT06OVEyySMOMhE99NOaMNw1mTV2N4wd6SiOM+kuJUVciDlORSnTwWEA+j1

pHhkneBQZMbZPmFxlO6yVRSnlDhkjRSJlK0Up5RkZKfYsZDS8Jog+bRVAHUgZAB+EC1gLWAbuP4Y02SBRPz4khSA102PN9k56LHHXtjGlT7wJ3MEZxOkmJczpOYUkBSSLlovPVB2JNw4qBTi8CRoPqTelNDk3TQeZNhopATXaMQfE+jBZLPolB8RZNI5a+i571vohe8pZOEgHB8FZMIE8x9FZPsfOO8v6MoE9WSxCxLPQwi3IPm0YEcBKi6ADQBV

AD4o7wS7uLyU2xSx6Mtk1ACkqQcZFE8sdHzfP4RkVDp4dkNHxKAEqi9sSMZ48yS8SM9kj8S52PVE6Mi6FmCUxMIflOWtYdVIzU9lGMBoNkEUsCTREFpIyCTJ5Ogkw2BU5PgQtVS+qzVU1ZT9eM7opwTS8M1g+bQ3FzCAcvJxvHwU3kSipKrgk5TSpLOUqM8O2NpSGDZWMAoYyiTDjTv2ewZ/5MaI7xT5RJeU+pSkakkg+IT/Py9giETPxN9ghdjN

RL/E6BThpHCUzIJlvDu+EJILjRjHfhZMRLTI+HJJQF6gQwgvdCEQXgg40OaiBVF9zCjSYSovyFTUvESM1NlJUxoFUJphXNSG6MuXAtTrs1TcEtTB/jLU+idUpUrUstj05I3E2nDC4LVrWYBcgAGRU9D/FSLk45TOBMFEm1TGf3P1ZCE70Apk1xTmMGImPa06JLlE0R8WpObkn1TyUzfE/lSrJNaUqzs9hzDUnqToFK9AKNTSOOj4z5AY5PQ3C3EN

YHaEkjstK1PnHdYfKQApDXg8Pk3sIwh+mErnR9SEmPoBXtw2yTzsUQgG1ABjJ3VN52RBH/oQUz4Oap5CABV6Rvot9AHtHwdE0kLeR1w3SWtFHhsp1DlQutDIuPbEkc1mvEdcRpwCbALQ01DNfinE/9SbcTPUigUL1MFGK9SqVhvUlOE71JQbB9SqTWfUqk0RIwzE/sTP1JSxTNT/tT/U140ANOP5TmFg/BA0orFwNIXsDT0oNPK6GDT7Yjg0kutE

NKdQ5DSt5whIMFxVXHQ016UsNKLQ8lCLULw053CCNLjFIjTaxNGsa9To0KGde9TaQBfUmjS7xU/DejSP1Lj8etTsomQSVjSxTXY0rmIgNK40jRhWRl405m1INLJeQTSzMBgbZZtb9DE0j01xuMk01DSZNJo8TDSTUIU081C53GU0//8O6JBY0vD/EPm0OyRMAAwwK7j+AAoAJqjsaOsU9h9R6KsvQpTUANJESHshIQSUUYNHoUwTa4ZPKA5UiQTd

sN5Uili11JaU4NSc6MnzRTBRVOEUuEx91L0oQwE8CTlUsYBNf0mNOOSsRNn0FQAU1NSaPm5o/D60supmxMG0wtT+tLU/HVTItKwIiZCwqW+ADoBpAHYGTYijlMpU3wT8lLsU1/jO/zTCIT8QalcUpdlooAf2TxSPVMYUr1TfFNeUlooOpOO+ZVB6tOgU96gmtI+VaB8olLF4snDlMM+IhGj0FMSUmaSsCODgQnch4A6AHhjPBOL8HJS1pNW06lSM

tOFEij936Fg8POjnVKOLCHt6wT+ErxTjtIXUupTnxIaU92SmlMq0u6TrJLaUlQpOME6UhrS2hBDkoCT9vAW/BRSntIME1RTusj9aenZKdNhkjftadIcEtZTjuKwItUd5tGMgIeBUwGaqKABwiAh9VLSLLy1ow28Zz2jwuL1FZDBUGHSLb38kf/DxMEHYo7T6JJ8UpdTUdNAU/xTCGM6kgyovlJCUujBbtKJ0rmSrawe03mS4aNe06A98F2mk5IjD

QUJ3XAAoAGQASehVAFcga10gdOLkmxTQn2JkzLS7VNKgVLQLbj6oymSJ+Up4LSIRjRK0piS0dJxI8rT/VLB/LHSN1OutccincGu0n5TlZm10keS2KFJ00ZTDYEp03AhqdL5hBnSddwz0uYjDFOvw+CikpzCpfo5FQHoAOMADij5040cndIKUngTD/AwYtXIeryMuVxTSOX5BLkt/dLak1zAAlNdveRxo9OoYLXSPpIBU+7T+JOBU/JdDdMRoqaSM

FJfY7iFCdybASIAQTHwADoB42nt0wdTVJJfk9bTwdNd0kWAO8C/zUhgdtPZ3FrAEnBb0lhT+CLYUwQjWaIFU+QSQVI70tRd8dJu0wnTe9OJ0iaZE9MBklPSEzmOSLPS+qyz07VSSyN+w+Ci753m0NgZJ6CIACgB+Hm3IgdSVtLNk5/jTxJd0kDjrECKwU7wVNBdAjn8UlACiSkR9cH30s7TvP2D00ESWeKMo0QitZI5o2GdlgE9zH74LgGEU8dA7

tLpQc5li1ju9VJJ59y60tMjRtNrU4bS+j0yIXrSxtMYM2KTo0hYMhgyCGmP4k4TDePgo/7CATDy3HqF+gBcAR+TclJB0ivSV9NIUhsRy+Ub0luD69PvhLhlKiNQM5dTztPb0kX0rtKv0n5TuKDIM46B4t0iU/XTqGPQIj49+ZLH0jvEEwFSIv9YyhDh6Q6gIABYAKAkF9NAMq1SiZMr00hTdDSqgAKIuSwqwhvTyqXYuaQi51IJY5qSUdNdkifD0

dPYU5pSw9Oq0rDiJv0XhLQzqGDCkXQzPkCwTOLdj1M23Y9jVFM2yNPT2ugyMunSq5hyM3XjmRPMM73D5tA+AAF96QCBHJ/B2RGt48y9y9OmfQ1iSJJUKG/wlhG8MrSZGMGrBITDHlOjXZ5TTtNUM8fMwBIA/LvS6MHSSRIybNDqQ+Mc2Lz5k43TLWFvPIWSg7yTQcWTMHwjvUx9kVIIEyx9iBIIfUgTxb3soB1kiH34LVWS1L2gvTWTuFM0ZKCBE

KP6ASohawEnoWoYjZPNU5bTc+OcM82SpDMZ3VADmxGH5ZxSJQh8Mu/xfzkO0/FialJMk71TFdJXUj2TZ1z9HF8jcDMmMrdTvvnV0rpSqWhGMqwVRYi5UdAC+/Ajg+acnn34YWDSmuIU9YTTMTIGPDEytK3PXYZDCjMB8OCBEKJGaDoBLzSqRRwz7jKHU05SIDNX0qAyOVAOQqqpMANjoiflUQiSpRJIEdNl0+dTalKBE5DilGIskzHTsDLBM44y8

DKQJbdSXpJ+U0Vk4TINEu+BUjIx3AwTrnSDhcfIxUxn6T+CC+gy4mzitZV2if0TtEUqefSViw08Rbl1KgM3WBGwa5n2kBMwpqA+AF6ww52HnKxEeMRkzKMTCGX5bBdQSGS3RbDtU5BdnMmly5yWYwINni1jEprjXGmhQrrwNTNW4rUzMhR1MzeTgSn1MwmVDTOX+Y0yoJFNMvFhzTNi6GgArTJtMoecJZ0PJNBEOsydMkGFotglpd0yo9E9Mhucy

5ycnX0zzJwgIWYSXbnpdYukyNJDM4zpNTPK4iMy2Al1M6MzFdANM68NvsQTM7atliD1GfaQWCHTM0gBbTKzM1BFRVlzMzWxnTILMt0ytOg9MyggvTLLMxkp9IT9Mx5o1xLbU1CSvInkoIEI7JCyACAAo3x1UKkzipIeM8AzndPpMoITkflEGSKAza2/k4SEQpG1wLiwVDMBM85CMdJBMmf9Z2LP032SsoNSUKEyQeO+Ul44Bhjj04fjxpF/9UL42

KKk4Plih5HRACoB82z0pfOQA6D/AwqUpaSgspEZ5WHkAOCy7mAQs6QUpIDrnGBFoLLiBNCz3Uh3GRCzRShdqDmovhxqJOFBEKJ1gVMByd1cgBYA5ICW0/HjF9JLkl39w6IXuJiZr0CUo8XTuymnhLEwSzmdkzlSx/wB4sBS7iO/MwYzRYGkU2/SddJm/aB89SLH4+HjjDMLXBJTTSM+0qZYaoEsM4o15tFcMbIiTRVTAO38QDOpMpfS1tJpUs8S1

9IFkREdQoERwrfTbzLS0DFoJggEs0rTgyKukl1iOFM7ksCYxTJCkO1ht6Aj4rpTmiRr8ea4pVOe+aDtwiJso2Sx5TIX3Z59KSA2DVK56dnzQKKzAXmDgPqs4rMHqBKzLt3XMoxTNzKWIzZl2dIWAXuBiwALuQ8zLVJpM61S6TLcMij9IlWIoR9AbzPDbCeYjrh+M2UTAjMgXRdSXZP+47JDALhcsiIzhTLZ4h6TF8PPgH8zYROgU+7ARjO1wJAiC

TEBklT02ONPnJcSUbEEMbqI1rEYADtBRrAwnJlhJ9DKY/Zi5KRMaEJhYAXOzVcTPNhy9Eyc6xKNnKMSGs0PwXgAgGglgddFwpwyINazqmLAIDdQemi2svnVBI2rM3B4JrIOsxcSjrI7EkTNTrPmsxazLrJWs66zszXWsqAU6mEesyb1c0GbpeDtJtIvkk4yrN11zIgB85J7mYbExDOB0sAy1JJMsjbSe2GIYG9AuaO302gMEwmKwZPDOjPA3c4IA

TJCM/BjldP940nEZ2nEsgJI/lMh46Sz39kPUrIJDDKH0rDcjdNEkwhcKLMy3NHiSMBtVE+AiAHDAYkAx8wMso8zirJcMp4zbVIZMlQokfGxwc992N1YIv4Q0YBcGUqlHzPJs+vig9Ocs6QTXzPXUqIybJNYAT6habNRwEYyKWX5onvjxgE3/JqAEBNTI9aR6QABAFKyYrL5hO2zRRGisxKyN+2dsh2z72IVHZdp0rNz0nypIgH38dUctYG5EhYBj

IHsMwqzjMLRs5fSMbLPM4mi/IkPzUih30K903hcZHGvfGXTfjO7gwljgjNas7lT2rO1siTdT9PBMhQTXb0S0I2zuJKks+PTxhHeODX11NHCszDDMgDesy9TDrNhyNjTvJz8QAkoXfmVJDzTiNHXneLtFGAjVIzjpGlPpHayIbL2srD0m7I+sluyrNLbsjMkGkVwkUDpu7KL0XuzPnAHspkUt6mHsnlZdrJ13RuziNObsqutRUCgnOJAO7PnsqWV4

NKXsg2d+7NsnQeyU5Fr+TezR7LzWKGzP9OfY8wyhggr/LWAqIBYAfNBiwFL0/GS9WMd0uoziJI0ZQNd9HH1Ic1iZFT/zI/wwoBlEp/V6sOR0smyc7PTwkSzraMqWfqMQl0mLBao6bJGMxHdq+Vj40aSSqIT497SVLIoslcjebOrAIHCmwCHgcIhVAHNlCOzQ8Kjs4yywdLKssyyhKH73QBcElGnCIt06P2LWIa9ibMC3ZqzBLLTosIzj9I7kwuzR

TIhM1gA7qAwhISgMHKeofPkR1TLCaVSkCUW8IC0rkDZfK2y67OiwxABAXhds1Kyevm0cz2y3sP0c3MxdHIvXGd5obL4M/2zzqHVHFgAaACGfXLd13QIU3VjKCLS0g1jAHPI/V3TjFjSCa5T+8QtvQAQ+IXss3hyF0P4cwRyBTL5UnWyqtMFUr8T2+PO+Muz6bNgEr9Jq7IH8Maz5LPWkapQYLjT1G0STrLmss2w5IEaRdMT5uPonG+zBejKYxAIZ

nFl4FbFveEfRWcYmxJ6+NJzKnIQkDTSZrMX0bJz4uDyc9HkkuPXsj/oSnNy2YCoKnPb4KpzfMRqc2KS6nP6chpzMnORKZpzAqESIXJz+0VUSEGzcqC6c7M00al6cz55+nMuxD1EhnPdhR+yT+Isc8qZIgH33ebR3wCdweixZgHCIP1oy9JRvAXSZnyF0xVBu2UZaRHDwaGEhBMAOLFJEaByk61gc3kyejKfM8TCVdI0jY7QScAFosYAMHLFCAYRh

ZDZYgNNmbLksxAS2bNUwkfTm8APQ1SypoGpjDSyF3WrAVQA7XTCAdABwwHwAG4yUtN/s5xz+dPS0zh8mHOlsnsp3WmiCHtiJgiLdHhk0VHoUhuTPVLgcr5z1bJfEzWyj9Oukk/TdbMickNTaAIYofqytRJ+U42zALOe2Oa1//UjNf6T1HMBk8MBKgFdsqvZpXJMczVS5XP5ZIv8zHKfs9ZS9nJkPcFibwHHoDDAJgKdybPi7jLFsoyzQdOJc54y1

9NhJGr4ESJ8c3619HHooGMoHLMVEqEtVx0JPCX8InI/M5IS7gN/SWJzhrMSc+TDknMo41pQlOKvAQeoCQDAAMpixzMDOaGZhM1JBZYgGfCmIeQABCBoAWClUrCrQ68AyYjKIbGEmuhoAZ0UzMzvslvp81L+jINzczBDcsNyHTO8zReRo3MVhURg43ITcpNy7UNTcgZB03K3ArNyw+B86XNzxEI37KzM99ELclTFQ3OzNcNyG63esYToJrBRhKtzR

BRrcrXxk3LYMIcT4gEbc2CDm3JC6QZyt7IvXbZzeDK/0/2zLqIEopsAPgHpAVqZ1IGATUWyirKNcyQyY7JJc88y/524oHcBKXLe/JgQTqg8ecdA1bIQc0IzQnIq08JyZ2KDUrlyatK3U+5A/Ei0E0YBV2K4saNBjBEtwnIS+ih7EWY5e/HRExNTUTM5fCwc61QyA3wB6FTg8nJBNiCsgjfsGFQdQ5DzbnlbUlGT0pN38SIApj3m0AM90ACHgRgBX

IBp5Rxy/2IkMgBy64Ld/Ulz8dliMc8x30P2LXxzE6I0UN5ygu0zsoIz4HOAEt2Tn3JD0l1zIjI/c6IzoRL5c8NSUQhUBEVzfpIkUshjjxxTIpBTj2NMgeJiURSnGQGZJ3OPnfG1BIyYCIcSHkS02PLlDtXNEq5i1AEHlTSFYAnHydqJtxXAIc5oc9l1NR1ZeaQXsvpDXhxWcHxgA4jKFDpwSRXzBeDoSzA9E800L/QJhGW1//GBmY1Q6ZX9QawJT

xktQvCV3SSXkTGkG1EERbNSK1PGiOUh4Om0CYEp8CG6xRqt4EMU85LFyTRU81GY1PJ9M2sNYAm08oNFgm2e5fTyLUMM8huUxw3TWP8tNkgs8yOhNrGs82hILiDs80+zmkLbIFzy9PMSIdzzSrBYILzyfCBb9XzzzYHyIVXVynOZmQ7UL0WdiYTw2AGz+R9oj7NtJNYhZSDi8iZgEvOwBUgIaiEUYNLz23KrmTLz5WGU8nTTvADy88syCvK08+tyd

PJK8uAUyvLncCrzjPPI6UzzavMKlSzyGvIb2GzzmvJecfj5F7L8yJzyVmEkYVzyuvIOeHrz8LEmIbzyBvJuNPzy4SAC89GZQZl7kCbywvOAIabzdgVm89uz5vKAFJbzU1IyYI34AAnW81Ly2nM8QnOCItJhs8wyFaOSnK9l80EVASuB5X2hCHGiHdJccoiSaPLtAujy2BFGjR+BsdlcUnvxjvB5/QJyTkMk/PcdgROhLSZsA1IKQ98yi7PP069IU

/0mwaBYQMioyBQEhQOHhTigmsDfSZ3Mg4Pq7INtGRC0iBNSQ3TF9bkdo2ImI9Nj42PdAEIcZ+Bv6Bfj82IlHDoADfJIUI3y82N18wUczfLsHQ3yTfkO4pnS9VPKmMU9EKMkAYvwn8DKNca1aHNsI48z0bMYc01y6PPiSH2R/EhZ8yjJvWGNoLwiGFLl0jM9ufPmDA/S/VMwMhITBfPfct1yerKygywBUCTvYGdg+i3foUYQOhnEwHa4ZzgV89liv

+FSVL0BYaCTIjEToPJ3/H2gSDlTAMkFcIKRLSXs+4xoAP/96dnr8xvz5iGb8+4sVAz//PqtO/PesJvzym1780k0//0JMnPS4KJ8qeoBX7Pm0LgANAGQAPOS7JH3cijyn5KpU49yA/Klss9z/qgcQOeJ1o30WBvTsWi4oQf9OfI3POPyJqJ48p9yckOEc1yzRHK7ksUzM/LF89xN8oC+oaj8kgiZaIvz5fKdzUvzchO5Y0Xi3iKMY640UW2C8qrMn

xlnMugBAiFEVNsgyzXWRQbFiwJrUHKU+gN8xZtVcxg8IVXtoBzAHKmFhGBbjVRhzS3cbJghA1gG1aq1b+lqgmMNz+EsAVHMbxzkpRlVLCEsExHkLgTgcLcgoTXM6OlCqYVncEPx0AHi7UtUL2OACgxtdvI76NbF6SCgCnxgYAv1pI/91wNA0V8gkAos2FAKlmCQGdAKiDEA+fpABTSwC4axnGhm2XLN8Ar2IQgLqyBctB8Z0M0YzJoQKAqdLVj1a

1VoCuwT6AtJBRgKqSCizSVxWAsXFGuojni4Crbz0Kj0bEJscGzTGd0yIAqEC8SdoAoW1dMV1/VICgsha1BMAmQLLVVQCmuQoB0UCxXs7jVUCnALYmDwCyFsu+iw6XQKhLRTGAwKCs2MCsFZTAoA1cwKEeWWpMkEea2YClPoK0LYCxwL9NmcCtcycPIzkryI+0MQokExMwDkgLIA13XoAbmU6BhpjWYBjIHqAdSB1IBSUi5ypnyuc+oygHM2PY3kh

QLAcj8iylKuGX7YnkGEfU/yqKOWFSGdW9Iu00Xz5MHF8l/y8/Ol8oNhP/M9yb/yZPLWoR7SonTh4uciwpk1AyaT4XJN0zRl6gET3Uhy87hNiOSBiwDy3EWzV/PEM+hzjXO1owPzt/IbEF7QtwX381e5yn1QdN9BORwCMv4yICMzQf+UL/K5U3jzr/PZckRzOXLT8oVSSkMz8xMBs/Il81/z8/KhoOvxtgr0PRXydGOgffRjAZIqiCv455G88tf1Z

SCnYKRDlHUprYTw00MMINqAKQuAILaD7zlY8ANJmK0TLYdt2ohYAHKYrgEMILqxfik2geYkWWBtLSsV96U6iNCVSXmxhIUL9p1wIAABCyIAMMAOSAf1NAqSCpggAAEIB62tiDGJMmiOedBwNAFSsHsR5QtlIVM0ndGoMMFDnm0/7ceNi/SxtYkKfA2AIckLmKxUdVvzZSBpC5mCZALXgxkLNkm5C1kKeK3ZC3KZuQoMIXkKGAhIeCUlBQueLDpwN

klFCtLlxQtcbKULGAFlCg0LFQrj9ZUK9iDVC6NJfME1C1+oRth1CvULzgHjCjLhTTSfAE0K0K0j9CSsipTrnK0LqCBJC0/1bQtdC+uMHQqqzYAhnQrpCr0LugNKTJkLPQrXgteMOQq5CgNJ/Qr5CoML8wOjCsMLHYjFCyulni188OMKFQsKzRMKjmOVIFMLMiDTClFgtQrw+e34kJGzCroBcwtuNe41jQrIafRt3+hLCiiDJ/LP46fyDnIL8cIhw

iFyAd8BaBwp88RR+gqtAjfyTXK38uOyrTy6KUfAVSwlE6/wFckmwV+RNKLngInBU6IdczqdgTILswNSRTPv88RzgoEDTPqymlV7g+xBlrihoJ5VPlG7dTwy1Hz9YGNTftnyTCeZ1fLENJNT1pHIOAaJBRW6TFbpwWy8ld0tjkjwiljwCItzbZOlsKwxLYEsdd3IitGJKIsvkUBlJQv0JTEtsPKd81GTagsCo+bRkAFyAbChFQCfwDoBK/3kAcIgn

8EsANxdJ6E4AIgAYIA0AK2VbwuIU0qzzlM4QEsFwwXZLadpVS18cjYBc5idg4ELOPNiXRTR1Wl94ymzWJMf87vwiTE9zYi04Iq/4aSoUcD+QTKBGeVn1H69hIByXaFzc1wIcmnDagqqom4KzREiACABFQHkAVQAn8FxcynyFIubw1wyPgqfCrhAIUEhqHtiGANoDTcAHhXdUjOyPnJwYwyLjgLQMy6S2XI6soUy90mMosRzi7NYsc7ILIpgiySob

tiuwxCLlvBhUHTsvcxSMwGSZs2HNG6x6EQX4hqKWI2ait7DWov9LKVFGRJ1IPXjVXOZ0qZZugsQozAA3BFcgDoAtYEDw4sB1IEiAbABMiNA2ekBVAFmAUJ41aItUyOy/fOjszfzGfy+C3Qsx0HGC+KKPd1jZTvB07IaskEK/0N/CoyKA9KV09qT1DIkUU4IoIs9AUqK1vCSCWyLKooci41tMghrPbJdWbNzXRSzyqO/BFGifIqQAGgBu4WL8HZAf

fKeo14L7wveCx8LUWM4QeJI7LIY/V793wr9ybHBBkmK0vSLUotBC9KL/wtIAxpTwjNyi95ocDIKikXyJFGMce6LLItgim3Nn0gqimNAqosciy7RCwk18lJyq6EyyDqKCjMPCs4TBoqJ8jx9XIHMU8MAR1G8ANd0ACFyACAB+gFrAJsBUwG5ZKnzmLP/swYK3HK4wnthnnOLWdGKkYsCBYRIh0C30n8LsYuMi66LfnL5BZ7QaJJjCes5+khu2c+A7

IqQi6qKtHEzXQfSsd2fcNTCeKN38eoAPaMBiroBPIFTAVAB8gCxo0KL8XODoliykALYswISootJ4YIFbYLSTRKjfHJiMJSxEgi1inqZ/v2+crKLmaJv8zqy8oqJisCLCoo8kFTAfkHkVQ+h4aHeE8qKGgC3oAFBa9MU3dNcGgGgVaL9dlzUc728mYv9cxGQxAB+qLS164rewuSAm4rzWPqKdnLXcl3ye6Pm0eoBx6DXTWsAwAAwwMABwiCyAbCgd

YHQAYkAFgHoAQ+0xrkKkg1zD3L9iiPCgONdyUaF/8PJotJNNIpCLejVvFnig7WLLortEZYLJ8z6KVVBcpBaPBo1TYpF5WmK3opQi63A96N7oVyK8HIN0tIYWREFmEvCXfL1cwnc7U2506ehVgHBijWjZYqJc6GLR1Io/SUFb+AO0MflIM25xP0Rd4spEU6ozJK1swUzX3K6s+6SEQtOwg65emTmCM+KGP0Q2K7DsbMySQwtoVyYvWeB4wnNPBl89

8Jrim2zBajEAcuD6dh1gahK3sLoS8uD3YXbi1dzn7MB8eoB4L3m0DQAX8DeJTgAJHAwwVyAYAF6AbVVhwF6AHWAqcH2QMKKnSNPM6QzQOIf3DbCNIuRiqrCieFCkTsEtYt/lHGKQHyQc409oaBPi1NgsEsaNGllzYrpi96LqzzxC76KIDydAaxhcwD+i+oA1dkJ3D4BMACyANqYwAAu4v+L+RPFsx4yT3Mii2GLSJPmqN9I9os3ihu8rAwM0XeKN

Escspnik/IF8wTz4Qqic5ai1Fz0So2KvsEMS97hjEuvineVaouA5ChL5PItxG3FvKPZi32yp/Jd8tVjGYDAAZAAiAGMgD4BVABIWXuBMAHqAWsBjIH6ACgBUwEP3HWB1IDywn2KiFPCiyWytotA403B6NUCSpRKIIFCodxM0XwxigcjxQL3ipYKbopW7Y+LDYtig8+LnorNi16LkIp3lT6L74osSla92bLhcgr4O8V7ilFzyQxIwOyQdYE4AJ/BU

wCGqYAzngtRs9aKGHIfC4BK19PniHjhRgDfCyjJN4ChQD3j6XKR09z9zooyi3oyE4sb4xBLgItdc4XzPzK1wmeZpoVPi42KUkppi+yLVkoZi8hK5POiU49i/wj5hQcI+q0HCZhKiTMdit9jDVKbALWA4MDDs9nDbjKYspwzPEpPMiKKYYsjo6xAb9lVyT/i0k0o1dPMclnPgKQZd4rmHNrB+TOhCnKKkEpTi0CL3LPAizPyd4DNqVbwL6DdHJhYa

BFZxJigqWh7iRRzf/JlkQxQlVKO7FVT2Mn0JY8tu1VSsO6tuay3ISggcq0GsIWtpM1HpL8suvUYAQAAiAhNMFuL6QHVSjjprtS7UEdYGWD4xPuMjUtNSn/xqEstSxC5mIoaFMj59Sn/AkXwSAm3CvtQtzA8AP1QynCdSjZIMFQ7LHwAezFdSlZMiIzApYkhs53VsC5hedD08KZhNmChBQAJDaSlTYNKTTFTANSVRIFhFKNKXy1Krc8t0bFC8daIT

pTVWJ8BqyWsHTQlVUupFDVLk4y1S82AdUvWiX8toHGWpAdZHUrNS+uLXUrc1FbZjVjtSzMNLgyctE1KTTEYS11L89SueLt5PUr/A2cDe1H/8AsLb+kLMINLcCBDS9hVw0q9MAtLKawzA9sh0yDsHAQhE0rbIZNKGHD5YNNKtCAfATNKV0uzS3NLrwHzSrmsIw3FrYtLbS1PWTAxknkkAStKOopVSoqE60rSrLdKea21SjE1cYxl4VtK5aW3IFQBO

0vi4btLR+m3Da7MjyQHS6NLzyCzS51LiQHHSlxpJ0qwFJOJZ0t9ShdL/UtwsZdKR0v3pMNKYCAjS79LB0uj4QaxmNHjS/dKqAUPSteoU0vUOU9LKkwvS/DKc0rDFPNKSMvgy7dKQKyfS/FwNMWIRd9K81hVcjuK2Esdi07j5tFTAWsAdYHCIeoBsAHzQSncKVMMsxeKYqMgMz4LFYsVkO9IUWT+ChvS7tGUsJTB4oPP8xyy4hKiS0PTwRN5SiuIe

FLuAx/zVguf83PypfIOHI0IsQpL8gNNT1FfgEnAL3Wkcrkd4xwaQ6cQeSF+LXpBfx0erFiAL2IrbbxB/MoLLQLKddx8y5IcxUMTpG5jYW0LIhUdc4M4i3DzagoiUAXIaxHos5AAxNHcSgmSbkreCwXTVLjHU1DZftkRPNJMlsMVIj7QdIlpkuYKWPxO8OI9cYpQ4wFLDnzv8vlL04rVwLPy1gpsyt/y0IXf4BzLdgv1E5myCoI0c8Xifo3OIdwAV

zSPpG418GTguTgLaPmS8tUpUwHaaNMDJGGoIWohR60pqG7Eym14+ViLpqzgRF5wqsxFnEsLPRgsadrz55FTJaZ5CbQ5lGshD7LNEmUYuunvDXaIQXjQcMwgS/lKFWQwf60vpDvQEK3TIMbLD6Q9JIrEpsqmIGbKb4wl+UDoFsuXqJbLEthrIVbLGpSxqVltCPmIinCsfi32ymlUBQsEbRppnPNOytVRzsoJbXlFHLWEnQlgRCDzGO7LiAQeygt4n

sqXAMrtXsq9tdGwIcpeswphRsqq8W2lwYX+y9cQXziBy5vYQcv8QMHKiW0hys1U1sthy0ps2WwRynbKOWw5VQ7L1m3RylZhMcoRReJtccuuygnLbspD6d15ScqGdI2xnsspy5LUKujlpeKsqgqSymoLp/ON4rhLAUDkgL4ByeTcESXhwiAP4VyB6QEBPegA7JGDw1aK6HNyyqGL8suGC6JRN6DpS8DN/gsaVKaosTBMPapT9IrmHfTL94rUMvWLb

oqf8nPzJfK6ymVTj5QNIYvy+soPUmHia/KaDfJdaGNpjM4LpUAuCvZKU+MBipwB7cuTofiJssr/smnzS5IDithcdgo3oKlzNMq0mOcI+rOSik6LA8vEHYPLefKdc7j9k/JiSkFL3XIz8zEKOsqjy9EK1OxEeOXydgs4sCANdGKraf/z2KIU8vFgCASreIIL2vPdeH4YM3Eq7cIN0yDrTAnVIEAcEG8hQEk+AHklgCDmlWgK7B2J8FJi0mP5Hf5ir

OPN+ZZxYvPQzefK7+SuRatw0uxXy/Pt+kXXyjEBN8syIbfKPgF3yxAh98qMYQ/LRmPwUH5jJmIyYm9jp8ot+FHzr8uc8hfK78vAIB/LuVVCEZ/LmtQ3yz8Cj4x3y07AHwlJFA/LPmOL6fABACuo8YAqjhKxS2oKL+Pm0SQAh4B1gUSLIgBt0ovKCXNqMuWK6fLKIlTKhQh7ZEn53jNaJFB0hCW0EUMR2PNhXTGKzoolkQB0Q8pkHICKmspAi7qzU

EosypMouNQo4XH5b+H7ykyNHYGYwDwzX+BxCiL9negjY0YReWO186cQPwN6QCwii438HFp9+kPX6XfA/B0J9FIdnhz9Q4wr9CrMKyocFR1IshZVyLMuCgQyVvSfwJaLz0lTALWBegGyoSQAkQEsAWq8vDUiALPipEtt4ilLekqFCIfwPODnjadp2CoN5WeMEUEMkgPLeCtiXfgqjz2mSsPK1cEkK3eApMBuAWzL4CPpYxQqMWhaqUvzQxHgEh+Kc

kvh45kQao36DT09d/HvQA5Ls70yALIAKABNYXuBaZFQACAAn8DcENwRK8nwAZABjIB3E6a0CiOp8wlzXHPoKqu8Kso55d9Dk6PCjOUik6gSK6PyeTJwYlIr9TzQMvHCogh8TLIqmKEygaPKeyhu9LXAKJEKKkfLSzjbZaMCbYogPNPL4lOR4ryIAUHqKi10SMCUzamRVAA0AHWAQoHKS3uBfFRYAXABLAGQATgBiQDP3TpLpJkUypFjXhIIYeDw6

qCmKmIqLbw9AL0AAux/C5YqdYs8CV29j5RmVLlRlLBW8KQj8ioOKrrcVCr9YUorNkriS1AQA71mM9m9SADfQbASEVNwEjYzZZPCuF+iCBLGZDFSLHyUvLYyzoyaAW4qLUEofBorvwGuiKpKt3PoIZAAO5nHoeoB6AGuiBbKh4Af4gEqkbyBKsqTlIpSwQPJ54j2iyEruyg+4HhBTij0ywRJUir8UkiAXb1owF/gZ4n/lCs4IwTHmaKp7kFIyUUJs

StL8vEqzivEKuPAiSshU4WSMBNJKmKBySqwfJe8kVJlktFTUVJRU+kqyBMxUhkqaiQygNkrfUA5Ku4rqwBFySwAKACbADkEznKfwdkEY8WkyigBZCSsUiUrZLjvvRSKZEplKz5B2wVoUhUrmVKkQI/wKZz0jOEr1SpWK3oye721K6RwNivSULYrZCoUBFqoFCqxK5QriipOKpKR8Su5cwkrdH2JK6FS22QWM+FSXSuWM90qUVLWMuWSqSqVk30qf

SplLfQR2RGcfb2As7xDK480XiSPQd8BegEkAd1ciABCQ+gA3BHUgSwB1IFwANPkhisHU1Mruku8S5+9qUr6su7R06yVSRUqJ+QkwUGggoiLK4aQSyu+cssqwHxhCSsrpCpyKnYrvRH2Ks0rGyoDEZsr96KtKgkqbSo7Ku0q+LxKK2FSMH17KpYyJLwHK1YzhbxpKmWTRysZKqW9mSufzUSj5bxcfWcqVb2JAcIgPgFmAE3KNAC1gGCFwiDskVyBX

IG8gbABLVTcEJMrHct98th8Ritp8zjCDiOsQaKp2Lk+0b3JcypKlZbdPcnrymByJku+S+ErBCufK/CZMiqrKmQrciseQzeBvyqUKooq/yuci4e8RaJiUqETbSrcZWK9wKp7KsO8+ypgqqkqPSqHKhCqRyr9KwgSkKv9KhvAMKpnKtx9f4xIwcMAMaPlwXoB1IBEMjoB6QGMIC1UWwCHgDyC8ZNoqiGK9bwYq0vLl4p38iiQB5kd9elLOKqVoeRRz

cHqsvirjJNBCwSrW9OkfDIq3yuyK7Yq5CrTKU0qZKqOK8915KpgfcnSlKvfTFSrSWS7KtB9nSugqh+idKsHK+CrKrk3vQyqdjI/o31tCYEDKnnBgypVvVMB75JoAQF4MMAjATABUwGpjLIAWADwqywBhsQio5MqUvkPK6RLQipucx1BOoCFkHMr2dzlkBFc1SofKhEq4qsjCBKrqyokqjyhe9wKK80q5KqBU+SzusLyqmAsCqrJZG+jNKuKq6WTS

qrgqogThyrfozYzdjO2MpkrbqpZKv4iDlUaq9x9eFEFssIAPgDxADQAFgHJUg9y1orJS/3y7kqNYxgq/IjyjBpYDpLOGK8qUkJfiHr8GpMSK/iqliuLKiJKMDJbzLAyeUrEKoCqtcJ0MlEqDSvRK+AiOJlSqw4qcSutwBj8lozrstEz4wP6Q4VZDCsc88wr2n0sKgpLqgvbU64reSMNU3mLoAHoAYyB6/yuS4YraCsAS13L3HNJc/GB3Wk7wDiqT

LgvdEJI1Euqyty8YqoT8vGKk4oJitDUMarbKr8y2BD1K8VlGPLxqx5C+2GkqomriiprGMmrk8qjg3YJkh2pqpQMoso6ii2q24sIKnyowgEDsnuKugHyAQvxrlmoK32KAEtGKpir6fJBq2GdmxE87OKKoav4wtqAgVDZkY6LIqqak5IqkasEK/5LV1O5SwmLTMuM+B/y5NE2K8SrcYHOwrSJdaq2q55DwJPDYIbLAAuyABzyWIGiQaGkSYjaQgurP

vIGQkuqdd3aQ2mrmk0rqi9cWEvPk3Zyplmp5RCitYEnocMA7JHoAeKBRFD+qp3KAao2ioGqCstQAxEIB2EgfaIqQquYEaNg6p3mqgQr4Euyi/OyRCuBS4mLQUo8MGPZ1atRKg/MjSvTqwmrM6s6NZyjskqRSrESxCCJKY+qxD1Pq+uqbavKmEbDEKKbAegAFgFiGbAB5kMaXIarm2K4EpSLKUrEY7lBzCU84QQSA6onYAD9EIGOk+Gqoqr4KyOq5

6sTimELb/LhCzvL0/K1wwzVzbhLBDerDSv6I8Mod6t/KrOr14VzqgwTwwB06KvYtCPQqSMBGar1y5mrbaqsctWtqr2JAdIdWYGfqzyr/4pLy1iy/KuiPJAzhLERw6YqnnMdlNNoOjOAa8Oqg8rAauWqhHMga5OK46uVqz9yzkFvYZOqPysevfOjbvjQa2SrnkOdAw2rmYvA4YF0CnnJcA7VeXxatJeR9tRVFVDyq5kFfc7lS4Ss1HRqiGvMczuLm

6pPC3hRegGwoFUA5IDmQ5oseapli+hr/YsYa4eqpAl8WScJo6wnqhJIKrPmKz5KY/PFA2WrMotYUiBquUqBSjvLl6q7yrGqMgxxqzWqVzhCImRrNqvQa6s9SdKwak0SLwCBKQ8RjkihyGP03sOya+rITGv6i53zm6p4ixmAPgCFsyQBblHqAK815MsNcqUqR1OBqqKKmfPCcIs4xar7YqFBxWSAahYrGrN4ahaqo6uCagFKwnLCa5BLsdM3U56Bh

gHXq3Gq4mtB3BJqGyrkav11xXJAEVJrj2MBecIhcGr0czTZDHI2a62qOYv9KjVzGYC9o8MBMZPkPXHjiUvYExxqfKoYa14TdDSFAypYgUFaagR9FHkdqTWLpatj8vhqgmsP0kJqF6rBE9GqUEsxqyapsggkapKrUqWPgYZcM6qSaqmcnuBzqwGT9GpMRZjM/EA0asV0e/JO3DfsYWsRyqzYCmqEytVzm6o3c/1lMACIqq8ASPNdqrpLRqp6Shprf

EuHYR9ATUWdAy8qJ6vYuWMJ8kwiq95yEauiqt5q/kv6amOqhmp+akZqI9O6LH/hEGsmao0rQWtka9KqhMAVUuqKlGtaUAuc49CjSbec8yNla7ZrCkqPCq+qCPI8fJMBp8UwARL8iWoCgklrjyvuSujyDLnx2CGrgqqlCOYUPHidkl5qAmtZa+OL2WuEK75rhGt+alWq4GtUwCZrYmsFarhZhWuJqslpkjKhaiVqBgTXUTJqevgjGE0A3sKDahtAF

WqZqjczbau5i3hQsgFrAWsADYNyAXDgtWuWQkIrSWqHqjxyREHeUNPNPGvtgvYsuZA+SxHT/GoEqq1rmXMD0nlSEEsGaxerwmrTikmL5vGPlQFqayvOw6qAwWrmapWY/lUUa2uL45nFALF0fJwUtQKdKqB6+bKhreGDUa8ZsgSQnXRr0KiHantqRJ0knAqgMWtYSrFqpoDkxRCirwDTYL+z3wBSUmpqF4vdqxir9iK9qqKLKXy7wVgqCOQnq5+0S

fnrBGeqNSveatuSFatjqpWqHWtEawhhomv5a11rV0Obaj1rS/P+2DtrKEqo4l/Q4SDWajLy/2t0IiLKgOpZIzFKdms0ZMIBu4sZgegBiQFTAHWA7JGLAMaLk2rYwt+r0yo/qxJMROA6gRKh7moN5BdpHcCCZS9rHytLa31T5asEaxWqpI1TilrLa2rGarnEX2rRKqZr/Zh0UD9qkRMwa8ayDiDNq+BDC0DPtbezsyHnaxuqzGqXawBjGYHosPEBF

tG9o/qEHGtJSo9zqPM9qhgqooqD/RiDvsFw6i28kqFCoK68iOuRqitqX3M5a+1ruWrLPM5AbkgbaqXym2qVQFtqRWsqkM7xv2vKK88d0JwmTEsL81Ls680K04OrUpzqUctsKr7CG6p8QgnzAfDCAThLSmqgAPO8YAC1gUOyUOohI4dT36r1a72q3ckmHWMBWGr/q6/xbsDeYImzuGtOkpvKS2sfcp1jWXM+axrK7Wvva/TrSX0IYajUYmoY6o0qd

KnM6z1q5NzY631qLaDBGCkYZAEyYKpBMsn4+H6womLdoaiAOopa63pj2uowAfjrvOqbqpdqwWMZgE1hx6EqM/PJMOS3a/6qZOroKuTr+cNd0+apjFni62lqnqFzZVUrxkpAaiOremvAagZqdOqra4Zrw9IM63YqG7H1K19qAsPK6ljrnkK/a8VrO2o66a3o8mzugs1Q7umOSJcgIcvybRlYnup13F7r7uqpg59U+upSwnzraipKS3hQcKFCCGxzp

4rC61+qIuvQ6qLqoor0cU4p8LWnaHyxKRFTYBmj1up4ahSwFIhpEAzKQRNRq9vKTMpEa4TyWsJRCUjIopFOqPyT4xzh42PJ3gEz2f8hZ7E3WSp4kuX2kcZhVNPeAFqLqermgZog6esyIBnqu9jV4YxhcPSronXcGOhp6nKx6esV0Rnq+eow0AXqeotjofHzHpwMTbChvgBqXKABcgC9im8KX6uPErxLNorJaqlKJTBEQC4AoiqVSVU8TUUpLUOqm

Wo268wkJfSx6vprAIpfM3Tqj2QJ6/Wz7iJFAWGBl/0yqgqBNCuuHLETLCpCHHnq3CFsPMcDmkMTY8XreetsPCwqg+vRiCXrbD2Z2d44yLOVrMoRiQA8gkgj/UDNA3uq6Kum6/mrrnPTaujybmsE2F2ojer7Y4MRyKD++TSireokffhq+PKMygTz8eofawnq4CJRCSKDljko1MYzzzxg84exu2vrc1t0n8C4QivU9q31+IkoO+rzpBOce+ubQabUh

iFm1KkTB+uZ65gwR+rb+DAEJ+qarLzr/uvl6tnTcgBXgcMA8NB8LSbq+6oz6j2q92vk68lr/hE9wZsR9Y0MWPb0ur2ijbkzumox6wyox8JI6oEy7er26rlqDusK64hiG+sYvKmcBsrJ0gAKDBP99dGw0ARYrDv41EJiRMs0NvIlsfKxJtns9V6UyEJOlI0tHVEAQ0SQhq3JyVP1ArV9JdKUh1CVIOzJp0VqID2cGrT9USegA0JHAi5pQ0KR1JVC3

1Ni2dicGgXlhC5szUPJNWeQvkOqiTYT0QAcYHD0fBz2TbVFtPTO8ogb0IxrkHdZ0pWXEX/4zVHdoZ/l1PErID/olDGYIcJh4xkOYJJ4MNC+DZFD5VmZhdMgABsr1fX5gBu7RUAbUvPAG9iUrRigGnzNtENgGxkga5GKcbhCa5CQGpLJHIVgnZWVMiD62cnJsBpa9Gco8wMSIAgaekWFQoNDiBtFdUgaE0LjSJWdKBvxBMmle601+cLVRsjLHRgaG

hJYG9T02BsibQzEmsWK87gbO+hc6KlZ+BpmaJSRhBvT6Dd4JeD86SQagYpHGBHIRWATUT4N+PAUGnXc/+vOIFQa++tm1dQb4Vk0GupM26B0GyHK9BrIg1no7ELQ0BAazBogQ8nJLBtEnZ8cZ9lsGpLJ7BqoCqsc8BucGwgbgUI8G1zzN+lXJNRC/BqOBCBlAhpBgn7UVslCG+oTRhIiG7Ep3xwjQtM0uBrGGngbIcSSGs8h+fkwUEoF0horIekhx

BvrIKQbrxhkGmilcQ2KG8LSuSIMTeoAPgDysvYI1evckYIq0OrGq7ProuqTKBxBrlJvEq4YxjjuQLhqumtOiyBcy+rv6zLqNbM5Sr5q0auAJArr3yLf64dg3QXTXLx0W+qNXCmr4bh96w7NeSA6cOEBbnkzIq51sRtpzPEb+uDCIKkTiRuttUkaCRo4i0xrF3yO/WsBXYzEBSehTKv1cklKFMp3a3yqrmqy0iyz8cH+G++EDtAMcXirzevR6laFb

+ux6vny1xzx65/q9bJx053q0VDiPRPLzCyT0qjj/ewmYp6k7nUyrQNCjCu/pAkaiPFJiSwAs9DYgSNKLNTcGzf1RFWKcKdZQgObLUXoafhRg+6JG63ZccA0uQTilfxASRU5geHhd8HzQTJAtyxkAXt4F528QHEbIujYgQ0bCAGNG6kUvYH9GMYbjZzjSWHL9CAgpNAwpDl44wnMjxlUkO/l13xW6UasmhutKUUZ0ngW1OVD9RRmsWazD1hn2PQJO

ADpIS+RmvVS6HBFgpNW1UbY7m0n+DXQw0SC5VZNSqCecV0TOrXPODKtccstNbZ5eTTVGq5hJJGhALUaAxt6QfEaTSiOpA0ajRsFAE0aIXjNGyk197I8tIIDlTLPKXStbRsfEe0a7/hrRZ0ayTX6Qd0a3MC9Gn0bdNn9GgVDpuWj4YMbBQFDG90gTRsjG+iUa/RjGsFw4xq6Bdyl1cwRLZOEVqTTGiggMxtwC7HNoxpIUcPglTQLG36UixsmcmvR3

OIhKCsaVxmIC/cwymN7WbUZYtl7sxsbjQGbGs8bRUzbGytwbuk7G8BFuxrnkXsbN3BvYgcbLyh3kYcaVGFPG1WBxxuXEScb4+CvG8MbUrDnG7UaFxotG5cbrRrXGv+ENxvPwB0bkFUboeUgXRtCtfca8EEPGjqBfRtFnbZgyJvUtUbVjdDgNacaN0sDCqMb7xqtEx8aCUOfGjKJCWxqzd8aZ1k/Gg1QDgEzG38b7xv/GvMaiDCAm28ZuuN7cQ/Aw

JovHCCb1ZSrG2CabGHgm9XREJvRiZCaZURbGtCao0N7jTCba6WhRHCbqCDwmgFi8fIeGwjyZAE4APCr+gF+qqTqORqcapeLuRtd08MRhYGdgIaQket9EP4btNQbypIrLesx68vrr2snYqvqR4Jr6hEbin3lGl7RotxKUkA9YiPAsrQrjF1KHHwdX4KtCvDs2uX2o9roJWMSHGqaiQrqm6Hk3sKam3KgWprAaV9pMmHam0UpY+ocK+PrCPOXIrWAa

0yr/CHrNevJStNqInyFqsY5dcAAVVe5IMwBEQJJNC1L6jKbIRsv8rLqYRty6uEaHetr6p3qkRuc4XV9BiL4PdEaz80xGs0R4rNOrCwjEiA9s4xybpo6cIxzXbIsxCisJ6hMg9xBkrIem3MxbpttMe2zvptxG9j4dHJkAV6b+nXemt7CvptdswGa/puBmn6anpu7chKzQZp9LdOYyxkSyukbSQ1AA61pg2X6AHWAYALT6ryr+6tuSoBKdes/qgWAE

yk84BKaiDxZDTztHRwta9z8IRolG1vKLgIgw6trqOpXq8B8acRCoPYKDlzAswxiDBL8lNriZ9lxqWxim1NSsX6EYsgDSHpwWQsjC7khxJEU0udxgCFCgI+SPxkSIGI5kAVSBbakrEHzbdvy+YQFm2j0hZqlqONCxZo06BOhFGE9CmWakiDlmkLTKUPZIR3sxQtVmhiLQYVhQ3CyULP78jfs9Zo4aTdZhZsacnsVxZtNmqWblZsLpYyArZu9EhWbY

iDtmi2a1Ztm852bkLO1mx3z0ZrndAXIFgClfDQBJ6EnoHkS8XNoajxLd+t3a6Ejz9UzQVAkX4kpm4SEwOQkHKqc0erS6sUbHRE2myEKr/MkE7Tr+PNymmUahPMOmi90acR24TEwq4rT4CeTFUuPYmMrQOGXkkAB+5tGoZVg+q2HmiugT5KzfAKbdllyASegIAAWACAAgSxRs3mrLnMz6oYKFT2pS4i1ctLOGBH0xIVkUbJMOPLSmm/rq5oRKw+Lb

JIPPV0AN9I2tcxLAKuUw1BTLirBU6aTL+KyAYyBiwHHoBIAngtOa5STzmr5qvfq85rpUi90PtFsFAvqxg0fQF+gzDTpmvn8GZpt6m9ryOrvayjr46qYYcCLlTyTCbkM+GVksGozD6unEGKT6dhikvqskZKLI6eayF0VverU+0PFKrOacssJmvLKs+rdyx1AnWGrBeQyd5qIPE+gZhUZaw+bmWr/Q6Ba0iqpsny8pqWLwAeIlf3+oQDC9GNbKlBS4

lIzy2LAEXLKEWvJ3wHpAGABdr1T68Kbams5Gy5raVLX0jVo4lCVaYuaS0yX1KFAzevYWi3rj5ut67bqOWqf6vTqX+vfIlQFGjRYmciZOjUts1JJMFuyq49i6cJ6+FxbYpLcWwFiiFpIwLx8BFCyAeoAsIGXmn+bV5r/mw8jXciDbdoxvyJAW2Os1qne0CBbUuqeUoxbMptLKwHibZQ749uat9KLaYRavotvmsRbhJIkW4UApFvm0FqZawEkAOyQk

zgm6/Ga6Goua5xroptJc2/wrzIC7KJbVOo/hYWByJnWm8UaYFrI60JqzFvy6ixaCpt9Eaxa0FueQ+xaCkEcWn/q0mvW/LIzEP1yM9CpHFwIKjmKBchCo3uAsgABfLPjt+vT6uprIupJmzDruLAXaDTKmFqEJJQr4Qm4Ktc8OFvBGjaatOvnq3abpRvMW2UbRmvFM5yTarM7mjrTNo1oM9aRIZpDcweaPlpkAUeaN+2+W9rieDIE6+kbkpwIgDWpy

rH71D4aoeq+G2haKeFYWRlJOwSaW7spwuCgELZYK5oSWqubjFs1KtvT0ivEYi+bnOHdya+brYt2qkqj75vyW5dBGGLKEfBA5IGQo/NB9+Emm5+SiZoFq+uCFOpvTIL49ovXuHSI5LAJVK/qwRvSmjpaTFttavaaEFsd6uUaUFv4W3650FtIJMZbJ8qp2HBa+YTwWjfsCFu9s44SgVoxmzvU7JGQAb4Brg3QAGir54qm6zZboevGqgpBGWgsJfZa0

k2fiETgKHSDYdF8uFqxWs+bcdIAPWvLBFpvNIla3IssS8RbCHL4ANLdnV04AcegpC34AOIZ6VvX82Tr9+rm60lzbWFQ2D+F+RqokkDddHBtWi5bOloEa7pa8uuFWg6a5RqsWmnEJVuGWjBbAZLcW+nY3FrS/fRTlVq8W6sBx6FJ83uF9QEAzaWLpOoNW6FaN5rB8EyM5GL6ogEaIIHU7dvBInDRWrozElprmoSyLaJMioIjmTMzWxWZLhCyWjZKc

lspMQos4wE9WsSSxvFHAOQB3wAP2INaqPJm60NaiaMP6siRj/BcGbRbfHMMEPyQclnjW/laK+vLaq5bK2pTWo4ya2vZmib82D1dALNaMNhzWmrqQABLXenYS1z6rEtdPFoWWgDYtYBYARgB85LXTJdbIYpDW/+a19NvoZKgY0G3WniyZhCFAn9DIFogI21aspqTW2Eablt6Wu5aeWvuA7i5+Fr3HJi9hlO9vXmbNhC8y3kc77Ans0tCNOiHcgvVi

AWAIeoBjfMI23eylrKpQkjb8bGd0IgKnOso2vNjqNsacy1D6NudARjaj52aGljbw2uIajDUyhAWADHjBAHcmFaSlFu3ayKalMtjs9da6eFloD+ZwNobvVLB82S+vdpaT5sTW7Lqdusbmlmb9upQ2w7rYlppxJa5LtBGWxb8e5odYY9j7pp7cwebLNs+Wt7CbNp+WwFb+uuVHawzx6EK3HWBsKAoAV9cNeoZW6hb15oVitvBUsFbZHJJEVobvG9Bx

oy5MlKKzlr5W9TbuFtYkmUJHVtuwZ1bpEBvm4la4aNJW6dbCFzKEXuBUwCbwekAKAFOMmhq9Vp362taZpsFq6LrUlBWWVktFNuhqj61qZIPWmLaj1vrmk9bdurPW6gTYksdaxQTEgn4WmMJJVp1yaVbFKuPYuVb2ugVWquYlVq+wlVanNuBWxmAKACcAamNtABLXSFbaTMNWhozmoFuKAeZo1q1xEeqcUjYWngqotu7W0+aZkodWmnFOgCS29i5X

Vsfi6hjAJRBoDLbvVvm0AAgSCydi2+r/1udywDbQlt4EivzwnFswxHrDYyYoaFApqTU2zFb4Ns020xbWtrkEmBrrSq1wjNbUFp627NapVsBkskkevgR22KSkdvfWxVr6gDLXeh93wGJAWsA7JHOc7zbg1pXW6Ej3NycU/7cESJbWqGhduGFgf7aYNs4WhNbYtoHWtJbUFpO2wlaV5jKKrBaxpLyWm7bAhHm0UAhVAHAY1QA5IAULCTb9VpUWmpa1

FvDW99J72AONJaaqZp+UR+BhRoMW0Ua4NrZaj5qtNpymnTbm5va2x9qBlsM2msY7FvvWm7q5lvgQo3bNvyLW8baS1o1CZwAe4CUjCQFKluzmkrbdWu2Wn/CX4myuU/qFzn/lAdhQ/M7WkmyMVqSW61rVdpB2oVbz1rZmyJqPDBg2B5U0AJ3o5nEruuA5XDbk2Hw2k1c2NptE20LONujcpjbmhtCgKjbtbCI2skLU9u42kMTZSEz21jbs9po2y+Qj

DR8pfPb2gPDmmXqyXwt2leShgBywp/AvIGe2qhaXcpoWsraFOs2om7hrLJl2rXFhHlUUb8KadvOWw9agduPWnLrT1qD2trbwdr+aulilci7wKIrPzRM2ihiFUvM2xpDu3Ns29ZqXbI322KTnpu325CS0dpKNBZB1IHfABXBwcPx25da15vli5iq3hDHQFETEYt72xc8AI212erbAduSW7RLybzxWzoRTttHWyCg2dqcW9UD0ttMMj7SgQnUgDQBm

hy6jQ2DvYooW4vLqlqim8Xbytq9/LeZqtsDqpuCGeBf2v3b7+o4/FGqYS0n2sHaImtgazrbBlp4QXraq2n62vmaJlpAAIbbxqBG29CoxtpgqCbbl+uc28Fi8QAwgSegwDt1W9kblFqk24EqtpIuFMdB+jBLOELaU7NHwD4Q/lQB2jA6oRuYk/tbtSOHiGnFZ4JuZFLa3Vq2SmsIp1qAOlSzpFr34JsAoqVTAPGbhduK20Xa4DtMsujyfzUQijbaE

8MYwVzLuVsi2wxbfdp7WkJyx9rV23Hrokt02lub01tO0OQ6O4n12uHaH1qR23BaX1sVWt9bCFo/WqmRlyJxxSIBZkMCWmtaDDuk22RLrEEbEWqBi0wOWg3lSJhiUN7R0DrsOxJcUlsj0hLb5DsyWxQ6LtvyXQA6pjOAOtkTAWjEi0sAzVMzmoraNluiOng6jDp+Gos5xZiCiIQ7+MKLi5mNaaKH26LbX9v922Bbk1twOrhSL1tD28GjQvwzxTw69

KCX2sg7jROPYo3b6dhN2o38zdvoOuvaNpGqXMIA/FoRaFvac5q5G+A6D2t8wHSp/thaOzn9nPnzZFKaw6srm5Xaejq6WxDbnDs126faOtvBokOV+FrxCANMSzmr5OPbgQAT2kUclzRpqBqsUbBCQrfbGoIJiAogsbWN8r47fAB+OiPg/juDcgE6I1HH4MBoq1PX3UE74cwEQxAhITqLc6E65mjXDf4Aa9vuApY6wgGLAMWKaTGzBDY6Hdu1674ag

4rkUYEMvSIf23xyuKHNwefNxDoyO+rLK+qcO4zLYlkQWoORkFoeQueZnQI2qHJJzptgfS6aJqD8QeQB31LFJAEAuELS7KMLqiEvkEwA3GE6fLH9hTtFO8ilxTpgKyrspToVIGU7RItn4KkTFTszE3EYJTrVO6mJpTtlIWU7tTsX6pY6fH35CSFoYAAqWvQ6aju4O6UqMOp/w91pi2jii+2DvWCkGdaEGTsZmwPakNtTW/KaF/0dWnJYchNlM8Ri3

jrSMqnZ89jICHUbM5CluHABKxOAIcJgpPUDQnLzvAHCYQhpCzFlIEzUfrERGY+cfYjd+B0zwG0p6UbsTTq1O8SlYmwkyNSaZmit4R5wGJR6xL1BpNJHUVlw2Iz9UaG178uXyn4Yz2MHqPby71JLeaQNsbXexSvo0OnqYHORZZTRKHkknYl1NF0ku9H06Es7VTOUGrF0O3AT4R5xKnnCYT5FoEWiYOxU+xJM06Gs4BgrRU4a1EimoIVYkuC3WHfiq

AESIX/wjVFSsJU16yFNO8Sl4pSoSAIVzxSVgZs6c0PXbLgKpcviIZobnzvPSsQBO+BlzVMUd1kbkfO0rxGe6hfZozprq+Kw4ztUxWUgkzuXpbLz9vLyGjM6A0qa6O/B1GF4gXM6jSnzO7MzRViLO2c6H8oZCss7yqF5nKs6X0qaRMwDpGFnsBs6SCAVRV87MwEvDCatVTvS7aAquztzMHs6n0s8GrtzmOjfOoc7zumBpabFtmKs857yEEmnOmsNs

+jnO8tyAOhbeJc6FejfIRXQ1zuFOvIaxFW3OsU6nCHlFTAB9zq70IdZuNIQ6Psgzzo1IIgJUSAAIa86a9SBIO86ouP+5Zggnzo69DqURKXexVgggcs/OqQhvzpsunQw/zrVpJyl0JWT6XoEVJAYS8C6dAkgu2M6MyHjOohw4LqU89XhUzqQu2/BMzuAIbM6MLsXMjRgxiH7cvC7xLoIu8xoiLqjCmObeOI0xci66BvrOrrBGzsF6O55Cw0YupfLm

LtUYVi6ELt7OkIMuLoHOy1JeLt4Ifi72JUEup7z0oinOygwBIzKuoMyEelqYPM1gSlyu1c7uQEUuzc7JJSSuhjS1Lve5DS6Mho7A1hEswNG9RrkLzvHIYy7ATWr+W86MroOEx87jnnalF8640m8AS1IHLo/OjgxnLsvkH87sQHcu3bNALtI0ny7QLqarOXqmDpg6tVYK13UgKDriTtqOx06YevXWx2o0tF0kpI6WPIdqYMQ86O9OjTadpon2v07S

Rz6WwM6TaiMiLMJFCOr8yhja/M+m/7z8CAIgNskNUB6+brzkbv7EtG7YpIxuq8IsboDAc07gjt4UXIB+ABfXDDAFgB5cV66HTvqask711vewfbRsLQOOpgQY0ApENSpvdsC3c47MDqEKx/rQdoGOkPaCDo5mpMJTcBqigbKcIRu60+0VoG8IW+ybjQ09GsTGEmO5G/1/LRC8z6lLUNXDK0L4wDNRXsU/iHlmm2aFgFoRYzTVLrTUetzLYBi5MVta

CDM2Grw2SEkkR7KcbSoFZW7nYn6quA1enGmslBFJnNBhAwgDf3zQfpg7B3JE620C7UqeQ/lEVkLecAKd0V80x2d2uglumgApbu2syFCfBzluiIUFbs4uuJhQvJI+XpwezJVgDW6vbt7+bW7rZsvkPW6aUPYQ8a7XRK5FKgUzbrrIC27X3Avwa26ycttuzgD7bp6iR271cETEm+wJnJ+swwhPbu9uszi+YOUkRpwA7pZuYO6lkUCIGMa6cqroBIAo

7o3smW647vnEzSdRrETuv0SYfNTutW6iQszuvAEc7tDm3W79bsLunc6cxJNu0u7Om3FbCu65XGru1XKa7Ttuhe70AEbu527PrJbu76y5rPbuhREQh19u4Gxe7sV0AIUalHQGQQLCNCtE3XKE5pcVMoR44EwAXIAi8g0ATDlFtpKs5baYVv+EZ9h3lGno6k6lSpaPa98rGU6O/bahKqyO+vrNUER3DDZmbIOCmVb4eKKOzmzbtsZgbCghSOLAFOaj

PztOgmbNjtUW+o6FOt+o2GAydu+E2MBsWhOOkUazjrp2xraytIbm9XaVcJcOrXa6+vuAzsF2GVv8ANNnKKWaqnZ4wBVgWhFjkgkeqR6ddxke5ooP9MxaxOb5tAwweehvgHpALDAOkugOmgrgltzmt7bZz0RCdx1m1qlCEVRopC9O5B7bDoO2nFakCXaGTVBeQOjUzKqcHoG2gA6PVrUOr1budsZgfgB7wR4Y4fQiUqqOzg7JNtgOmI6fEt16mMAe

2S78T3LWiTbgnfNTI3ZuhdDObskOstqmtvH2lrb+jvyiwY6Bbo0M1TthpDGO9/ZRHtzW3pxZHvgQ8kKinrS/Qp6FHoMUg/aI2mBaXKzMPwI/bR63aupurZaVtqjTFbw/lSZu1OpMknq0KNtQRsbyyx7UHvf20nFHahNqex79vEce0RbYlM52tx6Z1voEkB6FgBPADyCqbqCeuo7lMqDi2CB/HQ2A74S+/E7wBXbdtpsOhJ6tpuhG5J7HDpwOsG6p

9vwOiHaw9tcIoW6l4BEeoCiH1pKe5op81vKet7DHnsZ03+79ZTvwnuZMAHHoXuB5ACCK8/aANsJ2/R7FYq5kI/x5bPNWnC1j/EgTDIIgbvp20SyUDKFuzeAKkPgU4SAnHvIOjDd8HuUs9x6yhFfERCYNAELQFfyv5pNkqI6mnogejvb11q/zX3TFfI6ej7js4uUsQAseVr6eg57a5u2m457fTuuO25bXDvuWySJJhWQOSRSSlnuem7ra2yKe3Bby

21KexVbxXoqe72y7rqm23hQwAHwrQSjftMlPBp7iWtTax3aVtqUwIdAH5jMOqErZo2VofRa9nqV29h7VirQeveh5NzlSe4otclReingJnurCVx7ijvUOgksqcBm8FZaIfXWWyh6STsHq2abytunQ2kc3Tqx+UVlVUBLiuF6OHqcs5rbtNp4em46Lnpn26myui3+EIWQ7nr3wsR7sFqle45IRXuaKfBa03rTkiNrW9SLg18EjL3kAbCgVXuqOz163

rppuyB7Waj9ERjBkDpWfWqBWwV2e05b9npNet/bpDuQc4Z6kXqtepWYbXo3BO168Nodegh6PHt4UekBMAHpASegdYG+AGgAM5qgO0t6qlt/mvR6y5LeEm70IwX8MWt7uyKLWZBq4nt93Fl7e1tzszh6I3u4ep8jeHtuO7Xa2bvYZRN7ljnyenw7s3vgQjN63sLvenN6BNrzeopbBjm/W2RBmijAeiWyNXsrevqzuKGv1b7aS5qDYMfAIttSmvbb+

nvhe5BzOyM7eqPaYkh7e9F6pjpceqZ7HXpxelR6tnAlPfNA5OyWe+d6tjpoew/qKRGawS3AAPuSo+YIbvT4PUN7R9vZewVaznrwOjJ7LntdvMEMTagve2UEhXp/agCIb3rFeyR7M3slezj73nsKaz56VHtrATVbZgERAKVJP3q1671761svmyBNHsFYapHqdFni2xt7W7yPm8D67VsO2pAkKz3+ED0B+hgH01LbqGNoMwd6yhHCIaiysgADIB4Ks

Pt0enD7Vnrw+8YpoUDd21Fku8CXlE5alPrA+nd77Dso+nm60nqo6szLu5L8w9Ot2GTgMv11sNu2oinqTgu4o9aQzfNFevmEIvq4+quZovt4+pR6/7ocMcnlzgD2YSRLAXpe24F7F3obEJdl+Lm+4oj6oSsUeQrgyPose1z7MjsGeyfMpAhNqLT7SzjCjeAM+3vj2gd7sXpmexmAPTC/WyQt4gHM+gYLL9rGKtdbQnrA9FUw4xF1e7soT6HmwOeB0

jsuWlJ7I3qPe6N7aPtjeir7Sn01QAL60EDlBe7CH1ri+nr51vtikzb7FHoXa5R7GYAmizChWoFqvSI6IpuWe966jVr3oHiZVvDs+ivc7kHZDRMJyPtbe3WKeFs3oyk9FvooYifc9dPHW+16kPoM++bRblAxotd8WG06+u8LXtsXesdSjhlEwWT6qZtQpFA4t3vMPUr6mTocOjl7WTq5evh6ner6kayLnEwFe8eYWPps6w2BNvvp2Tb6+q22+yp7c

3sKNMoRx6EwAeLs7jXqGfcrSXrO+it7JPuYEKKBkqTF0uB62TOuAQfcvN0e+p8qzXq2PKr6PvrwEWr7+KHg+7NdMXsa+/dCn5r9CXuAe9XUgVyB4OBB+tMq61uZWw/rboQN66H6iOTRZWNg2lpK+lt6LjoQ265bOXuQ27l7UNpcGLH6rhS/SIL6ToBTe8L6ePo2++36tvsd+nb7VVr2+3hQ8WtSnVMA7JHzQVkaxPumm797mfvSSOExn6DXe8pSh

oVdYcx74lq7WlT7TXvK+zmjbE3e+mD6dBJ0+pQ7ycKxeqX6KVvm0CgAiCLXI29kw2WJewhTtWvVe0k6fXoU6zeARm3AS/L7rXJFCBIINKL1+kfaVdt6Oq47UfpN+9H701onmKr6lKMC+vH6sFrt+yL72umJ+jftSfplepY67U3YGWYAoABZwk76uDsZ+5p7IHrVyebdWTKie8KN3qBjEQfao/p92xH6tErbe408e2UF+pP7aUi++3T7Cjsl+x+bM

/sVbeoBiwCaKKABJACF2gv6nHMae2f7yXtV+vr6hOCKDQj7aXoggbUxcWJYexXa2Hob+g37gdqo+437/Tohu7vcX4gt+pb7mcWt+lyje/oJ+x36ifsd+kn7nfrJ+p96KfpUevOTwwDCAONrFlD9+wGriZpW2+E9+ymPawhBGlWTKdsQuiXr+hrbY/p3+pErNF0T+7T6DDO++/t7fvqa+zLbO0IgAcIgcpIdaTPcKHrneiz7qHqs+1/7xkmHiRihQ

/qkQZLrhEkmDKgHujq5u6OrgAZb+0AG9NsK64ENIAa7+5b6YAdt++AH+/vGoQf7YvpQBkf6ibpIwFKcRqjskLyAIVvS+1vawfrLywr5k2VaEKRiOfpSQyjgP0ByXXn6ubrWK5TQFqlx+A/6pzhT+go7c13T+s/6SjsZgHwrLwGwAX5AMKI9e/gGuvpCW8H7av2u7es52VpwtOpZM5Sj8vxrFitg2/X65AZtajz7qPr5u7z6xTJh8NQGcfpW+6OTA

ZMJ+qL6kAaH+gwGvsNletVaiHv4AFTASN2woBAk7dsoWqh6xdtw+1/6NIivUUOLwMx83KapxghDlNwHEntI6hrLQbpAB4PaCgc5OzFd6eR8B2VK9IlEQFfap5OnEAwhKCDhAYmBCGkTuz26/qwo0hTZzROAIfO6Qh094XKgPvO8QAoVKgXZKFghsMt7S5lhVBQ+Deu7U7uN89YGMLq2B7wVECB2B35E9gbv0A4HECCOBuwcTgddSMurzgd0kTZjy

0Jl4G4HrUtmYUidgg0eBohwWAHhO5rY1gfNgDYGexV3uzgDgCE+B+stvgYJyi1DDgfkxAEHW+CBBs+zy6vr2EmJrUIhBqCRbgehB92dYQfPuy1DsTuhXKp7GcJ1gIcBJAA6AfuAlfqPKkv6KXtf+nXAuOFQJcQG+ABvoIKQpGpGBw56WXJBu1J68gfSe/m66Pr7vKc4F9s/6/KDv+twe9aQeSCz0CN5KNCRupU7kCr/SugwKBWcxUb15hui5U5oD

buVOrbidAGXEc5oNol2YJG7omDWBjWAYuXp0BYxezIpWHK72fCfAfphQspsCqj0K0XOaVbKLUg5GMzSwAnRBuyl55BMAXtZFbt45QNZtIUfIdV0lKXhhT9UmBvYlQ20PPJUYKEA38B4AtSlSQpNGFj1ggxdBhfppCEnIQ+l/tQThWe6QZr/JHAJp+qPwKgAmug1gDelbegSAYMS6UKKlenYNQaZGWUg9mHTBvU6byH1Bg4SUrB+WWToTQaCDSoVz

QazEtstrQY46T1Q7QY88h0GwwbAIQsHumkIqD0GauC9B+LkYstfLP0HPGkDBsQhgwe/U8zSS7oxBiFZIwZ86MoVYwbYMeMHJXGlhJMGoJ3CGmu0dQZwG4IhbANLhQZU8wb0pAsHxSCLB62k0WDLB+W7KwbspasHjGFrB2CCGwZNpYLVWwZHuqjjhGy1B7sGevN7BihJG0oHBo0HhwdUbLwUxwa3u1S7zpCtB2BoDIVnB0qx5wadBqgUlwbdBjWBV

waogdcGfQfqear1/QdluQGwgwfrIEMHgtQVuiMGdVmjB8BotBuuIUrxFeBvBo8lzyEv+e8G0wZ68p8GswfYBYsHcwZsYfMHKhTTSL8GEvPPLUsGndXLBpBDW4zfGd6wMNBAh+sH16XAhlcpIIfjmvj6ieVxe1yBvgGwoYgAUiPp+077sPsEBqvTCeGTKJeASUir+ifklIg87Kw7QPubegAH3AbNeo6aTviVBtNkBsuX2jEaqGNTy4G908q52soQG

ig4AOEBNay5BnVqeQZf+z+rYpBCoKvLfrqpk6KRRQjtcmQGJDolBpJ7j/nxi+BapgYTqzk6KGMwJfAlnkKjAwoJJjvF+qnYtFSfEEUlp0WC6B15/hUbc/MlBI1SsRsHxGCayOazYEkDWPU77bJThKBlpGx8YdmEauzEAe6xLAHAcdO71IGEqJlgiYlAaMikXrGEzXxg0JC//et4O3gc1K3gMwDy1UcklzRekDDQeoY6EvmFqoZWIWqHedGuzeD4G

3LlhT5Y9aVahk2knwbRIXgAuocUYPaGGCDHuiINcDA6+XVV8ABGh+UgxoeusJe6epsmhkXQZocfwKrjUuirkdSRlofnNP6w/XF/GDaGBzSnFcNwdocdEkzSoIbgVBBUjoa8AOqHCazOhmdyLoYK866HN6Qc9O6Hj2jBcT7ETNOeh/qHyqEGh96Hv1S+h0RgfoY9sKQCAYemhuujgYf3AUGG1xHBh7HtVodO1daH0UThhuWUxsWOkXaHxrubpH3l9

IZPZY9J+AFsQZ9d2kuih4v6JPrihxJMF2kzlZnaHId4XWWgmlQe+jKHGTo5SvOyjfsUB8G7lAcRGrk63cmKDUs5fLw19MqbBcQqmqugosvN8iC7CehZ6hqaGfTthu3yLfPNWS2ABestqiod7YYCux2HGw1OohUdBpqVY6+drDPEy3uAOgAI1NZa2gZgOyyHOgaEB0ma6FgcQRa01YeRfWRQuHIPmo17//uoBxv7sppZO6vq2TpFWnl6TYfmwG+Kv

ZQoYnXJwrIgsi1drfNN84iRxUXYsY3za4ZrbQZQG4aiAREGMoRN8luH64eoRRuG0rPJ+zbwhT2wAfgAwgDqvIgBWBPv+yjygXu6+2brevsTh2RQCLwDez+9NwAtqaDaN/o5urIHRgYf63KH7etaOAM77kNmBhxAktvDEDzLW+oRuzIBB/OAIYfy7i3Qrcc0dZva6S+H63m78kfzb4ZQ6N2aq5kfh38hFOhvh0XLx/IfYpY7hOWwoVABL/nHoZLSZ

3oCekXayXpV+2jzytri6meYCnWShifkUcMcUpz79gLchnOHAAalBqb7DKJm+uUG5vqJ62lIyqm5m8jiKoZPU7zKNAtH83jNbaE/uxcbedFwggdKggr1UEIKkgNnGMDU2zAPpJnKiHBmoC6y7PWNVIPtPUjMm3exr41EFFucyTWY5SwrTfnkCuvsiDBiC+41rmPUC9ls/BFjhCgxDLuY9SAUggpsHLzojAsoCnIKaAvwAOwcLAoKC6wKVcyzGlgKK

0OrqVWVATrfIFnpw7vGoalUkcvtNZDQaEeRBOhHUXgpqRhGEAspQ6QLQNQ/7dhGWTRVusDEeEaNVGcYsnMPWKWw2yFwG9mciYnERu4dJEZYGhQLVrrAHUkg1Ap/G3LMlEepiFRGlyGY9Rbz0M00R1/ptEZMCxz0zAv0RugKjEa7UX0GKEewKzMg6UIsRrJoYTtJKVICQCvZbDwKnEZ5JSAKszTbIehH3EfgCyQKukyoi/pA2Efu6cbKtQe4RhsNm

vVduwRHwkZ8YSJGVQGiRvv4JEYiC2AgogsSRvjFUzXkR1JGW+wzGDJG4vFUR4gKckYizPJHG/TgNHRGikdyCkpHDEaeywoKmAsqR4rMa5BqRpcKfnhC6a/o09B/u8WGY+UpW3AB42kkAfNA4Oun+wJ644cMOzGzqUqx8W9AkganQ9EJ2oB22pt7jXvchreHQ8pe+9B63ckk/YhGa4D/2w4LpeT9aY4KwpkR40KH/vtMgbyAnQFaBvgH7dvLeuf7e

Qc/qvKMkfEySIUH88R/q7cF4fvIPLf6pqOZO057JgfOe2b67jqB4x1a+Lh07MqH+KGCvVj6C1HLC6swpetM9O9E3wcQIO0LakzrC+00GwvkxF0L6QvMaIFM2wpZCjsKfQs5Cv0KAwv3rAUKi8y7zDSFZVS/IM2xwwsDmqMKEctoi6kUJwvz9JUKZwtVC9UKFwu3sB5GmW0vENcKNwqNC7DLN9HcCivMfVTCzYVGfkKdhysKw/WrCikKZUZHDOVGD

kgVR5sL3Qo5C1VHkEO47LsLNUb7C9bpgwt1RyvN9UazVQ1GRQpNR0cLHmjYit4tUrEtRhMLlEfqIOcLzYHtRpzxHUd76Z1GOohzCycLNwuuBwsLdwpTR71GOpt9RzSGBeoDR0GlJUZrC3fAQ0fzFMNHaQu7Rk07lUY9CmNHhPE7C30Kewq1R/kLk0a9RsP0DUcLpY1GRwuwZGiL3S3zRuULa0cSCm1HkwrtR+QDFwozCjgKswurR9cLa0bdRhtHP

Uec6l8ADwuZB3hQ3GA0ARgAh4DBCW07J4bX8i/bYgZsB3Q1f+JAXMFHCnU3zCiQu/HG+4G69YYmBg2G+p33h2DDZgcPBHeV3E1PhgKHz4c6IK0Km5FSsLltxoLUteVYEMf/Gu9FkMaBg4y0W0aJCxDGAYI08zlFaRreRwTb5tHuUXAA6H1DZCeH/HrOahn6AUeCep06FS0QgCKCSsv6Bu68cfi8MRl7rDphRjBHsgdt6neGelqUB0379NpLhqlof

/NDO0qAtAaHkEOdO/WAICR6RwoMIcttwyw9LTIhHQsVmpTHIwo9CxVHuOxUdUUK3QqBTRIhyrA+pK5guWyR85wCb8B3gXMD+IDkOUQGXUD9UAvsqkdZrbttWohmzDMM141mAFzHlM3PDNeMWAE8xh2MWgG47XoA/MdY8MLMhZ1kxxAh5Mc0xxTGpEJUxzgh6wtiIDTHZRQ5C7TG1410x7TGtoMMx5HpBkDJzBptamyEA10xLMdAg6zGDdFsx2YB7

McRzPj1nMdcxkgh3MeCx7zHh218xmbMAsbXjILGZsxCADqawsYkhjO6IwtEtJTHA41ixqkLC9sSxh2JB0bZCh2M0scjRgzGVYCMx9Z4tNlGgvLHCgOEDQrHm0Eg4ErHhYDsxxIgHMduRjgBUrCqx5TM3MeHbDzGZs3qxh2NGseUzZrHh21ax5TN2sduupY6mkqTAW5QwGLlhz4bStsVhkrDRBlTrQ4tEEacBih0XlVQR0UCeMdkBuFH0DK4e/OGm

5rR+k97+HsfmYJJAFqzCfxZM/0605VTkUrRtQuMDCB3gJpR6djxAmPsb8DRxsrHflqrmLHHUcfRxyebe2OvR+4rYOsnob4AdYHpALR7Z3pJRqBHXsev2sZqlLG8hmlH/WD7KVJQAMYg+408vqBhx/+YzEr8B8oq5yI8i7+V+nxHigNaPgFrAMDZiUfaBr16CAdL+tX6Q5jVaQQTw/Ll3GDN14fiezeGsobGBoAHcgbZRmj68Ec5Rm2VP0iTCC90f

Aar5KtopMfcQKZbDYBmW5rYFjpPUQTLdvsS+kIHlaNrY0ohacYgR/Q6GcYD+/za9evikWY5NfrVLAfaTQkNe6FHs4aBx7XGD4rU+9y4+cZ3aAXGmAeP+9yLKcI8PbgkJCwDWscBU5T1cqIH6caf+6BH92vXWo3Z4QiX+qYJAgVKWXqZM4fDx9FamUYkgy479YYLhiHGY3qNxyPTJhTNxnEIwrPh29N773v7htAHB4eSna4TFQFQARC97N0sBjoHA

UeshoUIWNysolXHA3rFCZ7ASnV6e5T6a8b7W577WJMooR1abFgTxur7mAeTYX6K08dX67ABvgCV2XAAe6plx2OGBAfjhmTa+vtx+QRIQ/tTh1SiO8F8MEyIucbDeyJKwcY12xvGOUe128AQYcZNRdvHSCStx1VljkjtxjKEHcZ1IJ3HXfpdx3hR6gEQmfs9aLE9x2jGLIYvx8fHYjroWp3ERlGAWxwH+MK/zGlyoivFB1l616NoBoZ7baKQJfnGF

4UFx9naSqL3x0XH5tCyAb4BMADgwSehaYGexqFbGcYLx7oHPcy9mRm6sCea/ZMIuKEU+tBHAccyhggnJQfc+gTHebtlB6YHWsoNs+SpcdD/xmr6O8Z8OrvGddzP2d2EICcm2+oHeFAn+ogBiwDHe8MBB6NHxuXGmVqZxkvkIAf0LT/6KeDSwAJLK8ec+9BHI8ZEJkm84/qzfF2pASTIJv1h1kuGk+r7gQGoJpH4xgNmACgB80BGfIHwWCaW2/PGD

+r6+kPZAnkqWNnGXenmCctNtYYm+k57+fJAxg3GpCZo6/1hr1oeW83H0iUAJxAAbcZ9oEAnx9jAJoKh1CcYOuV6SMES8BgmTQNrAcos8AYHq+XHmfoRgdJB8+p4J5m7x4gmGKFHbCaEJnWGpQKcJm36ioYwOePHyCcTx1P7lMJ8J/7tnVybADoBcABwoTFyQifAesImw1oQOlQERapnxw41ZGLS0TonBCYjx4Qnd3qhCsQnb2t3h/KGkFukJm37b

BkBJeQmJ90UJ4V7lCeR2nvGPnoMhwjytayIASQBhSOne9XrVXqL+l7HfcZgRhTr9tNjQRvwLCa/4ID6Z2hfxij793sm+w96cEc/xw3HtdqakC4nMfgw2b1qFr3DO8OVdIPTgYds77jiIZmCF+LXjLEnaQo7h8fY8SYaAgkm/usvwlfrhusVAA0Bgppuo+Ymv3tih34m1fsE4TZZmPMhesYM1qguQGwntierxrXGHCZ1x5H6FAYbx1v7IcYx+uGBf

8cRJvShIXNRJq4d4vip2ZGCsSZdQQwg+NvgQ+UmGgMVJgwhlSb6rVUnRAaVJxkGl+vJJ+67eFGPtRjCMMFrADQBRPssBsZblfrYJzDrhLh24IJLl/tRZHhlHqAeUjXHt3t5JvYmNSOauDei9UHoBpAkW7k/4eATyasChoY7pnpOgU+jVKpFkzAT6gCKqkx9tKuuq6kqKqvlkukqk71Qqux8VZOxUw4z2Uc0sxmBegFyAVZhIgBFPN4bAn0MJ0lHn

/sZJ1/65hX20mlp78ZSUcP79Li2JgHGdiZ6J2vHxgelB/XH8gYKh04mvIf1wEW74BLvvH+g3lqWnZpG0W2LB3gBdscOxzZJjsasx1bGa20igNsNhyazGwbH0swnJ4Tt2omnJorHZybCAsrGUYcI3G5GPApXJ7jsq0g3JlbGsBQaWHGYi/zFhhL7+PrHoOyQKAEcqjQB6gDv+mjHv5rox5AmGMY+uvr7OMc4obgnvsf4wgG79HC5JpsmeSdhRqPGs

DtBx1lGUic7Jk4n0iehx03HOODhx9IkaDKRx6eTxHUI9ETgMcdRStCntPWZgxKAmlHRS7Cm1SlwphYBelCL/M+SNCbd+kjBIWkBfPLd1IDx2z4mU2u+Jhkmo8OpS1mMREGMeqmbulR4wMEmnvuxWhFHvrg3xyaQTWwoJ//b4eJFx3wm/QiiYnT8dYHJMuknxPoaJt7GFSzV9Efcg8d8c9otHcDvKhInAMYhJpImpRo7JyQmuyfSJg70YcZ/vK4mA

Cc7xxHbu8YEypY7MAEBMLur8ADcWuonGVvb2v3H8nWvffiFS+NaJllTHsxehLjHXIe6Jqx7+Kdjx03GhKY+io/7RiZ/ocSmJiZUeroAiCEESvx7wEcQJmf76MZWeq/HP6tGjHjhPOG/R3xyL6B5jaQG3SYR+j0m3Pp0plH6hSaExtv77lqqqVvHTKeF+64nBUe7gW4n8FvuJkjHn3sZgAqodCA0ALuYVorpx2XGyycWJjvCcfk4oTZ7HL1KqeXJ3

4nwJz0mKbNXxhnb3jguJ9+It8dF+rwm/4Cip6z9nV3CILkFiQB1gd8BxqhjhnR6YgYXe99HUAOdgNkRDaDZxyQJBqP4srSmBVr1xqCmDKZgpy9bUlpz5UKoaAzMpyuGLKdveqynTHKWOsABfD336EeGreNLJn3HmKcw6oYpncEASIEm1sIVyRig/KdOOkCneMeBxjwHPqF/x+anhie3xpPGID3GJ1amtLMnoG/6Sls+KuSn/fuBppYmFOuUBDeh4

UDZx1g1n4HAWninMEYOJuBajiezJtImHqc5o2Qn/SZep2qnzKYfW/Inrcbew4omJHKWOigAwkHwAHWBkABWBpynfNqv2limQuDBJQyoYiZU7evwaaY8hvom+hEEplGn3CfCp/wGMafePJSysacZgJFo/ECES5xKCafwB4wn2CdJm1ehyghFgCmmdIxdacamrqdfx7A7kibKp44mOTtOJhMJqqfZpzQE6qfx+vcJGqcVW5qnryceJ4bqNAHUgSf7r

qIBehinUOtYJn4mpaYp4YaQp+Vgev8nZwi0eIC0gKbAI5snAqbXxw0JkaZx+jwmEFKWp0PBMacsw++crXR6hfABdCeNp+onTafCJz+q/LCGbYamBH0uCfiEC5gmp4qnw3shJ9/Go3phJpmnQyYR3c4nnqZ5onInAZO5poAmddz5pjz4ljuwoSbwPgG0wj4AR8cjp8LrQiZtJkrC5ZmewG76tIuikB1gqsoKpxlGiqbK+ogmbZS3uEKm1aZKgPOm0

XoLp0qiMCP3xsKksgFgmUQEDc0rp5ym/NorJ+KH+MGDEalqvKauGOGA0VCPPVumAIqb++vHwceFJpvHtdouCEynPab5jb2m4Ad9pyymVCYDp53GbyYpDK6xCAF6AIQFH6Ylpnr7RGNHQhTRa/tUpqmT1HBCkf7H06bhp+wnJqaOenKHDicExl2n1TBmBjfGFIhRR1JIByak4Icmvs2RgpLphYCX6dMgC4lsHOVNJkxsHf0HIQfOkGX5DaWBzB2NX

6V6zFhJvjrgrcVG5c209BpZRAbArBMgROFyrCZgEMW5QthnRAc4Z5vZ5fg1gGwdeGYVTfhn60b11BjKRGeSzYdtxGZ6jSRmwTukZjtHpuREReRnhYEUZ6hE8h1mYVRmdzVik2cQNGY4ZsjTuGb0ZvXU+GYEZqkG5KWEZmvQzGbEZ0ckJGdYaKRm8clsZvHl7GZw5WK0HTWcZq3tXGclANRnrkivJhBmg6d4UbnSIGOmQoqp0Gbb25+mzacw6j0ju

MDNWtjHDlq+48AtFaeBxpUTxCcn26liRSdFW0TGgpHUqXjZ+TowwwU6GIsBRUILqIpzR81GyIvUOCiK+mZYildH2Ivoi4ZnGItGZ8zTxmboi//99SYN4w0nDQPJ3KXAEhlAewGm88eXphUstKPk+ob7HIZ42R3M06YBEnU9l8ZAEvomeyaIR4898jqFx/ByU8Yfm88zrDMK/BA9pMsKZ6wGXGuA27yHwvgYe1B0h01Ts2pmwKZBxg97O6em+7unD

KeZp44B/gsBJbbTSOMhalEn6ouUzRqLFwxaixFm2ou6ijqLUWa6i3sg9SbuxpsANAHwABeAzPvMh5Kn3ydSp1AnYZyTod/h9md4XCKITKnu0AFm+Sejx6x6VAQ3xq5mFqbHW9GnXjyLpx5mCS0S/bChsKFe3eTtdqcf+lKnzvtpu1/7EfT7YJKG2SaOLWhgm7DXhxfGXPr3ppH66ab6OmUGvPvBZ3umGGXx2GHGYWd00QsJpSfrsi2hWYqF6skml

mfKJ7o4mwGLAXIANABVAEt6vcftOrZmY6cSTDe5xYyXh8Jc6lmJ4bA57aZoB6antSLO203G2WdFkG5nKCafi2FyWjDKEQWzkACp+igAceLeZzL7DqfUWysFJKimKyjJc2VFZdKGd6fIvM5n9iZKpwUmgGfKp5pnKqZUBXVmRki1yUYjDWc0cjaRW4vgQ81Lm4prZ8DqycbRc7uFqr16AfKy/kcgRp1miacnOTjgpAl28CmnujDFjAQngKej+nNmv

Sb9Z5BzERxhxoNmxLBDZ0SmsUaKXHVaI2Z52xUAtYAx47Ch1IB2ps/G9qdB+hNmPmZz691oMnzwZhu81T1UUDuI/6ZVZvNmbqedpxmnNWcyem2V8k1LZ4vko5PhZh9bGEue6+hLPus/Zi+qjAdBwJ/Ap9Kdigrbq1qQJ/anLPonx5n8LuERHDimnnLfSVTBOmvSB6/qY/t4p+1aPyJyXQEkZ2dPpudnxlsxe3NEbEuvp3hQPgCFKvEBGAD+Pd17h

WbVepimFYZfpzDr7WAESfxYIaZZ3YiZXAZ9Z3OHDfuAxm9nUibvZ+UGbZXkY03G9WcuEOFnZMErZ4bLSMDyS53CzWd1UxBmSMBoAHn13l3QAJXYO2e9xrtmqOdjpjcEm6cBVCmn/kDCMWF6WOb5+5WnS3UDZ1u5UaeyWzlnycOH05dnnF0iATgAgS1Bw7mrn0ZeCjL6Z4dXWrBmq7xRPY7wdKmtp7XF9tAZZshnRCavZhpn1WfZOmhm3aZJMJ9n4

UteOwGSUUva6NFKN+wxSov9Fmck57JmSMAkTOqp05qDw+NmnOaA2ujzJMA3mLegzqYfQYL5NwB85tunDMpBZ6EngGa/xqHHRMdyO5UG8NlgBl9MWGd2CT9LJGzAAMQBzq3Yyo4au80krIsUaCGOBn9LNUpsC/9L7jUAylghgMoNSjtL++14IdlwGZUfpX6lS4UdCyj50SyI2+Z5cqG0rCIDhVSPIVpMJen0rD0MOAGHaq35chqsG4sH+2q0CFEHt

xFOYgj1tPQqIfOR+LSdS81Ke0qhBhRC/6QlC0jLU4Fu50dKXUs8aCdLI3inS7cNvUqLOrDKT1hdUFC73uYIy68shQBkm+tKFw3IyuNKQhyoy1/opcqRGY9KHJxCZw1wTTCdSljK5HUgAEjKi0v+KdMhS0qLsV9L+MvgQ6tK9giKhNrmsGg65i9GbmJ658gEAQf65htLBuabSgDLt0r1SttKnsom5qfspueOpGbnbUidpebmqs0W5x+lHQfY2gDE1

uebLFRhNuedtKhxducH6g7mYJ26GvKFZ2qBQ2fRs3IaYjgaFTkGiUHn7uagysmpbUopqeDLQebHSr7nUMp+59DKmYnudKhp50qB5nCwB1FB50NLwedtASHmGeeh52NLziD3Sg9KMcqR59saTGfPS0HnMebYy11LceeJYej5AJDZcAFZieb6rUnnVUop5uwAqefc6lRhaed3Su9Kn4yQh5tKgMspzEDLDUsm54hQT8F558dJ+eeQjQXmHniW50va/

q2VMw7pdK0l5lkgB7Rl5xCM1GH25tYbrG0V5ztRledO5kEpzuZinBlEbufR5rtKLUt153LZ+0oN54Kte+aQylDLw1DQyuQ4MMslTK3mPiGwyjDRCzHt5tdKiMud517mCyUjed3mE0uoyr3npAGPSoRn00r950fmA+ZvSnHmH0rx50PnLmnD5itLRYaWO09C9+CIAQF4hWe3ZkVnSWbFZhXG+vt+uFsRXkDOp+TbZCuK5/+m84cgpm9mmmZAZqrmI

Me7EENiFv3xXATUPjs9VQ0kfYdCy435wsoy8+AX/Bw3BsT18HCnUJpHfMuTIRAW4suIxwOmJYYwkqTL6kq3cp/n7OeuSqwG92dqW6LqRECmwNn9HSdiKnINWBF/+rOGSGd2JkrmceqAFgtnqGYqwWhngkk6ZBhmj1MBkts7zpGGR5nLsMURpDnKS/iD4ZwK1YEWy8Gs55Ghym1EBctfRTbLJqxzRkXKcGz0YdzqjsqaiE7Kx6SJiWXK55E0m+Gw4

+lBhUmC1wJOsGnL4q0Hm0QWfss4RtBxJBbSBObLQOnZy+QXwcsUFlbKI7BUFqHFBcvhy7bKkWtFy8NVxcrRyvJiywLOyqs0BMXXKPawSAgR86cDLBalVGphtcpvLPMiGcvEF97rExikF5ilXJzkF7nKIcsRGPnKYcr8FtQWhcsCFl+HghYOyrrngwrCFk6HpcqMFv+tLsrKzWzEZvISFyCCrBe0xFIW9iBJxihim2cyAXHbjIHfs/AAhSMU5x1nR

WaZ+1ym3dOvoW305aZRUYdniGdHZ5Vnt/onZrPCS4d8WJLaFgYOXfyHEcd7m9UDVr16Ada8wycIe3hR+gCtZvfgruMiB8jmviejp7tmXOYVLFkMSfn4TWsme1y6mNaoYadYe9gWWybasihn6aaoZ29n7qa1ZuQnHVuAI0fLZLLRRtUGMSYdjZMxspgLjVUgmwHikoUAVYAAAMjnbNwQMMCbAYkBsKH6YBKwkrGJASFosgHfAexogS3hFggAFANrT

THjKQoLjYdt/oRWE2rl3S17MV4t68mymR3ndMMNFWiKSRbxIT+wdCFzRxQArq0ymbKYMIEsgEvszUo+RGAAn8LH0MMA3DWLAXuB88hjabCTBIvDANwQsJN85d8BezA8AVghuRb5HRgAWRdoixQAk4IiZJIB+mH5FjYMVIGFF+LhRRfFF3Q5JRayyIEtvgBryJvalRZnoX481Rcsgfk5kYNBA7HGaIARF20BkRemIFZbiQBvktEWMRewofk4BswaU

DkWFAN1FmbMtrB2sPEWzeNVFlWBBey2g/k5UrQUYZkXw0tbVCABNCUGzDkXcSeHbaEX1426QDkXERZRFvOMgxcxF7EXcRfxFwkWFrOJF+KSyRb6OOSBKRbXjGkWBhPNRhkWgSyZFlmshQEzF9kX4pN7MNuo8QB5FvkWBRdNFlMWLRehdXpsmAClFmUXv7PfAeUWHReVF50WtOQ1FocWtRZ1F14s9RZjgg0WqTWNFwUXUJ3HF3whLRanF26wbReLA

O0WFRcdFlUWXRY4RZ053RYUAp2NixZ9FlEX9cyyAAMX3BHRFzEXQxZzF+sWYRc3F6MXYxerF/pgkxaBTFMWzkYUAlkXexbDFmgBcxdya/MX/TBhFx8XvRd3wUsX7Y3LFrEXErCrF+MWiReLACMXspnJFpsWVHSpFh2NWxZq5Azl6RZwlrsXIJbZF14tcxa5FtcXNxZHFk0WhRcPFnwBjxfFJGcXZRfnF+0XFRaXF1UWVxbE+NcXaLG1F8NKoxe3F

qcsjRdHFliXnTjkgCcWJRenFs8WLxcXFp0X+JYHUW8XkzHvF7KYkJdg6Z8W/RbfFwMXPxZDF505oJbwlnkWAJbvwICXExZbCzMAwJb0RiCWMxZoln8WCABxZgjFCWU0JkjA8TtrAH8tMACHgVkac8d6poGmVOZrp0dDb3K7id1nfHPu0DHAnWH/5y9nA+Wb+jjnoKddp2Cm1hadqfrLXkNIRiM6ATkbFwwDMgpORk7Mzkcu1SXhvCCmaB0lmCAKF

pwXmTl5nBwWAkdZyz/QDpzPqXAhqJa4lPsXnJZuxTrm8yxwC2oX/ECal/6VsxfDF/sW6hcMFzOQGEM0YQnLLPKVygwwKcoHJeE5jrq1y/4YdcsyybKWugNylwpH8pb0RwqWbApKlw1VypZuNCs6xVgyFzybs9HqltBwepZtVFqWjGAeRdqWfVUDWCxpupYcl5qWTJYGlgwXfyWGl4LVYAEVy0Kd1cumlr870AS6F/CaheqWl1eQVpeyC05H1peBl

TaXFwbRiKhIdpaKxPaWxBd+y6npSomOlu6WiMqglusXWpcul6nmbpaaiFGWexccl/qWMZYxyoaXqzBGlm7Kicoml8ogppe4RUlYnOpsFz7Lbsd/Zkwih4C6Cx5QH8Iy5t9H92dgRhMJ/9DYcpOmUlA0gh9gAnKzZ05mlheZRrBGoSdukvKawAfAx4EXy+VTKF464brPh9EnPxCxtSdylmnwGKcZHEXqiWJFarDQxiv41ZZ6aWBt5GE0yQvahJsnX

AdqPGdVl+ZzaBpnAdXgtZbNllqUCBayZogXGYAJFhayeoVyAWFirhcYpm4WgpeJp9dbRilUUUtYgSY+Zbt1lNBil3WGfhbVZ/SmNWYBF+9mCEekQULghBc10wGTA0GzMiABUhA6gNUAK0UvaQwhsAEymLoBUbmwALax6oiLlpR0lHTq4hnQM5ewANUAC5YrRWcQYSHHJfQgEbXhiRoXeAkT4WAYsvToIcUAIHD5wGi7JEHLIeQgFxTqKX1RGLs7l

gI1ZIECoUyt0YT1CqIWbK3ouvYAe0dPIGDKgppWYLIDWKR+WW2WTZeymR3tqpcm8iqXbxnCYfEom6wG+Sm51QpwF4od0bA1tFDR5WF3lxnLPqXlNRSBEeV36IGZOhte63volycdCyid5sYytY5I05dQRDOX6omzllVU85brl4uXS5ewAcuXK5cIAauXa5cLl1hpG5Z1JZuX3uUdidU07VA7lnLoPPX+AHuWFmP7l1ABB5agAEggR5dbOuJtMFY9t

SeWWonlFWeX6GnnlwPRF5cpCuIgV5YEzNn4bAO1GLeWoJB3l+GXOEZ8Fxvoj5dql7PQz5ejSC+WcAqvlsfgmSl3wO+WMhcfl9mlNeBfl+rFwsh5ypltP5aqzb+XeYPj4fHH0Kn/lquXM5fOAYBXc5YMIfOXC5fAVjqAy5Yrl9OWUgBrluuWEFcHIJuWJrpVhVuWLsvbl/Qhx5bQ9buXx8lwV5rwCFaIVwUASFa4ZshWnDQoVhrJ3uWoVv+taFdnI

JeXGFe8rNeXYaQ1JJK7jZY4VvAcuFYflg+X/sj4VqQXBFdUxqLLyyHOIa+XxFcSVveWwvOybEnpKnmEQuzJFFY/lhxGp6x8YGptf5YZlvoXEAG5ErxVFgEjfUYWy3sClhSmTCYfYKwU25ueF/LBrsi9AXxrC2oyB2nbQKcZZ+FG4trWFm/xk5f7QepDawg9rEqjAJRSLK2U/vpa+wAzYUGCoyA6PiZ6p8/HQOash09yWVvKDMKBU2aIPcJwt5l7Z

XTm+MYAZ9jmeBf+FpKWIWb3oYGpi8EqgFxMRhBeW0Sn1pEkVhGX5WHCYbwWRruyFgAB1mNIYbHTWCoWVHViYI7NrViNFiGIecp4VsE5nFf8V+4dDYE+V7hXEel+VkVgAcv8QQFW07vBV0FXVGAhV9nUFAP81GGWuTXhVmsVsLI37ZFXklZ+VqHKlLoxVlWAsVZ09EFWf4bBVl9Yx6ShVolXFBd2l0lWmyUc2son3JerAcIhvgG+AAYUS8kGqhenI

eqXp51nXOazxN74KaZSodJRqpIZR7NnRZeEsg+mE5fracGglRu5YpNS5yIuKslagcHP+3hQyjTxgRNqcoHZlg6nOZaii8xRuNhOmiGneNUUK94W//s+Fn0782Y/xirnYSaq5gYmWfubvXEKp4lyJk9jQCsvypdE58sgK2/LiztgKqNU18sQK1/LkCo/yr/L0CsAlPEhW4xvOiTM7VDzjYLGKMu0pKfhRrD/y4ogjgygIXAq/mNdWc/L+/lnyiArv

vLDV/C7l8rgKqNW00RWgN/LzYDjVtAqf8vZhqkoa9VTV2oh01ZmzTNX1ZrnGkIcj8rGYk/KpmOLVppHS1fAKiLMb8pICKtW+WBrVhAq61fXO9EUm1cecFtXk1fbV4vMNIS7V5TMe1dm8vtXc1ewKwtXT8pHV+Zb6ldcwUWK9mGCikKKtlYdZtpXlOY6VkpmV6Z24Veg1wU/puJwgVH/0V0nFWbsJjgWABbbJ7BHJZcLhtNbi4dmB15ynMugfDQqB

NWrhrEbmkL0K0wrBvkHan3qYNatq2KSdCuTIRDWKhyG+aCjlWJ/WbT8PgFnoIeBMAClx1pXogd3ZzLmQXpYquL0Tts2Al9XIaOiqcYUI5d6JtVXEUaxMF6AMqstK0zmXtOqjJkRqit1p3hRJABXxMjziwD0sojXc8fGFslHJhdeZTJIN4V6V1ta7kGFUdOsL2eWFvimJleA1hHrWNb9VnfHgQD1ViznnlzskDQANAEVARUAinut4kar5YbvVxuD1

T3WXaTXPkAWww0Iw8a6JjOmBnsDgcsrtWdmp8RjVNc9vUvEC6fHvcoj0BPDQTASnSuOqyWTKSoTJ3SryqvSvGx80yeVkyLWjlXlenqMacdUAZAA0vvFVku8jCZcpzpWuhAhQTQs7VZg2FTdL+u4xhzXYquc1wMBP9rxCHwG2NYip4Tz9qvPoh0qySsC1nATXSvC10LXLqv0qhMnjKqMqhkqrlGwofoA/nomAn+zktbwEVLXimcw6hT6dpLWJ6Jbx

gH4uRsmFhc3+lVWV8cRKhUGFZhcTf8re6C81o+jLo181uAtuytjJxFTGtbKq5rWkyYMq8croMHuqmqqX/U+GFgAT9mS+wAlLAZM1yjmzNfGKmxb1gE7XGVmcqfIk+096NdVVrUqXypXQ/Fps6eOKzKrVtfCvECrIyZcudSrtteC16x8mtY9K70roteQqpCrtP2QAFmB8AFyAeentlYwPW7XfZfu1pwjQ+P24eNAKadzZKNAZlaVVkWXRld85xwmn

Ne+19VXuOCW1gHWNNagtKrWoVNB1rbW6tYpKhrWzHz216HXUyYeq7e9xyqy2gbDJ6FmAVYiukmM1wbXJadtJu/xQ2HZ+vmXylOMPAS4ptZOZ9I8x2amp+bWftZeoODD/tZ2qirXlKuB1/KqmdcKqlnWtKpKqkLWOda9KrnXTteO1lCrudYgJD8g7mKgAU9C+tbR11h8MdclV24WF7h1XCXXjlfXBdJRR/E9yD7W5taWq+UbY2W2qx7RAdcSI7fyN

tdSEZnW4VJOquMmjdch1k3WUyffo4h8otat1rn1uRMR15AB3EkuSigWV5t2Vy/H9lcP6mdh4kmlZypmK93ngW7Q0gaGVxDmldfIZ9undKedcm5XOObjl7jnbJKnaF6hJWUyCWSzDWcFO45I3sIk5u5cstooAd8Be4FsasAA5Mu9lqOmXdb9lueHEkwySN7YxtZ+o0Ghb0EoB4WXFddm1vd669dKpxvXEpeC5oynWBHjZDvWkSYNZo2rj2JQ1lIdA

+qMKika7h37104SqrzriCAAaTA+q81WwOYL1iVndY15kcKWIPXS0ASFidbX10nW26bfx7gW3VcLZ0AWMftok9vX06x/ZEzbl2iVl42qTTiQ1xOCkNaj5pDXG2YHh5oAy1yEBGZD7YC8EifXF6YWJ7Zm7hew5YdBRBmU6qzXUYFuKHsE7Ne5JxYX/9Z/V3XGAuZjloLm+Be7Jx5AD9bPdPShs6tfZm7rq6sLqzpC66vp2Hg3SQZaQi9hDHOBB1ZtW

kP42h4mXZcsa4yB5AEiANcjMAEuF5/mKOcx16un/Zb5Bz5gfJAhe0vWoSri9ZR4QPthpmg34acBZ+QHr2e31u6m7lcBF/1hsnqNQEDzj9YfW4kBz6qx/c+rnh3Pq1A3e8fQNwjyCCKcoa118/pfJkl6QOZI1jmWaBbL+6DjfFgHZ5eA9FCIZhXXRHxr1vznN9ddVrun3VZ7p+OWTilZpqqS7Db3w4Tm86sIa/DD8Gua2XI2f2ZPVqdNM9fUgGgAs

p1wNiVX8DalVmfWSsKTo5VA+gcYFi28wOVOKZVJf9diN9fXc2YSNsw3gDd4FieCWDbiPF6h/DM6NBRq9ImyNgwTUWqhIbRq6JQRagxr1kSMamY2dd0mNrRq+/WMayQ2WqfQBxmB3wHYGVJYSKpBI/w3C/p9lqfWsdcINt3W5Nb3dCmm5hWxwao92jfpmzo265v85yhmJCdjlyw3UjdQ5iPbZFCS2mPauDfqpo2ANSiya/42ddzya6Pr4ucnpiU9e

gE4ABYAGZEK269XiNetJmo3Tja5AxKl+kj9wCGmW7CYoKuTbjagW+422XseN34XnjaYN/o2jKdImeNlhjeW+hZr+aYfWlZrnYcgjLZqd9rpN9w2pDfeRzxV4OvTYRgB/2ef1vZWQns/qyI3zuFGHajWeyj/42vxHVbYFow3SGYANx2m9Kdupl43d9fuV/3J42QLoiFr7DZu65Y2X4dmNj1EKszew1U2b4Zv1iknibtrTIeBGQGQAcTac9aCWvPWU

Ce5N3C89HBjEb3KBTdGjdqBNuBFNqvGxTe/V2KXADadp8w2ZTeYNoymf7zV1za5RWuVN343Htw66vo95WvYMsM3GTY2NvvH9vtrACjG8Ut6AMjnlDeuF4421DdqN+4XrDTjKH66XtaRWikQZ9VYF502ZtdoNt03JTYb13o3bldlNqw3/fwVN/02/WFnaCLmH1tDa5Lg+YUbNkNrXjV1N5ZnqwHDAKpFawEiIYkBJOtNNt8nzTY/Jp3bVgKi+R9Bo

OeSojoRh0C1h1fWOjaLNyOXujYYN6U3CTZl/Fg3cgxa3JLbb+EDNn2nYrDl5nycx2sN8Afr9uf3N+YFx2sn6482Z2pO59s2LWcyAWsAYAH4irWA59M/mg42H/pUNlM20tfvVntme2VbBOPCBTcDleGceHNnNu435zbFl1Vn4pc9Nlc2fZMrNmSx8WnJIj6LnKPGNig7TIGG8lkj2wdA6/I2MoWQtmW1A4c86pY6j9nwAasisgAx4zk389ctNkrCK

JEPBC6KgSc/QU7g32T91jfX3TalNhKWLDYrNt42R2FXYx9gkts4NoTn2Op46rjq+Ot46vi3IzcIF5k3GcIGwqABj7U8Eki2LTcYxr65uJk+odemqZNy++rR5dcAUv/XjDbGVoFmO6aANpI2QDcq5w6aGPvxaWNgCCQQtkQX6CGaG9zrHOosthzqBj3Mt9PQbLaKNtA30dpKM4kBJAAygYeBL1feGzZnRNfLJz83w6xdkdJArXJ0N4b7JQRUsAtqm

XqXxnE3a9cYt0s3dLb6N1c299cY6xLRpvxHWik2J6YfWxay4YQa6nrrCRoZ9Lrrsraa6oXr8rba6wq3HLY8N5y2tjfwAb4BJ6AoAE+1o4aTNo43qjdd1wOLD+pruL1mF9d+tKY5ADHxwei2ujZittvLGDaLhs364oA+N4y3LutMtt9m7urpbRrjfutqcqa3KvB+6vzE/LsUVh7qlrfWNkS3BNoXAYWtrMgqAcla9gA6+xABoAQbTTZ0iAEotJ+LQ

vssEeRgorkmIUkA/gIxRy63oEBL8WmAzrZJix2xrrdpgQF4wTzet2pcbrdLKbCh8kUyAJqDxLUwAKlBvraetgY4UEDyalJguUCWUNq6HrbXQX63y9LBtyYg5IE2GZG3aYBfwR2Z0bYipJL1sbeHAb2y2MGxtoyBrCWxt6zIbqvN1jkQrrZ+t2mBL/kt1hnB9jMptx63JiEpwNPcf9xPYepAR3nBtkbNUbfJANyhihiJAZHQ+F3KgK6Z/DBUUeRx/

guJGP4BFDfaAeXJtAXDBMmnqUnnqNQBl0DWYMuBngD6AeVBsbdRt5m8hwhiADYHcAHbo0vA8AFJANgwoaCNt3AAzyzFF1OB6shMmRTljMFAAYG2niUkAKEBccfPDH6gSCHdtgMwH4APMMi11OUWgNVYXbadxD23y9qDtr22WNs1tkd5brbpAF/BxST+qCQQFIBNAYg1KmT+wGP1swC7oBsAFSFZ9QoVWfS4AMAAybz6nc1hXVDqGA62u6ELt6gBL

/lTt9mZ5UFNO18QaAGJAVOAoAEttiu2bbZ6wFF4qAFSmP4ByVvA2YoDxSUimaxpWbb4AR9yu6C1ANQAduXxrLLAwKDD4Wp538BgADu2EDhNERfjiYBj9Gi1KgEU8fUAmGAqZMnnhkY7AIVgW7ZTACq5m7c8ANO2PAmJgVuQSWXrt4Wti0EPtzhAu6ELAZAAx7eq8JgBLbbcwtiQlRHkEApbAhCAAA===
```
%%