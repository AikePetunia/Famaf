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
Le dicen al hardware del procesador como tiene que cortar y agrupar esos 32 bits para entender la orden.
Por ejemplo, si al procesador le viene la orden: 
10011011 no sabe intepretar si es un numero, direccion de memoria, etc.
La plantilla dice, "Si ves los primeros 11 bits, y los ultimos 5 para saber en qué registro guardar el resultado".
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

Cuando se programa en alto nivel (C, Python), hablamos de "lógica", como un if (A > B and C === D). Pero en nivel procesador, y ISA. Las operaciones lógicas significa estricta y literalmente "Operaciones bit a bit" (Bitwise).
Se agarran dos chorizos de 64 bits, se pone un arriba del otro, y se compara columna por columna hacia abajo. ^gvTKajzn

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

LEER (LDUR) ^TqLO7WWF

GUARDAR (STUR) ^w6LwQ0a7

Si en C se escribe: save[i] = h
(save = x25, i = x22, h = x24)
el flugo seria igual que la lectura, pero con un stur. ^C7R5lS59

Realmente algo que no entiendo y tengo dudas, es si es posible
mezclar cosas como STURB con LDUR, (guardar 1 byte, y leer 8 bytes) ^JxtxUb2J

Operadores de construcción de hexadecimales. ^w2Px8cb8

Como una instrucción de LEGv8 tiene solo 32 bits totales, es imposible cargar un registro de 64 bits de una sola vez. Por eso, el procesador te da estas dos herramientas para armar el número como si fuera un rompecabezas de 4 piezas (cada pieza de 16 bits).
Imaginá que un registro de 64 bits es una repisa con 4 cajones de 16 bits cada uno: 0x0000 0000 0000 0000 ^7EUCD2mP

Escribe el valor de 16 bits en el cajón que le pidas (cajón 0, 1, 2 o 3) y pone todos los demás cajones en cero.
Es la instrucción de inicio. ^B9FVgCxQ

MOVZ (Move wide with Zero): "Borra todo y escribe". ^g5OaNcHm

MOVK (Move wide with Keep): "Mantén lo que hay y escribe". ^5osk5QS6

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

(de igual manera, no responde mi duda) ^3C2ihSm5

¿cuando saltamos? ^xrKLD4Ep

¿a donde viajamos? ^51PrxDZE

para calcular la direccion fisica de la ram (en Bytes) a la que tiene que mover el PC, está la formula: ^y2mk1jr4

Dirección real de salto = PC + (Inmediato x 4) ^wd9RizTN

Cómo calcula el viaje de memoria los Branches ^XX1RY2pP

La CPU calcula la distancia en cantidad de instruccion de donde esta parado hasta donde esta la etiqueda. Mediante el calculo matematico: ^FxCqaYxa

Dirección real de salto = PC + (Inmediato x 4) ^W9ehogeO

ahora el hardware sabe que tiene que saltar a la direccion 0x10 (la correcta, linea deseada) y no ir a 0x0c (la siguiente instruccion secuencialmente, una linea no deseada) ^my4lxcRU

delay loops ^xvSAD0Eb

solo tiene sentido
en ARMv8 ^Uy40Po4k

registro que usa para calcular
el acceso de memorai ^MxxQhBhb

direccion de 
registro (target) ^re8RhWzg

dt_adress ^AMjTw0Eb

Traducion de LEGv8 asm. Instruction a instrucción de maquina ^ESfzzSPS

B-type instructions ^NxOs1F2K

long story short: ^XZDI4qki

Carga ancha. Para armar números de 64 bits en varias pasadas (MOVZ, MOVK). ^corlrGLk

IM-format Instructions ^SRygBU0k

Far jumps ^n4jBFgjF

Si se quiere saltar a una de 64 bits que esta en la otra punta de la ram, y la instruccion no es suficiente:
Se usa BR (Branch To Register) y la instrucción MOVZ
Se plantea una solución de dos pasos.
ej: se quiere saltar a la direccion 0x0000 0000 4000 0000 ^UqX9TMfw

B / CBZ: Usan Branch Addressing (matemática de PC + offset). La dirección destino está adentro de la instrucción. Son limitados.

BR: Usa Direccionamiento por Registro. La dirección destino está afuera (en un registro). No tiene límite de distancia, puede saltar a cualquier parte de los 64 bits de memoria. ^NVAG3ABN

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
(Esta direccion se calcula rellenando 19 bits de 1's y pasarlo a hexa)
0011 1111 1111 1111 1111.
Según en que mundo de "bytes" vivimos (ej *4), es la direccion maxima alcanzada.  ^OuIjKFSy

Sabemos que la instruccion maxima de un b.inmd es de 26 bits (2²⁵-1 = 33.554.431 Instrucciones). Llegando hasta la direccion de 0x1FFF FFFF
(Esta direccion se calcula rellenando 18 bits de 1's y pasarlo a hexa)
0001 1111 1111 1111 1111 1111 1111 ^iZjvfQk7

Alcance_max(b.cond) = 0x3FFFF * 4 = 0xFFFFC ^5PND24XU

Distancia en Bytes = 0x1FFF FFFF * 4 = 0X7FFF FFFC ^NE18c85i

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

Números signados y no signados ^0DqzXmT9

Un ser humano, esta hecho para pensar en base 10. Pero una computadora, en base 2.
Ej: 123 base 10 = 1111011 base 2. LEGv8 doyble word es 64 bits long, representando 2⁶⁴ patrones de 64 bits diferentes

Sin signo (+): el rango va desde 0 hasta 4.294.967.295 (2³²−1)

Con signo (complemento a 2): El rango va desde -2.147.483.648 hasta 2.147.483.647 (−2³¹ a 2³¹−1)

El punto principal es que la computadora puede representar numeros de manera 
positiva y negativa, con sus pros y contras en cualquier opciones ^3dYRgnWa

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

Problema: Se trae un dato de la memoria (que puede ser chico) y se lo mete en un registro gigante de 64 bits. Hay que rellenar el espacio sobrante a la izquierda.

Regla del Salto (Stride): La cantidad de bytes que traés es la misma cantidad que le tenés que sumar al puntero (ej. X0) en la siguiente vuelta del bucle. ^CXN7eoin

1. Tamaño Nativo (Sin Relleno):

    LDUR (Doubleword): Trae los 8 bytes completos (64 bits). Calza exacto en el registro, no necesita extender nada. → Salto en bucle: +8

2. Sin Signo (Zero-Extend) - Rellenan con Ceros:
Asumen que el número es siempre positivo o un texto. Los bits sobrantes a la izquierda se llenan con 0.

    LDURB (Byte): Trae 1 byte (8 bits). Rellena 56 ceros. → Salto en bucle: +1

    LDURH (Halfword): Trae 2 bytes (16 bits). Rellena 48 ceros. → Salto en bucle: +2

3. Con Signo (Sign-Extend) - Copian el Bit de Signo:
Asumen que es un número matemático (Complemento a 2). Miran el primer bit del dato traído: si es 1, rellenan con unos; si es 0, rellenan con ceros. Esto preserva el valor (ej. que un -5 siga siendo -5). Llevan una "S" en el nemónico.

    LDURSB (Signed Byte): Trae 1 byte (8 bits). Extiende 56 bits de signo. → Salto en bucle: +1

    LDURSH (Signed Halfword): Trae 2 bytes (16 bits). Extiende 48 bits de signo. → Salto en bucle: +2

    LDURSW (Signed Word): Trae 4 bytes (32 bits). Extiende 32 bits de signo. → Salto en bucle: +4 ^U0UNaK4f

Problema: Pasa exactamente lo contrario que con los Loads. Tenés 64 bits en el registro y los querés meter en un cajoncito de memoria más chico.

La Regla de Oro: NO EXISTE el signo! No vas a ver un STURSB. ¿Por qué? Porque el procesador simplemente corta (trunca) el registro, agarrando los bits de más a la derecha y descartando (ignorando) la parte izquierda sobrante. A la memoria no le importa el signo, solo guarda los bits crudos. ^385oQdZc

STURB (Byte): Agarra los últimos 8 bits (1 byte) del registro y los guarda. Ignora los 56 bits restantes. → Salto en bucle: +1

STURH (Halfword): Agarra los últimos 16 bits (2 bytes) del registro y los guarda. Ignora los 48 bits restantes. → Salto en bucle: +2

STURW (Word): Agarra los últimos 32 bits (4 bytes) del registro y los guarda. Ignora la mitad superior. → Salto en bucle: +4

STUR (Doubleword): Guarda los 64 bits (8 bytes) enteros del registro en la memoria. → Salto en bucle: +8 ^XfqXGCiT

pag 122 pdf computer organization and design arm edition  ^YTNQJcjM

LEGv8 Addressing for Wide Immediates and Addresses ^zK9V6cCh

Los Registros "X" SIEMPRE miden 64 bits (8 Bytes) ^mTpVNspH

Las Instrucciones SIEMPRE miden 32 bits (4 Bytes) ^4SxP7v76

Pseudoinstrucciones ^6ggP19Y2

Las pseudoinstrucciones no son instrucciones reales del procesador, son atajos que te da el ensamblador. El ensamblador las "desarma" en instrucciones reales antes de generar el binario. ^79vkfpOx

Las operaciones logicas son distintas:
no les importa el número entero, sin o que operan bit por bit de forma individual.
Es útil realizar este tipo de operaciones por que sirve para "Extraer e insertar grupos de bits en una palabra". (Mascaras) ^9k3dPu3m

AND / ANDI: Compara los bits uno por uno. El resultado es 1 solo si ambos bits originales son 1. Se usa mucho para "apagar" bits que no te interesan (ponerlos en cero) y dejar prendidos solo los que querés analizar. ^tecxs2AF

Aplica tabla de 
verdad AND a cada bit. ^Sk9kYPSH

OR / ORR / ORI: Compara los bits. El resultado es 1 si al menos uno de los bits es 1. Se usa mucho para "encender" (forzar a 1) ciertos bits sin modificar el resto. ^rYzdd3EV

Aplica tabla de 
verdad OR a cada bit. ^8DUFqev7

EOR / EORI (Exclusive OR): Es la famosa compuerta XOR. Da 1 si los bits son diferentes. El apunte te hace una aclaración clave acá: en otros lenguajes existe la operación NOT (~) para invertir todos los bits (cambiar ceros por unos y viceversa). En LEGv8 no existe la instrucción NOT, se logra usando EOR contra una máscara llena de unos. ^MAi9SY2Z

Aplica tabla de 
verdad XOR a cada bit. ^HND4Dnn0

Procedimientos ^Cr9mK7pW

Procedimiento de hoja (Leaf procedure) ^3AFOm7Kh

Es una unidad lógica. Tiene un nombre, recibe parámetros (datos de entrada) y puede devolver un resultado. Se usa para reutilizar código (escribís una vez, llamás mil veces) ^4qzV3C0y

Es un procedimiento que, al ejecutarse, no llama a ninguna otra función. Es un callejón sin salida en el "árbol de llamadas". Por eso se llama "hoja": porque es el extremo, no tiene ramificaciones.
si tiene procedimientos llamando a otros, es non-leaf procedure ^KrBQnei2

Dentro de main, tengo el bloque básico 1, luego un salto (BL), y luego el bloque básico 2. El procedimiento main contiene a esos bloques. ^7hqnP0l7

Los bloques básicos terminan donde hay una instrucción de salto (B, BL, CBZ, BR). ^nikmTb3A

ej:
#DEFINE N 1 << 10 
== 1 x 2¹⁰ = 1024 (1kb)
1 << 30 = 1 GB

#DEFINE n 1024 >> 3
== 1024/2³ = 1024/8 = 128 ^N7U1bvzj

Bloques básicos ^OL5cjsbl

Es un transformador de valores. Es una "Caja negra matematica".
Entran registros con ciertos valores por arriba, sufren un par de sumas y restas, 
y salen valores nuevos por abajo. Al no haber condicionales en el medio ni nada, 
el compilador puede optimizar esa matemática al máximo para que corra rapidísimo.

No tiene bucles, condicionales, etiquetas intermedias o saltos, es 100% secuencial. 
Los únicos saltos que tiene son:
al inicio: para que otro bloque pueda "saltar" acá
al final: CBZ/B, para decidir a que otro bloque continuar. Pero termina ahí ^yBoXefiK

no es un "archivo aparte" ni un "procedimiento aparte". Es simplemente una sección de código que el compilador identifica como indivisible. ^gwk2Lb9f

Para que un trozo de código sea un bloque básico, tiene que cumplir estas dos condiciones: ^5Z5gAngi

Entrada única: No puede haber saltos (labels) que caigan en medio del bloque; todos los saltos deben ir a la primera instrucción. ^KmNSUnsa

Salida única: No puede haber saltos hacia afuera en el medio del bloque; el único salto permitido es el de la última instrucción. ^lomimUkj

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

452c9b5e28ba6438f4cfbe8c629906c73025d6a7: [[Pasted Image 20260602122556_824.png]]

d68f2a6599e66185bc425d7c05d4861efb27eea4: [[Pasted Image 20260602122611_174.png]]

2bbedbe0afbdb5f3f22ca4b11a3b706d6d60d939: [[Pasted Image 20260602123413_381.png]]

c76aa68be147799bcafbeae0dad5baa6e7aa2f3a: [[Pasted Image 20260602123423_413.png]]

6ada4d189237b056be85cb239af01703100426e6: https://cat-milk.github.io/Anime-Girls-Holding-Programming-Books/static/e1657d0a5c4aab06c7089ec771c82bb2/ed3fb/Takami_Chika_Stressing_On_Assembly.png

96b2b334a9ee59a586c1c3bfda46bec2704f6a18: [[Pasted Image 20260602202547_580.png]]

%%
## Drawing
```compressed-json
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=
```
%%