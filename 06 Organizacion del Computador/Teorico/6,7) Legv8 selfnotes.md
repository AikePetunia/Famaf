---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
LEGv8 básico ^wzNS2Chf

Arquitectura del procesador (CONTEXTO) ^cFMTPp9h

En la actualidad, se usan en general 2 arquitecturas de procesador. ^E6bMuwtw

x86/x64 ^AwTucXgy

ARMv8 ^gtfnuGsM

Arquitectura tradicional de PC's y notebooks, usa un diseño de
instrucciones complejas (CISC),  siendo desordenadas y midiendo entre 1 y 17 bytes. 
son rapidos, pero tienen demasiado consumo energetico. Nacio como un chipo de 32 bits para
luego ser de 64 ^pYcqRA0D

Es la arquitectura standar en telefonos y en mac. Usa el diseño de instrucciones reducidas y simples (RISC), siendom muy ordenado y todas sus instrucciones miden 32 bits, siendo rapido y facil.
Siendo un chip tan simple, un chip arm consume 1w. Es capaz de manejar internamente datos de 64 bits, a pesar de seguir teniendo instrucciones de 32bits. ^Wonm1Szv

Es un subconjunto educativo de ARMv8, una version "Lite".
Las instrucciones son codificadas en binario, llamado codigo de maquina. ^YDgZ7UiO

Operaciones Aritmeticas ^GRByUQc5

ADD x0, x1, x2 // x0 = x1 + x2
SUB x0, x1, x2 // x0 = x1 - x2 ^Pqgeydkv

Las operaciones aritmeticas operan EXCLUSIVAMENTE entre registros. 
Usan el Formato R (los formatos se ven mas adelante en el apunte) ^FEJCIR3R

Principio de diseño 1: La simplicidad favorece a la regularidad ^byLky3KL

Registros ^je25KLPf

Se usan para hacer cálculos matemáticos y lógicos puros, como
ADD, SUB, AND o ORR, 
directamente dentro del procesador y sin tocar la memoria RAM ^BG8GWkc3

Principio de diseño 2: Lo pequeño es rápido ^BwfVYavO

Registros vs Memoria ^uOVZEn8m

-Se accede mucho mas rapido a los registros que la memoria.
-Las operaciones en datos de memoria requiere cargas y almacenamiento.
    -Entre más instrucciones, mas debe ser ejecutado
-El compilador debe usar registros lo mas posible para guardar variables.
    -Solo se debe almacenar en memoria las variables menos utilizadas.
    -La optimizacion de registros es importante. ^jLunPi0X

Operaciones aritmeticas inmediatas ^yxU6khos

Son constantes numéricas que se escriben directamente dentro de la misma instrucción
Su propósito es acelerar el programa al evitar ir a buscar esos números fijos a la memoria RAM, 
aplicando el principio de diseño de "hacer el caso común más rápido" ^5NEpCsgB

ADDI x22, X22, #4 // x22 + 4 ^1GRnLXMi

Principio de diseño 3: Haz el caso común rápido. ^TISaBUCv

-Las constantes pequeñas son comunes
-El operando inmediato evita una instrucción de carga.
-El número constante más grande que acepta es 2¹²-1 (4095)
-Formato I
-Pasan por un bloque de Zero-Extend.
Esto significa que el procesador asume obligatoriamente que sus 12 bits 
son un número positivo sin signo. (No acepta negativos) ^Yroc3vzQ

LEGv8 Formats ^r9QIwb1z

Los formatos ("Plantillas"), son moldes o reglas de lectura, para el ensamblado de las instrucciones.
Le dicen al hardware del procesador como tiene que cortar y agrupar esos 32 bits 
para entender la orden.
Por ejemplo, si al procesador le viene la orden: 
10011011 no sabe intepretar si es un numero, direccion de memoria, etc.
La plantilla dice, "Si ves los primeros 11 bits, y los ultimos 5 para saber en qué registro 
guardar el resultado".
Este proceso, forma parte de la decodifciacion (decode) ^Ccn4fdHK

1. Fetch
El procesador va a memoria y 
trae 32 bits. ^GCBqrkYp

2. Unidad de control.
Se leen los primeros bits de izq (opcode), 
para poder decir que secuencia es y aplicar la 
plantilla. ^9R5yJYZO

3. Ruteo.
Los cables se rutean a los registros 
correctos según esa plantilla. ^vcOH6CTe

R-format Instructions ^ZC3MoVkO

D-format Instructions ^IFOXToRx

I-format Instructions ^gSOgTSGT

Útil para matematica y logica pura solo entre registros. No hay numeros sueltos ni memoria, todo está dentro del procesador.

Ej:
    ADD (suma), SUB (restar), AND (lógica Y), ORR

El cómo se reparte el espacio: Se piden 3 registros.
2 operadores  (Rn, Rm) y donde se guarda el resultado (Rd). Ocupadndo 5 bits c/u.
   -Le sobra un espacio, asi que tiene un huevo (shamt) que se 
    usa si se quiere "correr" los bits de lugar (Desplazamiento)  ^CGvtSsEx

(Registros) ^z9hLRLKf

Útil para matematica y logica pura, pero acá se quiere operar un registro contra un número fijo ("Inmemdiato") que se escribe en el codigo.

Ej:
    ADD x1, x2, #500 (x1 = x2 + 500)

El cómo se reparte el espacio: Se sacrifica uno de los registros de origen (Rm) para hacerle un hueco de 12 bits a al número fijo. Con 12 bits podés escribir números hasta el 4095. ^GHQoJBPO

Útil para llevar datos desde la memoria RAM al procesador (Load) o viceversa (Store)

Ej:
    LDUR (Traer dato), STUR (guardar dato)
    LDUR X1, [X2, #8]

Te da un hueco llamado address (direccion) de 9 bits para poner un numero de compensacion u offset (ej: "anda a x2, pero movete 8 bytes más adelante) ^fhHFbWqL

(Datos / memoria) ^DmPEjTb5

Principio de diseño 4: El buen diseño demanda buenos compromisos ^2pbkPbKw

- Los diferentes formatos complican la decodificacion, 
pero permiten instrucciones de 32 bits de forma uniforme.
- Mantenga los formatos lo más similares posibles ^la0hzjjc

Operaciones lógicas ^b5SaNy0V

Las operaciones logicas son distintas:
no les importa el número entero, sin o que operan bit por bit de forma individual.
Es útil realizar este tipo de operaciones por que sirve para "Extraer e insertar grupos de bits en una palabra". (Mascaras) ^HR2eIEI4

OR / ORR / ORI: Compara los bits. El resultado es 1 si al menos uno de los bits es 1. Se usa mucho para "encender" (forzar a 1) ciertos bits sin modificar el resto. ^tBvGT3qG

AND / ANDI: Compara los bits uno por uno. El resultado es 1 solo si ambos bits originales son 1. Se usa mucho para "apagar" bits que no te interesan (ponerlos en cero) y dejar prendidos solo los que querés analizar. ^NBX2iD9F

EOR / EORI (Exclusive OR): Es la famosa compuerta XOR. Da 1 si los bits son diferentes. El apunte te hace una aclaración clave acá: en otros lenguajes existe la operación NOT (~) para invertir todos los bits (cambiar ceros por unos y viceversa). En LEGv8 no existe la instrucción NOT, se logra usando EOR contra una máscara llena de unos. ^9RvmkOY2

Cuando se programa en alto nivel (C, Python), hablamos de "lógica", como un if (A > B and C === D). Pero en nivel procesador, y ISA. Las operaciones lógicas significa estricta y literalmente "Operaciones bit a bit" (Bitwise).
Se agarran dos chorizos de 64 bits, se pone un arriba del otro, y se compara columna por columna hacia abajo. ^gvTKajzn

Aplica tabla de 
verdad AND a cada bit. ^qHzCOdWj

Aplica tabla de 
verdad OR a cada bit. ^dWnn6VvW

Aplica tabla de 
verdad XOR a cada bit. ^hFZkWQaL

Crear condicionales y "saltos" ^czzl6dp7

shamt (Shift Amount): Es el campo de 6 bits dentro de la instrucción (en el Formato R) que le dice al procesador exactamente cuántas posiciones debe desplazar los bits (puede ser un número del 0 al 63). ^UvBqXlch

Label's ^oaSOUfHe

El procesador, lee el codigo de manera secuencia (linea 1, 2, 3...). Las instrucciones de salto (Branches) sirve para romper la secuencia. "Deja de leer acá y saltá a esta otra linea". sirve para los if-else, while, for.
En ensamblador, no se salta a "linea 45". se escriben nombres inventados al lado de una instruccion. El ensamblador luego se encarga de calcular matematica cuantos pasos hay hasta esa etiqueta. ^e4s8X7LL

CBZ (Compare and Branch on Zero - Salto si es Cero):
Mecánica: El procesador revisa el registro indicado. 
Si el valor guardado es exactamente 0, el programa interrumpe la secuencia y pega un salto hacia
la etiqueta que le marcaste. Si no es 0, ignora la instrucción y sigue de largo con la línea de abajo.

Equivalente en C: if (registro == 0) { goto L1; }
Uso típico: Se usa muchísimo para salir de los bucles (cuando un contador llega a cero) o para evaluar 
si una condición fue falsa (en lógica booleana, 0 es Falso). ^yYgzK27N

CBNZ (Compare and Branch on Not Zero - Salto si NO es Cero).
Mecánica: Es la hermana gemela de CBZ, pero hace exactamente lo contrario. 
Solo va a pegar el salto si el registro tiene cualquier número que no sea cero (ya sea positivo o negativo). 
Si el registro vale cero, la instrucción se ignora y el código sigue hacia abajo.

Equivalente en C: if (registro != 0) { goto L1; }

Uso típico: Se usa para "quedarse" adentro de un bucle while mientras una condición siga siendo 
verdadera o mientras queden elementos por procesar. ^zs0pxqvc

B (Branch - Salto Incondicional)
Mecánica: Este es un salto ciego. 
El procesador llega a esta línea, no revisa ningún registro, no pregunta nada, y salta obligatoriamente a la etiqueta.

Equivalente en C: Un clásico goto.

Uso típico: Es fundamental para saltar por encima de los bloques else (para que no se ejecuten por accidente si ya entraste al if), 
o al final de un bucle while para forzar al programa a volver arriba de todo y empezar el ciclo de nuevo. ^Bvei02rK

Es un "Lenguaje" de Assembly ^jnVy0fE9

Crear bucles ^kmLdznpw

Bloques básicos ^JcpqPKPR

Es un transformador de valores. Es una "Caja negra matematica".
Entran registros con ciertos valores por arriba, sufren un par de sumas y restas, 
y salen valores nuevos por abajo. Al no haber condicionales en el medio ni nada, 
el compilador puede optimizar esa matemática al máximo para que corra rapidísimo.

No tiene bucles, condicionales, etiquetas intermedias o saltos, es 100% secuencial. 
Los únicos saltos que tiene son:
al inicio: para que otro bloque pueda "saltar" acá
al final: CBZ/B, para decidir a que otro bloque continuar. Pero termina ahí ^KnVIsLIF

Flags ^SXHOWQIR

Los procesadores en tienen por dentro funciona por un sistema de flags/codigos de condicion (CPSR O PSTATE): ^FLQtrcMF

Las comparaciones en legv8 normalmente se hacen en dos pasos. ^5wgaS2k3

N (Negative): Se prende (1) si el resultado de la cuenta matemática fue negativo. ^fTLN4jbP

Z (Zero): Se prende (1) si el resultado de la cuenta fue exactamente Cero. ^XcLUhAPF

V (Overflow): Se prende (1) si estabas sumando/restando números muy grandes con signo y la capacidad del registro se "desbordó" (dio un resultado matemáticamente incorrecto). ^TFJpJTxT

C (Carry): Se prende (1) si la operación generó un acarreo (como cuando sumás 9+1 y te "llevás" el 1 a la siguiente columna). ^SoLMa4U6

Operaciones códigos condicionales ^yP6t7MFa

Hay códigos de condiciones para operaciones aritméticas, tales como:
ADDS,
ADDIS,
ANDS,
ANDIS,
SUBS, <- Mas usado, por que permite saber A = B o A < B 
SUBIS

que básicamente hace la cuenta y, además, Setea (actualizá) los foquitos del panel según cómo te dio el resultado. Si o si necesita comparar algo con algo y el skip de estas secuencias NO existe
Que: 
    S (Set flags) opera entre dos registros y actualiza las flags, EJ: SUBS X1, X2, X3
    IS (Immediate + set flags) opera un registro contra un numero suelto (inmediato) y actualiza las flags, EJ: SUBIS X1, X2, #5
Las flags activadas son: ^LY2pTrQr

Branch Flags ^Nxu2tNBS

Inmediatamente despues de activar flags, va una: ^i98ILkvf

Branch Equal (mira Z) ^BWUj1T3e

Branch Signed (Números positivos o negativos) ^3FM46alG

B.EQ (Equal - Igual): Salta si el foquito Z está prendido (Z=1). Porque si restaste A - B y dio cero, significa que A y B son iguales. ^MDb5dEs2

B.NE (Not Equal - Distinto): Salta si el foquito Z está apagado (Z=0). ^WEApmKb8

B.LT (Less Than - Menor que): Salta si el primero es estrictamente menor que el segundo (<). ^DVtKO6Pp

B.LE (Less or Equal - Menor o igual): Salta si es menor o igual (<=). ^dBFYRZeW

B.GT (Greater Than - Mayor que): Salta si es estrictamente mayor (>). ^b0zb9ZdS

B.GE (Greater or Equal - Mayor o igual): Salta si es mayor o igual (>=). ^eTpzvjuk

Branch Unsigned (Números positivos) ^sX5cMxv5

B.LO (Lower - Menor): Salta si el primero es menor que el segundo (<). ^L3Ky2B48

B.LS (Lower or Same - Menor o igual): Salta si es menor o igual (<=). ^uJt1nfHK

B.HI (Higher - Mayor): Salta si es mayor (>). ^jWKXw8zO

B.HS (Higher or Same - Mayor o igual): Salta si es mayor o igual (>=). ^Y9cAoiuc

Operadores de acceso a memoria. ^qxyxfOMZ

Cada registro de 64 bits (8 bytes). pero cada cuadrado tiene 1 byte (8 bits) ^FxbGdxeD

Instrucción Store (“guardar”) Copia el contenido del registro X1 en la posición de memoria direccionada por el contenido del registro X2 sumado a la constante #40. ^FleG0o4I

Acceso a 1 Byte (LDURB)
Se trae 1 solo byte, dejando el resto de bytes de 0 automaticamente (Extension de 0's).
Como se trae 1 solo byte, el siguiente dato empieza en la direccion siguiente. ^1sy0UhSI

Acceso a 4 Byte (LDURSW)
Se trae 4 solo byte, es el tamaño Int estandar.
La "S" en LDURSW es fundamental: extiende el signo 
(si el bit 31 es 1, llena los bits 32-63 con 1s; si es 0, con 0s).
Como trae 4 bytes, el siguiente dato emmpieza 4 direcciones más adelante ^wfqW5aGV

Acceso a 8 Bytes (LDUR)
Es un acceso nativo de 64 bits (un long en C).
Como trae 8 bytes, el siguiente dato esta a 8 direcciones de distancia ^FU3qJZFd

LEER (LDUR) ^TqLO7WWF

GUARDAR (STUR) ^w6LwQ0a7

Si en C se escribe: save[i] = h
(save = x25, i = x22, h = x24)
el flugo seria igual que la lectura, pero con un stur. ^C7R5lS59

Realmente algo que no entiendo y tengo dudas, es si es posible
mezclar cosas como STURB con LDUR, (guardar 1 byte, y leer 8 bytes) ^JxtxUb2J

Operadores de construcción de números ^w2Px8cb8

Como una instrucción de LEGv8 tiene solo 32 bits totales, es imposible cargar un número de 64 bits de una sola vez. Por eso, el procesador te da estas dos herramientas para armar el número como si fuera un rompecabezas de 4 piezas (cada pieza de 16 bits).
Imaginá que un registro de 64 bits es una repisa con 4 cajones de 16 bits cada uno: 0x0000 0000 0000 0000 ^7EUCD2mP

Escribe el valor de 16 bits en el cajón que le pidas (cajón 0, 1, 2 o 3) y pone todos los demás cajones en cero.
Es la instrucción de inicio. ^B9FVgCxQ

MOVZ (Move with Zero): "Borra todo y escribe". ^g5OaNcHm

MOVK (Move with Keep): "Mantén lo que hay y escribe". ^5osk5QS6

Escribe el valor de 16 bits en el cajón que le pidas, pero no toca (mantiene) el contenido de los otros cajones.
Es tu instrucción para ir sumando piezas al rompecabezas. ^TtfcD2EW

Endianness ^KAftZmOI

Cuando guardás ese número de 64 bits en la memoria RAM, la memoria no guarda "el número", guarda bytes sueltos (8 bytes de 8 bits cada uno). El Endianness es simplemente el acuerdo de cómo se ordenan esos bytes. ^JJJwG8iz

Lógica de Cortocircuito (Evaluación && y ||) ^h27EJVvG

En un if (a || b) si a es true, directamente el programa no mirará b. En assembly, esto se hace simplemente saltando bloques de código. ^zD89bHGD

Or (||) ^m0AhlBDO

Si cualquiera de las dos condiciones es verdadera, entramos al cuerpo del if. ^AISnFGny

And (&&) ^2FcDTwqb

Si la primera es falsa, salta directo al else (porque ya sabes que el resultado será falso). Solo evalúas la segunda si la primera es verdadera. ^8gSPqHjz

Si i != N falla, el primer B.NE te saca de la lógica y te lleva al final. No perdiste tiempo comparando j. ^wlemWnDp

Arreglos Avanzados: Matrices 2D ^EmVWoUQj

La memoria es una linea recta, entonces la matriz se "aplana". Para acceder a A[i][j] el procesador necesita calcular una dirección única. La formula es:

    Dirección = Base(A) + (i * N + J) * 8 (si son 64 bits) ^RhO5NQh9

Ejemplo de acceso: A[i][j]
Asumimos: Base en X6, i en X0, j en X1, N en X9. ^IJdI4YGp

no es un "archivo aparte" ni un "procedimiento aparte". Es simplemente una sección de código que el compilador identifica como indivisible. ^3Kle20AD

Para que un trozo de código sea un bloque básico, tiene que cumplir estas dos condiciones: ^mEAtwQqZ

Entrada única: No puede haber saltos (labels) que caigan en medio del bloque; todos los saltos deben ir a la primera instrucción. ^gkImCTRr

Salida única: No puede haber saltos hacia afuera en el medio del bloque; el único salto permitido es el de la última instrucción. ^RJXXp4NU

Communicating with People (ASCII) ^MD2BTz0y

Si bien las computadores fueron inventadas de unicamente
números, pero cuando se volvieron comerciales, necesitaban
comunicarse con la gente via texto.
Para eso, se creo la American Standar Code For Information
Interchange (ASCII) siendo la rerpresentacion base y estandar
hoy en día ^s5Nd79ZR

Las letras en mayuscula y minuscula tienen una diferencia de 32. ^3NbJyThA

Diferencia técnica (ASCII vs binary)  ^iHvBxbAs

ASCII no es una forma de guardar números, es una codificación de caracteres.

Error común: Intentar guardar el número 1.000.000.000 como texto (ASCII).

    Como int (32 bits): Ocupa 4 bytes.

    Como texto ASCII ("1000000000"): Ocupa 10 bytes. ^TLyhF5Z7

Conclusión: Representar números como texto es ineficiente en espacio y, sobre todo, imposible de procesar eficientemente (sumar texto es muchísimo más lento que sumar binarios). Por eso, la CPU trabaja casi exclusivamente con binarios. ^uIFlxi81

Cómo se representa un String (La convención)

Como un string tiene longitud variable, la memoria necesita una "señal de pare". Hay 3 formas, pero C (el lenguaje que usa LEGv8) usa la tercera:

    Reservar el primer byte para la longitud (opción de Java).

    Tener una variable externa con la longitud.

    Terminador Nulo (\0): El último byte del string es 0. Esta es la convención de C/LEGv8. ^Ws3PZGHC

De todos modos, lo mas usado es el Unicode. ^IBGM5VPk

Unicode es la codificacion mas usada ya que es la quem as alfabetos humanos contiene, ademas de contener simbolos. Unicode 4.0 contiene mas de 160 "bloques" que es el nombre que le dan de coleccion de simbolos.
usando en java, c++... UTF-8, UTF-16: ^pyEEtl15

Strcpy function  ^fWseH3v9

Funcionamiento ^ySxcg8hg

Legv8 solo estas viendo numeros. No entiende que es un caracter, algo grafico, solo entiende numeros. La tabla ascii, es una tabla de traduccion que tiene el procesador.
Legv8 cuando recibe un digito, lo recibe como un numero. 

La entrada (Input): Cuando presionás una tecla en tu teclado, el teclado no envía una "A". Envía un código de escaneo (un número eléctrico) que el Sistema Operativo (SO) recibe. El SO mira su tabla ASCII, ve que ese código corresponde a la letra 'A', y convierte eso en el número binario 01000001 (65).

El procesador (LEGv8): Él no sabe que ese 01000001 representa una letra. Para el procesador, eso es simplemente un dato. Si vos le decís ADD, él lo suma. Si le decís STURB, él lo guarda. Él manipula números, no símbolos.

La salida (Output): Cuando querés "escribir" eso, el programa le envía el número 65 a la pantalla (o consola). La terminal, que tiene una tabla de fuentes (la "traductora" inversa), dice: "Recibí el 65, lo busco en mi memoria de gráficos y dibujo los píxeles que forman la A". ^cH8JO2xi

cuando se sabe que recibe un numero o una letra ^ig6NYBvG

El compilador, es el generador de 'legv8 instructions'. Si justo en c, hacemos un programa de int char = 'a', compilamos, y vemos que printea 65. El compilador 'traduce' mal las instrucciones. Es el orquestador de contexto.

Si vos le das a la CPU el valor 65 (la 'A' en ASCII) y una instrucción ADD lo recibe, el procesador va a sumar 65.

Si ese 65 era un número que querías sumar, ¡perfecto! El procesador hizo su trabajo.

Si ese 65 era una letra que querías imprimir en pantalla, ¡fallaste! Porque le diste a la instrucción ADD (matemática) algo que debías haber enviado a una SVC (impresión).

El procesador no se confunde, él es un ejecutor ciego. La responsabilidad de que el "contexto" sea correcto es tuya como programador. Depende de quien configuro el procesador y como manipula las cosas. ^sPHuwfkG

Los branches no son inmediatos. Necesitan una flag previa para funcionar. Los CBZ o CBNZ son inmediatos. ^ewKoRBhN

Branches Adressing ^Qr7QbKcl

El branch adressing son saltos el linea. Similares como llamar a una funcion ( y en consecuencia, ir a su ejecucion) o 
como un break mismo de un loop si la condicion no se cumplio. ^AIjlejbx

La instrucción B (Branch) -> Viaje de IDA
Es un desvío sin retorno. Saltás a una etiqueta y te quedás ahí. No dejas ninguna pista de dónde venías.Para qué se usa: Estructuras internas como if, else, break o bucles while.Analogía: Salir de tu casa para mudarte a otro barrio. No te importa el camino de regreso, tu nueva vida sigue allá. ^l2gAJG43

La instrucción BL (Branch with Link) -> Viaje de IDA Y VUELTA
Se usa pura y exclusivamente para Llamar a Funciones (Procedimientos). Saltás a un pedazo de código ajeno, pero necesitás obligatoriamente volver al lugar exacto desde donde te fuiste cuando esa función termine. 
La "L" de Link: Significa que el hardware, en el mismo instante en que salta, guarda de forma automática la dirección de la línea que estaba justo abajo en el registro LR (Link Register / X30). Ese es tu "boleto de vuelta".Analogía: Salir de tu casa para ir al médico. Llevás la dirección de tu casa anotada en un papel (LR). Cuando el médico te termina de revisar (BR LR), mirás el papel y volvés a tu living. ^mpBmDok6

Acceso a 2 Byte (LDURH)
Se trae 2 solo byte (16 bits) de la memoria a 
un registro (tamaño estandar de un caracter en java/unicode,)
al igual que ldurb, limpia el resto del registro con ceros (zero exntended) ^NU6jww85

(de igual manera, no responde mi duda) ^3C2ihSm5

¿cuando saltamos? ^xrKLD4Ep

¿a donde viajamos? ^51PrxDZE

para calcular la direccion fisica de la ram (en Bytes) a la que tiene que mover el PC, está la formula: ^y2mk1jr4

Dirección real de salto = PC + (Inmediato x 4) ^wd9RizTN

Cómo calcula el viaje de memoria los Branches ^XX1RY2pP

La CPU calcula la distancia en cantidad de instruccion de donde esta parado hasta donde esta la etiqueda. Mediante el calculo matematico: ^FxCqaYxa

Dirección real de salto = PC + (Inmediato x 4) ^W9ehogeO

ahora el hardware sabe que tiene que saltar a la direccion 0x10 (la correcta, linea deseada) y no ir a 0x0c (la siguiente instruccion secuencialmente, linea no deseada) ^my4lxcRU

delay loops ^xvSAD0Eb

solo tiene sentido
en ARMv8 ^Uy40Po4k

registro que usa para calcular
el acceso de memorai ^MxxQhBhb

direccion de 
registro (target) ^re8RhWzg

dt_adress ^AMjTw0Eb

Identificacion de instruccion y codigo. ^ESfzzSPS

B-type instructions ^NxOs1F2K

long story short: ^XZDI4qki

Carga ancha. Para armar números de 64 bits en varias pasadas (MOVZ, MOVK). ^corlrGLk

IM-format Instructions ^SRygBU0k

Far jumps ^n4jBFgjF

El problema de los saltos comunes (B, CBZ), su limite de distancia dentro de la propia instruccion es de 32 bits. 
Si se quiere saltar a una de 64 bits que esta en la otra punta de la ram, y la instruccion no es suficiente:
Se usa BR (Branch To Register) y la instrucción MOVZ ^UqX9TMfw

Se plantea una solución de dos pasos.
ej: se quiere saltar a la direccion 0x0000 0000 4000 0000 ^5bQQ4bf1

B / CBZ: Usan Branch Addressing (matemática de PC + offset). La dirección destino está adentro de la instrucción. Son limitados. ^NVAG3ABN

BR: Usa Direccionamiento por Registro. La dirección destino está afuera (en un registro). No tiene límite de distancia, puede saltar a cualquier parte de los 64 bits de memoria. ^FA0g8zdc

Instrucciones ilegales ^VpfZEjCW

Si los bits no encajan en ninguna regla predefinida, el procesador no sabe qué hacer y se produce lo que técnicamente llamamos una excepción de instrucción ilegal (o undefined opcode). ^BkRKozAH

Si un opcode no funciona con ninguno de los formats/instructions (i, r, d, b, etc) se generará un error por que no tiene una "regla de lectura" a seguir.
Cuando sucede esto, se genera una excepcion (Error) y el programa se detiene ^ITMYMxAL

A. Fallo por opcode ^iii9yaAV

B. Fallo por formato / límites ^ke0hTgg3

EJ: llega un 11111111111 en vez de un 10001011000 (tipo R) ^kyDYqFVk

El opcode que viene de memoria no coincide con ninguna instrucción definida en la tabla de la Green Card. El hardware de control no tiene habilitada ninguna señal (cables en 0) para ese código, por lo que nada se mueve en el Datapath. ^vlDMNibD

Puede pasar que se da uns intruccion válida como un ADDI, pero los parametros dados no caben en el formato. ^RYZtOHZE

El "desbordamiento" de bits: Si el formato Tipo I tiene 12 bits para el número inmediato, y vos querés meter el número 5000, los cables físicos de esa parte de la instrucción no tienen dónde conectar el bit 13 del número. Es como intentar poner un elefante en una caja de zapatos: la instrucción es físicamente imposible de construir. ^oN5X4xPI

Si tenés una combinación de bits que no está en tu tabla, el procesador entra en un estado "indeterminado". ^1l6vuX1L

Assembly es una gestión manual de recursos. ^XzEKWenk

ESR ^gjX9qb1b

El Exception Syndrome Register (ESR) es, en pocas palabras, el "informe de autopsia" de un error en el procesador.

Cuando ocurre una excepción (un error como una instrucción ilegal, un desbordamiento o una división por cero), el procesador se detiene inmediatamente y salta a un código especial llamado manejador de excepciones (handler).  ^A2nnwHTK

Es un registro especial: No es un registro de propósito general como X0 a X30. Es un registro interno donde el hardware escribe automáticamente apenas detecta el problema.

Contiene el "Sindrome" (La causa): El nombre "Syndrome" se refiere a un conjunto de síntomas. El registro guarda un código que describe:

    Por qué ocurrió la excepción: (ej: ¿Fue una instrucción inválida? ¿Un acceso a memoria prohibido? ¿Una interrupción de I/O?).

    Información extra: Dependiendo del error, puede guardar la dirección de la instrucción que falló o detalles específicos del hardware involucrado. ^NIW3EyXo

La analogía del "Formulario de Incidente"

Imaginá que sos el jefe de una oficina y ocurre un accidente:

    ELR (Exception Link Register): Es el registro que guarda la "dirección de retorno". Es como un post-it que te dice exactamente en qué línea del programa estabas cuando todo explotó, para que cuando termines de arreglar el lío, puedas volver ahí mismo.

    ESR (Exception Syndrome Register): Es el formulario de incidente que alguien llenó por vos. Dice: "Accidente causado por: Operación inválida en línea X". Sin ese papel, no tendrías idea de qué paso seguir para solucionar el error. ^UT2Znta6

cómo identifica el tipo de excepcion ^pxgKMTsm

La accion del procesador debe, cuando una excepcion ocurre, es guardar el address de la instruccion en el ELR ^eDx3MKqw

Se puede dar por un error de hardware, o software ^6K7NUJWj

en que linea exploto ^pwgbpqao

por qué exploto ^yk167y6A

Sin vectorizacion hay un error fijo, que ira a una direccion.
Con vectorizacion, hay un tipo de error dependiendo de que paso, con direcciones distintas. ^j4OFOWQ1

ES un capo de bits dentro del ESR (no es el registro entero), que funciona como "codigo de error". ^aURJwxq5

EC (Excepction class) ^wn5d0utE

si o si tiene que ser de 16 bits. si tenes 0x0aaa, si o si cargas 0x0aaa, no podes cargar 0xaaa solo ^pOEqAD2y

B.MI (If Minus): Si n == 1,  cumple condicion y salta a la direccion. Si n=0, continua con iteraciones. ^fV1rzKPC

a - b < 0 ^fBtbDuvm

Operaciones con hexadecimales. ^1riWptHM

B.Inmediate ^TEpVMtdW

B.cond ^zZK1113H

Calculo en Conditional Branches ^rv4LhFOz

Calculo en Branch Inmediatas ^yJa1t5aU

Sabemos que la instruccion maxima de un b.cond es de 19 bits (2¹⁸-1 = 262.144 Instrucciones). Llegando hasta la direccion de 0x3FFF F
(Esta direccion se calcula rellenando 25 bits de 1's y pasarlo a hexa)
0011 1111 1111 1111 1111  ^OuIjKFSy

Sabemos que la instruccion maxima de un b.inmd es de 26 bits (2²⁵-1 = 33.554.431 Instrucciones). Llegando hasta la direccion de 0x1FFF FFFF
(Esta direccion se calcula rellenando 18 bits de 1's y pasarlo a hexa)
0001 1111 1111 1111 1111 1111 1111 ^iZjvfQk7

Según en que mundo de "bytes" vivimos (ej *4), es la direccion maxima alcanzada.  ^V2re2tOX

Distancia en Bytes = 0x3FFFF * 4 = 0xFFFFC ^5PND24XU

Distancia en Bytes = 0x1FFF FFFF * 4 = 0X7FFF FFFC ^NE18c85i

Calcular el alcance maximo, a partir de la direccion dada. ^s3b3zpbI

Alcance_maximo = PC_Inicial + Distancia_Bytes ^WEjiM9lj

Calcular el alcance maximo, a partir de la direccion dada. ^QGmhInRw

Alcance_maximo = PC_Inicial + Distancia_Bytes ^LXYvNywS

Ahora, si te piden si esa direccion está entre X, Y o Z:  ^FOXEw77L

mi metodo xD ^gpMmah8b

¿Que pasa si tengo un caso como Z? (No llega el salto normal) ^uk50pW71

Si te piden calcular cuandos Saltos/Branches
tenes que hacer sin BR para hacer un "Far jump" ^Mow9g33f

EJ:
Suponiendo que el PC está en la primera palabra de memoria 0x00000000 y se desea saltar a la última instrucción de los primeros 4 GiB o sea a 0xFFFF FFFC, ¿Cuántas instrucciones B son necesarias? (no se puede usar BR). Máxima cantidad de posiciones de memoria “hacia adelante” de B = 0x7FF FFFC ^4bktJFby

Cantidad de instrucciones 
B = 0xFFFF FFFC / 0x7FF FFFC = 4294967292 / 134217724 = 32,00000092 = 33 instrucciones Branch (Se redonde para arriba) ^snp3VVJe

El procesador y el Data path en Legv8 ^vQQYDg2i

El DataPath Legv, es la estrucutra de hardware que ejecuta las instrucciones en el procesador: Fetch, decode, execute, memory and write back.
Los elementos deldatapath en Legv8 tienen 2 diferentes tipos de elementos logicos:  ^CbrNiDaV

El camino de datos (datapath), es el como los datos en memoria son como el procesador conecta las piezas de todos lados y pueden ejecutar instrucciones ^zv4tZJGk

Elementos que operan valores de datos (Lógica combinacional) ^HX2k4avW

Elementos que contienen estado (lógica secuencial) ^xx1JQDtA

Estos son los componentes que no tienen memoria. Lo que entra, se procesa e inmediatamente sale transformado.

    La ALU (Unidad Aritmético Lógica): No es más que un montón de sumadores completos, compuertas AND/OR y restadores (con su lógica de Carry Lookahead que vimos antes) empaquetados en un solo bloque. Su trabajo es hacer las sumas, restas y comparaciones.

    Los Multiplexores (MUX): Los vas a ver por todo el Datapath. Como las instrucciones a veces necesitan usar un dato y a veces otro, el MUX (hecho con compuertas AND/OR/NOT) actúa como un semáforo que decide qué cable deja pasar la información según las señales de control.

    Extensor de Signo (Sign Extend): Pura circuitería lógica que agarra un número de 9, 12 o 19 bits y lo convierte a 64 bits manteniendo el signo. ^oZegriwd

Estos son los componentes que tienen memoria. Guardan información y solo cambian su valor cuando el "Reloj" (Clock) hace un pulso.

    Los Registros (Register File): Es un banco de 32 registros de 64 bits. Por dentro, son simplemente una colección masiva de Flip-Flops D conectados en paralelo, junto con decodificadores para saber qué registro estás queriendo leer o escribir.

    El PC (Program Counter): Es otro registro (un conjunto de flip-flops) que guarda una sola cosa: la dirección de la memoria donde está la instrucción actual.

    La Memoria (Instrucciones y Datos): Aquí es donde se conectan los conceptos de RAM/ROM. En el dibujo del Datapath vas a ver bloques que dicen "Instruction Memory" y "Data Memory". Técnicamente, la RAM física está afuera del procesador, pero la dibujamos en el Datapath para ilustrar cómo el procesador le manda las señales de Address (dirección) y lee el Data (dato). ^T0rjk1Wk

El viaje del datapath ^JsiNaBKT

Fetch (Búsqueda): ^Fr8MSd9I

Decode (Decodificación) ^QnWH5WiI

Execute (Ejecución) ^fAjoA8x0

Memory (Memoria) ^RCJklvum

Write back (Escritura) ^EQvPj0Vg

El PC le dice a la Memoria de Instrucciones qué dirección leer. La memoria "escupe" los 32 bits de la instrucción. ^CxnF4tFX

Los 32 bits se parten en pedazos. Una parte va al Control (para encender los MUX correctos) y otra parte va a los Registros para sacar los valores de X2 y X3. ^niZr3t1Y

Los datos salen de los registros y entran a la ALU, que los suma ^DegYgroL

Si fuera un LDUR o STUR, aquí se accedería a la Memoria de Datos. Como es un ADD, esta etapa se ignora. ^W1p56xWf

El resultado de la suma viaja por un cable largo de vuelta al inicio y se guarda en el registro destino (X1). ^DVWpesnS

ALU: Arithmetic logic unit. Suma, multiplica, resta y divide. ^frwRMrc3

Ejemplo de ciclo: ^E6PhuGnQ

La 'documentacion' de legv8 es la greencard. ^EN0hCZGp

Ejemplo: ^RIhXVL6p

x32 NO EXISTE ! ^i75df4PX

siempre requieren exactamente tres operandos: un registro de destino y dos registros de origen ^BzGPIY4d

Trucos: 
Si necesitás cambiarle el signo a una variable (por ejemplo, f = -g), usás el registro especial XZR, que siempre vale cero. La instrucción sería SUB X0, XZR, X1
. La máquina lee esto como 0 - X1.

para copiar datos: 
Si querés copiar el valor de X1 adentro de X2, podés sumarle cero haciendo ADD X2, X1, XZR ^3HHNPT9I

R[Rd] = R[Rn] +/- R[Rm] ^SeBcjH0Q

Exclusivas de registros: Solo operan usando los 32 registros físicos (de 64 bits cada uno) disponibles en la arquitectura LEGv8

Tres operandos: Siempre exigen exactamente dos registros de origen (para leer los datos) y un registro de destino (para guardar el resultado)

Alta velocidad: Al tener toda la información ya "a mano" dentro del procesador y no necesitar ir a buscar datos a la memoria, son las operaciones más rápidas del sistema ^Iwu7uYYi

En LEGv8, estas instrucciones nacen del 
Principio de Diseño 1: La simplicidad favorece la regularidad
Exigen estrictamente 3 operandos siempre, lo que permite que la circuitería del procesador sea predecible, más rápida y más barata de fabricar
 ^vLyNF2NQ

También obedecen al Principio de Diseño 2: Más pequeño es más rápido
Operan exclusivamente sobre el banco de 32 registros, ya que si el procesador tuviera que buscar entre miles de registros, la señal eléctrica tendría que viajar físicamente más lejos, haciendo que el ciclo de reloj sea más lento.

Al tener los datos en registros, las operaciones son rapidísimas y consumen mucha menos energía que si tuvieran que ir a buscar operandos a la memoria RAM. ^4uJtDNIK

Como usar constantes pequeñas es algo de todos los días al programar, incrustar el número directamente en la instrucción evita la necesidad de perder tiempo yendo a buscar ese dato a la memoria RAM con una instrucción Load ^RIW53ys1

Formato  ^OhijPjDB

Inmediato ^tqTN3nuO

Rango inmediato ^x41UR3rh

Salto (en bytes) ^kOxa5rx1

Memoria ^TTvD0mWc

los operadores de memoria actúan como "camiones de mudanza" entre el procesador y la memoria RAM ^A8z2RRLu

Las instrucciones usadas para memoria son:
STUR (store)
LDUR (Load)
Se detallan mas adelante. ^6OtmGwlw

Utilizan el Formato D, el cual requiere un registro base y un número fijo de desplazamiento (offset) para calcular la dirección exacta en la RAM ^yhiLAA8j

    Formato  ^XtWmDsRu

Inmediato ^LpjKdejA

Rango inmediato ^Pplpm1kZ

Salto (en bytes) ^w36oIeWO

Límites de los 32 bits (words/ registros w). ^0DqzXmT9

Sin signo (+): el rango va desde 0 hasta 4.294.967.295 (2³²−1)

Con signo (complemento a 2): El rango va desde -2.147.483.648 
hasta 2.147.483.647 (−2³¹ a 2³¹−1) ^3dYRgnWa

Extension de signos ^Ut6SCd9s

Representar un numero usando más bits para preservar el valor númerico.

a veces, a la memoria se le puede pedir pocos datos (1 byte), pero hace que sobre
demasiado espacio (26 bits) a la izquierda. Tenemos que rellenar los bits si o si
(si no, da un numero random), entonces aparecen:

-LDURB (Load Unscaled Register Byte) - Relleno con ceros (Zero extended)
    - Rellena los espacios vacions con 0's.
    ej: tengo 1111 1111, pero necesito rellenar hasta 32 bits, usar esta orden, llena
    el resto, conservando el valor.

-LDURSB (Load Unscaled Register SIGNED byte) - Extension de signo (Sign extended)
     -Es para numeros con signados, y teniendo la posibilidad de ser negativo.
    (en Complemento a 2, si un número empieza con 1, es negativo. Si empieza con 0, es positivo.)
     -Mira el primer bit de la izquierda de tu byte (el bit de signo). Si es un 1, rellena los 56 espacios
     vacíos con 1s, Si es un 0, rellena con 0s. ^kXQUpZeG

La memoria es un gran arreglo unidemiensional, donde la direccion actúa como índice de ese array,
comenzando en 0. Por ejemplo, en la imagen el tercer element es 2 y el contenido en memoria es 10. ^6r6broJe

fundamental para almacenar datos pesados, como arreglos y estructuras dinámicas 
Es posible acceder a cosas como DobleWord, Word, o Byte ^FQT4v4pu

Las dos instrucciones fundamentales son
     LDUR (Load, trae un dato de la memoria hacia un registro) 
    STUR (Store, guarda el dato de un registro en la memoria) ^shmKUGny

Acceso Estatico (ej: A[4]):
si estamos accediendo al indice 4, entonces deberiamos acceder al bit correspondiente a 4.
Indice 4, para el bit a acceder: 4 * 8 = 32
LDUR X9, [X6, #32] ^uBC7xtFn

EJ: f = -g - A[4] ^EFA6Va0S

f = X0, g = X1, Dirección base de A = X6. ^ZRC8JAyD

Acceso Dinámico (ej: A[i]):
ya que el indice i va cambiando por cada iteración, se debe multiplicar por 8 para dar un 
acceso real. Utilizamos la instruccion de LSL (Multiplicar). Para logar A[i]: ^aHh1lJqu

Acceso estatico y dinamico ^wEAKd8j8

Instrucciones ilegales: ^kpGdsNih

Offset fuera de rango: LDUR X1, [X2, #300]. 
Es ilegal porque el límite máximo del campo de 9 bits es el número 255 ¡El 300 no entra en los cables!

Inventar la sintaxis: LDUR X0, [X9, XZR]. 
Es ilegal porque la circuitería del Formato D exige estrictamente un número constante numérico como offset, físicamente no puede leer un tercer registro para usarlo como distancia ^ORydTvxz

coso greencard ^9Vxa9nuS

coso greencard ^UjA3QUs1

STUR (Store Register): Guarda el registro entero, es decir, un Doubleword (8 bytes / 64 bits). 
Uso: Para guardar números inmensos (long long int en C) o punteros de memoria
Al guardar 8 bytes, el siguiente dato en un arreglo estará a 8 posiciones de distancia
Ejemplo Legal: STUR XZR, [X11, #0]
Esta instrucción toma el registro XZR (que siempre vale cero) y guarda 64 bits de puros ceros en la memoria. Es el estándar para inicializar o "limpiar" arreglos enteros

STURW (Store Word): Guarda solo 4 bytes (32 bits)
Toma exactamente la mitad inferior del registro (del bit 31 al 0) y la guarda
Uso: Se utiliza típicamente para guardar números enteros normales (int en C).
Ejemplo Legal: STURW X1, [X2, #40]
Copia los 32 bits inferiores de X1 en la dirección X2 + 40.

STURH (Store Halfword): Guarda 2 bytes (16 bits), tomando los bits 15 a 0 del registro

STURB (Store Byte): Guarda 1 solo byte (8 bits), extrayendo únicamente los 8 bits situados más a la derecha del registro
Uso: Es fundamental para escribir cadenas de texto o caracteres (tipo char), ya que en el estándar cada letra ocupa exactamente 1 byte
Ejemplo Legal: STURB X11, [X12, #0]. Si en X11 tenías cargada la letra 'A' (cuyo valor ASCII es 65), esta instrucción escribe exclusivamente ese byte en la RAM ^zNlVmZyl

Instrucciones ilegales: ^4Kv3F1cm

Pasarse del límite (offset fuera de rango): STUR X10, [X11, #300].
El hardware te rebotaría esta instrucción automáticamente. Como tu rango de 9 bits llega hasta 255 positivo, el número 300 físicamente no entra en la caja de la instrucción

Ilegal por inventar registros que no existen: STURB X32, [X1, #0]. 
Falla porque el campo Rt solo tiene 5 bits (rango del 0 al 31). El registro X32 es un fantasma en LEGv8

Ilegal por usar la sintaxis o estructura incorrecta (Inventar offset de registro): STUR X9, [X10, X11]. Es ilegal en la arquitectura base LEGv8. El formato D exige estrictamente que el offset sea un número inmediato (constante sin escalar). ^ssjuFOmh

LSL (Logical Shift Left - Desplazamiento a la Izquierda): Agarra todos los bits y los empuja hacia la izquierda. Los espacios que quedan vacíos a la derecha se rellenan con ceros. (Desplazar hacia la izquierda equivale a multiplicar por potencias de 2 (2^i)). ^GG88dOn4

LSR (Logical Shift Right - Desplazamiento a la Derecha): Empuja los bits hacia la derecha. Los huecos de la izquierda se rellenan con ceros. (Es como dividir por 2). ^83FrNhhu

Operaciones de Desplazamiento ^xPescFMx

Inmediatos ^lLpCiT8c

Limites y saltos de los formatos ^v4SCgsRi

opcode (Operation Code): Es el campo más importante. Es el número que le dice a la unidad de control: "¡Ey! Soy un ADD, o soy un LDUR". Es la etiqueta que identifica la instrucción.

Rn (Register n): Es el primer operando de origen. Indica el número del registro (de 0 a 31) que contiene el primer dato.

Rm (Register m): Es el segundo operando de origen (en instrucciones tipo R)

Rd (Register destination): Es el registro donde se guardará el resultado de la operación.

Rt (Register target): Es el registro destino en instrucciones de memoria (LDUR) o el registro fuente en los STUR. Se llama diferente para que la unidad de control no se confunda.

shamt (Shift Amount): Se usa solo en operaciones tipo R. Le dice a la ALU cuántos lugares desplazar los bits (ej.: LSL X1, X2, #4 -> el 4 va acá).

immediate / address / offset: Es un valor numérico "hardcodeado".
entro de la misma instrucción. Es un número que ya viene listo para usar, evitando tener que ir a buscarlo a la RAM. ^LZ9ZKkKv

Ejemplo ^CAetAid8

Es probable que pueda venir una instruccion en hexadecimal.
De hexa, debas pasarla a binario para poder identificar el opcode.
en consecuencia, el tipo de instruccion y como estara formado ^F5cNHcLa

Memory Layout ^sBAR2zIx

La memoria es lineal, pero el sistema operativo y el compilador la dividen en secciones para organizar los datos.
Es una convencion de software, no una restriccion de hardware ^UMtVGDpV

Text Segment (Código):
    Contiene las instrucciones máquina (B, ADD, LDUR, etc.).
    Es de solo lectura. Está en la parte baja de la memoria.

Static Data:
    Contiene variables globales y constantes.
    Tienen una dirección fija durante toda la ejecución del programa.

Heap (Dinámica):
    Memoria para datos que crecen o decrecen (ej: malloc en C, new en Java).
    Crece hacia arriba (direcciones más altas).

Stack (Pila):
    Memoria para datos locales de las funciones (parámetros, registros salvados, dirección de retorno).
    Crece hacia abajo (direcciones más bajas).
    Nota clave: El Stack y el Heap crecen uno hacia el otro para aprovechar mejor el espacio de memoria libre entre ellos. ^PldrRBm8

Programas guardados en la compu ^GCXo9biZ

Concepto bisagra en la informatica: Para la computdora, un programa, los datos son 
todo la misma cosa.
Si se mira una memoria ram, se ve millones de ceros y unos. El procesador no sabe QUÉ 
representan, ya que todo convive en un mismo lugar y se lee igual. 
Por eso un programa como un compilador, puede agarrar texto y transformarlo en otro programa.
 
Las instrucciones son representadas en binario,  como los datos.
Las instrucciones y los datos son almacenados en memoria.
Los programas pueden operar sobre programas (Compiladores, linkers, etc) ^N0gcOqAd

Explicacion de por que pinchila podes bajar cualquier programa de cualquier cosa y anda en la compu re bien: ^zOmVxeIv

El ISA (Instruction Set Architecture) es un contrato/Manual de idiomas. Es la frontera entre el softare (codigo) y el Hardware (transitores fisicos del chip). Es un reglamento estricto.
"Los primeros 11 bits de una instruccion 10001011000, significa que la compu debe realizar una SUMA entre registros" ^16MCAvvT

Standarized ISAs ^Loo5hakr

Es un reglamento publico y fijo. Cualquier empresa puede agarrar el manual de ISA LEGv8, ARMv8 o x86 para poder construir un procesador fisico real que sea entendible.
Entonces, intel, amd o mac pueden crear chips totalmente distintos, pero mientras se respete el manual del ISA, se entiende la misma info  ^i2HpdiAd

Fábrica A arma un chip minúsculo para celulares que ahorra mucha batería. ^qNOBR1c2

Fábrica B arma un monstruo gigante para servidores que consume mucha energía pero va re rápido. ^IuplvNaj

Por dentro (Microarquitectura): Son totalmente distintos. Tienen cables diferentes, tamaños diferentes y velocidades diferentes. ^RHGG87B9

Por fuera (Interfaz): Los dos procesadores leen exactamente los mismos comandos binarios de 32 bits porque ambos hablan el idioma del estándar. ^GCNmFlvp

x86 tiene su propio ISA, y ARMv8 tiene su propio isa. Por eso, hay programas distintos para ARM y para x86 ^PWIsPDvY

LegV8 es una isa educativa. ^qmCH8qvL

Pseudoinstrucciones ^af47H6Hp

Las pseudoinstrucciones no son instrucciones reales del procesador, son atajos que te da el ensamblador. El ensamblador las "desarma" en instrucciones reales antes de generar el binario. ^L8CvuHSt

Procedimientos ^3QWMLCSt

Procedimiento de hoja (Leaf procedure) ^Yzsg7nMe

Es una unidad lógica. Tiene un nombre, recibe parámetros (datos de entrada) y puede devolver un resultado. Se usa para reutilizar código (escribís una vez, llamás mil veces) ^8w7lZpNw

Es un procedimiento que, al ejecutarse, no llama a ninguna otra función. Es un callejón sin salida en el "árbol de llamadas". Por eso se llama "hoja": porque es el extremo, no tiene ramificaciones. ^96tWxZ59

Dentro de main, tengo el bloque básico 1, luego un salto (BL), y luego el bloque básico 2. El procedimiento main contiene a esos bloques. ^9JFUY9zV

Los bloques básicos terminan donde hay una instrucción de salto (B, BL, CBZ, BR). ^vftcnVxv

si tiene procedimientos llamando a otros, es non-leaf procedure ^k4xIh6c1

*no es necesario leer pero bueno, curiosidad* ^iSL327Zg

instrucciones especiales / a tener en cuenta ^84NK2vMV

Skip en algunas instrucciones ^872wgwAa

Saber numero de instrucciones de un programa ^JkBKp27b

Calculo de espacio en memoria de un programa ^1RFpnL4U

Ocupación de memoria (en bytes) = Cantidad de instrucciones escritas × 4
Para saber la cantidad de instrucciones escritas, es contar las lineas, y luego ver:
cuantas estan en bucle (repiten: Xn Veces)
cuantas fueras de bucles: + x veces.
ej:
este programa tiene 6n + 4 instruciones ^lbnT8Hsn

## Embedded Files
cd041e2c148823f55f76502932b10f4142b08ebf: [[Pasted Image 20250514182428_426.png]]

a13f69304ebf938d68b750f1ae960694d6475e43: [[Pasted Image 20250514183249_129.png]]

d967aefc4105ee36d8b6355db199151a7ec6c13e: [[Pasted Image 20250606160945_339.png]]

11912157e975cd3ede532f9fdf61c9b7589dace8: [[Pasted Image 20250606162223_379.png]]

c3ba222583369a78b4f44b181116402c50d3a6cf: [[Pasted Image 20250606162832_308.png]]

8534c0f604ab0308ed6a69d60b93112148b0686b: [[Pasted Image 20250606162930_874.png]]

196a0aec1fdabdff07fc77ae094ecc5f004a3ccc: [[Pasted Image 20250606163044_854.png]]

b57c0eeed0bbe3ff526cd104faa69113f65c026a: [[Pasted Image 20250606163103_101.png]]

ba4da5a2c57cee5f727292939a7c7a0d7e9c7dcf: [[Pasted Image 20250606163112_794.png]]

d5b2565699d2c7fda22795e0ab42bf12f346482a: [[Pasted Image 20250606163124_898.png]]

bd7f9f7a9d0bfceb5139db4afb93ab244787a383: [[Pasted Image 20250606163137_876.png]]

42485ca34c081b7fc687021cfc4559c87aeea41e: [[Pasted Image 20250606163152_439.png]]

6c2f97e48bb2206afa07de7efc485bee14f78dbf: [[Pasted Image 20260517122104_755.png]]

2eca0684b98a4dfcc9b6f714ba400291e623ba0d: [[Pasted Image 20260517122126_850.png]]

505c5691e6a0401256e4313a56b644927b22802a: [[Pasted Image 20260517122610_503.png]]

8d40843c034ac82067a48201052f40beb99934b0: [[Pasted Image 20260517143242_204.png]]

5cbd8d1528d63e335cad3966d237cf3721604d65: [[Pasted Image 20260517145923_515.png]]

8a6353a430c776de14cece2501ac653e85abe3d9: [[Pasted Image 20260517221732_056.png]]

167bc3bc7c54962e8ca7653c99beb52fdc07ab6a: [[Pasted Image 20260517221826_227.png]]

bd001d9505e456918dd4c3a7bb3995583fa6d337: [[Pasted Image 20260517221838_399.png]]

aeabf86ef785948d0c198a2642647cc63c089a20: [[Pasted Image 20260517223358_203.png]]

5beeab9be66fff62710e4f84a6c52e19d1530973: [[Pasted Image 20260517225153_796.png]]

8acceb1a55efb74e83993d5536ddea3bbadf95c7: [[Pasted Image 20260518151929_851.png]]

bd8ab4adc11b9af143e6596e616243598f3e3636: [[Pasted Image 20260518152037_652.png]]

4cd0723072264567432144f6881a43d9ae51185a: [[Pasted Image 20260518152123_150.png]]

35736f63854c6a209d571fd81f53a5358828cd7b: [[Pasted Image 20260518154656_943.png]]

cd5faea6d60f5c4803ff8a58e6831603f6c28e02: [[Pasted Image 20260518155026_322.png]]

35dc8a4783595870e8a706c60c14a52b15c86f4f: [[Pasted Image 20260518155032_267.png]]

669ee7db306b710d28a0247e7b6c027ce224a0ea: [[Pasted Image 20260518155037_552.png]]

e6a3f4068a723945a2fd22a3213da9ff4be29227: [[Pasted Image 20260518155454_174.png]]

de1ad3795b27060e84e5a00b335f9d78c6c670f4: [[Pasted Image 20260518155845_861.png]]

66d913070bac341341502581dea18b2096108cf4: [[Pasted Image 20260518162356_596.png]]

c7808c101760faad458dc7167602e4d4cd1371ef: [[Pasted Image 20260518190326_797.png]]

cc105b2e352a4eea0e28c099d7278dfd01a60807: [[Pasted Image 20260518200427_777.png]]

419fc867f2bcac73f2c66084003a8f4dfaebe56a: [[Pasted Image 20260518200505_760.png]]

e06deedb2dc43de9ab9851ad30364be5f6707c83: [[Pasted Image 20260518200819_219.png]]

f12699cee2ccfff0c7a392c2dc75ff204785c160: [[Pasted Image 20260518201132_026.png]]

adf8a44e571e08fee1f7dd56b56ccecc11f5497d: [[Pasted Image 20260519090552_400.png]]

1d5d38ff2373771f15c85a71f35ae8379f017861: [[Pasted Image 20260519091046_079.png]]

89af7140d65bcdccc51a879ac9b0832aa7776ae0: [[Pasted Image 20260519091345_112.png]]

fd5b8be1940cf963e47f88e41c8ef142d9dd4e0f: [[Pasted Image 20260519091643_864.png]]

4f9e0ce6994455257ce297a543d46e623b1b5a93: [[Pasted Image 20260519091654_483.png]]

5d470ce56d67c892801495468cbdfd65ce330d53: [[Pasted Image 20260519091949_949.png]]

212a5895b9980c2a90f006e763db655254794f7c: [[Pasted Image 20260519093015_842.png]]

d955320dc7644a86b41d6a87c4d83ad94b3894e9: [[Pasted Image 20260519093323_884.png]]

00fdf71ff73a6b60e3c63f3fd95498040735240d: [[Pasted Image 20260519093532_251.png]]

8a4897a95026c6733ec14569d25108fc92c87f96: [[Pasted Image 20260519094451_118.png]]

68c07d6d31f5c5d9f264a97e14151380be873345: [[Pasted Image 20260519102008_280.png]]

c40a414d62f3fb112462f4e30ec417fae82dd5ef: [[Pasted Image 20260519102848_966.png]]

535c1d27e805080e016836ea819dd1b8ec8106a2: [[Pasted Image 20260519104353_897.png]]

452a2f0cabbbd239d517620ca8901dd0eb21b95c: [[Pasted Image 20260519105752_836.png]]

354e1cda658a74213dcfdf8210a03446ae340036: [[Pasted Image 20260519110230_416.png]]

736f6479cb8afae69e2331b74a59c8849515f212: [[Pasted Image 20260519110705_570.png]]

9b8636d2e44b753f264274d1f54924044bfa38d9: [[Pasted Image 20260519113456_154.png]]

e1d09f1a2c001001767f5bc1899eac5f5c176fe4: [[Pasted Image 20260519114323_585.png]]

d98d816c01ab94c938c58d38b394dc2a43aa4a18: [[Pasted Image 20260519114335_887.png]]

92a0ea069c6d96042d7becaa615c3285ca555b60: [[Pasted Image 20260519122448_118.png]]

b912fc099fe19f794a6ecc394bcfc5ca4443322b: [[Pasted Image 20260519122628_667.png]]

193acc52afae093d451c7a2330a7eba4fb9a9c4d: [[Pasted Image 20260519122657_057.png]]

493100eeb9e0e78ae8118b1f92f47024f4ecb6c3: [[Pasted Image 20260519123800_670.png]]

0a9da633156c3f3aeb12228956f2eb94034d49c4: [[Pasted Image 20260520144034_095.png]]

7116d2e74eebf8508967c8c1f3a34e4a0089a831: [[Pasted Image 20260520144149_813.png]]

efdd946181b6f5808ef7837fc4b9eb64851c5f26: [[Pasted Image 20260520144227_454.png]]

2298fa30e34889aa8b5b75237de8977ee03b60f6: [[Pasted Image 20260520154137_997.png]]

320137fdb75eb92219a3f9a966c520661592cf67: [[Pasted Image 20260521073216_846.png]]

bca514d848a18e7e115343626cbb97aded48f986: [[Pasted Image 20260520154506_782.png]]

a58cfcea1f392693ae33f2e1d6acde1b292551e4: [[Pasted Image 20260521083310_908.png]]

0b3fb93191f55af0e1d78283b099cc392767a6e9: [[Pasted Image 20260521083440_731.png]]

ab983b6f6ea0d814ccbdd4069a51f7e738a69f95: [[Pasted Image 20260521103343_016.png]]

f71c23aad3eecd9c716102584656957e2021f532: [[Pasted Image 20260521103638_934.png]]

8b052a99abe523e8ed73f944633ae6bce91ddd92: [[Pasted Image 20260521103701_617.png]]

a7f43be1a367f6b77cc5f3cb7ffba4a04c08982a: [[Pasted Image 20260521104801_623.png]]

87573c5e9f6a874cef16bcd6cb3215c7109a7c12: [[Pasted Image 20260521104810_101.png]]

544c601709b36d52db7e161cce92b3ef69cbd0af: [[Pasted Image 20260521104955_036.png]]

4ce43ad36a86e1fdcd9d5e87755c11eaf62e8848: [[Pasted Image 20260521105347_089.png]]

13819c78d822c7ba3b295a65db43b639f7a3fffd: [[Pasted Image 20260521105357_421.png]]

cdd28e3e32a13c75a7c864983f25cbf900d4c2a3: [[Pasted Image 20260521105436_488.png]]

ffc647dc64c20689e9e4a0e5a2bb3db764c78885: [[Pasted Image 20260523164421_513.png]]

ed249245e5a3440deef19222363ae4122dcd5cb8: [[Pasted Image 20260523164827_065.png]]

24e89e86fd530965442ee6524508aa32d137a769: [[Pasted Image 20260524125808_554.png]]

b07ba5691ba41f40d64fb57da9fa0295a3f4a1d7: [[Pasted Image 20260524130639_473.png]]

e06571373693e22d4de421d280e0fa767a74099b: [[Pasted Image 20260525190009_234.png]]

943abb7ba067bae6569595a0562bde4babdd42a1: [[Pasted Image 20260527125722_021.png]]

2472d6da5ed35969ea04c3c16b3e3682e293ba97: [[Pasted Image 20260527155057_440.png]]

2c9a6397757a8f68ac780b5a8ef04d6204996bfc: [[Pasted Image 20260527163145_095.png]]

9173d6e83686f7a1ca0edb3d51627957ae5832b5: [[Pasted Image 20260527164013_615.png]]

7753a7c61bb0b4bf4db05b61288e0565ddd48c97: [[Pasted Image 20260527164309_939.png]]

8a7b7bbe3791577f65cb882471b35f324b79e384: [[Pasted Image 20260527164327_417.png]]

a39553c1287541129d056b0a9e6a3c832abde34b: [[Pasted Image 20260527170154_911.png]]

d8e24b2e9b1f3cc2787dd7a19d25510618b2900b: [[Pasted Image 20260527170630_007.png]]

a3fd65311fe5440baaab1a570119e799289b589b: [[Pasted Image 20260527170701_842.png]]

52d3c72c051da8fc08a9b7d22f7afe1a946b54b3: [[Pasted Image 20260527170722_294.png]]

ececde93358aaa25e9dba3abed814761b748f3e4: [[Pasted Image 20260528074109_403.png]]

0d9453f42d167a842cb4b1f3666a55e2d46c79d1: [[Pasted Image 20260528074119_283.png]]

0cbfc68ba4ebbb29c4eb6907c5b414a2f3729afd: [[Pasted Image 20260528074130_418.png]]

50893cb43c2985e14d81491151e8ca88d7887fca: [[Pasted Image 20260528074140_131.png]]

dda75dd3d36aff268297b13f98c4d1dfc09f4ac1: [[Pasted Image 20260528075118_517.png]]

7cd8ca98017e269a4635a87cf26424567093f6a3: [[Pasted Image 20260528085328_850.png]]

5366c553e787154c3d72f8738813a027bf85fcbd: [[Pasted Image 20260531150259_445.png]]

f021856edc7598c25fa13504466ef1f51d5db827: [[Pasted Image 20260531150311_865.png]]

d732861103a32c0f2075b9ebc58a5873f61c635c: [[Pasted Image 20260601003933_570.png]]

f4a4f1b28ce302e1440017b3b2bae1707eb45e2b: [[Pasted Image 20260601004156_067.png]]

8f124b267c01617bdbda0cc6b8e157b37b6aaa40: [[Pasted Image 20260601005602_911.png]]

93fa91a23d8f22fd97d63222dc9045eb83db8cbe: [[Pasted Image 20260601005708_671.png]]

ab82f9693ffd8c4ea9d6731ab2426655142bc5d8: [[Pasted Image 20260601010049_399.png]]

22d69b91867c958a972f1895cf93a027882bdeb2: [[Pasted Image 20260601010239_483.png]]

6ba43bbefdfe53f7d118a9cfbb6b50593a8ecffc: [[Pasted Image 20260531141053_280.png]]

b21a134f57a2ade0e87bc68b3b76599460ab7e2e: [[Pasted Image 20260531141137_657.png]]

0910c7003cb7e22319d1851cb33240020a1a5e4f: [[Pasted Image 20260531141150_510.png]]

0910e33d28bbab85a3d7e393861301ad277d1ccf: [[Pasted Image 20260517224807_842.png]]

3341e9c147316be4e9f74785243d02f6c1433394: [[Pasted Image 20260519120829_142.png]]

1cb4f7962c1d065c678fa36f5cf271a3025c59a1: [[Pasted Image 20260519121016_255.png]]

5d7d2761b6aa7801aeb71fcb5cdaad238adb238c: [[Pasted Image 20260601112313_929.png]]

b6c8db3c2eec80e9336a93ebb1a9d91a8394c1c4: [[Pasted Image 20260601112442_300.png]]

85f22b8df1632ed4a9c7f6c80527fbebc318cb97: [[Pasted Image 20260601113627_599.png]]

8dd914617f799cbda2f0ba5a43f007a89ec923fa: [[Pasted Image 20260601170542_945.png]]

%%
## Drawing
```compressed-json
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=
```
%%