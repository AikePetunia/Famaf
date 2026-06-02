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
instrucciones complejas (CISC),  siendo desordenadas y midiendo entre 1 y 15 bytes. 
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
Usan el Formato R (los formatos se ven mas adelante en el apunte)
Además, en assembly solo se opera 1 cosa por instruccion. ^FEJCIR3R

Principio de diseño 1: La simplicidad favorece a la regularidad ^byLky3KL

Registros ^je25KLPf

Se usan para hacer cálculos matemáticos y lógicos puros, como
ADD, SUB, AND o ORR, 
directamente dentro del procesador y sin tocar la memoria RAM. 
Son primitivos en el diseño de hardware,  y se pueden pensar como los ladrillos de la construcción de la computadora.

Exclusivas de registros: Solo operan usando los 32 registros físicos (de 64 bits cada uno) disponibles en la arquitectura LEGv8

Tres operandos: Siempre exigen exactamente un registro de destino (para guardar el resultado) y dos registros de origen (para leer los datos)

Alta velocidad: Al tener toda la información ya "a mano" dentro del procesador y no necesitar ir a buscar datos a la memoria, son las operaciones más rápidas del sistema ^BG8GWkc3

Principio de diseño 2: Lo pequeño es rápido ^BwfVYavO

Registros vs Memoria ^uOVZEn8m

-Se accede mucho mas rapido a los registros que la memoria.
-Las operaciones en datos de memoria requiere cargas y almacenamiento.
    -Entre más instrucciones, mas debe ser ejecutado
-El compilador debe usar registros lo mas posible para guardar variables.
    -Solo se debe almacenar en memoria las variables menos utilizadas.
    -La optimizacion de registros es importante. ^jLunPi0X

Operaciones aritmeticas inmediatas/constantes ^yxU6khos

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
Si necesitás cambiarle el signo a una variable (por ejemplo, f = -g), usás el registro especial XZR, que siempre vale cero. 
La instrucción sería SUB X0, XZR, X1  - La máquina lee esto como 0 - X1.

Copiar datos entre registros:
Si querés copiar el valor de X1 adentro de X2, podés sumarle cero haciendo
ADD X2, X1, XZR ^3HHNPT9I

R[Rd] = R[Rn] +/- R[Rm] ^SeBcjH0Q

En LEGv8, estas instrucciones nacen de este principio ya que
exigen estrictamente 3 operandos siempre, lo que permite que la circuitería del procesador sea predecible, rápida y  barata de fabricar ^vLyNF2NQ

También obedecen al Principio de Diseño 2: Más pequeño es más rápido
Operan exclusivamente sobre el banco de 32 registros, ya que si el procesador tuviera que buscar entre miles de registros, la señal eléctrica tendría que viajar físicamente más lejos, haciendo que el ciclo de reloj sea más lento.

Al tener los datos en registros, las operaciones son rapidísimas y consumen mucha menos energía que si tuvieran que ir a buscar operandos a la memoria RAM. ^4uJtDNIK

Como usar constantes pequeñas es algo de todos los días al programar, incrustar el número directamente en la instrucción evita la necesidad de perder tiempo yendo a buscar ese dato a la memoria RAM con una instrucción Load ^RIW53ys1

Formato  ^OhijPjDB

Inmediato ^tqTN3nuO

Rango inmediato ^x41UR3rh

Salto (en bytes) ^kOxa5rx1

Memoria ^TTvD0mWc

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

Los arreglos y estructuras, son muy complejas y no pueden ser contenidas en registros. Para representar estas estructuras y arreglos, se guardan en memoria, ya que en los registros manejan poca cantidad de datos, en cambio en memoria podes mantener billones de datos. 
La memoria es un gran arreglo unidemiensional, donde la direccion actúa como índice de ese array,
comenzando en 0. Por ejemplo, en la imagen el tercer elemento es 2 y el contenido en memoria es 10.
los operadores de memoria actúan como "camiones de mudanza" entre el procesador y la memoria RAM.
Las instrucciones de transferencias de datos usadas:
STUR (Store)
LDUR (Load) ^6r6broJe

La instrucción de transferencia de datos que copia datos de memoria hacia un registro es "Load".
Su formato/sintaxis es de operador seguida por el registro a ser cargado, luego un registro + una constante para acceder a memoria. ^shmKUGny

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

Concepto bisagra en la informatica: Para la computadora, un programa, los datos son 
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

Calcular instrucciones de un programa y su espacio ^1RFpnL4U

Ocupación en Memoria RAM: A la memoria no le importan los bucles. Si tu código tiene 10 líneas escritas (10 instrucciones), ocupará en la RAM siempre 10×4=40 bytes. No importa si un while hace que se repitan un millón de veces, físicamente siguen siendo solo 10 renglones guardados en el "Text Segment".

Cantidad de instrucciones ejecutadas: La fórmula de 6n+4 que armaste sirve para calcular el rendimiento o tiempo de CPU. Eso cuenta el flujo dinámico de cuántas veces pasaste por la ALU, pero no el espacio que ocupa el programa. ^lbnT8Hsn

 El tamaño de un registro  en LEGv8
es de 64 bits; curpos de 64 bits llamados
"double word" y 32 bits llamados "words".
Se usan 32 registros por el: ^ZQJOm57f

Todas las computadoreas deben de ser capaces de operar artmeticamente. ^mQURnqSj

2.3 "Operands of the computer hardware" ^aMwaudpl

Para darle órdenes al hardware de una computadora, debes hablar su idioma. Las palabras del lenguaje de una computadora se denominan instrucciones, y a su vocabulario se le llama conjunto de instrucciones. En este capítulo, verás el conjunto de instrucciones de una computadora real, tanto en la forma en que lo escriben las personas como en la forma en que lo lee la computadora. Introduciremos las instrucciones de manera descendente (top-down). Partiendo de una notación que se asemeja a un lenguaje de programación restringido, la refinaremos paso a paso hasta llegar a ver el lenguaje real de una computadora. El Capítulo 3 continúa nuestro descenso, revelando el hardware para la aritmética y la representación de números de punto flotante.

Podrías pensar que los lenguajes de las computadoras son tan diversos como los de las personas, pero en realidad son bastante similares, más parecidos a dialectos regionales que a idiomas independientes. Por lo tanto, una vez que aprendes uno, es fácil asimilar los demás. El conjunto de instrucciones elegido es ARMv8, que proviene de ARM Holdings plc y fue anunciado en 2011. Por razones pedagógicas, en este libro utilizaremos un subconjunto de las instrucciones de ARMv8. Usaremos el término ARMv8 cuando hablemos del conjunto de instrucciones completo y original, y LEGv8 cuando nos refiramos al subconjunto didáctico, que por supuesto se basa en el conjunto ARMv8 de ARM. (LEGv8 pretende ser un juego de palabras con ARMv8 ["leg" es pierna, "arm" es brazo], pero también es un retroacrónimo de "Lessen Extrinsic Garrulity" [Reducir la locuacidad extrínseca]). Identificaremos las diferencias entre ambos a lo largo de las explicaciones. Ten en cuenta que este capítulo y varios otros incluyen una sección para dar un panorama general del resto de las características de ARMv8 que no están presentes en LEGv8 (ver Secciones 2.19, 3.8 y 5.14).

Para demostrar lo fácil que es aprender otros conjuntos de instrucciones, daremos un vistazo rápido a otros tres conjuntos populares:

    MIPS es un ejemplo elegante de los conjuntos de instrucciones diseñados desde la década de 1980.

    ARMv7 es un conjunto de instrucciones más antiguo, también de ARM Holdings plc, pero con direcciones de 32 bits en lugar de los 64 bits de ARMv8. En 2015 se fabricaron más de 14 mil millones de chips con procesadores ARM, lo que los convierte en los conjuntos de instrucciones más populares del mundo. Irónicamente, en opinión de los autores, y como se verá más adelante, ARMv8 está más cerca de MIPS que de ARMv7.

    El ejemplo final es el Intel x86, que impulsa tanto a las PC como a la Nube de la era post-PC.

Esta similitud entre los conjuntos de instrucciones ocurre porque todas las computadoras están construidas con tecnologías de hardware basadas en principios subyacentes similares, y porque existen algunas operaciones básicas que todas las computadoras deben proporcionar. Además, los diseñadores de computadoras tienen un objetivo común: encontrar un lenguaje que facilite la construcción del hardware y del compilador, maximizando al mismo tiempo el rendimiento y minimizando el costo y el consumo de energía.

Este objetivo es una tradición muy antigua; la siguiente cita fue escrita antes de que siquiera se pudiera comprar una computadora, y es tan cierta hoy como lo era en 1947:

    "Es fácil ver, mediante métodos lógico-formales, que existen ciertos [conjuntos de instrucciones] que, en abstracto, son adecuados para controlar y provocar la ejecución de cualquier secuencia de operaciones... Las consideraciones realmente decisivas desde el punto de vista actual, al seleccionar un [conjunto de instrucciones], son más de naturaleza práctica: la simplicidad del equipo exigido por el [conjunto de instrucciones] y la claridad de su aplicación a los problemas realmente importantes, junto con la velocidad con la que maneja dichos problemas."

    — Burks, Goldstine y von Neumann, 1947

La "simplicidad del equipo" es una consideración tan valiosa para las computadoras de hoy como lo era para las de la década de 1950. El objetivo de este capítulo es enseñar un conjunto de instrucciones que siga este consejo, mostrando tanto cómo se representa en el hardware como la relación entre los lenguajes de programación de alto nivel y este lenguaje más primitivo. Nuestros ejemplos están en el lenguaje de programación C; la Sección 2.15 muestra cómo cambiarían para un lenguaje orientado a objetos como Java. ^aRMCodZ7

Instrucciones de transferencia de datos:
comandos que mueven datos entre memoria y registros. ^m1WmAf12

Computers divide into those that use the address of the leftmost or “big end” byte as the doubleword address versus those that use the rightmost or “little end” byte. LEGv8 can work either as big-endian or little-endian. Since the order matters only if you access the identical data both as a doubleword and as eight bytes, few need to be aware of the “endianess”. ^rGHFvO92

La instruccion de copia de datos de un registro a memoria, es STUR.
Su formato/sintaxis es el nombre de la operacion, seguido por el registro a ser guardado, luego el registro base, y el offset  del elemento seleccionado.  ^R4m571HJ

a[i] = VALOR ^hKTIcPGT

VALOR = a[i] ^gTycxD4U

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

e0f9b5d92eb24bdd9ec3e5ed265d2a5f3a58890e: [[Pasted Image 20260602111528_528.png]]

b87f0b7640670717a46457459e945bdc4e2fbdad: [[Pasted Image 20260602111704_685.png]]

6f429fbdb912047f83286985d881bf679124da11: [[Pasted Image 20260602111726_061.png]]

5467663de6a2a487abb13748d86aa4c14b66796e: [[Pasted Image 20260602112117_012.png]]

fc0a13adcae93fd7165b05bb44027a796c500f1e: [[Pasted Image 20260602122240_990.png]]

723490a23070dabc967a3112f0ab526f05fa5cb1: [[Pasted Image 20260602122404_975.png]]

e8cbe610d9186157c3b66641937d00cb65e576f6: [[Pasted Image 20260602122420_539.png]]

6ada4d189237b056be85cb239af01703100426e6: https://cat-milk.github.io/Anime-Girls-Holding-Programming-Books/static/e1657d0a5c4aab06c7089ec771c82bb2/ed3fb/Takami_Chika_Stressing_On_Assembly.png

452c9b5e28ba6438f4cfbe8c629906c73025d6a7: [[Pasted Image 20260602122556_824.png]]

d68f2a6599e66185bc425d7c05d4861efb27eea4: [[Pasted Image 20260602122611_174.png]]

2bbedbe0afbdb5f3f22ca4b11a3b706d6d60d939: [[Pasted Image 20260602123413_381.png]]

c76aa68be147799bcafbeae0dad5baa6e7aa2f3a: [[Pasted Image 20260602123423_413.png]]

%%
## Drawing
```compressed-json
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=
```
%%