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

Es la arquitectura estándar en teléfonos y en mac. Usa el diseño de instrucciones reducidas y simples (RISC), siendo muy ordenado y todas sus instrucciones miden 32 bits, siendo rapido y facil.
Siendo un chip tan simple, un chip arm consume 1w. Es capaz de manejar internamente datos de 64 bits, a pesar de seguir teniendo instrucciones de 32bits. ^Wonm1Szv

Es un subconjunto educativo de ARMv8, una version "Lite".
Las instrucciones son codificadas en binario, llamado codigo de maquina, siendo LegV8 es una isa educativa. ^YDgZ7UiO

Operaciones Aritmeticas ^GRByUQc5

ADD x0, x1, x2 // x0 = x1 + x2
SUB x0, x1, x2 // x0 = x1 - x2 ^Pqgeydkv

Las operaciones aritmeticas operan EXCLUSIVAMENTE entre registros. 
Usan el Formato R (los formatos se ven mas adelante en el apunte)
Además, en assembly solo se opera 1 cosa por instruccion. ^FEJCIR3R

Principio de diseño 1: La simplicidad favorece a la regularidad ^byLky3KL

Registros ^je25KLPf

Los registros se encuentran ya en el procesador y sirven para cálculos matemáticos-lógicos puros. se pueden pensar como los ladrillos de la construcción de la computadora.
(ADD, SUB, AND, ORR, EOR + INMEDIATOS/FLAGS), son algunas instrucciones.
No tocan la memoria RAM puesto que tardarían mucho en traer o operar datos. Es caro.

Son primitivos en el diseño de hardware,  y 
Exclusivas de registros: Solo operan usando los 32 registros físicos (de 64 bits cada uno) disponibles en la arquitectura LEGv8

Tres operandos: Siempre exigen exactamente un registro de destino (para guardar el resultado) y dos registros de origen (para leer los datos)

Alta velocidad: Al tener toda la información ya "a mano" dentro del procesador y no necesitar ir a buscar datos a la memoria, no tienen latencia. ^BG8GWkc3

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
-El número constante más grande que acepta es 2¹²-1 (4095) (si tengo > está ilegal)
-Formato I
-No acepta inmediatos negativos, pasan por un bloque de Zero-Extend,
esto significa que el procesador asume obligatoriamente que sus 12 bits 
son un número positivo sin signo.  ^Yroc3vzQ

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

Las primeras computadores, operaban en palabras completamente en vez de bit a bit. Examinar los caracteres de una palabra, que son 8 bits, es un ejemplo de una operación lógica. 

Cuando se programa en alto nivel (C, Python), hablamos de "lógica", como un if (A > B and C === D). 
Pero en nivel procesador, y ISA. Las operaciones lógicas significa estricta y literalmente "Operaciones bit a bit" (Bitwise).
Se agarran dos chorizos de 64 bits, se pone un arriba del otro, y se compara columna por columna hacia abajo. ^gvTKajzn

Crear condicionales y "saltos" ^czzl6dp7

Label's ^oaSOUfHe

El procesador, lee el codigo de manera secuencia (linea 1, 2, 3...). Las instrucciones de salto (Branches) sirve para romper la secuencia. "Deja de leer acá y saltá a esta otra linea". sirve para los if-else, while, for.
En ensamblador, no se salta a "linea 45". se escriben nombres inventados al lado de una instruccion. El ensamblador luego se encarga de calcular matematica cuantos pasos hay hasta esa etiqueta. ^e4s8X7LL

CBZ (Compare and Branch on Zero - Salto si es Cero):
Mecánica: El procesador revisa el registro indicado, si el valor guardado es exactamente 0, el programa interrumpe la secuencia y pega un salto hacia
la etiqueta que le marcaste. Si no es 0, ignora la instrucción y sigue de largo con la línea de abajo.

Equivalente en C: if (registro == 0) { goto L1; }
Uso típico: Se usa muchísimo para salir de los bucles (cuando un contador llega a cero) o para evaluar 
si una condición fue falsa (en lógica booleana, 0 es Falso).

CBNZ (Compare and Branch on Not Zero - Salto si NO es Cero).
Mecánica: Es la hermana gemela de CBZ, pero hace exactamente lo contrario. 
Solo va a pegar el salto si el registro tiene cualquier número que no sea cero (ya sea positivo o negativo). 
Si el registro vale cero, la instrucción se ignora y el código sigue hacia abajo.

Equivalente en C: if (registro != 0) { goto L1; }

Uso típico: Se usa para "quedarse" adentro de un bucle while mientras una condición siga siendo 
verdadera o mientras queden elementos por procesar.

B (Branch - Salto Incondicional)
Mecánica: Este es un salto ciego. 
El procesador llega a esta línea, no revisa ningún registro, no pregunta nada, y salta obligatoriamente a la etiqueta.

Equivalente en C: Un clásico goto.

Uso típico: Es fundamental para saltar por encima de los bloques else (para que no se ejecuten por accidente si ya entraste al if), 
o al final de un bucle while para forzar al programa a volver arriba de todo y empezar el ciclo de nuevo. ^yYgzK27N

Es un "Lenguaje" de Assembly ^jnVy0fE9

Crear bucles ^kmLdznpw

Flags ^SXHOWQIR

Los procesadores en tienen por dentro funciona por un sistema de flags/codigos de condicion (CPSR O PSTATE):
N (Negative): Se prende (1) si el resultado de la cuenta matemática fue negativo.

Z (Zero): Se prende (1) si el resultado de la cuenta fue exactamente Cero.

V (Overflow): Se prende (1) si estabas sumando/restando números muy grandes con signo y la 
capacidad del registro se "desbordó" (dio un resultado matemáticamente incorrecto).

C (Carry): Se prende (1) si la operación generó un acarreo (como cuando sumás 9+1 y te "llevás" el 1 a la siguiente columna).

Inmediatamente despues de activar flags, va una: ^FLQtrcMF

Las comparaciones en legv8 normalmente se hacen en dos pasos. ^5wgaS2k3

Operaciones códigos condicionales ^yP6t7MFa

Hay códigos de condiciones para operaciones aritméticas, tales como:
ADDS,
ADDIS,
ANDS,
ANDIS,
SUBS, <- Mas usado, por que permite saber A = B o A < B 
SUBIS

Hace la cuenta aritmetica y, Setea (actualizá) los foquitos del panel según cómo te dio el resultado. Si o si necesita comparar algo con algo y el skip de estas secuencias NO existe
Que: 
    S (Set flags) opera entre dos registros y actualiza las flags, EJ: SUBS X1, X2, X3
    IS (Immediate + set flags) opera un registro contra un numero suelto (inmediato) y actualiza las flags ^LY2pTrQr

Branch Flags ^Nxu2tNBS

Branch Equal (mira Z) ^BWUj1T3e

Branch Signed (Números positivos o negativos) ^3FM46alG

B.EQ (Equal - Igual): Salta si el foquito Z está prendido (Z=1). Porque si restaste A - B y dio cero, significa que A y B son iguales. ^MDb5dEs2

B.NE (Not Equal - Distinto): Salta si el foquito Z está apagado (Z=0). ^WEApmKb8

B.LT (Less Than - Menor que): Salta si el primero es estrictamente menor que el segundo (<). ^DVtKO6Pp

B.LE (Less or Equal - Menor o igual): Salta si es menor o igual (<=). ^dBFYRZeW

B.GT (Greater Than - Mayor que): Salta si es estrictamente mayor (>). ^b0zb9ZdS

B.GE (Greater or Equal - Mayor o igual): Salta si es mayor o igual (>=). ^eTpzvjuk

Branch Unsigned (Números positivos) ^sX5cMxv5

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

Los branches no son inmediatos. Necesitan una flag previa para funcionar. Los CBZ o CBNZ si son inmediatos. ^ewKoRBhN

Branches Adressing ^Qr7QbKcl

El branch adressing son saltos el linea. Similares como llamar a una funcion (y en consecuencia, ir a su ejecucion) o 
como un break mismo de un loop si la condicion no se cumplio.
para calcular la direccion fisica de la ram (en Bytes) a la que tiene que mover el PC, está la formula: ^AIjlejbx

La instrucción B (Branch) -> Viaje de IDA
Es un desvío sin retorno. Saltás a una etiqueta y te quedás ahí. No dejas ninguna pista de dónde venías.Para qué se usa: Estructuras internas como if, else, break o bucles while.Analogía: Salir de tu casa para mudarte a otro barrio. No te importa el camino de regreso, tu nueva vida sigue allá. ^l2gAJG43

La instrucción BL (Branch with Link) -> Viaje de IDA Y VUELTA
Se usa pura y exclusivamente para Llamar a Funciones (Procedimientos). Saltás a un pedazo de código ajeno, pero necesitás obligatoriamente volver al lugar exacto desde donde te fuiste cuando esa función termine. 
La "L" de Link: Significa que el hardware, en el mismo instante en que salta, guarda de forma automática la dirección de la línea que estaba justo abajo en el registro LR (Link Register / X30). Ese es tu "boleto de vuelta".
Analogía: Salir de tu casa para ir al médico. Llevás la dirección de tu casa anotada en un papel (LR). Cuando el médico te termina de revisar (BR LR), mirás el papel y volvés a tu casa ^mpBmDok6

(de igual manera, no responde mi duda) ^3C2ihSm5

¿cuando saltamos? ^xrKLD4Ep

¿a donde viajamos? ^51PrxDZE

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

Operaciones con hexadecimales. !! ^1riWptHM

B.Inmediate ^TEpVMtdW

B.cond ^zZK1113H

Calculo en Conditional Branches ^rv4LhFOz

Calculo en Branch Inmediatas ^yJa1t5aU

Sabemos que la instruccion maxima de un b.cond es de 19 bits (2¹⁸-1 = 262.144 Instrucciones). Llegando hasta la direccion de 0x3FFF F
(Esta direccion se calcula rellenando 18 bits de 1's y pasarlo a hexa)
0011 1111 1111 1111 1111.
Según en que mundo de "bytes" vivimos (ej *4), es la direccion maxima alcanzada.  ^OuIjKFSy

Sabemos que la instruccion maxima de un b.inmd es de 26 bits (2²⁵-1 = 33.554.431 Instrucciones). Llegando hasta la direccion de 0x1FFF FFFF
(Esta direccion se calcula rellenando 25 bits de 1's y pasarlo a hexa)
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

Los shifts mueven los 64 bits de un registro y es su limite físico, moviendo bits hacia la derecha o izquierda, rellenando el resto con 0's. 

LSL (Logical Shift Left - Desplazamiento a la Izquierda): Agarra todos los bits y los empuja hacia la izquierda. (Desplazar hacia la izquierda equivale a multiplicar por 2^i).

LSR (Logical Shift Right - Desplazamiento a la Derecha): Empuja los bits hacia la derecha.  (Es como dividir por 2). ^GG88dOn4

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

El ISA (Instruction Set Architecture) es un contrato/Manual de idiomas. Es la frontera entre el software (codigo) y el Hardware (transitores fisicos del chip). Es un reglamento estricto.
"Los primeros 11 bits de una instruccion 10001011000 (O sea, el opcode), significa que la compu debe realizar una SUMA entre registros" ^16MCAvvT

Standarized ISAs ^Loo5hakr

Es un reglamento publico y fijo. Cualquier empresa puede agarrar el manual de ISA LEGv8, ARMv8 o x86 para poder construir un procesador fisico real que sea entendible.
Entonces, intel, amd o mac pueden crear chips totalmente distintos, pero mientras se respete el manual del ISA, se entiende la misma info  ^i2HpdiAd

x86 tiene su propio ISA, y ARMv8 tiene su propio isa. Por eso, hay programas distintos para ARM y para x86 ^PWIsPDvY

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

Podrías pensar que los lenguajes de las computadoras son tan diversos como los de las personas, pero en realidad son bastante similares, más parecidos a dialectos regionales que a idiomas independientes. Por lo tanto, una vez que aprendes uno, es fácil asimilar los demás. El conjunto de instrucciones elegido es ARMv8, que proviene de ARM Holdings plc y fue anunciado en 2011. Por razones pedagógicas, en este libro utilizaremos un subconjunto de las instrucciones de ARMv8. Usaremos el término ARMv8 cuando hablemos del conjunto de instrucciones completo y original, y LEGv8 cuando nos refiramos al subconjunto didáctico, que por supuesto se basa en el conjunto ARMv8 de ARM. (LEGv8 pretende ser un juego de palabras con ARMv8 ["leg" es pierna, "arm" es brazo], pero también es un retroacrónimo de "Lessen Extrinsic Garrulity" [Reducir la locuacidad extrínseca]). Identificaremos las diferencias entre ambos a lo largo de las explicaciones. 

Para demostrar lo fácil que es aprender otros conjuntos de instrucciones, daremos un vistazo rápido a otros tres conjuntos populares:

    MIPS es un ejemplo elegante de los conjuntos de instrucciones diseñados desde la década de 1980.

    ARMv7 es un conjunto de instrucciones más antiguo, también de ARM Holdings plc, pero con direcciones de 32 bits en lugar de los 64 bits de ARMv8. En 2015 se fabricaron más de 14 mil millones de chips con procesadores ARM, lo que los convierte en los conjuntos de instrucciones más populares del mundo. Irónicamente, en opinión de los autores, y como se verá más adelante, ARMv8 está más cerca de MIPS que de ARMv7.

    El ejemplo final es el Intel x86, que impulsa tanto a las PC como a la Nube de la era post-PC.

Esta similitud entre los conjuntos de instrucciones ocurre porque todas las computadoras están construidas con tecnologías de hardware basadas en principios subyacentes similares, y porque existen algunas operaciones básicas que todas las computadoras deben proporcionar. Además, los diseñadores de computadoras tienen un objetivo común: encontrar un lenguaje que facilite la construcción del hardware y del compilador, maximizando al mismo tiempo el rendimiento y minimizando el costo y el consumo de energía.

Este objetivo es una tradición muy antigua; la siguiente cita fue escrita antes de que siquiera se pudiera comprar una computadora, y es tan cierta hoy como lo era en 1947:

    "Es fácil ver, mediante métodos lógico-formales, que existen ciertos [conjuntos de instrucciones] que, en abstracto, son adecuados para controlar y provocar la ejecución de cualquier secuencia de operaciones... Las consideraciones realmente decisivas desde el punto de vista actual, al seleccionar un [conjunto de instrucciones], son más de naturaleza práctica: la simplicidad del equipo exigido por el [conjunto de instrucciones] y la claridad de su aplicación a los problemas realmente importantes, junto con la velocidad con la que maneja dichos problemas."

    — Burks, Goldstine y von Neumann, 1947

La "simplicidad del equipo" es una consideración tan valiosa para las computadoras de hoy como lo era para las de la década de 1950. El objetivo de este capítulo es enseñar un conjunto de instrucciones que siga este consejo, mostrando tanto cómo se representa en el hardware como la relación entre los lenguajes de programación de alto nivel y este lenguaje más primitivo. ^aRMCodZ7

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

Los Registros "X" SIEMPRE miden 64 bits (8 Bytes)
0x1234 5678 ^mTpVNspH

Las Instrucciones SIEMPRE miden 32 bits (4 Bytes) ^4SxP7v76

Pseudoinstrucciones ^6ggP19Y2

Las pseudoinstrucciones no son instrucciones reales del procesador, son atajos que te da el ensamblador. El ensamblador las "desarma" en instrucciones reales antes de generar el binario. ^79vkfpOx

Las operaciones logicas son distintas:
no les importa el número entero, sino, que operan bit por bit de forma individual.
Es útil realizar este tipo de operaciones por que sirve para "Extraer e insertar grupos de bits en una palabra". (Mascaras) ^9k3dPu3m

AND / ANDI: Compara los bits uno por uno. El resultado es 1 solo si ambos bits originales son 1. Se usa mucho para "apagar" bits que no te interesan (ponerlos en cero) y dejar prendidos solo los que querés analizar. ^tecxs2AF

Aplica tabla de 
verdad AND a cada bit. ^Sk9kYPSH

OR / ORR / ORI: Compara los bits. El resultado es 1 si al menos uno de los bits es 1. Se usa mucho para "encender" (forzar a 1) ciertos bits sin modificar el resto. ^rYzdd3EV

Aplica tabla de 
verdad OR a cada bit. ^8DUFqev7

EOR / EORI (Exclusive OR): 
Los diseñadores de ARMv8 en vez de agregar la instrucción NOT, agregaron la EOR, ya que EOR crea un 0 cuando los bits son los mismos y 1 si son diferentes. Un equivalente a NOT es un EOR 111.111.

Es la famosa compuerta XOR. Da 1 si los bits son diferentes. El apunte te hace una aclaración clave acá: en otros lenguajes existe la operación NOT (~) para invertir todos los bits (cambiar ceros por unos y viceversa). ^MAi9SY2Z

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

shamt (Shift Amount): Es el campo de 6 bits dentro de la instrucción (en el Formato R) que le dice al procesador exactamente cuántas posiciones debe desplazar los bits (puede ser un número del 0 al 63). Normalmente NO usado ^1LLWsM7C

B.LO (Lower - Menor): Salta si el primero es menor que el segundo (<). ^L3Ky2B48

B.LS (Lower or Same - Menor o igual): Salta si es menor o igual (<=). ^uJt1nfHK

B.HI (Higher - Mayor): Salta si es mayor (>). ^jWKXw8zO

B.HS (Higher or Same - Mayor o igual): Salta si es mayor o igual (>=). ^Y9cAoiuc

 ADD ^aKFiF8ug

 ADD ^ttyY8I0M

 ADD ^68iZ63iX

 ADD ^smdl8ags

 ADD ^mZxJ3Bl2

 ADD ^e3AiKFls

 ADD ^bdORum1O

 ADD ^2WbxYeAU

8 preguntas.

libro recomendado: Maniac.

preguntas sutiles, se responde en la misma hoja.
respuestas cortas.
ejercicos nuevos.
latencias no entra.

hay instrucciones q entran 1 vez en el registro o a veces 2
ldur y stur entran 2, add entran 1.
Por que: 
las operaciones tipo r se activa la ram "rapida" (la de registros). Siempre esta activa (salvo branch condicional o incondicional)
el ldur y stur usan la ram "rapida" y la ram "grande". Entonces: esa arquitectura RISC load-store por q hay 1 load y 1 store.
 ^w6G6kWpT

Cómo identificar instrucciones SKIP o ilegales: ^7VUxjMJe

Parcial 1: ^cpnRMlnB

Parcial 2: ^uZEqZtnQ

Agregar tabla o tipos de operandos aritmeticas.
Ej:
ADD x2, x1, xzr -> Copia valor x1 en x2. + Por qué?
ADD xzr, xzr, xzr -> Es instrucción skip. + Por qué? ^VX7p3uFe

Detallar más ^S9acoOGR

¿Como contar realmente cuanto
se ejecuta una instrucción especifica? ^MTm0TChQ

El operador inmediato cambia según la instrucción y se detalla más adelante. ^ocfQLr9W

Números signados y no signados ^73yAUSAe

Un ser humano, esta hecho para pensar en base 10. Pero una computadora, en base 2.
Ej: 123 base 10 = 1111011 base 2. 
LEGv8 double word es 64 bits long, representando 2⁶⁴ patrones de 64 bits diferentes.
LEGv8 Word son 32 bits long, representando 2³² patrones de 32 bits diferentes.

Sin signo (+): desde 0 a 2⁶⁴-1 / 2³²-1 (Solo exitende con 0's y pertenece a LDURB)

Con signo (complemento a 2): El rango va desde (−2³¹/-2⁶³  a 2³¹−1/2⁶³-1 ) 
Si traemos un dato más chico, se usa Sign-Extend (se copia el bit de signo original para rellenar el espacio vacío y no alterar el valor matemático).
(Extiende según el bit mas significativo) (LDURSB)

El punto principal es que la computadora puede representar numeros de manera 
positiva y negativa, con sus pros y contras en cualquier opciones ^ivz2Oion

notar que bajo 1 bit por que es de signo! ^jtNGJdoB

Agregar tabla o tipos de operandos aritmeticas.
Ej:
ADD x2, x1, xzr -> Copia valor x1 en x2. + Por qué?
ADD xzr, xzr, xzr -> Es instrucción skip. + Por qué? ^YER8pfSO

Pag 90 "Logical operations" ^kxVarAEh

Word (Palabra): Significa exactamente 32 bits. ^gOUCUfCL

Doubleword (Palabra Doble): Significa exactamente 64 bits. ^QXFfHIed

Es posible operar LSL y LSR con 32 bits, pero necesitaria cambiar:
x1-> w1
x2 -> w2.
Ejemplo:

Si usás los registros principales X (ej. LSL X1, X2, #5), estás moviendo la caja entera de 64 bits. El límite físico ahí es 63

    Si en tu código usás los sub-registros W (ej. LSL W1, W2, #5), le estás diciendo al procesador: "Ignorá la mitad izquierda, operá solo con la 'Word' (32 bits) de la derecha". En ese caso específico, el límite físico pasa a ser 31 posiciones. ^bxIGL0jd

Cómo identificar instrucciones SKIP o ilegales: ^B30ho4mF

Cómo identificar instrucciones SKIP o ilegales: ^yHlK98U3

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

96b2b334a9ee59a586c1c3bfda46bec2704f6a18: [[Pasted Image 20260602202547_580.png]]

870f6b19769ce66032778ce753f99aed9ecb07a9: [[Pasted Image 20260603104413_690.png]]

10e6696ea2ad226823065d34184a3a14a3888679: [[Pasted Image 20260604113356_581.png]]

4071cc53130ec7d0e03d341fc46551a2dbf26681: [[Pasted Image 20260604131704_123.png]]

5b3ce8b90352a3afce95a328c6c80cfc5e7dc6ff: [[Pasted Image 20260604131717_713.png]]

2a47aaf4077cb95893bb7c05bdbaea71e9763a42: [[Pasted Image 20260604131731_444.png]]

51b51870f09dd2e3fa4a140b1000ffaca290a3cc: [[Pasted Image 20260604131749_727.png]]

6ada4d189237b056be85cb239af01703100426e6: https://cat-milk.github.io/Anime-Girls-Holding-Programming-Books/static/e1657d0a5c4aab06c7089ec771c82bb2/ed3fb/Takami_Chika_Stressing_On_Assembly.png

d2fdfc81ee4cb36c964002bdc3744af6d859d63a: [[Pasted Image 20260612192409_094.png]]

%%
## Drawing
```compressed-json
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=
```
%%