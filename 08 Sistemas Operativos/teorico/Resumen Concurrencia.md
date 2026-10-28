---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
Puente: lo mínimo de los caps. 26, 28 y 30 ^w0Q9vIeH

No se anotan completos (pediste 31 y 32; el 29 se saltea). Pero muchos ejercicios de parciales y finales se apoyan en estas ideas, así que van los
conceptos que necesitás para leer los caps. 31–32 y resolver esos ejercicios. ^xWR7w7zM

Cap. 26 — Condición de carrera y atomicidad ^kZOYocln

• HILO (thread): flujo de ejecución con su propio PC, registros y stack, que COMPARTE el espacio de direcciones con los otros hilos del proceso.
  Cambiar de hilo es un context switch (se guarda el estado en un TCB, thread control block) pero sin cambiar de tabla de páginas.
• CONDICIÓN DE CARRERA (race condition): el resultado depende del orden (timing) en que se intercalan los hilos. Ej. del libro: counter = counter + 1
  son tres instrucciones (load, add, store); si dos hilos se intercalan entre ellas, se pierde un incremento.
• SECCIÓN CRÍTICA: código que accede a un recurso compartido y no debe ser ejecutado por más de un hilo a la vez. EXCLUSIÓN MUTUA: garantizar que si
  un hilo está en la sección crítica, los demás no.
• Resultado INDETERMINADO: el programa puede dar salidas distintas en distintas corridas. ATOMICIDAD: una operación que se ejecuta "toda o nada", sin
  que nadie la vea a medias. ^pjbVUfD4

Cómo se usa en los ejercicios: "atomicidad línea a línea" ^JjC7EpxI

Se supone que cada LÍNEA es atómica y que el scheduler puede intercalar las líneas de los componentes en cualquier orden. Si dice "no suponga atomicidad",
cada x = x + 1 se parte en leer / operar / escribir y aparecen más valores posibles. Método: numerá las líneas, buscá los escenarios extremos (todo P0
primero, todo P1 primero, intercalados que pierden actualizaciones) y armá el conjunto de valores finales; para "¿termina?" buscá un escenario que termine y
otro que no. ^vNdkLgmm

Aparece en (práctico / parciales / finales) ^4C7RbJYk

Práctico 3 ej. 1–4. Parcial 2 2020 (quiz) preg. 2–5; Parcial 2 2021 (quiz) preg. 1–5; Parcial 2 2022 ej. 1–2; Parcial 2 2023 ej. 1 (LEGv8 sobre memoria compartida);
Parcial 2 2025 ej. 3. Finales: CVW (feb-2021, jul-2021, dic-2021, dic-2023), n=n+1 / n=n*3 (feb-2021), n*2 / n*3 (jul-2021), n*2 / n+1 no atómico (dic-22-2021), a[i]=j
(feb-2022, sin fecha 1), x+1 / x−1 con tres componentes (sin fecha 2). ^VnEV86z3

Cap. 28 — Locks ^lZkdRkse

• Un LOCK (mutex) es una variable con estado libre/tomado; lock() lo toma (o espera) y unlock() lo libera. Se evalúa con tres criterios del libro:
  CORRECCIÓN (¿da exclusión mutua?), EQUIDAD (¿algún hilo puede quedar sin entrar para siempre — starvation?) y RENDIMIENTO (overhead con 1 CPU y con
  varias).
• Deshabilitar interrupciones: sólo sirve con 1 CPU y requiere confiar en el proceso (instrucción privilegiada).
• SIMPLE FLAG (while (flag == 1); flag = 1;): INCORRECTO, porque el test y el set no son atómicos: dos hilos pueden ver flag == 0 y ambos entrar.
  Re-testear N veces no lo arregla (sigue siendo test y set separados).
• Soluciones por software para 2 procesos: Dekker, Peterson (flag[i] + turn). Hyman (1966) es una solución INCORRECTA famosa.
• Soluciones con hardware atómico: test-and-set, compare-and-swap, load-linked/store-conditional, fetch-and-add (ticket lock, que además es justo).
  SPIN LOCK = espera activa (gasta CPU); mejoras: yield() o colas con park()/unpark(). ^cGOLAbRo

Aparece en (práctico / parciales / finales) ^rw5dunC8

Práctico 3 ej. 5–8 (matriz comparativa de algoritmos en ej. 7). Parcial 2 2020 preg. 8 (test-retest: "a veces"); Parcial 2 2021 preg. 7 (re-test N veces: "a veces");
Parcial 2 2023 ej. 2 (Simple Flag˄N); Parcial 2 2025 ej. 2 (región crítica de Dijkstra con errores). Finales: Hyman (feb-2022 ej. 4, sin fecha 1 ej. 5); spinlocks vs
Peterson (sin fecha 2 ej. 3). ^nGoftviS

Cap. 30 — Variables de condición ^vbhnXHbc

• Una VARIABLE DE CONDICIÓN (CV) es una cola donde un hilo se pone a dormir esperando que una condición se cumpla: wait(cv, mutex) libera el mutex y
  duerme (y al despertar lo vuelve a tomar); signal(cv) despierta a uno.
• Siempre se usa con un mutex y una variable de estado, y se chequea la condición con WHILE, no con if: con semántica Mesa, entre el signal y que el
  hilo despertado corra, otro hilo puede cambiar el estado.
• Productor/consumidor (buffer acotado): con un solo CV y if, dos consumidores y un productor pueden romperlo; la solución usa while y dos CV (empty y
  fill). ^7JmbcVwg

Aparece en (práctico / parciales / finales) ^HZlbqNjG

Práctico 3 ej. 9 (productor/consumidor con if: buscar la falla con C1, C2 y P1) y ej. 13 (qué primitiva implementa un mutex + CV + contador: es un semáforo, ver cap. 31
§31.7). ^R7x9j4Oh

Cap. 31 — Semáforos ^NBKIFVD7

OSTEP cap. 31 "Semaphores" — es el tema central de la parte práctica de concurrencia ^JQqpTa9h

Introducción y crux ^bJp59nwE

Para resolver muchos problemas de concurrencia hacen falta tanto locks como variables de condición. Uno de los primeros en notarlo fue Edsger Dijkstra
(el del algoritmo de caminos mínimos y de "Goto considered harmful"), que introdujo una primitiva de sincronización llamada SEMÁFORO como primitiva
ÚNICA para todo lo relacionado con sincronización: un semáforo se puede usar como lock y también como variable de condición. ^oxUpZ01e

Crux: ¿cómo usar semáforos? ^qvGRd9fY

¿Cómo usar semáforos en vez de locks y variables de condición? ¿Qué es un semáforo? ¿Qué es un semáforo binario? ¿Es fácil construir un semáforo con locks y
CVs? ¿Y construir locks y CVs con semáforos? ^s7KjhRhF

§31.1 — Definición ^kNNEpk1B

Un semáforo es un objeto con un VALOR ENTERO que se manipula con dos rutinas; en POSIX son sem_wait() y sem_post(). Como el valor inicial determina su
comportamiento, antes de usarlo hay que INICIALIZARLO (Figura 31.1): sem_init(&s, 0, 1) inicializa s en 1; el segundo argumento en 0 indica que el
semáforo se comparte entre hilos del mismo proceso (otro valor permite compartirlo entre procesos). ^e1EQWwpw

int sem_wait(sem_t *s) {
    decrementar el valor del semáforo s en uno
    esperar (dormir) si el valor de s es negativo
}
int sem_post(sem_t *s) {
    incrementar el valor del semáforo s en uno
    si hay uno o más hilos esperando, despertar a uno
} ^BptXHehP

Figura 31.2. Históricamente Dijkstra los llamó P() (del holandés "probar") y V(); también se les dice DOWN y UP (así aparecen en varios parciales). Por ahora se supone que
cada rutina se ejecuta de forma atómica. ^DZkuzNkU

• sem_wait() vuelve enseguida (si el valor era ≥ 1 al llamarlo) o hace que el hilo SUSPENDA su ejecución esperando un post. Varios hilos pueden quedar
  encolados esperando.
• sem_post() NO espera ninguna condición: simplemente incrementa el valor y, si hay algún hilo esperando, despierta a uno.
• Invariante: cuando el valor es NEGATIVO, su valor absoluto es la CANTIDAD DE HILOS ESPERANDO (en la definición de Dijkstra; la implementación de
  Linux no lo mantiene, ver §31.7). ^XijfBQNU

§31.2 — Semáforo binario (lock) ^G96cgVHz

sem_t m;
sem_init(&m, 0, X);   // ¿cuánto debe valer X?
sem_wait(&m);
// sección crítica
sem_post(&m); ^w9Lz3M8p

X tiene que ser 1. Con un hilo: wait decrementa a 0, como no es negativo no espera y entra; al salir, post lo devuelve a 1. Con dos hilos (Tabla
31.2): T0 entra (valor 0); hay una interrupción y T1 llama a wait: decrementa a −1 y DUERME (cede la CPU). Cuando T0 vuelve y hace post, el valor sube
a 0 y despierta a T1, que toma el lock; cuando T1 sale, el valor vuelve a 1. Como un lock sólo tiene dos estados (tomado / no tomado), este uso se
llama SEMÁFORO BINARIO. ^phE0UrwX

Valor del semáforo usado como lock (Tabla 31.2, resumida) ^ScE5S2nK

1 ^isAve3KP

T0: sem_wait() ^kytnwnRC

T0 entra (valor 0) ^ceSCR6T6

0 ^94AMqIQK

interrupción → T1 ^789gOV6M

T1: sem_wait() → −1 → duerme ^ngJPL8us

−1 ^CK7fjNV7

T0 termina la SC ^w5B7kboz

T0: sem_post() → 0, despierta a T1 ^LUde8P7K

0 ^GI6GbwMs

T1 entra a la SC ^aG6R8GO9

T1: sem_post() → 1 ^6iIlo4uX

§31.3 — Semáforo como variable de condición (ORDEN entre hilos) ^VVymZIDX

También sirve cuando un hilo quiere frenar hasta que una condición sea verdadera (ej.: esperar a que una lista no esté vacía). Hay un hilo que ESPERA
que algo pase y otro que lo HACE PASAR y avisa. Ejemplo (Figura 31.4): el padre crea un hijo y quiere esperar a que termine: ^6mEpwnef

sem_t s;
void *child(void *arg) {
    printf("child\n");
    sem_post(&s);              // avisar: el hijo terminó
    return NULL;
}
int main(int argc, char *argv[]) {
    sem_init(&s, 0, X);        // ¿cuánto debe valer X?
    printf("parent: begin\n");
    pthread_t c;
    Pthread_create(&c, NULL, child, NULL);
    sem_wait(&s);              // esperar al hijo
    printf("parent: end\n");
    return 0;
} ^NH62dUP8

X tiene que ser 0. Caso 1 (Tabla 31.3): el hijo todavía no corrió; el padre hace wait, el valor baja a −1 y duerme; cuando el hijo hace post, sube a 0
y despierta al padre. Caso 2 (Tabla 31.4): el hijo corre entero antes; su post sube el valor de 0 a 1 (no hay nadie que despertar); cuando el padre
hace wait, baja a 0 y sigue sin esperar. En ambos casos se logra el orden deseado. ^G0bfynS3

La regla para elegir el valor inicial ^m6Wz0vrD

Valor inicial = cuántos hilos pueden pasar el wait "gratis" antes de que alguien haga post.
• Exclusión mutua (lock): 1.
• Esperar a que otro haga algo (orden / "A antes que B"): 0, y el que hace A termina con post.
• Recursos contables (k lugares libres en un buffer, k hilos a la vez en una zona): k. ^l6Jvo8lR

§31.4 — Productor/consumidor (buffer acotado) ^VtNIUN1J

Primer intento (Figuras 31.5 y 31.6): dos semáforos, EMPTY (lugares vacíos, inicial MAX) y FULL (lugares llenos, inicial 0). El productor espera un
lugar vacío, pone el dato y avisa que hay uno lleno; el consumidor al revés. Con MAX = 1 y un productor y un consumidor funciona: si el consumidor
corre primero, wait(full) baja full a −1 y lo bloquea; el productor pasa wait(empty) (de 1 a 0), pone el dato y post(full) despierta al consumidor; si
el productor intentara poner otro, se bloquearía en empty = 0. ^uyYo8LqB

void *producer(void *arg) {                void *consumer(void *arg) {
    for (i = 0; i < loops; i++) {              while (tmp != -1) {
        sem_wait(&empty);      // P1               sem_wait(&full);   // C1
        put(i);                // P2               tmp = get();       // C2
        sem_post(&full);       // P3               sem_post(&empty);  // C3
    }                                              printf("%d\n", tmp);
}                                              }
sem_init(&empty, 0, MAX);   // MAX lugares vacíos al empezar
sem_init(&full, 0, 0);      // ... y 0 llenos ^fxZFtNK0

Con MAX > 1 y VARIOS productores/consumidores hay una CONDICIÓN DE CARRERA en put()/get(): dos productores Pa y Pb llegan a put() a la vez; Pa escribe
en buffer[fill] con fill = 0 y lo interrumpen ANTES de incrementar fill; Pb escribe también en buffer[0] y pisa el dato de Pa. Falta EXCLUSIÓN MUTUA:
llenar el buffer e incrementar el índice es una sección crítica. ^KXsmZR3r

Intento con mutex alrededor de todo (Figura 31.7): DEADLOCK. El consumidor corre primero, toma el mutex y hace wait(full): como no hay datos, se
bloquea... ¡con el mutex tomado! El productor podría despertarlo, pero lo primero que hace es wait(mutex) y se bloquea también: cada uno espera al
otro. ^g635KHW5

Solución (Figura 31.8): REDUCIR EL ALCANCE DEL LOCK: el mutex va sólo alrededor de put()/get(), y los wait/post de full y empty quedan afuera. ^GEpyYSZU

producer:                         consumer:
    sem_wait(&empty);  // p1          sem_wait(&full);   // c1
    sem_wait(&mutex);  // p1.5        sem_wait(&mutex);  // c1.5
    put(i);            // p2          int tmp = get();   // c2
    sem_post(&mutex);  // p2.5        sem_post(&mutex);  // c2.5
    sem_post(&full);   // p3          sem_post(&empty);  // c3
sem_init(&empty, 0, MAX); sem_init(&full, 0, 0); sem_init(&mutex, 0, 1); ^roPnfa6X

Lección para los ejercicios ^CNSWjv5d

Nunca te quedes BLOQUEADO en un semáforo de "condición" mientras tenés tomado un semáforo de "exclusión": es la receta del deadlock (ver cap. 32:
hold-and-wait + espera circular). Orden correcto: primero esperar la condición, después tomar el mutex. ^2yy2sCk1

§31.5 — Locks lector/escritor ^QuqcabDz

Distintos accesos a una estructura pueden necesitar distinto tipo de lock: inserciones (cambian la lista: sección crítica clásica) y búsquedas (sólo
leen: pueden ir varias a la vez si no hay una inserción en curso). Un READER-WRITER LOCK (Figura 31.9): para escribir se toma writelock (un solo
escritor). Para leer: se toma lock, se incrementa readers y, si es el PRIMER lector, también se toma writelock; al salir, el ÚLTIMO lector libera
writelock. Así, una vez que entró un lector pueden entrar más, y un escritor espera a que salgan todos. Problema: es fácil que los lectores dejen sin
entrar (starvation) a los escritores. Además estos locks agregan overhead y a veces no mejoran el rendimiento. ^M9QYfM3r

Tip: lo simple y tonto puede ser mejor (Ley de Hill) ^LDKiUsHv

Nunca subestimes la idea de que lo simple y tonto puede ser lo mejor: con locks, a veces un spin lock simple anda mejor porque es fácil de implementar y
rápido; algo como reader/writer suena lindo pero es complejo, y complejo puede significar lento. Mark Hill encontró que cachés simples de mapeo directo
andaban mejor que diseños asociativos sofisticados: "Big and dumb is better". ^tdFswW7d

§31.6 — La cena de los filósofos ^uMHiUslB

Problema famoso de Dijkstra (útil para pensar, poca utilidad práctica): cinco filósofos alrededor de una mesa, con un tenedor entre cada par (cinco en
total). Para comer cada uno necesita los DOS tenedores, el de su izquierda y el de su derecha. Hay que escribir getforks() y putforks() de modo que no
haya deadlock, ningún filósofo pase hambre y haya la mayor concurrencia posible. Con left(p) = p y right(p) = (p + 1) % 5 y un semáforo por tenedor
(inicial 1): ^G5ma8WEQ

void getforks() {                         // solución ROTA
    sem_wait(forks[left(p)]);
    sem_wait(forks[right(p)]);
}
void putforks() {
    sem_post(forks[left(p)]);
    sem_post(forks[right(p)]);
}
void getforks() {                         // solución de Dijkstra
    if (p == 4) {                         // el último toma al revés
        sem_wait(forks[right(p)]);
        sem_wait(forks[left(p)]);
    } else {
        sem_wait(forks[left(p)]);
        sem_wait(forks[right(p)]);
    }
} ^L8x8U4uh

La versión rota tiene DEADLOCK: si cada filósofo toma el tenedor de su izquierda antes de que alguno tome el de la derecha (0 toma el 0, 1 el 1, ...,
4 el 4), todos quedan con uno esperando otro que tiene el vecino. La solución ROMPE LA DEPENDENCIA: el filósofo 4 toma en el otro orden, así no puede
formarse el ciclo de espera. (Otros problemas "famosos": los fumadores, el barbero dormilón.) ^yLmF8pmA

§31.7 — Cómo implementar semáforos ("Zemaphores") ^nsaxmTww

typedef struct __Zem_t { int value; pthread_cond_t cond; pthread_mutex_t lock; } Zem_t;
void Zem_init(Zem_t *s, int value) {      // sólo un hilo puede llamarla
    s->value = value; Cond_init(&s->cond); Mutex_init(&s->lock);
}
void Zem_wait(Zem_t *s) {
    Mutex_lock(&s->lock);
    while (s->value <= 0)
        Cond_wait(&s->cond, &s->lock);
    s->value--;
    Mutex_unlock(&s->lock);
}
void Zem_post(Zem_t *s) {
    Mutex_lock(&s->lock);
    s->value++;
    Cond_signal(&s->cond);
    Mutex_unlock(&s->lock);
} ^2u0xxSxv

Un lock, una variable de condición y una variable de estado (Figura 31.12). Diferencia sutil con Dijkstra: el valor NUNCA es negativo (no mantiene el
invariante "−valor = hilos esperando"); es más fácil de implementar y coincide con Linux. Construir locks y CVs con semáforos es mucho más difícil
(hubo muchos bugs al intentarlo en Windows). ^XnBQHM1N

Tip: cuidado con generalizar (Lampson) ^ZFJkEtun

"No generalices; las generalizaciones generalmente están mal". Se puede ver a los semáforos como generalización de locks y CVs, pero ¿hace falta? Dada la
dificultad de construir una CV sobre semáforos, quizás no sea tan general como parece. ^2gMVMdSK

Aparece en (práctico / parciales / finales) ^s6nUENEU

Práctico 3 ej. 13: ese código ES un semáforo (unknown_A = post, unknown_B = wait, es el Zemaphore de la Figura 31.12). ^Tf86SugA

§31.8 — Resumen ^q5n29KmG

Los semáforos son una primitiva poderosa y flexible; algunos programadores sólo usan semáforos, por su simplicidad y utilidad. Referencia recomendada:
"The Little Book of Semaphores" (Downey), con muchos acertijos para practicar. ^BCR9Y9Mp

Para los ejercicios: patrones de sincronización con semáforos ^cOE8BlDG

Aparece en (práctico / parciales / finales) ^KMSuYWIt

Práctico 3 ej. 10 (grafos de sincronización), ej. 11 (semáforos para resultado determinista), ej. 12 (ping/pong con E, F). Parcial 2 2020 preg. 6–7; Parcial 2 2021 preg.
6; Parcial 2 2022 ej. 3; Parcial 2 2023 ej. 3; Parcial 2 2025 ej. 4. Finales: feb-2021 ej. 3d y 4b–c; jul-2021 ej. 3d y 4b–c; dic-07-2021 ej. 4; dic-22-2021 ej. 3b y 4b;
feb-2022 ej. 3c; dic-2023 ej. 4b; feb-2024 ej. 3 y 4; sin fecha 2 ej. 2. ^dQ8OFPXp

1. ORDEN "A antes que B": semáforo s = 0; después de A va post(s); antes de B va wait(s). (Es el padre/hijo de §31.3.)
2. ALTERNANCIA estricta entre P0 y P1: dos semáforos, s = 1 y t = 0: P0 hace wait(s) ... post(t); P1 hace wait(t) ... post(s). El que tiene el
   semáforo en 1 empieza.
3. EXCLUSIÓN MUTUA: un semáforo en 1 alrededor de la sección crítica (con k, entran hasta k a la vez).
4. GRAFO DE SINCRONIZACIÓN: un semáforo (inicial 0) por cada flecha X → Y: X termina con post, Y empieza con wait (si Y tiene varias flechas de
   entrada, hace un wait por cada una).
5. Sincronizar "con ifs sobre i, j o n" (finales): los wait/post se ponen dentro de if para que la sincronización sólo actúe en ciertas iteraciones o
   valores; no se puede tocar la "computation proper" (las asignaciones).
6. "Maximizar la concurrencia": poner la menor cantidad de restricciones posible (que sólo uno de los procesos espere, y sólo cuando hace falta) y sin
   riesgo de deadlock. ^Nkpe4W8R

CVW (Parcial 2 2022 ej. 3 / 2023 ej. 3): que el resultado sea siempre {1,1,1,1} ^6K4Bo8p2

P0 escribe 0 en a[i] y P1 escribe 1 en a[j]. Para que quede todo en 1, cada a[k] = 1 tiene que ocurrir DESPUÉS de a[k] = 0 → patrón "orden" con s = 0:
  P0: 3: a[i] = 0;  post(s);   4: i++;
  P1: wait(s);  C: a[j] = 1;   D: j++;
P0 nunca espera (máxima concurrencia) y P1 sólo va "detrás" de P0. Con s = 0 y los roles al revés sale todo en 0 (es la pregunta 6 del quiz 2020: s = 0, P0
hace wait antes de a[i]=0 y P1 post después de j++ → a = [0,...,0]). ^l5QpyYDE

Valor inicial = cuántos pasan (final dic-07-2021 ej. 4) ^fFUKpb6V

Tres procesos: down(s); x = x + 1 (NO atómico); up(s). x inicial 0.
• s = 0: nadie pasa el down → ninguno incrementa, el multiprograma no termina, x = 0.
• s = 1: exclusión mutua → x = 3.
• s = 2: pueden estar dos a la vez en el incremento y perder una actualización → x ∈ {2, 3}.
• s = 3: los tres a la vez → x ∈ {1, 2, 3}. ^OvkpfAMT

Ping/pong (Práctico 3 ej. 12): empty = E, full = F ^9o1oNawP

ping: wait(empty); print Ping; post(full).  pong: wait(full); print Pong; post(empty).
Invariantes: cant(Ping) ≤ cant(Pong) + E y cant(Pong) ≤ cant(Ping) + F.
• (0,0): ninguno puede empezar → DEADLOCK, no imprime nada.
• (1,0): alternan empezando por Ping (Ping Pong Ping Pong ...).
• (0,1): alternan empezando por Pong.
• (1,1): pueden empezar cualquiera de los dos y la diferencia entre la cantidad de Ping y de Pong es a lo sumo 1, pero no es alternancia estricta (ej.: Ping
  Pong Pong Ping es posible). ^OiuJJ0Zs

Cap. 32 — Problemas comunes de concurrencia ^FMrxIs3b

OSTEP cap. 32 "Common Concurrency Problems" — bugs sin deadlock y deadlock ^n5B7Ke8Y

Introducción y crux ^M5YVB2Om

Los investigadores estudiaron los bugs de concurrencia durante muchos años; el trabajo temprano se centró en el DEADLOCK y el más reciente en otros
tipos de bugs (non-deadlock). Este capítulo mira ejemplos reales para saber qué buscar. ^7Z3m6TW6

Crux: ¿cómo manejar los bugs de concurrencia comunes? ^rCceHC07

Los bugs de concurrencia tienden a aparecer en patrones comunes. Saber cuáles buscar es el primer paso para escribir código concurrente más robusto y
correcto. ^co2Je6PR

§32.1 — ¿Qué tipos de bugs existen? ^Fhfjmdir

Estudio de Lu et al. sobre cuatro aplicaciones grandes de código abierto: MySQL (base de datos), Apache (servidor web), Mozilla (navegador) y
OpenOffice (suite de oficina). Analizaron los bugs de concurrencia encontrados y arreglados (Tabla 32.1): ^GXN3dlIe

Aplicación │ Qué hace                  │ Sin deadlock │ Deadlock
───────────┼───────────────────────────┼──────────────┼─────────
MySQL      │ servidor de base de datos │ 14           │ 9
Apache     │ servidor web              │ 13           │ 4
Mozilla    │ navegador web             │ 41           │ 16
OpenOffice │ suite de oficina          │ 6            │ 2
Total      │                           │ 74           │ 31 ^mVXc7xXC

De 105 bugs, la mayoría (74) NO eran deadlock; los 31 restantes sí. ^DjCkvtWe

§32.2 — Bugs sin deadlock ^xJBTgRGZ

Violación de atomicidad (atomicity violation) ^W6Hy5JUb

Thread 1::                                  Thread 2::
if (thd->proc_info) {                       thd->proc_info = NULL;
    fputs(thd->proc_info, ...);
} ^xny8ijDx

Ejemplo de MySQL: T1 chequea que proc_info no sea NULL y después lo imprime; T2 lo pone en NULL. Si T1 hace el chequeo, lo interrumpen ANTES del fputs
y corre T2, cuando T1 vuelve desreferencia NULL y crashea. Definición formal (Lu et al.): "se viola la serializabilidad deseada entre varios accesos a
memoria (una región de código pensada como atómica no se ejecuta atómicamente)". Arreglo: un lock alrededor de TODOS los accesos a la variable
compartida (en T1, el chequeo y el uso juntos). ^OEmT23Jh

Violación de orden (order violation) ^4QActtNz

Thread 1::                                  Thread 2::
void init() {                               void mMain(...) {
    mThread = PR_CreateThread(mMain, ...);      mState = mThread->State;
}                                           } ^rh5CQcfN

T2 supone que mThread ya fue inicializado; si T1 no corrió primero, T2 desreferencia NULL. Definición: "el orden deseado entre dos (grupos de) accesos
a memoria se invierte (A debería ejecutarse siempre antes que B, pero el orden no se impone)". Arreglo: IMPONER el orden, por ejemplo con una variable
de condición (mtLock, mtCond y un estado mtInit: T1 pone mtInit = 1 y hace signal; T2 espera con while (mtInit == 0) wait) o con un semáforo en 0. ^Gj2twBiJ

Resumen: el 97% de los bugs sin deadlock del estudio son violaciones de atomicidad o de orden. Pensando en estos dos patrones se evitan muchos bugs, y
las herramientas automáticas deberían enfocarse en ellos. ^Pz0xczLE

Relación con los ejercicios ^IKw4fxBT

Los ejercicios de "valores posibles" y de "concurrent vector writing" son justamente violaciones de atomicidad (intercalados que pierden actualizaciones) y
de orden (a[k] = 1 antes que a[k] = 0). Las soluciones con semáforos de la columna del cap. 31 son los dos arreglos del libro: exclusión mutua (atomicidad) y
orden. ^n4c2PviX

§32.3 — Deadlock ^eTfS5xO0

Ocurre, por ejemplo, cuando un hilo (T1) tiene un lock (L1) y espera otro (L2), mientras que el hilo (T2) que tiene L2 espera que se libere L1. ^sNwecTEC

Thread 1:      Thread 2:
lock(L1);      lock(L2);
lock(L2);      lock(L1); ^P4P1UoGA

Si este código corre, el deadlock no ocurre necesariamente: PUEDE ocurrir si T1 toma L1, hay un cambio de contexto a T2, T2 toma L2 e intenta tomar
L1. La presencia de un CICLO en el grafo de dependencias indica el deadlock: ^ZIf8NuCT

Thread 1 ^vRtvjvFN

Lock L1 ^FceVW4I0

Lock L2 ^EbuZlKGS

Thread 2 ^Ug14wNzE

tiene (holds) ^ZXJ9hhFV

lo quiere (wanted by) T2 ^PRnMX2jp

tiene (holds) ^BW4rFAYe

lo quiere
T1 ^w41T9E3C

Figura 32.1: grafo de dependencias.
Un CICLO en el grafo = deadlock. ^eswKdhqs

Crux: ¿cómo lidiar con el deadlock? ^fjUEVcO8

¿Cómo construir sistemas que prevengan, eviten, o al menos detecten y se recuperen del deadlock? ¿Es un problema real hoy? ^EuR0CWxO

¿Por qué ocurren? ^K69toaWS

• En bases de código grandes aparecen DEPENDENCIAS COMPLEJAS entre componentes. Ej.: la memoria virtual puede necesitar acceder al sistema de archivos
  para traer un bloque del disco, y el sistema de archivos puede necesitar una página de memoria para leer el bloque, y por lo tanto contactar a la
  memoria virtual. El diseño de locks en sistemas grandes debe evitar estas dependencias circulares.
• La ENCAPSULACIÓN no se lleva bien con los locks: interfaces inocentes invitan al deadlock. Ej.: Vector de Java, v1.AddAll(v2) toma los locks de v1 y
  v2 en algún orden (v1 y luego v2); si otro hilo llama v2.AddAll(v1) casi al mismo tiempo, hay riesgo de deadlock, oculto para la aplicación. ^hIOIzXLF

Las 4 condiciones necesarias (Coffman et al. 1971) — las preguntan ^7XT16Bkl

1) EXCLUSIÓN MUTUA: los hilos reclaman control exclusivo de los recursos que necesitan (ej.: toman un lock).
2) HOLD-AND-WAIT (retener y esperar): los hilos retienen recursos asignados mientras esperan otros.
3) NO PREEMPTION (sin expropiación): no se les puede quitar a la fuerza los recursos que tienen.
4) ESPERA CIRCULAR: hay una cadena circular de hilos donde cada uno tiene uno o más recursos que pide el siguiente.
Si NO se cumple alguna de las cuatro, NO puede haber deadlock. Cada técnica de PREVENCIÓN ataca una condición. ^N7FaExoX

Aparece en (práctico / parciales / finales) ^urOtZntr

Final sin fecha 1 ej. 6 (enumerar y explicar las 4 condiciones). Práctico 3 ej. 15 y final sin fecha 2 ej. 5a ("si periódicamente se mata un proceso al azar, ¿puede
haber deadlock?": SÍ puede producirse; matar al azar es una forma tosca de RECUPERACIÓN, no de prevención: el ciclo se forma igual, sólo que después se rompe). ^wjX8SUct

Prevención: espera circular ^ut9d4zbA

Probablemente la técnica más práctica (y la más usada): escribir el código para que nunca se induzca una espera circular, dando un ORDEN TOTAL a la
adquisición de locks (si hay L1 y L2, siempre L1 antes que L2). Con muchos locks se puede usar un ORDEN PARCIAL (ej.: el orden que documenta Linux en
el código de memory mapping). Requiere diseño cuidadoso, es sólo una CONVENCIÓN (un programador descuidado la rompe) y exige entender bien qué rutinas
se llaman. Un truco: ordenar por la DIRECCIÓN del lock. ^PZsDUIbf

Prevención: hold-and-wait ^ht0Nf9Md

lock(prevention);
lock(L1);
lock(L2);
...
unlock(prevention); ^SWQHc5d6

Tomar todos los locks de una vez, atómicamente, protegidos por un lock global prevention: así no puede haber un cambio de contexto inoportuno en medio
de la adquisición. Problemas: la encapsulación juega en contra (hay que saber de antemano qué locks se van a necesitar) y baja la concurrencia (se
toman todos temprano en vez de cuando hacen falta). ^nvw949Ow

Prevención: no preemption ^JMmyCwiQ

top:
    lock(L1);
    if (trylock(L2) == -1) {   // L2 está tomado
        unlock(L1);            // soltar lo que tengo
        goto top;              // y reintentar todo
    } ^y4CmkgvJ

trylock() toma el lock si está libre o devuelve −1. Así otro hilo puede tomar los locks en el otro orden y seguir sin deadlock. Nuevo problema:
LIVELOCK: dos hilos pueden reintentar y fallar una y otra vez; no están bloqueados (corren) pero no progresan. Solución: un retardo aleatorio antes de
reintentar. Además, si se habían tomado otros recursos (ej.: memoria) hay que liberarlos antes de volver a empezar. ^xFp55bE6

Prevención: exclusión mutua (wait-free) ^3DPKFFJU

int CompareAndSwap(int *address, int expected, int new) {
    if (*address == expected) { *address = new; return 1; }   // éxito
    return 0;                                                  // falla
}
void AtomicIncrement(int *value, int amount) {
    do {
        int old = *value;
    } while (CompareAndSwap(value, old, old + amount) == 0);
}
void insert(int value) {                    // inserción en lista sin locks
    node_t *n = malloc(sizeof(node_t));
    n->value = value;
    do {
        n->next = head;
    } while (CompareAndSwap(&head, n->next, n) == 0);
} ^vIWmSQxs

Idea de Herlihy: estructuras WAIT-FREE que, con instrucciones de hardware poderosas (compare-and-swap), no necesitan locks explícitos: se reintenta la
actualización hasta que el CAS tiene éxito. No hay lock, entonces no hay deadlock (aunque puede haber livelock). Construir una lista completa
(insertar, borrar, buscar) wait-free no es trivial. ^ccoce81v

Evitar el deadlock con planificación (avoidance) ^vctCyMoM

Requiere conocimiento GLOBAL de qué locks puede tomar cada hilo, y planificar los hilos de modo que el deadlock no pueda ocurrir. Ej.: 2 CPUs y 4
hilos; T1 y T2 toman L1 y L2, T3 sólo L2, T4 ninguno: basta con que T1 y T2 no corran al mismo tiempo (CPU 1: T3, T4; CPU 2: T1, T2). Si T1, T2 y T3
toman ambos locks, un scheduler conservador los pone todos en la misma CPU y el trabajo tarda mucho más. Ejemplo famoso: el algoritmo del banquero de
Dijkstra. Sólo sirve en entornos muy limitados (ej.: sistemas embebidos donde se conoce todo) y limita la concurrencia: no es una solución general. ^xxBWJDDk

Tip: no siempre hay que hacerlo perfecto (Ley de Tom West) ^7IgyvvNn

"No todo lo que vale la pena hacer vale la pena hacerlo bien". Si algo malo pasa rara vez y cuesta poco, no conviene gastar mucho esfuerzo en prevenirlo. ^UspbkPOs

Detectar y recuperar ^cTJbXmBv

Dejar que los deadlocks ocurran de vez en cuando y actuar cuando se detectan (si el SO se cuelga una vez por año, se reinicia). Muchas bases de datos
lo hacen: un detector corre periódicamente, arma el grafo de recursos y busca ciclos; si hay un ciclo, reinicia el sistema (a veces con intervención
humana). ^1jdOzbci

§32.4 — Resumen ^JCOHMp4R

Bugs sin deadlock: sorprendentemente comunes y en general más fáciles de arreglar (violaciones de atomicidad y de orden). Deadlock: la mejor solución
práctica es ser cuidadoso y desarrollar un ORDEN TOTAL de adquisición de locks. Los enfoques wait-free son prometedores pero complejos. Quizás lo
mejor sea nuevos modelos de programación concurrente (ej.: MapReduce) que no necesitan locks. ^VcHb0gwi

Para los ejercicios de deadlock ^yugo5vy4

Práctico 3 ej. 14 (printer, disk, cd) ^FsfNPht8

P0: lock(printer); lock(disk); unlock(disk); unlock(printer).
P1: lock(printer); unlock(printer); lock(cd); lock(disk); unlock(disk); unlock(cd).
P2: lock(cd); unlock(cd); lock(printer); lock(disk); lock(cd); unlock(cd); unlock(disk); unlock(printer).
(a) Deadlock: P1 toma cd; P2 toma printer y disk; P2 pide cd (lo tiene P1) y P1 pide disk (lo tiene P2) → ciclo P1 → disk → P2 → cd → P1 (y P0 queda
esperando printer).
(c) Cambio mínimo de orden: imponer un orden total, por ejemplo printer < cd < disk. P0 y P1 ya lo respetan; P2 pide disk antes que cd → cambiar P2 a
lock(printer); lock(cd); lock(disk) (y liberar en orden inverso). Sin espera circular, no hay deadlock.
(b) Con semáforos: un semáforo en 1 que proteja las zonas donde se toman DOS recursos (como el lock "prevention" de hold-and-wait), o semáforos por recurso
respetando el mismo orden. ^2xRvf9Ej

Parcial 2 2025 ej. 1 (el enunciado pide escribirlo): una solución posible ^8kKsyKKg

Consigna: escribir inicialización y tres componentes, sólo con down, para que haya riesgo de deadlock en las tres. Por ejemplo, a = b = c = 1:
P0: down(a); down(b).   P1: down(b); down(c).   P2: down(c); down(a).
Si cada uno hace su primer down antes que los demás hagan el segundo, se forma el ciclo P0 → b → P1 → c → P2 → a → P0: espera circular con hold-and-wait, las
cuatro condiciones. ^ciEosLl3

Mapa de ejercicios de concurrencia ^BmkM1wiR

Qué toman y de qué capítulo sale cada cosa (práctico 3, parciales 2 de 2020–2025 y finales con concurrencia) ^zxk0DkvT

Tipo de ejercicio                                                     │ Dónde aparece                                                                         │ Capítulo
──────────────────────────────────────────────────────────────────────┼───────────────────────────────────────────────────────────────────────────────────────┼───────────────────────────────────
Valores finales posibles (atomicidad línea a línea / no atómica)      │ P3 ej. 1–4; Parcial 2 2020 preg. 3–5; 2021 preg. 2–3, 5; 2022 ej. 1; 2023 ej. 1; 2025 │ 26 (y 32: violación de atomicidad)
                                                                      │ ej. 3; finales CVW, n*2/n*3, a[i]=j                                                   │
╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
¿Termina el multiprograma?                                            │ Parcial 2 2020 preg. 2; 2021 preg. 1, 4; P3 ej. 2; final dic-22-2021 ej. 4            │ 26
╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
Escenario que produce un resultado dado (CVW)                         │ Parcial 2 2022 ej. 2; finales feb-2021, jul-2021, dic-2021 (a)(b), dic-22-2021 ej. 3a │ 26
╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
¿Funciona este lock? / contraejemplo de exclusión mutua               │ P3 ej. 6–8; Parcial 2 2020 preg. 8; 2021 preg. 7; 2023 ej. 2; 2025 ej. 2; finales     │ 28
                                                                      │ Hyman (feb-2022, sin fecha 1)                                                         │
╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
Productor/consumidor con CV                                           │ P3 ej. 9                                                                              │ 30 (y 31 §31.4)
╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
Qué primitiva es (mutex + CV + contador)                              │ P3 ej. 13                                                                             │ 31 §31.7
╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
Sincronizar con semáforos (orden, alternancia, grafo, resultado fijo) │ P3 ej. 10–12; Parcial 2 2020 preg. 6–7; 2021 preg. 6; 2022 ej. 3; 2023 ej. 3; 2025    │ 31
                                                                      │ ej. 4; finales (casi todos)                                                           │
╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
Valores con semáforo inicial k                                        │ final dic-07-2021 ej. 4                                                               │ 31
╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
Deadlock: escenario, evitarlo, 4 condiciones                          │ P3 ej. 14–15; Parcial 2 2025 ej. 1; finales sin fecha 1 ej. 6 y sin fecha 2 ej. 5     │ 32 ^lOQpJGqn

Cómo leer un ejercicio de semáforos ^Oswj7ref

1) Identificá qué relación querés imponer: ¿exclusión (atomicidad), orden (A antes que B) o alternancia?
2) Elegí el patrón (columna del cap. 31) y el valor inicial (cuántos pasan sin esperar).
3) Chequeá que no quede nadie bloqueado al final (terminación) y que no haya espera circular (deadlock).
4) Si piden "maximizar la concurrencia", sacá toda restricción que no sea imprescindible para el resultado. ^PemFaKxG

Errores típicos ^rCbkx1HZ

• Inicializar en 1 un semáforo de "orden" (deja pasar al que debía esperar).
• Hacer wait de una condición teniendo un mutex tomado (deadlock de §31.4).
• Olvidar que el último post/wait desbalanceado puede dejar a un proceso bloqueado para siempre → el multiprograma no termina (quiz 2021 preg. 6: "No
  termina").
• Con ifs: que las condiciones de P0 y P1 no "calcen" en la última iteración. ^v95wQHZU

Concurrencia (OSTEP caps.
31–32) ^A7YCDwzu

Anotado del libro orientado a práctico 3, parciales 2 y finales.
Izquierda: puente a caps. 26/28/30 y mapa de ejercicios. Derecha:
semáforos y problemas comunes (deadlock). El cap. 29 se saltea. ^jJpbhNk8

Índice (click para ir): ^kNhOFxLY

→ Cap. 31 — Semáforos ^r6uAAu6W

→ Patrones con semáforos (ejercicios) ^hFeFhyjH

→ Cap. 32 — Problemas comunes ^zfD3A7vT

→ §32.3 Deadlock ^ciSJGEob

## Element Links
r6uAAu6W: [[Resumen Concurrencia#^bJp59nwE]]
hFeFhyjH: [[Resumen Concurrencia#^cOE8BlDG]]
zfD3A7vT: [[Resumen Concurrencia#^M5YVB2Om]]
ciSJGEob: [[Resumen Concurrencia#^eTfS5xO0]]

%%
## Drawing
```compressed-json
N4IgLgngDgpiBcIYA8DGBDANgSwCYCd0B3EAGhADcZ8BnbAewDsEAmcm+gV31TkQAswYKDXgB6MQHNsYfpwBGAOlT0AtmIBeNCtlQbs6RmPry6uA4wC0KDDgLFLUTJ2lH8MTDHQ0YNMWHRJMRZFFgA2RQAWMiRPVRhGMBoEAG1QPAQQTgpJRgBlAFVJChjIWEz3VADGSU8Y5ARLAGYADiaABnIIBDD2zpAiPFlWAFZe8n4YbElBVgBGEfJDWr5+m

jB8egBrGABhekx6fEyAYhYAMwBOGEjo8nl0VC3JTc5GXH3D48QTmHlz+QwODkc7YTCYPKQOqIDh2GLrTY7ADqQ34CCa7A22xgkIg0JAsIy5FeM0YvmS8Dm5HoUEeMm6lL65BeXCgAElcBSUgBdEGEeIchCMTjg4lcd5kmgU0BlPhNAC+7CBuAQAHZLuFLnNLuQqLQGMxKbrqHQmAA5Ji8BBzdqRS6tSIjFrkbA0AAiHhgYBgKvg5ywPnu4twAFE4

gkkqleVkoLh0N7fXN1SxVS0wqreqqRv0cIwtkKRZhyIcnj6EP7MIGQNh3ihMuh2iBFelfQN2gBFS4UNkwAASpWgfHAKDA9UarSZIAZYRYiwGqOtdrmihakT66437SpIEm01m8Ba/WW0LWWJ2nyOpwu11uMQeTxZbw+B0viA2hhotPciRioPBuPxQkVUxREYBRXBhngNgCTPHEoSHICYhJfhJQpbcaTpSBrUnR92U5KM+XQAVfWFUUQFeCVyQLMif

DLeB1UiFMRlVY19SYa1WNNRgLUYK1GRGOZInVOYwhdd1PQTcsAxgIMnzDGB4kSLlo04WN4zopMNVTdNM2zYsa3zeBSKLEASx2X0Kyrb1kFHRAAAVOAjGB4AAAkOFzVAAW8YbBVHoFzcBgNz6BoFyMBERQXPCUgopaFyIBcjokOIAAVEdMgcpzXPcryfL8gKgsOULwpoSLoti+LEsbal8GmGssDSmyMscxJnOCjzvN8/zAuC4r0AiqLRIqhKkpBJg

wDybAND4MJIjGxIADEiLBBlnWHGyAEEcFyTJPHOUdWLAXQsC26ZDXAGkYhURJ0BrahBSMwslk4MB6AAJV8Ka+A2Rz9LJXsphmWzl1nF1awaRB0DmJtSBbTJkCRN7VSIVUNAAWQHco33S8gIeaQ9+gZVUFnIQYILRKDIg6RQdR3QH9yzJYahPEDsQvb4QBOO1s2Yu9HmeCjny+TJ30YT90G/A6QD/CF4MyRDWeRBcoMVuC8QQg4iXIrhSSoo0QAw1

B6Ww/pcI5ZTCOI6iTMF1DraVOj1SdEZLjnPUuI4ygTQNHi+JtEYmmYppVTm6txM8SS/Wk2T3nkxTI3gHlyFUuNI80lM0wzdosxzAz7dM+hSws6P1tskALRcnwXMMehqjCtQnC9EKXIAClgcx1iCpo5kqpoWAAbhcjwosuSugpoLBvXQABKSK7OofzVE4VB+GbmAACtqCNo3m56r8jawXxKtBRhD9Cqv+voCBDCHxgh/WbwXLwLwaBi7xPJcgBHRy

XIoG+ioADq8UtDAKAr1QrfyCmSXgdAwAAEPQpfnQG5IE+BephX6qVRKcxADIBH3Sq7hYR6nvmvTePBdAMFKslIgjUy4VwvowWuN8VCqEbuA1u7dXTemwb3AeQ9MAjzHpXSeXhZ4uXnpsDyy9V6hQ3lvChu8gr7wMJ4UKCUT5nyEZfa+d8Ej3wCKFZ+3g340A/pA3+/8QpAOurwMBzdzHQM+vAxBEtkGeGoOgkqkVu54JYAQ3wBxiEBNkWQ7elDFA

xCOHVU+mBaGZHoUFGudcWFsObm3H0XCu49xGnw4eLBR5VwnpgKeYiJGL2kaQ+RO9Qp7wlgfVRx96oNIvlAK+N89G+AMU/QKxjq6mK/j/P+d9AHAN4qA9hDiYAwJkAglySCUEeKKhggaPj8EJUIYEjxwSh6hIUVQ+aE0vron6OccaS1VArQQGtayYBTo7UQHtKWeojq2DuedV6UArrjVumSfAD1jLPVeh9Og00EA/RkqZO6AM9zA1CHOGsgUIYgHQ

CwGGcNEBbAAFoAHkACahdMDMHILKEWOMQB4wnITK5qoWLznJlcuYy5Ig2k3Bubcu4gYIEYooOcx5Viq3Zqcc47QWioD6HzB8gtBVvkIGLL8EZfxgllureWmtgIwVAuBSC0EETYgAhrOEYoXAoT1uhWkRssKMlNq8PCFtpb8hgP8p62snx20ejRZUapLghyphiL2bFDTbndj7EB2ERhjDCG0aCroPQRzopZCF8hgxxwjHalO6lEzJm0lnHOf1DIAo

LkXKSlYIU3MyLsfqZUwguUACgELl9jvAoQAZ7vj1DA+B3CEEqvGNQFC4zqsIDQ9KiAK1QCrbW+tTBzBGxbQVDBHbqDIISj2i5Rt+2RNqq4Bqw6QCjvHXWht07sCzrbRLTtS7q6vVXXgdA6rTmJEmqC+ATRQ73rAOcy5B5iUjjebtGA+0YjPOOpgX9b5LrkGugEO6fySLOvQC9d6n0n3gr+n2emsLQbVnBvWJoaLqytigOveQAA1Ao5w3R3HAIOUl

TVcbjgJl0BA9omg8tJsrFgkRDwrmzKy9cocOX7g6EeZm/KNVsxfBzE4cwYDSekxKgWwZpXgFleLSWir/xyxhGq+EsEtUUx1bBfVqrDUut1lKT2htjZWuZDa82BF7VEUdbBsits9YFtor6dUlx2gpiDd7di+tg3mlDfxGlM5vNiVjV6eNJck1yXDEpez6a05ZszrpXOeZ85mRiyW79TVECACICFyvY2QABlsWt1kO4W909XLnGcOvbqQU5GoGXseu

+11K6cDmZsKADBxG7Biu4aQuq1GVwCE8GK5jdjYrRnZDab0Uohn4ffc1/WermEqDvSU9dhnN1rpsUK/AwSKIEVATYMD6CKCAS5etRF5AGDQT1Y77kj5vF2zcyugwwAr1blXSQnAJZxhW5029/k9HvZSrsAAQjFKrXhcAfc2AI+QZlp5zIXpXGsGDVAPYlnOgIqPkF7zgVu0qQCiszbNG6Nkuw2QAGWzQuTdMt3YC23ohjehtVuhBeC7fMEdJgtWV

uEJFAEXATXYC1gKgIo4gU74tyOhcmo6O9HmKrjWb0PAsCWKOydrBIZ16RUCgInA8hNiuRUG8LXLkAC89drceIANQuTmDdyuTAXIbCPjWBEy9ttHxbocW9b9cC4BiusI4MBp6DzoAFZuL3m4a9atrzA7TEjuH4Wn1+Qi+vUB6u9msqB3DxyuxTlyeQQy7Dp4z+tb0ACzKVacbUt028wkh/LmMeLwHqyD3uVG4BweurCJZHQl5VRhBVARjzQS1l6YO

5lHA8rMgvd9E/VzcsgqgGhIohgABq7FKwUPIDOmdowKClAoLeXKSFcYkKa+P1fYHd+99fnS4G3032PVAM6Ov4E8i8ugDFEsoFKoLMowtdowEVsCmLgvmyNTiGEtm9GjPARtG6Niq5MPOdvQC8ERMglAI5BtvjkUjejUlwpro/Hoh3EdDdMVEcLVHGFghtClLNrTmyG6Gga5G8MgjSIur/gMuPM1pvK1gEC5AAhdMDv5KfHGOIRHjWO7g4retgIVF

vl4BvvEOYN4BEsSKlDukViVuVpVvwNVrgMLvVpwI1nOnPvwZ1jQN1tgX1v5HZINi5MNlwodpVA/JNgIfWrNvNotstsPL4Gtk1gFNgFtgaEfJ1ksgdgnvrjLj1oXAEpAbdhWrjo9nOm/qFO9pBiOF9jIL9i3P9oDvgMDkEQ/OPhDnfFDrDl7sYQjkjgcC5KjoXFsOjrAJInQB1vdhkT1ITmnnOlAKTvVOTlAb4dTmwbXizvWuzpztzi3LzkFNdALg

aMLsPKLsUgvoFFLhtsPHLnoorr5DWJIKrnfOrkFJrlvDrntnrkVLvkbgkWbhbg7innbi8Tbi7m7nfB7nfN7oYmLD9D/pEaFEHvQCHtXGHhHq9O4DHljvHrcUnhcSnrYOnt7lnr0lXHnqUUFIXrxCXhGGXmMZXtXqfnXo3s3q3u3p3j/N3j6Iki5P3lMoPv5CkqPngP5AlJPoFNPj4LPsIfPuPq0mgmATUjiWvidhvgMdvrvgfkfifrXufpftfrfr

KkdBoI/j/HQC/uKa9usB/nogMT4ECbOsXgAcdMAYoiKS5BAeXjAZsePvASzkgSgWaGgRgSttgbgaoPgYQUFHGGgiQYwWEesBQbIq2uQbQfXB2qQZFMwawXThwW6FwafC5Lwbzu1j4VXHPqIeIa9JIdabeugLIVjowAoT/NIcoV/lQMgsghoQYPsgbJuk0nEoVsVmVhVorvUTVnVg1qEdYRmbYfYb1v1s4UNjACNliGNl4VsFNj/DNnNgtktiDuLD

vHOptlMgHnQTcamZOS5InqKWdhdske7mkXjk9kFFkQyR1uNHkTQN9oUcUUDsguUeLuDnfJDjDnDl2YjpBsjs0Wjhjp0djhgOkfjn0egEToMcMafKMZTtihMTXkztMWzm9Bzlzjzo8EsVOjIKsZgQIhsa+QVDsX6XsdiQrkrscacZmUiVriidufufccbsPE8fQJbuKDbvblbq8Z8e7hwL8YQk/ACfgP7sCa3MHuHhCRJZHjCbHtgPCXufEcnrRdcb

fGiR4NnhHkosodiVeYJcXgpASZAUVsSYhWSU3mzpSdMNSYkj/nSRvoya1rQCyQ3GyePpyU1jyVsvyYRUKcvqKbpevm4qoTvi5PvofsfqSYqVfq5CqYYGqRqePM/t8a/hKe/p/oaRuQOf/oARaaKVaTaWMXaYRY6YgZzi6W6XhYkV6T6XZf6cInYI/NQaGZ/k1ZGSoNGYwbGSwSgQmZwVeTwR0XSLOucTskyTmRITwQWTIWQCWWWVAkoSob/GobWR

klob+ONI+nKCcmcstJgKtHlrcttOdI8oBtQIASBkdSLOBiAJBj8vdM5iZPBkCkht9MJRCrmGhjCtaHCmDIivWNEM2PhpkBAG6O2PIL2EiLitDpjEOJUNUCsGOPAPjJOAyHMLOCMKxnStqjxhMOhqwLcEzAjfAKeKBEpmcFcDcJRveApk+GTX8ACECOpsqoBNpqrHpqwKrEZlpiZshG6maphKjThLZvhInNGOcA6k6i5sGG6jKNRs+oqASJ6geH0G

EDaLTEFoGpxCGmMmGpcC0MxJxpFhJDllWHFrHAlgnEnDGKnBpKljpNnHpJCplu6iZNlsXLllhn9ZDCMHhhkIgAAFLry7CqghhQDIBsgw00ZSwUo0pUqUgpiXCY1kyQQ2ho2KB9y41fXwBriE0sxibngSZXgU23j3D8yPjvBKaiyqYKoghKpc0Eis351gTsac2aYN0806wmrmb6yWaWoso2ash2ai2WxOb5yubd3uZK2HgsDahCRa0BZ+YBq+x8A2

iq2uwsDtCiRhxRaRwJoxyhgW1ppqQpZaRpYO0Zb5rOpu3FpWQ7q7BNr5RVycATzpWVLkLVKuTiErp9q3puTeTLV/1khFkgDUItm7oP3+RP0v0Glv1hIhSf3IpXo/2I6YD/01mANeDiEbrRLbr5bgOP04nQPblyLv2UIIPf1rq/2oNAOSloNYMHKbXojQRvofp7VXIHWgamT/pPJnXAacMfJfI3TQaS2PUIbApHLwAoZO2fWcqUg/We11iQxhC+2t

gUBmi4BbClaSCqCqCR3Yy0bkrjix2MaUh9yJ1zjJ36aMSRChBri8Z9DQQCbAw53IoiYIAk3ibCw/CyYybAggDU3l1CyvjKYfjyo/i10aYqrc1ay6pKz0oqxN310KymZd1oTUhrZ91C2D0i1W3i2OYiNGqUQT3OoeZXLtDByphuz+aa3+pcTL3YSzS2hhCzRG1xru2m3JqH1JbH222n3225pO2X1kTX1Rwe1lqIB5DjyqRMBBTmIYDA6lb15mghjc

5HzxgP3HSVTmLDw0Arw+gigeIEF2WXGp747Z4YONWFTNwpIzOtRhlhSA6YDfzaWplkWRSTRhF87iGT52GtI1A1lIOUO4CyHWKFkuTIBvEQufG56j7NbDKoIuRiCpmDVoJIu+DF7YAPZoLLryq8B3xWl/xfBHytJ0Co6+CRRowACXeZrF1pnA8Q+AH+5z1DL8MU8gz9qATLa8uzCQEslCQ8NkJeaSNL4i7QQC52vkC8cO9A4+dkPcErDL9AMUJzKJ

EuECP8WJ8u1cVQjzD+m56Oy6+AYBK210681uoRhLUeoUGiqig88y4hAA/VrsrugAAPziHNEcsf7vbou8u1TWVe7UDK5BQQBAKxE+EQGgM7qTNdZ/OzM/zzPIKLPLOrOhTrOroXrbMCK7OTC4AHNoJHM9Qqs65oLMtoP+VLI3Nkh3Of6tZYDPMeL7GMDvNyXTpBTfOQPTP/OXq9pAsgu8RgsQv25Quu4wv4DcIGkItItpn45ou7O1RYvdq4t6IEtY

BWuL6kuqIUvUsyu0vCgMtMuPwsu9Lsu7NcuyI8unz+uyKCsKTCu7uiviu1SKvSuyvyvPtSuCXKVp5qs+Gat6KPBgC6vqn6vdpGv6kCKmvmtzqWsCU2u+B2uuJiEgBOtBv1TusgCetnu6W+tXv9bmLOt3TxRhtYgRtXbYNbqxLRtTNxs+GJsuTJsrP3yXobMYBbM/w7N7N5ueAFu+lftXFp6ltHvltzqVsNy3Pej3N1tPOcAvNNstufPtsgA/Ndu3

49vXr9r9v0dDvgsuTQuYmwvpVTvIuLqov3wYuLs4sSxTIruzKwfEshSYtbsuRUs0uuT7vUCHuhTHs56nucvoK4d8try3t+Qgkit2RiuMAKufvhfvuSubDKvIk66/vmL/t3yAfAd0gzM0AGvVzgcmtMBmuJAWtrtwdNIIdzJIeOuEenwYdYf+c+uXtBc+E1chskeSIOLkcMMSMsBrQsO7X7WlycMnWHR8OXVgafIQbfLCMPWAqIYgqvW/TSPQqyMg

zwrYaQyqgqMiznCRCSAADiEAdk0NxKct5EUy8NdQdGSNlKJjCwKYSd7GONdMWd2otMfK7jAqhdPw7QqA+tlwlw8mgTdNTQ/o5wqATNSTjdsTzd8TBmoEUPHdxqfN6TAtJsA9qkQ9uTEts3LqRT0oVGWMCoDsvoh4AcM4fqGtnsGt9TjIzTgkaN0a4c0W7TianTBliWw91tGa1odtOaAkeaWWrRJtEKCKijyKLQ23iAkQwdb08g/tuK+Yp3WMpciN

zQxjU41o4ay4FjysxMGNrsmdsjwcmNH3xNX3XjnMv3/3gPpdkqim33ITcq1n4T0sddbdyTMP7NCTMPiPWsvNpqqPFqgt1q2TdqeTVsLthTuAbqk9dEh4YQlwkQqt89NTNPIWq9LQLAgch4rTLPN9bP8WHPltKkPTmafT/P24uYQzrtwvrPB1mQG0y7n+bcjLVQug/kSLyimiSL8HOXUbeDTf1nfOBx52cC7fKgiLlX5CPfLkff08FHzZO6Q/lQcL

HCbfLynf0/9SR8vf5X/f3XT6HQByrDg3Nyw33Dp147Y3Z0V1k3N103vyBTyKYjL1YKb1qGK3+4a3v14v6AgPgNP2iAGIyMAQwxGNMBoFwzK8hwZaa7ur1VBx0FgAPNjHDzXCJ0WgLKexvxjxrwBvUpvNxubybpk0fGcmO3jTQrqO8q6YTKWDLD97qoveLdRJh70boB9u6/NYPujxABmwcmYtHHmPWlpuYSmU9EVCMHyTq1qm1PaprTxtAICmgHQV

oHn13qxZ2e8cI+jbXL4Zx+mAvQZkLyLSjNb6eDOyBvw76JQdkkUXBDY3ER1IVEUUKKD5naCtxnmGgdosNjKg4IRgg8OyNYKwC2CN6M9RwbJ2cE9Zxy5g9wZ4O8ECI/EfgvxBvFCF8IvBM/SIXYOz5mDR2LcUrCGH24UA4oHAc3EFHiB+RaoyCVktfzjAx4gECQ+pL4J8wjBUhLGFyAtH36uRdgxGJEK3HOB/BLAfgqkC5DNaYAuhPmHodOgGEz0Y

owwvwU0GngxRGAtuRgE7h7hIsZhjAAAFRNB2hnQ7oVMOtLLC/Eiw1Ya3D6EjC5gWwlYbsOtLzDrS/kdNiYJbjjCWARwrYegBSDYBuQtudeEAhbgdD5AIwtgCWTn5TJ+AyCY4TFGQAXCkWyAQAEhEPcTrH8WHxxsa2RRbHB0JXjIIWAs8AfmXCMHj9N+pg2Ia7hwSWDKhNgqIfYICFTQXBIQqKGEKsGJDqh/gluE4IpGSBQhHgmkVUJJEsAYhDxXB

PEIiF0i1heInuOkMyHZCPceQjyHeyKFwjXKM8fuBUL5EcjaheI+oY0JiS+BmhrQ9Yd8O6ExRDhOoz5kcLGG6ARhkw6YbMLBHWlZh+wz4RsMGEnCdhU/FYWsJbh6i7R0wh0YsIuGT5rhk/W4caM5EPC34zw14e8MYA2jtRPmX4V0X+EojXcWw0EQsPBZQjdsXuASlWycggloxyIwEVFHRE1QcGVHQwcYMn4CjuRBIueAqOSEOCGRgQpkW4NZFEifB

HIoUYyOCHMj8RDYysdENSE8jwhtIjkaWPMGtwMhWQnISYEzwFCokxQlyqUNlHyj+xyQpUQ8RVFND60mo8MYaN6EihNx4wwYUaNQAmiTh5oxMUsOtFfDAx2ws4U6IOHbjNh7oq8V6KuFgBWO/kP0QeIDF3jq4wYt4R8PPHRC5Cd8bMUCPjEWjIR0Iz3LCPTEIisxAI1EXmOlgbUeuW9frhcjYZfohu43LhgBlG6vJMJAjKbkIyf648nq83CRlIw+p

f8MM63L2sig2hS9TImKLYLgDehbAfAejVXnANu6a9KQGYCILrzh5tBFA7QOcE4y5QhBeUBAjxgXUt4nBhUoqcVGQOB6UCVM1AyHswJMwMC4erdKJu3X96d0UeBsDJiHwx62p7MEfUelHzx4x9BBHqePqnTmDBxU+kgpehn2zgcYOMlwLejGmNr19/GKg1NN03UG88K+ukKvnnEskjM96qvEdJWgqh1pSsrRZIDoSHR4M90cUhjolMX4xIwGaU3rh

OgSlPAkpCEh9BIxfQn8Bu7DDCbfweSX8cJJ0PCddVuozd84JE8Rshg/7LccBP/BRkinQDQ1ABrYVAPt2xSlYNo8gN6PQHYmwDDGN3BjNxLmBZ8/UljfGlxn1r2M+g2ArOnINVD4CiaUkvYI7yky+NSB/jMulKmUmhMXeNA93jpM966ZGBvvdSXpOR6B9DJaPazFwOFrh8+Blk8ehSDj6k9GUifRmLUwNDOS6mrkkOAJFdihxvJbTAvvvRTSc8ray

WXppoMr6C8IpdfBGdFJABFYCgd8crLsAADSrcJeNZFVzZEUyf8IoWSxTGg5x8TxGAP4DUBg5B4ZkFuOjnchXpkELccHJ+EXS5c3gHMrmf5DNyLp3mzWQlgAC/px/FKIrVC1z8sTcbkTFhbhPLYpUKVeUyi3AdZlE0AzgOgLOnJmA5XWWwkMO2AKDsE0CrcB1lgEkDSydS/kQtvGx9DEFscEYQgAWyQ50AFI52IKHWgfj4A/4guRgGbMqgc4JiKBE

MGaBYKtx6AeoSYL/U6w9xdgdkAoJVGuju4aZ9ZWeOXg9A0BARD2HAAEDQQnNhKUATcq5BoBNp3IdAYOVhTvipz05/iBtpnmuigh8cHSQ8kkSHwtxfcgJfghKx0CeBpAhZPOUSTZBzYMhDQ0aft1bhEAXsQUT4WnkkB257cxwwePVkCBvE5g/cYXPARmxazdgLBGKEKSzaBt1glUHZl6EuE/EWOq6eBvJX3JzJfSd8YhNvLXm257cDg5dLjjXgZ4J

YKRFyB9EsCScp4aCJnFQBgR3z3IZ6ccgMUREA5EqCQcfOAs8K3yfASCNVhPOMoHA2s2XRfAGXoD7QiA1nafqiMSKXZRAzOGAFsB2D4AYo88LXHxXaGrzgxenL3NwEYBiJewEAb0grm1DNNKZ/VD3M4H4KHzNZHOE+dzn9Chd0ARlCvPgs3IpjARpRMhZnh9G0twFlgQwLgEsA+AwAMUEoTAF0XvADFZCqABaVvSWBq+PoMQNJVMXLEcKTALADFA6

E/Z+AZi/RbekRyHFSwYAYKN4S7ygFZkR8M1pHgnm3Y8gdkeAgx2xQky3iwRRdNqyOh/xW4t+B+PWnTmwl4gjWQgDQogDKFMAuATmamXrjnNOsX4LYJzLEBvBqlnM7QuRF0J4N8ZhMhJaTJbjkyUAIi7ghYlpmeB6ZFRMWWrOZk8yJc7M1omUu5msz45q2QWZVGFlTLRZqswEIQEllDwZZcs1MQrJkDUBlZzFNWaxQ1nHydZes58gbOfoZkTZbrc2

ZbOtluhbZ9sx2QpXcguyBCdVaMZ7PxzzJfZrCTPIHNLkhyDQ4chKJHJpzRzY5HZBOdQCTk/lPczcjOQlCznfEc53gXBbQsLkQUwQMgfHOXNUhVzK4tcyBuESoApjEVrc2TtQEbmdzZ8uiHuZdlbgDzhKxpO+MPLBDjkDAZQxRSfmnnLYFoc8heUvLYU7zv5cYreavN3n7zXIki4+afKIUXz0FCUG+YEp+ae4tFNC39i/JdnvyPEn89eS5F/nVx/5

YZd8PgGAWgLwFXgSBUtRgWT44FC6WoLzLoDIKscqC/yEqrHiBKsFriHBTyuUWiVfKHAUheQvmR+JsC1C1yB6HoXUAmF0WJygrk/kcKXcQHfADwsih8KBFrcIRWEF6UplYQbWWdLKukUpRZFREEKAovLx5AA1hCzrGotwAaLEkz4x+a5B0V6KDFXoYxTONMXtq7y/UaxforsW4AHF0JJxdhVDluL/hni7xborDyVZdAOwQJWZFnKJJQlF7LcZEuAU

xK4lRM0mfbmSVdpAO2AdJS3EyWiE05BQXJRvCODeBXIRSjwKUvRzOVKlnuBpdPDqVRcJYNS+CVEko5gM2l8SxJV0peg9LmOfStFXTM6wMyRleQlmd6QmVBLv17UHmXMoPUzxFljAEWe1HFnrKK8UsrALLJTGQTFZ+y07KsvVnfEj50is5frNQCGzrlL0U2XcqtmJknlmAB2U7Nfl2VIEnyj2YAu9ldo/l/sidEHOBVMBQVICmORCrZAxy45fMxOQ

0RTnZKkVu2bOXy3RWKKC5RcnFaXP44doCVwJaucSqxwNzyVymyldpRpUZFu5VCgJEyqEoiVZ07K0eVypng8qp5dkGeQKo2jzyW4i8jlSKq/kbzYS+qjedKpcjFqq88q8+RxwESeqVVd81hRqtchar4iOqpamglC0/zu0Jq1Sl7ItWmKrV+OKBTZ1Cj2qrhjqxBS6s1LKF3gHqzpBgu9WgJfVIUDFdWvEWBql8wasAI2ooW2CI1wSKNXQoYVxqWFn

uFeYEGTVcK01vC/hTfBbg5q81yCAtRIrNBUaotZa+Rf6o621rPc9a3rVotbWdIZ1hirtSPncAnbLFA62xQZHsWOLLAziidUWCnUrwZ1vi+dQEsQ0rqISCkMJaFAiWvQolFeWJUzl3VJKBZh69vierPXIIL1V6/JbevijFLH15SlQC+rZVfral9SzHfBLfSMNn021RaBVPQnn9MJI3f1OdX4aNTH+91Fqa/wW7v8luFErqfIzF69Tdg9E9AFsHODV

5cAUAYjOxLhofdOJc0hkDPSz6Pc4ez3USZSGQGuM9pFvYJicGt4uxbep0+3rTUOkwBQe6AcHmpNunQ97pWkpgQbqR5mY0mb0jgR9O4HfT8muPP6QgFlpE8FapTA8A5N64OSnJgWKQZDPp7MomeO9EXojK6Zc9UZGg7NKFMxkFpIpJcNnfWDdD0T8ARAEYHm0YC7BJe0AqOmrwqZx1ORm9SXZBH140wRJOAk3hJIV1EDDpKugHkD3OmW8qBV0/XSz

Q0lG7tU2k5vc9PN0WYjJnAm3WZJ+kFoHdlk13RgM4xhBtBVPb3S5J1qMhUwCAloAgMUFB6/JRfVQYFJ548SQpDtMKc7Wj3Yz9BpaZfs31H7Fit+3fBpHvzVEH9mlKUsuCvxs4t8x+E/M/REN35z99+C/fMX+qP3D81+rfbESYK76v7Qol+s+J/uKmHIj+hO99MTuuQ/oydtUinTf3uQXR7+TUoiXTueoM7JGHU5na91Z0bdkUIYeiYwH24kKwAOg

PIFNLJQx1F93EzkSMFDjLSoIE4YvetPKZG99weA8vXnRh7EDjpfjAJnXuCYN61METZmgahiat79M7eyQwOn0mvTe6xkz6WH37127+BrqGySZBH0iRbgLQcQQGnBna0/YIqUw33DWhwz8+B+4PcXzUEb704Ee7fVHqvr76op4zEAFiOf24iHiIwHBHFC6XxhaoGgaUYQDSXE5Ek7GqJGAFC6f48RqoUpF2NJH+z2x/hnRe4HAXkNbVvgcQrCUbFJD

uhbYyKKqB5yFaGtJWmBJkegXZGQA5QxgHkf5GpC/ELcSaKwkGULRV5gAEaAzQuRxI7OEaMlHpAJpbKpsx6huhsA68Vie+HpkdorWYiVUWfFciZr5tf4yMakLmh/CgJo7PESMFhKfgawZkUKBQBoAVD41rCxEYBNgm2DlR8EwdGA08M4jBxLkXw/4e9IbApoIR+MMevCPVxIjismIx0geLxGKxC4vwQ4OSORRUjx29I50kqOlacjfY9kckPfaUjij

CxUo1fPKPqjkOqhGBPCfnGImJh/R5o75EbgNDOj3RhE8SMXFEm3CQxs0mx1GPjHJjXaKDTMcIRzHVxSxxNbaM5FrGAJMYnMT3G2O7G+smGxKb/GON1HTj42mCbGK5HeIf1TZbKTunuMmDHjzxsmYEfeMlDPj6S3vL8ZkD/HdEgJhIyCaSOuCXIkJ9YJYGhPrBYTuJmo5SabFInCjLkVExdvQWYmaFX9LI8ccdP4mqThJvEU0ZaOkn2jgQLoz0bNN

9HgzAxrKvSe+NjGJjCIbZdQE2DsnIo8x1RIsbm3cmIxvJvEesdlOCnUhOx2PKKYOMSmTjY2hXMWcoXXGmleOpCeVNQln94D1UrCTw2v64SOz+Eh/oRNp2WTWpb/HA0zqhQs7MMceyGAtHokUB5AKEPfL2HkAQ9M9+jaOvRhRr40Z6BeimL0BYyrhODtkblDwdEx8HDpcksVNVHV3kCgmHMUQzXTd6RMO99A6QxzRN3PmkIChtgUHysz90VDmPHgS

PWf5D6AZDKQ8H3FpST7F6EMmfTaCz76HtIS+3yWbQPq2H19J9dGZHp0FYy9Bbhu+rFI6ATpiM6mslv5WcW/4MR5aAiw4LrTEWBlR8NtNhQotf6l+qU6i0RZIsNJGLjaZixAfx1lSIDp/SqaTo7Pk6gMPZlA32fQODmC0w57A+RPHP4HJzhB9APt3omqh/auOVAMRiICSBqDBjClKLvxqpgUB2qO0DtJL1Z0GDudU87BH4M+Na9DvevSpMb3iG6BO

mTVA9MMxPT5DL0785bt/NZMALtuyPoPoEHFNbJgMzySJCqaGGp9MFkw6uAB4cZYZzPJQR7RQtIyS+ycMvsFMwtOHsLe+3CyXHcNtLkExGBbGyA2jQ4Z5yFeCjTh1ktCltFS4nFOjFKvLIGSiGZhvglxGtwi8y2VOPnMR9LyLGZKuK1laPoBXIZCmQC3FQAUAYo3S5AFzMxYpLh4S14jt8TzZBtl5y6ARIFAh26b3IFARyJgDJXIIeZ+AXY2dCwBz

WKA6OA61iVEJ94CqxlZQv8sEIMkX6nWd7BtYSjgbOLJFfRGDhigJRxrkwSBEFX5zNpryd8JEAYRDDTDnKd8bAOcDYp3wfAYBe/GxzRi+AgCeW5rNmxusCIEoWbd3OvketnUF87VQgDFHDbr53lIFM8suVfKKKjBMrZeNCTEDXQ7CFyXq63HZbnAOhaCR4EwglzC4frGNl8GuMqio2xh1zJgLzfZICV/rbKzYHmyqBL50tmwVhNQEODszltAa2dM/

WQT+bBlCUX9i0Nbh+zIAm127DLBuMtKy4ZVlyBVbehVWary2OqwhVJItwmrYGlMmjtavS4Uqdcrq2SB6tHALks+CHXooDYjWmLY1pYvSycBTWXIM1sAHdcWsgblrqytawIj+vu5trRrXaz8YKiHWzm/kE6x4HOte5WZV12SrkFuvzWHrwRbSs9avKEk3rfszPFA22W/Wc7GGrfIDasLDLQbQiPZpDa/yjWTSnueG2VkRt3zOsqN9G2PCxuAEXOeN

mKJ7MJtY4m7JNnwh4HJsSlKb47am/QXxv02JSjNnol3IETQa2b6tzm0cG5uK36WytgW5wCFseJRbr5CW57neywh/IVthKHLfko8337vVo+KrcSIa3oSXGrVjrY6L62v8K2jMibfTvCqLbzcK2y3BtsJRQ23xB200t/WsXnbLkAmeVcqvVXarrOeq5MSZx+3iMzVoO/HhDucbMS3V1q31ZjuDU6tPhBOzxaTsPNJr0126JnfmvZ2KZedrtOtcHuEP

bsxd+IK3D2vl2OiR1qu6ddruXXrr+9u663b2NU37Kr1ivO9eE192UxA96yEPf6UGA6ZPUaDePfBswAp7AxGe7DZcjz2MhSNlMSvZTGY24E2N5BLjYnjb2M8u9l1TEnY6E3j77kU+4RRpuX3SODNvjkzes333hlj9jm5rfwCv2xYkDpfC3EFvC3tWYt+gP/ffJS33IIDp+OcHltbklbUDsbO9mwJwOtbb81wg3D1v0ADbYiwte+Rfpm2Q28lXB/g7

tvv7wQuOxCVAZbOfo4Dm0BA9hKQMSX3k1OgczBkwOkT2pY5/6BOeol/9+wA0zIClHQDEzWhe+egJikF0XdhdM05GrntVCYZmDs4ScDLpEh8SbLn3SvTJOr1q6hDTlpXdrrB4rnHzEh4zFIc8vG7Hppuzvak273vS/zfernuZOAvhWCeJKeWiTyuQz0N6HB0GQvVT7SCRU8+hAQHp8k4zMrIelGblc335WswO+mvsWFcOx6VLEdI54gF7CYpMA8gT

+GaHXhqXVzHEu5znpMYpg7QplimEXsN4vdjeFlz54QLPM/O/uquxy5rucuXSxDoL9y2zS8sI8fLn5vyxbqUO96vpah0K86hAtCD4+nI1MMyi93QXjDK9EVFqAwHjBt65L6wyvvNpoXQ9NLhw2fXpfOHhmzLsZj/tX6P7T9U/c/W/vn6UXEA9+kfgrif04igDiQmNx/qym4M79x+pN5G9Tc78QD7+q/eAabMzPBLsBjhos67OU6GpaBmnRs6HP06y

JuBxS6twIM0T0A/teiUjGQCXB14kQbFGiEFfTTaDDzzyTua3M2MOM7BxxjgPH3yv9p9l3xqq4oHqvnemr2gfq51dQvvLML3y13p7o97rdpr5FwPotdov84I+jjE0HTAGGPY8Vx19hC1AphVaFhtK8vspc+vqXQU2l44cDeFWXDxV0N0WIAMljUho8Vvtk65sQO+bS+Ze2jfq5nNkEFYNx57l2A9DdgfiBKHK1y6CjnR38Slj1iOJhGn4rR4vi9ak

TWOXcVtl3LdV6uYEqZa9uBKcgS4Zblk3iL4gAHLu4igIE3G48ORvHjEH1p8/dycweP78H1yH5yQ9z8sAqHu+Oh5iiYfKoOH6+dyPw+cBCPCrHCukpJMW0KPG16j8Rk4V0ejgDH3SgE5Y9Ks2P4UDj0Am4/Lg+PLF5UyB68NCf1+UHl++J/5uSfEPQnWT+CG2WKf60WH8RMcLU/mCNPWn59jp+QR6fyPulQzzLdo/fJ6PAdpj1Z5ijEJbP2Cezzx6

c98Xmz5b1s8JfbMoGxLvDFZ3f0EZQYMDjbrA8252cyNv+7bv/sTPon7cNokQeQCMExS9h0A1zqoLc4hho06D04ScM87GD9A3nNKXabwbsuHTrwlNFd7edOD01AQfjTd3u48vYhvefqaFx+aNQHv2BgV0PsFbNcWSwrmh7uk7rlAu6p6s4V2EmHteEvXJzGBARmCQsUv/JyM0vj+/9daCGXug8yDjKnPIpSs9Es0NDmJlsgFoxGN0Ft2Hc0HrQQmE

xjOH4mQR0wNjFoATHsbsocBufeXfN9JqLfi6VNM6QC7vMuWN3N0w703W97w89UW7lJgZONfHvVDp79Q79IvfD6HvWYQOLFfvcOvgssF9oDDPH0CXLD6VjpqvoCm+v/vfPLC9X2B/L73DaU7uBOkmZgErPRU24/hbHQ8I60Wv5j0cBCiZvCxZcdXz3CN+/adf61EqU+habFe5nlb0S4gfEv1Tezaz2rzJbgxNvtn71Vty1+UsduMY7LkAP7XbCfwo

AJzy4EO8J4wDkfpjTc/RBJhY0KYDkvWooF6DsH8fW0uV0T9ssk+ZJ3MYSYj+vNKS131dV3lt7p+aS2975uQwa+O8/nMmZ30yZz/NdS1rv/0q16T3ySMp7QL3/F9xDe9ZhVdZL+GZ68/dr75f9hxXwVeV84WQfnr9w9ijyBLY7I7HnhOIS1/9RV4hCD1nWiPjDxvQ3pMKN8v2uLUvw3CZNyMcbmOVvwB8fj+v83/b+Nfu/hSPv6tZH/mOp/r/xf6A

KV/l/g3+SiMWLfGNiNwBP+BgOb5gMr/iGBb+OXh/4gAe/lAAH+1RhOgn+cWgAF4s74MAEDEoAT1igeEAZaBQBCQM/6H8W1LM5oS8zodRu+Szh74XUXvnW7rOz/HJaNegfrs5KW+zr1Jmg9EpgBugUAC0D8AEAJwCoogrkLpuM13GjRuuq0OmATulIJtKyMzEHN5F+njErragxMKgDiBFfsIaSYmgXMDaBTek37buDfgd4mBLPooZHuiLie7Y8XPl

d748l7lPQdAsgsL5p8PuqL4A84+o6D9AUvh+4/e2VtzwYWf7toJL+RViv5RSYPugDYo9EvLxQALsIwBEAxBkj4GWKPin6ZwCgZxgY02cOwbCSh5ggAqBJ5l86KuGgd6iGBOgf85quIhtT4PmtfhYH1+Mho37gu+7nC6HuCLkFYd+dgV342wPPqBYHgfcL1yJ8w/unywWqdCHDeYb7oHrIWAQXYbBBAbqEHhS4Qar47obIBnjZO/BMirCUDQMlJgM

qwViAa2GwWFBbBsASsFrBBwRmSbBnANsGFeT6MnzUBbZgs70B1bsgarOLAT74Nuslv76LcnAc15USv/L1J2Q9EvQDIABQFACYoW4H4wYuQriN6o+3EknxLS7GOZaY0bzmnRFBCrgt4ySJAoIYU+VQVT4autQbT71Br5j7y7udPqwJGu1gR0FY8vAvYHnuPfk4Hx8cggvrZwwwR4F+wNoA6A3uXku+7TBsvr945WCvlvr/uYQYB4RBJViqZIcGyGd

YeIS8CvDNw2BGSzekZFqQELovEAYB7kmFIBKTwF1nFRiy4piwhV2gNsqFCOLaJFAEyoREsjRcHhHoiMIpcu5DnAP8CGCcgkgB4hJmzJkWRhiw8CrL2yURvlCnoyuM3C5QXUGNg9Q4hGQavQu2GYDUqiOGoqqADoZgA5G32prhP2lhH0raeJHj1BdExeEwB6sGZIF7wayCJXhowAAIMLQmshVgGhRHhchhGQCAABbZoM3h9aIrO5DuAaeNtjn2GNk

XibAPkCBztYyZBl6m+ueHxwm2aCJWFmQlUAEDpElLNeT5QEGoMrcWR6KaH8eCQsghShxCLKEyIiRIqGXMu2I/7kB6oYCJ4sAXqITVAEYZWaVhc4QxaNyi4c2wUOXJFcyIIH7NaF3wtoRLD2hjoc6GuhTJimYfCXocPA+hfxqEQgUNYIGGdQMRhbZKc4YcjZRh7gDGESwcYSKCJhPhMmEc2qYSmTphXxnOhZh3YbmGzo+YWCxFhpYeWHD4zsjF41h

jAPWGNh8yM2H+QrYVlzSEyNiWTZhPYUNSMA/YZZ6DhmJMOETwo4WoB6hTwBOE9E04SRG2OEFPOHXhMNiQ5KmWbhlCShASNKHCkFSI+EmAcQDuGQBqoQfAahR4RWAnhuoYhp0Es4UaFzo7jmaH3h6CFaEAKlwnaH+QDoUFBOhNAC6FoIboT+GehV/gIgARhpkBHLQjCKFBBh4EXOhhhtcNBHPwsERqFGs8YUhHmIKEXmxoR+BGRGYRmYV2E5hvYXh

Fp4BYRXghgJYWWFvQFYXxFVhsXnWENhbOE2EPsLYR4D0RHYUxE4RKUWxEWetvpxFKI3EfjhjhrRIJFThM4YaH0WxkYnZLhlAccj3BpXo8Hle7vpV6e+klt753UHwX74NeAfp/x7O/wfWDtg9EpwB74MAMNLQ4SINDASBNzlIEzSDkin4yCBfpN6vOXUiHALuiupJgICnGDAAZ6ugZT5CooPO0BC2xgc0E7ecTGYGkhFgeSHwuVujYEc+XQZd50hj

gfAC3e6IPd6MhjBpDGsh0+uyHCS9oFnypWUwd958hgQWHp5WIQUD7L+y+lEFvQ9Ep/AUA+3G9C4AlwOcC4o+luuamMx/PNKp0mQeqA8ouLutJKB+4C4xm8i7odJXRLQDdEreldDUE1+hIa9GmBjQeYECxlgf5Zs+f0ed6d+gMd37AxfQW0CyCbQNDEJWK9HBblMvXJP5WGUUjP5y+37vP5ChCwbvqihywalJbBrkA6yoAEDF9bEE9UYdius/HrsC

mxLkObGWxI4QOG2xJwSbFXBZsRbH5QrsRxHuxfUc+jMMO1CV4k6ZXsdQjR3ZmNGvBNXpNFsBXwYzo/BlEt9Qh+f/FQbh+NAKqDEy68PwBvQ/ADOYpBFMQ5JUxqNAsA68ErpO62MM7vkH0QwmBXolB+gQIbcxF0uu4EhT5kSGQuH0Xq7beR3q0EnebfiZLUhQFvbq9BfflcitAM4KMIj+RhiL7shqdGK6+BPIcjHeus/rrFzBgPkG618QHgYJlwDr

PfS+xPEW7GWR2+KJzimCUJeHGhN4a6xOx7YJp7pe/sfQDXxDrLfGEeb2BjY2x/kA9h4cj8U7Ehg1rOPxggkYT9D9WgDh/EpilZoQ4tCNAE/G4oQCcJT9WECWuJbkR8dAn8ee8S7GHxD8fcwnxPUIgkXx3USaFhyN8XfFvxR8U/Evx98WAlfxQXE/F/xc/AAmQcitsAloIoCdr6Dh0RGfFAIUCTAlwJsnKWxnxSCf44fxqCc54yRiAOgkHx1sWwnP

hS1MEa4JAifgkLhMNuQkkJjHg/EqJr8WolUJ9UP6y0J/8UbCMJDmiAnvx0iYxEQJXCcRjQJTsbAk82zCfpGVQUCUImmJIiTcF8AvXANFhxQ0RHEMBo0UwHjRbwXHHESCcaOZJx80T1L1gKUPRJ74TQEQAUAuKKVgjAJQNtFDeu0SN7hAiAt3DmMFcYoE1xhQedHfOpQVoEVBOIau6FJ5QS9HRML5p3FCxn0SLHfRbQb9FUhgFg5jdB0fLHxjxB4G

uAb0LsErGPulIIyiciM9HrRfe0/jMHoWaMhjGbxTLtvGi8KlgUD0SWwGaDLMUAFsBzAJ3An5Z60gbCGo0mSZkEuwPKEzG2QeSYX7FBGIWUlGBiknoEiwvMddLtxIsQ0FvmwsZUnN+fca37KGSLgDGou9Ibz7x8zKKmDeovSbPEqxgkN3Dj63IUjGjJKMbMETJ8wZjFLBvku4YOeigNb60KJ8DDb8eSKSikegaKbxakOLnmXCYpE6Nik1g6KYHF3B

zvjQGu+w0T4lRxfiTHEES7wfHEzR3wXNHcBC0ZDAC64fjJgWySIEQBQAJAIXGI0+0RknSuzzkiGWWq3KiH5JDcacBYhzcVX6qSblsz4PJJId3FkhX5hSHtB7fkPEtJ0sT0HfJcsb6iqggcICmj+owboaMogkCMlaxYyXP7rxGMgB7BuMyQ3yIABMkfHpeJgJvARhktq7YbQ5WG9ChUscpzgVYI1AIrYABBPJ7yUwlDQTeAg8Hoh2Q6/myB7498pj

YAA+hnZlKYNgpCppJLJnZiI+wPlDDwsHIJQUIPgoFA1cy2pwDWI4nGfYXIBJG/A1sBeDxHuQgIqTY/w8BGwR+pbIJigLYhhC3CNCAOF2g8exwtXLZpJKZnYAAZDnidAcYiWn1ID+JXCf4e8itg+AAOPw4SwAOKXif4DggiibMZNmLBgJ41jOITs4Th1YHkHkK6D5QA2n3LhsxaR0TVhWFOdpHQ+AK9inp16a1pNKevngxupD8R6nyAXqYxHvYFVv

6mBpSBCGmak+QoYDhpIoNsq/s0aSMRxpd8Amkn4yaawpppGablxppuaY0qTohaQIjFpJKVULlpaHPmpVpwCKwhHAk4bVqvQDaZJxzoI4S2noAbaUFAdpdOF2k9pb0H2kDp3AMgjDpwuGmnjpLcFOkxQM6eF6EZKiAun3My6TfJrp4+Bun0sBJNumCU06Mgj7pv6UelPpcLGiQvyKshcg0AV6UeQ3ppHHeloc3CCULPpr6WiTvpOXFJEFiYDD+lgJ

pCZ6lNwljnfDAZmsqBnBp1FB5BQZEabBnNw8GTBSIZ4iImmoZnuOhniOmaWvY5pIUHmmRQBaeDj4ZpXHOk2CxGX1akZ1aRRm1p1GdZ5xUV4VbEvp/kK2k+ErGVValY3ab2kdk3GUOnLgI6dFmCZwmYaoxQYmT5Dzp6pIul6I0mdmzjkT4BVqbpimXog7pPFqpmxaQCOpmPphATvZnpCRHpkGZvcq+K3pyWfel7KIRhZlvkVmYZkfp9vpAZUBFKQ8

F0B1Kc8FVeE3LHHNS9Xls4spnUmynhJkMEiD0SGgG6BowG0OcA0AuALozJJl3H4wwhB0aIJZJ6fmqB0xhyawCRovHgDxg54OWDlohbMTJJpgnMZ5LypSuucAtAVwP6AVJuklUm7eysNuBPJ6OS8ms+lIdqnNJKLiPHfJoMZi6K0vydzDGppqdIKMoa0sxAax0voXwrxOsX956xdLgbGMuhaGKEe0UQXvj0S0OGAiLmMAPwCAhgqVskcYd3OGgsYG

PpK48eQOVBAb0oORDkq5a0KzEXRsqU3GXJ90TKj4hfMXcnPJgsY8m1JhuaLGapjSYTkhWeqW0laGWLp0neBjKDTkZ8aNJvR9AVMX4G8hLOfyFBBMKRvGOpW8Tzk7xmQJrjRZGaWmmBKywjlwuQwAO7iKOUyPiQ3Qs+EllfACROpmf4bwPQCx5A1vji3CUduETo4ceEWnJZmYcxxkgt+GkqZ5jAPKBAIIeVhmxZRRNmkR5UeTHnfEt2F2HkeSeRYg

p5KsmnlVElebdi3YceMVkZ55SlaQvyaGnVpjCB6rpovWlefKD8etedmlh5jeS5CR56OC3kD5BUPpTxwd9l3lL4PeYenp5jCFnloaaCLnk8OBeXJRF53eePCl545LqZz5NeYkDRZ2GeHmr5zeVnnt5O+Z3nFpB+aYkdZlTv3kD5Q+Uxmd2o+bMjj5sdpPlqOVNiLad2QCPPmiJFvsHnP5EWbNZv5a+dHlZ5gUNvkRgu+b/k3y/+fcwZ5J+bHZn5vV

tHaX5K2AQUdZZWvfkV5CBU/lNaqgDFnrADeSwVN56+Z/l4kHedQXF5hBSb6dER+UAWD5clMPmT4i8BAXxEE+RLhT5FdnAUkFVedtn462fB4l+oIlodlX8NbswGnZdXp8HMpicayltu0aCpZkx4fm6CMSnABoBmgWwPMni5e0dsnWgWfCEAIhqAvIEBwNcfO4nJ6IcX5K6pfrzDa5uIdcl65tyWC6m5KqYz47A2rmbk/Rp3oPFE5Z7jLHWSEVtoZT

0nGGjTiu08Q+5Ap1oIzyJ8nGJMEeuNqVCnjJ4erClTJ3OcbFlw1WbxkgwGalwhNotUCBROQzON+FTGSyPmFNo4iGUq3Cw8KvBp47wJSyhQ4hAqESwORpVDEYnMoPCThD2MJFVwXFroBBQ6BEiBM4CUAUBb+LcO/DVwy7LojvyQXC4hpuNmeIhL46AAf7LaNHN1aQIoLMDiBZ5xaNQiE3xix7n+Pogor8eNRdgihA9ResCNFx0PHBLFbRV2gdFaUV

0V2QPRSrL9FeikMXIcoxfgDjFCUJMWwkMxdgBzFhUAxaLFzONigrFlUOsWtwWxf1C/6uxbY7yhwBqUgnFZxUIi/MlxY5DXFq4S9D1QQiNmSPFUdgCyscrxUgVgM7xTx4hAxWA0VNFjmK1CtFyZu0XNwnRd0Xo4vRQIgQlgxcMUgAMJXCWu2UxV7hCR78SghkEfOMsWrFFDhsV4lOxZ/g5yxJYcWklItuSWFIXbK7I0lrhHSX5qQhGNRMlRrCyUZs

jZtM5uJyEiHEu+VUpoV1SdKdV4MpgSZs5tSl2XgbGFPAfWBXO4fnvjjG5wNDjtgZoHYUbJa5kKmOFsutnDp02SR5IF+bzgvqqBpyb4WNxDloEWlJeIa3H65YRbjlG5qqUz49xMRQ0lxF/5p0E0hrSVZLtJkVlcjmWxLk7mjBHGP8nkpHucvGoWq8Wzn2pSvosFGxCKXoSh5kWejjV20obfCrpsnMDiIifBSnkpKgAKZEo7D4L4RhWU+paRrsitjr

4hQDEpSa3OHYT3F/Ttnn8OLTrFmRQdFvyzaqHTjxpjF3xOQEHAYOBex8OEuIop15bBejhmgFWGhrWkxxII43h1cvF5/FelAnmiE1+UvgQAchBqF7WHGh1bnlshWo7t26DBnmKKqwWiqtQluIDj8OUFTHYuQyzJ15N4xGNigR43WMWkQUBahGFHwAxGzixyDyszjLYBhOv6hUh5VzjU4HZAaThGOKRmSMmQpYQC9OoFXgX8EgUO7ilYNYFcGwKi8H

FS1aMkGx5IpBXl+nkOaBXmm/wWjnCxzlN6H9hX5yeUvirl65abhpRb4eU7lKh4buV9FEpAeV2QR5V1inl/BDIX+Ql5esDXl+xdNnpaD5bCVPlwCD+zcs75V3Yv59eT+V/lsdgBU1AQFTDYgVZHmBVf5eBUuXQVsFcVnPKnGo5VyFT1mhUmOmFeprYVDzHHbxVBFURXMEbIKRXkVe+SLamA+CjRXecsOhtAMVrGtMQsVeQGxU2VHFegTW2wyDxXiZ

J6P8UCV6AEJXRVIlXxUwA4lZJUQs5Wj5n34CQPJXEIilYqZ2Z45apVlK05WSoJAWlQuWF5elbPhdoa5T3AblxlVuVmVmFIfaSlVlcfg2V1OMeXdY/ZLOiOVulLmmuV17O5X3lhBI+W3Yz5b5Vvli6HVqfl2adhnBV2eWFVrpcssBVY4A1QKWxVN0PlXxQiVaAXJViFalUoVRjrPkYVjAFhXegOFXlX4VzHIVUkVZFXZWUVFVc4BVVX+PRVN49Vcx

XtkTVSGDsVtVW1V4OHVQVC8V3VYKXuh/VY3A75olcNXfEElcKBjVeoRNVHQU1Vl4eIs1U6UO+u2ShLulGhd4lHZ0cT6X9mjKUEkGFISUYXB+IZZDADe4fuVhzAFyJ/B4gg3p9lCp6SaK4LAEQGtDMGVqTK77gxyerkFJ+gWUEXJd0UEXeMDtToF1B9ycSGRFasOqmGusRQPF1lOqcTkaGssR0n60aNBqCC+YMtkVmp7IeEA4+a4IjFFFygiUV2pv

uQ6kihTqYHmzJHbvIAdenkqgCSAxGL2AaA5MYmUp+M9GMArg2ScJBRAQmHj65JBfrbUypLtUUkI5RZdX6hF0RREWyGdSRql+17ybYENl1uU2W25FOaTyiCC+mECU8EgtHW05vXN6hpgjOf4Ep1a8WnXDlhsZnVVFmQEil+INvv/nUJ/rGJStE4BspXb1XJZr7aJ38UfVPA4BniliJIADvUX1+9Ton9YoJDfXKFEjOSmS1lKR6Uy1WhS8Hy10llNF

kQ7AbNFXZwZeynIoEPOH64ApWPBhVW+3ALofZw3mkG562fC4XZJkaCEBrQmZVvRN1ZyZJiw5MAPDkFlq3j8BI5KOQN5KpVZSqnY5JuWWXVl/cQPX/RQ9V8nAxZOcTxj1VyIwbJ8W4B2Xsh3cNnB9wi8RCnFFXuajF+uC/sKEjlm9b5JRBKoOH5EAlwKViQCaMC0D38UISO4o+kufQazgEQK4WY+L6FXVW1wMAoLeF0ORoFa5TtYWXBFxZZ3XKpnt

T3Wm59SUw0muLDcPHB1yRb34tlB4FN5Uwd7lHVuBtOXIIiQNKIUVT+Yjf2Ws5AoezmTJ/udMlZ1LqYrQcFHkHKIHpLBQ1mqAImTFB74sJLdgSATsa1iBOEYdyRBQhLB4h747rOk3ppkWROmqAtRgU1GkNhMMYYAY2b9X15dTTHj8eb+aoBpNAmT5CTpWTU1kuQuTYPD5NSLObGcAxTR5RlNh8GgiVNbTSwUZpnTWk2NNmVHSaAEizawWDNXTeyU7

oPTX01jpAzUJlDNM6aM0D5BTZM3TNU+LM08cIzVU2LVKzUAhrNrKkcEJmWzdhkrNH9U+iqFe2eiBUpf9V6VU6ASWdn6FF2YYXgNwfpA3oAcAOH5oBIYO0AFASevzn2F32bnq3AGDf9mUw3BjXELAdccT7qBeZcu6kNPMSEVo5d0tUnG5aqV9F91NZf7UfJrDSTkh1PjfrQZgKYJBYz1QTc7mBw4QNnzgpSdRla2pq9WUVaC0EBnUB5W9YgDJpgtR

HbnEaCMuCTolTh1ZiOMgFvkQV6DDOmVhk+EfBl5D+XfL/lyqoAqDwPgiQSMKG7EupNYy1fSQKtDaM/LxELcCc5E4QCFyXC4KUA4LfKrcMWntAsJOIVxeKeBXKHBKUD3D4RG+BnYpa8eQl7IIyYglBugBQGVTLYc1nZR0VOSvFm4V4+G63qVNdsM7mV5rdvabVXWICBAIyCEaqPWqFRvhBt32ihrMUrRIPB1s/DkG31U8lVjVWtG+Da15R72OOE1y

3MnJXyU0GmFysy4+IsIeqA7eU7b2ncF9adWQCCG2ER2URVjQ4qBO7bYon6U7aZA0rT21ytruPFkAOTsiq2BKOBeq0b4mrXlHatdBeXnHqUhPzKDU18ka1l2prWfKxZ7UIFAttQIlu2tocREsgOtYkR6EutrkBm0etLcF60+toBX0r4qlchcEuQDbSG2m24juG24FkNVG3ZIzOHG3IECbT3iLUcOqm15VGbS20JQObbml5tZVQW1c1xbZVCltSNRB

09CBHLMrVtTwLW1pt/kA21FITbfm3Ptm7bhlOVe2AJFdtHqj22/sfbZVgjtjosO3wao7foiEMk7ZhrGVGUVlHER87a6SLttmd/p4Ma7VNXUU8ra+0BUJ2Lu1qtkbcM1at/MtaT0F57fq2hVhre+DGt2bFgDhE97VfJxOMAKx1ttb7QiQgkjrWnjOtIMK63utgCp63JZ3rYPC+temgG3gdkHVJ3QdMgLB0HtCHZVCxt8ba3BodJNSm31o9HRB0OCO

HTuW5tUNXYSFtKZCW1t25HRW0tc1Habg1tuVfW09wTHQR3FpDnVu2+xnHVsBEq3bap18dwyv20idQnXXYidWwp0jidY8FO1SdM7bJ0LtbIEu3fNEtW6U/10tX+g0p2hf4m6FvviA3BJCllwEQNN2cijnA9EnkCoAIYCMB5ALAIwDteqLag2iuqtDYwGNFMM4U8omArxh5+xvOJLSpBDacD+F5fpUE2NuuXY3kthupS0VlURcz4uNbyW42SxnyUy1

eNDIePUagjKJHUEuI/sE3GpYwEnzWpydeI3QpIrfzxitMjRK1jleDMRY353Wf/km24+C1ECRn7ZBRclY5I04zw/Htj375AhVZ5WxBPXlHjhxPQMSk9rhL4CQOFPXs1Y9/Bbj2CFTlRPD09+UIz2udtRaEBk97PSW7OlwOR4m0BF/NN0ANJ2b6Wgt00eC0q1kLX8GrdgQPRLzWG0J/D4A5wGjACp8ZedwpJCNFsnl14+onRndi4NN5zu+LWoHSSlj

fmXWNZDZzBC2VwLgC511DXX6ONTQc420trjez6A9jLZ40y08ZZw0j6mYK7DT1cVly2jBTQEnwCQoggj2CtK9YOVr1DtGj0b1GPaD4qWaIOH6ugG0FQBNAxMmLlG9WjaYyq02fsd2POCgSJDGNMunIJV95jRrneMVjS90u995iWVd1PvTjnJMf3QFb0tg9R43c+BqaHUU8wkPw0qxzKIwaq0IjQK0y+SPaUXox8wZn1c5MesB5lwW0TfpgMW/XfXI

FiAFv2lubiX1zjdDIOoXhxmQLgHUA/9cdmoGc3cA2iMytUt2/BKcdC3YAnOlAAaAWwG9B2QtQAbUoNigWN7A5+yVb21xNvVnRuu+DbmWa5Tve3100qoOcAjAz0V70dxmOTu7Utvdb7V0tzDUH3D9DgSD0gxYfeDGk8U9Z5L5Ik/bkVUwjTJGjJ9C/VE3e5aMb+4r9FRev1VgUQevALJEAGACJBjAG9Ac6h3TxLhAvHlvRi6WPqmVYtC0hECcYuQb

O5bSdvTmWEtMA8S3O9pLe90oDHtV91e10Rf33ixTSVblsNBA3LHj6M/Ry0x9r3qMGOgsPdFDuuETYj30DEjYKEc5q/Sr6Y9ZcG62jpSzZOX8e7gxOWzWt9dJH79IAD4OLVEveLX400vQC2X9TkMcBAttbvf1MpKvc/3JxcjKnG9S+YOH4LQRxl17+0nAPH5Qhkgab0zSeernoW94gxbXrgnhfIM+Fig632wDJSS72/A/wBt4fdLepoNONDDToME5

8RfoPA9ofRi7h9U9OmD7RkPe4EwxU/amD5IB5jYOaxdg1lbI9y/aK0sDIbmwMqWmAFr04guwG9BhAKUMowCDs4Fxho01fad1pl8fcIMyDNcVTFQDNQ5zBypJLS3Ed1LQxC5oDXcZWU+1LfgP04D9ZXgNAxhg2P0L6IKRQP9JdoBqAYttA8zn2D8w0wOLD8TZUWuDxzl51TGAHb50n1K7YgB/t3nUiMp53rR7FuDCI12iYjS+NiOBxOjd/X7ZnDFf

0xDyznLUK9CtX6XnZAZRC1BlatdC26M4fsyhvQC0KoB74VwP/2pJR3fQbGpxwxIMuMMupAOSSLfTcNt99Q2TRu9lwB72PDGOe9E1JGA371YDAfRLFfDuqQYN9DctAMPx8pLnrRuBM8THUqxogluDeYc/bYMp9i/anUo9ukM4NYxcjSpbMA4fknwbQaMJ/Bsg7YAd1l9Sfg5KV9Ig6wAhwR0Vjlm1Fwyxh4N4o3bVKDJ0nAP3DiqVq4ONbQ770dD/

vf92B9mo0HUj9zLakX6jC0hgIBNUPSMHshjBoyg58YIzYYDlMTUOUZ9Sw86m4yV5qfWIAV5nv1gMV5kf2sAJ/UTqhx5/V4lRDKeDf3Ujd/Yr16FyvQyOq9TIxhjQtk0uH7+0G0PwCYATQAb1QCRvQUNXce0UJAPORjaAMIC4A7Ixij9cQ921Dyg3GMySMAAgNID63eoPhFPffQ199aYx8MA9mY4kX6p7DUQN25C+i+jj6pg0L7mDJYzOAioIkBWN

euEI0v1QjqPXWOJNGvZ8jh+/yZIDYoxGGEAYwAg0mD56JlgKN2gZQ+xhCDtwLkF+oDfVUMWNRLbGPSj8Y65aJjNDbeMqjqY2qPpjGo4HUvjNuSkUfjOcNzCAjEPW0A+YZ0dMNM5lY9E0+5do7WMwjrA4fp4MoHfwSAASYQUdC+f60Gas6FJNBtOIygVa4QXfJPSTxI6+in9g0QdnnQFI4OPelNI0A0JD440kNhJUQZ/DduWwOvB8DqoAhO8jhQxD

DFDoroKNYT8TJgKVD93dAPHjJExrqvdnMOt6M014ww3d1KY/eO0Tj4xmMMTtIUkU6jzuixPNMcgtH2/j0Pc7l7m3qBnQ8Ty9TaPCtCwxBPCTyw9nV/8xwOH41A/tJ5otAz9KXXXcs4A5L0xzk5hOgDwcCECeSuQQrmXDUY83WSjdQ75Md9NyQqNvRsPC8M/dVZZ0Nap3Qxd7ajo9SPoTDSYEaOz1qUx5LaglozMPWjoE7aO5T9o5BOStQQ3MAeDN

TX4MuQUk8mJSTSjn4xNjO03tMYZh0y5DHTAUI5Al2Sk2iO7Tvg2pVHTPcCdP3T8QKN3hDfzZ4k6T/Y1rj6TwLfENK1iQy27LdzIxr3JA4fp/D/oUAEiAQAcwJEnINfI8n656h4Jb3ZJgkHuP7gB4wS0O9xE9iE9TMo0LZyjnvRRPe9yY730sCD47oOW5E070N6wHDcQPUoetH0CFjow8rG5Fs0E6CzQ4TStN0Dcw2BMA+eU+K0JN2MSpajg4fiTI

ID68GaDEY5fpo1+jgcCxjQQYuhd2y56IBGPhjTfVcMEzMY0TM3mqgw8NBTFLc8PKjrwzS3hTdM+NNSxk08xNcNB4BgIOgP44E1/jKsc0yRoq9MBPaxDA5I36xDo/Ck4y7hlCL8eoc5z1lw4c64mdjahZEOIAek7EM6FI4/N2P9YM017JDIMNC2cA9EmjB5An8JgCsIcs/ZPrjI3puOiuGM65OF6J0RAOETEo0dLdTRs1roXjyAxTOoDSo1S2WzmA

+8M2zAdQkXRTr4wQPMzH41nyeS+tOxMiQC+lmBO+vZZCnZTafYJNZggc6OU59HbiUCKNIwNDiqgWwEmgl1KE8TAsYBNPQYIxlc/pi1ThwyY39RzfdGPeThs5X7VBZLabOfd5sx3PDTbw68kRT9E33ONllriy2rg4aL81QW7s7kUkukYj7NCt88xtNCTYs7CPBzO6Bm0VpX+HkD8D2/XAsOCCCwMRILj00ENoLJGVDaYLGkxEO/1AM9f2Jzs3cnMP

9c3CZPgzL/SkPq1yKCQDh+9AHviXASLfgC7ABcauM7RDk6wC4u5c2L4nzJsDjO2QeM/b0HSmIVKPEzWuk0OBTrcxoPPz33d7VWz3c10O9zPQyH1Mz7447M4+qtDe5zTsfeyGPOnktINgLqfdWPp9i81tNOjHbg0Ba1BQIFAtAdkFnFVTRQ0JAy5gY1BDHzoA46DYNuPvYwSpgmLXPXzXUyeOkTCqeRPu1N41TN3jNM9bMqLDLd8MxTU01PSTzb3O

PM5wLsGY0zzkTULPrT4E5tP5T9Y+4bBD7Td+XXTM6WR1n25bVv3nTxSywV/VZS2lVltyCIpMRz8I3tP1LUk+Ut5dlS80uH9kvZTCELk3fHPRDQM3EPkLxkyOamT12VEHdA4frig04GgIwC4oyAJNIoz3C2jPlzq4AIuKBQiz0CBLnU/XMhLkizJKyj8o4/OtD8i1oO/dtM3EtD9Wo4zM3emiyPr6G8gq7NFjbISrE0oCwPH38tVo4LNUuEC3ktQL

6PeLNWLf/CXXh++3GyBhA+3PIBEAaMEVJKzqQRX3Lg7i/PUhjbk2GMXzz6NrNXzBy7cMqDZEzT4G5wU1ROdzqo8otjTqiwzPqLDsyPoTBC+iMPGjtOcmBZBidX8vgjOSzlNArFiwUtQT7ho2OojIAC2MBDbY99MeLsc0QvDLA46Qv0ptI0r0LdT/dQsZzovat3yA4qLOMFAFAO0DoALQKoArj+Q1wslzi4EAMeLWyzuPVz+4/stHjwSz5ONzZ483

NXjsi5EuXL7Q2FOUrFubbNA9tK+i66jLMweAgj+8+PPOzVMOfNZLswwCtmLC80n18rEszRLqr0MOH6qWYQG9AtAw0mrpIrRcfvNRAocOrMA82yzPQsY58wROeT1w4ct2rd8+3UJjES6StRL1E+6vvzPc/Ev3LPq6D1XISfMJIT6nLUAv9JbQFTAa84a6tNcrgKyLP5L0CyJNJNDbR614LyCzUtCm3nTOtYLU6wuuILyCx2MDLv0zL2YSCc1SMGTw

4/Kujjiq2nOhJ0y4QbqrqKOH6lEmKOvDIAmAHZB5DZ3GuNfZPC+XXx12y+5PYrIiwoP6zN823Vre0i5t78xLq+3MKL2gzctUrza1mP4DsU3d4fjrsFPX6Gwa9Lmci/M7xMgTw61GuQLvK+OsFTkDequ4Y4fmEDYAbIIcCRAK0c4uOTToO0DIpas52P5roA9nyJ0WcNXHYr7U4eNeTtq7fNXJb3SbPOrta66uhTMSx6u1lkG4xMj1dK1PTeogyW8u

czfSXTlstkaL8sCznK5GsCTWGzGs4bhS3AvPTX5a9Ou43gzpslLem7v2ir2m+0tBV1030thDG66SPaT5IyMuyrgDfW4TL8lsqtmTZ67aD0S7YPQCPZIYE0ClYyE5wsm9xq/HSyBxyPkjvrCuTbUdTNq1Jiu1f6y3XlJ5y08MgbVyyNPgbnq9St2zDy9425jpPHrQJ8TK/NOjBCFjPSHzg6/8tfuI61I0abIKzAueuYPuqs+04fsRjEY/CpijsEKL

b6PIrwqSYwdAEW6AMiQIqOnS0wMutFvsbZawYGO1p4/fNqDfG2bOpbbq0JuNrty+40tr2Y78M+NFo/H14ugCylOjBLrkNtL1nuWtPcro68CtZ9oK7At4MSKWsJ71vPSJGXhBCTeGtwmsizhM4U2fuQojt+mfXLgd23hr/5F4SPZKJ/BC3BvbMcgTZnp/g/NU3bPHv9vG+tPUDtdRIOxmRg7b0O9uQ7X2+Ktf1Wk39Oy9stXutSWzm6DNUL6c+5vx

rm9PRJhAqgKHREAZIE6uZrZdXHSCN2PmmXSD3GOwYK5IMnrNiLjvUcv2rs27xs1rC24NMWzr80osrbEG3ctQbPw82V5bTGOaMhweiz2uD+8favTLTaG77MODsTcwOxrcI2iPKlJmmSp1t4+KHbUklmnPzfg+OICJZKw1oHY9R78aoSlEt6Ckp4ORuAx4osG+HbtuIXCMggntYAIR5/wqAJ5BuaxWMB2ca5iNTUtVG0EAhd4kRpVxVwCUOGzmI7kL

2AbQuwMtjzYeQAtjdoOgBPD3Efsu5D9p0wDxkfFkQGsRnYt6O3LVYmnZYRtpFu6fle7P8K1yIAOwXAuG79csbvJdZuwMgW74tH6wahtuz/ARV/BD4BO7/aK7uxCHu6ZxN7YpD7tZK/u4HuPAIe7wrh7iFZHs01sezSTx7tIIns7kHXD/Cp76e5nsbQ2ewGnLoeewoqhUm8K0avinJUygV7lXAQBLENeylR17ve9SrZ5cBQRwkZzkEusd7pKsnZ5V

Pe23JBQ/e1eyD7ohN7vQ2o+2oR6gE+/iNT7X+7PuiKOAAvv8yAexYjB7oe/14wO6+BvvR7W+xEYd4Ce8M7J7h+/5Bp7Ge+Iin7OexfuugV+4biF7d+yXs1ZUQI/u0gz+0cFqEb+xyQf7meI3sjZQUC3virVMbZt47VbqMtJzB6ynOULky25unrFO1tyQrmKLsDtgaMJcC1Qxc8+sbL3EsI3Lg5tcrB9rTfTLrJ80EDztk0RDSQ2ErJy8jkkxVDfN

tPzIG3Q31ry2/jlS7a2zLuJLjy/0P+r3mAL7qg48y1PCSC0iYtzzmGzyu1bl2/VuRBHm5Lzh+ZoL2AzguAOsW3RjOxLm5rTDLODGNzBtpAmHOAsyihwFh4dIErM21WvhLQG/xuLbgm2bqS7mW6Jv9zTE7lt253mAJB/JQRxjPeoSm5rvgLER+dvYbdWxOu4yb+TQBpNFAPQB4Aq+SvBggpSuMeTHywhulcFreUR6JA5wC3DiE0xyUoAIQCHibLHu

m0Jk5cYzZvnHHFzUizoAl+/gCVUx2JYQ1cTaFnnpG3CoRUFApWKVhpN1eT5DP53pDWD9yz+RumoAximoqr5G6RQA8gSx5vn9Ns1o1lnNeTSceXNRTcVw3NXeRU1VNm+RKyrH6x7KVXSUnpyqlkOx/6bLHYCN+SppgSqgBpNm+XZDw4t6Kmn6U6kEJn/HTxy8cAnMxzFCxlLx7UbgnS+bU2HHJxzyeIsc7J7s+C1xyIUrHYAGscjFWJ7fDAseJ+yc

D5Dx2mqGqbx900r5ox0AhzHiOMsKbHsxxMfqnix1gUEntUOicbHL2FKelk+Jxyd1LHTdye8nxxwU3nHDB5cd7l4xvVrpZdx8sdynd8KyevHjBR8eBKXx2GIh5fxwCf44Cx/gDFAoJ3qfmnqaQ1nTpOTTCc2nEzfCclNfwLc3InWeWieinGJ9QLYnrgNsemnMp7diEnJhMSdhQZJwPkUnRJzSfegdJyyfPHpWEyclKNZ2yelng+ZyeQnVp9aenHyB

4KdOnaZwacZn4p5LCYE7wLme7Hm+e6cKnCBVgsjHYx9qdTHxpwB2znIZycQRnA+emdinN1MacjnZp8AVGbBx3GcdntpxcdXHTp4Gwun9x16CPHnp28dMFPmd8cBnoZ/ScoiaCEucgn3IGCc7nGTcc1QnsZ0cfxnhTVM0InpTUifzNKJ6ud9n651mfNEOJ1uf5ncyJSe4AxZ6SdZ55Z0WeVnMANWcMndZ2FDGnjZ6ViwXjze2cdnfJ12cnVjWL2ea

4EFxKeoKMF82es9qanfDtAip8SN+o4h72P/TNUnL239RO6wEk78h2TtKWeG2L4de7QP8AQA+QAatnc5fb1t6HkaDtKGHqAji3YrAydmXVDP65xsJbTvELuVHIuwz5LbtR+4f1H0u2Js/z8u7gKb0jzuGjsTuLrPSS+S8bPOnb1WwHOWL122XAqdsrRBloI1G3dhD4QosL0fFkwsec3HMrOcch7S9vQTHocaZXtcHObRnaVdyWQ8Drw6DNG13TO1n

R2Y1pF0VlHV+HUR2HtQCBBGGOPS1FfuA8Wd4D+QTRn5fy5j+0KdRkAhynhXCdzLHj2ED7Vl272NBQ4JAircJPjFZFZLuXxOEsLCQm7iWU/vuAQCDFfiObLOgCJXh7Z4Ql7iVLohkFu+Oly5aGABwDnwVzLgQrYTbOXYI4XXCgvKdXuOu0eXhqiVc+XrcBVd/bVVyed5kIV37vOU0ZE2iRXw1xeRHVsV1DUJXSV4h2nTaV3hUZX6XdlctXuV4wD5X

6VWXacHxV95dlXZ11+1l7l15YQ02WmZjh5Zox3ZW5pOV1jU9Q7V2kJdXoBT1c+EfVw3aldlREVdc1Y1zIATXU1yR1g2s138Kn5i18apJofUKtdCIhwBtekUWrAdY7XinWQ6rtB16p0btXlxWinXTPSL0BXjp0FdxgFAKFeT4NNhFcekVe89d84r11jXvXG+MldfXhN0NfVXeHbFnkV0+MW15XiNYVdPXJ15DfC3MN4Fd3XtV1rj1XknI1fmtaN/m

0Y3rbZ1eZXnJAtR430+f1ffXRN09ejXL1+NfNEk1xq0zXrql8oLXoVEtcM3GCEzfzFOBLI6y4ZFNtdg4YtTtmXz4h1utPBUh2QsyHFCy/xKr/Fyt2Nb7QHRLh+7YPwDU4NVhoBXOayyFvSXZ/Rd0Mb0ujgIpWpa2pfk0N4OT7HLgLgBv9T5ZWltvzBlyJtGXjR+Ju+rcU47MTBHQEP5ZF+iyvTRCOPhqBhHDl30c1bS87I0rz4vOqv9SsMEDSIAq

gGEBIgGgO0AUA+AAnooTcgszurg+jZg0qBxawUfWrHG+3fLedw2EvErpZTpe6u5KzRPCbg/Z4fGXo8Vtti+Ly8rv7bfsBvRUwbQI7QVbKm1Vsr3Tl3rsuXmQHA2s9Tqn1qeg0gD/nJZ4mVgD8eyD8NgEBSHOg/9WWNdg9rDrS4gB4PCCvgSEPLmpg8p5pD6IfBx3Y1LUX9HFwTvAz4y7xeubBd5DNF3HOuH6YAYQP7TjHLQJgC4x59yXHog+htff

CjvQGcPrSsg6twsxMW4/elHoS4LvVr2l04ei7L84otdzdR0Pd/3I9yZctHjKEJBDBM9yrsb0s0KmAioS9xhtqbkR2vfZ9q/juhU9Zcq1k2CnFABfsId5XSQY6h8cPAZ2yHLgRHQfptXCNpu5fbJUqa+IED4EV5eXghglykbL4sjGrzJo4rkMuCJPZBSgf02cTz8YkHfMondIs4hNzhI3PhNDg5GrkDOnKqAiOYg5t3OAgtVKCT4VRMkTlFuT9Ege

PV3OAKpLRWjKxBXfDFOsai5D1dL8lDYnxVRMggaArisLhbAy7T9uIA7jylk+C3j9M3OdCDnoi77u+cE/iEoT66Aes5Tz1Bx7AOLVoahanPdWJPyTwxpAc6T8fWZPiin/ECnPhHk9qcPofHLFPyHGU81s5iJU81G1T+PbDw9T0dWNPuCymIXPrT45RM3t1KRatw3Ty4DWc3nP09H5nrN/Zmtoz/ETjPMAMEaTPLkNM+nwsz1zf4pmQEs+kPbxImfv

t8oR05bPneTs+fSnxuE+HPUT+xoxPZz/E8uVlz3RpXKxsmk/X1bRPc/ZPTz+YgvPNZPHtFPWrCU8gAXz3Rk/PVT8M21PPhA0+nnLrGC8tP0BG09Qv3yDC8twcL70+IveQgM8ovwtjFDovSyJi/YvlTlM8zPrkHM/ir7iZutxznZlndyrRk1w8cBqter1F3CetLP7ceQJgDEYnGUShBbhtdIHG13EsyjbjWM1FuN1Kj5NvxbL9+clu1WjxcvVH1M/

pdWBHh7gPrb0G0kt0QWoB0CZgVlyIKPOzTPY+qbjA/0dRHa/bhtqr7QMQYtbYAA2EFAZoHMBdu59yn7hvQoxbWCQLQBzvrSN3dbXRvE223dTbxSV3flHb99311rX9w2uD3v95m9eHA83LumPyfLcBFbs99aAz0m9OmA6N0D3xN+zjgyEHOPV264+w7TKBOjs2bTmJ5v2sHmflDPItioB/2GKfLnnvT9jk55OjToU53vpTo+/kPD9c+91oF76J7vv

BTre9f2JTr/Zg4oQ6nfZ0rpcw8TdrD46+Obhk8Tv+lfFyeuF3HmzObh+nABAD4oLQKVifw6yekcOF7bxvToCbO4pdvOjtMUfiLDc5Wu2NWlySsf36A9O9uH6b4ZdGP38wA+mXWoJPGKxlj6A9z3o3q+7HbfZQ4/lvq985cnvmIk+H8cCJ8XuDpj8Dx61CI0KivC4v7FgkxQmUXZApQsCUHjwvAlEHueQIUIlylpAiE9m5NlUAtC1nYlAZ+0VngD5

GmfVQt6274Pcpe8A1bwFO0GfWB8Z/3tEdl6E9ouewwcKv4e2LIOfPTgVz5ON72XbuAFAEMUadFn7vIYasDqJ7Jf3nkvgOhaoa4ogVkXx+9eV8N1WGfsGafGGYA6OCrclfqt4h3uQLRJDaPXInjk4J7YXZnb4O4pT1C7VhqlsK0cAXxGEJQ2GSV8GOINz4Lpf+ALJRAIWBK+/wOlxInnxPvyPvvWeVcDV+OQEsKFcdIrCLbY/y8z3cayfU3xGEKfP

GaFDKfvcGp8paiJM4lafc2Lp+2furz58mfyz+Z8bQlnwlDWfLx1d8IvbkOF854pLy5+hUbn6l//lnn5hrefRn9Z5df+1oF/0HL9EC+q2YXwkARfw8MN8xf9nfF+KtLnA99JfMDvV/wOMDgj+Zf7YTl/w/178rbVpC6IV+sexX4WBlfQd3PyFglX5VDVfhwLV8ekE31rbeATX3g5rfEAK19BQ7X961+fu9qnB8HfXxT+G3z1oYl5fo32SC/fDXzt9

IccbGgixEmlP+T0AkNv/jPkuiBz9vE1G1gtGC8XHJ+7fNRQd868R39n7qfp37z0542n5d/6f138D+ffnjz4IWfuXM9+lYr3wJTggsP3b9mfHX658pfDX/9+lkgPyqQ3ffPytgC/QX5D8/w4hTD+MIj1wj8+CsX8j+2tiXxvLJfmP9BW6UOP28B4/cJAT9RfRP8Agk/FkTFDk/kzoHdTXFX1F0JQ9P8r9LfdX8z/eygzpFktfrcG1+HtnX91bdfgv

/Xn9fIvyK+RhIHxL/jfnnh4/eg034vizfCv0IiLf1qit/q/YCAlAbfoh9AZCWEh5ndIf+6y6+of3D+h+8PHm2pbh+b0NgDYAC0KdbiPQbwAN13XKK0AGH2SQDz4TzdyHDK5KueDlQ5dc1Ye7DNh4jl2HqOcluKjOj/rCpvWFyzvT4ZRTLj6k5J5ZK0LUCpgNGggPYsZCfLIKNMUt6wPRx4VvI94xHFlwU7Q5w73IATnAZACYoBaANvYmRXmYj4wh

HRoMgXCYY0eS6QQBPo1xTkQRALzDP/MHJq5GN7DvCRYC7cd5txd+7aPXS41HIAHsfQx7zvf+6j9LbbagePo9JAT5wAjd4iQV2BAPJAFVjFAGSfBB7SfTIBqnVfL1fagALneY66nYABEXY46qAjU7XvDQH6A7QFZ5FjxMqTX6DwOSgAAHmCgNIGRu2ACdwTuHXyugNuwQzkqwrCBcgAAEJ7cJYBwvBvkeTo80Wvr+dxmmF4XAS2dPBpCd+vkccCmu

h4s8qicXoP3J9zkRcCmnZA/EGEDojFAA3iC6E80sECQgZh44gR+dtmkJkogTycUgWsIwgfscJ0kEC8gU0As8vKAwgQ0DGgSKd1zgABSE07FkDIG1GeoFNAnoEdnd44QnSdL4ObJqo/c5ohAxL49PN762/Mux+yLF6PlAYHFAp6DDNPzqwnJFiKANYGVQBwTu/HyL8efQHqA/ACaAnU6hnZwENA/QEweIwGLnEwHLHMwH9yCwFPwFyA2Aw4B2AywG

OA44G6AtwGK4DwHeAlyC+A984nHQIEc/JIEpAnuAVA1s6TpEoF5Ar4i8nAgiZ2bABJAg85IsVIENAjIFZAr0CKlFYEheAoHhAooETpcEF/nOyDlAlwGVA6oHEXXYC1A5Y7dA3oGUg445rnDE5tArc5w4VhBdAqkHMggfL9Ao5qQnIYHDNR37RApFjjAuz6HGZfbNwHwQzA9UheVeYE4gxYEzpZYF/nNYGRQBKCbAj75YLXYGvvc4FaAo4HR5RoGn

AwwH7A4wHqg/wH22QpxyUH+SWA+4G2AkQDPApwEaglwHvA5EFfAn4ErnP4GggoTLEgzfJAghoGPNXEExAyEE8naEGJA3IHwg8RBpAlwHIg+3DZAtEF/nfIHLHSM6fNXEGughEEEg3QFEggEFjNGIFkgzfIUglkGUgmkHiEOkF4nBkFQAJkGZgqkFsgz84cgjn7DA7kGdnPkE2/QUFpse+y62UUFbNBrIlfYYHSguMEuQWUEbA974e/W17bgVi4Ov

Cry0pDh453FzZuvNXqv9Gt5subAGtgYmR74fTKYoN6BNASkYkA/kbkAyNDUbLehipSj5dSKVJ4rWLZqPMd4MfTR5MfbgGf3cXb6PYAFPjUAHD1Ex4T3Mj7qgGTbMrDPhDJW0Dhobo5ZTZe4KA+B6abflZ30T3CJfAAB8o7HhKlVlYqaf0IQwHxveR8AC6VOAaspJGQosxHQomzwSB76jDBpv2Uil7yPgXghU88gG7Bt+HS4r8jUqZr3CE5nAXYXN

T0Qd7xSAMsG5AKYhlgmvzp+/kHxUutjvgtVSWwTVSLYPBW/yEzkwAnglwh6LDIhSpXain+Eoh7QBohvX2C+nfznQXgkzM2oVCospAioCpAvw0VD66A+2HgX7yRIcHV00w8G8gbbADs5xVeappEAIm3z/Bd8EAhwEN9Si7Saq4EN8AkEOVs0EPD2sOnocplAQhWsiQhbKhQhUgFRB6EN9+o6lCg2EOw8uEPd++EI3wvoPRwxEKsEpENWsY30GeYH2

oAVEKVQNEM6wdEOy0Vf0Yhsk2YhLkFYh1NTnQENV00MsF4hkUOnwSJWEiFENih+ABSAokMqgfWGgYYPyTOVghkhmxDkh4VHlIZ+CUhLeBUhEBzUhZUKHg4FV4K2kJ4szWCpk+kOaaCZkJe99ST+aPyAhiHTdsw3Ssh9fxshw33shqtkchPtimIrOEQhqzHcheaU8heaRO+GENE8WEIvQdkECho8hvgPpCIhVZCxeJEP4hUUOrYhrzih1ENohSqHo

hqUMC6Kdj0QWUPYhGkPVamWiVQBUJuhRUMN2pUNReFULEhcyAkhtUNCI0kIaEskLCocpEiobUPgAHUN3y6kN6hXEP6hukLfiw0PjMRkKX+gywQ+g4Jm6zrxQ+9IzQ+7rxTidC3VWXbnD8kgCnqIwGJkENB9obbzjo6RQxo24DFS1MFG2O4Lu6e4NUebAPo+PG2PBXAOTe//37uEu0vBkUy/mN4O4+LRwYMdMKsuM9GxmltV3e6GzLe/sycGUnzws

eDD2CimU6wG1iwAsER9A1PTrs4+D2+bB3iMUahWYboF3UPvwR+BXyL+HXWfIBdnkc6XRL+pXzYo+UGxuFth7QOeB8AQCGn+CinWBAAEKoNM7DrHOMp6AJ4Cfvj5CtbDKxVfjAUz7IVkz5Jjg3lE+EA2Dm0j4BmklrJhkgoAHDBIbMVaovRwR8v+UsAO1xdrudMdYQic9YYPYDYXSR+bH0QH2GbCRehbCmKmgQbYdHC7YfQQwAvFxrPFW0w4SgBKo

KTdM7P18PYRe04KgFAfYZpR/YQz8lvp2CQ4Z7g5HOHCR2lHCwwDHCC2HHDQrvjdDgMnDJEKnCe4SF8R+KFAs4TnYc4Ur8p7MVDC4WCxi4aFVS4baFNgGNDAhpXDvUp7h9YZgBDYfXDhDo3D79rx5hcCzg24R0pbYYT8fPF3DSfr3CiupR4B4bh1/brNYR4SJEvYRPDwEFPDGAAHC54aHCIERCwI4SvCpfvA5WkAQBN4Z7ck4YBR+ahZED4YND07J

Fls4Rgoz4Ut984ciVL4cDhr4Ve1b4bEQU7vxZl/hW4pVoh9d1sODN/qTDt/uTDaFoJd2vJCtQ6Lh88gJig4yiuDdDuQCk+InRNwexgb3EKMG+oO98ZrztCZhpdO+vY1KJlO9zwRSsDHnO9nxsY8ZYXeDCjtTkJAR8sN3ug0X0I845AfxMJPt+DBjtW93DO1ozyk3CPii0BhcBzhY2nTgA0iGAXfn6l6KtQcWcC79d1JVQNrOkpuOj8Z34cbDQoTt

DOZOPYlkBnYxAKjceoBV9lVBr8HyulxbIusp+PC4jQdt/CPEa5AvEQUAfEaFR/EaVhAkV7Y/EYBpiZGEjB7BEjjNLXDAoB/DCIbUo0IQkjm4EkiUkWAcafukj5/h8ozodki2So2QYdmXA8kajsCkZ4iQwN4i2QL4jykZUimKiEiOlHUjrHA0i4FG/C64TEiPIe0iGIUfDxHMkiH2qkjekUPAMkS9UskfdNhkeusxDrjsM7p6VuEWMsRwa68wGpOM

KYYJcIfAf9+AHkB8AHvgIABQANGo+sjVjodL/vAAeMInR2YcrBXYGzDGAeDlaARxgogK3c1EacB3/hpdZJN/8HDsLtTwW5M9LnwCxYqttBAUYjwAb4dZYUHBHcuYixhpYiA4Pkh3cnZdslmrCD3rrsfwXGtN7u0Aw/NOCKgPQA7IIwB/QGEAutlIj3dJkcQUeUwi1rf8Uym9xoUVzDXuBmB4UbzDJtvzDuNppchYZO8BNoACWghLDP5mosNtku87

wcalBIBzMnwbBYbXIxBWgKhsPweJ91YYe9NYeKE8GHsDXIJmCzgZccs8v8D5/nk0CmlABgQbycPQRT8eQWFBvQViDlmtnCUwV3wjfgECnQXU0T4YGifUTyg0zgkDYQf6C/zlAAgwTycQ8iGCb8F5DvUdoFHUbucw0RTII0QmieUB6is0QGiQgdoEo0Xscs0Z6Cu+AmDHQRac2ClUDkwcWiyQeKDOQTOlKweKCWwUsDdjOyDBmjnZhgZvJ+PDaiiw

faikYWWiIgYMD60cRc3UR2dPUZM500b6iXpic1w0SEC3UfmiQ0aOiF0Tmji0Trxo0TCC4QfGjE0Scdk0R4DQwWmjOzhmiR0diCi0ROjxJAWia0d2iN0cRcS0SMBM0beiFgTOjOzlAAq0ccckwc6iI0agBG0V2jnQeWCuQQ99O0aWCwQZKCRMqBiozl+clrL2jdmiMilOmXAB0XajtQcOjIzss1iQa6j3Uauj9puBi30Zujn0bhj10T0pc0cGjq0U

Rjs0SRjN0aWj4gTui40e2CE0R2dD0ZkDj0TkDT0SwBCMZ81L0a6jr0ThiuMYuiH0eJJOMR00K0XMhP0dGCOmphikWH+imwV+dm0TFBW0QBiJQaKAO0bHglMbBjhmn2jiRn2Dcdmxd8dk68nNjxct/mOCXkSkNBLnwFw/KoACgAtAtgHkA3oGaAOFoatgtkCikyqIJjksdFdljxIijiwDEUT8AYAOUwHJFv0yjkKghbEgMmYY4cRYTwCVUXjl+AQY

jrwfbMx7rBs7wQvcF9ArCnvFfdbEfu8ddtCNGUWCskUOqsYgtLMzQHkAkQOvAKACnoKNij5JHiCiPdLTFzGAzEsBDXFlHkO9fMf5MAsd3ANEX1Nf/gNMosdEs03riiM3oYiwATmMWjh0BOMJhg9tpID46KCl9ouytlNnu9tdjWMBjtEchju4ZSsOs0MdICVYGHshcHhti+tEsgSGHAwipK2Md0OtjXmvMgDsbshqkIw98YX2M2HgZjkPkZi+ESZi

g/B68PNoCFw/CwAIABAAWADQBdgKslKsZTE46AHBlPmmVZwCxh7/lnQ6DDR8+dhWt5UZoje7vT4zwXo89EWqi9BjStNUTm9fQPaBrHlPUrLttJs4DOBMsYtjzFpW8XBog9EAGaAs/hdZXZAdYXIDVZsUJbIrYX+UlWr+lQwv2Ybwh6w60oApQoKP8oShHC6ov/l2cTYB6NC2hxCOZ4BiKvxRCCrIekLgBGetl4CLCwBh0f0UfFOYpgni7h/ykbAe

ADBkrrJFBsUInd4bprZXICQjG9vJ4bwmlVNPLzj67CtglrMZC8GFTiB2IGwPlEfAGcUzi3SMi82cUpx3HFzjqMgUpA2IwB+cYJ1WEg9thcVc8xcQgBmOJLibONLi/wreh5cR4gkAkrjRrgcBVcfop1cQDUtca1hBOGIh9cVqxDca9BjcWnDkDmbiYbBbjA8d6RO8rbisFg7i2ONwgeNC7jysG7i2qlUR3UuzjvcZhxuce+BecQkBy8Qvhg8bT1Q8

Zy8UnuLjI8auFo8eEYr/HHjWogB0E8YrjlcSniZ1OnjNceEQs8f1c9cQbiu4UbjQEcXjgaqXi1HJbjHYZXic7KwieuF2MYDKHFbkYC17kdIdeEWC1Sdjv83sRTslouH4IAKqAkQNy4IACMBd5uf9UZjIFgccCNa+lG8VLkRNZUnG9P/vbVW6t1i+7tijVUbFiQAVLCEsW2tcBHIJx9Hw0yUVzNpsVRs89MTjIRqgDLUbzkPNrjFS7pwBP4BgB5AG

6Bv8XyjXMQATNZvRA1wOnRdxvXVsVuNtVEcQIwCcFjBYRUcTwZFjkcWBtYloNj4sTlskCfaBRBHII9UcVswHsHBpHuhMVYVrtcCYoDcsRTi/3kb94pOKZPAG+8bodCQn3ioSMpIVIUEBoT52DIBLwL+8kUrUJVCXoT1CVzZNCcYTo5jB9bsexcuEYwEeESTC78WTDxwYIia3unE2UYgANDu2BcUPr0lwYDjgUeGgQZGKlVpDxhGsUpcsyq/8gluW

suNjrkFUVwThYSltRYTASYsQNiOPvijhsZtsePje4MBDSh8cWDl/RjgThZgoTHEVps8GGMYQyMVw02LZQmbi9ZnyH7gdWF2h0tI4hYEGBQIyBGEjoK0hT4k8BXIL7h5EIQo5rLfYGamgcAgKOkDIS01ihJgAEEMdBcuPIBpZDQAHypmJiVFO0gQLVF0tP1Y0VGmxLocEY48PAiQOgelyEDdUOsMyQxEG6kOcGgROcJYBEYGyAkCDUjW4N/DLgMLh

5kADD+rFXAUNEQASNIz1AHC+AxvoYToSKaY3EKghR0o7CvtEIhcoWPiXdrQBoajn9ZEAIg7IO7Y0YJzh9CdCQ4cB3tP4ef4viXsozIBZ16qNZ0VsLWFSsE3g0YBVhLCUvgcNB6FsSd6AzILGRTEDFBwNFi9D7Bnguih20LuO05/Hnlp8cCKRx7I1wMWPA4S4ZmR7ZDfAaWFgh2bNuFzPOcAGEj4QOiuySBKIFBN4J2EA/t8oz8qJpPjELhJSNyx+

SVaxYyGup9ECKVxTIEBhsDfAYVPgA4VN2hfTHfI8lDep6VKz1G0J3jy4UKsqiTQR2ELSR6iaIpOkCypU1DVQtWG0TcVE9hOiTx0eifIk+iYJReSCophiaBRRib7sJiSNCN7HRpZiRgB5iYsTliX9hViZhp1icbiOnFsT1NDsSpSEyT9ia7dRFAMTjiYSVIXuU5TIpJoriW9Abie7Z7iWDo3ETx5nicbjCHoYTF2B8TZlNSSPANPjfiYcB/idqTdc

TSJgSdQBQSShpl1BCTOIXFUTCCaBYSYXl4SeIgkSSiTySWa0L4UIhPid8SSuia0rOma1h4ESSSSWSS5STI4qSRuSngHSTPIAyTqZEyTtmCyTdKMuSNnrsUzVH5ReSfNcByQDUhDvVRgoaKS54JsAJScxwpSQYkZSSKU5SVeFFSbNRq2I+SiiECp1STwpNSRewByeSxMoXqTOkAaS9CUaT78nfBTSeaTl0JaTJ8NaTZUCLhUFEcRDKFgtnSZrghQX

UShQR6Smid6T7yYZ1pkLppWqF0Tw0haFWiP0SjiRGS0nP/B59uMTv8HGTNmAmS6AEmTKoAsSliS9UViX2SMyQkAsyZyScyUUI8ycFQ4SAcSUyCWSHKqcSnKOcS74JcSWcDWTbifWSOlI8TWDiL1myWg82ye8TMSabYTyfV0W4L2TK8tYTBySuEFkA6cOyef5xycnhNIVCTAoDCSYKnCSVsIiSp5EuS5SeiShIc5SLKTiTNyZZ0cADuSBEHuSp5Ae

SGvpSSgEF2TaSZlD6SaIoT4teSNgKyT4WA190tCqSnycl87KW+ShSexoRSbuwxST+TVIpKTpSSnsgKTk4QKXoguiNFCIKWqTQ5GFCAuACSdSYhTftBex2EJWY0KcFDMKQ0RsKVUYytIvBr1PhT1iIRSHSSfiy3OncBwZHEiYYZjFasZjnka9jXkTW9IkrONVALsBewM8d8ADoEnMcG8SPsDjbXAoEXnJ5iyPgiiyaEt4S6OAT/1gzRANtwSUib1j

XDv1jzcgIChsdLDCUX6tRsauAtwGu8rHoxARBPD1MpidszUfSicseUSoJkXd5klrU3QMTJsAAUAaAL2Akkt1si4hfcTGFRse3rQSNQDLkGsayh+3keYH7mWsbqZ3d2AUeCkiUqiU3n1icUe9S4sQgShCT8lscfH09aB4V0CXJsUrAtJhJKJ97LuDTssaLMoadtMUoOGlsoCSoyPBOFxoM7I+OLyQJRPkphxDAAIIjyVJnN4MRae1A6AOLSEoK9AE

Tu8oZaXhT5aYrTewEqhodohjjnKrS65PF4JadrTpaTKFxqfrS50IbTlaYHEMpnNTOEYTD5ehv8XCWOM3CaZjupEXdOUt4TwALgAFoHeQkQKqB1UFQTqsc7BsaScMZwEJJfFqygFcv7ArqSUc5UQkSEcVASkcSx9dEd/d9EfASNUdm8JNrm9p+onxYARYj46GYd6XBrtTUXSj+aWOtBafrty4NTiiOiGR4gNVVukGoQjnhQdQaqSZNaZLSNnjPh2o

HhTV7AcY34JaTAHKKZENN3TBlHooVqHLSYtGQj/yYAki2GDVdNIQ5GWH1gENG89KwtOTcnF2SAyC1Afdvw4OiAZ0UkJ4BGsOPZT6dep+6ZE5UbMdBS2IZQXOF+olaffZRkJlS6OI8B+AFCV1aY3B/KN6RYAN1BwiOySi2u8AIKDfA9aeYgO4DAAAAI9CgjgAHwCvLnwEhTkEeZhPycQjQ4aYARPRHB5sXHBPwUKCAgIQDUAcQh24uhBN0lq4t02i

pxeHpBzoGqlT04Zxa0iMI60xZBjU/JTD0xKSj0kakWeCemdtC2kz02Wmxw/ADbMfRJL0i4gr0/HBr0uBAb0iL5b0vKI70sQB70rrC8sVWRH0zHBREBuBn06zzIqNRlX0nWlnQW+ntoFBDFcClhP0h2kv038hdFOZgf0r+nxeX+n9QGAAAMuGiV5GekPAfFi20iBmugaBmwMwuAGABBke4UEAhkFBnemEADoMteR6KO6Y4M10BQXAhmwlEAAPwsBg

14ytKAgchlt0oxDUMrunf082x12K2l2UGWk5QcamsMwqTsM0rScM7HDcM8Wm8MvWnz0v8nSk5ens1PArYsIBDr09kgWdEg7b0hHDUAORkkafemKM3MCCkFRkGRRuDn0zORaMywg6M3IB6Ms5gP0tGDGM56HPlG8kWMleBWMsjw2M/+lhEBxnAMuMDOMvhloINxk+AGBlpsOBneM89qIMvxmAENVgIMYJmYMsJm4QiJn4MrXBEM215n4lf6X4qbrs

PB5G34r2n8I9wm+0jzZ3ZcPzyAFKAsAEKBgCCOg13IFGhvcbyV9WgmW1MbYqI0RZsEyAl3UxLaO1DFE8ErOko4nOlo4+mbZbVtZM0pjChrX7JWXTjA3uUeYlE3JZ4EpQGxHCnb85bD5owQ2lI0zABEfSS7KzFPy9ASFnZJV1w0wLegws4Al1zEd6dYh+YRY56m8E65b8EzImfUxAm4s3AS3AY1LpgKy7ZgFd7WDWQm9HL8EawillWoglI8eatDxS

YoSKM+RLWsMEBNoYNRm+NvanvbPz5SHVkpkPVkTOQ1kkKY1kIY7m6IAJFJashjgWs74xLIP8A2s05BFSddY47OD5kjSQ7r/bi7LU57GrUiGaP45lFmFAOn7cEYDekFoBIgC2RBEpMo6LWlBbgjMpdSaj4+Ypdxw4tOldYwVl//F6msfN6n91K8EM0nFl9BJPhT1bpJys9Gjx1UllnbMokrYpxEqmCqkABORQhQUIjORREbSyI6CV7FomrVCWD3tN

jh0lBqiI4O/xJky3BF4GyIGso1l1g6JHnkURSt0/Gw+pUf5GwulRokejhfgOLqTs2+BAIV6ABAUr7AmacQMsDBAMIyfB+k0QhLIdAhNVFdlNOAjqZhbrBTQNuTA4eV73sgqCVAQEQZqUAqCMizj9WbIEseViRRZaEH/smgBlKHqB+QIazlkSvKtpcIxT47wgfHBCoeso1mkHDUK44TPBQI6+Bf4b0gQAODwqhaAJsvJzgwADTqPINuDo4e3CZA9Z

AwoEjlvENuCcKcLwtAp4zJfX9K+UG9lHAD4SkvEdLLhFtnn+NtlD4firuhVuDdswBLzIKXA8RQdl94Htk3oUdngBCWzbsxDm2s2dmbI+dl9KRdldqJVosctdntyMFibsuazbshIC7sphAHsocnD4WfGnsqQilaXFToIK9n+41dm+AO9lTMJ+AaAJ9kXoP8J2VTymwST9nMZQqG/sr0DAcwDkvQXzmt2DyAPsTrh+3DDmy48cnwcl5Ryc05DIcwES

oc7NpMZKGxYcnDm8QMgJqhfDlksIjncMKjlkcghCUcgsHUczIGfEdHD0clT6C4h7bMcqaq9WNjn2/ARAcc397ik1SKyeULgdsgEq8yQTm9s/Aj9ss1qtIIdkSc/tBEBCfgzwCdnAIa1kzsqJGKc+jIpkFTmuZazn82KbIbsnPJGwUbl6c4rj7soEnGc0cJXws9nmci9nNwKznqc2zmh/ezmPsqlTO7a+TABE8puclEQecw+ymUtBB/so4AAc3LhA

cp7kgcwLngcgNjH5RgDQcgqCwcmciA1KLnTs21mxc+7BocuCpJcpjIpcvcLpcjdgEcrLn7QHLlzIPLlAwJHk0c4rkuQUrmMcsBKVcskDVc/061cuMSt7WwnXIv1l2bANnX47O7vMo9b34gRHfMinZhlAOkLQUBCejS/BINH/HrLYFFT1MXy3/NMDSosbZJgVVYw4whqRoYhof/Dgmu9NFGI42hppE3uKYsr1bB9THE+HH6kT3ISDeYKmBys5PgBw

RiB1sxy6qsxQkNbDzaa1AOmlYFoDIAFoAFAMjYPrFXhSXPuACoqepyCW/6tAfnkFHRPhC8zNkp0uj7w43NkosoVlosvgk/3POkY4gunNHVXlJ8HHyl08lHx0MYAhwOaRKs0xYqskIJ+oA3lawsuCqAx7n4AZ7lWglkGNNI2yaU7FClqQjHFfN7kpAYjkFgt860XRarAclICboQQAkcivnenVQGvczPnvch0GBVNgrV8svnTwBvnnovr4l82vmZ2c

vldA1U6znDPlZ8nQGZg3PkdaZmqdswgCf5c4AcIA1Tl7bPnMggprDwaWTFILqBgk+P5I/SUw3oojHV8gfn182C7oYyLKd87LlD82i71AjwBVwfUFfop0Hn8xHmX8zEHzow/n5c7vmwXd46IFPa5p80fk+ct7llKCfk58pFhoOWdA5RQvnno4vkt80vkX8j/mV8h/n989/k98945N8/zkAC34Ht84eEl8rvk98iTEd8xAWo85/lV5EfmTHMfmt8oA

Wr8kAV58udCz8j0Kb5VGyL8sVTL8igVUgtfkCIDflK4YTp9/BP578nDFQC1iQ18pAUn8woH8CmgAwCp/lwCuoH8IW/kv8qvnYC2AW4CvgVn8ggV18ogXpgyc6/vdPn/8lvmACosFT8s8rgCmPaQC5QXQCnAX4XBAXQCo/lEClAWznZvnj84TH4C0wUKC8wUvot/mECyQXEC1Gp/80U7oClfmsCqgXT81tA9Vd0Lz8xgX24ZgV6CtFjsCzfn5QFDQ

78uL68C8jGiCwQXuCxQVJCkwUCCswVX86QVBQO/mn8mBHyCiQVpC+/lrotwWqCjwXqCpQrMXSVZDLRwm+JZwlPY1wmfMn2mqrIu651F/GlYVQALQdRqqAOiTMwtHxrSVVZhE6jZrSRmK4tXcHC8g2b8suba+8/NnCs9Laisj6mCEstkdJJ7zZwbUBys+Or7DXXlwPDnLJ8+ulKE5B7BoWdCbAE8I9tP+HWw5ZFwkejjRcrgUrYdTlYRB9mOcs7nA

4Rl4+EaJ6T4K9D8/RajXcnMQtwNBbgI0TIrYHoSyg0gBAISIArYcvavsexBnI1zKXtL6rj4cg7CHHtpFpKZAgRSKDIPUAX58ubDLYUaRMVc6rvbNjKVUW4UuQCEVVtW0nhsJtgmID+CT4F2RAIJ4oSwLMiQcXQB2dbPKRQMHa7kBUKqRGUo8cqxAR491n0sMHCEIAjoPAfABrKbqB55TACmhb7ZgMI4XewE4VMIXm4R2C4WhI64VgsEkV9wubnGw

k8qnc7SivCyJ7vC5l6fCtQDfCr/C/C3mQAi8/zDwIEXDwEEVrAsEWMACEXDwKEUmwmEVuyDxyMIhEX+QJEVKi1q5oiiAgusvpz8EHKI4ihjjc4FnAEimOREilbAkiskXUdCkWkcKkV9IGkVS0ukj0i5kq0AXezbwVkVoadkXYoTkVccx+DiEXkV+mUWnWsQUW3slbCii8UXx4PqxSi5tjG0h1kgAOUX6gBUVnC1Toqiq4Vx4G4XA8mLmaih4Wvs3

UX54GsgGi454j5L4XHcs0XUqWMT/CsEnWi5rLAimKCgi8EWQirYSikgZEeik9r+VOb4tcFEX4Zf0VXYQMVYikBR+EXEXhihAJSaKMVVWYkW9i/yBxiq0UJiyRBJirYq0i30jpi+0qZik1gsivsix2PMUFilSJf+HkXlqVa4j4gUUidYUVViiWA1iigoGshsV4w+16u0hanu0oNl0jJoUvYsNnrUou7QNAOksAXFCRADaAtAfrzkzQ6kX/cFlqgHz

A2MFNlY5IAkxE/FbsE9R4QEpLZ5snrHzCge5wEktn502XZY4pjCiCYwaPgiQlz3XoD2gYmDvgsGk10pbFs0lPkYA5lEKNAOliwdADIAVQApQIgCG9Kgkp+UlyUSrGYvOGmC0oblm0S/cH0Sw8GcEid5JjZVE002AkZEpYWlspXmh813QwyRjYA0wT4bvbnndwbibx88I6J8+YL7CxtkVEjVmOeCdD7xRiGiMgMjCJVuDiETFBf+NAI/+GozaE3jw

BSy2LCVRPIoJMKUgACKV/09AJ+mRsVEvR1n5eeKX5QRKW6aLBIpStKXf+Q/wxSslKwfc/EsPO7F1CocFvMz2k0872lrUjwlF3WFoB0hyBvQYjBsgfAAQAPoUc82u5JlYmB9AIYVY5QSBTuJrFSo7zEtYyw6i86w4S81FGUNaXnEhFw6Fs2mnFsyWGcS7w6JYsGItHcNCLSJKZuzJyWhbASDhADKbuSz8H2IvYX4ElYYU7dbqfYzgDtAZADIAPIDI

AVGlUEsgFqgDIojStyZi+CICKPZmK9caVGTC39bxvDgFd9UyXU016lrS7AYcS4PlcSwunY4g2jrCqy7bvMj5V0sSXIAy6VJ866WiTMuCygQKAL86ikuQVNKppNKXFnHQEh5QliOQO1jwXak5ToRC5ToGmVEnJazFnXEkuQeoFkysAAznSY5kywTKcy9/KJcQJRUy6PB+C4i6RInvbvKTcpudPY6WAACHCyt4jCyweCHoaDFtnWWXLEWEhowHOwqy

ydI0AWWVo4a85eCnmVOg/mWYFO/may6yCppDmRTpPWXH1Wi7vA3WVyyrAA/wKwE/yaeAv85WXLNB2XLEGKDWygCH6yx1Gyy4WWWASwC0Xc2UoAVNJLKJ4AHHG2U31A2WqAsmXYZE2Uf5ZY5hy5ACWyqZS+y/2Uyyx2XOAGACOA2i7KyyJy3WX2Xqy0OVayyOU1KTOW2yjQU/8kWCDgAmXjYL0nEy0mUr5CmXP5RWVwXCs70ykk6MyzuVFnFmUWtW

jrsylyCcy7mWI4XmXHNJOWCyrvKOQV4GdncWWcaSWX7VaWXgnQOVOyoKD24DuXKy6M5qyqdAayrWU7yv2XVyzwXxy42Ur5U2VZ5VOXpyqOVVy2OVZ5e2Vry3OX3A12Xuy+mWey3eXvAH2UOyrOWrynOWOQYOVlyi2UVy6OVHyu+Uny2c4Jy+vJJyjAVXyq2Xfy4+W/y4WX5yrPKFy4mwgK0uWXy8uVimG+XwKsBXf8k7F4MfGX/oRuWc2ZuX8ytu

VCy9eVMy1C7dy/nDUKhHCppAeWIaQeAcyxvJjykeUAYqeVfsGeUiylgViy4zQSyvjhSyugXAFR+U/wTeVUKxVoIXQ+WlylzgHyr864KtohxyiBVnylJoXylOVayuBUxypRX3y4VRFEMRVBQF2UdfV+XvACjFeyqdBfy7RX4XAxUAKzBVAK7BWVyxRXD8w2Xjy3c7QKtvmwKjOVOKyvkGK5BXLHVBV6OEuV7ywBXhy4BW3ynRVVC2wlTxfsGISzi5

DjFCUKrVOa08r5mtCjzZ6WcMqMAaMq9gNGBzAPgL9C7iTMbHlDio2mDDC3t6RElEI8w4GXqXUGUU0kyXaIsyVQyiyV00oPnYsmyXCEp0AA8Hnns0nIqhbe0ALAQ2ig0sT7iS0nHeSqt6+SzIBupcckA2ZHYSRQ4LTKuxziRYGymw7+Fo0MRBjGYWz7hStI9slMS0CyqjFpWMpraVNiGdM9rjHF24C1PcVP5NGpKcCETFpe3CQFfyrwmZjhWkRenA

BAqViM+uBF4Z+ApiHmpXBV9p+4BBICJRxK2EUKVHwDcKSFMgjnATyAGJD4RyAJNBSIOUJ4MlwB1gvX4mVT/AogOrREAGzL8eSZWtEC8nD2GZUwHcDrzKsSJA2aDQGUxT4fFVZWRQdZXUqWHl2EbZWdYXZVQ1A5XFRHVpGdU5UtwXCmyVVTpH2D45XK5Dg3K5LJ3K6QpQFCXCPK0FWzIF5U5Q4KVDMz5XcWBjijVP5V2JRBJAq8LIgq3yIVIPyhhE

SFXQqsMSwq8pAIqz1iSAZFUy/QrJoqhFD0ATFVzVE2mupOrp4q0SL2OWZVEq6mTA7QaGEURsm1ZNETUq1Gy0qzSL0qwBKMqtrl7K5LIsqo5W6tCvJnKgRQytGJx8q7KrcIcQiCqlPLCqg7GiqzPKOmJ5WSq6pkiM2plJSzRlyqxuQKq3mpKq+BL8JPQkJQVVUmJc35PKzVVWkcwA6qsEAwqhQAGqzcLssY1Vl2U1WvpTxwWqq1UzUsbpk81f53Ip

wn1SxoUfM9CU0LennMovPoB084DyzCgBugMACdgbQ5M7Exg0oQOBCSYpVplJu6SoqaWsE0nwd3FFEBTR6nJEuYX+8kVmB82GWtKkPmO6CAG5vXoAG0fiXrveOjEwZlAq0HYWeSrQSjK8nGG8inbv9cPz4A/2hbAEMBAcQN4R0uOg0ofZJi+cVGYNR/44+XPxNY4mlt3UmnTCxj7HqliWnqhYXnqjaVwyraXCEmcALAMebdKk0YbvWHpNMObE9HBP

lYyryU4yydaq01rCScxiIuhX5BWdUUHDiIiAiAIXAq0qAA4VejUpiRjWLoHAAsa9IRsavihZS++rC0rjUPMHjWdYPjWEAATU55OBqsIETU3YhCW1Ct2lcXCaKJKuQ7NC5qUTq/LHtADgafYyQBowYjBowXAB5AH0agaldUVzSDXQok4azeACbrSSHGyMaHEe82j787AWGJEupWUzBpWrSppXrS9VHYaxd7cS3ART1EOAALbtZHS0bzhoZKw802lG

Yy81FUatVkb9TIDiECuAyaqzowIA2yhQdLVyalRQ5asCrv4fFilwmJl4afunEINxBm/HXwiRHLW4RIIX2JctWWJHeH+QB1g5tHSJusZnBgsaWV1q3QCwELBmNyf5UsJFMhW2XIS92YRKzkKaDgETqw6hO+A5akSLLsYhkpa8uD+QGrWZazfDZaqaqya3MKEKfLUtFQrU+ZBMIlamNjvKcrXoIIqWVhGrU1RXomsSBxKNaohFOxVrXaha+JugTrUe

hbrVZ48XAEJAbWiKYbXjiQQhnfXvYaASbVjwabWpopjWMJK9K/6WJk7oVLXLajbUZairjnMC7X0RI+A7agUp7a70gHajZTHan+yna0KXnauHW5aoar1apBJNa+7VHVNrVPal7VAIN7W9az7V2JPpQ/a8USafAHVA6sfZKlGbUE6ubWQ6h5n2E/TGBsjTWHrJJVNSjCUtSjzbpDAOn4AfbilYTgDQ4SQDyACzUAo5zHLqgpXCS9dVQarFrnU3FoCW

KpXK6ZVw16GpV+YnXR66DOkhTaLFy89iVYay9Xwy7aXk5OyUS+cICR8jAmjeDMDwxdGVDK+LUQ0/nifqx0Yb3PTVrDDOJhARgBxtZZiSIplk9bDGkq6yvo2axgHV1BYDF6C4aws79atY3XU28ZDWKoiGWpE3gF+amGWW671ZtKyVmeSRPiQaqy4PgnHyZLGlERrD3W10h2je6oObKA+Nw5udfigeF/SHFKfixuE1nZuX/QRuZvVRuYAxt6jNy/vB

Nx/6Mdkt6gtz964tzwSl2mqapCXqakFqC6rTVjqlVapDTIDqrVkYB0lKBI5MIB5AFwB9SyzXcSAmDY0jdUSDUly8eOxj2Mf6W2QPuA8s2IkHg8mnGSzgFU0zPVm6xhp0TdHFW6nDUF6yNB2gRySEa6QQe6HHz5IUSXu6+QGUaj9XUa3GSqmMDx4eBjxLENvBWUNirlc2nrWUvMCMIOnappbnBkcnW5XkLYCoGxgCppaHBvEJW7zkkqVRSzPC4JZB

ArKr1WccnvWPGByQwGsKBwGkg7ZQ/vGDhZA04Gy1V4GjA0ZdN4DsGtA0EG+3BEGlbAkG9AKicCg2GUylVUGhrmCeHsRNAeg0WxKkgIGlg2SINg24G9A1vEbK48G1Q38G8hFk3P/wCIYQ1R4UQ0NCcQ3DpSQ1RKyqVPM+alxKwnYC62Q553Y9Z081rx6al0YB0t6DKNJEDjSBfRLqkN5hbN3SnDaPXP/SN4N1a/V0ShFnzSvlkm6slbZ0md4W6gLX

v6oLUIypjC7jcDVWXNoDeoLMBka6ulV6iSW165ebfq5lEzjAOmfwEYCMAfJDEyVQACuNGnK61aCZ+NXW2arFqtAZqYREvxbBG/SWqPQyV36zzUP6jPUFs6I1sfSyX00zaUJG2yWQAkSU6LVI2ZgHFxvq0A1e68A2IpHjxxQOtAwERSCxSxY0gKNnorGkwkLGidDLGhIDY7Cw0cI6fXWGhoXBstCWhs8dVOGlfXtAGCYB06HCbDS4C4oS4Bowf5E2

85llx0LPiCQIpXq61NnIhHATc7VzWw4+InO1Lo3gy+pWQy3zXpE5pUXqvPVXqgvXGpDjBdrMwaRa3riuudMBu63mnDK6Na5G9e7165sWVa03yIMi175REjy4IheAv0dRCeAZAAEc5pkZ5ZSLVUJpwNdPno3wZnVBqbrDpM5BiLKfrm3oSKAfQDZWw8yoAmikBlxgYdHiEFKCTABVVCAQZTQ4egDbAVMgL81AIZSj1gtwN0AcGhWlbCauGGqzCjX8

RrAHFOKJHqdtALaih74mjwisKNMLxRdJSkmw7AXoerAoAak0FPWk1VUfkBCio+DiyieCVqnXz3tfelT0jk3/WLk24AHk3/oX1XqhAU2KQftBTWPE5imoKASVSU1BQaU2ymkhQA7UqUYBZU2qmzn6qc+FWbhLU1HQHU19ac7D6moBRYLBKRrXZxL3yM03EeTCKWmitTHwSk12mj4XyhTYD0m9dium5k1jaohR2Vdk1AsTk04qftABmvk2aREM2oKQ

sgimoIbim6M1gAKU0ym+roJmhU3RS1uAqmunZqm9M1gq2om8MHM3Cc3nCAEc1ST6m5FWG15k34hqVC67TUi63TVXGiybh+EMAwAMIBGCdoALQfsCgso2q+GyB468I/UW1GiXJ0zEIdGjzVxbBFmzCtDVDTdFkxGgY0tKmE3W64Qmx8+epWXbzAO6u17nSvmk5G8A1F3YqYB01ADYoEMAtAaHACBSo1qS942BwZ83fGrHIhE9Oh11XjAX6goKJ61S

7J6iI2IskE1aI7zXgmvo1FsnPVxGkC0f68tkZgf3QPqqx640vaVAGjE3ZGkZVzGiUJbYkJBVIMhiVcLEA7YRKJ4kZKKsRJxLm/ZcJIcS7GiWp+S0gCS35ZbCIyWmwhqq5xLa/RS3bYj+jiW7sLqWpKIsRLS3umgk37G3nUU8odX7mkdWNSo80XG5fWIAdVbQzAOm7AS4CcAIgAbQREmBbEiW/4pMqrgB7gBGlXKbqy1bf8OXQ6635wHqo3UguX83

QErPWQm/zVv6li3DG69VEoie40oLwKOSqbHh1Vd62gTI0YykA0JasA1Jam6XMoqWYB04mS5zTgC4oJEBsgKWB761aCOgZcDBWiHKx6g3j+LS/XkWkAk/cPXV/OBiW1K7o1gmp/XmSxK1MW5K2K82E1sW12DgWSC3eBbMCxayvVFWz3W6QbE0uPVPmN8RvX/6Lwz5uFRDpuCfUd6za1d6k/Q963a2z8dvX2s7KWSvLa0j63vWt60AyqIKD5sIqy1r

/SnnEwuy2HmxfXk7ZlHZzGBrtgFoDYoBaB2QPfAvGxPzh66rFJWQ/X4W1ATO82VnYrRS4662/Uea9OnMS+K3P60aZis5YX568tkYCC1KQWtMA/LdE1xa5a3V6/nyCW1zwPGHsTViXAhesrCImW2rVddbkRCiIqXzIAihbEeNTK4X3aM28wRNGUUxBAP5hryTrCL2BaCmmAkzmmSkRhAHBCqgJ0z5GQYSFGIBBhAGW10ieUyJQJW0DiOoRq26kyFm

TMyriFYz+CZUSI4BKDdeHBCknLcT9CAowG2yqDG2023DCbOBHCNYyDwO4T225US4Qo23yANJp62lW1NAG23+iHzCPGbrxbyHkxOi5cRW22SgXGOUyNGQ00CeGg1U2jJSEAWm1SW5iIM27exM2v7ChS1m1s9e0hNYGrhc2lO082jhDHEA5E1AFMTC20W2BmcW3tiSW3S2tkTl2/wTgmBW2a27sTKiRu1+2jW01250x+CJcSRQSwRZmLEx62oUzLiQ

22ki+QAm2weCuifW2D2q20j2n20HiO20W2h4iRAR23+ie4Tz27xCu24e0e2nkxe2me0miNYzu2/4T5mYO3eIUO0bGS4wq2kIDa/aQ2Ciam3x2xRBVRTS3tYbm2u4Zm3p2uSJ2ELO0FQHO0PwJ+1o0Au01AIu2C2z3Cl24Exi2jeiumKu0t2uu2uCBu3t22W0FmZcSQOx4xNASB1d20kU62q/R1YHkwD27xBD2621j228Ry2y21u20e0GiOe2EOhe

1L298Qr28h1r2qe2b2/Mzb2yh272wsz72vW1H20wRG2sO0CmeswPEC+3EjA40X43c0PYj2kfWhfXnGpfWUw4+6Q+LYCwASIBIgFoBn/bC0mMNMCMGOo0x6jXXipBPVtG2VFe8nNkCsuK2Z0/80B83OnQmya2gWgvVZ8YMbiEx9XCpQUahHQZV8Wkm3wW0q24yzIAKtcHZM4Up4RPaV4/wX54eDB7ahQY0H74qEo9QbnAWm+vLcnN4UEG9JRh5MRA

twOhJYEeW5iAaq49QW7aKAN2WlG2MjEkznCukNbRVWfRBNFSCqnpCLgqeZ6YafVs2BO8yGBKH+SuQEp1Dwoojo4TsHYZMAC5GHuD1Olp0dg9YGv5MRCrwgjgXK1vK/pTrInIvPDqkSAj1COGEKQ1qFKkdiKOZJuQTc5pHGwjKiTEhMxxdT3AA875SxPLJT1dM14TySwSExDaBlhJioV4Q+Q5RBsI9pRCgzO//I/HL37etNs03C9Qk5iZNJSTXFCu

QaVqgvZp7rAGKCwJP2TKEdrKdYYJ6LlWBLRq0SLWsB52XMWPLfKOMAxQHNrvYYJ6+UIuH4vSAgY0UxzSWliJoIDY6e4VGyIM8UTYAXUTlKU07tCD/RlinQ1gAA5FXyThx3Q+XCkcItgL8+ZAp7ZbT02y7WRIwDjSyNfhGwKmyGILXDI60KAiFezjI3H5iNROyivQfRkDEDF2sIefChyRIgdEJU3nMbwA3WfViQECIDIcKZlUmi5Asa+Tww8g+Aj4

uX6Yc2H5bc+/ADcnqCEIN4xAkQhQksAjkBCceACKsyKWhTbKfVdwBOOYzSDXdLptazDLyEVvK1QXwAkHXYj/cqO3uO9HYQ7Lx3lPGV4R4tPJBOx6wH40J0WIc1oNO41oGi6J1s/I4rxO+clg3ZmQpOoKBpOjJ3clP1JIEXJ1sZAp26AIp1okEp3YeMp3Gm276VOxDrVOw1S1OhwT1OqPJNO+vItOzwRtO6BGZ2Dp2NutgpHFXp3N7fp0fnB7ZDOn

52zAsZ0ykZqEIw6Z2IGwcJDOppGrsow1NNHGGbMOaxrOsJyiwSA7IIbZ27E3Z2RQfZ2HO6Ygn4NbSnOirIXOyd3KGr77tEODzqisF0jNa6YvO691NPV9RYG752sIX53bKAF1x4IF09tbYlz8MF2ikCF2AKKF3pdWF3iOO53bctzRAIZF2TQVF0P4dF39mWpzYuzPC4u3oT4upU3z8Yl1dI5q7h2KgieyUIgMCul2H7Bl1Qepl2NIqoCsu2tioVTl

18EUSi8u0rgVcAV3904V0yeMV3Qg6ClSuwhmYcIPCPwOV1N2BV0K2yKDiEFV1HEdV1yyTV0GAbV0zMfzyKQC90Gu3+hGuz0m6AFRTmuumQ1iK13uQEfJWs6zIDWeSpg2J13JdB7WbEN10B/WU7KEByKhEcLmtEKHV4Mf10Y7IN3fPXx0j4sN0KnYJ3+UMJ1svTOyRO+N3Ru2J3sihJ3E3ZJ0nnVJ1w7dJ1AIbN3ZO+zG1VfN1yeobyQ7Et1hePaE

oJCPDo/L3Ca/Wt2uwyLINurp1Nu1p2pe2awdujL1dunp11PXt08qhMIDO2Z1bGZ93Du51qju+GGKQid1KGt8iGVOdlzuvbGGQxd2dYdZ2AKTZ2iEDd35k5wSQEPZ1c4Xd3LYfd2bDeChHu0/CXOh7bXO5z7nurbnA4G02xiJ50uQW91vO9LLbKbK5PukZ2vu4D2Au30Ugu792wSX92t5SF342GF13wOF0Xu09lgexgAQexl344DF0o2F7JiiBD14

uqQgoeol3oIdD3kuzD1BCtYI5Q2l1Icel3320y1jWYj1gAUj16Idl1n2Cj3pkQhTUeolj8uzqz0ewuCMeh/jiugICSuhwhsesSiceouU8exgBKu/j0KSwT0yedSJ4csT2zfAYiSe/V1j4GT1BQY11NFBT2OcJT3q4a10sU5SLUKTT2Ou9yDOuvT0BAAz2x5T10metcgI4Wknbm/tXPM+7H86ufV2G0BqBlHTWXG5y3tABhbr6lgClYCAB74Z4AZr

RXVHUtFomMVo4tWl81PcMK22QBOjvmxHIioS8woo05bkzAx2m60a3m6oC2mOhJapWwgbpWuyWrgEJqcWyLX9beCyfeBx3E2uxHFW2Y0uOwS42LAOlhAYmSRAaU3qNA6lh69GnVY7zBZgNR2BG4UblMISRn6ki3wa832SYC8wKSai0o2u31RGgC39GqE256sx2sW1YX/cBYDZWsumzY3Gm2XURpLWoP0rWmvXk2y3zrieowciL21T8IMzLiYXAXyN

m3j4NnVCaTPDAAKkAT+0gBzAb/nnTFoRtCFuBd+5IQ9+pFh9+hUyuQQf2Z2wigj+sxxj+yf0T+/BWmbVKSd+3ozL+5IRIOgf2xaVnrv2rf1qEUf25Cvf1T+7/lXIph5VS+D41StTXxK2w253OX2MjBX1OW/xjtAWZYB0zAAjAdsBQAXD4s4RNmJ+tGjZBI32oCYbaME+xhOa7/j/G6aWe89zXe8/R1JvP3lGOs9UmO8v0u+po7CEhfTAjA6XvLKP

n7RBATpwaY3B+1a3t+jKDutNslBQLzpfiF4SlOwqHc/T/BPCdeDcgQ9k+EevGuipdLGKMFhPCLYA0QlP7AuoV6P+fqws4GJQFAAACTX0K/EYgfohUk1Ut+AFnQ4hCbYHrFsIyXvdwEXFcgshtYD4gcc9MbvbOkQH6JfituwcrF3asbtSIrkG4DJgeXSt2CTIvQj8VJTuFAjuP/KXSjgQqruE9aXIPguXDlYjJujd4hHLSjLHCePUAi4GnUqdRqiW

QyODWY+FF35jbUEDg2WtsbdOSM1uGQQ1aBVkTgirE1ck1+TCki4Q8O8d+WSeELwltwRqmCD3SM/AkbqCg68EcB102QQ9uAqhpAFBFokMdsCzw8MjAYs4zAa4DHClLdHAa2M6XBSAPAb4D5iAEDIrE6ywgdeFKQBUDEgcOuQUELgUARkDUewUDSgdEDJgYcEagcCMmgcbI8uB0D4WT0D3xAMDiUAcDHCiCdZgZhOFgafgVgdi9JLrsD9aHODPAalU

A+VcDDQadwaTQ8DTdO8DYBD8Du4QCDBgCCD5XWM06SjCDXoAiDHrCiDAtyODKUPQQCQeRVPApSDUwYYu6QZACw2CyDLkByDgL0CE+QcXSP8iKDft0VuwHreF5QdeEVQflYhyOCIdQbcDLuCkmzQZcgrQfaDb5ws9mIh6DAkJYDZIfYDAMM4DAHFGDvAaM5Ewb44KIddwMwZrIcwacDe3qkDKwaciawcUDc6E2DqgcMtewe0DmHF0DNTv0D7QEMD5

wbYDlwe6dRxxuDDgM+D+geemsTrGauwGeDTgaOO7wfcDDgk8DbHF+Dvgd8g/gY0iQIfYDkSLBDIAHCDCCChDQUGiDKP1iDuyM6cDSHiFX9MPgqQdRDeDgyDGIchq2IcK97xlBMBQYJDj7B+5bbtKD/lDJDlQfYDNQYIIITvqDjQfpDbxCZD9oo6DvapjmKmoJhM+s/9Mvu/9i3QUOGHwp2EKwDpboF7As4DdAuKHwArb36lLmJT8IhJ7erVphRGu

q3VsjDN9MqLbuefqvM80pt9S0p0RJfsYt6owmthAdHuaVpV5Hvsnujurk2U9wGSUDwr1Q60xN6mzWtx70pZm9xtA9EnOA1n2JkUAHkAYQHZ5jVqYwjRpT9IVqxaXRxXAuQUJpXKAQ1yeonDaesppPRtYl4sNiNi4aze5jvLZ3mE9m1jpV23cBdy8+hoDrfrJtoftxkJL0J5qzxqJjX0TUTSFIdqoGdtC9plFbjyweyEYeYazzQjhLqicttqwjq9t

JFomsCGSEa9+KEfYQWz3QjpEeNEZDont3dqetpUhf9lhtiVe5qp5B5rEd8vuPNivv8YjKHok2KAoAMjvOA7o2RmVRq2SifqpgIQAHDYOUjeEWxoGSl1QDu6rc12bOBNhfuwDJ6twDGGvwDzFor9rvtAjDBhZCv+oz43cAvu7zlgjpNsklBwtxNKUAEo1mRO+dOzsDOnBHYQol/KD8g74sJFUgDTsigELC++n5WS9U1ErIWz1D+HBuum8HJHykJII

6S8E35npCdNd8grSIIk1+IUY3kmBDDxqTxue10x04LGHLwlTqVxtFNBwT2EopvXtiMAiFyhgv3zwHiD6UGXGY1slqkmELEAAEETR5X4QKgDKNnB9BCwiM155RlyBtR8f0xQDqPygKO1OR4lh2u1yNhibk4eR2jmtwbyNaKPyNQAAKO6cYKOFR0KO43CKNehKKNSTGKOT4OKM24sXDhpBs3JRz4W4LNKMbfdaOZRgVhD4656A4fqP24AqNjEIqPSU

rVilR+Sh9RmzTVRqqG1RwbU1kHViNRySa6cQaMjRrqNGBpZC9R3Yn9RwaM9CUGNLrZyOTR+PBuRmaOQsOaMtwBaPNqXyODwfyNHFIKOE86jZXRmt1hRpRCs/SKN07aKOAVfaOTkm6DxRo6NJRvAgpR86O6cS6PPR3eRZR26PcvXKPNRt4hPRorAvRkqNByD6NQxr6PUxnr6AUTymiKBqOE6tSatR9qMxQTqOEx8GPNwSGMVR7mMwx4aPyx0aM86i

sPv+qsM2GmsOjg8R3fW/LFo0AXIbQFgBugaHDU1MmL3ms3px0QvWwB6G3Y0E33ogTIo6678MG613qkzM5ao2wx1i7OcPQyhcNYslK1EBt32rhyAHwxF9C1+igPdwAOBkDAq3AGlv12Rw8PoAggnxrByT0SS4D0AOYD0AM0DEAUvp3hkLX6GR8NtWrFo4+fsNvh7P1jhr8OW+/P0S8nSNPUvSP+x4x3y8rLYhx5cMF6mGQLSMgOybHpWBY8YIioRa

17h/i1Ym+gP2QQu0C21uCQG/yC0GtESYEDX724RewVfe3AcLc6Z2QCeNMANeQL+q+3ciOePDO9b6hUdxQ0/FePa/DePF27eMx2wUR7xsZyLxo+PggN4gcLZ/0vWwdX1C4dWnG0dVGxxQ4nhgGgB07FDYATgD+0f2jtATFCIreP2JlRP3GpROiKRuXRipOFHTuBR60Ax0A5+qYWexhuOoatG0O+l/UfzICMLvUOOgR3cZTxSbF1+zJLOwFxiwW/cO

RHFOOrYndB822wPVA9M7iIY4h2sbv4U/SKDj/SQC2BkoEMJuyCbx5hNsFFr6QELKpFCO5iW4OKgL+yiguQQAAmRBghEgAv7N4+jgXcMthkVGImeEyrgpEzInM7OvG1Ey7gFoIop/haQBvWu5xKY6mKHHA2D8cFJNOxSTIfHCSYP2FNRK1GMQFtAYnhcCIg01O0gzE0fSl8Fomt414njisXafE6om15LKCMVPom6si4nT4HP9ZgR4m0EAEm9ExP6X

iR04RQc1FHmG3I3WbvBm4FX9icD6q8OZDs3HLJVDXX6HjiKR0/Q5vHmOBVqusPlAehMfSTOj8YtcOEnNIpF7RCG7tFALU7jiPoGSkwEnGE8XaHOJuxo8FHbaEw8H6E32dOk5IA+E8PDWEwWdN45wmvUSKdfEyMmY3QImgEEImLAJJxRE7ImvE+jhpExgA1k/InOFEomNE3Im1E5smVExImdE3onOgIYnAaiPl3lIkm0EBYmrYbuprE/8pJWHYnYk

04mHA8UhqAOEnhnZEnBSJ4nCk+Im/E+0nCkx0mgk2cmp/c4mPk64mIk+qQok7MnXk3VlcqWYnRwskmzuakmakOkmzRVknNlTknihHkm6fcMmik7MnSk2rT6WP5BKk5jgT2jUnPk4YB6kwiBC3bzIkDl4m2k4Cm/E4UnukwRzrVU2L+kxmlBkyHkvE6MnPhOMn2E1Mm30dwneE/MmAQYInUanGqsTFsnNExImjk9sntE6FRM5Comdk4qn5U8qndE+

Xh9Excm9oyYnmsEinrppYniZI8nouC8mdU1SALk2Em3E7AAYU78nok/8n/E0CmWU4Em1gcEnOgKEnIU18nEk7CmYk5anwU69HVvnamkk/WxUU6fF0U2NgBiHWqgzWr80SLknpPX1qCU4rSOk2swSUxUnSdZSmbU7DyGkwyn3dsMnmU2vIOkz4n2U2SwpnNZs7XlPrKw8ca346hKP4wJHHLZTCFgPRJiZPgAUoAlIIAPgBFZjr6ABoxBTVjn5N1W6

4ZvN1a65khrPY40MHqTOH5Fvt5MExjarJUMbQ40PMJ7qzT/uOxM+4KE0AeCajCrUnHnHVJK04yeHlGBkM0YPgBw6DQAmgMRKwE9dwqYCyynnARaHuDe44NditCfDrqx0wX6febpG/zc3G8A63GGjtkStUa7pMBNIDvfTla+4BUxHQLxbA/Vljd0w5GNrTFIDfPggAPoWKDIm8B8smT7NlfbFFcS+8AJUqFh8ChnjQiJ6HDgQrLfJhnEM9hnH4Cwg

8MwQkCM+KsnfFWndYzWnbLe/H7LV9av4ybHlDnJKN5lnEbojbGZIzNJr02Bq0/BbV0GsilK46xsR07ESnuj+GvNW3MRrY0qxrUHGFeUuHbwQBm+gEmAA4NHGndX3BeZlqAE4446d0wJaEI2v4N/AgF3/H4hxCAWk/IAp5cOeQFsPFxzwnnWhW1efBscGZ6BIhBF/uS/5jM4gFMM+Zm1AJZnFWpq7bM9hn7M0aqnM0EL/uUUn3M7+94Al5n4M2Znd

0L5m0PNZneIIFnFQsFnHM38IXM/V03M3LjWiOL7X/f6zXrTZbeI6I77DckqWhf/75AAtIzw29BcUAJrOUd4a+M2RKDwO4UgjcwTxM6EamJeEawCUX7Zwy3HAI8HHjI3gmOkiyhEpmYiiEzHGE6KFqh45VsnHQZm902VaTYwAIA6WjARgLihiMNDgWANih3srxmIYPxnlHS1msWlkEhJIgHeMJ1ayLSEaDJWEaBrffrQTXRbZMxCbHfWX6jI0pnjE

SpnbQOD0Nw33GL7sJJOJrZHoMz5LfwdrCzgo5o74JcFrghXDgc680wc1gs9gq+9DgsXgrgpZadYw4SP/frGQZitSG0xI68NnMAS7gHTVQJigmgPvcUoEiAP/lIi9s3CENeRo6hIDygzs/RBtHawDdHdpH3043HP07o8+s076CA8BHK/T40WUKgTMiuNnNM+umJ6lunE41Bm5szBn1WUg9m4DWAqACGRb8AybOkJwBNCN2F0EOlnuLARm7pqqR8hE

pFq4HszHru+AErvVp/lDXAJ7J7IuijZoTUxdytVZUBqMmvxYiJKZuiXfb0s5yqmAJYBMsz07x2uFAACCKBF4OERnyDfsnAAFkvAA0hflBBQPEAR4/PFHaizYJRZc0dB5c+uxFc8rnPcEsg1cw/5AQ8TgeMgKVlzbrmQoPrnCAIbnA2Mbm6PbgENA5VHW4ZcLElPK8rSDbndtRhTJyLuzmKf5Rnc4wgrAO7nd8J7n+oN7mcoH7nRqLftQoNVgQ8z7

Iw89sy74tJ4tzb+9o8zLnOkNMBnTT1Slc49hk883BU8wCHXQxnmtcxmahQXrn7hfnnJrkbm8zcXmzc2XnLc1XnZkDXm0dXXnDsA3mSWHOhm867m286FQO81AAu877nZHAHn4g8HniWEPm1lAMhCPGPmywwTpn41fiis+9amM59bP4w2GTw9vd0UOXBIBNgB2gKoB2gAXGe06jNyc4LQXGB5jcWtxMddRzEuYuOnzgI9EW5j1mfNQxbA46/qBsy9n

vqePc3s4eAcfMBniEy+guyj2VdwzNn9M6PGEI41s5gPw8JdbsBeAL2BdgNnBAcb6hEBJvQmDBCjmUKEB46ZuB3w9nRPw2TQcC7dF648zn0E37G2c9+n+s4pmucyZHhs+zNt3hpnNwze4GC7aA/s+LmAc9tMHYl7FCmpbEBFBvBK7Iiq21ern087hnJQHbFDrSOhHYs7F8oNYXErvwk7C/hnHCxRnnC1gtzC8gBvYlYXDADYWfCyFmqM/4W1AHhmX

CyTzOI4cbq0zxGQC3WnmM+AXd/unGvXshb6ACwB/aJebESYIWI9aXFLas85Y41EAuWX8bZC+gGtI35M0E4/rejQHHs9Qpm244NmO430F7JHo0e4/qi/YEyEqBkTiA/c36xc2wX5s646jTb4Xoi6vmlRVqwayMuw6VIZbdtEvBJQO8xh84RGGkGPm9DaT8E9s7JWyT+zRwowbkbDDzuENXmTAM/QevsT8HGVHml80irJi9kmZWjMXtir/p5i+oHFi

3hmVi9/mimusWOWF3IU3bJ9d9jsXZHPdyGDQoa0M1nnT86cXI8JtZ88btciM1LmJiw4Wpi/cWAOI8XV+M8XAjK8XlixXhVi58Wj4BsWsAlsX/iyZS9i8CX4DaCXji+CXT2OcWC/pcXtY3RmUc3rGTjWkWwC5jnjYyvq5gHW8A6evA8gMRhiZPQAmgMViGs7tmms2jQs+K1m9JcgmkWaO9Ojd+amJUQX6LU0X5M2QWNC7gn2i9oWRS2uBPs0RrTGG

uAA4C7ljCyMWJc/umTY1h8mefwBzgOvBVAJtgiiwdF1Yuyz7QDTnH0+KXq4/CzOs9dmaLVOn5S+zmnszgmhASNjHZqnQMWvH0104xB0fDITmCzA9ZswaXTCw3TuPCEAUUs/E74o7mm8zcXbTZ3Aw5E+84yxOgEy4R4kyzfmUy1Sa0y/EXYSzlLMy3Whsywddr8z1B0s6mXR/vEWfWQI7qpfSWGM8VnQC/xHf/YJGKs3MB9/lGy98GaAmgHLiewNa

WMku5iFEdTmvCjLp1I3Cyai0Ca6i0oWGi/+GLweoXWixQW/SypmhttnA6CzHHpWRvQb3PqWDw2PGQAH/EgOOYBQiNLqh4IEosAJFARtUAdSOP1AcABgA8tYNZUMwcXq4A9gzqLSw0YBAA8gO2AXfkU5vAEDYBfjlwYoEPw9mGnbg5B/YiAH8AthGjB6APoBAvJ1dzjvflerAawgENigpcNighbOiUiiLJxuED1AkGctzQ9htAYkNB7F8/CW081MX

Zme+Bf2Iax8Hq+UobiT04y7Vh+PEeX586eWrqheXMAFeXftblVby04BjoI+W9FM+WFDdip3y65BPy9+Xfyw8Aq4EQRwEFsIQK+KaG8uBX+bJBX5ANBXYK0qheZKfAqAPHmrrJtY0KwkAMK6CA+cNhWVsnhWjK/VAxEERXGoyrmU8zcWES9knKK4QBqK3lxaK7+wzblfr6uZdb76ixWTy3Ogzy7fJLy896by5Ig7y/xXRKLgRawGRYXyyJXx2B+Wv

yz+WBbP+W1yD7C5K+agFK7yQdAMpWoKwpj1K/BXOVYhWdKyhXGAPpXiq5hXjK3YRTK0sHzK4i7MocRXRQaRWoi/ZXsU45W6KzRWqHm5WKroxXieVcj2EYI7uI8I6ElfPrSs8LrG09jmsAdAWRUJgBzgBQBHRUtFbY3xmkyoJBVHTjTh0sUqJUSOHxC+YcATYxLptm6XZJG71CCx+nyyitKSC80WlS8uXNC4umb1YmAtwFmAtQHoWvs8nxR9CDTyE

yPH1NqHBRi9jmpwdAXVAMRg98KgBVQMgAD8EUWPpYANo6WXHBJGKj6jW857S1tW0A5pGZy71MsAyzmME3JnHs0lbyC5dXVSzznzRmpnuiwJKUfJxhvMOvQ9y5EcPq4aWg8g3r7y7JbAAECkLkAoSObSaBdNcg9f3JyzAkTprHoH+5QCEAAAKS81vmv817muAAHlIBayLXRa2LWha+LWBa8LWxa0AhxKwlXjjnTWMqx/Yqy0lWZK83A6a4JAiLnTX

LgEAh5K0FBN8orXqAJlWl8CpWwgRrXxMQbXSRbLXcqwMQB8nTWtK0hWTa38AXAXTXmUFrXXcGEBUK+hWyq0FBFazhWgbPhX6Stac6a9Wh3axxjGAClADOScc6a0WCXIHTWQ4O7WOsa4XrrdTX+CHTWGa0dUmayi7Wa+OEOa6L7WiDzXJa9LXJayXX+a8XWS6+XWBa7LX4qy78FazPhja/OypKwBWfYXHXXcBCKOztrXda2lX9a3bX66xBXnay7XX

cBbXe65EBra3BXba7dh7awVWhRenYB6+7W3ax3WPa17WDKz7XW6xVXcK1VWKECmRg61iHdAXTXw65HX92dHXY663WE64vWk615XAhk3xU6xmR063fFGa40Dma85n86+zXaFFzXGABXXS61/Xea5XXxa7/W+a9XWJK8fWlay0im68lX2EBrX26zvWda4wA9a3XWQG07XcIYPWHJPPWx6xpXLaw7WdK7PWkG/PXsMTycNa57Xiq97WjK77WusJVW5T

VvXkEDvXQ64vWD61HW667HX461A3eTnTWL6+utfmjEqjjSkWlqUyW2yxOM//djnqYc2Gg6FsAKAGAAkQJCFL0wtWDosTAmNljMIeg6WEE2JmLs3zDGc7OXka8oX7fWjWsE02th7n+ngtTaAN6HdXNS9IJcLRtIbQKTWK3uTXoy0oSPQK7hhJCFngCLWQoefHCW4CHB/ql9Uc6yV0lkBr5jXeU9TEFHa7G/7BHG5hyXG6Fc3G8vzvI543Ms5MpDfl

f7Twi6bPIKyHMgEE2HG45mnGz5lsOa433G4RU/yvhSYm+ghfG6Dga2AE28s1xGuGwNWv/YbGWS6xm2S8IiA6f7RUALsx3Le2A4/Srwn1ojQQy4gICxt9KU6G+bnSyUdPzfKiZS8iyjqyoXQNmoWOc89msa8pmlaIY3s+IxAIIz76A4EA9VI69XIy+9WELWes5gO8iA6cgB/aNDgUoJIA3oPtxq7jtmr/gdEem9BBmDAht5GE6XEbUM29HTMKxm1o

2Hszo28UeKzGaR0W/bRqA4bQLnNw9rwccRBmhiyTjo1tY2xlYDmNWSEBd6vTibi9GJMsxmXQgBOhocHC3n65FnL62AxYy0i260Ci221fC2X60rxbCb6z8s+TzCs6/HGM7w3hqw5asc2qs5gKyjoCyTm+FCMB/aAUAL068bkVqgXrQGBHePOyzMJni0+3k1jKldtWhULXHJw26X6i3+H0NWxKpmz6WCUauW5mzUIBIHkELI7BZA4I84F9FMN1m6wX

Nm4Zm3HgwA2wkTqKGJJzcSoCx6QL/B9W9BTcI1j0LW5zV1OBybNiqa3bbDoAXyq1SsFsRgbW4a3TWwNyHW72wzW86208K62naZpMJfUI7pfejmQ2TU2ICybGLMQHTIBAUARgPIAMLXebuw503Fq55JVZrf8nQPX102T28WaeKjmAfDWldMii8C1LzIjV90TqwqX0a+NbMayqWh9EumVMymAxfJTn/m19mMlgjFpsxGXtW2TWtm+nHCsXs2gbi0Bx

jG6BrgmTm7eXdw9aDtJrmxCibQNm3XuDO282+rrEbanSmcxo35y1K2AIzK2a276WciXblDG5nAMBGumTurHQibSC35CfrFwW1+rYMyOaTCK7h4ALaiT68ccxTTe2lccOiGBZ2R9FABCI1NBjTkHPLegbIAP21+2awDFz7cFedTAdCCQOf+3ZZYB2uUdZ4gk0xda5WiNvyLe372w+2B8k+2GiC+2a8gvz321B2LsN+3TKnwqmgZB3P23h2gO/5AQO

7WdaLucBwOzh2SO4XB8O0uL3U/B3iy9e2GiLtMUO6h2IOkh3MOz5BsO8R3oOz+3RZUR3+AAB3SOzB23iKB2rgTR3+O2J3TkIx30nfB32GyxddMaG23rTw3NNVS2WM8YVscx9jf4yGAlJdnx/aNbywbRTFOW1BAlq030fjbTm8WhKXqlW+nV25K39I9K3vS1u25Wzu3/S+UwfMGvRD22q38NZY2athe2fdbiamDrfs50HLXSsL+1oRBDYaEalxZO2

PC2dZ6cik7UGoSu5AbE5KxB4ACz2oF18PTrWcFOA20M4ZBxou3YyLSG9CMoZ9CEiNR2XoJKZNGST8AWcYpkug20W2gdZ3AH2b1Qol3Ngt4Ak5NSr/0F1VAJMyUBEOkJ2Kz8Z0nQgwq4P62obLyQJMuqRi5Ma2ObmCwpsvqVaiZz6PQpOIpRMgax8YMY6tfIb4DSJywWJWEXiolobSg8UfI80VWoG7KStRtBKtLSwO2q1EZ3S0iWCFZzTXhRT5KQ6

rPAJlkb/NpV6ahR0COpPZHIHwdh4M/R/IEVxZK1HaQu4HmwuzXXIu9hcXHDF2NWHF3Du8gh2u0572oGl34gBl2/EG8oO/jl2Xjnl3W3SPxCuzD3iuyj30oVLhMoUGkvoQIhKu0kADbgV86uxrcKOpm0Zys13Azdkmke8XhOu14Buu0zU+u/aUBu/5WOKyN3kOGN2LW6g59lI1GZu/kmx9mURT0ot3tWMt2gEKt31Qut2UHkTrtuyQddu8Dh9u5jG

2OHR7GSid3+St6Bzu7GQru/2Fxwnd3jYQ93WKk93lu1WRAbO92ZRO1Vvuyawiu/92BEID2txDUTOU1dawe6yLwu1D3fu2oRYu/R2yOwj3MLkl3cw95wgpdFx0e1l2se5hdce+l14fi72Su0xDSe+V2VZFT3quzVcgoHT3nXY12NKuXYWu7Gmw+x13C5Jz3UUr125+P13hxEN3Ly8LhxCML2XyqL2ihHJqJe3T6pe3GnM8LL23SUKCFe5KIle30pa

TFt2Xyxr2j2U+JWSod3Tys9Ztewb3o8EQzMoSb3bybd2NkQs752Zb2mqtb3tkOM87e+RkPuwuU9EAV0k+4T3XexO0PeyD2ym0kX6M9w3Hsa2XNOxkXw2SbHn8QHTIgO2ANoFUAG3pQSpG7tmkyug05EdBrLeqRbs6EK3C27n7RW1JmhrXdnGi16WMa8qXt2/+mFW93A/5puXNM2Cl6eMC3h4xs3u27q3rWy+VbW1tcxXh4hxu4G2EO8AIPW8zV8B

/sQ0EEQPViG62yB3VqKB9iQqBxa3iB1cjg2yS2B1UAXyWy2XKWz/7+Gx2Wm00QS9m0iBeBoslYwIKWLm7noJ4siksZraBUVri0s2wu3GAQW2NI0W3ZpeLy9qxQ17Dh6X//hW3oB9W3YB252YNjtKPO3IJFmw9WtS/6MwsNnBdM5BnQWzq3Pq7S2vCdAWzSSMA1DqgAZ1SDWBURxgZ2+Cj4mHf8vjerqUQtRtFB+o6l22o2ka882Ua+M2xYYuXN2w

YP9G4kbGQIHAtwI7yVW70XE+PrRKUf53z2weX0O7/R2O5x3N8nkPEcDx3VAYJlf27HXVAaoApmd8cgk23ylJUh37cIiTU0g7EvAN6Bih10oah4wB5O0kDVAJCB1IG8QGhyYRZZf0PvQG8dCh7oCZ/UKtih8h2Jh7dgZh6UPZzuUOhO5mCqh10OW4HUO7+UMOGiE0O3oC0PqsO0PvyJ0OfkD0PcgX0OMfRvKPIMUORhxcPxh3MPrTgf7Rkcc4kOwU

O5hwsO72yQLEcMsPCO6sPZztUOfkBsP3U/UOZh7sP9h20OYAB0P/hzWBThycdzhwMP7cNsObFABDRhzAA7h/cOeTk/7+lhw2VO/1Ww25w8Mc+2XHLdjnNqVGz14CwAetOgyuw6O3y6mMBwa1Z3xhcAOVB+ojUE3OXHO1+mDIz+m9G19T5WxpBymBb1iYGunZG8CMT2xgOu21Y3ch34hKSu5d8hDMOMObZE7vg/gENHHgG2tLdwrl0UHYZl3me613

Ee7l2K+548W0Agw2blh6pe+tkyDWkgXgNMxRSGFDnu0W0JRIUJ1QsngdAGdRl5NzhSmvHDGSp+K7/emGKnqTqjRy+EkfSSYZmEb2F+/g9aWB5p4KCiS/R56be8+D3JbPiqFlVzUUdrOgulGAACpADzVAGABD0AVThlB5AwAKsFwugz3aOBmP8x9W7EOjm0i5TxCIOjEJQqv869FcWOBmgapbnRnZtyj6lBnQxcxo5KOzSj4RER4bbkPD/BSHoqOI

vsqOe4KqP7rqAiYoJqPfAEX3We7qPiUvqPaouIQ/R0ndKiKek3KxaPKyyLKe+5KYVqPaO7ijLn27C6Obmu6PvKIyKUFB9ZvRz89fRwndfSQGOKMmSBgx5d3QxzKo5sBGOA0lGO2zXIhQu3GPXu4mOnVcmOMx2mPFrJmOp0NmPCKPWOCxw20ix3mOGxyn8oEXzgKxzH3NcZ7h3geBPqna7KSXS2Pt2u6lBssk20Rp2PaOOYgex/FA+x0iQzPoOPZK

Az3Rx7VB1R2nCJx34gtR8X3PTlz3eu4aPrx8aOdrpDs1xxXJFENaPqFLaPFe3uPUagePW4K6PkzsePbSp6Od/YkhbPbGarx68wbxxCS7x3P2Lu4v3wx8sw3x2xPuhx+O384BkXVfRZqdX+OFcABPcVbmOsxzA4yVahOoe1BOSx4l7yx8TZEJzWPkJ3WPoJ6q0xVE2PxHJhPWcWV6tfk7Teq42W+dWp2b+zwO6wzw8H+2yXYae1Kj7mgANABkIhy8

5M8XPSPsVpOWk9VmzEa8bN09cNaoB5M2XO/EPuR+52VM9f8MZoKOE6noZshxzlAu3Xqr27sbaosPBvUPRyrWeln8W+FmVZInn+sKwpxuyope8F63f6KER5OOIh+2XhV5ruwhf2C8WdsFmQdAHXBs8+k3NrOcxJgB2hloHgU02AhgwCIARRSGsoQ9rsVTkO2gsyPSo7iPx5qp5VQ6pxGmoi01O2a/V0Wp+sBWK/fIOp6JQup762Bub1O3mP1P5JYN

P9SZGmFi2NOpZLipUnoarpp4Q5Zp2mYFp5GQSJCtPjoGtPqABtPb4FtPTx5VG9p7+8Dpytgjpw1PUW2FmzpwkRWp5AxPcDdPCFHdONOD1O50H1P54C9OVx29P5KKNOXTV9PJpzrm/p1O1H4HNP+QNRlOPctO4EKtOjx5DOEgNDPPxd3I4ZyTy/J2/6my9f2RHbf3eB1Mso22yX/adAWHMVABiZG9A08G9LkC+sszO71wJvMb6LqV0qX02T4D1T3c

y28QXK2+82BCdZLYTfW2EB10c56GkOV6MHAdFmBGypyEEKp3kbjwybHfmQHS2QMTIiAJEBcAYc2ii9Vj1YqIX4mGrz6Yq1Mq4xrP91SyOHO5lOFy6jily7+m8p/APeRx28CNS22LB1ITs+IoibZ/ME7Zziaqp+VEzLQFwrsZQh9p9nOByA1XDsTtj4Z4XPZ7MQw853ayn48jmAp8AX1O0NWRZ/WHMiyeHqWXJLIgNoE7IDoBeUV/2r/t7OSA2ztT

huhM3nMq2whxgGnmyhq12052N2zlOLq7W3Xswq3Fm6Bm10+BZ1Yh22FsWe3ypweXo8yXPqkAFFKADR7EEMz7VEB6xFaQ96ji7ap4HNSTWk5hxWFADpZ++a3cB7dOm1PdPf6D8dv2HRXUuHqKAOADHCddlwiq3hXE7psUJQ0l9g3TSQQF67KMRY/A0HLtpzLR4RyDRUp6WJaz4fgRZyug1Xf2PApagGRoWKOzHRcTlH7oz628Z6YRNrPJxcHvpaDl

Mhw+XXDzSLKfP952SXL5ybXFZDfP75PfOwKtjPJLS/OiF/ZoP5ylwNWN/P0uL/OttZKAAF0sGgF4qGU/mAvEkBAvvfi6zEGTtodsMCqSzQgu0dEguJ8e/40F9uQMF1d3z0jgubo3gvKPAQujW/2giq6QuJ8+Qu77eIQqF4p6T55hwz5/2YL59Aor50wuagB6w752cWH5+wuyg91O/FMWwPqn+x+F6kpMuKBxCHIAutWMAv5g+uUZJ8oGtg2Ig4Gn

IuCFAovtLVWrlF/gpVAMgvIOKgv75CAQhQdovHiEcpcF1y98F7zIjFzVgSF28xaSzubcR4FOhZ8FP87g/jMJds3I2dAXhAqVgtgJcAiICCyU21emmsy4EqJW5N+mw82rs0ZKbht1mXm8X69By0Xo5xKzvm6u8RICY3LI+23lZ2nOtBBnP1rdJKTY4zzoCxCPzgHkARgMgBsUMQDe59nQkyr0vskmuAe3gMr7m8K3JS+APbszJmspxyOo51yPpl9o

XeGkpHzZyj4/5kmBy9U37RR8MX7BxTWxi3+8XCkSkCW4i3/tpzWzp1gssWxCuwVxVLACy8zKmwbGnkZG2W5ybHjedAWaAGaBIK6gAlsMgtqR8zt7uGdTWDDIDHNQnqVGzo7x5yu3Ih5o3xl9lOYB3PO4BwY3bQBmB5YivP6eEIpll/zxVl0eHJc4gBsUHuFox5+PA8/V3gDpxoHWuF5gXTd2ieqVhwvMqpQquGx0hGiJFrL7jH4BfJ18A600RLuL

VOqVhqx1e0RqDhoozcuAX/IKvtJ8wdRVxeVxV0G10cFKu6usOI5VwDVFV7quthJ3i/cequJSJqv0cH06dV3quUlAavVrJnhZV7hOQAAKuyAkKudJxavTdlavJVz21pV1ZTZV7h4FV6RwlVy6vVV+qxd7BquAWV6uivRHZdVwDV/V2sojV//nSeewPJfbVLFqUFONO03PQpw0v04+0KA6QUBVQPgBCMFb75q9/2U/Oump2/Exg4InRAB/tFjGjrri

29RaFpVoOdZ84dZefrPMbYbPzHcbO45782QZInPTG7QXN6IwYuV7pAeV6nGFs2yXsJdAW7IJEA5WAUB6AJ15PB31s+WtkkQmqqsZdBLplB1OWEa7cvaLfcuI5xiynl5x8Y58yvswGHV8azY6dtoeABkmuuHaBuvqE3gwZh89NH29x3h0RzIE17kDIN2iI0mjBukgZButMSQOQNxx2uO8+2IN1MooNycd4N3BvMN7BvsN5hukNyx2UNycd3h1O1CN

whu8N7UYcNwRuo5VBvbXsp3+1XpjrLVwPUi1WuQp/UuzMbS3ZJdAWOtkjkqcSfI4p3ocuQjkdEQtTnLLklP6c5Rbl2+o2aV1PP2R852GV1Muvm9oXRBFTBETclMQMxqB9DMxARRywX/l1gOHB84ir8p7mXy/Dc7OeFmJCnuE6KXjYihH8VanXG1piMsHoyAGQ5KA20UNLKvoXWvs0nEBEbyDZArhFWO6J2CS81zRQ4qpdYgEEGvAxf7IfALDzV8P

WhacIYQbNDTbTPaAhUFJsr/iCpljuf9zieedMPmN10SSy0yu4RZu0Z1ZuyAjZueIgYB7N+IhHN8thnN7VBXNwz2PNz0JxCjjgHsL5vWoP5vy2r8JMux5uYhCirD8RFuFWsg9ot9im4t3ThD8CziVsMluRfcRR0uRlvNmLHizp8TyWO3lvTNyCWit1luSt96LrN20T1NFVv05NMjat9IGGt+5vZlJ5vx4TkQeiO1ubkAFu6ez1uzt31uZfgNvGAJF

vht4QhRt+1Zxt4lvbSdNvdiLNuD4PNuHQ5Piltxf2+qxU28R48iCR3wPRq7S22pc0v6AMTJiZNihi+iC4/LYrOX0Mztk+PuZz1y7GzLrZ24iSij0ACnpkck6s5S/dnTq4qXsE652Ehzbq9RjdXGDFuBENh8vTGLIioLSLm9MwZvxR+wXtm3dKA6RQA3oBQYysQtA8lec3s6EajpUWf07QNRtlWxbVG+vjSs/co2pN6lP719oOHl4pv9B4yvDB++u

pvCmA1096gRUGPp/1xkbchy8PvBqbvf3iBvQd/5Pt1g5tql4NXZfRxvHDZ2X0lVGz1GjqsFoG/jxB4KiXGJLup6qJvu17juIsAM2713gXkRPrrfY682Kd1W3Jl88vGabOv6d8TAVHXruoAUnwbB6e3SiTkPud+nGp1dAWFoLwBWhJEA2QIcv2WxTEBIPl5MMJLvvMEJIoWXX1w0KJnlERSuGc1SvZN5PO2R6oXHl3EPNdzTukCf7BJ5rtsItTlaN

SwvF156rC3q4ZvAV0k00xwxxqlkKsp97KvCza1F5975OEV9KtAZhDvqecyXCRzS2OC7+qmeXZA09jesZHV7uqYD7v0QBmBsdw0bA99UWQ98Ovv7KgBw92Tu1dzPOlN7HucWfHuGmOUxSxuxM1wCgS0wHpvO25zuAuz22TwwZqA6SGB2WFy5iZD69BC6GtePBXuz91XuZd6NK+JM0bruuSuld9OWVd2Ovyd3rO504MbAtUNmca2vQe19/vhJFjv7H

Vq3AD5nujN6djF9zoFzpnPudAix3GD1bv+Z/ZsZVnbuqmyiut96yXnLXMBxddAX14NIACgEkBdgHpY21wUFbQMztz9/7vIILCEZdEHux57UWGhkTvcACTvVd0+vALbPPlN2/vrqw0weWs95md9jNx/GFgjd6uus9yeH/dQ2vJAIJAiAGaANAMkFRdydKD5n1t1QNLuoWXLvcgj5h0D/jukbZgG5N23uJmx3vtD6/vsbdoXx9P7BzB9II0BOPoFm2

YfAN02zgN9x2zd8+2l1skfl97XObdxwf655WvG547uUlZ2W19dAXiMPwB4krsvcUKDb6wDMZDertnEAXocP17IeKYHYwa4tfuldK+nFC2HPIB5ofS/S/vX1xKyyciwB/VqvRmmC8tv94ygQ4InwR93ISM91vOEI60hNcFyBWg6JDSACkBmj6JDowNnhgJzowZAAmAeE5rhL3KXIwAOgzG0DUB84Kgpjj+YBTj8PpDj4+PLVXCozj+8Bbj4vIEcFU

fNgIb0PAEmhIK3li2Sy4beN3vh/aHH584reGjl+Y9MdyDkqARn4s28alzhtisHuBgeZJO0fxW6yPw5+u3YhyEe+jypuiD5Y7u4GMeHQDZ3Bi38u7B+PubG7ibgXS3AVcdfpzpmSeKT1RGwGNSeU8dfp2G4kWwd8kWkV+G2zjaiuwp3wfCjdAXYfJEAVswtBcALvqzuGehLVYjRoZMztpco0evnDLpN3vjv/MVZGgsUifOj4+vUT5HPO9zof89QMe

hj5vRWaRY9F1xnxp+vaBegOzvbB5vPbZ+Ab5j8jIlj7yBWg5u9uQBsfvAFsfqwrseJjj+Brj6PgLj8cQHj7gAvT1cf3MDcfqj/cfLJKgonj8GfkUNUeYgB8fLVUyiTYzcbd129BGAGjA98CwB14JUeEytdxRBBY2ZLlTBpT1BB7S0YXYT+1nYtgqfAsVgeI93Svgj70esiW+vEhzIIxpeZGDT7BZmUOBYt3vEeDy+5BQDgvI8sojh5AJz8qx/x5O

z2dzl5GQpWoL2f+zwCysFkOeLdn5oez80QJz27UsR8yfrd2S26pRS32N3Uund02mzzXjn+AFqsdLLsAeM1CFRTzUfJD6fvn0DQW8z80fsVq0fJMIifhlxK2UT9PO0T9WfPm7oeMXIMfd20I0KJVEfDTxvQYAzu9wyxvOZjxae5j26fLaDaeVj5YA1jw6fiwE6eLMzsefQHsf3TwGfPT7ul/T86hzj+he9LB6fx2GGeXjyGfHj0GeCLxGe3j1GfuX

DGfvj3wekLdAWNopEB8AAtANoLihJGyXvOm1nA+thgIe3hCeteD29oTyxtZT8WfH7vefOjY+euj2qfn1xqfQj1NbtCxMeRUF+uVdoxBORNqBRSwSf9N0SeudzQfCFT21yTwyerW3jLtLzSesFvSeSlIyelzyvvy18hKuD1DvRZ2iu2S65boC2ABMUJ/B42Z/AnI+xITz502pd64e/d9xfCBLKfszzrrSzxfWOjwEenzwpvn9xrvNT0bP4yp+ePOx

mBtQIQmB93X7rGN3BcJu2ewLwsfUgJBfWg10IbQLBfTIPBffM4hfcAMhfbIKhfx2H6ecLwWgsLyceqryUxAz28fgz9VeiL41eSLx5fyANGevj77q2SxVboC27OkZpcA/NviuQT8UX0QLNAL9+UN0BBaMBW8wT4T4C52sUqeHz8iexL8+f1T+ieazy8ucazShwNUs3B9+EBzl8MlVLwAf1L0AfsB2XBpz9SogEC0sSBxdeRrhHWTNk8OHkObtLr/d

fbXsue2Dyxu1z9wONzw4aCj02nfrQHTfAEQBiZLgB+AJ/BQE6xfMzy7BJT4JJfLzzBq97kFdJXO45r5JhJM6HPQrytfwry+fIr1JeQIzJeRCQCkjD4xA1pIHB0B2pfzT+nODy5yU4yzFRb7TNu0t3NvICG6kvt5Nvh4NNv7cJlmo7dTfkUrTfddClv/t/WQmbwp4Et6zeBEOzevG6eSsFtzfnpr9uSKALetCEAhmbyLey8+LfOb7a8Gyx9fVzxWu

alz9eys3/6m02vMA6fDN/aDQA5gG6AWgGfcul9I3mdnm88z5rqlLkGXg90rp5C9b6CC6Tuxl71n6VzjeMT++fw47yOMZupvv9x0AXYKPp0rw4OOCyr7oC+aW42sRgULWkcRr9Vj4+ibxfL3hr8jlnRmsUyPTgC7f0b63uwr+3v1dzHufb2Eeca1nxRBGNmkrxQH5I5MebEUdfgL2SzTr5pfLfO4WfYiMplc/TJgd2ZB4i7P7m75bE7ABkQ0EZlmi

y4f6m7xYWPC63f+7wvCO760Q6y/0tnaZUvwd5wfkV9Zfm51yfhI+H7oCyGBOAG9B2gLsAkQPsuvZzbesyr5eFpK7AVwDg1S9CjeUE/Z2Mb6qfVrxJf1r2+fi76Zc4LMyhLUkHehIJ+N/93Xf62dQeJ97jIJEtBE7EnQBO4DhnYu/Z0EgPhDt7BNOEgHTYy7JJ7RSN6AqgHogs0qz1WsB0QsPVPengHok7qoWLWeoKcr4F3ehVgA/eEu8TMkKA+4e

+A//mFpP7OnsotJ1cIC7B79P7RdxkH0IgB8Og+ghZg+tgNg+WnLg+B83uQCH1gtiH7YkS1VjgQH2quKH1QAqH1A/aH7A+fBPA+mH0g/Qc6w+mSOw+EiIPff4ox4uRQAE+H6vAIADPeK048zL+wLO2T/iOI2zwfam3wegA9AXiZInxXoOgAkQFQYBBmZ20BNg1z10rlAjtitjzPjuPY9ffc75jf87xFfC7xtfMT8/eRBPkVdr8le8iZxfTT+nv677

/eST1e2HWDwmR84R46twkBCH10Gkn0vgI82k/0y7+8snyk/UyDDz9H9B8BLHSW656xuG5w7vNz39fsc02HoC/wBhumyANAHvhSsI5iRr+29dUQWtNHVETBL5SvlD+lPfw3negjwXfzq1Fe8byXfHnHPog7whZZoGTfjrxTeVlweWisCGBBnv+WoqwoaIq3Tj8Sqvw74BGLLxXk7T9r4Q+VHOMmqgtzxOOBSEKYbhmk7q7dx+a3x2I8x+6eez8cLS

QJYya0yH98Y6kMdhxjrwLqIoQA6o4M8Z4SRR9rK6AVAAC8ibGI+FQzwBvn5S87KM8+/o3MhoKN8YBJ/tiEWGpCgX+PZfKNzI9IrdQhvHAUV5XaOpxPc+bnpxXo4ZAyYGVdr7mMA+z/I/Atn1eFp8DQ+tIQ/BRSPLfioCvidceSxy8Mg8oxd5bCgKNJTKHR73fuko3yx44OiolI2KVrh/QDAoQIlf1/iBNOzoZw/GKK5BiMIeSeoP7RzjvjYKAMuA

NoGHgtoJgAAOlquxyShTrtT1AtX+M4KADEJ0uOxoXlPgOzX1X9HICQcLX9dYdxevgQ2ha/FADq+hT+CAAOuF4VrnJQ5H5ekeOn7JrPMVkhfd66SKP9y6bO9qAS1DZQqw+X2sFHaVn2s+fABs/4DXS+02LqV9nwgRDn01V5yJ5oQwKc/IdlBJJOEq/bn0S+dAA8+fBO8p4X3L26SCLYIXzS+oX9Mcfn+7g/nzC1BtdQjgX8GQwX1bnqXwAFe8NC+j

mU8/dufjg0wki+50Ci+LsWi+UcBi+qoRSSPVDi/vkHi/JSCIqUXxW+SXz79yXyxS9CQ1SPn9lqny+DPNlP6TgbCy+GbwDuwoOy/BOJy+xiNy/DlXZA+X+ntSSIK/PAMK/TnhwlI+4VIJX9QApXz7hGELK+Y899Oy7Jzfr9jc+VXw181Xxq+svNq/dX96+nX2CSxX3oTTX9khs5Ja+Cnja+gF3a+3IA6+q7Phu48FfZ3IG6+QgJ6+9Xz6/0cH6+4H

4G/ebhRkvNxRyvXSlvI30U+xcDG+v8HG/WIsGuk34HcU38ZEXy+m+USzZw9nxeLs32xlc334QMhIW/zn0pO7mKW+qff32t8OEQSX8O/6KS8/bKG8+G3/2/EkIO+W398Q23wC/O32o/QXxoyV0h8+m3zC/EEHxwa32O+t0BO/ZP6i+tkDO+a/lp62zdi+q4Uu+Z8pvh3cGu/5P48xN3+4yKXyGTrtbu+xH/u/BK4e/GXz8WukNsQz3/WQL39rir37

BRAxTy/7388dH37Xhn3/Z1kECK/wEsa+aFCcwf3/8QkiDWx9x3XAy0gS3S32B/4HBB+/4FB+PXzB/9X3B+jXx++TX2U1kP6ipUP3DVbX1V9sP7/BcP3JR8P2F8GY+6/iP7B/fX3K6KP/pkg39R/x4WG/6P2dOo30x/9sbMWb671FeZ+ZfUc4yXdbyNXt92esN6LOZ5ALig9z2jAdAMfukyupuuL6FaLqR4/ArwtfrfaFjEBhofxL1ofXz1jbor+7

6FW+XH0fN/uX1UNK094SfFn9yvgD/liZ6OpY98EG0wgNDgtgGQ9Rd0IWTGBA9XHxIMkwHGXKi+nfbz2t5rvzneMp/4+Rn4E+xn7jfuc6E/1eVjvPv6CkxgFMflWTMb119vPH4BCLRrIQpdt3JTW4PsAhbFmoAq6S+DAujg60OcxMgzdBA3gweqf4Sraf6VpcyQz+SFOcBmfwL3XcGUF2f2tq2xFkHA3swe+fzT+dsHT/ov37YRf2L/huxL/iYFL/

OfzGHqgMpryn59ftb/bvawzU/ys5TDORJD5VQEtAknkwsD7zD/5I3mekwFmUrumge1I5feQZb4+Mf7fesb2tenv9Ou8f1+eNQJ535l82fvFr0AN6GHe/7+4ZwvBM6WoS5xEYeggX5JUBjKrDYsQPfYrnqcqrWQPh2nhGwR3wrgkDjzIlWmjhICFqvewCNI3QJYBaajcSNoHcSSjCuzsWF/thcEsgk/16A5KnfBs//USi5b+xXV5QQoCnN9RiJMJc

mwuSQwJb9huow4vlMgAHCAYBf8MLhBX8Sw+OM8w3PwMRske1l38+WT0176Lm2OCL0cFHs5iPFu+Bsl+3oK5AAuvMxFGZnidcZkR4iBLhpcAi6g3xHYR8uCrUH8yQN/xvSInCXtbc5AQPmN5HxrCnZp6UaK3WeRmgOBYgCycFWDvKEXIHiDAfhWgwOAB7KgArWTfGIiSYAhXirXg8YCPAA0ShKrLfudMMf7yQnH+UVDX4M3+8RDJ/ngQqf5/kCLiV

yiZ/g+ET/45/pMgSn75/vmmhf5L9jfUJf7o4GX+pWAV/lX+SIA1/ilAdf4batfIZBRN/hS8/eat/lNU7f7qvLAyN1jd/mmu55T9/mM6/1QIAaP+8FA6VLogk/7DkKxEs/5I+iHmC/44Vi8+X+Ar/hVqggHr/tqu1bD9ejv+NNT7/rsAh/7H/g5CJ7Jn/pe+YFAXkFf+bVgnsrPke3oP/tbmogEv/l8qOzDv/k5An/5yUN/+ydhlMv/+ohrFQEABr

HjeRmABqxaQAWCwMAFwAVJCHODEYEgBTOAoAUOy9uyEJMGuWAFjurV60VCJ/gQBUyAp/o0Q6f63RuQB8IbuAbn+NAHW2HQBrMhF/sfUTAHFYOX+lf7U4NX+tf5omPX+vAEosPwB6zzpGG3+lAGd/uIBgYSSARPk0gHOtLIBHODyAeP+HsjKATSA0/6P2u5w6gHz/txoWgH4viRO+ACr/kHmBgHerkYB2/7NVHv+PiLmAaNIR/4XboHYLuyB2LYB8

7I6ZI4Bt/4uARIUbgHrAXwuDjhE2Cc8PgFAIF/+FWA//oEBQNTBATxWYQGgAXxw4AHnkL66d2DQAZSwsAH3+MP+CQF5OsgBE2BoASZEFS4htlUuOR463nkepv763nhs2fD0SNgAdOwUAMgAdh7pnsb0uvoSDjD+zTCUAud+uLTNMI3uyepRWuOmQLi66LFaHt66zhMuOP5F3i9+ft43VsaemfiffrD0H96R/gk+6y4r6hxgy0T4APmKmKAZ4Hb+Y

byRoOR8WLRSuLTmZej47pSBnv5DPpj+MQ6+/t7ewT4rCjjWT3jpGp9+qe7GntyBELbbTEPq3eo7Wtvwe1qFuBda50wGgSdaRoHRuKaBA+oYtmG4D+iWgSm4xoHnWraBPVarfgyWtaYbftS2vB7+MLOA9EhEAOvAe+AtAIUAVQCigeQCxqQ7SAxsIm4xrKKM7v52diFefj7e/gE+2N5BPo/e0l7qgemAGAi/ns2eifT+ND9+5N4gXpTeZ16ZAFmYp

9qxiNg6u9b01ApkXsjXyJP+1NZCcKFA1P6J2P/O35KXxtyIZXI2sGWBOYgq2iMAvMgN9nJQHRDHoCpkYFRVwK8YFHjvpGXY6ACigjFADrB0iqmG3+aD3iPieQD14P3S9XzhED4Ag8BjgfW+1cAsaljCVfb2lHXYuzDfGNIo6xRzEIhQPjh7wLF8+4QGjl+KdGhI+gyKT8AA4JOokSIQMtSGX9L0+l04nQYclBhGdZhbGA8Q1aBVgQyw7yooAHxWI

roK/s2Bwi6tgW54PYgdgT+BSIhn2qWYfYEEgAOB+yhwGqd23CCjgSgBOD7zZJOB04FOxHOBfwES3lw+S4Erge8oa4GZipuBKAHbgVOBPxaiKA+B4CAMmEFAJ4HR7OeBd8iXgZQ+v+CVUNmK94HMlI+BjzAR4MZor4HJdmtcnTi62F7299Slgb+BFYEAQQkA1YHAQXWBd9LS/k2BQjgtgeIgO8bmCLBBUTi/gT2BSEFx4IOBaEEPzphBohA8PjhBP

gg0QWa0s4FvivOBEAEEthhwrkDLgauBr7zrgaiOPmQz5O5Eu4FDQvuB5/gMQceBVeCngVzgrEFmRP7Ikj6cQbeBYdheQXF4T4HPaC+BP8ARuu+BokGwAOWm0HzWDAb+Wt6WXkveZj7Q7lt+8azhAMtEYAByjJEAGgDyAMKekN7W3jD+C+iYtMwY2YCJ0FLu7BhI3unejI63rhb68khitkteKp5yLJ6WXt6pgc9+Ez74/m0AEvjf7uTwrQAxrJQeJ

17xPnqBDdJGCBxBfYQZ4qcBnHLTQTeBy+KxfhLAl9oLQTVONY5zQUG27oHNlmxuSIG/Xmb+qIHsZruuICaxtGyA/wBCbjIigMq+XumUvxqvcBmyIA5X3gmBXv4dQTgeDIFU7rlOm174/gDwS4CDQUHAgjS6gZe2fK4CeCYAJKpgVAMQMQGbMFaQY7K8yBkmWqr49MNyXnKd5Gr2zH4OIKQySJB5sBoAKQGNEle05/6CcGMIYq4uQB46EHQF8n6kK

75FtLgAzzCCUkTqlZiLlMVksq6VQLquchA92EauF44/wM6uGnTZ5pWYXER2UK7E72BEwf4QbGS/lkgcS44QMssGO+SFqlJUq3Lw/C+WYHKSiAlAf9J82mIgH0Bdnlu+kmr9oO2yY7QhBgzq8FDggTrIJkGNmueQuzDzlAvgkuKfgbWB0wAI3LWAaCCZfhHmtxSSmPMUKf6VkoCQtLBNsD8oFJLIIDTg1GikkCrIYvrJ1uKSoMEtFODBwIGxAVDB4

AQqOJhysyDwwWsQQJbSwQoaeHpQIGjBymRWFFjBs0HLQWa0cYCWroTBAbpM4CwQpagu/EFQ5MGUwTDYlL46VOPC9MEJQIzBbqjnjvTBki4McF6qKPycweKY3MFNpKO+d8D8wQtggsEVATc+IsGxQWLBcVQ/KhCwUsGQcDLB+QhywT5kUACKwQGaKsG+fiyQxsFqsNZ4LprWuitCusG+2PrBTpofwkbBPGqmwWJB5sEuhKpQaW7Wwac8tsFWlN4Ab

TTvfEQBTsEsqC7BZFBuwf54nsHayN7BNHQ2vFIaIMGKhIHBF1jBwZDBsyDQweHBVPqRwfz0CMFvEkjBI/aA+uWQicEIoMnBaAFLQavi6cEEwUTBucGkwQXB0hBFwba2NMEgFBXBiHSVwV6ONcFRLuzBDcE65lzBgrotwR2+7cF8DGVkXcGVUFtcosETWP3Bo1Q7spL8BW6hEKt28sH9QJPB6xrTwbsys8H0ahwAmsELysvBiQGtwGvBeBAbwXRq6

sFf4Eg4IsrKqFSae8FOQFbBzRBHwXfEdsFnwfhEt4RupM7BrkCuwevCd8GzIg/BteA+weZ6rB4FZi/GX167QdU++0EogWqsvXD0SIIA7QBmgFcApmoXQQUEyly+XkJAjnioHqygSP6yMF4+Tt6gDi1B5Z6P7t0e84aMgaqBT967tqnQlKIRPpXezECWOms2QF6j7pgOGl5R/s2ya0HH/gvi7agZ2PNBIUEzQSrii+LiOKtBWSE3gTkh6SF5IVtBm

R5pQbPq7J71puY+Ys7OWvkg9EiRALgA8jpugOvATQBYWgrOIWxmdgJAbvKNTDO2fa5pgPjuQ65ThqW2FZ7lthOueB7AWm0WdbZ6Hv0kAWKhNINBMWqKsnEh0x5xPrMe4d7bfrjm0BYlYu2AvYCoACnopOYjXqDW0MgQ4mmUsdJ9rmY0Sh5pTkSsEA5JgVj+KYHBIWmBvUFhISyufQDZgX7AZhxbgF/qAMFBdle2HMjBQRGAqxC4bnRum8jkbnRus

G5AILKCQCDAKn8h9+BC4P3Ag55TKNChrVKAoTUoUG4goSihYKHNsGsCkKEOKq3wlD5IoVOeCKFXgTChPCjIoekIwKE4oc6uaTQQoZ4GvyFEofih1Qq/TMxu5SHVhpUh6RacnhOCjWwsAFAWu9zKcBQASjR2gNigqkodPsDiPa7dPtuCc7aNQSlOmB7o/gqBNyFKgffefv4LptjWz96r0L1wzbYV3k7qK7yWpDrytd7xIWKODd5JIcBu1uLrigh+T

X5pUli8b8Az9n8UZ8inCpyoI05L4HGuN+CHAA8Ah5B4oQaADgb9IK+KdlCEQZdu6RDXbiOAaUI0gJRkxcIuMieWBk4sfhTBsnBUwaaEakFkZjQoAxDkBJggMGT8EGaw9+S1sONA+IzFZOrgkQHSTjS+k+AR5oQhFiAEQvC+8xJU/Bq6jhYN5PpyWajrimf4++YNejgkQBz8OOZUWoT6emNGxqFlUugglZir4MFQlqGslNahiRDegNIA9qEdvuOEW

C4uocEIkj6hyB6hKYr90j6h3RB+oQQkN26CUEGhDz7atKGhDADhoQMQt6AoIQm+saHbhPGhavwlQMmhGZCpoWpwkPoZobzIWaGakDmhpQYCKNSQhHiFoUMgG+AlocJSZaEuhtkmlaHFcNWhHaG1obKg9aFMkm2gunqahMeEbmhLrO2hv7Cmof5QjJIaAL2hGbD9odgQg6HskEfOI6GtRGOhVb50oe6hyYp3yBEB3+a+oW1ui6EBocuhQpDAag16d

ZCV5Agu26FRoZJEe6HcitlAh6FJoQa2s6CnoWr8SOCXoV+y16ELgbmhX/j5oXfEj6FnQuVu/pKloVNc5aFTFp+h9AE1oT3YJuZ6IA2h9PbNoSBhSUHPWmUhxiFG/lZemUE2Xqve8gAsAFwW0Bb+0GjAqgAQALsAgwBzVlD+rmJuYleexMC8eO4hm4CeIQDK5IEyjGAOMqHSZi9BT+53Ie9BXe61niMaGkAyCLDkIf5vIc0w1jyTgKNBf34U/sWB9

kBEoaFBtIruADbYYMh+weFhM0GRYUCAa3wxYXaBRYgpIdhhUWFJYexApSGpQcph6UGsoZvuWUE+gZph2RbQFtgAaMDm3jAAIYB2Hsd+Kfh7SpVBevCA5LQCtUyRjA9BPwCDIRoOwyEBIViiCVrR7vchPUEf6u/uMyEJ9BsKRN6RoEJgToBfIZVOvIG1IRyW0BYQADLwqgDPABQAVI4HIQKiU3gyPLkc8uSkgRjQLWGZ3h7+T0Gyoc5hgSGkFm5h4

z4B/v6WlqSf7sgOcmybjGICQEy6ocshP96rIYaheMo0gGhiA+SIbrBcb7YbAHiAVG4GqPaCQAoFNCFuepCOwmKqUYID5MAqWG7JAgEKGjgtcBA+wpyb5B3gXRI0gPRif5zrIFMArUBJSjSwdQL8eB8g72G3YJ9htFzfYT1K8G7/YX4CnZzA4fAgoOEI4RDhFKGbyLoCU/Kw4T/sNQA04bdgSOHDtFAAqOHtgujhpqquijjhv7x44VnkhOGhCorgJ

OF/YWKoAOEU4dWOVOERwi/ykOH04dDhYihM4c3s8OEv8uzhddic4WECBTQ84ZjhumjY4eSCDG41Cqye6+58Rnf27KFcbpyhJpbQFsgAC0DxBAm2IYD7IaVB7a7A4j02016u/olOFSp2YdKh8oFOYcBsr0FdQX1h/v5aFjzmAyRr0K8hK9BCQBxgCFj5gQs+hYFaCHOAjd7XJL9hUco2ruAi3DL6IEywoyjlKE+0BfZQiGeSLr7X2MKG1uKQYWXml

IqJ3FmkJzyubqjOyVJU4vZ0pERkZsOi5WQJAaqKqWiWhB047gC84eogcnitwRegB2DBUIPA/uyBOJ2+dFZLuqqE7RAUpvXhLwB42LeE4yI3gYyQpchyZJ4APaCH1Iy8DTIY4aP8pci6kt1SsFRVwEXIkM4C4vbmPQFpIEgcAk7o4FehhUABriZUabAGiuMcCkQb4DcmUdo/YVhomorp4WlQTMjZ4fZ0ueEKtBtA/SB9fsj6FeKdoeKYNmhl4VqwF

eF8JBlmpX6EVI5ApypaPt6QjeHFVH4iVwqt4bC+iDjr4XUyx8Dd4Qi+SexTGNvgA+EYHEPhAcJuVvDcMFJVJpFhcdzT4e8wefL9hOkYQOD0Pm0OUSA23FeEa+GmqlvhPJJwkLvhEFD74YJ0h+Ed/sfh+aan4ePCKeyX4YVk1+F0ZKa+myBwFA/hRl5i4Snhc4rFdFx0Jm5U4e/hlrRf4fnhf+HvKJdYgBE7vo+K3orl4WPAleEQEQCBteEwEYWK8

BHN4UgRAgG0Uh3huuHvKih4PeGVQH3hsiR4ERnhgL4OfiPhxBHj4ZIgZBFT4W6alBGBCtQRXoC0ET8Y9BEr4ZE8zBE2EeaoXVJsEXHgHBHyAFwRbXQ8EaUBTSauQAIR5+FHkiIR3o7iEXfhz5BIpsWufM5GIZwOJiFVPib+5iH8DqiB3ZbQFk0AboB2QMTIC0ALQCy2jiEgooXqUQCPppthBvDEWgTSgrZe4ScsDmE+4dchR2EPfj0eKoEPIedhA

GZmPDuW8l6RakJAjoCe+qT+FGq0Bg7QCeEvYRlAcWGLQdlGBi68yBnYlgD97NHgmSHXgTVO6xE3KN2eMgDbEVFhtJ7JIQUhBxEcxkUuxxFgAKcRQIDsRkfwbA7lNsbhi975YXw26mG1rpvcLADjVjyh5mpYoJEA+3BmgEgW7TaAoqm2LLKRiDTArREQotPcphwCQO7yrWGcwO1hwy4jrj/8IyHyLLoOAeGnYbj+rvqDYZak0SECjkTevEj/JF/ee

qFUHhzkSxE8gUaWfIHfVjyh3YBIgH0O7YDIABDeJnaptqDWvQDJ8FCRM17MGDQCnj7p+nDWe2HxgcqeN94DEXfej37DEf1hweEqod8uCAiRIZqhc+iCjDE+v35x4fzwlJETQUoSIeQFpPKgRFZmapYo785AnGHghCB2/IEoIEHMPhJQIeRkgEQAGApvtgschpHkgAaoppFIPsQuOgK2kc/sUoBvEJaRg8DjnMukFIIFNJSwVJqvQOec9FymBuiOL

gIFNHYRjfKznBtAgLCrBJpC+pHLCMLK08rlqNbgGArj4HkKA+Qh5CnibxAJkVQqUgrvAlqR1nA6kXkAepGJkamQDZxlkYjgLuDJkYkApHKuysoqkxwlkjCC7crryhUOWuFIsCpSGZAGkL7sfwgHGFnkjCCBQMWcywh3wAiOcniFwIiI00AkKC7mA5EtOrBcVgB/ypcOisrYFP5A6ZG3YHORZIA2QG8QcKjZCvmR3ahFkXqRE6RwqNMIssrrkUYo1

pC1kR188HbnTJqRu5HvAMWR/UDxkb4oRpHTyo6RCYDTypaR1pHYdq6RRpEOkZP+ZpHOAl+R9pH24J6RdFyPHD6RnZz+kUYSQZGPHIxcoZFtkQF40so2CpMc0ZG9sLGREFTxkaWRAZx+QCmRbfJpkS/ymZElKNmRi5Hkgpg4AWiq/udoMAB7kfeRpZEp4nTYBFFVkVhRNZGNjs4qZQ5HEk2RlCq5yq2RYZHtkexSnZHDIN2R0Yi9kcsc/ZEwAIORw

5H7aiWA45F2MmscwlHEnNPAs5EGKgrKuZHLHLhR4OGrkceReRB3Kgjg25F6KgWR7gCUUctGB5EI4EeRAEInkdMI55F+dDXKLHbXkeRR+lEPkXaRUoDPkb+RTpFvkTAAVpFt8jaRj5GAUfuoTlEJgP+RnlHukUBRrlFekRec8pxgUSECEFGBkW6cIVEMXFzhsFEhAhGR4CpIUTGRosboUevKSZEMUR06d/IqUbyc+FGI4PbgOZG5ytpRpFG6URRRt

5ElkWlRFZG0UZWRxqjsUOZRzFFLDqxR+pHCypxRDOHcUeGSvFGqyFkoAlGJSH2RMrAiURHkYlEY6hJRC3CTkTJRM5G0XHOR8soSKoVRS5Ft8pvka5EaUXuQWlF5kTpRN5G6kfeRhlHgkAtRNkBmUUxRinZYjjpiTG6qdgiBxv7VNtUhULSWIUI20BY/4EkQGAjyzk7hBIHcSLNAWfi+DmZY4qGSpJKhFFrK7o5h/RF+4S5hyoHdQUHhhB7SkTpuZ

s5Nnm8hNBbrgvM+39568iEEapGAwclqiAAcgB3SQUAAwC+k2AAiBAx4gJDekqFAHAF3EpYAC0CjAQIQ6ZrMqCJQOM7PXOoooah9UVaaIJAmKJdo/UAnCGZy5QGVmCBBqDAWoE/IVcDWERvhSCFSxrVqa7rHVDMQ17I9tBFRh4oVwMVk45IEkGMgo1LjwplmuJRvAKlwvwGrFjgAVADF/oq0X2p9KGMSR7JsIB6EPxy8kKXIbLAX2Ga0Y+bo4FsRO

xHVJm8YOgCXlvx4yNHfGGjROACY0QU6nNj7fJ44nAEE0UTRkCAk0Q5oprocLmFEDahU0Z5SFai00d2o9NEFgj44zz51dDewTgBQqkYSNCic0WgRkNTSyrzRl2o27FAcl/ps4ELRqnQi0ZFAYtGgFBLRxXBS0XfIxWSy0ZsU8tEasIrR3+bK0d2SjAFq0fTqKZCa0XCIEcA60Y2RA7LNEIbRbLDfFrpWptFRYebRtUCW0ZxWMOZUMj1AdtEY0RAAW

NFeks7ReNEpQG7RI/7E0b44XtGdThTRftGZ4JWaE8BB0eRRIdGM0QJhdcAs0XWB0dHgIKCSXNFxVInRgi7J0U6e75LDwOnRe3pZ0YRURZJ50VrSdqhFksXR8GCMAArR3qFK0ceoVdFtEMWq4BEa0d2Rl9IBADVyetEt0Umg805G0R3RJtHiOPcRUCAGdBbRKiB5EdtBgs6nUdwehWEWPr6B9TbQFhQAVQC7ABAAMFa+WsKhaPizQDYw8iJ+DsJI8

jxMEqYcn1E9Wq70vREHYb7hVRz+4VWeEpFA0cqhYSHdJMNB3+4jzDOA08xLIWT+CxHj+AeWIYDyvp3kstFVKAMU4zKg7Occ2pw0prsRydaCMce+i27jhKIxUGRGVrJamxRqnNIx5xF4MHIxWkKcPmC8YjEqMRIx6jFjII8RcoDPEUY+FT5FEbkeZiF63mURliG7NtbhyAAbRP7QboBugIS2BK5o+FQG0g4aOuESnOzyDij++2HCkYmBopE+/gqhT

DFKobM2XmFKXpyIkxGD7vTkjzhzER5K5P6LEQeWysHDnrtgXjIOki5AUurYoNDgpMGd0g+h4pgaEdbi9HCJ4Ji++jGKQfgBIBD5CMFyl/qy0V6hkhDHbqW+fiAXqGNgo9Y/cvrgGXaIdPduWajlwXXBE45rCJEilcEpQBCK+qZSeGfRKYjmIA20CUCZdlROCr4XpON+VH49En7YLcjPTClAGIAQdIva5mjFRgV0Wa649kFu0zFkgvQB92DZfheSl

cBccPmwkYRG1jPWloTdWOuK3FTzMef4F6hW5gbmu+ZKlOdyYKp+UAXsoXa8ipVQHkTRGE1gKOCGAJAgkiBiVIwAtArvMMZonexr8ASQaaiBhDh8qsjVhCPhSBx9vjhmCkCAgA9gv7DX/pmEjchJEK6KuXA4AIix09hJZgfAswF6QkGKGZA5alHaqTEW7NdAGTE5ZFkx5WC5MS78+TH2JEUxABElMSdgZTHKMRUxlhFgcjUx3wqWbiYmPBCNMSB+r

kDNMenIrTGjXB0xDPbTMX4g9AG9MUMxAzHGaEMxIzHGJmMxWSidYJMxXTF+ILMxVr4PMRN+SzFPMasx6zHDMUrKLcjbMT0IuzGmOE72mXYHMVWhZ0K5aCPSFnjnMXc0PNhXMfzYNzER2HcxDNSzZLDoLcjyvC8xNxxPkBvmnzHX7MwczXLtsr8xBpj/MQkQzjLAsU1gQCDgsRXgkLGAHLEYxXCwsRqqVfzEeEix+aYosZQQuOB/AEhhbDjYsekxf

OA0sPix2bFEsalyq+aksXuBx4qUsVgs1LGf7LSxRsCZMdkxTLGpMgUxehJssc1EYLClMVVC5TEiuryx1TEQcgKxW24IOMKxMoZNMcpokrHtMUVAnTGVQN0xN8AKsd1uSrHuQCqxlyaMIOqxohCasT/AUzFVjmFc8056sbNkBrGviEaxv7QmsZsxTzEWsXROYiAfMDsxoXhrMfaxkdwnMc6xubAXMW6xwcjXMfKEtzEdofcxvrHmaAGxO+ZBse8xN

aoIIF8x4PY/MStgfzF+hGpCQLH3TAmxYLFtchCx5tKmaB0g6bE+RFIgWbGIsW5WyLF7vici6LFFsVixn1gtsZ/C4th0/JWxImF4crWxnkH1sQTq8DFKYYURKmEZQRye51EaYSwA9LY8oWaAUABLQKqAlWENWu0hOhxmdrJcwqJDhrju7IE+IUXQIc7Droeq935ikUMRgNHhMTz4eJFo0MHAm9C+YRHh/wwCQIT4QWEqkbpA8NHfIdNhvoExttAWq

oBsgJIAvyJqMCBqCd5x0OKBO0ivURn4nnZx0vxe99z47sJeyNrLXnKhYyEZbPOmBB4sMRdhs4Dz1HKRN2H6GBxgCGxmHgZxU2GI0UEMqtI/MFJOghGR/FqabyjfvuySdtI9QJHWqgCeOJ0gel6m0hJqcXHMwQlxCtzdOIBQyIi7fOtiitIZcVlx6wCaMW4MsXEkqAVxaRHmVGaqHRClca+I5XFzoJVxEjbVcfr+896vESdRqmGscSgxNSG+gX220

BZI0leGWwAJpCyRmyQLVtVi+RT2cXZqO0gOakgGFwxxgQTuP1F3LsExyYEA0YHhSnHCAiqhcdQRgd/uebwxHhFxB5Yw6oIGQ54pnCAEijJNcUicN3EpkE1x1Xy1aPP2HzBvPBjqOxYv0F7IClLIqI5AWSi9ctZ4qo5CTqp0MOiKRHKE98Ar/g160KHhEIcAUdoXcTREPhDlNA9xyCB3cUjxBAS3cUlxn8QvcYdq/r7x7B9xjXyuEEhwJ8S/caDgi

+A9vkDxTo4R2KDxIbG+AJDxn+DQ8YVkwa7w8aVEAbBo8V1yj3Famvdx6PEc8bwAZqoivq9xuPEkHPjxEUbfcbIkmch/caIQAPE+ONdAlPFBQNTxHzG08fdM0zz08UShMPG7XOw2hj4snlf2Jj6Q7mphK95fEYD+unbXUSlA/tDyAHvgqgDQ4PdRrJFXpoNK3NJeMcwYFTAtEXhMXRFrcT4+tDG/UfQx/1GhMYpxfnERMYmA6pbMQOHhi4D2gOpu5

h66cSshcNEHlh6AiD6r0k/+KLD8eNHxNzgN/mw+pnAkUtFgy77o4Wg+qfHZYb1x2vEm4SVm1a6cbieatSFP9tAWcwDrwLgA2KBFQUbAjRFDSj28xDFmWD4xYwpKXBMK1y5CkW1BIpF/UcdhZ1bYkUyBjyEXYUJg4bzHcdLkW4AJMRdKfDESbonhiAAegN4WgFKikP9yPLqP+DfApr5MkpD6yXTLoADGyKZ5VNJW6fF1wIuUw8B5AK8BydgeAGpw0

GFtmugAMDKK/NYRpaRiIJrKKIh4Mus+4DZWIGKYO5S1RO9gxGQNfPbCqEHDgU5Ab8AHgWzedN6yegYBCUDSeBe+d4HI3OghGfzfimOQ2DxGfpC+mxSWksvYKeCXEaNcgoqIugnxERZz8URBi/FQBMvxZTSr8acSeVQb8Tc8W/H8ODvxMfHzaBtUFeBH8Q8wJ/FoASfEvlAX8fN89PoY4TfxFLDSII/ATdb+UIBW5G6v8f2EH/HwOF/x1E4/8a1Af

/FWimLegAksCcAJiHhgCfOxcJAtbtxBMAn2/HAJjb4ICRwySAla4CgJP3JoCaBhv7wz8QlQ6CCZZjgJR7EwcAQJ9PbECSUQ9PbkCTtEpcEH8TQJrWB0CeahwRiMCZfxyj7YPLfxHAkP8Vx+ataSmIxkeLD8CbvxOHKF/N/xvxS/8Xlw4gk34JIJR+FjYKAJ3EEQCWIU3m7QCaz0sAleAfAJOJiqMijYyAn7EagJAii6CSt+jHGIrvnxws75HgdBl

iGCDpshmABQAHkAuNgFAEKhoJFK6t0uvhrqtqJxr5qtGr4ejzbAmiM2ibxRDpHuuB4+cfge8RrA0WEhoKQ1TMdxbLRlzA9hvDFwRpPxf96coU4OPKH+0DNg2SpQAJEAijr4MQUqvXAtCcrAD4akrutItOYsEk1BO1ZSlh5x7UFd8YMRQSG98SEh6YEqoXIIG9BM7uDREeEA8LI2MFo8MfMR0wmRcfbOQMFYthCKSxobGnsaydbfCTsafwly/sPeZ

9QhAD8J6xq82P8JRLYa3gURhQlvEaY+g3GfEaLqOUEkjsUeqABLmO0AkgCDALXxOfCWdoiETfHlKtzC3RGAmv4hdIGdQYwxPvGDCf5xYxHWIlpA7EzZgAtIDkj9IZMJbwl2Rh8Jmc5Awbi2oWZEQdXIRwD+yLWArUBgVAEW0Dif4LNqzyoMJGUGlWg55J4uGYbeLoSmTbBrKgS2dGFbMuSxYuJRcGHBFM7IptwhfBwHWKKegXgkIdnBxMF5wQqGk

aGugMXB/n5YIDvOMHaQIHsiJxFm0awo2BDxAAmA67BVJpfSOpqRQLfEE2qR9n32ctJs6sKAdeG+RH1RVTGOmngQZlpHFsvISBxTMlAAH0Aa2CLKnXBb0ZYghUhR2tyJhhFLbh7gza7fgFS6xfCPpJRmhrSg6vxqWqovKlKJtFZn5LKJCobyiYrSionddtluurp+iXnyT7DEBMxwMtKiIa+Uuom2bsjggnC6UPAhJMHMsauoO6HM1AcYGIoAKKcgt

okkulAx98hOiSzwromY4O6JIUCeiYEIsyASUnrS/onQEYGEwYl32vTG3pDhiWly3CDJEY/SMYn7MLwA2a7QMYmJEdHBrqmJp05mQHyJmYkM3mf4LRQiiWNgeiDiiZmqBiQliVQ8ZYketuTRdradmlWJZFBKibWJMn71iYEKjYlDcs2JCeJzwe2ySXb6iV2JfMFGiQghfYkQkAOJdWpDiRlIYZCjiX9x44kOia+oOtjTic5Gs4nDMvOJ9NaLiT6Jj

AAriWoQAYk/PkFyJuCbiSdGYYlFztWxksCRifmm0YmxicvA8YmQcmeJ+kQMcTlhTHF5YYiJVSFDcbZetSERTtAW9AApQNDgtAAh0Nr69Qn4gUAOTQkg4vbx1EptCZJxNy7jplRaXWHycRcJujZ98aMRczb+jJbOQfGUgNmAP67lbK8JiTET8RyJay7UkbUhEs48oaIEHeCJJPNhtfGKSQ5xXqBMoB0RUhYqSYMurpYd8UExZwlaSSdhOklXCf3xt

InqgHuYDImu5J52Y/FwWqTiVkm8rtFxDlJKWqQwd9oItn7BeloiWilJ3AlwrilhmIgZSaNQWUki+ui29ZYIMTrxG+4fEfrxKInfEU7Oue7mcXZAC0A9eBJcskm9poNKJp74iVLouO7MoO9wbfGySDQxGg7exrb65IkMMaM+lwkjEbiR0yFljDDIdrhGHh+uYvjsXqyJFknvCQD+fIFtzrnuNAAzqvesYADx3g9Rxy7VYufuIQAN8buYt9yADhneh

wkitn4hG3EPrltxtyE7caNJkpFDCRdhr96jhg8JWvCp0OD0SpEFgRHx8wTxSZuuQK7Txt4Y5ggQiq3wJzBGiDQAAPKoAKYQ1BrQQYKIQMnpnMM8HcDgyZDJUhptgYDJ6/AgycGQiMkmMUwwpUlFCbUupREw7pyhTS48oSwAyABvQBQAVwCG4GGBaoBYNO1JZlgIBs7xrGxp+BchZIk9CZWeI0nBSWNJD0ljEX2m4x4MiYzwaWBncaFh3Qai0lHKc

MkE3BzICMl+RjihksnYxjihYskTyDYGiGjAySngUsm0oScwsJAcyBDJGslTKDLJV5ASya6ASip6yVMoWsmQEKkCIsk1KFrJssmayaYQkyiiyX2c1ADayVHKusnWyarJxsk2yUbJTskGya7JdsnqyZAQmxTo4JCu14mhAihoEMmeCHKxsyhiyaR0BslhyeDCbaB+KI10EdiqeIMGr/4YyUfUe3qpAujgUkzcQaECJ0wGyddMiIJZyYjgUkzBBi3A2

HgOCA+U/xLbivLJfsmoAOjgp5D9YH5Ej07y4P0SSk4dvltce7KTqL5Qwq57wq8QNgIQyaaCCMlzwBSGxE7tQIQgsADVADHJKckIyazBSxBFya1uGRCIgh6EaskqybbJFsnuyfrJYMnilFmxayhdyBhSidxT5upSLbDzXDjBpwE+OEXRpX4fCKpWAYbCJJN6tPRDOkH23oDCYY/AeLyNUI4BIVJ7PqxUvBFr0UNc44QjFBhhTAC+hvw+JSi5ITIAW

widWCWavlC8EWvhAsjVAD7cJ7HyTgkAUdqnBsvJWuCOyTUousnAKhgpcsn2ybriFQjPTCgpDslWyYSh6smryXNY68k6yV7JRCmeyZvJVClryQrJxUYuybQpZCloKcrJqCmkKc7JbsneyXQpTClYKQQpuClhiOhogcmsUsHJsyihyYGCYJKRyRbY0cniKSnJ/cmgkOnJDq7VBl8q08nyKcC6GcnXTNnJwQa5yWDJ+cl+IIXJ+clCiGXJAyKVyV6KI

pwOyTXJdclXbh1AeUBNyVJSpHg6uu9g7ckGcuGu4bGRyX3JiOA2AoPJorDsBhhyZUQwKYYAk8nKKXnJtcH9yVnJt9jRJn4gS8nEKSvJSsmWyUrJksm/wcIRn+BbXAfJHAB3sR7IG0FpwWfJoBSc3pfJdclJLjr4t8lTunM6D8k2FtL+L8noptLg78kYlE1UX8mrOnhkk9J/yW6hACmYcM9gaSFq4h5OsD4s2kvgUCmMAGPJgRE/XPqxCCnNsNr8W

oZKyfLJ7CmUKR7J6ClTKVChOCkKyfgp0SlsKdMprCmEKbEp5CnUKYbJmCmzKTihJskVCAwpnClMKXEpfCksKRwpUcpxKcAqFynSyTspJyl+yYIpyokiKef4YimIgihokikYyYEpcclpyWopiinysEEpOimqKT206ilZyd+KOcmpycXJeilhQHPJJclGKRXJkoBVyfMpFil3YAuhjckEzmRQLckOKXvJWrAdyc9oXck6TmYpaCDuKQPJBslDyT4pZ

Sb9KRPJMil/Kds6US6hKfPJ+OCLyWihqyniyYcp8SleyYkpO8nzFikpqNQmgBWS2dbQITri2SnZZrSSeSnXyc4kRSmSIPfJcPa1wGUp5zAVKcWxn1j0AVZydSlLug0pv8mylP/JBLptKcApxSGgKV0p6do9KaIB0CnjyelcQymmLlEqmvErnrlhFSECSWyhbHEG8XyBmy48oSlA+3BgABNIbIDoAKHqzUkoFgFanay0yfpgw4b7gC3cqknUMRdJt

+4DSXJxITHikVSJ7cZTIa9+XmEYtJCifMkQPA5IMeEw0bsKkfEWHoD+GK48oS0AWwDEyDQAEACI7uIeJmEQ2tnAf/YSDIAaUQDn3sj+3j59SX5Jz0EBSZGpCnG7cb7xC87xqU6A6oAxMXX6XSFCQC7AMUkUJhW8P0lAbnlJ0ZioOkKIQRD2hlyozsieAfdyhwDC4H0ox4rWLmdMQqyL+p3aPYjW2C/SWfxTqbHJg0J7FnOpyZCG2IEK1C7rjCx2q

6k1COupeDibqelygpAzqXup5TgHqWqJbKjHzpt4s97vXnCJUvoIibrxSImVScXxvoH1rtdR2AAhgCFApWCLjFTJbugqRoPOTGzVqUo8/jHt8SJennHXSfKhUaktqdSJfvGUDBMeOJ4zSQtIum47hr8un0lPYRmpU/HxZmLAN1gMeMSWA46XaprSaYgXPhmIAkE8+p7gEuB07GfIoCHPXBhy035FSWjO3FS84oQgc8D6VBGuG+D24LhCnFBsxhUIY

ymMaQIpsJDiaUU4YiDWBmW6bkaqVo7aHBpzWDJpgYJTRsppimluRtd6HzCXAeWOQ5C6/OJpM8mGCd1SrLy2knOU0BRVwA+B8PwgqSU6Uky4QsXJ70xhQLopTQb5yWMp/KldiXWo7Slp4gHc2eDWIKEByNhHoNlwUdoNoEXKZGkLsP1YFGmyWlRpqjKSfpJwdGmMROJpzGldoFD8q4TGeuG+REHpUI/AfxC8aXyQ5q4Cac0QZLwiaXUYYmlKabKIS

MZhiKpWbCb3BlJpCmllacpplWlmybVptckaaRJpvgFOAWAUumlbFgZptcFVMWPkcTymaT1k5mlgHLxBVml3gd4ptmkGKRopTmmFhsXJrmmZKTAhqiieaZYAr1w+aaly6Jb8/ssWQRaK2KRpiMEKjpRpOyj9MhJwR3KRIp1gCWl9aMlprhCpaTN+44Rcaftp2WkxjtvCeWlCaY5pmUaiaWpppWnVaSppiskfac1pdWllnMVGUmlNabVpWmlyUDppR

1QnlFaEZWmGaT1pEBR9aSukA2nIVBZpw2nMiqNpNmn5afZpk2ngqc5pM2nT7CyYpwELadqpHSm6GitpdbCkcIr+5LCwgaWux1GVPlYxJRE2MQTJ2347rjyh8gCqgKgAn8DYABGUnS5o7iFslgBjYbZxKs5S6EOmp0R9Pohqms5UgdrO6JEgbDOm2jbjIc76MzbKcRNJuqJNMMFxfcZmjESBdjwLSePxS0mZqXyBPG48odDgi2E5KoMAawk7STzpR

ljwAB9+FakplKpGV66waU/ct1Lu8Ztxjanbcd7xKGkxqW2p/vHZgNzy12Eq6Ta4LsAlvBrpsUnRrEOpiR5lwNGJ3xi7zhQuoJYUBCQOYelWEFXOfhar5lgssekOOPHptxboZoHEtGa58cY+uMlegVp2wkm+gXDuPKEaAMgAWwDtAK4xFADSRlIipunqSoJmWOTqgD28gA4ygcGpXMAyAgEUfRGO6Z7x3fGU7hzJ90k0ifpJoghlbEZJ93BsrIBee

Gmx4V9J8eEHlhQk9AGK0hHmXuZAcHXI4Yb0cCoAL9DbWg8YiWlj6vROQUCgmDgga6nqIPvwKYhR6UCG/HjT6VUBhKZz6Z3mC+mQMEvpe3ZVmmvpapgb6SaBtgg9QDvpe+lFuJognWBH6Rz0uUmZAKfpWaiz6XfE8+k+5ikGy+l36bda6zHWgc/p2+n2CLvp56n76Vfoh+nEscfpGR68SfCJ/XEscYJJyIm/qZphvO6lYe2Ahe7M8pcAdQmw0GCRc

Ajrgu8acJ4UfOCJlQzUGc3pVFpThgdW7t6syaMhPWGTrr5xqGny6XGpHuk9rvx8L0nGSZqABRT9qWPug6nLSbUhLu7QFpgAjOJQAP7Q+3CfwNZxJunpgP76q0DwkbQSKVg2MFFsqjo7qmdJATH1qYdhTuk3SS7pd0nMMWhp/STS5B8aDIn5ILaAGO5mHlvQRGnian2QVc5xUQ0CHNYtoL3gzfBOGXMOdNajoM/mhdbf1n4Z/hkBGSLW/9aBGSEZo

RlhGT/W4Rlf1kAg7jxHwH3wx6mB4CUuKDBoMLQwNDBDtPr26OB11viCPYgEiJA6YJgWmE0A1IgFGOCYVIjrMayITdrciIPAq/qu4JUZ56n71gBBOSCuQDdOzNSJGRk6HhmcdnTWzdrv6Q0gc/r3iGIATohBiBUG68BtGR3WQCCAADKk4xkTGZMZUxnTGTMZsxlzGfMZCxmTGYLWixkrGasZaxnrGRsZyxkbGRsZQCAOsGlAa3qHRolGdEnekNfEw

xmt1mepYDrFGXwgRRkWmD0ImzFZGcGYW8gYRk7aFEbMNiw2g0BjGdsZXxnfGYsZWxk/Gf8ZAJlfGX8ZgJmzGUAgf8R4sM1wQfZxibpQQ/rdQAvgTDhIgBkZLIJ01hcZ59pPGQgZ/dq6iAQ6owgGiAUY/snSafuIXQjUOqxGiUDIIHUZnxkgmZSZmxlUmTSZtJkTGcCZdJmjGbsZJ/xZfCmQ+W6d3lPwv5AwtHipDjiHETy8ZtbiII8YktotALkZr

pgimS6YxRnV2lUZ1xnnqY8ZXRlHwJbWvXAv8mcZvQJ01lyYWog/CPyYmxjheCqZe9YUmYyZBplLGYaZxpnfGQyZdJkVCPX8tkLAIgp4xnjDGSiZ7ni6mRMOrDbViKp8LkBIpOXs+pkmmYyZZplemb6Zsxk+mTSZQCAUJBhE6SiB4El4NHgfYEKKSJkn1vaZMhqOmYUOrDY9wIpUnpl+mVSZAZmpmRmZ6ZmUmc8Bd3q8RHAuaSDPit6mNKYGADFAy

W5i9B/aoICNYOjgsZnX2jggaNCimcUZEDoSmRaYitpL+m3aVRnIOtSYvdbdwMqZ8ZkCmYWY6JmaIMMSceCiktGZfZn4NimZGZmAmVmZU5lemTOZgJnRGYfOclq09KS89XROGXTWnYFkRthG3drjmQKZPZmMALOZNJnzmYeZBpnHmf8ZibEPKYFw/rDSPtZEMUDKQQFpO2BFgjWZ3IiRAHWZnYijqT2Ig5nNIPBB5YGpCNWgVNzh2t2BpZh11n3An

GoOGcpau5m91m6ArhmJIO4ZkFmUgl4Zl+k+5r4ZkRmoWaEZwRloWZhZWFkS1thZItaLmQj68plHzj0mIJCJGRcwKRlqEGkZLxRjmecZtBo5GbA6dIh5GZSIBRllGXLaVxl4IDFALFnwOuYINRkpCIKIPFm1CHUZ4cF9wI0ZdA4Via/OphC9mfBZ7xmdGXEZPRmXiH0ZqwgDGSGIkFk01pOZJ5lAmepZs5lnmT8Zuxn7Gcq8cjhHGXHceBCnGXaZ9

FkciIxZ7YgymVA6lIh3GZ4Ijxh8IJuZy9rbmaSKe9YfGQeZmlkAmdpZHlkgmV5ZXxlgmU1wh9RQmexJMJmb+lsQ8Jlz+tRZqplmWW2ZcplxGZiZZto7iL7a9IgzwASZuJnEmRWBTQBkmW5Z3ln/Gb5ZOVk/GXlZOxmMAA6wLJnthGJ0iGjXxNJiF6HdyX2QfJm5RgKZDxn/gX4YDZkWmOKZNxkomDxZ9ln8WY0YX5kKmb3WSpmqUVJZi9bqmRuI/

4hdgcBIQ1l21mpZ+Vm/GTNZc5kmmRaZw/xWmSlyMtimWY1ZkUCjwJNZzILOmUJZSZmVXNNZc1lzGYVZh1lrGcdZaxlBmXfEIZmNEmTIg9hGeCZ4qXhHAJFZyJmCmXGZW1kIWTwgyZnuWSdZqxlnWd9ZCxm/WSsZOZmEes1EBSkEmu888uBvwEWZ6XKlmbfa5ZmEUJWZplTPmeYI7QB1mbyI0ZgWWZFATZntWZXaPFle2p1Z7Znnqd2Zc6JvWTvWA

5mEWXF0o36jmSTZcdYHWX9ZRpl02bSZANmLGfhZ67CKLg9sq5keGRuZzxnMRuRGNDouWdTZRNm02QzZoxlM2cLZ9NmGmReZtYlXmQwAN5kmVHeZ62l9Wc9Z61lt1m+ZKDqfmeTZUkF/mTNcgFk8OpFAtQiW1qBZFu7MUnHpEFnwWS4Z0uA7Pg/oAtmuWd4ZV+koWbhZDtmi1hhZjtku2X4ZztloWSzZZXAIGUupJFnyicew5FnIIJRZM/bUWUjZ+

Ij3Gb0YGNmJQIUZrFkWmCwA7FlPGLjZ6tlVGcuka6mCWaXJiUDFRk0ZdWotGZJZ1NkdGQg65NlyWacIClnrMZmGQxm7mapZX1li2TMZotnV2SLZC1nFWXpZ9JQGWd0SxxntamcZKJkR2a6YVlnImO2ItlkvWbFZ3NlUOs5Zbxn4NtlZddk12RPZ05kN2eCZfrD4cFKp0JmMkNf6YVmmwhFZT5nRWeUZZUC9WdawWDpYmebae4i4mXLa+JmqVoSZH

4h82ZlZrdbhAELZDNm12dXZt9mgmcVZpVkGgI0S3CAcmVVZgCg1WVYQdVn3Rg1ZQpnNWRvZFdoQmDxZvdlFGPjZcplrqYPZCBmKmS0Audkk2WqZuZgamWNZUkFPWeOZldlT2dMZ99nC2Zg50xmLWZe8y1l5matZbRmh2ZtZ1tnOGVVAu1lumftZVdnoOfXZNDmmmQ3ZwZnmmtdZwGhUeMl4kZnIVu0ZA9nqeKQ5ZDka+J9ZdDn0mQI5GlnGmUDZS

dosamzZVWoEDlpO2aYHwDDZfN5w2QvgCNnVmVw5yNmo2S1ZEtpS2sA54DqJ2Z0ZHZndWYLZg1mkOfnZ3drb2RTZI5llUig5FdnX2XTZ2Dk2OQ3ZMRnIJL+kHNnrmV0ZmEYj2Tw5iZnWOX9ZtjneOQ3ZQimhktLZC8FCMQ9p95kKII+ZmYKh2YJAqtkAOTGYFRka2T+ZJZh4iP+Z41lXGD4YIFmLnhWmh1HsDkyhVqksoTapBWFYGakqOUE57jyhp

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=
```
%%