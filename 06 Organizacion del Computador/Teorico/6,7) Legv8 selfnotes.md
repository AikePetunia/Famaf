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

Instrucciones ilegales: ^7VUxjMJe

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

6ada4d189237b056be85cb239af01703100426e6: https://cat-milk.github.io/Anime-Girls-Holding-Programming-Books/static/e1657d0a5c4aab06c7089ec771c82bb2/ed3fb/Takami_Chika_Stressing_On_Assembly.png

4071cc53130ec7d0e03d341fc46551a2dbf26681: [[Pasted Image 20260604131704_123.png]]

5b3ce8b90352a3afce95a328c6c80cfc5e7dc6ff: [[Pasted Image 20260604131717_713.png]]

2a47aaf4077cb95893bb7c05bdbaea71e9763a42: [[Pasted Image 20260604131731_444.png]]

51b51870f09dd2e3fa4a140b1000ffaca290a3cc: [[Pasted Image 20260604131749_727.png]]

%%
## Drawing
```compressed-json
N4KAkARALgngDgUwgLgAQQQDwMYEMA2AlgCYBOuA7hADTgQBuCpAzoQPYB2KqATLZMzYBXUtiRoIACyhQ4zZAHoFAc0JRJQgEYA6bGwC2CgF7N6hbEcK4OCtptbErHALRY8RMpWdx8Q1TdIEfARcZgRmBShcZR5tHgBmOJo6IIR9BA4oZm4AbXAwUDAiiBJuCAojADkAZR4AYUkAM2SiyFhEMqgsKBbizG5nAEYAVmGABm0x0Z4ZgDYAFgSATjG+

fMgYAfil+cSADni9veHBheGVwYB2fmKKEnVuWZXtPaXLsZ3Lnlnh2Z5hm6QSQIQjKaTcQbxQZxJaDK5wsbxeKXPZ/QEQazKYLcMbo5hQUhsADWCDqbHwbFIZQAxIM3oNsDxepBNLhsETlIShBxiGSKVSJATrMw4LhAplmRBGoR8PhqrBsRJBB5JfjCSSAOr3SQ47QA9YQNXEhDymCK9DK0rorlgjjhbJoQbotii7BqTaOsa4g2c4RwACSxAdqByA

F10Y1yOlA9wOEJZejCDysGVNGNNtbhDy7cxg3GEwawghiBDxucxvNXrN0YwWOwuGhhvF9a0GExWJxKpwxI8xqcPjxUYnmAARVJdEtoRoEMLozRZ4gAUWC6UywbyrQK62KpQkwzYMAoAAUALIIOBEzD4DWSDgwIljI9QgBqzOK7XE6DFhKo24Avus4YGkIcDELgE4QiiqwrJclxwqM6JEBwRKxvG+CIWw7LFtw074LOBpdJgPQSAAMouADi9B7Kgm

gAIesHokrkBQAAq3RlGRlHUXRDFsJKjScFA1SEEYn6DFMkzxDwSzxLMRw8O8g57BGgkAGK4PoMoeqgLbvt0ACCRDKA26DBI0PQ1kwUDmAQhmgiZ0AupKeiZLgSZMDGaD5uhBqUqCSYEGxREcRRVE0fR5h8eiuBCFAbAAErhCJn4EkICCIe5AASIJgsRqDQv86KSKEQVQCRSYoVOM4IPkf43IUO6Tug2CqSeLFHnASw6uiH6dOx6L9GgzhSTw0LbM

cOx9vMfzNui2nOPMlzDJckynPMYyzMifYyeidzEA8aArEskx/JCyKvBthUGsCoLgo2wzaMi7w7DwlZjHsHzVgamLmt6rZGiSfKUjSdJwYykqsuyvrcry5LA4K5AcCKYoZBZBrSrKprmoa5JWoWBLGlq+06mgEy6QIBMkljn44yqmZ+Le9oQs6rruhCXrotDAZBrkQGtpGGkIJ5qDeYmyaDegaZGExC45nmaF4gg2GOr8eyXFtr2WXWnDcNsToGrW

HYcF2HA9o602XNN3x7GsraEKO47K6guH4a284w8uaSo+ufPFCBYEQY6UHSWMluLHJGFYU1LvpQR7ESPppAAI5CGoCDYFAIi4KgxBBKgcCEmIzC4MQlKoAAFHUADylQsYuAAaLFVwAlExlClWUicp2nGdZznecF5h4Ql2Xlc13Xjct/xgnCaJ3DzPMj19rMS3jdNi2zF9/NqRpWncOT0AGUZDlmWjra1tZ7h2cZnROeiLlRO5pDC6LvmkP5HCBfH6

Bd6nXS9+Qfu+B86F2HqXUgFdq61wbk3Vu0VYoJSSnPNAqVY6tiQggbKt08oFQPsVZgpVyrIRwtVDKxCvJoVqvVA0u50CLlmJoE8QgKBQCoD1eANNCJnz6FsQcx0ba/HLCiJYRx4hzQGNNNW2h5hLD+PMQYSlZFLF2tqdmKJJivVOEsJYo01Z4JyndVA8jJKVn+AkeRVZbbFB+p+P6xQAakjhgKdAtIECDDcUgOcbIORch5EDZx0BEbI3FNwyAGM5

QKhppaEseJKYICJgdVAZNYnqhNJEso0SZYMzlszXyrNYDszsZALmgYfYRijELJqr87bi1TOJLJ2YmYUILP9JWTVRrjBkSI+YWsjaPFkr0+sJsza8FhIcQY00t47gdsEQOztSEGndjyT2q4si5G3A1O2TUIB1CEMMf0i4TxV3rjwAAmpUIk+g4DPiECOKAFIxhvjaBwso342C/k3ABVovtID+3Ak7K4H0Q5h2tpHEk0cFmti4WURcHBUD4GzmyTOB

ASAl2oKgMIqAhDFzhRkVAygMhMAILwVAYpu7/0zuQZg/cQFD2LuA7QbdWLfwgLC+FiLe4orAsQdFmLsXWFQHigldpyDAJ4KS5Of906UtCDSweRcR6kEZSpTIs9PxSReApVEfY1bNi0VMsJO9NL4G0gfLh18T4IHMpKC+Nl8AWtvnAZygk3IipfgrN+H8v7BQkGyhFpLOUeDRRihAWKcWCrhcKolYqJXkulVnaludaUKoZZKGKcVEqsGQagVBZDME

GJwXEPBJVuhEMqvMvCaDihIXLd5Kh+RNklG2dUAAWi2xcex9AjgAFaSl6hIQg+hoieINBLBa70VpTXErCL4px4g9INPNeYTY9jaG0TIlexx3pogNHtRJSJF4/GkrsH4lsV76Owbred2gj07FkstC2B8bE4hScafxnQgmihCRDbx0M/FOI/cKL9qN+IygiWaKJuMYn41SQkkmSS9SvqpukpUUGsm2iaflFmbI2aeiKRAEpPM0BhnKYLd1LSdy1IkJ

oOEDTiA5OaT5VpTt4hTFDoMNWVjICG3rPPHYgzOzdjEutcxqIUTDjHLMp2Mc5wLhWd7Xm6I/lzMBdBUOi0jgLvQRVVCFHIAUijiQytsTwLYrKIgHkSZlCgeCMLCAsxGSNDeAgSsmhNAzA2rgacodc6XCtdgSswxNBKwmY0FExBNDNDxO4T8G5Wj603IMQC99CROsY0VEtREy1GbCPWoojbaEQEGHaKAwwjwalOX2l5A6h0EslGO9aUip0fCuKNTa

WnihLp4BJGSvxPrbEOFx8oqi0AHpvcMY996z1LSKgWq9h6Jt3tPY+6KHAsS2KQ44/kgGkbAYlF4qGvjYbbYRkBlG+30ZgephktDm24O6gPg467qG6YGhtIzXMuTWwuhwwUvDnMuTczKejCp5GmOUdzhLCANGmT00aZ99LhY2ncGkjohY/wDVtm1iZDeAnjZCZR16WCyJByY/tpJhAcyZOLLkyuBTxGfkQGUwC4OMENN7A6/pnTiP0GYXBTlqtFNT

PBggBZxwa2bOVLKDwdOuANoc80CI3A8xiCNGwNgJYmhZhhYmayda0F3EzVZGMaD/0YvrMS4CMASXvkpacjz4o+DCHc4rbloodUG00O2fpViQhsD12UBmAi1X0DQoGlsYYRw9R9iuG8GYrGRjiKGtNd62g4Qrym1MV4KjiYQikdozaBxN5PB0UNm6uV94PSeh8RYb0PoiNW+tl9MG30AYkLSek4MDs+IXO+07u3zuhKlFdlDFpbst81CNhDj24nPb

H691s72GNYbyb97S4l8OEeB/zUHVSPU1Mh3U+IdHl/VPscjtAm9ETnFr3jx4Mw8fDLEtsWCfZBsScdhC4zNOPZ07XBb1oTZRqMoegEcCgSQZaXAEiJ5aAEPDEUgH8CAf8ZLYCUCf5JqVTYFdnTnCAAzfnKqb/KFFlTAVEBQTABYJlDuCQEg2YMgiglVISZKeeReBPc9NeBYcTdGI1PeRsHqI+eyMoU+G1KyO1B1QUO+A0B+V1DyPfPTCAPyfwb1P

KCAGgug+YNNBBTNJglBUgNKPNLBCvR0ItDLAhUtF3anbTchEWShd3ahLZMoZQKARoOMciZgE8KrDoQUfqUdAYbrVESYCbD6A4G2VEb4JPVABaYYRYOID6S4c9BIKEZRXdKfCZFaGCQvKIkRCsa4a6Obe6R6V/F6OvD4ZSb6NbX6TbPvFxUGBkWHRZX9I7KowJM7b9CMEfCDG7BfexOJe7UmRDCfNJDol7PGRfYQDDBHFfb7fJdfDmH0QHUpRTEHM

jWQ8HSAJMQ/ajCZE/TDM/AQC/fKTeBIuEAZA2dsXjRsB/U47HJ/CEOdZdS4HYMnGZSnaTSFYoJZJcP/NZYjDZbcNY7ZXZfZQ5Y5M5C5K5G5O5B5GA/tL8BA95JAz5FA1sZnDA1ndTcOUo3nQzAg12PSH1H+eKE8KiSgllfSQk4khgtVZgpeU4VebpDgzE4oASTIdSY1U1PgoiMQ0yK1IfW1K+Y+R1Z1VyJ+MHZ0d+RQ/AKggkokvYDQjNJBFKXQw

XXArKPI/KYw66TLMqcwt4rnKwutWwz3ewiQOAU5bAJOeKfSMYEcDwzhbw1sMdZEDVEYAbERJ4Q4OI8IyI69PscYM6KSEYBLW4KfP4NIqEY4JaKIk4J4WbS9UbfwjnUnd4SEB9IMyAZ9UmSotvaojxdxH9Q7XvbM5ogfVoy7TGUfWmEY7o2DKfZJAYufSs03YoJfTDNM+Q6YwpAHP0BYhnUjaMFYsWDYyWEYbYiY3Yw0fYukPRRETjO/R0DjJI8+M

4wTU2T8UaCsd6KSJsD/KTL/XElkWnL2f/Xs1AgOFnD6eRCsYIhIMFV4wgvE5Q3+HuGVHNcgRwN0TgYlJNI8OoAAcmpRgAAB0OAOA2Auh5xiRmB0V+UsU4VHAwgABHtgfuYCpMNUP3D8nMVAPQK5YIbtWVSuf0aoOoZuagYC1gDIUufuQQUgXOT+MCAC1ATSRwSitgYC1GQIfKVAGAfKYYGiGALoZgbQVAcizgVAcgOAEgNgKC/OJgZC6yQlOCtIU

IKwUuYClyZgIQfQZCwlUgAlS+NgYSyoHDZCnC5C7kdSyQQgOAZCpNKSGiNQalL9XAYC3wBAZQZCsICBJNegt7duUkyVZ8vuIUd8+sL80NH8/87ikWMChACCokGSmC7kHOe2BAJClCjgNC1KdXescIbCgwHwBAfC6lQi4i0i1ADFQgVi6iykOikuWVHi5iqqnkHSzITiwYaKkYfiwS4S0SuFCSqSmSxAQkHNZqvFXOIdVgEefKpGLS1qpgfSyKIyk

y/K7S2C7CqymymleyzQRy/OMUFyjgNyjykNby0NXy7eVVbQ1Aa9Q4WYREb4cxJSNs5kqAVkngnSDkqALk3Ank4Q0gS+WyAU8Qp1e+F1EUgcz1CUqUiAJ8ilYKt88wMK4Bb8v8xi0C8CtgSC6C4uda+CtK2yhAVCpGbKzCvKnCwq4qyBIiki9FSq6q3OGiuqhi6Kpq6qji0NDqnirqzQAS8IXqpGMSga0uIauS0axS/uSa1S0yzgTSta3SxavQZaj

81a8yuFbATawmm68VXarIfa8gVytKE6rymlC66xTQhUgXfQtU3BEw53Kwiw6tF3A0sAD3fLL3MoDUTgfQQYaoIwegW0vqYKcPIaGYV6cbL0BEBRBRA4L0heJaR6P0lEB4jjBSHPRJUMtdcM5aUYZdLRWMwwoxL4F4UOHYCM0aaaSERvCogYpo1xdxPM7vP9Y7eGUPT9QfGzcDbGTJO7Ws/o/6WfCsnut7MYj7YMNsn7N0P7fKWY1sLfRYnfZY3TV

YkoKjYc2YUc+WOQosJqOSJEK4T0q4vpFWSPR/AnNAWCBSERedHcl4vc5Uj4+TY8kMX4zcf4sofcQ8U8c8S8a8W8e8R8F8aEuAt5D5VoL5IoRnFEyCIFNnDE28++r6mFalf1MlKVABbOfEawMCCBDIYCroMyTgaS6KvFIdbAYSgAVVxrznxvStzmJvQpys4DysCGID91RUYtYFwvCGAvLnihpvKoopav0CYqEB4tqoyGmqAsyDYBZs0upSyt0KYaw

uYrxSkmAt1pkqEaouFuQp4unDdHwG0GAuEmquSo1uspzQFS4cKugvVs2olX0HUtlq0s5ooGEsXGpTwFFCMBpSHTtHwtIGJq6FIE/lWVDQDmIZ8vmAcqyHRUOsQGLjOpDWUFTggS6EytYoYdJtysTVDSkk0eVT8uZXxNZRQcRUCvhsASwZ5DFAjRzVSGZOIZ4tIbZEoeoZRtSrodDUUYwtyfEuLHYZZp4pseCBKv4bKt5WatLhEf0DEdQAkfor0Zz

VkdlXkdQF6eUbytUbhR2scqmeqt0eioMZlGMY4FMZavWosbgCsbhVGfSiuYcbFBEY0tcfyncdQE8ewtwB8b8esCKrqaTBCbCdRgifAiifOpic0fidkqSZpTCFScIHSYyGmeQs2bJrye1sKeniuuzVuu1SkhmkWCOBeu4JNX3i+p+qEK1kBvtWBtDwkNbCkIhuXrFK9UlJZS+dQcqfjWqaiFqdwbhQIatSIcYtafIdQCoezhoa6a1vRf6dYaGYasq

u4fGYEYOeEdEfEdoskaop4rijkexQ2ZJqUYxaYpIDUZ1v2fpsuaOf0ZwyMZMdRcecsf5ZVdsZdZueeZmrlrcY8a8Z+dwF8aTX8YBYgSBaYBBcyDBbikxYWFiZkuzkSbqaTQRbSYacycufleYcxYKccqKdbHTUQSzU/Edr1PzTjPVKulbCdzMIdt1JVP1JsNdrsOANInoAACF6BcBVIxh4pA6ath16tfDBE9RlpC9LoFEFg46mxZgb0REEgt0URdh

074NpIVpzhRoZgFEdFxJl0C7DF129Rd3t3pJ1z92yim9Mza6iyhQSyQMm7Gjb327Sz+Z2ju7x8B6azc8+iZ9UkGzh7RjslWzsMp6ZjN95iiMQxGcBZ+zWWaE17ocrhN74PmMmoOculQ5us5ybqdEz7VzbiNo4iJkG8aFniqcG3H6vjt8/Y0CVM0SQUI4DQa1UPq0+c7z9zDQohM4RcxcrNJc7MyxsBfhYQEBZg5d1oFFfgXMoR4hcBfgtcF4dFLh

3NBxVhcBVRzcfjLdtwbdIG7c0trC5Da2ssdTK08stxjT0BQDwDIDoD2FPDYTECQ6IipIlgHoloVgF4FJus4jMcl13gPPRggiJkrgJtV3biVoOdWMbYoQZgjhwvcjK2REb0SW9gpy3hZ0n1yiNsb2TsXEeAnMXN1DH3Cz8vizgkH2yyu7IMuiKZv3EkcCnsh7P3mzR7l8J6Oz/s5juyoOSMli4OHc1jEOaNZS4d6NMMgDYDHOeB1g3bz8nZjhpJN4

cCeMdZRt5F8ORlUQV0r78NydP8raf9llqOF7aOzzUTYH1MUQOcyFa1982PsTXdlSbKgX1xtw4tWgikigxhtwfkwBPuighgrgXhdh3oEgFElJEu36Uu5J0v0uRFMuOk/ukTuixQoAO31j+OhuMAeRMfLMJc0ApvUhVk7MfcWI/cA8g9NwIBtLc4yg0KLW3xh9MBiwjw2AgWACvus7Vg4fjhK7AyuMfvVpXgF4MOFFpodFKw9gUfwGTMAbE4fxgQS5

WPIBKLFf3llftlQHJQgh5wKAOPlSTPtT637zIBtLGATwSB2e3utR1An68oY4LOCsAS9kDkjkTlzlLlrlbl7k2BHkHOaYdeXPnAPM53WMURZJ0ukRNoxFF0JEfhEh7qjhVh0uKwfgIvHRr1RodFERtERhuspID2cEQefhIR+wY9RoTjC2cvm8v3W9yvqRCulhiv8ye8YYmi73KuLs33yyhj58qz6vCYp8mvB7+/Gz0Mx6vtihJ7cMZ6IPeuaOwld9

VfV6hykOlgUOiftxpu1y5vFZFuozxgfOcPFgcilzrjz6dI39dg6QcCDvdyju3ZDzVkl+mc6Pzy1NGPGS9T7u5C8DDe6IV7s/UB6A8wA33cAX9ytxgDIQi8HPoX3z4TYHqVua3KXxOBQh7qlfSELMFl76d8Y6PfHuLmszb8aeJPVGHZnoSMJmErCZnnTxpiUhdazPaUKz2IA28JQ2nTcBMDeCIhsi0fR4gvBQETBoITwCbBxnupNhfgcIXAS2wNCU

VCB2PVAMTy+J2ZHCzhIQK4XcJW5aesjGmIz3p5aDmBbPDnuwJfpv0hBOwdaGWDiKec4ilYQQWnlC7HAlukvREEtD06QN9++AhXnCXAIhBIarYdXj4K16vIfBuvfAPr0AGalTCpnU3pxwt4IArerA4wVkDt6SAHeAuZ3h7QkCnIRwygFtJcAoaEAq4A7UPPaR4RDQRgMiItHSE3hxEpgSIL0oNiT4jAZ0nSREG2T3TwY4QxdBSM2DghiDzgRfJLoX

QmSLw1oMkFOucHuo7oa+V7JJFmUb4N0PEbfZup3xfZVde+NXTooPy44Nd4MdZevshnH6Ac2uwHCYp1zXydkeuIEHstBz7JS4ce6xFMJsQ7Zb8jOK9HerrAeLzpdUmONbiZG6zVtig/wm4qNgUjLRDg/GMjhTgo5m9ocL/enHcNPLoEYGX/ZaOl0xwADEGccUpl82SqaVNALkbtNyDiiCo2GeAayPQC1pkkZSdjbOP8JEoQByoXQQChADOYkRZU2b

LCoIHVqyNCA0oPACzTxS7VP478NgOillAaRpqegRwB5WAohtcA3cT+AW2bL+VcR1KfEVoCJEkidK5I8CIQCpE0oaRVEOkagAZGsjmRRNNkcBQ5EKMTWfTHNhijEoyj+RNkIUXChFFih2AEohFEOioouiTqCopUbgBVGGpcW6qVdAvHGjzpvOkg8/kyTJbskcR31elr9WtQ0tRCqYuKKDUkLg03U/gmfuKQCgct1R61AkdqJkZki/c+ow0UmmNHKR

YK9I5cnCgtFpxWR7IzkfaK2bUoeR+VRwAKPqrUphRAUMUT6KlH+i+RgY0NEOmDGhiMQFtEtk/ydp2gDChiW2lEPtrloy2jbP/vgEyFWcIA5EeKB2xgAUMAAisJxKGHxg6PhCoUiFiDSRtgi0ZdDonc5DZ5oEyDnGukWDvQrgswVOl8Ez6oAgURaFeJCDEwcYZswwwxP4XEh/AbYZ/CYdNGrq5dDhW2VuhAA7xgw6ibsBomVwwld89sQ+cJAB1a5D

9J8P7afJtlIl1cIALZc4aBzn4b4uyNwvrjBxX6PCRugwOoG8PHKfCVYMib4CcGh7Ajmx88X4FtzEgXRnxsERctMhhGRDn+v+I8t8SRHIkP+l3DcrInnQrx4x+mdjtiKIKlMq4w1EylhUThqB0ggNbINaDVHKETJRKM1hZKgBWSbINkrguGMeCroEuqwG/OYm0R6SpQiYilsmKpZ/UMx/JAQiDSFKPx8xq/BQsWJhoOTyATk9+C5MpxuS5Sxba6rm

mY6qlK264mtlqWyw4llSLHRjPuLbboAjwScAlDAGIBEgA6gfIOkPjHSQhU8knEYIF1sGXFWwH4iuseweKyI4IMkBYHH1bCdDuAXwCYG50jzdJkQF6EYR8DTybwTgsIdLk2BGA/8MQtfa9mhLrrN9W+pXDvs+xaIbCmS77WrjsIcS9EjE1ElrrRPonj1GJ09ZidcKBxndl+S9Tievxow2lxup+B7nsSdi2CTg3WWeqJOxz7x3gkk+eDbGyKwQ2yD/

O+kuIPLKTX+n09/hd1RHyI/xFdA+FiNRnXjHyI4EcKgEwC4hyZTocmeKiUDkyxgqAAALxUzUAAAahpkmMKGHbemeikwDUzMAtMhQPTKZksznANMkkqU30ikyeZVM3mYLOFnMy+ZbMjmecy5kyy+Zcs1AHTIpkiylZYsgWTi0YLZpdgN6YvKHBXjfAp2s0DyW9V3jks0A2081KmOpZXFaWP1bMTFOkLPwCxkABKZ/BLEkyyZFM3mfzPlk6zFZHVdm

QLM5nczg5ssmmVrKFnhzRZ4s+BPKUXE6E9CeUlcTbQ1JFTohJvLcQ23KnvDKp79CQKpEXAAApOoP6HijxB+2zUrwjeIdIDBy+i8dWMsCWgLANp20j8fOmhBF5Qy/4ibCJMgCTT5ySIPUJXUWDoipOxfCEKNGkTdYsi7wMOBn0vY119pRZeussOOn/pyuhEjum0T74ftaJN0vun+2NA0SdhT06fr7K67z8WJH0k8ovUG7vDByzw4couF4lAyJyIMk

OK9AhncYxJaABIKNFhmHRTgj4uabfVhGccqOKkt/tAyDgXkN84wZsJiIMlEzoUpEWVC6Ecn9MvR6U6yQs1MlwoG4dQEiBQ2qD+hnw+kE8IuGgQRoCQoaQIKoCNBCURKHAKVrimASqRKQQ6UkfFArgUhqUAkUgEIuIaYpGAcKSaqSlzgIpo29TPOD8xJEIBm4wFfSBNXojoo8UoQMIPoE0AmonRFIENGQqJRcU9AuNGyuGy7GYU5xzEGGraIsUpSi

FaU1yXgGpQELEYnzeuFQpoV0KGFTCuuCws4rsL7YBMLhcBV4WCp+Fgi8FqgBEXlwxFzsBJbG3MWyKmKsqEuEEGsBdAVFwCNRdG00UcBtFaQXRfUwMVpBjFIzOGOYp8XZwOq1ipNmXC5FzjXqVJMEQUVeCDgOMO3TWDbPer2zPqoU52eFNdmZiopDLHMUyzzEyF4pRY/2c4vwWmSzWxCzxasqJQUL/F1C2hfQsYXMKOaAzDhVEoFqxK84AiyRYkuS

WpKJFUinsaGiyXyLclSigpXilUVwB1FpS8pfoEqX6LcwNSkxcqE8qhpGlVi6Sq0rsWMMHFWUrQtmlymWEK2IwvOY7mKlmdOOJcl2vNxd6pgYAJEIkDAHiAABpezsHkc7Ezh2odV6JOngkyR08U5QKf1O2BZ0Rgy0BcrF3GnBlKJRwY6LImXSHAH0uibaeXkMTIhtAfnVYM2FGDPQ8Om81CdWQb4YTqQjQd6NgC9ArCn2h89YT3wumnyrpTZcifEk

vn3TjhZEuie1xA6r4wOVwuepBzf6wcHhH8hDr9MGCqRf529SclEQmRegDgQ2f4VNKuCQKdI/SiushOhGHdSpsmdGYiP67qTsZqC1PlEX+DyJAphMqNcmLKBHh34psayuwBpS0NkKgwNAByPdZEA3Q3KeZFSMCBiBSU7KE5fGC9HcoJZyhbNUmDdCSUtaha/KCWswaDofASNStdOGrXpxQ02cf1OwsbXvxm1lJa6qxjiAx1+lC8X4N8O2mvVhlSYo

ySmOmVpjeSIhSKTfGilg1hScUnHn7KUJZqc1Ha/NUmm7XFrUApa0ZoOpLhVrKQo6utROvcpTrUUhq+cenJylKlraBU1FUCHRWxCypztZtjiqyHoBu0CAf4KSqPBRZyVdpFueUIiLl8xom8V8TImnQyJGh3WSSCiD+AiJ1YwiTHBPN4CbxpERHOSA8XkjpcF5F9MmFCGXT/iT09xHAhmXmF5dlVNRLvPUQLInTtVZ03VWEkunbDf1F8yiQcMVVHCz

5t8y1QxOtVMTgFBGe1ZjMdWikXVX8pDv6A9UfDJyI0hYBxgklH1ziOkf8cGskTudjgN9CNY/wzVKSTuSCrnpZxp6FYWIBgCgCRGnCzKaeMJeAogWQK25kR9HIFKiB2BzoCZ2CpzQ+TKCJRTlhIdyYvjskJb3KkS5LYbK6WWbl50ZXDbhp+BySwxtstkiFK3VhT0xkyg9Q5A9nHrYpCys9UsovUSBEtmW6SnCstqZyINOc4DUCNA0FySpz3O7svTL

lNoygHbciHsHIgagiQ2AY/E3NKFobIAbU1jHO16weZFos6XqZ1hHaxAN8KwKYOMGI42wgJCIVdBMKXXaJfJTGoxFEUmA6oZEE6SsM+JQl185N6EgJLvMbqCb2+B8giTquIkSbhiUmnoiavrIPTFNZw56Sptelqb56r8pkhxOdUH5dNNGMlUB3hxb1DNTsWRDXg5wfQcOrGUOMGoWC6SvgK7BzSjLi1oyXNGMxHb8g0k4yBw8uKCViXwLDbM1Egao

KGn5RwpnKqAYqGIAgTYBaI+AbAPGGIZCKKlBlRivgAADPqgaxfnBEDSV0UZlLRaTPRTVAuZ6KfSJUDJnIUq48UeKOinlFItpUgsZRXRQJhAJk0YCMuCMyTArM8AECf1OkG0rvxs4lpE8ALWqBiUC4g6NQAaOIYfLOmiFLWsVFooUAUYdNEZqGi+XFg8UFmOFmZXhTEMEUZAMDBC3ZTON7FhAeXUpXrUU1YoiqEMcBWAqLgcAvgVgN20xYRLOFaAf

3WYsaVwo+dVFVJfZQb1RLnYAAW94glVomCbb5mBGArcg2AzcFKiKE4CEBjFeVPFNyzjQYMH1oUPYBXo4AsRAg3i8hSLSb1VUrknFLAKCA+WYAkUVugpclW70jVb14QayKBQrgC7UmYoHBnEuApb74wUQUuJPp4oi0Tl7WzFgoTxTlwBdwQJgOnsTTgtmApSrRfgCiBmiggmEH9WgEMgZswDBrcddnCTD3KcMhe7itnFZHZx/GbFCAP3DaqE1gE8q

B3RAh4qgVgKdoIuGoEBYQJs4mgbFK7pziQGP1hBtIH5FwC8oxKCKbfYQsdF/LqUpAWiJJRZqKLKq+IZSi2rKA86w0AqAXULrAOi7xdku6lNLr+Wy7oqCupXcQy+XJb1dBgNimUq12oAddHbPXQboWaoBjdpu7hY4BrVRBwmpB23dIcoP0pHdlVIVphDqbu6eDXupJQwr90B734mkSkaHr4VT6CaNKKPcQBj2BA495ixPXRVkpIw6mae1JZnvfiyg

c9/qDSjk1wNJpCjBVUveAnL0cBK91e7FAaNlRJor90lJvfUtb1KHLmne8VE0fEX97Iog+yFsPsFHZxx9k++CjZUypz6hxcKRfegxfKcQqI6+zfXlVb277LD++guKGiP3CpBUp+jOOft539UMtRoAtbfqTDIVgDB1fFEIGf11M847+2AyPG/05xiG3RmlIAbhQXHAEoBt3VE0gPQGylDx+AwZiQOoAUDGTNA6s3rVYGElboXAzAHwMYhsltBkgzbu

v0DxQE3h6gzFRFijrWAUQcNswZohsGU2nBjA0xSCNWB+D0xrZW4pEP0RxKEhjhnbtYCyGh02W66v8G/HLc1OXSWEGnSGV2zN1D5SrXuoBpTLD1Myz2Syya3ssYaihvnfrWziqGRdYuiXaku0O0RdDPFfQ30ZV3GHVamukcNrt12gnbDRuk3WbsswuH9j7htExQYxOKpoqrAPw+wcCOe6rAIR33dwv9386IjweqkVMbiWxHumgu5/UkYeZOmE9aUd

IynqyOmHwD7KLPfkcxZlH89JR0NGUauQVHKQVRmo9gBr31H69RxqJS0Zb3kL2jHe4hl3uLPJa+9A+iuEPs0Yj7hjoFUY/bHGOz6xm9TGY0FUATzG191RjfVvtcXYNmjaxtIBsZ2PH7cUux1w6C3WpNGTj+IM4w/suNP7aKtx4BPcc/0T7oqv+140mneOrmvjSsH4xAdjb/HDIcBxgMCe5TIHgE4J9JpCf9TQnrlsJuFPCcZGEHrAxB20+Qft2Yno

q9++g0lHxMbNCTrB5gOwcibUoyTHu3g1SfZRCHaTKjek+IckMNG84LJroGybTnZTs024jBKuMLT9apAYGouXCKxVQbW25c9AB2woCNBnwpyXAPQGKGLbKVIfbdmkVgjBExBiIcIlPN2CCqOMUwJaDtyAmohD086JEAcGESXRbtJwG9AtJEQHB3oMkW/PKve1Gq66qqvYOqoD6/bVhp0+9mJuHz6rJNqoMHTJv7ofab5v6u+Y6Bengdn5twuNUju+

ko6IcaOwYJoJHowxAZnqgFAXl9KyR8MAah2TeXM0rkRkpmlrHMCGzIz4FD9BESAKgZM7E1g4VWOpbbLprOdW6y9e2rzVdrZWvAEtchUQApw4jLDRk6XHkMSA21uaztQWpKs8AyrslSq+lWquSGooNsnLcYihBE4VgHBVIjgXXWCnytwp8ZVVov5uysxjLYoMy1PWeXfZzWgOQVcas3qImLVtqxVbSidWxDNVnq4WwXEAas5SK4ixCBA1kXBtGKnr

buLG2FZmAZ4zKORH13vAO2vIEcMSr2CLh4ofuRI/oCvGDoh2IfOkIkAmyYKMcp0DpI0IrA0aFgvkuIk2Gr7cqM6CQBwXf0jyPV2st26aA9FpIPVus4kcsFxt2k8bt5Imky0Pkhh/aW6ASI+a+z1VbCQdllvYQ9lNUKb7LSmmHVMUuHdc7Vi/TTcjvHJPCocNGNi35ax2r9+J+UBSBWDGRyqL+x9IugfBBFX9Ui/482eJDgWKT3iKV1SW5cZ0Jr8o

wcY4HJGysjaceuV7cVgx47mZKK/HE+U6ogDYBiAFYdxDwGwCfjYujQUYGFh+DQQCm4kRoPIkWBpg9gcVZDWbgICxZdOVudwYzmwCpZV+xvIbU70NLu0DxQgKuM+HbQcBO0V4sPLeNc7/BoQlddzu9GyKR4D4MxdLhKomSF81YiwWAUBMjwrQzoUwFbpdEWmGJ3geoVjZII40Po3te0j7XXX404T3ieE4TQDtE1A7zLLN3utZavnyaDVk/Drk5dtX

FAEdak9y+/JFtcSWIBmg/k1FhArBBs70HDjJDCvNjQR+UWRP+LiL0qdbhkvWzGpAGv0PN2yLzfoB81+bgGFKnXv+CtxAFaLEATKMwEkBLADwSwXy2/V34hDgtiJULfGpRGJqoxH0YvMVtwKxa8r8W1rTWeIb0BqUZ4d0xp1sklNlCbWzhWaJIcUnyHvV66r8Dy3jCSOpwc4AwQ3UTW2g/BCU7uv+qzWd1dW3MSesa3LX5Cq1mGtQ573EPUApD3g5

1ozmvkzry45FWuKuup3brlt0uRnfc1gPu0JEbkEeEIBjB64hdsoStt4SLQ1065V6JtBEHHBwi6eY6PdR4tHQiiB8SjVJwmBqwVLfS0i6KryjfAVoKdYnG+PVgiCR75NsezvKWE/bcJQm/7fTcB2d07LrN4fsvY5tr36Y4xHmzP0flvSBbrEh1cLb/mi26kFDY+0jgBS+rWNcIf1aAqMQKIb7l/Ajp6FkSQhnoSM8jrrdp2fFXNDOrGWg5NsXldgm

DleDgWtsNtcF6AZwIobZBiAQ2fuSQMhXkVHNx1Lxwh9Skqv1r4LXus5s4BcWNKzW41TgyG3ocDNu4TAUNK7uUDKsCAZDSRppFRiGVgKFVCqs4FhSsKmK9JrkeEHRTyLc4wWU6oKjg0S6dzwFT58AgpoyhHTQL3nXC1eNmL5FNlVgHPsVNXGbjECbtl7smNnN3nERZvaCv7jAuHnbISRoK3JNkOkLZor0bgEmPknQKGo6yEQCMCDj8X7zw59nBdDW

RNIbLzCjSleN5V+1lIfll0EcVpaJAczsderiT2iMNaqz2VOs4TOvGdnbp3gwc6OdrL+mpzjJec+peBArnnFW5/c/wCPOwmzVOKBy4+dfPOKoh41jCtyYAvMLwLk2kVXTjZnIXy4VapJUz1lx4XShiBEi8VdOVpKnZhPWueuMbnsXdLvF2885dEvzFAbsl2IFFH1M9nHpwQ7S9xddnVwxDWKDKBEjsv43Hz0tTy6D38v6wgrrZ4KgUZXJRX+ShAB0

pnhzqPOR2p4ASwWA6ID4Y1srbwTGU7qXZM18U7VvmuQBFrYj8cuerWtSv5nsrpZwq+yViGfmUlD9Zs6S3EM1X3Bsh5q5pNmT59cFM59OIueGvU41z75npVNfmvd4Lz61xEVtfTjfn+enNs67yauuwD7r8FyPC9fQuCqsL8BCS4Rd1Ng3S7/OGG/ReP6o3L+nF1YDjdwoE39SzFMm7Nfku03pDC51m5g/0vc3GQfNyy6LcMU73XLshby6LcCvGjNb

4V/W4BqNu5xRbeFYqRUflsLrRhAJ+RaJlUXZQD17ZDAEwAUNZgRIFZylvfBwEi7rcu8d8BeDzpr7IidPEyq+GroTgKfTuVnkPoTSUi1diVetAfsPE6NPdvKP4WWB+kz2m7HbemTJv4YHE49zvJPZZDT2knO2bvvPeZsD9QdbN39lk4ss5Op+jl2Hc5femuX2JHlg+66tfAAydif8mWwhNeiYPVujTtWIFLVttPRkedNWDGSp1JXo1dO2NWleNuqZ

5EvwBeCRoQY4KWUyU/d7BY8UZSvFxrdII4HAihAFARRxt8J8gBOKyv2rx0Rsuq+di6vVgKIBEGa/RtWvQUzyZfgu2wh7q4kedKHHOicPxr/birVNdFOCO+HwjuZaI+9mLLZTHX4Q1hW6+kKkwfXhr4N9lpivwgij06z1rUckXi0N18Ddo+xU0Xxte4SoIuDgB1BmAygV4exbE/oahgI0SYAL3z7ud/xfc+eA8RvS6eS8KIOkBtE8cpFFosQV8fSo

Rt/B9PtxRTyuo2iyJ4ZdIKJ5Z7iTj3cyI6BJ7TbWFz3UnkOtzxk8SSyajVaT7zxvb89b3ikGmwZ1pp9lr9vLZj8L2OUi/7EvgQKSsEMKVsWb5EYRKK/jmS8cZ5EfJleS/aJmIL6du9o28M/y9dTsiUIErzTspXc7nRZ3lr9YX0AABL9+DV52eYpwgSd2feNQt17G3DqJrWu7vthDoHXxRwc9UCEC0o4A8uvEzpVgtiBgg5AXBvabYCcgpRpKYBAg

DMBgWkWdayC+wfCDEMOAAAL/SC1npQ3aYhnBYuc+7LTPzctaOaDOB6NrxViPTSlZHKmgzXimWvoFT9yK0Lh11kXVfQA+mfW536lHGFN/m/ZUlvzY1BffjBY4K9vuc9bo4rO/CDrvzA2mc9/e/B4vv/37W4DSpAQ/JfwkBH7d/EoY/jBgkwn+JO4NBAXf9P3JXEWEBs/sF3Z3n4YUF+B1eAS5uicKtNXb1JVpNFX/Jeh/vmggVag35+cHXurLfrOp

4s0ICPLR0TgpBJXAXKiVpcOi3pNaDuEysO41agpPVpey2mt9iSOLKO35DeglMb5m+bkqgD9+tbjb7D+KVNaaO+E/jSgu+zAG77ysheiYzz+qWH75qAAfiv7B+m5rSib+iKNH6x+TBvv5QWtxkf4iwJ/pn7n+Oflf7Uu+ftwqF+NkA/72mT/ptbBmWtO/7C6NfqEB1+v/va7oWUlIAHfQJ1giqAa2cjd6XWbHvd4UWmKpBpceujrioSAgwEeIcAJE

PXBW85jstoqEbcqxpxAvpH8D/AvwNbJ9SjwBMg3oImG6Ty4yIDgSUaFskvDEccEHogKWi8JHhbk7nOkTLQ2DtxqE+qSAdJFcC8Jqr4SyTpT4nyLnhPxL2jXJ56L2flrk73y7ZHzZPyAXmxL3CaAV5Zi2gwJVh8+2Oifa6whfJbCBEp/DtBS+d9jBDgii0Ir66+yvjl5KY6ViM4bkHbqiANCzHLg7biMzrDSky/oDTJ8AqACcirB1IDEzayMwMrIl

cxTDDRSyI4MsECyqwesHoomwYnIrBuweybGySfGbLWClst8C+BCYiyQLewEpSzLeAjiO7IBIjg1pbeMptDSkkSwSsHooZwagAXB2weKjsyewcdb/q+gUx6NsRgax53em4hx4WBe4lYEwaEACxBEUuAB2wUMdQE1IoaLUlSoRECRHOwQ2r0DIj0aEyDXb7wskBKpQQt/BjjdCQEmXRrooZKHBrSm0mXhqkilptCecoiGpbzogyrMJbyMTo3y6W+lt

kEz2uQVTZU+ZqufJWWdPjZYM+1PuvZWqvNjar8229uz6q+UoKU5yE5TpsQtoVTmhzME5OpgJX2pHGL7RWn4EL7yI0wkMF4OfTg7zIK4wZgSRaWqBxg6+LoXr7VSV6kVbNWFfvEBoAmUEGyqB3/jhS/+WgaXASulDutbXq5fnEahhqAOGG+MecLX4/+/VIdbNuY3k06PQG+A8QbQi0CNbzefbqMpLe8AdNaQyq3qO7+a47vMr/B4jtO4w0DVkmHBh

KYWGERhmYWoHZhDJt1Z0eegYx7XeLHlWwohdbGYF3Wo2piEHipyIXDxA9AEYBnizga1JuB0kEvD88qwJWB0gUROERyQsQKERvAP4u9CjyZ2t8DHQYzs2BKcuiGzqO4apHFzLyTpKGQI8UATtJzCaQUqpfacTqT5T2iTnTaOeREgqGc26ThRIqhK9oMQgRTPpqH5OVQYU66hgthz6GhK9MaHDkhAGaELcGBA3bNgWRNtLhWRiG9DBq/wMNKbQp9Bl

69O8Iu/YG2uXur6m2TwN6HbSUznCILBXLl4yG+w3u1Z7WazAb5zMOYD+4jmWbBwDHepIjv5wG3IDP6Ou6Zhe53OBzt65p+GfjLQk0jbn/74oiMEmg7O5LnABwGeVDwAAAnQABNQwBXDaewwKUrOAVylIqoA/oJC5HgoQMoZlwyVMYpsAOzkmgtoclJ85EQlFGcyeMpIqwDGQrongAEBaUOv50ojpqEBvMdgEZDgsXum4aW+RrAojD6fVOtTyRYtK

i7+mnlM7p+RoFMJTlwXYCv5aR2cHaB3OURlAat+EAKxEd+RvrtZpU3EbyK8RPDC4DeuKxmixCRxYP146UPAY2Lu+prAXpF6JrrJHAIKUSNTYBj7tSgR+yYEFEyu54NpHUoekYZEdU5cCZFmRFkYkrWRLgLZHhotiutRORLkaGhuRhIB5EZMxAN5H4gGUf5EDik0SFEpoZcOFHpACzMYqgg0UVYCxRwUeswJRTZklHJUQ0eVZhuURr4aVUxkIZQVw

eUZpFwGRUTWLSUcCIw54sbbqMAdu91LJCCS5YR9RmovDpag1hICmKZIBR6r8GoBXPq2EsoFUSNFOUCAB1a1Rq1NyANRULgJFUUR3m1GJKokS2YSRHvjSj9R/Ed9GVRyiva7jR6kcFGgx0rLNEGRRkYtEfApkZC4rRpImtHOAG0fZEQIjkRSC7RqAPtFsAh0V5GV6p0QDGZUF0Ts7omoUQB63RYKg9HFRvBi9Ghob0Vax60n0XCgcxaUX9HOmmsUD

G5RyFPzE4mxUSHqlReFgx7cAiKqo5jhhUmiqmBaIU2yWBMgpnZVSdEksBni/oBQA0Y0sL94WOrgXeKvAa6HBDJ0DxHjY+h8fJfg6IiQIKoYK5th8CBSXjiJgvAWDruwxB0EkE5Qg87H2ADgrGOuyLABPgsJ8aNnjKEOe/eE57AR2TgMS3S9PrsLXy6odBHKaWoapoL8xTkLbBeZTlxJcALQdLaTky6N4EbkLTsrYjAm0ERFTAKll6CS+dsD06v2r

oadyDOKChMF8I4kCnwxaT3PMEso/ZqgASxI3u16lM18bfE3BUklXhICuqImTIgPQZdSlaKMR8HVhK3t8E4xG3n8H1BK1jt4Pxq+jfHpKI3vR5dayjqOG5yJgaiG6+nHhiGhxeji97oAdQNgAcA8wI0DEAmUMSqrhpIaHynAFIa46vQJwLsCWw8nhfRbseoMuzPixxJTrqelErSSHoMwN25SQUkPRq3aCQB5xfA50JBLPQb4akHNx34ST5txAER3F

AR+QYz49x4OmhLyJQHOUG+eI8XDpjxL8vqGc+q/KhFIcVILPE48MtpULTS5snhGNO7pIl6326trfxhwsCuRF7xlEdl6pWYwXl5MhZ/JHi8qvoZfEPxxDNgYZK5cKyJHgbymBihArIoIxiU2lPgCM0dhuwpZupRryx8GGLnnAZAxcEYp+ulAZ2KOuObOyJbWqblH6hm0eijB26Xho6Zp6ClHaCXRegDR5Ym0QLoRfotblWYWxTlJcagsyYG7rcuOr

BwBnM7PLgxwauFOKKVUBSaUkAewQGaJjU9aosxoAwFBvhR0HVPfrFwwLhGwbGYFqwDL+X0a4yEg6KM4bpw5Hse5kOeilADkMNokmwhJkoilRiAZuhADCQ8BigyGGERqf75QHVNCx6G+brAaDoxDHxQC6iyR+5woKcCb5/6xxuuYv6dxuEAf637taIcAPkQnoYmgydgb60BSqUbZwucC6Jq4VgAK7lwKKToJQxqWgmGkQfiekrEMgSRADBJ+SqEnM

A4SYhZRJMSchRxJmFvCiJJ6KALopJmRuknTUSKXaLZJOYLkkXJ+isAgJG4ZiUkOmAHuUkTJOztUlgWPFHUkgQAgU0nD6zKdGztJkyV0k9JZcO64DJUzMMnCpZcGMlmAhKMql0U0yRwCzJ4kHCDYmPycaxdAKyXUxrJeVBskKR2yfb57JVLghaCoRyR2L5wZyf6jvkDzKyI3JjAHclOUDybWZmpLydqZvJvLp8kYuPyZS7/JgKbbrAp7AduYQpJ0Q

UpeGcKQkoIpETBmbIp6cHyJopZkg2Z5pucDikvBRsuqhl2skFCBdOTwPcSY4vbr/EDufDkO61hgCZKYoB0pi2EYBvieIqEpJVEElepYSRAARJciuSA0pJyvEkZmjKcknR+rKcYrspOaZyk5MOSTaJ5JfKYUmJGxSZ4bapIuvGYVJoaOKkNutSZyAyph/nKlNmCqUdFgG/qIsyqpfSROYUgmqcSgjJOqU8oTJN6V0lGpJqTHjmp9Lj0zRs1qRAi2p

GotbGbJgyTsnKMfjPQ6HJxyfYGnJZKeck+pVyf6l5UqSoHoKR1KKGnWs4aRqLvJ2lNShfJlxjGn1McaYuaJpn/smlqUkKdCkAWGadcpZpmSf3CopboIWmYpxaRoqXeBFsXL5SKKkgmThQcfdazh4ceRB1AHbEnCkARIKcgNhCDs3JrhodPCD12YElbDm2anrtoX0ifKtDeOB4UjHJElEsuovAgRDQnBcN+Ldp7spcYPZ8m0vCvBNxvGhIlLCUiRT

7yhciYPEKJemSUGueGocPGwR2odUFFOWiYbYGhk8UaFcSRIZjoTc/PoFYYElYHESZWAglL4QgMYsGp0gOcUj7aIzoduIjBH9puCgOmCRADwAi4CRAkQR4CxDYAADkHyhCIWngKoO4WhWBn8ckHjbeJ0ziyjQgN8ZTga0lemH7XRMbnWoZu2cDxT4M5APkzNJ8YTDQtZqkG1mSAHWQBaOm3bD1kXO/WW1S4AQ2Qmx5h5aSjhpEJmptBvAxeIjE9uw

Ug7J/xfDqm4hMXwdjHtpuMZ2lTu3acoRjZE2VNkvp3Wdu68G0VANlLZ2tCtmcZI4UBq8ZE4TEJThj3tRZGk4cUsDxQwwDABVypyC2gS2UKKJ4JxbUitxxAcEE2DaeCMWRF+B6mYcA2OpiItCkapFpRpfAsQHNJwgkIP44Y+WfPwh+EU5AcDhkZnu+Hih2lrE6SJ+8tIlt0eQdVzKJH2rdKj8/7C5kqJPnpMTeZo8S5a1BA3E6ohe3lmwiS24Wa0H

VO7SO9BHA7WEcA4cJHFYmtOIyPRrHo5wAfCJWFEZlkG2n9geL5ZhWcVmlZKAjJlOc8JJVlgANETVneccRBzgby7OhRELBsQJKyZUlakmgPwhII6znMU6Qvr3Jg6I8lNmSaCJBJwFcC6AyiGipaYC6NlLnBnUboBAj9+EuhkAsZy/lKl3+ARvgYcAPgAhkIoI2Syiu5FDO7kvqnuYJDe5ZzIoagG0xgHkYZw+iHlGAYeeXAR52KdHmXGseWAYop8f

knlpQuagLHRU0ga6ZZ5OeZkChJq2TloKQHIY6Ev4O2WcDIxIyo7JoxZQMdlMAp2UDRCOY7i7ZNhoCRI7gJyhIXnF5xAKzFl55IBXl+51eUGmB5tZsHk9MDeeHlwAkeeVTAUMeToLx5Xea9EeuKeR6Z5U6eUX4dJ3CsPksueeZ9nexBgedaIJv2YXICZM4egnWB1nNgBVwmULMB1AbEMQkh8NsCtCLAOwCcCgwU0G+HaQSNjNJPQ60GehjOrdnJCg

8ckH2BLQsPgE420cNjtzsalmUcCBSYibZkgwTOYZZaqs9k5ns5vOZzkj87mYUFlB/ORcI+Z8EWz6IR2ichGfyjQf0CGJ4jjLZgSdJLdzxZQcBtDBqGAiiBgyb4TrmOJeue6FuJozgpD1ZjuY9wc6PicoSJASSrFAIArzvYHEMeAAy6YouhF0ACoGzmIY1uzjAgTSo0iu5S/+w8J6m55IYmVFWFf1l0B2FJEA4XYeeVM4U2FbhSq6eFpsJSAuGvhc

oD+FNioOlj5HJhtlT522ZvD3oc+dpAL5nJKmLL5BidVpr5a3hvkTuzYVdm75ZQKEU2FERVEVOFbCnEVwo7hfGm1mXhSkWPKaRbigZFQRUOFwhX2YYF+xGjux4oJ6Idx5lARuUVklZV4sHzF2QwF8DHQiMokTDSnSHgVTS7wIp6WwC0pHS6eQEvdRxATpHFwzA9uciC3aEwBcXxcmVqThTAdjjZkU2LcdhIOZxlp3HOZioddLKh8GNzkDx3xVzbQ6

FQbPwaJwuSU5BZKEVxLU8pwlLYkCMOTNyeC5oYdDx0pwOYlQy85F/GQyRsHfYjAbGO8AWw6WZRz62BhbRFGF9uQ1nZyu4o1lwiwAvrmbgYAhAK/cm4P9xgCJxQkDqw5xcYWyW9grcWDg9xdqgTY00NIKM4WDADTyChPIoI78ZApkB2YImWJkSZUmbQI6CDPEjBM8BgoQAsCbAnlCMla6LCBzoNKokSCJ5MMLyLQU0FwnqwsAuCLSC83Grx48WPJK

VKCKknZgg5YORDlQ5ypfTwSADAmoBMCmpUYKc8HAl9z2C4wH2A2l8vN9RBCfgqvyBCSvNGUSASxQELhC7yBRGaOD3gaDxCiQtqXMAqQukKlSMxRIBEgJEPMCVAjQFXLYARCexaJl/3o8RSerGMurNgE0Ng74FTwBuzUJOkj5zqFumYkhwgi8CsDRkfqjtykFlcbqColJLOAp3o0kLHSaWo9gzmLCrcczmOZnxbwWAloEcapuZEOquVDxeTg/JwR8

OnqEBZOiT9LeWccVLnL4U3DCSzccvLLkQgq0k8GhWyuUJIaFsIOny7A2ubvFK+JJZjJHx+XnVkO5BMuiE0lnHHSXvcDJX8RMlUAh9x/EvZWuhTAaJVJBDlhwPYJjl6XBOW7AU5fEAilEZRKXEC4jnIIOluFXxL4mkZXGUq8OPLGWa88ZRbmS5SZREKOJmZdbzJCOZWoBpCXxETJplU4QWXoA8QJoD6AewI0CSAgeFeLWmtfJxZTkNJNTkKI2wExz

o5qAKnHg2m0C6RuCKwNtKUa/JXAKjSdiZDzPBQIDbQLS0iEiATY3WDKoRkzxRKHKqh0lkGLlHxbIkrlUEa5nFBm5fZV85zPuon+efmYF51BXPnonuYBlmFnnlO/DCSYV15ciU3UsXDKoKIyuURyk6GIkj5o58kpGp+h+hW5o5ZhWEnD1w9qPpBuRUdgFogMFWZ8ggOfxLlksQFAKpCNAzgBQBni5EJcABY+AHUC4AmUOVA8AlQJcBVyZWYg6W5BV

QbnhxzALMDEAAAPpwQ9cISIUM8UCxaDAVcjAB7A+kN2jKAlwO1UJl+VSFWAERVYVgjgQgPFDOAxKvQAUM/oIMD6Q+kEnCnIYwMSpEggwKQCZQ2ADxJm5gWkA5dV2WatXbIOdoIDicFDJcC4A8QLVIkQz4JlAngUcfMA6wN1XlVIOy1WHEHi5EESDOA0cR2xkQBWZcDkQVclADOAw1SOCZQoIAtXUVCJKDV6O4cR2zEq8QAgD9VFAB2zxAWNPpD0A

5EJIBiZPANch1ANFblWAOS1e7io8avjVkhw0nsvAA5//HMENsHFRkJCZYDulWZV2VYsWhCnFsZUSV+9MsCbo4RCCiPQ8XMRr3UOiKpUhkfYCtInAy8Lho58t2hgWR4I8mvKHE05WKEKqc5RZWZBMIX+Hk+NlcfJ2V3cWhJc5ghScJte3NiCUFO+5ZIWHl0hTppi2o0G8IXlIeFeW6OwMqfYIgm7Gpr4R4kIODBqgiKXjQQRJXCLJVh8R6HuJTwfL

lDYqCUBUvcTFW5qMlggpBVgVb9M4BTe6taaldu0dMVpA8utaiCa+fnIODBV3yCzVccBAgRXcATpaTzbIPFXxUCVQlVoJ0CZQD6WhI4mlqXJCbmuAIeBolqjgcYsvivBTAvJV6DLQk9fDyTIlsOGWyC9pQTy4VbdeQLbILaHUDxAJ4GwDPgRINDmtgfdd6WkAjAhqXD1gZaYKcC08k3YTCYyHJBjSyFWDLjAfwNuiyc2iKvUD06PBry+CZFXhU8g/

9cEKLVznLILJlBvI4l81uvgxVJCtvCxV5lz3FxXYhpVeVWVV1VbVX1VjVYQDNVrVaLXgN4nhETroN6F1J3UvKrJBtkRRaMAPQBeOeixE7pEBKWwBlccCR109aXi3a14WOzno52nBCc1M5dE6m1X2pZUW1dnv+FLltlZsIc5Rqg7VOVdtacKqJAubuViF7tePFIRkJTIWpgMwH7WBVAdUiWYR3AIkHP1+uMrnSVSWWHBiCPFvHUIKX5UnWGFqfA/Y

CqkzoBWzBF8Q2wgVOdeBV51LJdAJ/EzDWM4a1uiJLxmeRQFw1wxbgqfF8NpwFhVeCGPC3XwlxQDKVQAdmJ3X8VglTCXFAZ9egAD1fpdfUmCupXdSy+esBgLSQcMfYL/i4yH1iogsloiA/1iTevVECrddKXKC2yP6CqQxyF5rxQchTvxZNEjpfU78hgvA35N4FdIgjyo0GHCXkkAVXQjNldKIITNpqQcDDAdTULjeCpFVz4UVADdrxi1EDXRXsVkx

X6FwN2ZbmVsV+ZQLW5ZYwAgR1Abti4GBawNnVgh8lDQ9DwSodSIijA7nLLWTIRaFMClh6XLJLHFlYPOyTIPqpBJWaI5fORzsmDpGRLQ4PG/hmVQjYBE21ZPkZaU2y5VI18FMjQIVyNXnsIWuVguWCU1BEJfvZTxv0v8AYRwdXnhg+/KnYKqFqAAuzrx6cVHwXsO8QpJ6FtjfqE/lKdZtBp1XNSvRMRnHLbZmYJpA7YS4TtnZh7AuAKRFycYPNgCw

QfVW4jzAYgGID/AfYGyCJ8CAMcB/p8QMQCb80WDHZuaaZNbiN1SdvbjiOMDcg1nNhWLvX71h9cfWoFyxc2CY55wKMJl1KhbJXqw7nDCDUFCkM05Pl3ZfBhfA+NpQndCkEmTlyVkYjJCWyYPsE4QKAjZ+GAwsTguWcFOQQi2M24mgvYeZRQX8WO15qg5ZKNlQSo2aJnlaLnb5Pld8Bkt/8k1BNgvko1jLxFmrZpJZURIcDrQL+NY3JWVEaBUrV8Dm

lUZVB1SLVA1jNSDXM1KDudxkltWanXyQPLZnVIMrWs4D+JVkV2LWQstGVGbVc7f6ALt9YCN6dK11H8ASqjxAOCPEnTtOwCmFYcUXbqzaQgGtpZ2Y5DSZNRdvkExpTCu3pK87YwyLtSMMAXda32eo58Zf2fzUwFWIW00dNCUN00IlqGnJkYaK8mnhOC3wD8Cbw0zbJWvAIPKMAihTwGtAVg/zYkD6lyICIJxcobU8D12pdAl7BBQ2KwUvF34Ym1It

XBXKGotTNtI39xYEVm1YtpQS5UwRyjULkEtE8US3BZJLfNXyFfEpOT9KA8p0hX2cEElmo4cEJ/HbSuhZ+XttKVY9VlAJVWVUVVVVTVXzAdVQ1VNVLVW1X9t5WYO2u0jdRy0RasiJHiR1k7a43mFTWaUwjgs7U+1rtL7Ru1lRVnau3rtS7UAGfgowBKrP12wFKpHAGIoUXcAp7SKar5dLOvk3tW+fjHXZZQI502dznW+2excCT7HMe4BXbT8ZpzX+

0HiygNUBVwygCxDVA5EEfbxxLgWOgJAqeHBBPACMe1imFGwP538qD2kRxVpk3irWUSOdKM2R4KeDC2cENbHyGronctNIQ8HOJlxwtdHZ9ogw5HZbXIt3BdR1ptBQU7VDdsjUonotFqsCVqJeLe5UIRajVIUaN3tVo1jcZ5RF6RZkEP8AI82AsrnHEwarCDHaU5U8Qst0nc4n0lnbV/ZlAz1WwCvV71Z9XKA31b9X/VgNUVW3VTNXp3DtrNZ/x8IK

HbSGmdTuY4kLB/oNZ3XKUAM+3ZUr7XfGSu6AFD1OddnS53Qxn4NNBro1dSdpRENIX50HZTaejEAJV7et4LWYXdt6AhpTCj3RdaPbF26BIxUHFIh44cl0/tqXdBoHiHAP6AkQygGMDkQFAM0HEhg7Pc3LFPrS8Betb4tKrpeslSsCcmHNVPVCqb4eEEpcd/N8IyeY8lIA20hGocT6lo0AiCkag3VZ7W1qbdDj2eLORVySNNHQt3SajlfN1blOLSx3

5tbHR5Ui5b8mLnEtaOtJDltMtgeht2PcsJ1/C1iTL5ml60MujjArbVl79OKvgFkGdDjWBKIxYPWYUURArbxzCt1mKK3bItJISI8VMrcJwboMuHpa4ASNvEAa4muHFQTY+CeqrvVWuAw7R25oIDwGtCdgZwp2+zenZpd4cWeJ7AdQO9CSA5LOxZ3Nv4ZY6h0MfHEACqVBXogo2VXYdDy4a6HfxuclYDJBK9IZBuG7ZG8Bui0kpmeJDTy3boXEc4UR

KTYfh4iSm3nSYjVbUotlvVN20dNvQx129zlQo0iFm9jqESF63Z7WbdqOj7X6Q3vV6o6S8QWh00txxIH1q5FaZrUXQEfcdxR9owWFpA9VYB9DJBiffpJuNcIin322G9QJzbImgG7Z9g2rWWAuYInBxjEAxAAq1ycKnJoDbA7nPEHTgfVUiA8dhYFpy31RQI31GtydjjxmtbfRz3hxdQJRBCQzAFXp2tRDcNDGd0eANYLkx6LQlyV/4rECQiXIdogI

dQ2JRqTeN6ByXTA12hgKcN7ne0IbQ24Y9RxZxtVpZDdxPvZnWV5/Yi1W99vfbWYtt/fI3O1S3Xm2glq3c/3+ZQXpx1QlJLT967dEWTjoYElDWiUx0yubB1JZxwFjalhgUlJ3DBbLTH3J1RhVy0TtZnc7ksoAAFssuGLtob6igUeGlK6SbH3AgqYSmwpbORlMhTFQ0jN36PJmlEEAZKmVC6le66KAawB+UALRB/mQqXrGUgZzJXrdoyACW6gm0suX

By0uAOVRWGFcFvr4m5VPrpkyKSoro2QqAKcjlUDhuvreu2APLprUzheeDo8mxtH7IwH5E3oJ6FrLsxdF0lGcziojSuAh5UFcPFAcA6KPFD6ATxqXATRmKImlBmlGecbxQxAM3BnMVcBLqig9GFRR8UTZtgAKAQgNa6HOZsXYCAIyVOECswgySpSXR+6etQaAMfucaQOGkFACT6hAR0MwUayZihGuoaKyLVJgQEEwkGqStfnwofgHUzlwY4CKAIob

Ls84yMpaW15I9EAIkMygyQ/8hCKEw+kMTDRhpgz1Kxyt0b5DoZjQZgZPYmlCwGKfoQCVDlJisxUUt+vUNO+jQ11ktDUKW0MdDhwRXA9DfQ2rLlwgw2KDDDthmMMZDkw9MMm6sw9C4LDxLoEBfo7ymsPgjmw/nDbDN1LsNCUwFAcOmSRw9SgnDZw0kqXDe5pwCpsoaHcOgpmlA8ZUUfDM8PCUbwzKmfDyFN8N7Uvw/8MlugI06KaAIIwMXgj8TGsk

7O0I8lSwjhot0PFQ+gEiOXRmKKiO406IwelnunFNiPJFTAKyIJmhI74B3OECKSNgjFIze7Uj6AK50o4D0PDILw6JOtKdOBPe8FE9ghBe2YxdYT8HAJeMZT2JSCQ0kMC6KQ4DSvJeoxyOmKrVN848jqAHlGFDxviUNCj5Q6KO9Z1Q7Iy1D0oxQHbpTQ0qizDio/B4VUyo90NaUvQ8abcyGo7fpajNhqMM6mgUVMPooMw4OZzDJo+YpmjKw0GZgjJl

NaOSGajPaP7DI5i6MVUfDO6MXDVw96Nmxvo1B7SsW5mCmBjjwyGP2G7wyXCXMUY3rQxjAIyRBAjiYy2a1uKY6ShpjwURmNwoWY/CO5j+YyiNXjShkMkYjZY1iOb53hXiM1je1KUbEjDY2SM55lI5a67m77X6FEWSXRuIpd4k9MUWt2yEYBdQJEPFAkQxKjlXPIFKn95D9ZIQ/bY9UWjB2hw2eFnFyVy6B3KkarXYsD8JZ2nBAMJYzkVq1CbwGoPS

ITrZdpE4qwCwUWeR/e3gT27xcYMm9JEtb2/F88Nm2PSLtct2sd+LS72Et7vVx2e9P8rx0C+AKPkXy4joVFVIVvQerYF41dZFpgDzmhAMuJUA5pLec0Q6dqxDEPSyh8MWzjSN0SdIxVMbuHsRj0o4q6LJDqwmRJQW/AW7P2MBdnwRFKVF9YVKZLWdRVT3KEtU//pVTsCUo4JdiIeMXftkBVMXBxaCewNgO5EJlBnibAFXIdsR4CfXqToHSQkJEK0L

JCwdG0gGQ6VeWYY3dYh6FtKBkJwJ3JshpwIoMLSi2OfanAnDTMASqNDR8BQgGtu5OH9bBV5McFFHcm0yJJg5f0BT7nndKMdGbQ71eZ4U/YPqaHtU4PRTLg573kQX/QCjfAlYKGQNOGJffZqw0db2UBSaU8y2JVGWeEM250A2XTSq+GHy3KkCwQyMUGlxnOOsj6eouNZwTKWLRsg9Q2xNVUnFI0pyxg5ouZe5ZExzFZ+5xqyJrtHuvV5xQ4SQWMD+

xAZsaDmmYZOJ2FrQ+0PMTyoxrI0y5waGUVwSsorJQh1/GMD/Gv44sO5D5o6sPkTIE5YZmxbIO/AXR4+pQHru/+vKJgq4pEAbwTGLsqZjJmY2lB6ANKO9F7UXAUIEKRwFCLPCUZIHCj+zetLHkm+Q4oP6z68ft9HUo+CNpHAIJkfnmlMdM0yM4WqQ31nMz7I6zOyUI1BzPmKmIyOZ8zuwzNRCgyUcIHIUIsxXBizrUfoCSzxBsiPv5RAUP7yzNfkr

Pyji4JeMEu6s6HJazXoDrMdUes8rKhlRs8aMmzAzGbNAT6w+wDWjxcDb52z9+qUaOzNDoeauzHxu7MqGH/l7O0TPs1rSRzl/sSjCzogWHNiUx82B7EAMc+3PxzECInOhmWDEGZpzz8R2OaotWT2NT1Vxce0fUXU//FBd7stUUU9AIVOMZzM4wzPMjOcwuP5z5AGzNFzouiXPsTZcwuaEOlc0mNBzYtHXPEp4s2kDNz0s4QHW+Hc4Up9ioIMrMKjq

s/3PSyGswLJDzDMuXC6zCcuzITzRo9hR/jSw7PMpJ882wCLzNswFEtmzvuvM96m89OYnDno7vPC6+84LqHzfs80l1qp8zXPOw586gDhzstvKmyMt80Qv3zmC7WbJzqE0Yiixwxfhals3Gb1o/ZrPbNMyT80yg0CVmUKpCaAGoEnAY6InhpNw5bcnD5p4mRHMAE60vWpm0tbKgUSwQ6sCSyX2frVNLh0teGlyLNcICKpqk3gZMAPEfDQ9SnxB/fTn

6DjOYYNJtsocf2mW/k2YP8FG5ZYPYtzHdDNO9EU2t2ODXlbokjcPAJlCozGBAIjhNk/VjjK2vQqrk4lV/MIj3oJmQ4k3deU9RGuJo7XwiTeGmFO1c66AJnMgGwQDi4cGeruEBIpYo97oMKWqWeMVwkRSXClKyFGYBiAhsNnDlw8oG+pGzfc+84kQI4KNUVwm+ktneU4LH0MsQ5y+XDkZsyxPodDpy+cv1w1MjkAnI5wXsChgixmCwwjMi5KJ+izs

QQNb6g+k6n1goxqGhLA8qW3nMMQTHGCgZCkUflXIqSYWne+bAI0CNAYQLD3lwRVNMk7SYEHWq0Lhc6s5sAjACyL523VNsz0mryo25VT98coSTLlxrKAx+JJnMvMACy71memKy11lrLbABst2G2yzH7tgeywcuBARy5QsnLZy8kqXLHeTcva6dy8kqPLkTKUoEuryyIrvL6KJ8sbBPy38scGAK3mnwovotNQlwZAPaANmEK5wBQrtLbCuAI4xmAb2

pYtKXmormRgK4YrWKzisVw+K1+a1MxK6sHDUZKxSuho3EHzRaGtK4or0rb82AoTA60AKGUFGOGJhvhDafPmHZxPYAtzWoXZt53tEXRIDMrXxtMvsrELJys5piyzyvPpO6fyuCrWy+YAirLAGKtxQEqxeNSrFVBqsXLg2dctxQty/csqrNyy8syrawR8tfL4IXquDmbEAavezRq0CumroKxauYpVqxwA2rMKxelwrIqMlFgZKK7GburCzJ6uU43q2

0O+rRK9nAkrga0xTkrLxMBLUr4a7BaRrJSmJOEWPGV+0QFadqYuCZ7fWA4jg+gEeC9zLEJoDDAfA/95xEiQJbC9C0dN3J0hDsm6Qwg/4nvQTC/FmEtgK7nTMAL9r4slm05gTrrBjCFiK9CDgYPGJiG9RPgm1vFRgxN0X9ZltN3mq1/UFMQzQhSUs7lZS7DM72r/c4OaN1GDwD6a8U/t1Z8cEE9p9YJ3ScBJZCMQFIwyvS2EMyddjUMuvAYlgGRjL

+VhICkjnBkLK9ZDKzVMjgim4stVTW7dmgT5snC+Jn8RXov2dTaa0OMYxWOKONAJ5Pdmvhd9RfJtqbGSkpv0OY08OEgFCIRJN9az61o5Ul0BYtO5Z8wB2ykAZ4pUB7AmgKaH99tWIP2JxrnPdSxA0vKnFFagiNsUOyXoGMLnAoPoiBjScg6rVRc7UyzoIVieGC1GImOd8JDSPgaNLZcP06R05L1Nmb0SNwM+RtX9gU2gD/Fq9sUv39uLTDOs+cMy/

0IzJbTUtad7gzLmhVpqaRoOtgA8rbK1pOqsXV1pFqENJVpM4Mu254cDFwlTlhNSWlTRMsgNCtqAxn2vIIQJFiogVqFoVl0btl7ZK46M+jM1V2AJtDqqrwLgDdYmnHq1Bl1uPHZMDJreOSsD1UCg001mgESBHgmgMSr0120ySGg2IoTegVgVIYCgzQiW6gCbo0IDBABtj4mfFnaPCZJAdu6sOnwVxnXZWz8hylkKGvAIoaksm16S5KFqqGqiRtUdZ

G3kt39GLZk40bM3bm2iFzvRUtFtbvb1sktzi9YNwlChZOSg+goaEu2hJkFtJxeQAx2O9lsfN07XdYm7d2klNWTGI/CR0LJv4OAYfIHJh6VPMBoA3rqwZ2+FfhNTYMLBj3kOFBVISCaQR/mVHthQYS/4V+6u58zAIWuyP467ylH6t27huwfoGA9sB1rtjTW2NBFhQ1qWGvav8yMqoxJRQAs9TwXVUVZrICdZtDTiYRbtbWVuxru27PeYoGS0eu0Sa

4ebEa7sm7Huwz3GLLmwgnubFiy+uUWsk++u5ZCKGMCSARgN2jdopuUL1LaYHcDz3aKlTwnWw0wv5xeSxiLnwyQW6JtIIQCG3JWY5NQqV0xcgwrEuVsUeE6RNgEPKkStdBG+kEZLe8lkvtxrOTwVot+SzTu29tlgt0M7j/b5nM7rvXvaIzrG5LA8AcDrCXS5c8U7BREizasD872JRZoxL2Dkl4xWSINuivN+3B+VS7/SzLtA9FwJbAbQOVjzXMRhM

Q+pRM/Itc4cR/iS7sZ51Jkxn5pNkJhTR5qUUwCRGeKH865sci0mjwp3IPyKCKTbpC5yOjbmtidFUB3ckqRXDLC7DmaUZMZlRYspEWJo4ByEh5UpBz65F+sB1in9iCB/WBIHI1MNSoHcKOgfbUmB6GjYHWsXgcHOhB4ql3OCZiwfIu9JhQcIoVB+B5jM0a7wAKVoZIERraqwKRYprRRcZsSALaSONtp17f1OTuf8ve3KEdB2AeNAEBzgEsHFNGwf1

qHB/wuIH/+cgeSKacAIfPuWFHZTCHaSvRk4H9yvgcuAkhxkzSHdyn2np65B0HqKHeVNQcqHcXRNOgFvsZJP5yyCVYtvrPm4Vh/r1QLgCVAMAGMBhedexxbF2skDJCnF8eMRFZ4LCX4vpc0INfi37mGvW397UvNIhvAQKOrDUJobVJWlx1A1JtGd4gnPtfhI3cRtL75vQzYn99W6DO0++wqqFDdtHTvss+T/V1uVLxbd5U1LK4ZxueDEINfQT9Udf

/3UDonRcXLQxODlNv20u9+WRDtWdJXmy2DtTPTt6AOV5ms746EBlRTx/0wvHm7S27Zo2iJMAwQ7QrJYxeo1vtmVhcAee2mbfJL1Njjlm5HuTjyyrt4oWqGeMNeKYk5NNub5i1JNs9GR95vPehWMoD0ALEMSq4A3aEYAzxxR5pORb+9GNBg8KIKTgkc7eyiUTAlBXjpwSkeH/2sJPZQjyPQMgxcUWCIRKZkdS4wKD4bwB9JFa6Ds5cTt8a/02N2Ud

VW13GtbG+zf1b76+4t2KNjO+UsODLO4fts7aOtsD1LCWeGSLQBRf/3boSWVPXwQe9Gcf7xAzuy1XHUYq81wgdx0AeccCwbsjF+mKIPCcBVSsKMiwBonnCVw6KEeACUKzouvooxUPOn4ZlfrgTInLlDQCq061PyIVw+kKgAAAfKgDcy2DCotMyjMszIjgLw6gBHgYtHiiZUN5k/k7p6KDxREU+kMJRaue3kicZDPYvZD8LtbgSDmAcBtqZpwoqG4a

si7x46K60CfmoDVj5cJjysIqVC8MmMY6vWO+Kv+gq7vwRgDnrxsLyR6fMM61N+Cz6uacAhgUWyZGY+ulxnoC+A+gJ/Bgeu6QedHnQuh6b0uxJ4ZRlRbp5cwenG/lGDSsHRT6cln/p3UCBnwZ9athn2HhpA56rIi8esiJhmtTJUiZ+XDJnaZxmc8gWZzme5n+Z4WcjUxZ36edZVBhWdWR1QNWcPqe7s8cxnjZ+dETDt+ub7tn8KJ2cPO85j2edeWF

P2csGg5yQbDnagHcBhA4577mkoU5wKgznKznOcLnULNazLnlSclRrnrIHbpbngyfHq7ngCPudaUR51tESXh50qY4YiKKyDZ+WRdpsXagIqMCaDX9cmsgn/8+Cck9UJxZuNhVm3CctaWCdcZ3nMKeH6Pn3p6SKvnwCAGcFnn56GehmEZ3+fRnGQ4BfxnIF40BJnqZ+mekoUF3UDZnsF8JTwXrVL6c3m02eAioXVZzWdYXHxzheaxzZwRdtnuc0QAh

MpF8orkXdZ9ShUXsTEOcjnDFxoqn5LF9+BsXDhRxciQXFwmy8oCeiuf8XCBOudCXBMKheYoFNHufkgkl1Cr5Up53Jep5l50pf3rpi8z3+xA2ukcPr1i3JNL5RgEYD4AfVXAA0DIHcDulH4CidBtYcMYCL2aslaYjQglsDbAHh6PqsDnhdIGnhAbk3p4G0FBUhtDmZTYK/iZEQREMfxt85aMcAz2S0DN+TwOpDPmDtO0UtMdbW4712DnW0xs9b6x7

9LxAW04t1c7fHQChqwH0BWB9Cyub1hERxOHDybwVp04nf7snV23bIjgXsBIagwHzIY1QWp1XY1qVdsjkQm01jQdsswCjPadHVWAxDtVWSO225L5YXzLQiuzw6lMdQIEBxmlmJhQx2jFKyLFwwoxSkQAN59ze7pvN8jTf5jIkLexsOgd/E5axwG0evQrBLsDdIgUrofcOxMoF2h7QCxHsTjoC/Cec34tzNShUn5F2b9ZhoAQBy3ot4kdXen7bd6F7

nm6ts4nQOWA4CrmXRQyNA2UABtaTOEWTBdIV+ODvwbsldwmLwrwOQMHhklrBBASRNru3utEnSESRVBW5D5HoVwM3Y45VIQ9fDdXk6N2n943RTt1bVO1YOzdiicqfU7qpw/1LHe+5qcH7X0ixtbd1GPECbHA25fsYE+/byebc//fSDWayQSccfAaN4nW2n9jcupwSkAezf+hTIn+n4A/5GVEciwWDPdfH+YZtASq4zQNjRBSIOQP9jQe2e3prut5m

umHtReYe5r6APPdBAs93bfwh+exidpH0k+NeZHuJ9sguYzAHsD1wlwIVm+3lJ54lxAsHRbKg+a8UZP70iQIiCHADrZoNMtqNl0ItCLwHSDOtcPPj4Fb3WOHzV1L2mgqi+1iB5O/TOZJksvXy+xb1F3H17RsFLm+2qEqnix25WA3B5cDfVLoN43Kt3RiZOQZ4G+NFzK5DxKrZB96uVLwtTQaqJtzb4m8Pejto9wAfqwE9wsHeuD2RKJKwXc7KJa0o

bNUwf5veaIruQTSuiirBiQNoDaA+Z7aLZMPUY6Kps1t+cb+b1gBrThAk+qwCkAjABi7G7w1PWphAyeb3m9UEAGOD4UGVN8YBo9QyMzW39QwLFwGW5+OrKP7YpVQWPEbl8bEM/Iq4DGYqAOAQygDzBIreRuKHOl+upAOigLJ1s4CYImGCNnDLogT1b5xzJAaBRGKw5kmCyKO5rBb4ArlAuldR7SjbsRoaSfOmjJRtMS4p5YoNIee5BAGqZigwFIzO

BREuvkqGGagUnO4APFHou1u0rNZCVWUQOnPKE4j+WcMp5swGKyP/zPI/2PqeSkrKPWGLwDoo6j5o+xXS6bo8+HaT6SLDniMCY9QGQT5Y8C61j9emYMCjyxmOPzj7mlzPzBoguePsBt48tn3LlXOZPOT0iwXPLK2E/lVQQLOBRPVlMEDoocT5XoJPdT0k8pPxLrLeIojIpk93aOT7LMdz1sQYCJjwrhwAlPI8GU+JmWtOJHdRDot0k1PaK2ykNP7l

E0+mwLT48/uAHTxAjdP2cL08yMLSYIGbjIzwEUZSEz8EWe7vABuwK9snFhxhcGt9pf6H3JBCf7q+l+dnjjl2cfc2bdCMheYmkj/M9KzfzCKg3PKzx6ZrPdoCo+bPN1Bo87PmF3s/EveVPo8+nxz8Y/AgZz+Y9/PgCFc9/5djz3l3PjIg8+UBp5u49OmXj3WrPjCzF88BPbIuc8hPnReE9AvDzNE9gv/h/E+1PGkPU+UgsL+Yrwvdav+frP2TwG+5

Pcs+i+FPWLzi+/6xKBklJohL9U/euZL7G9u6jT+YrNPl7qzHtPU6tkrZz848y8ZKooGy9DPT8zNFjPhANy9GLXsXNPDXExYHFzTD927e+bpyEsAlZVcpIChbxRwP2kh4ZE1PBEG8JJUMn2tMuhFob4pnesY2DpRp6wK0pLwtT5Ic0sYbYCuUeT7xXQ3ZGV302ktG9vk5Mc02Bd3KdfFFd1RtgKwU1Dpqnu++IUrHWp/XdH7jd5LDxA1QPqejYhXh

Y1tk+EejtJZmCmxjucIQ5/t8PFxxJuLbGtY/ZvhGdetu6+m2+gB8cIrWWTO2fQrJCNAGRAq3icK8sQDsq+Cely+2cnBIIMartipwPb9fXHa6cr24ZzvbrfZ9uTXEgDACnIygEYDEqCkJUCf3EsCNCE5TguOy88bN0ZMboITs1PucM3mUdnahxAETXTMiPzz9dm/dY4b44D5uiI82dwYOL7uD+McpOj7yXfPvmz3Ts5toU7YNu1hbXXeBZDd+/2pg

8QPl30P3Oyxj463Ce0sWa+RURES88WytsJVjmvB8Y3iH5/y8bmg3CCiPLKKJktokCAVTFJmZ0Y+mwkgAsxwoysRESWGBj0Ml5UdQHJTNwqs2eCi6mVHgAJ7kV2XCBAZgB0wVzWPIKKDJtqcAjds/IJi4bmko0OKzmNppTJBAZZ5ZeR+EbAgRaUiALY+3PHpjxSIA0h/iJZf554dT+oXL2lBwGartOJigXiuK5rG2JnlSUy9kDmZQms/k6aggwUUi

l6UikfWr4Avejq80o/V+QuLg3cI1/zmeKHUBoAoF4uY5nSSJPrAA+KGBTIUJEIMAAA3KgB/gMSt/5QAvepJR6A1ozBRzMGtL0ZrU3ySijJMBI37hdm5cMy9UU5jC6ijJwQNIdMveX3YbMpjX1G7kUoo4S8uQoVLgaNAwUS7B7LC+jGc0QWNMEDWASSQzJ5U6kHhAT68o6JmVAsX5XDxfnFIl8nPKX2JRdgsPel9iyuRz6drJlQFXDL+uX4SBMXhX

7RDFfuABrvlMguigf0/+KF7DepoaDF/wLBQ+S47GZ+m4ZmKgs2KJhGZirNlJs7lOwGy3GUfcNoL0I70/4ARrjovIUOzqk9Y/I1OXCfmYQK0p4mIegsx0Glv1Eb5nTrLb8butLmMnC6gyS+Y7fmKJt+AILTMaMyPAMcFFTfpKIpeXf13zHbKKd3w9/eXT42H8AAhMzKGzigu9+kiX379//fg5lQzyUwP5FBg/NipcasilVjgxhA1Y7kpkGNKI5EI/

oaOG/TilrlShdRxP0jS4GfkX2rVUwFLWDcoliqs4D/fftGZh6KkoYZlwpSeeODmj40l8a0GX6L+SxSRZLfm3pSnL8K/Sv+8ogZGKFl9uglLwLQzPqy6yuY/Hz/CinfIQPG8Vf9sIVFWYMYYQ7xvGxqkyuQIsPVQtXa26HUSKKPRRtbPRecxkmWb6U4XMxQpTP7BAbP5woe75u5bCj4ACKC+zDyhWudfQ1/HNB1/UH6fMcRQwwc/TPpIjJAAiBBbR

T/Ju+NeY5XBWJpQIcSVoY8zZwV35NPMFw2FfnSUgYCgLObYYFKNZKfmDiihAApTEofkSP5e/TEoaUD+yLv4eiHv4gvGJ4YuCRRsuZgxh+L070ickC1gCVBD+R541DEhioreQE1+cwBmKehggUNKBUiKZ5lAGL5xfK5AJfKC6b/fn5pfMWgi/LL7AZFRZ5fAr7pweX42QUr4PZAZiVffRaLmGr4jwTVJ5wRr5lwRNKtffX4O+ecydfRQFWXPr66EV

FZDfTV65zMb5kTa36hmFjIVPN1KdvOb6MA4KJjJIdCiAfgFNuVb736db7ooOP5kmWgIfmZP7ZpdlCHfGajHfJ/6PPC749zOAG3fRAG5/AYZoLZ74l/N74YAz74/fP74A/Wv4g/HhZWzFiYQ/SQBQ/cqwkAogBw/YhisGfMx5UJH5mXFH68iVyDo/S351qSP6T6KYGAINla+AOpgE/If7ejEf5woMn4iHGcCU/aYzU/CCh0/T+DooRn7UoZn6CAJi

7AUdn6c/MkAWAnn5WAvn6pfdcZgUJWJ2AzL5i/UUYS/KX55fM5hH/dwH4A+tTAga5RHnAlDpATX4qLDtgtoHX6pAzYztfQ36KRIUAm/b0z1Kc36yUesZBmFIH1fCub2/a4yO/MsbO/S6Ju/bChi0T343PH37pROwzgxIP5+6UUagpMP43fOkHbnaP6SRO5g9MQGLx/Gvzy6JP5+RFP7yXNP5XnZoGpwG74IAlRbtA/P7taVABF/F76l/XoEPqfoF

V/QYE4A4YEN/JNhN/CAAt/MUBt/Egwd/DwwHGIkwLA6QG5Auf4gZJl7HA98wAxcf6XMSf5MAaf6AIWf58A7ZwL/PhRL/UNxkAh0xr/YCgb/H4H2An05rtYf583fACH/VwHH/fAGn/MsQX/KqgeUa/6KvR0x3/BF4+vE746vF/47+XGiZUNbCf/Ddzf/SdR//eihJJV56+PI2JPRG0yQA8Z5ZAmUH1GeAHvKNoHIA/MxoA5Ci9A+UbYAoH56g6EFk

/WpirIYgHVMUgHHnCNBugSgEZmOYE0A+fT0Az4zZA0NCpPUFweuDJjjgzgE26M2KijXgGLZWQwFJIQGWmZ2LAIMQHhUbaJSAvv6yAykA6AitY9fLfxmiFQFgGAS4aAw8ZaAxAA6AzMJ6ArWhxgOEbKXNcguOXyQ2wYyozQMGxGbQcYGHYcZmbYw5k9Qy6wnQ24mXHZAog8wHAYfy6H5awG/A4X5Ag3yIcg6lDS/CfQuAor5Qgm/58rV/5VfXwG83

fwHZfBr4EAYIEoTUIFYAA34RAvRRRA3r7Rsfr5xA/1COvT/KJAjYETfH05TfdIFQA+b45Axb75A2QzCUG5LFA6lAbfIUHlAnb5O6VJjVAxQ4nUFyD1As75JoJoGzDFoHygpAGPfToHF/V75l/PoGV/HUF9g+v6jA8H7LOSYHRpWH4OzHK49/EqjI/NWiVzDMEY/BF5bAnH6tJPH4HAtUpHAyW6k/cn4XA71ZXAvUY3AkIB3ApJDL+J4Gs/dfRvAp

CGWA1CE/AgX7/AjCE7/G36ggnL7gg4CiQgkr7Qg/1Cwg/xjZwBEF5KGlDa/UlbogsIFj+ApRG/MvJeiIGImMfEEIvJIGf+EkEcgtCZh/ckEEAJ34cxJgEhod37nGL34hAMDy+/Q0TIUVkEh6YP7nMVqEVzbkGR/CUTMxHqKj/QUGgUYUGZhUUFkLKoGpAi87p/JsFyg1sEKgjZh5/Rcyqg7oGGQzUHGQ6v6A/XAEjA+UyN/QBDN/aMwmgq0QKKE8

aWg+YFjJC8FUjIUD2g024nA50E2sKihuglr4z/c1jegyaLpGJJrL/QMGhRYMEcAUMGWvbf5ZfSMGOg5GixggiE5QmjJ2pO5jJgq/7cKIiFUGY1YbAnx7jqBoF5g7wG+nIsGHGEsHYmH/4kiQqIAAz16AmEAHGxGKIQA+tSCQmAFXfWUFZ/PaFIAovIoAzsGGQnsGXQ/sFfMQcFgQYcH0zUcEPGMgFqpXNRTgmsazgugGYoBcE0g5gGrg5PQ3RHKi

bgoZI7gr6ECA4BAHg7hRHgpRbiAgt6SA60EXggXRyAupg3gpQH3g/ACqAp8E0oTQEtMbQHsBN0D5mL8FGA686X3ExbF7MxZPrJ27plF24VSTj7ZNTQCSAE8AUMVSDEqMk6LXYXoRbCWCGlTxbqXCGw8WazJGTcYBNYJ1rpcEXwfQJfqUSCnQxEeXKWwfgQ1HXSqXXYB7djK/CWlGvCiJTB6VbN663vGrbG9SY7F3BU6l3SiRDYZrhkPKz7qnRjZU

PKpbHlMWzxASpxbHNoKX4cdhyQdhyn8E6bP7CtJwQJQawfSXbBfN0KXHEe550Te4rAeAY4ORAb8tbjiCtLD5p9NAZL5Mj7TgEIB9Ve6i+2ALD5wrFbitSPBicA4D9geICEfRkAR2VYAMfWOw6cRLAsfFvoDvc1ql7QrA8AbtBniIQD1wKACZQcG63NcLakhGlQFQaLIF8TaTTecIhREH4CPQEIhX0VeIBfceRT4UrqJ0bzgToKtLxVCuGF0WRBp4

d6DEFWSRfANeR6fVuGmWO96ynJuG5LQh4zdMz7dwsfgV3ch4rdSh7wzIeHiOHyrxAIo7+VPbrbHR0DqWatJine/brcA2aidN8qv7XxZrEOD4kzfh4RDDeHoCMgZUzFxrg9DbYHw1PrbbXD4pNYYDEAbADitDTA4RNuxjAdVpF9DaBXbMYBe2eYDycHgA0YYYAmI7XB4JT+H6tF7YA9F2zMDU1rsfczhhw2GiqQEcCEAM8TxQZ8DlFeOHoAGd4ucG

lTHQNjAbkaIJsqaHbV2NIgyqR4gjQMIK4IyEDoI5LJzSLkIx3ArY7ANPDBOXXrx0DdC0Im970IluFVI5zwNbMGbsInnK9wmwb9wnhHdbPhHi5EeEagID5yVDeLSVGNoC7feCNxdKYy+OoT/AYJbYOWbbKIhD4CPJD5nQa7Q7w+474CO2xbbRpo7bCQDYaJWCXACLBraTQB8NYgCDgOXA0qBAAqcBzBuTJVqvQOXAhADxFPbRgbeI41qsfP+QfbAJ

GAI7ZAcAEcDxQHgD0IciBxwlxa6CGBEucDBQPQZdAfAeoRaobciZw5dCKeKcpzSUMhFxKfBzSNdBIdPPjvTQ64Fbc6CaoSbxfAVxyJ8THAkdcyqF3E3oMIwGYr7SbpTHFU5sI195Ald97V3T95A3DpEe9EeG19c/YBWUREERbVD/7N8L4RQrzrxM+Jy2K7rEzYkoqIsmaFTIazQKcNQhw8RxLI3+orIo+H6I3vjO2MTgfVEOzy4IvrLAZdB3bfBI

zAD6pV8MCBLALFbzAYLBnsBSA3I+gbPbZj73I3xFsff+FsDR+5lAeYCqQfSAsQbtDtNDehhbEGzF2VT4PQLQYL9c9CgtWSprSY6DSVTAqYCZMhMNEHgc4VeALNX5rYOI968ACbAlI4yrDSJ7QIPcU6CNSU6Eo5uHiNOhF1I6Y70dFHBUozzL0bAG7LHelFrHGh66nTQA9In4BKeakJgfRpyiCJLLbhTuxzAQe7zbAqY4yMVFyITERaIpPqOJTD6i

4Y+HrI9AC5wQYAlwT+JBYflGWIjnAIAYYBy4MYCkDZsBOYYgAogK7ZXbd4Ah2U1EN9LxGM3cdxWop5H+It3CvIsoDdoDgDPgAo6NARcA6tck5uLIaCRogoip0M6CwQI06NCBLgGZIeQk2Xzr97Y7RSeckKzyGgqhtBeBKWGoTgKKMjsaSpFSnHB4ynElH4Pd67ptIh6KndmwWfEKYtIj96qNVY6s7EG66nIEqQ3BKZNQUuFDWc4BefaRHrkdEodL

ZLwJrIFAzCQL7U6VeEHxWZG/7ApFfo7RG6+MR5n/C0QZAJ/RwaasZ1iQFTpJDJrVTPFJ0IdjFMiTjHXGbjEomUND6QPjG1KVQ7NgCVTtuYIKIxRWxlpGAKgnDm673EzZ6XMPZ9TDtIDTOV7R7X1AiY4iZrYcTFPQ3jGGKWTG+wvPYO3YwIebYOHLiId5g1XLIngfqpg3S4CEAKuQngOADEqU5CYAQgAngKADkQKADPgf0D1wHbpRIg0JtIZiCzvM

LjcnNLxNtPdiOOKT788EpEfTfpQodBHyUScgq6IOuoAQ2k44EONHkFX8RhwI7TnAD6BtkfFHwtdvAIAdoRQgHyakbAh7wY1hGNbcz4/XT65/XUpYlomu5fvOz5HlfhEjcAmo9I9hwfTHDqn8UizzwnY4pqCFFEzIL7TIkL4MYwqabwjRGLI505Z1N7ieNMwTeNAHoA8aCpOTEzSqwKcqgojrqJYfbEFeA8JZEA8JLNHxpQVN+gsEeiIh9UXjHoCu

pgAe7FcPK8gvQbIj51VoAwCNIi7ADdAxiOYDXTFAQBBUXhTsQayyWERDfYooBgCQjS9YN4Ad3VhqDCEHFBokIhFeN5ph0aHG7Yt+jzqB6iaYagbTSFTGtASTyONSZAJ4KLRY4sATiqJ8Sa2QLBKQUrooCDVD88FTL+SU6DXYnbFgCE2QpqYgqJBWk7jsRnHddUYRqwUGCI8Y4CU4v4jjAY9gE4iQasYQVSc4IoBY9dLaQiTO5CSGXg3YguqbgZhw

7hD+qBccQR3hVoBNgbk44bAOyy4zRDi4t+gnFUaTnTTWxvAedB6SIoAnFIaSrSNHzKcHYDm4zcDUaE7QZ4Yli24qAIO4/Gzm2KdhVgA6bzAd3GtAHLGp0VSyHdArEoCYrG/NbsY0NLIjuCa3K+NC3GroXLFR4tuwISWPGroErEJ4t5oVYmJqtgDYy5gEQAXeQZxcMRtRdAbNT2gMvE2YzE6WLW1HDvR6x9sbAD0Afqp1AMsr0AQYDdoWYDdoCgDk

QNgCZQI8Adsd1TsWSMDRYygCzvDpBp4EnCL9U4ApkcIgvaY6DS1exzroSyb97DcKqfOCQElKdigwW7Q7tBCTaIMo7X0Le6xtTyYuIWrGycQYANYzNHMI5rGUbVrGNIgEqcIvuFoY2z5RTHU4jwtSYQ3C/YMPaG7MnDS7jY9h4i7MBTE5SgqYFNtHCohbZhfZbELIrzZW2NbFACbOpPbXOrgVMPEMDOIAQ8GDYToCQSDBPbHx4BfHJ8OkjbZDAnW4

LAkYCfsAT9PHqx43dpboPhD5aTdhkE5wA3Fe8RREdTAXFUKxDgaCoPQWdgF4Y/FsYGRDMExIATIZPj79HVCTQZ6Z/EcOgDBF8pHQKtJHAZgkr4hJHIbdrDyWP4jXoKTanhF0ho4dHzMEnJEHhZDqPoDGYGtV7H7Aa6bxbRaA0NHATq4n7F/EIYBzsGaD/ibSQF8GRA6VBXHp45PhR8d4AG4V6D6E46CzsEFEBSDGYDdCXGxALlqbkdaT0gK4DME1

6Y3hWLjtYaLIvY5hzaIRfqfQSYSrAWIlV4U6CdOY9CnxGYJv0SPBOTB9CrSNSzLQKYCxEiFqmaPInLAdO6x4rDQRkCrFyQTxKXAWInp40uFBEm64XbWPGHhV6DH4kvAHAcgZtExHIyITokk4Dgg9EzVBdIE/GDE0YBF44oAl4zShb6TGSV4hFDV4sFZ14j9oN4ovZHorI7bIKOH+gbapwAI8BLARcAagd+4UMRcBCAIQAkQfqqI1X5FA7CQAT44s

AxYlziJERwmsYCEQjSMsDQ7QLAPQOWywCBXLWCY4qaoWtKsNF/Cv7NshFY+o4+cT4n6lTxJ4ohuEEomkBX48vi34h9621DuGUo5DFvvKu4UPUtGDw8tHDwpz7p9Vz5Q3VEjtTYjgFEqRE44SRGYxcjEv7VHA/Cf1E0YzLzgDNeGhfJbHqI+AmSo8cjSohYkoEs1FoEswRkE+o714QyqpECXg3cewTFhG7iAiMTBcPMgkYdULjwgN6C9lfniM4+6b

0gIvBolLPBKk2fq4yHjYVYz8R7hP4gUhKPgPUVYA7sRYD11XdHY4zXEFEMFGqWbRDLAP3HW4fYD9KDERXAREDTQQ4BkEqvCBcBCqbvHOJYlYnFzsPhDdjWXrBcGLj+kx0lT7Z0khkt0ksqGcgPBIUqfzdnF2ksAQBkp0nBk10koCKoTKWOCqgbfsCh42wkw4s0mgksujoCX3F9gFASG4zoIF8PGS50DMkp427Ee4ysmBYSEA1k0wlFE3spkDGYBr

SUuEtk1koVkva5VkrsmclWslmkmEmCJDeLwQBXJkEiFoXhTskQkhPD1EjRCzkp1pbSVEDzEyACLEsvFv8VYn/IGvGl4wID142+5YnJvHOYy1r89VSBLAUgBTAdVTVACgB1AdaDEAeIBHgeYCnDK8TPEzwCA7Sk538cXpPBeOhI5MQbS8f4kbQesrNOFdCx3NYr9CB3JFeJdi4dJFGySIvDy2DaAsk8zwVbZEk1YurE348nYYktfZPvJ/GFo7cqu1

Pcof4jjq/vRz5N3bqBkkvDF54GRBVtXGTjY4jHS+GKybQOxylNZeGCohOrto6rKwE7knbwhAlSopAkGgDxqoErxroEssn2k+LAi8B1oukA9A58A1A/cMgn7aTuQLxJ+zbXFSmQCGSlZkyYAcolbjSQDfDa+aSkc4vxp6lC6Cw3Zgq+cN0nMlcylv0Lfr6lBO67XGSwvY+ymZk6Cr7AShJryHnGbsdymikudhkaETA74k44QPL7iik1dBg2X5rCIY

JZK5ewll2QrxYIo7FXYtSmE5Llo9ychpSEwuqJUg7EXYzBwCINSnAosSyyIa3EcaN0kLQR6APYgkpPYr7F6U6QnrabhIxLNLyUJE0pgASqllHGlQfYn8SLQNSnzvTjDUFTQaqwNqnOATsZQ2UDal4dWBqUuCkxLdeCSIY7QjUsam/AUMiJETgnTUxkKzUhYDzUrkIoCIuooU+jShWJ7SwddamIyaeqIUham7U9bQnHa+j3UI6n/iXcmi4DYnLEiv

GDoKvEIAE8lLE0YoXkxvEcfY9GFlfQAkQYgCknOAD/kwLQUnYT7nTPUqKQKUnbAd8T+BIDFaHdo5SQU8Kt2L0AedC2RVpUnICnCFo1o6vB3XEnTn4rB6YSbyYEUphG5oilGtYvuI9w1/GoY2lHoY7972faikNBJz69oceE3lR0By2WGll8BG6WwUnRjIGoQCoubFComZGqIwR5DWMvgAPFjF+hV04m3N6EXeChww0Lm4hACBBy0pe5rZB2TAoqXi

q3dgjb3MV78Ofe4hdQ+45reV47IWWn2Q1E7JHRLoF7bYnO3RzGu3a8nbIfACZQJOCNAA+okQULJ/IhngAo0o5g2QIKqfUxCbvOGmX4LVDfiNHBKcVLaNdRJBiWJyalU+AQTYETpFI26jSWeECjSCbaE0xuGkosjbEo166Z0prEUbJUINI0ilQzYtE2fcEpUUr/FOffADDYzzjTwrbQ4cTaRmnRtqDEm0Ksk3XL8Upm5hfcWnsaHtHzTCe4Do7D6k

khVF2YTeDatdqTvASGADyQToAQwYC5wXAAcYXyodONVSbo3VqMfb+HxYX+EsDQ9E1QQJHZqChiZQGAAwAM8Sg0uAgxI0o5ZEMHZGdB4jx4a/D7hNbTTyEjjX7b1oUaXBF37EhGGIEXwQYu/HVbbNG1I+U6/XRDEvvHEnUovEncIgkm8IokkDY0G6A2NmmhVE47JqTuyn8ZO4C7PoJSbUJwf7FeHzYjklmo0m5lAciDxAPCAUAfAAjgOinwOX7q6d

CBitkgSmio+WycJACq909D5+hfulDogxHbIGVpBEL2xUFK+G4AEuBQo4xGldMZEuYQgau2TpzuIH/H8BVenxYHdGUMhaz7o4zhb0lBrVAeuCQIjUBRxOh6RY8GntBNGl1pSOqkaYaSy1Wk5IoqSCqfYxqZbNhI2wWrqQ8UODtCC66F0KPAp8UKzLcXhqf0kY61EdElk0v+kdYgBlUSIBlFo8ikFtMunqNBz7M0pu7SZI7CsoieFqHL1F/iHDg58e

tGgEm6i0hH8QTIKAki0kVGdo5py7hQA57wmmYsoVSAIoZQCI9ITEQAPJnRANWk5aayZ7sJSAJAPngKI0bw/xQPZ60ww6QQ0nrALIy5wQmdzoAEpkFMi2mubR9aO3G2kOY3/j20jBKFYVSAkQM8QEgbAAngMfE3owrq6wZLKI5FvYukukC05fAp6IDzqrxWSDYEguE9lToIrSd1oqVfnjSQBSyEacMixU/7HlwunJE7a96QYgz7QYnOmwYtuEsIx/

GF0nxlkUsKYMbNpEYY7U5YYkeFJwHpF11VaQp8ZXLV1DQq1ZYjTbxVumstaAkdo9ByWZYxlRfHtJlfYcx4ofdJsAs6id/QcF83ccH4iSJTKUGlCNAfJmneGR6YsKMFVuSuBHgaoAiKKuDAUSlksQJ1GLgfL7AUSoDAxQP5+nfL6jAjYwTRcuCDAMx5TQh4aMZex5wGDUzzjM4GuxCGLyjTn7KxDlmKGLllJoHll8s234BjHcyCsnvJwGMVn0Q8IH

KKXCHyjZ8AVwKuC1gQlnvIGVkwpSiihoBVnZfLBisgQUb+MUuAKATUaXMR+ZzMHig8xcmhiULKLLMf1DqUQNgVqEvKcg5UGFjCACM0ecC0UeXRDnRwBOQgVkismyBuGdtSVjDODRQwcyBXSuDfgGAAmskBBmsiuC8soZI3pbVy4GKNCkAeXSrnV3SBAc4xp6RyEYoLSj0mJYCsyLmgNMRF7TLeiDVjLr7GpLgzJ/S1w3ODq6yXF4Fc9VqKSzG0yM

0RPSYsJFD1GCBCEs0pnooWbLiRZABz3e5JnjA9zi0O0DoshoZYssKg4su5h4s+WHjsgplNeJWaks5GFiUCllUs+wwFnaoD0suuBMs42Csst2KMAdNlys81nZs0kECshZZCs78w4WTUwTDMVljQ4wHr6KVnOAzlnigeVmPs/lnoTFVkvstVnZwDVmYg+cw6s9fR6s8uAGspgBGsigB3swDkPsxVnPja1mVs21lsAe1nPjR1k1zLQzzMV1lsRDdmAx

PQxZ5bxg4YD3L+s44yBs4Nm1UMNm0XCNmoLZVnTUaNl4AWNlJFbwoJsntnJs+qoIENNmgTNDlZsxVm5swhT5s3ShFs/i4ls2woVwctnLAzyhVs6lA1sutkFKf86NskW5BmDqhkmcUEds7q6dXHtm4LftnkBEUC0A874ZwUdnOwIlmTspmIzs3l4aobaCP2VSxTYIbCa3QnpVhXS4ZrQ2l6Ysw5yECw4cQOdldZBdlos8cEyjVdmfkddkyGbOYEso

lm7skllH5ff4fGOoCUs6lmns89mMs1WYss3KJss29nCczNkWsp9mgcyp6FGCDl1vGXSfs4KLfs8hZ/smX75c7lnAcpVngpKijgc1GCQc4KKasyqFa/OSi6s/VmGsikAoc+rlAcjDlWstZh3jFqh4cmphUUJ1nEctSJussjn36bUyUcn1k/qO3SLmejnhAENnEAJjmWrSNnFcqigccm0xxsnjldrNn6QIVNmocgrmNc8TluKSTkioaTkdFWTlls+M

wVsuWjVs2tnRUdTm4ETTnNs4BA6c2x57ffTkyXT+BGcvtn9eAdlgjcznqQyzkzLbdkyUKdmfwezk57Ht5WLPt4zTHYnThUOF/U9ADDACgB3OWoBEgBbSzMsDqefaRCdHRJaVCURBL41o6LsZ9HwQdk6QPdmD/iaRCjCW3FSVThrg2cHbVNAybUFHQYYPbCnVYlxATOGenXowz61bODH50n4qvM9rEIYyu7tbT5lgM9pEQMzpFOfSJEsokRERMjJl

qWJaBYzFeLtCIiLHoPOimk2bG0YzBn0Y0WnM3GcgicVD5iUuTan3WVBtXRE6BmDH5hQZaFDoM1zzmTFCqGBJ7PGVl57DOe4O87n4VebszuUV3kJKD3nKKL3moeepi/6Zt7+83l6SefOGYFIrzE6crGgQzzl73Coo6Y6E4wQg25dpE2kuKR3nB8hfSh86iBu8jK7cA0NDe8mPn9PI/zdvOBLjXNHn2Y/7IiUp7zN4njxHgWYBQAS4DTM5lGPE+vax

Yg4AvAXVDjNRHjA4oyaCJVdBbU/YojYiVGM88FrAbGbwToC6Do+W7R2M/OHRbDpyRNZxm53Z673MvB4THe/GS8mnz5ojzxvM4ul+Mpna13T/G/Mpz7/ksJka89mn5QCyZUk11o0klHDekhtrnTB3IM8xREYM4WkLYi3ks4K+lv4FZkJ0qWkWFR7oUXcmhrQjyikcs27+yeWn7BBE7B8+YYJcslnm3JAUK3a6gVMrnkJEnzq1M9znqY7W7dTLPl63

I2lR7MBb2SaAVeMWAWG7JLn83HpnX3QOEDMlvm8kwHIO0jiCnIGmqb6M8Rq8/vklHIhqJEXPEU6VaTRZI9putbhJg7U1KqYAmkcnLoSdyN6bC46+z5w4hGa9SthjOMHbeLaGzCSHfnYPO5n53RhG50iXn1ImY4Fo8/l0bS/kanXrE38itEjw4Drq8jwaa8rbS24i2SPlUUI0ku+w7hVSwTYQWmm8gAVYMoAWiox/ZhohhmQCiQDhhHihoCshb7sp

LlxHS4zHOdxSWSE3zWSaob83VWiqzQ4LVAMijmGI4LZCrRQG6fIVlKA3REUHIVWGbIWoAAAA8YshPAsqH5QpcCZSZcB2cfBzTg5/2CwECGTOzMm5kyFGTOlQr8uMciIo6+nDCtalK5bXIlQlkh683FG10LxD2WSKApBIkFogk+giO5KAhY9MztAwCARYv/nmGa1ERS+an9GzXKBiNyQyiAfwYMcBiL5CgOUhYlAIAJ1AT+GKCJAljCTQz40eUCQO

pQ6UP8xshmAooCIQARqQJc1QArgPOlh6cPO2BpkhyGvvPtG/eUDQRbhpccPPRQ1cib0XMj+FWqzWCpwXiAHQyIoFcH9A+gGEioaHZkXqyBFI5lQWYf0Fm662RWpQ3NedMWbmTxjmFKKDZc0IqJZZUUiFbCwS5peTiFLSU9BNAvGFLkhSFbkjSFXZjMomQtJkRQsOCpQoKFI4CFFJQqKF5QvRQ1QsIOGom8MjQsTywURaF3AL/SHQpFk3QtBMVQv6

Fqsg7YgwsHMwwtLWr7M5FmyimFVs1cKFcGpFrLkWFMh2cif8FWF+1HWFKTC2Ff412FOlDQmbHLjCq3xt+IFjxMDoM+BNsPwAlwufONwuJB9wpuYjwqwYzwqdeVgFeFkvyP0Hwo4AXwp+F7zj+F+yz3W+IvBUxyn3MNbilSkItpFWbhhFnzCrk8Io7YiIupkw63rgqIuYm6IvLgmIuxFysjxFRLOBFlikv0aC2JFTqxGoZIqOeFIvaiVIrzFGBnEU

9IoT562iOg8uSaEppwD2ehzAh4r20x5At85R9385J93Acrb2iFcAsS5CAviF7Iuyuxou5FXil5FbrO0oAorFFOQuFF4ouPFoopFFOooqFMotqFcooohW0WaFKB1aFxGU6Fflx6FWou5kAwuqAQwr1+owr/+B3lZG0wvNF5cEtFCwqWFBKRWFeTDWFWFj8K6tBdFW1jdFAzA9FhwtFG3otxMjBjEuAYqDFUfhDFWFjDFNKCeFIaBeF64zjF7wspWS

Yu4Uvwv+F6YqbFBIqzFQi1rMuYuRQrLgHF1nInZRYpLFZYtBCKIrRFqYrrF9MQKUuIpolpTObFGCwFmNUJJFYtC7F5xh7FNywhFzEqhFBYqHFyPIb5Q12mmzfKgKWPL2JZQEqAmACEAPACgAlQFLFQn00ZGHUOmmHAAO4RA5wIwDemtuPYw7DkjpfxVXeRpw1qIGxDaa/O8kG/OEE52m2kVWIzRLjIE0YvJzRHjNl5ZnyppHCJLuXCI62ivO+ZP7

wrpTdwExD/KcFT/KaEJk3Qe9JIs0CtTO6srWiJ9/CURAQvN53VTAcONzxuBN1puYDWJuQdRxqYDmYA8wEsAhIivRhNzuq4DH06Vx3ZqKaLTUtvKV2EADQhXTMKZMNF6lykuwF2aFwFxLHwFzBV1p04v1pZAoPu84uNphmLosPwL6lTAtsxyISDhbArtpWkrtREgA7YGoAoY3aEGALECGxBXRJ5evRLoSNnNsK8Hc4OBGoanJjEsevWnhrjiAkXSE

1QAZDISyzNjRXXUZCjxHGRGOAOmeguJped1N6P9MaxJgrzR65XAiRdMsFHzO6xdKMJJmGLsFqYHkQPSM5KAoQJ0MTJm8kHytgesFRuvDzN5NpyCFnaJDg0WkRZyhDQhnMOJQ5cE0ggCBbQKmyKZ5MpTglMupl2cFplqh2scUqnKJWeGg+Wl1eCFYR3uOtxmlPnIuy+mMXFJtIZlFIIrgzMqViTm0Z6WxLAK1tO+pGPJ5aKDXiArUGmgBABpuxPOn

xW/U7s0wU+ABwGGR8HTo0qXCYpN+HqyOzK6E6fDTw3nGFxH031x6gsLoy0CfCEPG+AcFVnkAMqwkrjNJpxgqeZD+ILpZgrP5MvPp2b+LpplFMCZTNOG4v0kWAw2IoRs6GRpMTLF4DbRH5T0ASs+Ur4pMLKoZkEBAF5fGU4WTPM6wB1KYaEOEgxkGLAwMUI5Q0PSi3inFZJUTplA0p+BxcrtAh+Vyi5ctti7sRZBuXMhibMtoagqi3QFCN7Kk0oz5

WmO854ewoFxlw6ZPUvrl9kFLlzctryrcoDM7cpvZncusxcspSOCsoDiY11fWwzNgKEABPAI4D/WS4GYAtnnNyggvQ0AZAu07BLtxL5XB8GtKkQpcMjqVIVAe4aIKgZRyj4uGyjIuNl4J1A03iaUqQZ/PKvehG0WE0p0MFMGMP55NOIp0vPLukUpDl+JJ6xZaIRlxJOowuwB6RC8QNlbWCJ0c8I4eUkhg6pYTRRJvLZJuU0CFaTLhZgCgicq2OyZD

xx6l2gEXAZ4grgFMuAQYsn9AT+hjBTeiABlELSUKwqViLZ3qGcrNXc5cBbQjMl5ZIV0pAlVkOBmoz3ByZzFk3Mh/0+almhiV21iwUWTOPFG5kvYj2+/NxMBO0qoVNCvLgdCoy+jCopBMrNYVpIIEgHCti+UowzZlmCDG/CsEVBZ2EVr0VFGYioKUEir8u0itMoclCmYeF0CiOzkUVflxUVTCv5oqhw4wC6j1Qb4inqFOhFevMr/mjTIghkJ2z5Bl

03ybTPz5C0soV1CtoVjMvoVVkSYVBisBMRittFzAU4VZip4VlioEVcF1sVW4KQlA3kcVGXykVKVFcV25yyizZy8V0VGUVYlFUVYzHr5Sjkb56kvWlv7W0lEgA1Ai4H0gcAH0AxKk0AEWM9psmWnxS8ipCJYWCIyZBul/nTJ0pDVz427HgkWWKjpaNIxES8S86q/MQesQD84EdxEw3rRoaHsp/CbjJ9lR/NMFp/LaxkCo7hUUoV5sCvhlPzMRliCt

Eav+PCZT/NpIEARWZROgzhyDKv49cTzhqcv/56ctSZMBNFRIcEk4jEV7RCA3zlLpxZQHbG0Ab3mBi/wJ0VYshCRy5mpGLCuyVU0OMVdovyV+IG8eooDucRSsNm6irosiKsXAyKth6qKtQA6Krv0XayxVcBhyVJiq4VpKCJV01D4VjMlJVASvTxKZF3CuiFawlzKIFOl0z5iASleJhzmllAqNuZMopVVKs+YaSoy+dKqBYeEMwhfaiDMuKryVpioJ

VbKuiAHKv4V3KuXl8CVWlLPVYFPSu2l6ABHAz4CgAxKirgswA6gJkrBEgSra6ucuraYgybs4RPjocN1ge4Avn58/EXgTFJqEsyVXgfCTiCSAg7cb4mvoGvT8lNzLsyBguBlZ/VBlvsuP5a5Vukz+Ja2/9Ll5/11Lp7HXDl8Uslgy6B6R7xLAk91CJ0yTJGRMVnqEBOmaOeCrbpGco7p4KrvQ9uTIVsKpyZhcu0AJEBYgaywtWLEGKgcKBqFuHkVF

GikZVaqsf8yK3n0aoBSubhjzcg6uJBX6kuY5cEqFLwzKiCKo7VXatzAqAB7VAqH7Vy0MmiWSqZVU0PQyRZ1jmrZy1ZBSmnVl0Rglv/yDGi6t/BOx0CC7DidaM0GqaPMvqZU4sHl4EIleWMXFV0EPiVsEMSVVAom07as7V5cGIm66s3VfarkcA6t3Vw6rYVh6oQux6sIuNpnPVOsQ2Fc6uvVS6sNVnStSO68rvuv1N6VI6NHxpyHigbkW6RJ0smVg

8jjwBpXfq1JKn6wEllaNjjdlsRGbaTDSAxtdW0kEEnipWO0Lo4dGmAOPleAi2EWaJyqAV8avve7jJM+WJJIpFgs6xJdIopATI26QTMjlaOmmgPSOvokvEIiNLR0kwalgg+/U3QQKt4pNjTrVgPQbVYfSnJ7Au5q5CvGWlCrIga6u8UECBpVZ4B3VaLEyVMGscB56qc1EsoXVjMgw1yArbV1mpA1FqzLg9mqg17moIAe6pHVWhmC1GzCYVFcEqFXm

tvVYiPvVNaMm8i7BkqqmLeCIqqHlBtJHlkqrHlA0vbVlKv8166sC1Cqu3VZcBC1zCtVVlrMZcZWqi1Hmti13mthCuexXlVtJvuOGsvJeGvNV0ODGARgEVwLaGIAgHzI1bxN0Q87FoZNaKF8QdOAk9eEUGrDX1KnGC3euCNY1+RSFU7ksQeoaqQeY/Iwq5W3/l8+0AVUGOAVDzNAVIUpaxECtIeNNJpRMCrhl4DPgVkDKU1C10cFg2wMaF9HjxW2V

15FmkMqZ3T3o6ly7KNauhZoKthZEwUEkjxFIizariGbary6FcHIg3NxCYG6t7VGX1qFMACaFaUDC1VWuSup6sW+COobGKZwa1qonpl2gHB15cEh1IQGh14Grh1Qz0R1Q6sq1jgNR1XXOyUGOorgWOvi199kS1bzWgU5DXT5YJ1FVl7W/VrTL/Vg0wA1Givx1hOv+QECBJ1NQrJ1g6uR1VOonVaOtp1o8AZ1K0rGK2GtGuuGpeR+GowALEDgA/tGJ

EKEEG1y1yXkYcAwEWRECwy700wVeC2ZWh3amTDVgg1suoRkfEL4v8rfpQTjW1fGojVgmvTpOFP0F8Tn35RnzZyRFNM+kmqDlln1ppF2vppfWK9qNFPzVYys52f+Lc+p9hA2MqjG2b2q7ufyoox3jgRxknTTlBmr+1mcuIVZdFBQrfL/k/JI0xgGvIgBWqF10OuK1EsrF1dOvK1kuuwhsuogQ5Wvp1cWuXVeOrL1UOrAMleuJQ1epq1rSrr1y/iHQ

Netq1lMpTOLet5ex102yLOqfVqWugC6WqiVn6vM20rxhOefL510qpL17eqJ1ners1JWsIOQ+r71Lmvr1g+t710WvLgo+ux16ZGc2zWqmmSuuusG8tV1nWuYA9cBcRJ4EwA9AH/WuuqEF9CQPaReG9UkFKslfJg8Ct/GT47GHhRPKiXkcnzeAOwHLi9srjRTsptJLsvEE57xOVQMuzpB/OM+mJIzVYUrmO1NKgVwetAZDyqu1TyoQV+atF592rbuW

cu3Y19mF2rS3QEvnx+AwuJE2P2r6WhCrBVRMrfEbuogFFnTJlPwKLyWUWnllQBblv0XditcvhVPBrVKJcqblAhtnlQhoDMmm2+OmPW7lYn19UuMmBOESoaZU0qaZMSrnFwsr85K9AC5O0rENfBskNghuGhS8pUlSR16ZAcP6ZisttpQzK2l7fI4gJKhgAPAA7YlYAdV2tCXkE6BkGU9Q+AzZWq6H0AlUZAzLAK6g16+OXc6fWEdOdKnUJXGsPYzu

vDVAmpOm0aoAVtzK91+2rQNvutMG4CoDl1ytO1uBvO1+Bsu1SvOu1KvMQVn/RgZj2qMQBOmQ260BiZROJaWQyCv4odlk4e1xSZgAqIVAOvpUZCTU0aH04NBcplVJEEl+IGpTKECFK1pAH71o6qPV1WpnVl6phg5xhvVreoGN/KwN4Ixsg1y0PGNcgTHVEWp3VKGpSYsxpi15+rqZOWgn1joSn1KWrXUorw0N0SslesSqX1ufNleosqSVK6sGNkRW

WNcOoHV6xpAQl+RYCyGo65qGqvVcxoON403tuiurXlyuva19+ocNEgCEAiNWKw3t0rKWsqG1r01cm3gWVq2wAg2tLW2gw/MhaciGI0LGo7kOvULwYEk4194UrYPGrDVG2sjVQmr21ImqMFjzIuV4MtTVUMuk1VgoHhhBrilt/MQVbg2ERyUqG2nRzh43SCJ0A93LVa5FkkqRO+1ULOYN5vPaN+Xk6NQdxB1ZU181qYpeNW+sy+d0VGNdhn31lOsP

1kWtaVMWrH1Pmv6NSpuGNCzAgQuRzVNqxuP1+ioP1A+p1NJ+vq1jOuOND6uS1bOsnF/nXn1s4tmlOhoXFehqXFK6qNNrxrLgZptDQ6ptr11pu2Ytprq1+psa1KPLROfTLsx3SvZ6nWu7QGoGJU9cAoAewCMAUCNhyczLBE6Nm9V6fDUshcXCI/ZV4JDBIwpdGkclcMg84rWE0Q65AmEobTJN62v41m2qpNcatQNPutX2mRv91J2vmO2+2gVBRtD1

tguIN0OHmA11XopXG0qN10qbaZGLe1sIAbaJml082CJKAmerba2evrVnaM+mcpoL15mpbVFCoRVmUGWC5cDRqYIDAMPerGNYZq0M4uvp1BxsZWgGoPNFcGPNsINJ1GOvGNl5rp1p+oONWmzEgLjhONj6rON7Oo0xAsrFVNxolVXpvml/OvJV95qPNt0FPNu+spAr5ob115vaVwJvllrWrBNP1IhNnAuyESwGwA+kA54fuHcNI0GA2T2lWpW2VDJp

02n6OiH7sRpwBxU0CYa4RtS2COOrs3exDVY7CbNrusSNSJMF5xNOE17ZvF5SasuVEMrXYTJusG+RuilBBqKNRBpu1YtnmA/0nHNbKPBkS7Eks6CsT1doXZgcEhXgB4VaNLBv+1Mps3NVoW3NvLS6lxeo0VmUFTFj5pVNQZufNlptC1F5sQtTetP1UZpx1eWrMtD5pgtjetNNgsGstjeuH1FWp3+4Wvstvlub1n5vkNd6sn1f5pdN38TUxGWo/VHp

qFlMrxFlPprFl2gFct0FpPNHltVNwZrgtPls1N/lqq1R+pytJ+rP1yFqvuxqpGut+pV1uxM61FAEqAJ4CrkMQAoYg9PGV0SO9pRDQXgNku01u7Be1JutXgeoHGapETRK1LXkF+8CXkPewXiyW10FBW1BgeoGrq0wm8CoPXd13FsO13srpNYCu7N2RrTVkETyNIDPEthRtiljNLzVI5rim8ls15suN2KPnSJ0hkxT1MVnREd5XD6eMoKlBMulNopr

HFQRPlNOiOFwKAzWRLDKXyHDMnRCAGbAPAGVwSsCuRg4HVU2iBXRWqFVwbtjHRwBru1AgDoG26ItRu6J8Rb2wPRNqI61kJtg0mAGqArVT2AxKjKN071at6Gnat6eLk+0qi6tVDWq6O7XamIy1k4J2JwRTXUCVa0nt1EiPw0iDyuuUlWjuEwk3guM0Wt/krE1Yx34t9JoppPZpwNtyv7Nu1sHN5dI5N+apmZ3Joe15LXJySIBjExJoyl0iJFCgmzG

QdjkNlEpq/2Olpz1JtiGkr1qFO71ow+uiK+tjth+tEgDl8auDEwjQCcReABlaL8M9sV+A5wXoDk4/FRVw58OCwvwD75hoERtTHx/hlqLRtcjIxtmFpGZ2yEXA+ZmJUAiirgmssixp9LatpdDB2ZpW+axTRN1OOV3aWqHPssliyRTNu9RoiHnQyagQ6DZtWAnixfwnQRjwfPKwp22uGOgtqClv9PE1mBoD1NyozVdythl0ttzVstpHNCdrIN/+Kag

hwGrtZtnrppms8FGU34SfqlwVetroxT1tYNcLM+J+uChV9DN6N+8M+tqyKttQ9KfuG0FzgxYHcwxiN2AucCWA9LgdO46PS2hqNnRhHzXkJiKJ5dfS/hkjORt0jL3RodpXozyKqtWNpdsJEH0gT4FwAkgBc+iduJtWk2fE4ZLPiFsEtk8yuDpcBs4Sq8kO6+dqjpCiDHYkgmyIVZLH2hdCRsw/P4SeRL/EW2uuZyRq/pZytWtR2peZG1pEtmaq6x2

asimMtueV+arqW5RqVt+UERi4yIqRNLQsQAQzNK4yAZty5uBVWesAFRUtyyeDIIZRDJIZDNR06lUv+6KNtj6R1PeAPn0MtfdIttG9pw+W9rKAjQCnY2iDEA8GnVwWK1VUMrQ+qOiEZAfDOGAWK3OmWhS9s91C3RQdvXpIdseRYdrv179qwt6AAEdzAEIZxDIIa8JBc4amovpp6FLwsuP3CUKNS4AoW4pvpNbs6eIQkzBTx61dkxwcaJuKj4jYI0V

NgGhSLTRcbRzunuoi2fFuClzds8ZncMSQm1oWOktvuVe1oZp/WJKN+ao42rn39qiJVBqFbVLAtaXIatbWkRSAi01IXGoxf/P01q5raN89o6NRHAwpqH2hVu8N3N4lMFJoAikpIpPqphRJCdMXj0QVhJHt9hOidmlU2k3e3idrRJZKjdTFKcTVQGCTTV4LTUvUe9IPpR9M9K9AgvqvpSvqAZWGaZglS4cXE3ulQlCVOlJmkaJUlUe/Xh4fpOWdlTv

wq6zqlKpAi2dEgGwAX9p/tf9v2dqpQcAg/SHqJzp1KIzS9AaOBipV0q6Q5iF5KciAVJ53SoSK6mWaTdVWalFUAa45A2aoDUxq6ID14KZWgaW9PRAhzSYqxzRUkZqo/tScEwAvHkaAVcBPAU73UZt6Iw00Dyzwb9V549su0gm7yi4m5G08GIiLwbITQRxOChAyalx8MBrVICdAWkSDwmQu2V5p/NpjVAUqPlaTqbtGBsydWBogiuTrwNUtrDl8moj

l3Phkt/WwVt5BqDgCOIh4siBw4CuWjq1TLYw/JiYN+tsKlD1SxuZQBbQ8UCTgPADYARWQeJzVqJu9N3QSYNQ76xKjgAFDAfA/tCalf3QoZz1tGcgZAzwTpws1dvIgA5Xmgm0PKLgzsUWWZKtjdzozfUw7Nlc3/iey+zlUOJxWJ0rDkK0HDldNsAUAtpAuAt2hoStuhrZYSSrjd6bos5ibrmyO7gV1qFpYFNhsGZO4i3lWIVUgmAE0A5EGIArPDkt

9LpzNGGleaUPhkgUBvYJ2VL8WoGPGw6liDu8uWfpTXUI0tjlGJGeHXYpmSnk/GoVy22UZahOz0Gsrr+m1JoVdiapFtWRquV4UqaRZ2p2t+Tq7tWrsOtmgBLKw2M3QIiUAkNLSVqr2rUtHNJTIlDXeaD1pBV7Tt0t7iQjd7rVJlpgPqoFc0bMe1HLgA5l5oglHzOp6yGM2FGuMngDUoI+X1SzyT5oFcG4gjlBENnN3A9i5kg9etGg9V63g9YtEQ9v

TxQ98lAmSGHoKUxHs0YchvzC8mMC4InE7cOmSitbwX5lZbq51IFp/Vt7SlV8EPqqRKwI9AxibMdHrDWpHuGi4Hoo9b5Co96HupWWHoTYMsqa1qPK6VpqsHenboPExAGJUYwHGZkDh/x0CI9R/AzY0o/SysV9HXQEDu1o1k0Mq5SM3IKNP72OEVIa2g2fqdR1nqU1vUQHmGiCdQnakhMz/luDp21J7u/pCavwdGTtClrdtyNEtvVdN7s1dzG21dPl

XmApGpOtHyrnQceB+Epro8F6tvYp6qHdI3zUuZUyMet0fTDdtWWA92wDNtjDPkdcqO+tSjqeJZH1GVwWDv4diKcwm0BcwlwEaARwBcwDIAjsKjsWA2rQIG8wFqxYjMDta9IYGG9L8R4drsdkdoZ4wwHrgJNXcwI3gM9IvX4GtRJ/uCHViqSanCIycL1qkPE0Qa0GOKhGjs06MwidfpE4aq71gekrrZUp6D5tiTovxhDpWty1qVdoXrFtEUoi9Ylq

i9cmpi997vmAgvX1dA9tvKkPGJYDuvqN9Ts2u49uS8VIXOmxlO0tUpo6dv5WK9dx16dReqbqsqMHR8qL1UztiMRZpTEAvwGIAK8BMRytXNKqCL0sGA3wSPwDEAr+zI+t9vsQg3oftwdpRtDyL/htju3p2POxCTiyrglwA1AGoHltHro0Zo2Bsl0dDv4BeEFdy7x0kzQl9U8tmw0pjMa4CwHMy5iAWka/LnY8iE3uqljVu7KmQNe/LSNHZrJR7cJb

tYMwvdL+O2t8vM7t0Xuoew5ofd6ETodVTs9AqOFhu+x0GRmJS5RmCpgYt1PE6kyJXNkfUCFfDsKwR4B4ARgEGVdiPhNpDOBqYjttK1UtyymK3IgnUEGARIGOtAfoHaQftalG8Nh9oHtIgi4F+sayxlWuHuUIsNWSUGqwY96tJh2x0DHpYgjfK7DnCVr6q1uTshD2gsuy1YFv4948qz9aftGqSnpjNltOv1oJoqt4JvMCE1yZ9FAFmAJEEqqYwCL6

7htD4OqECCz0GcJ2mrkFfiyl6q0B0koxPiCdJOGwTNvDJanFEQclmadDst7sLGlpC7Gilde7olOB7uqIKBpqRAXqId/svPd2Bqe97drydhvre9xvuktSMp11iXqG28DPYJb/Iy9txFpyk2Kz4BfCPxLvu4dbTvd9droe6EgGfA7mCJAVciWAhxODd5DMKq9rokAUcUiKhAF0lZvp+6gfq9dobuh9QHujIIHrCFXBtwZFDDJII4DJI/wqVWGfvwDh

AeID+y1IDqhy1xpdjLqhbuwcRAs49lfvLdnpsrd3purdEFsPEBAfigRAeSUZ7Mb9zbtXlaFvb9GFs79TmIm9EgDqAlwFBycoHOAQ/qnKz8qYpEg22gr7tDuvKiWVEg01sW1Itl/nTVqrwGqaqHR2VMRpwQatQvC6l1BgUzsqxXFoFtKToIdd3r91Emse9l7v19Watk1OarvdPdofdVdPN9xiUr44cGw4b7r7211u/NTFL9UCTpnt+MoK9mAdGca2

i9JSfrb8HIMQBFbzye3wvP+jAByAhAFDAIskmyHAG6GLFlDQeswBAGzF1kD+EF0pQfmApSjzghLL8AoKmCMupq3cDKQwYaIJUh+IkpQKbpuSd3xSDcszQAxcAyDWQZyDvDD6DhQZpkxQdFGes1WCKXz1mlQfYox4LrGdQY9MDQZyB46mnSCHrEobQZEAjOony89Sr4gqmPxSHQAtJApYD3Hordy+vuNSVqSVnQeSD6bw7mvQYKDmQeyDzMlyD+Qc

seRQdKBpQcmDFQaqDcwdqDp1EWD0WsaDwQGaDZUNaDdzHaDQgZa1rbra1Ygcx5OjiZ9hACEALaHwAdCmwA/9o9dSdv+867DSIqRIxwiQTnNUnyJwx7GacvkgBVxxUY0U1u4JV3qJpDge91wtrWtTgZIdUmtEt17pv9Hgfe9XgfmA0DKf9FRs9JT0CyI9dKndGXtxKcJNDskXz/dPDoNt65vQcYPEelOVnh9xlsR9h8OR9lXtR9YrWVwUm1wAFdm+

A66KRA6cG39SwAORGtX4qGuE9sasEa95jqG9hrSsd9PsqtjPrV1VciIgfHncwerq59DLsiIiIFB4tJFrSxHD8NXu3u0F5FLo1dmXUZ2lawK0haw2KO3dpmWKRC5GUyzThfKiJIF5tgcwkqJPqxt3vQNjge19jIcD1KGJe9rIcod3duodI5oeJbysf5oVXBksNPOm1BrraGvS/9vAEiNnwGN5kQfy9kA0NtMptDsj9ijd/TpjdiUAr5Y6kDFLvyq5

K42dY+rE4xtlCEADFD0UjZ1rcT+WUORNFaiRgHzMcZmLgGe2QoAgePEdQI1W6KAeWKEwgQNHoeY0jDceoazg9y7RCAEfP1hJ1B6hqMGHDGbEDE44dCAk4aq18RznD6QAXDih3yoy4fjOa4e5kKkM3DFcEeWe4dQuh4ZI9cmO8k50G7cyG0fRe2TUNb6o51mWqr9umJr9uWpZQPYbPDfYYvDg4ZYU14bCOY4YnDy/kcBT4a6eCAFfDS4cD5a1C/DG

4ZlWW4f/D1K0Aj7ryPDpj0Gu/sKb5CZuxO9hvsdEAHiAGoHCEHAG7QzgH4YRgGcAScH0g3vtf1ScEuAcAGj9Hrt/JrxPtafWFn62kkHAdJDApO7Eg6rss6C3CWCDvqo1QPoZ84r4irAhWLVIVQmqZfDQQ6CNkbDtdr899dsvxeFPsD6Ya7NDIauVOTr7NkXrzD++yHN9/sQVR1n7tseohAuMhuuuOBpa4yNJ0ofQ0wutpadQtP/dkoaM1naPbDse

FK924gkpQpOGdnAn0JMD0FUQCkWa0whNdCVLSjzgk3IowH7AgdU8phdUSAHiRoa/PCK83wl2pW/TRNyrXDVvnCWAwhOXkkZGMyC8AtgoZKB4hGi3iCvqGkQvjNsTUbKjrUcqjHUfapknmIKIgy3ifqKWdDlM3AyPkvoU5DxKk0FMphdTGj7GF6Uk0e7k00eKj7ZNjwrjmEkVaTuoI1I3CStXHYh2j4JMwDIJQaJE4F0sFVNpN2px0dFiT9nnqnVK

KjT9tkpRQCujrZRg6t0bpJnUe9Rm5o0jEfDiIl0cToX0bjEYPoqpr0xjoqRPGQ47omQi5NgqVCUjRasCO0BXnuj+2mGW3ezBssIFLJM0fDxiMc/EGmGY9aMfsJx0amEDdnyjmCgRj/ZUJjydFRj+WxKjc7BLCkImT4vSgUgopNzivhtp5UvFnkQvHap0REl4I2LrhJRFFJaxVEJLpMSWNsG0ku1NXeYEmmAz0B8JMfDSps/V2KHbh2D4ZBljTzSR

y8dMLiHttkgRVNgqsoe3YW8R/4QPAZCwvnGg+fF6UW0bejsONoa8uAXxxsdT490Yw6ytQugsnk2pBsaGsXpKdjNvs3AQwBYI5dFS26O0UjysYJKxLGbszpMhZrQEqpPFnam+kZg+8MdGdiWACJt+2IKHSH1qIOMUGOgo3ImBX5UopImAJOVzog5T9UgocwJfwBzjofVRwCwH1JtuoZa5iBBRI1I7kWhTpUXbnZUuMe2j3PFHkesBU8bglU+u1LSI

9eDLAJEUdCzBM7Gq6gOmDuUwUphOH9u7TYwE5OslkeDHj4vW72k8d9Jkgnuj7dnCcV0uCI0EGXjvjlAevNvXjmFLNjSfC9AjxQy4dIH3jE8aPjpERPj7VPNj24UtjURPZjycZjjeytpC6qP7KZwElp/scfjKt0R4L8ZtjI5MLqhBW01AEhiywQXtxD8YhaT8cATIg2ATqeNmjNJFK6LQmGpZapWjITjY0wuOi46OBGAsZM6Q03gmgslmympMepOL

WEBQg2HUuHcdtjfxG66JYXO6U3iw46XqB4AQVGk2AlAeSZDdxb8aKA9CbLqERuYT8uPapcIECNoQWfVOqB+EZBL4TuGgETBOSETo1PlqUmwQqcSIFCBCfdsVvOvoxGhexofBKR9BuC4HmAmEr8bxjQPC4EXoDljxBWUNGCf9jGMb0TWNhXkJOEQTbZJjjYwh4Em7G08yZAcmpMd0T1djsTdsqMTncaB4ELQKjxOXOt8OPuj3icCGgEL8TjiY1xMc

aCT2BW6E8uTCT9hKipb5WiCpYXdITwGYJ8SeJy3pIoaRbpypcQRF8SPi20ldjVxxifapOSZCTSSZwi90a4EPIXRmCEiulalLemxlRWZVsZoR9hPnUfWEyspcPqEjxBBjyVMnJnGkzijMY5C79Xxmm7E3gopN4JOBN6EvhokGpsf5jucQ7c3S1AFyIEipidBiW6MwPoS0HkT60GPYxhSmEXLRxyNhIqTS8mbaUKIsQUwhmxf8Y3YV9CCI6Pg5dalM

PQ1R3/EGWM8S8ieriUlWMq5dlLwvwBeTYO1a67yYVynyfujHciKaZidpC14TOTASbAA4dHEEDuWap9Brf9rCaam2AlQRStU/EzYE2TRNisZG929aIj3sJvBPUTewbztScYqTbCbdIqlhEsc8iWTCicITGifJTNCZATm4EU847q1sylUt1IzUO05iasZO7D+AsZL1ggaNawx/En93PF5TSOQsTAqdejrKYNx3J0DI+fADat+2gTOiYTwqCa1yl0p3

JPCfhTkHW1tbWFwiY8iB40icYTtcWsEjUZ1TQwBn93gRF8UPBvpCVPxs9Tmw00whMm5SbhTVqbfwNqZLjQKPuj0IGjI4O28G1kotTFSY9TRcev2CFS3Q7hNGjEKei4UKYFUqCNSjnqeLjEaZ9TpMZCcMHypC5cTxkZBLGEQ1koSy3Ce0yWJWjpk2ZJUqny8bqdoTb9H2m19i29VsZrtnUb9TchL9UIcDx0sqaQT8WDJgEBoEJwiWyjOVP6pfDS8C

CNhpUBcePYTYBhjOqFkkOlKGA+NmmCnCXjwuxVhAI6a1yZAxrThHSnTCDtl8FCIFUFpLVgS6a7Tq6cnTl1KB84Mlw0CuREEyeLlTDA07TY6e7Ta6fCTgxMfsuiHKxZYBzTaeDzTC8X5UKlTapM0jhRV5E+VNdLIJXAnkgr8sfqqxRexClWEk8PHq9vydiJnixLJ1TJiWU3k1JgiEumCPBEw3zVgzEboDTIKaQzPKc4poSrx6KpIvT7ac6jcGdupC

Gb4sM8cHkvKk3IPhPidkIEwz/qZtJOGbHtMcbJtUfGrwzhP5KjGfgzgadwzhSfnYe/RnQ8ECGkbaacTV6fGw6cWwVtmmwRnUZYILaIuKAtL1JOqeXdZfE+gp6BW4FVPnUfDWnyyqa20alNKjEzlcFqOVxNXSYmAOme2yemdggBmdGapcIicJmcpD1ifTTC9RvC1zrEzsSaKA6Ngtg1IQOm1+FMzK0ckGxlJMJyNJE4alJuKamYfsU8PLhrCdoaKt

07kU7Gw0KIFFJtKh84NQkyIBtWqjsWfbKW7CwcSWZ1TOSIS4gNrPs2AlGJ1Ub2VadsdCGVJfwopLLsKeAHkXLTUD/sYQdNCWS2ZCTW01WfyztWYRiU+Sw4mWc0yKzOLtfYA8ww5JIzqAmkQdWZ6zjWffjyPlKa2kisZ3dhqz42e6zc6F6zpMaDR0llTiXISU4sKcrTiWEPQL2l0QsfAV9mkZjjGqFnYnnGIKucIwEopP2ziZDEEB6BTII1LOzzUx

vwBkzO9O2dDAjdX3Jz1P1CR5PWJteLPJV+rftdoc61z4AdtqkAbyQWCJA9cC/WlQBOQCAEJU5kCERUkcCALxKnxDzSjIigyw4TCbGcFnpCj42aKmzuLgdXQiMjWzN1xKtoHJpmS/EHJWam4yEf29cMTDB/uTDNkbTDGRpBmotqzDbdsydHdoodbkaodJvvmAoTNlgpYYqNPUZmg4dUac502s0GSJ9akPrntgHovIUWkroDxHij7jUGd4mfAE22Lh

TEAjVTDdhTUAyipCH2dGzOufxsK6DP4RZNazI2Y1zOuZB42kgGwEyePCm0H1JG1wS8k0d6wtydOz5mdWKUYiw4u1w5wzue86r+F547uYqpVQlxygXCSTpqStzHmbAA8voRk7BMrVfDRGpeHSJsUwiTz7GGjzdhMcph4VFiWcLNTbkt2pStyr4Egj16dmjDK+WZzz5A0rs4kGfRAyP9jUeAK8peD5MPyYrTl6etwlefUuFWNDgBeZSTvBLBkKMekq

0TQrzJdCrzXedrzM8fVgVVN66etTiRxGY1zCDqHjeeZrzPecLqJxQT1101YaBJWDTcKbumMeG72fpB0ksrV2pTsulU6MwoRFwApTO+ZXxkrseoy8FXiEQZjjkuIrsVmVwTxuINjzhNLqVpKbpqqescu1wO07tvHdredGzjnNp5PhIvCy0f9jv+Z3C4LoAL40BzT4dyUpUEGrwJYRljWCbT4JRG08cBZ1TilkXYhfHOmMXG01x+ZS2ikcLwvpIvCi

5J8cAqiSm2BXqyx+f2m0wARs/XWrtZBL7sC8UWwlgil42ib7sa0FzhCXHaOAKZ1TARo3i9EXfqnck8ThdVgk1gmRsI/ORsUif4Qyyuk8RyvxDOVNTwoPg5Kr+BJYK8EujARLEwSniiT94jKzkYl84ZYHnJc+Zjzvxz1qbgnkghfHSlMWcHkg2GJsasamg2hZmtPDWsLIDz5jDhNqzN12ammg31KLhcsLehY8wBhYSpK8AMy5pXslwTTkLKcRkzsP

lqjI1PTuRaEEkqJWaJTucELM0gp0ia1U8oyaaz1uvuIcXBTpd10XJ92KvIqcSl47tmqjARrsmMgwJyKtxZTwBfBs0LWs9fpH7lCVOpzz4WCWxOXx2zBI4Se/ULi9ZTZOVGfaLETk6L9Of8Jq92mk2qAzwLU0qLcAg6LdOYXItpN2zzicSAVIX2KanHLAv0eETwxdpzdR0WLPRZ/N7nDEEdRwjJsxdOKIxYWL3RctTVQjbjxxfqcovDOLNOYzwexa

uLDdW8R32fLxv2depaxPepT1K+p0IYx5KDQoAPACPAJBGwAoyqH9zThWg4zX6Eb4m7sKCPsc42eumAUg3j/e1gEwKI/zcaxsZvdgDJYasldZwGldVIYzpgMrV9NJpAVdkfZzZ7qEtSGOzDuJIN9vOev5/OY8j+av+Zvgf2I1kvQqW1JO64pqFDjRuIKGWx0KrvvZJUPoVzRXvzh6MwSDqbqJQ8bs7ZO3yTQwIFP0neXd5/ioVpKAplLHfgWhRegV

LuSknBaitzdM0kjo9Acm8BSbS1fMvdNw8oQj7AfAta+okAtbuHMLIv5B8RnohSpb1LhqtjNVhvjNantYjcIbV1lwEXABIRHAPAC/WkJdge8tRrwldHi4Vido1C9VziUfHscF0Dg6vqpiWvBLNsfQjEwF1sQe86ls0yNkT4QmdbNqRrJLB2opL5KKpLjJqZDZDpk1/jLZDd/uKdI5v4FJYZ5NFRvBkZ9iw4VYekR/2N7uwuNnkgpf/9bvpFLrYaA9

ynAMmkpY+BatHmhfTCki18WhG2Qz2YetDigUQDGYD4ZFcaLmCA3rMvc5c2E9MO24uetDNhnI39QjACMAQirPSTEORZ+DH+WhEt/0sIKjAlrllQAumeY7AQ5iaejWSZwKTGb+gKosuGCwbLkxYMTEkoREYIoiHt/LtIqTQpwEU9ZzExF0QCTA9Qx2crYrD+hHtjmXUTNGb/zqBMTDwA2fgOeBxA0Y0Y3A94+lJgFMnPjSSHwr58YZkRFZvO8ZkLec

pdDQU5YmSM5bkW85f5uS5frcK5ZucNLw3LaCzgrEgL3LTYkPLNiuPLV0XxhiKSJhiaGIYV5ZbGA3gxc95c/8j5fjMz5bSgYkvfLjhT/L35ZtGilfk54HsArjzxAr9HrArtWEgrl0RgryoPYrmMOzgiFdxoKkJQrV53QrmlawrRKxwrSSDwrw8yIrBFYcr58bkx5mYsE/QjNzEg0ODFfq85WWstLZwcStnAZtLWCTIrR5wqBNKCor+qRorw+jori5

eX8y5fDc0kTqY+leOM7Fd3Lpii4rR5caSJ5c8BAlY+eQlaTmTAGvLbXLZFFTDyBQZikriw1FGL5bImVzwUrX5ZpQP5aqoDVaR+alearGldmAoFeAo4Ff8AUFeCiKVYtBW5eH0RlZnmSFbMr3zDQrpr05onVZ+G2FdAouFccri1cIrLlcw1akpv1wOeVlgSI7YSwFUgz4GUAdQEwALdyHdDe0f2j0GrSsrVMQEgr8WU3hAC1A3IaFwF0D7Tn20nSD

jwVBSmzG/tMDqcdnQLpCRTQ1t89+7rwd7BSPdx/uC993uO1nOfC9V/pcjDJZsFTJdrLD7qEAw2JtJQviHt9dNUyvJeS8niWK6gx3FDAAf7LUoYB1qam0kv8ZhVoOumeqQaDMQQOSYVlb1oYegmruBgW+NoxZorVe7QuBkpk1Mh4AwFGQo8QCeMDqwlGGeghY9rlQrjojxQkfxOi230dLIeWK+7ABTdnjDlmlNeoh1NZmre1DprqFYZrwkKZr/5eJ

ObNfRQHNbsMPNeiofNZqGgaUlo9JmFrWFFFrPXPViEtZZiUtaRoPsIamx7w8CA2duO2Ne8ri+VitFpZz5v6pX1BmK4DcteIWgQMVrfs2VrtNZiMatb+SGtYwsDkO1rcKHZrqj31rvNZXOxtYTMOigDYk1cDMYtetrfINtr/6XtrJVr9hnfuYjXpfvuGnvDiygGGAVcDyO2AEygXIeOrJCUdOi8Hh8tcUST/GpQR10um1cwDtzlzK8ctIQMqnJfhA

mOxJNjsvDuddU+mQ9mrsqvq9lQtvSdYNeId5/tVdzkdzDMNbgVUlvhr8wAcF0eveVZYeW4svWaWEdX3xwpsDUM0DXucueiDopfateOnH5q9tbVyhCOQudgrgB9Usee0F7+LFQBBdXMZEHbGSK2cBdhd82Cw7YjKi99c5+T9dfrSaDuA6gHfrKqtZEX9YQIP9ZfBLTFSDADd5eJslCIK3BxjIy0q6dTLUxzAd8r8Ee9rfHqQjpTCAbj9fPWUTwtYZ

DYgb0rIJWMDcAQv9a0W/9bZEEIdb9IgY2rhlpQa+4GYARIGGAZ4mqAbqIRNovXoS4ZALwqdBid+4XakJSKMqHSBQzayq6EvQlXuhLCvwq8WxLeUH9DY9b7JZwEnrMrsBru/OnrjdpP9IXvBrC9dIdPOfcD+Yc8DhYYfdiUuFzjZfodC+PYcukg/dguxTUZ3WfhXjrPrLYYJrMPu4EV5ElL99eJUJDefr5DfAbKX2JUSsDgAHLNZEtQsyAJvmryl0

U3GCDblmSDYNNZQD8bATdAbr9YgboTfPAETZ3l+ShibURx2c8Tb/rVokZ1KDYrjRpbWgmDaYD5pb8r+DZAW/6uCrO8pzs/jfLgIDbIbYDbfrWTfCbBKyibUAHybZikKbrbwSbHcySb0Zvi6LfvROUIfQtSsrYbgSJYgThGwAgZbOJIZeTia8HGQ+9AmJRkzB8FIV2ubUaCGj1fn4FOV5M8PgS4UJLoKLBBXksAhHkdOfzLqTpBrhFPsjmYccjxje

v9K9ceV7JosbdUpU1eqGTUNdsB9OOCutIPpisGmGSCAbXcb+UwHL4bsszEBdJrCpvJr8taDrTX2ArodcDMvYVZrkdanSmtdFoI1Hv0cUDwAvDH8Y+6Un0is0VSq7ioBvr1rM5tf5o1tczgRLxyouBgF08fh6GlzHUreLzqrf6S/LstYpriLf9c01eGr4ddjrl0TGS0dbRBuLf8MksrJShKGJbv7lJbLXOnB3ih70VLYdGUKWpQtLfCrjLaAy43Ko

orLYKS7Lc/LoQC2DUXAXIkdSSpy8BfV0VpqbeDbiVBDfaZMNADrtvgVrSLb5bTZlVrgrcZrIrbKhYrcCiVMslbdoGlblcxRYcrYTMwl3TrK6RVbOaG986rcuMTLa1b5VnarbLfkrHLYNbjEaLrqnrbdG0rsNPpc61mgFNg+AG7QPyLRDAgoxDWkyjwK6khE27CW4jmejLXJ3O9ZGlYauMuGtDsikQx/Gvo26FTRw9bFUUvtqEdXVdrAMppD6vrpD

p/ql5ENd7NzSOXrpjb5zBYZN94wBjlpdkj4r9P+b88FqZtYd3YZRzYe4LYGWF9bl8zvrTU8oejdaPCR9A9JPhGyL0sPmCoGgwGvhRiP1R6M01DfmFC46Ag+gwWF1QxdotD1PssdtPtkZr9vkZgSIJt5kBbQ+gCrgpTvrrIfBfKSlkCIdGhMmknwDRJYUUGZ/Gj4ZpROzi/uyd+ur6EN3FPC9ZoUscO1fEGVNTU/wAZzddseurxV0btIdnrGYeVdl

NIv9Lgee9LIbebbJoOtXgZOAALOS2wS1qyJ3T+rGNe24ImCdI+BOtds9vPrkLaK92AZK9uAb6NMKEsw1gByQqpdxE4nZAoTMGQbjaeoSFYHURQKAHlsEc9rtTetb9TdX18ENhQ9Xlk7n2DdLEzbjNa0pLrm8rYjkgfQAVcis7A+L2AIkCH9Q1g86XnFk41+xDufi2wKwG3vl/XTM0jbZh2AQVNloiCLtl3o7bKjf4QEggWkYEnqcc/IsjANf89sa

oLLx7tBrZHYe9I7fFtUNfHbVZbMb7IYsbE2B6RQRC0qqlpxwUXf+buJXL4ETjSyuNb7L8uYE77VqE7cPpXtfaNK8nN0U5zX2IA9JnCAS4MUWhldgO3K0kC6rmCMtBlMxNxkZEecG+iHlzuGsHpiKO4yJS9EcxY2HoImc1cTZ3rl07TgDlgeEf7UXxHNmbIFkrQbe2FxLkWYAqGT8OVzDWKbtvOVFGBSbXcxQHMS674gWeyvXezdHpnv0dw1ZEI3Z

rmY3ZQmV60rZZQ2m7H3aTQc3YDYNldbMHjGAQy3Yk7FqxiK63ZUkm3eTytFC1ou3YaUXSQO7ggQm7QlACVtDSVqQljBky3Curs+pPalrdYD8VoCrVbqhoXAdO7XYKg8F3Y67yK2u7fXY9Md3bLWj3fe7z3cGir3bjO43bDWn3eFuCnuR7NKD+7zZlgorPxqeIPf078FfuYbhlUU0PZ277CxdmdVAGKcwOO7KbeYF1hoBLt1hQaoQCTgfVSJA+baB

sgDsi2zgCOgeoDGkXLU+Az6JQRpmgXU1+GJ0kyErNTW3nU8eHFzwTntzuNi36pEV54ZOYuAe/vTRTOf7bhZfSNnZspL61ueb5ZZMbGXcnb5jenbFPq3rIudsbPgTF4oPnrpM+uK76tnEEkFL+aFXeFLVXc8bWAdpIwnbM1Rlv3bQuEPbzDKq9zUHWgyuAmQ2PsK4L8Jowfn0K4fXtYw6cFTU58JtgBA2GAVqFfbDAykZidk/bLEavJFnakACkGrk

z4ApqhFvRm0iATLaljB4zS20g1TIfEBGOmCqIHPQZ2j8d/6NQqobTFdbzTcmQSx4sHvaSd1nlJLCXYeb/vYcj1JcAZtJeAZ9JYnbjJanbzJehwURFy7SAnL4hOkCjn/od9YiLMRmAh7LrTsq7/Hcz7ozkvI53Rt5+fcnuJEGp+SaDJAANEQMogDxV2iq8hToIAAZHAPoqAAAfJAdkB0iCgDrX6iuSAcS6PJUwDggDXGeAeIDnigoD3P05adkqRos

OiUD+Lju14Pa4N/HvV+q0u1+5xQYDlRZYDhPI4Do56LgWAe9RVAAID5AeoDphuTNpXvTN2w0du8zvbyowAjgV4CaAF6yDu10PDunhJ9lVCqIZt6BiDMH0rScZE68jOPE50sAbhKDPqXao0q5lO6SDKwlTsY7QE6HfvXe77R3NkGWJdx5vkdsGbNbLa3Udi/sh9q/th9m/t/rd/Xch2xsnoJTvwyE7q/ukIN54dBs8CHikRRiUP416KPSh//sukSU

tsoLy4Wi1AAoDmiCKsvvK5oUgKW6MXvMQt3z36ZmXiGGiAeMDooyYk1CTh3yJV88lwE/bhhuGeF6XMHaJQ8m5x0C2Wtt6AQ55/bOApDzQBpD5fwZDiDI063WJenPIdIsMUD1DHQCfMYoeWY0octnYlyqGMtSQ98/4PGOoeKw1mJND1Q6DgLOhnRjS5dk81tz6y40L6qCE8632sPG/2stDg6FJDjoddDvKg9D0fw2mfodWXQYch+EYdFDyiYTDmAB

lD6Yd6/UXue8oAGLD20VTVpkVkLAutM9NNvK99t2oJFBr6AMYD6QXvodsEcBZm1xYKD6BSaoYzw153OHresrrTyHzjrXWFpolpW6fATuzQtWvBvhWA37TPa5g+XcKCJYH3Rd/f3aNw/379+5sN2+wfJdwPtn93xkwy2juSWj5vTtvhvfenyMc0mhoFeCXPYzDPDBqI6ZGZd8q9l9PvR9D33bIMYAsQS4DPgbAAUMYYBfekR103LGoM3J+1DORbax

Dj3N9OsmuPdBsYkDt46GjgQfIN+2MSDLAqCIZOg0DzTHqdq1u3Gn2vnBoKvwQquAmjpv2qSpiPAjkQegjkvZq6/SBEUDgCqQH5ECYsGkMujATAPTDTMW4cqyVcESOE48LUhUMpVgMkPraQ9qsaakKoOnEsOCGer0RCPhkDW5u2RtnMllgPsn98GYsj95nWfS/uw16/vw15aDVokogzeGsONOLaRsUu+wryKwmeejds/7JbE6jwAddh7qU3JB35Gu

R57xJegUbi2OaAwj0FJJPgGRnYlDQ9rajSGfkQdB0UaDjssbDjhoyjj+2sW16lBT/XJRwLMJS/nPF5zj/8yLj1ytA+Xm3GFJvNp84t0Djd9Uzir2uadhJXad8eUDjikFDjzJIFVn6EnObcfug3cdTjxbIzj6FyyV+cd5wE8erVz0frVgl2zNpn2ZALSLkQKvZHy+b2Jw+Zl4dDggLmjkqROIyZ11Psr58ZqaaWnOhMNcgqHAdAq+SA/MNmhkLx06

eE0plEt9t4ssH9hkdH9p5sljpyNjtmjuVj1eucjzweR4atEHxs6CON/eC9poFvfmk6PaxzsfrwwR7tWlrC6jno0Nd823r2ir2b21UPbICQRe2A5F+YWAaV2WrHwVWYAhABHgEDQYCjK9OBp8Ej7t981E0+zUd0+zeljekHMf2ngCqQRZslVJOBVoj/Uk2oJYBECfrsOageYTxSCrQTch0aCQb2ytSo1R9o75wqPONYBSz/EjGk6Z9O5Epokse6kk

vEdgdukdxkeGNpicvN6GtsT95v0d7LukGyPs2Ni32y2NyZy+bzvv8xsBih4Idfu2XwXhCXZf9yUexqaUcf0TKCYAfQBhI58B111UcVS9APx+8Sc9jyUv6QKC7lwBAdoDn+D9TwadsyuASdOGAZ4d9o42joC0nBtgOE9jgPE9xpt9TpuWjTsCeptiCdWTzatM+vYAZdGqSZQEk7uGrbS0NOXzdCauq+hvl5FE4mtKeeONQd31VQGqqkI495OUzAyP

Y7XlVukVxwN2Fh5aN2LtA1ts30j85X0hxidllsscX8tkcZTujtFOxlGpgYYCE2nkfkkg7p1ONqOsUkUcL4gKQMxpsORRqIdaj2Ak9T2R0iduFWlMG5L+oODV95Cn68oVhW9D42GhvB/SlKvAxtCvKgoat/T7cuoP1DF2AC9xNx7A1PyyoDiFoatVUkz4NJ95Hcdx5Hl7JN7nSijAWeX5MmcXAimeAmKmcFJGmfAGOmde/P9I+g82YCsryhszmcAc

zrkaNfbmfK/NNh+rNZKSzjPxCzn8cizrYOrF3xzrwXpN9ja8cxWu8cadh0c2thpvwQ4mdJsQWfL+cmfzDuAzyz7fzzg2xQ7OFWfBYNWdNcjCanULWcs/fM6czvWc8zm55Xq/mcezqWfL+YWdEoQEe9vL0eiBwEuBIzAB7VZgBVweYCSAY+kUqYtuRbLbS61CXzGtmYuYTwCGBGvPhnsRGQ6Dy/ALtuNFAKGieFjuieAzodsn81KdB915sQzjkdZT

6dtcm7yMIzprZ1CC4BP9233a0J/av9gfYRtTLGiTzkk4yCScAD1XNIDcr3KhhSdptZ2wLxTVF2I+lxuYA5HbAMj54yA+cJlggaWI9zD6T9zi17O+2eIx+1d9l+099zG3sRwhlpADUDvI6TKhj4d1jpsaAGBpAtDZ6+W8AaLj3TZVpWM9uPPS84Cj+6SxK+1Yo61HB0xdqyM8W4Gu2Dw/tFj4/sgzrnOy84PtX8qsceDmsdjm+GcMUoOBw8NqNv+x

dtNbZdtzzjLhm2Xw1LzxbErzvGc31ihU3JUUaqgllm4QBFA5V4NLpnWVUqi/FsTRf1AvHT7kZmQtYFJE8FGMP4FP5d0F4s8Wj1uTCWXMbtBLjkoMcLitDcL9fyX5PhdIqgRdrj+FDU/EcMEw837Hg4sS8jYajwUApQKUBRdF8pRdbB/DDCqvHtzTgnt3GwKtLTt2eijdhfMyThcEADRcTGiBAIqnRfWzQKILLEReGL1lbGLk2EEAMxeyLvcFWLra

g2LqijKLhXtlW/t4M+7adq6xcD6AZ8Be0c8Ss0/hv8DdaQ9KLPDR8SLTALtjRw7fko15srowtpDv+tYugXOtEpYFOLgKWRwlYl3kypE8ruxT7i2eywKUkdxV1JdlKdYLyGvc5/uduD/BdZd6dtyD3KeK2/KcpkOzTsdyhe8AY5lH1yeSaJ0uwMLwmXShyALJBHulrbFheWaxXjuUVJTk1awBsuVYy1Ck9U6RKZeCYg4LeFLEDEME5ccAM5djmC5f

m+K5ddywsJ9EjpffLmadceow4tM/W5Ojtxfjyw5f3L6lCPL55fyAQg6XL2aLXLoE2lWkE0sN79tM++KCSAKuDDASoBniKBz2dwJUtltrBh0O2dbXORBjsVwRdEz4lnaR4rK3O9D8qFeSROugoYdA730E0/PEdGwNM56wcFjv3sYL4GdT4ZidXu1wd4L9idDzzieSR6ZcGugqeTsMxD10hf21hs6D1ej0gbLwr3tWsjSndAme31jiD3dvvKEvJF7W

mPRQyMVcjK/IRRzncxQEGYfKxnEK6XGBZxJ6Qkz6QB4M5AbtDZBltmeAn0UYSul61vQl4QZJ0EN+GyCxXfw5zMGb7yAdfQEuEJE1qJ0FdC0IAIAMC6T6dmTlwUUYAAKnXGysirkk+njX1EG6Goo17Ei5xw9AfLLWI1e1Xlul1XcUH1XuznAgRq8DZhfnp+gT1sigCEtXceTrUNq6yDdq4dX6YIA8zq7OFNbzfD7q4hWuBi9XeAB9X9ykbUtblVmH

Q2DXuyR4HYa7CAka+VkMa9QA8a5ZZ7MiTXM68vWaa6dEcKEzXWQFIHHJnMzS3BnQzHcqZvy+OD/y+51gK9cX6AQL5Gq/WSR5zzXexgLXQmANXJa5Egxq4xApq8rXFq/ncj4NBMtq/tXfFcAsra6Ze7a+SrR5w9XPA57XIYkwuvq4HX4QCHXzExHX9LbhQ464jX+kCjXFcDjXCa/nXya6XX6IzEoa6/qmYzY6Va1bb9rDdz7KDX9AVcmIA/oE+94f

pxX8voQq+uD7JQpq2u+xSzHD6Fkke7FbsiljhiJmn1KolkCksBv20bDn+xfOOsDjOZpHKC/+naC/onXK4cHKXcv9Iy/SnYy8FXUM5imYtmGAnPtFXP3vNggZETuMTJ4e5U5h2jbVK6AmzT7BCuxnkjoK82fc7D+o99Q/SR8AWtEtXggGQMn69+WZSjloHyShXHbHDX9THrg1YBKDeKHrglMm7Qnm+pkLLN83x0DKivcwfStm8zdIwPrXoYEbXWih

c3+GTQA7m6t8cKC837wd83/m8C36KGC3qW9C3CfMoLNyfda7Ul/5WDZ2Ht4+ml9A/8rLi6J7p66SV4W4GS9buT8Dm4bX9q/i3WlFc3SW483vm+83SQbWCmW983QW883eW/MN11Cw1BG8gnRG8CRMgd4+RIGdREW0QnJCQUGVBNnkWuR1QS+NiIrSaoKyOXo3vqvU1JgZRwfzaSNv04k3nc5u9c9bP9vc9Bn0MorH8m8ynim6Rmym77tam95H+UAQ

62hyvwMTIXbMq+xRwknHdCq5iDgnfM3687XthfZR9O88MRfXoZAYEHoNRfWbsWrWwA+CVa965DlwMYnE4ANv1wskBMndyI/bz89M7Edu3lu8pcNLECMA6YHcNxE48CsnjF4wgq9IljNn6oD2xRr+BOmXjkTILPJH2GHamt8mIoRsRHx2GsHw7lkcI7ZHTpH4m67nBjfnrl2+wXwcrk3Aq7u34euCZksGGAwjue3Y85noD6E8SFC+5R5Id03xHFbK

c3iM35xwA91Xai0gXETLsLca7yhA+BvERsgd+mUAFDZS+hZxdAYyTAuxFH9A/oCGnOyAMAlu4pEVmFt3BZ1sKhVCTOzu9d3AStTwRHCnj4scfsqndLdB6+aZR69Hltrei+Hu5wOXu7WwPu/t3/u6d3tciD3hncsNxdfTbmkqzbH9stgXPThAokDgA3aD61pAGoUBIWcARIHIg+npPpOvaThU8krVC7EwKAwmLNGAiB8Y5KMzFC8o0mOfh4w+z1gk

yBDVz1ar4YXCeA2h0sH1IdonAM7O3Ay7F3vcUo7evpcHbgdu3kM9l3imrFsfwGGx0yow46NcWX06EcbuJWC4vKgbbmM8iHGfeiHx8QjuLnLlD9XdN3sk9B3KofB36A2Wg6qiVgxYAXRwWBfhvtm1DxAD3Y04AlamHUI+LiN54/tvEZ99o77j8+b6lk4Z9KDQoYSwCTgRgCcIBAb2AoOUaARICJA1QEMczAHiAygG/nDe8M96GkSCYYfSRAElWZhj

VT4CmPaEs7BEGxxSuu6lhu4YdwS8nDRETmtl8FTbVf2KQVZXIm+97p2+97Wvqk3Rjb7nUu+sFCm433OrtTAm0GrRN+DXkgoYP3/DV03hXlPQyan+3opeGW8dPCpYg9EpQA6YZYO7Msztj1wYEDnRntjf3SsEMd1CLPY47qL6OjpNwfmBwt2yIR3WO877MB9G9cB8CR56P0g73gQAZ4hYg8UCrgxNXiA/oG7QMAD8AVcCMAIq+Plpc6b33uxujzYG

UNxZuC4+CKOggQwj4bG7pXpJqNq/1epHx25F3M9f6XyU4X3Zd2GXOC9GX0u/X3b/Tl30OB+Aw2Nx82ng6mNLQuAgm1i43TvQZNU+M3l+5xnmkmGWz7c0R9+71H/aM3nR7eHRQbMnRgiBLwByJla+CTu2V9Fb7A/ofdTiJUdlffXgNsHAPVPqgPZk6fn1jq/bVk5Qap4GJExkA7YVyCkHmUDJI5EEqAs1yLnhbaiPje5Rw1cRamHlcO0kvGLNtcXr

slsEJjJYQ6ECKJ47wXehk7c85X/B+LLgh6ZHJY9196atk36XfKPg8/u3x+2qP8NobLMy+MS6vWPCdTpMgNCS01oKP5UhJfP3eNc6PsfWGWt6Dq7ey5knZXrknW88Udik9TAK6KcwYWE1DbtkiwYgD/WXZIiwDiMaAiuDk47mHjoasA+qBwGcP0B8kI3fbx343u3lpAGqAtgTFPuACJA1xPmAi4HP8OFsGAuB9yE2vaIPWkxWummGqZWhJ8WLx5yx

K8ieCUTSbnOkGjjH1YO3CYYI7yTrn3fS/0b52+Hbwh6u3zJvBna++hPEh58qckFqP8EiiWprtc7HHbEgrWE2KUZa4d7R/13UUa6PqIgJPopuB3ypD0Pz+4MPdmEiWLiI+qCrV/EeyLVwdGitJCO4CwbzRMR71RBt8iAi2EB4fnmx9cP1qPcPTPvwAR4GKg1QA1AF4GVPC3vQ0kdVTwA2BtgCzU8nslUb2QXD1QRjMOxBp43w+2ga6b+FmtPG8Mjx

dHZUOcW2gup6n3xJb4Ps+4EPzzIu3Qy9HbfK9X3UJ/2tMJ7/e1R8iPSUsRPXqkwRaXlP4nDtrDW0GXYIcDUPhu9TUcFR6d/R4R9UZ+3nMZ+2QOiCuRcuCeAV221a5GZXRwWDwAErRGA82kyseABoaWuD8qlPse2ZqOx35k8FPee8TNH9r9dffoJqcACe3Nx5VPkW3mjx7CUQ53pQLRkyGAmJtlaoVgOZHGAObXJ2vCeOK6p6GzoK5BXTiz4nAL3y

p+nyC6nPwu4tPDE6EP4u5KPku8hPYh5l3lR833Uh9odPg9mXp0CfhmlrRr9vviZ1uOB6emoiHuJ5/7V+7bD3pNoN+M/2XMqKVDwx+ttksD5MauF8NNhzpAYWB2AErV2ST4kJEauHjPbUfvETiL5PhZ4FPuO/AvACLV1PPUHxZ4iJAI4Dvn6IduPmJSKJZm4cl8dOAXAg1nxlsjPQifB/mPnYjuWBIkGohMBZn0vH2ddioS4YbyK/x7JRgJ8LHwJ8

GXPK7SnLF9ZNTp/Yvkh+owswCA7o85IXdYb1zZC/j7gl4ZJYkCsEuGxyL4Uf8FWM7xPdpyN3554jPJmCf3N54xgztjBsCzgmwXmCWyH00IGJwB0dCRAH9fmD1wbJ+PtOFpVwJl/fboF/MvII84qgSOYAGK5XRSwEddZO68CSKO3CuniHtYgwwvQ/MVT69wtOZ2nHYoPAulyjd1gCaNDKg1lGk4JPzHrOc5X8V6KPXcKSvrE8dPK5+dPI3FmA/vuy

vE5oPCZSbqN4H06Xgk6mk05BWZol4qvF+4kvIZ7hZZ55kvcl/7Hoo12oC+lIjXyh3Mw5hfLLSuxebXKkMBxhjZoLDoMhHJaDzXZkUKgO5mPESYALGTirv69ZAg5hwoSe8ehdQP9QwqAKUZgB/r3QDsKVa4FidXxucpbPrU+kAz8MgUsM/LBf0ZICTQVynna/iXrA3VdYhGtExA5rP0gge75Z1VE/UpABLxbXIFc1rNDQCDd5vnTw4AKzhaYcFF70

/ttvN4s4cosN4z28N8VQzB1kryN5ze9KUpv4TCxvGGRxv7pyeU+N7kodUSJvVgBJv6EqiAZN+cYnu6pvKkJpv85npvDTCIgTN9aSggBqu2FHZv/qE5vTAG5v8oD12ECH5voaEFva7WFvnAFFvITHFva2Elv0t/+hyFDlvCt9cgSt483qt7jvwFE1vMfJ1vbMsnQRFdZOTSYoXDi92HcVoYHC0+tL7i4Nv1JiNv2ZkRvZt68OFt8xYVt8xvIFGxvI

IdxvDt4dhBN+dvogFdv/zhxMpwsvO5N4MAlN5YAspfrUtN7fSDN6DvPSRDvrN/DvcnMjvXN/v8PN7jvrA4FvZcGTv6ShFvvbPTvvaoJQAe8z3Mt46MxlaYA+d6iAhd8xQxd4FYpd4PA5d/9t8K/+LkIeEHWc9EHYI8CR8QEqAmgEmqParhn8g7A6bDQfEm8PE6vkgm1RdXUQKllz4ZR1WkoBp7K89W/EwSyfsPIVDaTHthpLpE0Q7rV8lPB9yPom

/i7056BPs55tPjF4XPrgfIdA88evaV5dPHOwRPYq6nYkxddlOHB+AbZcy9pYEj4zdk4deXsqvIN8kdNV4hvJJ/CF9vJQYlOEH+rTFCPUFgHXjVCTAbBgHXoXM7XNh3FAqeV8OKbpcUsyAUfciiGe6j/9Qqj7jAyj/9Qmj8A3jBy4hQhy2D7KdyJxEUudattK3uPYbv94+dnWnb9rjTYMf8j9lQij9Mfuc00gFj46ei7LxQWj4gOuj6Gy6c6NViK6

mbgD59HXfrV1hAEygnbB7d0mMWvUypCjKXqQeXpGegjIXscU7ASICy97rhuOaJzLvZ3+24vo/CEt7MlgXqR+aovAu7ldHK819tD57n859S7EJ/uvy58KdT19+kswDP2Su5yvxYXaEBeF4f71YPPtmg0OeUolHHR/Ef1V/BvJu4GPZu8i6tj8UefTZwSEwwz3Lu9ocDlFFEabLbGYs4tV6z9Tymz4V+t992fsjk9EpAEOfubv2ACNjtxp4UAhpLGg

j5fo9rjs/tHoFsYHhDeUIISO0fdj/Of2z6lvme72fNz7uf2e8V7npYsvpdfEHWIRYgJEBgAkgFUgwwHyEWT7SRb0sOIYPi9IxK4XjOdCP4mD9kbxdFsEw1kgphLFxsV11kkJsa2yMqguv+R6tP8+7nPiV5EPyV6+ZfT9Yfz18E+bJZYw0jsugJW/wibHt+vl+E4Pj4jaPYl+/7HjckvTIUkfyz+knD++lppJED3a32+h8KSTQjy0TmD4aJ+8Bydt

PA4MBruiRQ1zmVblejhIu6Xr8HADQAa7QyYYFkeWL3eRW9RzRp58dq68Zy4QZhh2fru/lGBLlHLlqQrgs5agMaADDGooCMQV6w9f7zi9fLr9BMSr+JSWnyIrXoHCS/r5wmM9GDfZURBfuz8khXUVVfyEyxczvxkoI1dRSXByki+r4zghr57mJr+zCFr8VS1r53DFVcUW9r6EEDr+Hm5SUZvlz/dfga9Df8ZiBYPr+aSHLIDfWT2Dfrb4qoYb6bfK

b8PNrImjfMb7jf2ExlSib+R7jOoZCl00MqvjhAN+67oHTi6bv1W8WntW64Dw7+Vf6b8zSar6rfGr4vXDoM4OOr4LfB1CLfW+hLfhIFNfDfnLfVr7qYNr+Z7dr9q6L7/wrjb6Dvzb57Znr/bfmQE7finvjfU76hYx3f7frA52FQ78jfo75jfRFYnfPb+nf8vfWnUL5M7ML9fnffaEAbTXwA/mPS47hsR4h6FsEB9GZCVNtDoVnv4S10uu4ZCQksif

MGExGjBsU5QFO48aJssvl2KROA9lKYfwp9L7sH9F5BPnT5k3pR9EPKV5YfCmvSvksFmA4N03PnD/Qq1BQXq9dIwV8TOkdKlVfwJ59/78tiWfF5+JP8r5kf7u9zbdRkL0aAESgz97qYj83ffIkTtEVqCRorQItmKtFeHolExe/NdKBjFcSrSaFX+gqAFEHbLcMt43Kr4b4ai4wKsh9rhbBA4bNid4xVpI4nYAUBiyryfjmhKiyPAFDFfI/Vz/XrAH

YotRlr0NphUhNz5C/J3e7ABZh0/SSnPAW+ja5D83LlRn5YC7kBc/5n+Amln/4MNn5qGdn6fDcqCDBzn7M/0bDc/PQ2RYH7+2YlkK4YqznpMfn4LGgX/2ftUNC/PFeyr9ahS50X6FAilzi/HIMS/9RjcMKX+C/8fMdrdYZOu3Y2qZek19Iy7851h6549Bw6BXm78ab4c3zM2n/Nf2X/0/+X9ryhX/irdoBK/8oLK/+aleHCY04oVX42Y9n/Rcjn7q

/pn8v+jX/nM7n7qYnn6I5kPw6/KkW6/cUXKrqX8hiYX9Dvw36i/MX/G/X/km/B36S/M37EooP5R7CH5SX6PJV7gSI1AuB6PALaGWmRC+gfpIWmCYwmLti7GumPJYotGGktxL2bRNGIieCR1yi47tsC4XeaJHQ5/2A/PFHk22WWpdL70bHH8k3XH+Zfdp+ZD/K9YvFR8E/Lp6PASNdEsnGBLVLDqrbifeD6N129JRp9EfwN7qnQAYPEZyyPArUBNA

akw9dzUo1Hiq5lfvY8s3WCSl7M81y/f/2So8oBzUNu5A1DoJRvuakL0/xi9fbQZt/4T/T0a2DUA44ezcsHgjeNPcKi7t6ZiMtxqi5TwmiwGECejIviAvq/vDZUOTZecHgBXGNLGQHhX0XEEn0MFARQZ5dEARKCg3BLkzQTABmWfi/k9IBg2cnv8zgTcojyur9DQVchYsvQxDfFVDYga60JeWHnRc3QEjY9v+O+nAFUAZf7r/G6qfFSzAgQlQEl09

c0Aohs1K+qfjwyyFAm7zJlbOKe/W+/rBmiuej3+siidBYA4UA/ZhO7Zv7NGFv7EicKGt/3u7t/M1GX/vUWd/oVYxQM/5t30IwpApf+9/zf79/569/XXUUFuIf7lQKMAj/rbyj/2BmxbyFDj/wCAT/ZmL0ruND9mGn+uNBWPkTe2f4gfnn+FjzsBHBqRf4srCX+Xf7e/k3k9+SV/qgA1f7dsF++7zgN/o6sR5y3/hiCwLDt/sIunf5e/sdEIH5sQB

4c/f7rjEP+gSQj/hyy3rjj/pGk8nrSGBOqs/5SQvP+feSpmEf+UkR1AGv+q+izvo2m1TLxHmpmfzb13uVumhrXGqcG674t3uPKdQCb/jl+7XaW/rv+5/5rLPb+nAGLrDFCp/7MARf+76REAWX+Pv7RFBF+3KwP/oS8T/4IUKeC4f4BvJH+0f5f/lmceKy//mJixJxJ/ixMQAEsTKABWf7kADn+7ziQAQX+GxpgGFP+xf4e/ggB5f7IAVJEaAG1/q

QBulBdRLgBOxj4AdTe8AHEAT3+ZAEhPo6Yg/5mKNQBo/41PPQBHySMAVhYSgFz/gmC7AEqAZ/kXAE8AVxAsT5jbkiuW05QTmrq5EBQEBtApyDd8jWeSE6HQDDcj0AmEkj4W7DQ7AHGQaJZ4GewDY5lTr6qqWI/JnFw7yZp0tU+Bix8qJMI6Cgk4MVOVI6e9rweM+60XjOefsp0Ptx+VHZpdj0+Iv6pXmL+z15HVm9ebKKgwEh08XD8PvSEqJ532C

1myICVCIp+Ur6K5ip+dV7LIgpeRfaUnjba9KhegErAiuC1Yici4rTqtDEsNGBOYLX2ikB4JH164JYOYBH2AdpAXkjapl5MsGBek15kuuxG/oCTaCeAwwDPgEeAj/rAdsXYKliDyK4mQ9p2eqHcy0hbkFug0XBuCIu6PZRxrEpYiaw4RLL6Kdy1Psls9T626mQ+wm4UPj0u8rrUPnFe7T4pqgL+Eu5B6qy+MUrsvtsBAz5qMnsBzgql0Jvckz6NOE

cUKy7+LCpYoggZ6nM+QZ62uvd0Gv4UMFr+Z4DVALr+Agr6/uI6mo4SPrcBqq4UKmOA/NZaGIeMMlDIuHUK3hjL+HnAReSRQLnAKbr6gSnWdPBq6FEc8ij1CiwEFoHFfDoIjOor3JJYPpK7FHYmbnIgnDg2G34x7lt+x641boWIJtK2gUaBZ6wi0BKIIbhKGHRCwCCWgZHksT7ulrnuMIHqenC+B4hwADAAKfr3ICOQzk5aTNdotWZ42H9KMLqAPM

Ui8dICdFCm5siKfAC07BJY9lLwmiCmZE7KHTi/NFPs0wAsrgyByC7srpdebT7LAR0+HIFMXlyBGwH8fryBsXrPXgNq3F7GJJeQofQ+qFFUXp7y/jFYdxYDkjKBgZ7WnAs+I9xG/pKWiYE6CMv4ZRgnvoWkToH0oH1ki4K7gYuCIjA5KPgA04DBYBkoGgBEGKRy+6TxMLrsFKQTRA/AEQFcMPOAYiiUMG6BSaBN1pXMEySAuNNWDMisiPUOPDAkGD

rEdAIxUFm8QrZgsEpQzjBAhs6k74FwwMq27ehhXPhQ3bDq6KzIrMgGvJKwLECqQM4ADYgUMLhBDhJI8rikMNDbgRGKxejavgeBpoHgep+Y4EH1qJVY54FlPFeBlODCVuNy9AoPgc9CAEEBtmusiEGfgW7kVoGhoL+BD8D/gfSk/YCMiCBBWnL0QSN2GLycUIzWYEB9ROSAo65iUKmwg6AfgXsMY+g4oJKMcKBoQUkk2ACYQdhBhEF4QQRBREGnAC

RBZaQ5aNXEm7BEIvD4e7CqGmX6HnJqdp8+lW51No+OPj7wQuRBA/iUQfuBAriHgbRBJ4GoZGeBlExR+CxBN4HsQfeBY1CPgcpQsQqPmCqw6kFcKJ5BRiCTAH+B+qTcQeJBwEGKwtWM0kGDRLJBjgFjJApBR+TwQVW4qkFGKEhBZzAoQfUwukEYQVhBGjw4QcZB6KBGQcRByS7xPgA+hG6bSgXu7EaNAFj+mCCLhDlOx8rc+k8k+mQR8GD4v24Ltv

1Ir0wxZE2eI0g1CMcUx16VCBYgTS4A+nGikdT92M0SBJST1FPWvS6JTgUenH4JXrdeLL7DgWy+YeocvgM+Y8KTgfsQeKa9YKoMNLQCIFpqWRB+EC3S5V74KnKBVV4bgTqBkN4mWm34kzJZgc7A3ICWcmJQZUTW/tgAP0FYsq+0Rz7DSp+A5jLQQMbq0lijAaaWjaSiAVcaX6rBgXHurs7Pjt9B+jB/QWDBgg7GdiaqyH7+whIG28rdoDtU/oAUME

QGiNbuorWeWkx9kk80W0Br9BDwFnrA8JyY4yJp8MmQy3BkhtiGCzqWuqrAnDSp4OYg3nrvHq2iTT7mnjReQXroLtdeTL77QYL+FZYsmkdB7kbw1rMAyObDPu9eAiBduF9ujTgviL3cMgxraFcBoN4dGu9B7UF8kgqG154Uni/uZQAD+gaGErT70L8A82iNAHJwcVBbevxq2uAy4IrglyaEDMNeo17DetaGsB62hig0LaD1wDQoHbBVyNcSjQGkhD

TBY/Zp8C+UeqBekLnCJSLaaiJwjxTiFr6q6PjTyBLSvZS+qBkejsoehs56cFTETkuaR27UXgsBYsESbhLBKwEDgQw+K+5MPg9eo4H3urMACXrELhOaxXSv7JfQ0n4gEkVei8izoDImsz6rgejcwZ7agdJesr57tn2OBfYPAfoeTV52YP0IfVQy4JbAbwGtelnCw0gmIl7YdsEJni5g86K3bE/CnsFWhjju2x4vzvjuWIRVyN2gijKVAJlADcChwS

5w4cFWkhjMoZRk6I0IOsoe2nu8YzQHNinBV8pyfEuoRaa/Ho2A1kzndAAcKKLMYtkecwEUPqLBomp5Hoy+ZcFSwZyBOYaHQTyBx0F8gWjoswC8+OdBAKBaIEDqfzYCvuruNC5YToAWfgrPQWuBkr56wVJexu6qfqvwV55DHo8BZsESAFagBAzf6vpO2uBsnJ16kfAtegFg7wGKcKw0wnAO2tyOgF4SMhseY15bHjaGHfrWTuxGmv7a/qqBrjr/kh

LAC7BPNMeE0wTvuuiaj4hnVmxo6qap0DI2jwA40vQaOGy2aHegHPIGVANYbhLEFEEaHsoiNK0+lOxsgZm05grSwbgumwECfmOBAz4qjs9u5Tp78JU6ihSnvLueLDpGniu2gkjNTIwaOJ4SvhC2Sn6jEgPBRCGIEkAOiUZDOltiZlJwptRoC/ZBDKU0ovBJkqVG+9Dy2DN4BzLDkis6xFQ4VE00HzrOlNsgWP4fkrj+mUD4/pk0KpQDoGqU+ggDNP

6UQzSgumc6SNIw3OdAbky+qPYI0z4LJhbAbcat5vo0dpTEAOkhGzoYAJ86yPQIgUiBKIH/OsUhgLq5NCC6o9R1vrYIl2IOMtJ4SyY3FLL41TS9RuYiwCZtISi6JFRouus0wDRRlIA0nrphCLs0uvjA5ig0MADVADgAygB7AIJUi1644s9Ai8Q/XtGWgSr8lOCi6cTonv3stQhvprD4/iFYlhp8JSKoVMfi+cLqYJtBzIGLATQ+fYHsgeAhg4GQIc

L+I4EwIdYhcCF0uoKBHyobxOtcCfbgfJruQr732BLwnxLr+ir+4l54If3BhCGSlqpAf0FhUJ9CXka0jEUy+KG5qJ+QRKGqHLCAS8DKtGia4OxFdtU2Hj5Ozt8+zd5MDrkyBKEUoSJMOMEelkh+aYHelm3y7EY11nsAVchVwDwA/mJZPhC04yBXSvegVrrXVhqg0HTxpgkm82psJBDYGiCb3Jc6OdAZjnlApGiAtNruH9RgSNz+lp68/qXB/YEgoR

XB6wHgoXLBcNbQzhleut7WNlueAKCIxDzy2PaLLv2UjdKN5kZUGy71ThQhmgDHgEMqNcjQBnH63iI4obVeuoGWasRM+JzUQNkMhEp6pI6yAoy8jFeGmbL0QeYw574hMPEw/YbAUBH4Aoh1fFyMaHoTRMUMyWg+rh7eqDBQWIQAhACavkecxaG5pK9k5IgCuOmMEyS6xHKMq6SRoUh6xfg1qA62yVCyiMwEMYEDMG6AwLhp6B2KdUKDmKWofAJErL

WK2eSxQByypPYZskbA9JiEvP/AM3xCsN74C6EUQi2yK6HTcq1Q9AA63o/+sNCBPLCgW6FkTKuKWtDW+P8w5xhfRK926wom+BnA5vi7mDsawkCsmNnA5Xh/RPssLcC9obb4QPaWGJL8UsqaUFYw86RaKIHuk7KOAe12/w6XCt4U0+gTRGSYhj7ZwL+Q+kC/kKhcLkB6pADQA/hmGHTWHMSg/kkgY74LRD8APbJ4woBYIGqr6ByyAACTOUEMzheqmK

C1xNXe5v7yATv+03z+PuauuwLNrnG8jSRrdtUO85idoeCw4kKijPPK+UHpwP3ohpjooCb4v/5KckOgnGEMpExk/eiWGEqs1hioAIJhURyJpMJQxGFImNZQA64avnQYnlC96KVBn4Hr6I+oXKB7LFXAsUDw3lOhzXaVWKQAt8zPdnk8SLDNshD+tw6R+GMkGQAHobMG1II/AG2yooCuQOckTeQ+sOSAtf5gbiEwSQHoQFCMEyTiRPgwP5wEsmqyiw

Jess0Q5IiNrLGcxrC7LOVQPqQErIlAfaG96EGYGfDp6BowbBhhXJpAZaxqvuIY2aGMUI4ArBjZ+AmYcAC96KzwXZg7ONgYsBz6QKM2zlpXxKXyy4z5VuMk1VAFoXsMfwKYRkmhHXJn/IW+aaE4Sl2C5ADZofwYZiiJofmh8aE+YSFhoQBugOWhR76/oUiCIVDEvAFh+qSNoVQYuSQtoRWy7aHAuJ2h/kBxQD2hG2GdssBcSKw9ctwoJyT7jmOha7

SGYWgA06El4vWAc6GVoenAi6ERtg0wi4YNCkGY66GjQpuh26HGAbuhAbz7oZ9hcEpJ/BGK9/hycuXA56FjqvgAV6EnqrehvxprGA+h9himSM+hmXST6HthH6GZdOaw1TDLoSFhw76AYWRhjQ5J/DiMYIyITG2yUGGoADBhcGHRUAhh3Myn/GFctr5i0OhhFGHnxlhhpkQ9zIxhDYxAAWgAimELJH+kOOEYYTG+HVBb/tRhQf5QYfRh+iwSPMxh4P

asYcoo7GFWuKt83GHZpNgAEmGHBAJhQmHYcqBuxM5y4RJhX4ZK4XJhKEwKYcAg/jDKYf6gh74LJBph8UHyjDphQaD6sgZhk6GXYcZhslZmYRgAFmHcTOF+IURenHZh2LzboTThI1DOYWSYrmELlv6gHmEaUF5hWjwM3uQBBADooPWh+qTzoSFhWBxhYSVQEWHzYQmyBtAkGMU8oqzxYbWsiWHpwLPoKWF5wGlhZiiJ+Flhe4wXOLlhtED5YXuYs+

hCAMVhaGRlYakAoc5VYRzetWElaJZBX1bFhJMgl1aMBhcaiMF7DgCuqMFPjs4oDWHRoZGKzWFxoRhkCaF5obzEXkEpoSlIvWHXCv1hXmCRQENhQ4aZsq1hXCilqFWhlExTYRWhP9bR4aGgCeF1odRMDaEs4athYUDrYZnhm2Ej+F3+Ufy0pKfh+2FOQq1hAtAnYaOheyznYdbhKizNdtdhnAC3YQzei4b1MLS2b2Enlm9ha3zu4UH+rIg1YT9hQB

FXMHQKBEr8BHaAZ6HWxIosQQAQ4TehrczmzPehMXJPoX78L6FI4dfhKOFfoUMOlbKzYdnAWOHwGNzhR6H5UGBh4xjqQsd8/j4k4bBh8GGcAIhhVOEkLGhhc3484ZRh5cDYYczhyLJrLARh7OEkYRak4EGhoPThkdBUYWEACgErBkKAwuHfroqgk4YsBJ8OkuGHuNLh/qQZ6Orh4K4WGLJhZig9DKJhPGHy4dSgmuEyYcrh8mGoAIph+uFfKIbhQ9

7G4ZphGkHDoZgwumGW4bIAL+HToSZh9uH0NpZhJBjO4TZhbvhu4Qeh1b7IrN7h9ai+4T4ueyyKRMqA3mGr4X3+YeGLYXxclaHb4b9BoLBx4QiYCeHRYdWMKeH1rGnhYgAZ4clhqWHFBnnhmWHpuIXh1LjF4aXh0ipFYbnehhjV4RVh5PwJKNVhDeF/qMp65QEJPm1BmbYCoX32oICzAJUApyBdsHBeP84wPgjIUxLxHvxqqCJWSndMnGBR8IdoBk

zKIUHA7G6dHLOmq/a3aOUcxxBgRkKU4yJ87kguzT46NltBPvYa+sYhQKGmIaf2ECF0lkueliE1wV4GDCAqar6oOcKonoUg/D532OWAcEjD7nruuCFZZAqB4cRxUH6h+gABoeVKmNRW5Ib+BsHqfngGXzoj3qRhOzh7YZJKI1BjlgykQoBlRK9y1szAuMCR1+GgkchQ4JFQYaoc/jT/HJQSk0Amljj2CMFOQRVuq75Vbo6OJ65hgUkq0JFAkcFEIJ

GDoXYYWq7+PtyhqYHejhm22h7NEdvKrxEdQO8RBSHHytWU1MG1xCvifqjV2MlktTJFFHh0nJQi+GBIceDKofugUvqnJtSu0XCAto7qjwBYEg+gucHv1MjkBiHm1EYhedKCWqsBy+4WoYcREKHywTahwn4OXnYhujQVOkHU+U7LsNwIUvCn8K4+Mq7tYNMRS5qYoT4hm7anngEhdwHF4urmMeYQVDqmiMRk8kogatzSkdomy/oKkTdO8PjzoA9Sqz

qdIe86SZRZIUvkmUDCoaKh4qG91EUh0SIlIUC6LPCjIU9sY9S+4iuoaSZGkjc6o/Tg7NMA8uxn2F8AyLqvOo00XSFJNHZgrRHtEZ0RgyHZNIc6g9RpkRUhYyEhlJHQyLqrOiA0VFQYuhshazRqjji6kDSplMiuaurMAEeAmUDMIBgeXRHZmj0RGCgzWmfweGjecC8ewKLV2PXE4YacOl44qqFSqANgwqZiWHMRmOQDWBzK5Gg+erMBu/YL7FQ+AK

GsgTsRDlTCWgdBlqHQIXqRSm5SHjhiMerK7mLsdRb77hHU72oSgbA8pTR6bLrBIaFSPn8Rona+oL+4VyD/uExhc4Lq/Oq8AHhJoL+QLvLUQJswCPS/kKJhxIgaxKLWOQqqGJGcyVCenFZcUtaw9OLeECDMyL+QuABk4TC4vogOgTxQjACRnM0KOaiuFMBQaCI1PKRRjpi/kAnhCAC/kNkov/5ZJMuk3KTQgnnApSpYMOAgzswBthve6+hKEXI+HB

iX+P6gI36OtmXAzmEpKNBhsGH1MMO+TxjkVvyChphRHHthPC6rLASCzX56bvKMnQaYoM5hLYpwEcisOzgmYTreNrJigOigAACFw1A2HAmyBfw1PA9kpd6VXPgRY37SgiJR2ELnUHxQRlHiEYAgplGyVuZRT37oZPH4yej5KIER1lFcLgUCBfy0snTO+UFyLrJCjpY3jIdyk+gz4ZdEQLjmUaXeqooRoPTeVFBB/tUAz4DJsv2oW+jH/pwRTq7EuC

5AYsIPMLJhmMIrguC4ZcCX/KmCmFzMzuBhiySFuDRyF6rAIBWM0bBB3tWM3vxkESkU3Q5iMH6KZhjYUeOIzQy0queAmbK8xM1QM1DSgKkwCFws4eTh8ZgmEY2oFTxsRMuGstYgUb640hHmgcAgBbJwuKGgsFENYQhRG7RIUat8KFEiROrQ35xiAJhRvpi3go88Hb74USLIRFEkUX+4ZFEyUBRRPBihzqX45or0UXMMb1FMUSxRbFHu8jS46Bz+sE

GYfFEI3olyLr56UVxhyhHiUW2yUlE8thAgslH+oKThilHZ3jxQKlEsxMqMZigaUVIRAHjaUb1+aCIeUbW4XlGCoBgs3ULBRGZRY3J5AtZRtlE+FA5RuGGOmFZQ85yuUeQA20Kk0cBhhlFJjL5RJ4E00XW4wVGUuAERkogRUYERshgOUb0k8kHxUTbWmpadDKMMyVF9YWlRcVCBUeGcvyQ5UUm6hLz5UYVRB+hJQE7+pVGVrMuCFVEwwFVRawzrUJ

+4CCAi6CmCQMSlqFvo4xitUUGgh+Tj4UGYXVEuvr1Rg0L44Qmyg1GfmGnoo1HArEqgE1Fi4NUCVzirAnNRqugE0T4YaegrUcIugfIbUXJizeFecCtwY5LrfnBGLkEPjrzq7kHjyv9RoFEwvLtRkFHSlry2JOFwUXS2iFHIUdigl1HYUNdRX1HrUH7RD1G/vk9RhFHEUUBc21H4ZKhclFGbuEqKNFGDQn9RW1FgURAgzFFvkH7grFHsUaDR3hz80D

xRm5ySoM+M0FGyljDRpNGy4QjRZJhI0VRCTXyo0fJRbFF4oEpR0VDY0XLRuNFX4X2hDzDLYYBYRNHlViTRnvieUXpuFNFCzIos/lFMAIFRzX700UhyjNGOUZWsrNFKctD+7lHn0WTRl9E+URCRflHU0QFRnIgH6EHowtFhUaLRqABWUZFREtE8VtLRe4IJUTjRXQyK0alRu0SaAKrRWVH2YdLQdaha0QVRyG660awA+tGsLGVR5ijG0cmAWuE1UR

bRjazYUNbRPq520bLQ9LhtUX6yHVGMiK+BPVEkGH1RntHGfhG2PtHxmLXRDKCB0VNRpYwzURVRe3wLUVwRUQrLUdYABuGsSi0oKP4jblxk4E7jbpUBk25M+ggAFADEqAlAHbCSAFy++S6nyqGG3rRg2FzaPKJGTJGmsFRI+Niim5q3TEFS6BSjEn0cxF4FSPEi47p50Bpgalg6bv/BJ5GN8DhaskB/rGqRYMoc5syO+xHn9jqRVqHVjvqR1R5NWs

rB+wG+OMEaU84lTr0ihV4NGqMiC+LdjJSOAZ7ivrVOviHXAYkhjxQHoJKW9Bw0QHz8eVALJMjewkRtYZUAgf4tDpBy+TIZsgHeVsIcoaKINZzEMGYC3/4dsBz8rEzFMQJK836kQVfEcwIFMV34nlDtMc3MXChlMbPeFTFsSjbuGxg1MZcYEXL1MaAcOEKIQs0xrTGYbl4cJTGyMRDBpYCI5MJIIKZwIulKbj6RKkyhXz68et4+Rw6+Pj0xlryFMf

0xyzEdMUMx5THpvlUxEzEemLUx5KEzMXkxTTHIgosx6a4DMe1EqzHm0LLKKnqbTmkuVQGdanwKlwBniP9s+Zgj9gEE3oS88Olswo5GTHyYLjhCnMoOPgpkFHAInJSVCMtwQ9aykRfQ2E5rQNEEmUbvVgXBaxG0jglOmxGDtqLuksGQyjeRQTF3kdahD5EZXoruHD7qbvfYZsp7JpcRYCgm9hKBx4QM7uZGqTFA3lihTxE+umA4gwD1wGeIZ4jxAE

FiE4Ex+qI6nU7BodVen0y58FTMCoYLBNYCeVDaKGCsN5563otKZzHgruasuYCNXqFajYB8qPPiE/rNEkeRuzHqGp3hjd74kS7OveGiGtqxoJi6sc6Y4TG1Ec36Oe6Zzo0RDJEcCn32/o7doHhQmgCb1v1BYY7IbAks+xR/lGfiMvR+EJJA0fBwMvhsaJbNtC10y/J5pqG0ddijCKkQSDzIdJe8/O7mnt2B7H7iwSYhV5FmIQExrI43br0+kKG1wS

gGDcH7AdtkLpLGFBM+pwHq2MySfJgpMQ6R6TFOkX4h9KgQRp1KQA5iPLbsPwIlwOqxKe69iNb8EEGZPJxhxqAowCuGxqxSiISYhLzTMRXAWt4+sMN8SSTx+Jgw3vgW0ZhQ2wLcKAOhHojc3ESA5rDUBAS81eQugDmy9v4ICuakNzgDfEQAdhQC6K6ub4bepAusSiwMQHouUYBBQumc4nptshHhlSQ7OPEIn/g/kGUO9Qz+oP2uCKDmQSShdra9sf

DC/bH2gN7uQ7EGPCOxyjxjsZQcB4q53iasM7FHnHOxnvz1MBpQS7GlAoSYP6HrsZCsdhhe3k5CmLySnvuxa1Bmwunox7HGzqexm47nsUh6uFAy1k/ke5z/rn/kQG5iUNKAT7GMZC+xeKxwoCeIcHofsfvh+qTfseesv7HvnKyqgHGCKI2oIHGHGhyYt1bRcN24x/B+7CnRdo5p0V4+bkHHMTp24HHJfAooA7E27jBxnPbx/vBxaxjjscOY2RgocV

gxaHF1MfOxmHGy0Nhx4Fh1qHhxLAIbsYRxSRQHYfkxIQB7sSbs5HGWghSAVHESzjRxArhG0ZexjHHZ5MxxGhh3scikD7EccRMMCyzccXigfHGmPAJxO+FipMFEP7FBmH+x4nGQcpJxwHE0ke6xE26GwV6x28rcNiRAUOSLNtoxADoIXhLAknCxAAZMA4CZWLDc0OxW4mdW+Ozu2CnQT8GPQcaeMazcHp2BRLF0XqSxSU67QTde2Tp3XreRElpWIb

XBeS6VsZry56Bi8EtwMTIk1guBn4DroFEh3cFpMfM+2KFysYkQlJS59nI6ZJ6KXsX2EACcJPxUH1SWIj8It2y4AMFsQWA68siAucCoMkrAiID/noR8m8FN9GZeO8FCngIhffb4ADwAygD6QFXI5EBIKvmBlJzxcE5MK/p58J3Iy7wTCOYSsRCXTOnwTDQetPPUC/axEN8hpmTF0BVis6DJbN3SHYFmnvp8Z5HFwSAhhR4UsdeR5iFlHkcRZbEnEa

iBsKFDbKAKCXgzAYsu0cFfkRcAdKjCUrx2UQYbcRuB+9BNnufEw8HADuOWsG5+XBa8yXyT6M4AaZzPgFYAcGg0oP6ARAbW1p2h4QBboRlEhxiNrNlEmEK0rF1E7MKiLmDCTbKfwBMCvIy5wFTQhYK//EmwkSiPPNtyE0SyKOZR2gDM3kFEAKR8oMXAqsw+REowMqB2iPgBk7H8iExCwLwkcXuxk/72QsBQffzaAH1O1ELKADreWKrx+EmgtLZeKA

aCgCBzMDgwAgIUtpP+a5x2FHlEBSgiuDR4qgQhPlrQ7Chb6IMktLbfgrNkZgBErOKCfYaoAvo+vPFOgnDCgvERECLxYvHVApLxNWHhtjLxpgC96PLxAzCK8YcKXjyX+IS8avGGLi38tKza8e1huvGyoPrxhLySUM/Mt6iF6EmgZvEGtpbxcaQ28Yr8CYIO8QmglqRt/i7xjQBu8Q8wHvF2GKrSNoJNuP7xFICB8bPxovwh8Tvh3vjh8ckMd4ZIYX

Wowlw0QPHxvIxJ8dR4KczfMGnx1bicgM7h2fFGAvSIqKAbQj4utECWzkD42hyPEEL4u4TKcc5BeJGuQRnRGnF1+iXxPA5l8RrQQvGV8Q4BEvFS8XXxSlAN8U3xgQAt8eJCbfEWcR283Lzq8d3xsFi98XlE/fFd+FZgQ/FG8QWoY/FPKBkA5vFT8UIA1vFAeCf88/GD/H18n8DL8avx6KDr8V7xCwLUoL7xO/Hh+EHxQIKH8Y9hJ/GzjGfxMfGX8a

yADVxAxInxPTB38fosnHIrmBR4z/EQ/q/xbKzjJPnxe3yF8d/xzUEtuq1B+XFNEYVxWIRXIEceI4DEgBwhAgoDQZki8jaaDFi+BJTFmpxSM1rsOC/gpOBshMtIZ06SIPnCBgZqDD44MSwpkBE4RZrCwTjxNg548X1xJqHAocNxVLFVwaWx95EPblIePgaIIYPap+41CMcBVC5H7urYOdqYCB1xLbHrcRkx+CHSvveI2ya5MZAJuBgw1BXAaELBNg

+oFUCwCagAovHwCUmgNfGTDNUJlxIdqrXxN0KZDCtCU37dsG4YAugkQOZx2cBkoWaw5cDZqEPAjgBEoaF+JjCYCWRMiABgQGzRnuSQEQ4BoFCitu7e9JhMwrWC1t7YvA+CCgJEjESCnXKE0CWszxgTRAUoZPxyLhWyARSrsnQErEIhPoUCJ2EWiDxilFYVQHvoHioBQfykYZix6CQsXnEtRDUwe0IiKpkYDxjooHcMWByZpEWwOhgTDPexIa4oAc

IuDQJkYR7eh1AXUc7E6fwkLIuYSkxrLBVA2X6nKGAYQsiViqSq+AJeQbS2wEFKQVLMpvE7jGauWij+yHwJ+/E2QqHxx/F2RBi4K7F64Sb475A20ZpyThxdrrBBmQBUibjQP5if6E+cNdE/MP6cSkz5nNOhecCm+AyJ9bK+YQFAGVAkQiSMHbAiKPyJALhIsG129MyIAMAgFFEqArfMP9bsibredIylqOFWJQkC8Vv85QlloFUJNQni8XUJRAYNCc

+ATQn0shOcLExLjC0wHQk2mN0JvQk3xHUxiwJDCYs4QegvOAN+O/wq8VhRxYBBsLD2cwlwaAsJnrZLCd4oNYJgAjaYVIgOwo+Cv/78TBVCuwm3qIThhwmpwHuCJwm40GcJQrB9/lcJcGSMiCRAtwkVCchADwlaxBMMOxoCpK8JdNbvCe74ykR4oJb4QAJ/Ce92AIn0ZECJH7KBRKCJo65SRBCJZ3zgQdCJqACwiVKCxWF01oiJ2fooidI46IlrBK

xg+ZyeMDiJ3vh4ibMgWtD0AESJ7YgkiQHx/AkH8ckwYfHUiRq2BSTCiUtQD6hMiW2JfPGUiV/4iKAY0OB6ET786LyJdlz8iWHMzXZCifSJkUCiieER1bjeAg2M0okPqPFA5VDUygqJ+1BKidFQUYn0AGqJQgl2RKsOucRN2Mmog2BxrEKqHeE4kWIByMESAQSRoYFgJEkq2ok7fLqJZQlv1oaJFfHVCVXxCAnJnKcgjQkFZFaJzFwwULaJOxjw/t

N+85iOidOxdaj9Cf0wgwmgICMJIkxeiRMJNdF+iTMJuOHrQvMJgySnrK2uywnhiSbE/t4bCQUkdYy3GLOYCYkRMEmJIhwpiQUoaYntco7+mYnkAdmJpag3CZJiBYlEgEWJDSrQ4WWJyRhvCa74HwnneCRkr0R1iS12jzzwpM2J84wHiSv+paw5goNC3YmXnL2J5dFwiVecCIloLEiJIGojicWYY4mYiZOJuTyPYbOJrEE0oAuJZQzEiWUopIl78c

Hx64kaiTSJmwk7iUrQe4kx+F1+kXFgiVJEG4kciaeJRKzniT+JfIkfiTeJxfh3iSKJli5PiRR4L4mlCTKJH4lyieIYEEGigL+JKokOwoBJqUk/3pfqfzGKMQCxyjFq6kYAHPrkQEsAI4BHgPCeC27uOp04gRohEIBCWzJ2Cbb2bWB1pLEQEvr+tNrYq2qmnlmxZLG5sSXB+bFfXOEJxPF8fsExBC6hMVrgbU4RMdNxoQQukDUagUYP5otx/SAgok

Voq3F8sY6RXY4bmiNA/vSyXtI+DbAmwc6x48HoDL+e5fYE6HPSEdh3todJWzIOYG5gbwC5KIQM/FRukM9xI3rFnr7BgSIB4A6GVcCLgMSoZgnwXlTBuvZKcLc6W7pVgCIWS+KWCDzwaXjAtC6h+ORGDmMB8coBCQNx/XE7QXz+e0FrSUWx5Y6tIjSxITF0scJ+Qub+WFH2sy7ZkYPWyQm8UPWxmNbXaFvEzPHeIa2xN0lg3qIScUYPSYBRIO6jwd

Ger0kNFETYyID4JHsirfaK4JQayqJDXpvAwnBIPCPIejpX2mDJ3sFuHpDJTPrxAHUAPACEAJIA1QD6AN4OaIFGeqqhXnSi8B4Juo7aQEwkaqFbUgbK3QgTEcBIIibmDvPIBWy1gUacMHRVtBcUZ+7HkVYOrH4+MQJaDJrlwV0+vH7cgWNxxxEWNrMArJbxCQacpeCw3GyxM9B+xt6e/nSupnIggN44Ib3BJm6LPkLJBMmPSUBR6ABsZEFacjxJJP

fotDETRNlhbDBgQG7uJcm6mmXJeYLgYSGwoow1yb0MIEZSeMIgZiCaIJzxQAm4kZt+8Ek2sZnRMND1ydFqjcnYmJXJLck5wHeG7o4WGoh+eMF8obC+HUF99pgApACkqCOAMp4EHvCOJPIaZEh0ljJBDHdOtGp79HAIENigCiZMxIHwYLJwoPCSCF1IQOKZwe/SHpJchJ9qqJoTnnFOTIHByae6xY6L7ovWLE6jcQU6ZPExyUPgYn5MsUg8axb8vp

LmpTQuNkpAZiZZybWqa5qZMW4SG5DtSJKWAAD9r3JAAvhkAAD8ZURoKbjeGCnSUNgpDnLeohjM3zQQdsE4ke5HBiu+A8nzTpIBbKGlMLgp7pz4KcwAhClyMX/ezDYNEXoJnrEhxGrqJwDZqJgAI4DtoIRaN3CnFMdoH0x1HBDxc6BxwfEEUzrYnoza+6CvTHog3wj3ENYygGLAbKGQjdbehM0SfyEfyUDODF7fySNx1LFRyQApJvqzABTB8cnmwO

1gPgR8TmAo9PG6bkSwcayzSSzxzYY5CRI+BRYmNGGhMbooKcikhOH03vhQWCk4Kd4ppvFi8QeOLClrMcB8Pk5aILnQA5InTIyhlrGePiyhtCm/PmUAXin7CePxwSn+KZC+aP4aSumBy8nbyhQA2rTxQCJALEDlcQT+iJr8IAToTpB9EiVu2kAdsW8ee9D0nAJOcinwYBtIXl4T7iGimLGdcQYsxcJg8N44NeCyKVcyqxHZsVKEZOxLSfjxg3GE8Y

WxoKEHEZEJpPHRCbCeWuD38vahYq7IfOxoooHYzBXYGJ4hEJNA2CFwKQbu7bEbNrwkHindSjBuToLc3CjQhzzIUMzIP5BTrsZy7UTkyEYgbu4nKTwOZynwsFl8VymBXNGutymJKJgADylyYg+IdRaXkOfGO5H2zo4u1CnOLghJG75EkVwGTym4GC8pZrykiO8pNylg8t8pvymZKS1B0L6LyWZ2uSlYhPXA7yzxQNwKxxLuGvwkBRBEYnJ8E+4qrj

L0BOj7XjHQYMg4xhSuzDTTPlPUaPiHXpfg0ICOnHXUYXAV2FCIXS5Jhu/JPYHbEcmquxHeMutJkcn/yXMpa55a4AGxwCkvbu1IkASjSMnJJTR4zKV0E1peoer+4cTCsaKx4rHkQJKx7U5fEcg4Ejp2nLfw3tjG/nC2pgJ/jLex+iy+KdUC3KypKCqx/UrRfOap/66U1jhJ+rjPZLapvTFsyt5I10pCSPyWO1LXjgGBqdEgCenRhw4XBiT2jqnhcZ

apLqn7JG6pxDB2qblx/zG2hukunWoaqWKxErGiIdPiy0ip8JHU5XSwsTL0WiAz+hZMcPj3XGiWXnApxJHQA1K0ZgfizDTxBNI6I0Bj3CqRLfBWVKMpIQkrScQ8SpxTKYExMym6kbSxMQkZXlY2TMkTEPYhKODLITLYeBZGMhjgV9jzgTKu5DR7Jsr+QpbZCW2xCCmdGrnwd+5qfis+uvghIdbmWubLFqwmpaneNpBIctg8lGaS1ak1NJxS65D3Us

86KNrhkfE0kZGJND0hEADAsaCxxKjgsYmRXpT1kf00NPCDNNqULZEjNKGUF6bLIWWRCghb1LKU2Nx4qQSpEv6vqQc6H6lvsHk0lSF31HkUwV4cFvSQ9gibkXZoF2ZmJo/YLKYjqcRUnZHoun/ImLpUVNsh/ZG7IQc056xZlMS6iDQnNH6E+yGBIt26dQBJwLgAfmL+2t0RsCLyYlDwpuJFbuKmFP7XaAESCWY8bMrUYpGWyjrKsvTcunh+sQR/HE

rU0fDdyICghqHbQQy+BPFgIZTJHanFsTTJRiniqRHq0OBwQNxO8PBqWAV2OxxBdmnJl+DoVL5wyKFPQbspfcGGqePWVPJHKZ9BU9yRftF+FqnMiTUwqeSi1mSk7VFciAWohOE+vM5QVFB6LPKIXmnPzDN8DYJ+icJQZ4B6dhaM3zDhcYq49bz1/NmuUlGOafexzmlf5OrQbmmMMR5piYkTRN5pB1C+afwCgSkRinAYQWmZAiFpkGrhafM87a7Rac

pQBlDScV+aH/JKWPJxi8RwIvZBFrb7MapxCSkQqVIBKyj2aZFpYT6JafywLmkpaSPk7mneHJ5pmWnPzD5puvwj8QFpBWnYCQ9CoWn0xNn80LjlaeVyLIyg/NoJwgYcKUoxBXHcKZ1qGoAt8Cs4BKBwjjtMsSIHJv0o6cTY5mdAxZrbZLu0t/C4aFgUBp4tKSTkbSkYsSK6Ggo3FBeQCeDgLp8Ar8ndLsMpAF5yacahraleMryujD6VllEJPanzKV

8Aw2JPwmaUFgh+DK56um57sMeEFwHijj3BQ9ybLoTWgrpj1pKWMKmHGKeCKQKIqZ8pyKmkiD8plQYOdCyJAzB46W8pBZwfKRiKROnIUCTpG654sP8pFzLRvsCp7HruPnEpzKGHMepxoamNNjjpFOnnKT7OlynU6UipJTH3KaTpaKk6CRipdJH57oyRhgkwAKp0OADxQGdB5snoaNUyozRX4OHAx2jVqn4sPZ4r4plYCiCKQJg4FK69krFw53T+0r

8qH8GTalVSsNx+kBcAxESyaaTJ8mnjKYppRPFUyWDOJbGzKeDpEqmWwMgqPxIXdDEybc4SgU9Qukg/HmZpv2p7KQgpN2nTBHnKJv4YgBxc+izaSTCRjgHQjLWJ0sJtsmxxcdZ8yPQsZRgncnwYrlDrPIzQfgi9DEBYaLCEmGMAFMjYAKIofaiIsPOYHmmcQr3kqEZ0iAXpZ3yrzO129VBu7r/aW3x5wEnppJHJcUJxRknp6WSYmel2VuJA1en9Uf

muxFxqQu3ptcml6fZx2cAV6XYi4+l6cnXpw2kN6cTe4TCmiEi8bene/LXJIEkG9mqSMljNtJgofcmwSYvqbWlDyeAJMNBd6QxhG6SCpPwRgnFfsYPpYFjD6Q+xFelj6XJRE+nXrlPpg0JF6R3pc+krsXZWS+mf6Svpyij16UuxTeldRNvpuwnF6bPJo274bhUBrUlbaQtMnWqv6uhcI4BjAIuATk46MUA6HtpIokj4MCnJbPuE0fD7Yh6QgQwbxL

HcmOS+OCHGdjhiKbjYQaJGZDqgMqjlYt9pvKkk0s2pSwGCqQWxTWwGKV2pm0kTLp4OS0BMdpr4ZCTsyRviCOmXZsnQPLFZCS9B64Fi0vLYseB0MmupCPoLBJGs4aQugPappTBqGZRxcgDx0W0cWRBTQD/yWhSn6UjB5+nc6WAJvOnwQtoZvnG6GZLp62m6CbsegSIEgFXIdwCpMJIALroq4GeIIFA1VLCO33hnwQI25drFNPWUsAykWDUpNpIj5t

dGEfCyoU0p/SAuOFAaafAx8ISU6KLiqPNmG8DdIMhpxMlkybFeV16A6Vk6sxw/yYuefBm0yVtJ9MmaaX1B0qkvkdocvUYA+vhElpESgYJIStSPEH+RbUoR3GIIdeb6CTuayfSkIWPBMTxitMjk6qiEfBWA9Lg8CBHY2PpAHtj6C6KdGhXQwWzy4KcRK9KQHqZOPCFFnujaJZ5q6hQwCumPgGwA8wAU8eYJboYOdtJp94hsxhDxN1zi9N6SGhYTij

52k+bvJsE4aliEgQ2atb6+kGIIhukwUpkZKRpBCcAhLamXkatJ+Rm8GaDpXul0yb2pksCXAFA+e0lP8ivIKlgR3NYp/ixxMu3BnoCCJIsmOykR6RZp9jR8IP0I2KKukd1K2QzTlleGqHqb0eSQUeo3LiygWJnUVjiZKGFwoPWIqhyRiERWrjhCPBjOWJEWsTBJphn7DiGBkKlISVwGxJlRVqSZ7FDkmfiZ8aktSbrJauov6odWVNSSANgZqulaTP

hBy0i7FF503YxwSMAueOimJvJAgYbX7Ev2ueIWyHUI4LoXSnwknYw14NBSkmmtlI7p2Rm9gVwZ3xk0lu7p126qaWKp3ukaaXsiI86gmUNssabjIjL+087hsSihK8iJIsFwzRkomVJs3QhGnnK+66kKvqUwi5jQVrdCf64RqQis4vYNuq6p5AAVsXVhQZloLCGZEfFhmfS8jmF2brI8QRhuQMHu8tRYdKYgACY45BQpPlaBgVoaNCntaXQpyhDBmf

1WoZndaVOoqZlRblBknuiZmXYZ/97S6Yk+U15M+oEAaB6SABqARgDOsSxpIfCLwiXQQeJ58MNIE2oV2N5IQChsOB6QXx5sJEBiahbVsc4+vISVsMmSB2Z1CEkhe/SGmSyBORlfGW2pZpnKadTJ7+K3+gyipRl7ImyRFRk5Xv5SlGp6aZ6AMn6wmTDsmMzJZGK+V0n8yWJObNQ+ma1guy7EIUqxLKAj6W/4HACLmOXA+Jj6UG7uP5lYjH+ZaCwAWS

08lOCM6cVeSyoXAe7YVaTgSAWZHz79yUGBg8lHMZYZ48ogWdwo/5mAWVBZa2nNmbyhMukQXuxGDCjdoCVUmBlimaUpovTtCEiiDuSyeNlYFnpyfPtM0wi/NugUF8n+dFFSSHRduHvW0Y5W6eAa1+xt2B0gjeb0gdjxp5HvGbSanBkakcUe5qHdPn/Jt7oCGfDWlwDXLmeZ717vACuRCy74RMCyX5EclNn2/sm8sdnJaOmFeqiZvpkfmUEh3PGqGV

AA/VSQcQZ2xz5BspZZ1lllMtdQiHSF4JFol9D3iJw6sSmMmV3hse45avHuWhn2WY6xfJmIGQKZnWrvAKcgVlBjAFz0lwBlKA4EQ+LzACRAcADzAGeIfUH9ScsUU5T+qrfsWHQqZOiasNxpIsoaR4Tw6cnBx1ztgVMWnRyGboTJIiaIPs20v1YiWQtJJMlGmQKpUlnfXOaZ9p6e6d2pAJkQ6RueSylMsS6QD6BNtMnJtghERPiB6dzVTmtxshls8e

JO47RLmv6ZJCF7cWQht55L5DxUMx6HdDHwx9oogA+6IdiGouacqHSmHibgcnAOYAN64IEWOl7B28F8ITCGX2xwANNUoem8VFagRICqQIMAR4CnIHl0R4j+GfwMlDSSDIQmKtqNtFP2/nT0aPh0FjTjun5e907XoL6SV9LlNu1a9BmxrFtSQlnUJAD6hLEiwUXBHxmSWaHJzVl7mR7plpnyWTWW20mXAKpujLEvbukZWzLWkWKBRXYyruDs9EQoxl

6ZkmxYFCpUplk6Htzxz0nHtugANQhy4EtkS8FgQET6qqiMIbBAHV47ALskhjrJbB9U6uCGkWCBXCGLGSdZ415vcfjBwp5YhIuAqoHTXNUAlLLuGhwQy8jeGnUIV0r6MqHAY7BsaGpqpCY+du1IYwiHtK/BLKk6QODYm0jiKbzGQm6iWU9cJLENWeqRKNmUsSKpUCFqadaZVR57IiUp9pk8ht06EgjgKdjMkZZJZDJ4C7D9AeHpkpqvQZNZYmDw+J

KWlyzkiMVBlFaQJKEA+gDCULZ08PRVuEUJRegziKnAn8BlRFHZ7DAqQbHZXECUTAnZcPQO8SnZdLZWSdkowYhsyoeEs8hKcKxoy8DnGm8+JbqUKUWZ4gElmZfpGFkw0NnZzqTXxPHZidkxdHWo4VZBiBnZjUm/MSmBeXGbaR0ZKBkf2rpKVcDMAG6oPACvXrsZCg7REOe85YAuktZp8HSw+Fp40mzr3DUufe7mMnrUK/YeyWMBgpE15qRo9GjRbN

op/Kl22X4xJY5ODmq6oqmY2UeZgJmaaRBp5inASG4mr/qmukDZhmlPJEJZitSqqc8RYDh41ATURNQk1GTUFNRU1M66tNSA7Hr+IbqwBsAGFoB1SrPo2ACNSp8R2yHAON6h6ACHgJlARgBHgNw2OU6wOTAGmDmGgFwOpyBOLHvSgaEysQapKJnn2CmiWCjdsfCqzgAfgCXR9nRSdmTKTDkcICw56PRhKTpAHnCedHvWPnTyHiIBXllWsaAJIanOju

PKHbAcOYN8J1HcOT8xynqj2Qmp/CFJqR/awDmE1IEe4DmU1NTU0DnpqbEicNi/iDj4tJxiChNqgQy0NDp4bJxP2Ac21sAwgPHSA8iR1Dn2fFmBKtC0MEB61DOQDalHSBwZgKEmmTuZPBkRCX8Z7VklGc/ZeyK7AUaRuqlFRraU+U5raBpgsOn/9BD6X5EgbH4JiJkh2XIZbNS0OYzxGJl7ku6RWeacCNupbebWOaU0vQi4yFKoL2LDas45XIQEsK

0h3iLXqW86wGnJNB3UvFRpND3UPTRJkX00RzplIbBpYyGKDJ+IzezjIOC6QiZMnNMZPTnoFkshLzoNNEBpzTTRkRIA09mz2apA89l1ka05jZFfqSPUGZE3FCAKrMbX4G3uvJRrOfLkGzltYEsWn2aOIThpmyHrIcQAuGlbNIQ0d6kkaduIHrFEugg09vBUab3228olcfNep1TbVEP608IeBNeEx6A0qNEZFP6R8O0S1BQxcN85FK7U5j60DLSRKQ

fiaNLm2FUp0WQicBuZ55Fbmd45XjJgns4O2pFFGc7ZHVk+6QKBHtn0OtxSCkCNPtPOZ0Azmp+6MOygUnnqADmCsfw6kNTQ1LDUJEDw1IjUyNSaAKjU6NRoORqBGAbqHl5wGCipyQGZGn7N5PKy6BFiUAnetAEQQZxyW1D2uMnx53jg0Z7h/n5iYT6kbbI4HNygglFe5OSABKxWUYuAMAAOUf7oWNHkmRYY/THauQ+oMqx7ocr8avE7OFwCzZw51p

qW8oynDCcMnkkPzMK5mi4Z+DTEWtDvGL3Z75D6LFd2tHK26CXJDMjZwFCApSiHpHmh5swwAZEwVrkiMCNMshgMvPa5MxqXMM1EbxhbzK+xghzWQFtQH4nr6E8MNrloiWdQGKr6iNasSvyh/AZWhOG3DDuG9Qz7CuHOCyyJCoXoVrm4rKOJ6TCQWUiMubmeuWiYGKphXIIc0ZlavDn6dhgtsouYZwLygqkoa4biQmIukfj9iLYcQbxCti2Yq3Isig

TAfBFzhiQxYEDyjAiMeYz/ClZQ5kCgmNpQJIjpsmiMuaEjmGawSbnIUPFANZxrpG2y+kDUKEh68vwZKCJJW+jOzOSMQbABGHMCUHpFUNoAJajYHoOs3ErnBDEwwvEvzLS47jw9soOg9YpCyGasYKxayDus2KyU4Lm5yVBU1rgEN6GMiAkYkeQppNyZg1ZUBDQEs/jg0aDhYtBBzu/x+qREABrEAuj8oMk8gqA8BJcwsUHfCYAZifhigGYoZJg+6C

m6fLnmsgK5iALYpPW5i2kKLuK5sgnRsFK5T76oeRrWcrlkmAq5jDHKufgAqrnquZq5X97JUIrhdhiCAPq5GqxGuWzCwWlCQj0wNujmuanZVrnbzLa5IsBRuT4Bjeo76M65W8yuufhcbHl2mBXM3rl1qH65VSSCQAfhnxqOuSG5qblhudW5TFCqebsaMbkaeXG5oiw8caXZ/TA7uUko/xhpueG50OqM0Hfo2bmLrPR5EHoFuZm+0bjFue6KBwqMZO

W53SSpuVW5ynm4WXW5E9EQeqcYxQJeHFykfw7crCBq6foduW1CyoLduXtCvblKrP25U7GUAus+aaSXGI0G3HlO0bPR3uR0cTO5MALzubis1QBLubD0nN5ZgPF5rQmNYXigiQqOiG55e7kPqAe5ZJhHuQ5pQgCnuRno/ExTVle5OgIEjHe5yi6PuSRAz7nIiq+5WEl5wDEw5vyi6N+5WIoCSqGgf7mzrOuqQsiYrMB5UACgeXCg4Hnd+HgEvszv+L

RQMHlUZGcwL0K7ONP4LnkVudCCKHkjUGh5Q+EZmJEoOwLDGEkweij4eVRQhHnBRMR5B/hkefWoFHmrDk3WsY7CNlqGJ0meWVHuVCmoWa3Z6FkSOTDQVHn6svDhVbhCuQF5ormdfoLRDbgseQl5VNGYtpx59agVedDR3uT8eRq5lhhCeTq5RpiieVT5BrmjVJJ5hWk4Caa5cnkXRBa5E5ZReYOY1rleeWAY/nkJeTABsbkiLMKg2nmBRNK5a3LgWU

mgPrkJMsgRKUGVJIX+Fnlc+VZ5ynmXDAF5hs5UUIL5LsxOeWgcY9GqttZQu7keeU3K1nk+eQFAr7S2eQR6QXkmSQUOJblgcqWskXmVuem5eLI1uXpQUFkBecJ6Tbn1MC250anBGBl5jfpZeRXMuXmdzPl5o1SFedOsKVAAvsooAujleQfkpPnkgDV5nABiwnV5DEyLufyIzXmruZkA67nFjJu5XXlYUD15+7m8pIe5x7kS6CN5KDBjeXkwE3k3uT

lc03kPuQ+oT7lIisOsFwTvuct5n7kczOt5v7kKKI6xgHn7eTisR3nh/GXAp3mQeRd5xiI6CLB5S7LweVP41AQKeU95xlHseSre6HmVJJh5pIjYed95eHmMGAR5EQGmuRBYQPlJuv6goPmo/uiphFmtmbLpBgkHiDha9LI4AEsAXPTtwLtKrgBNgAKsQ+CpWfwMBfAF+pLwYyDdjOnEVkqOvhcUVpLxHp5wxxRTyNogc0i7BtzSiDwBGp04I0iimn

Zo0V5Z0puZxplNWQ7ZLVlC/oYpVpmYuTaZlwA6qTi5sy6qatfsMTHv+nhgnMkxWMRo26DKkQ8ROckEysQ5YwDKAJoAs7QagIOAthSZQOJApADG6P1UkNQGOJQ56o7euiH6hWAQ1FDUxNS0ufS5SNQo1MeabAXfEQDuEKpcucvayhnGwd0ZEsm9GdsgL57Znmrgl5Ct9gDafVTBbKRERiI0YIgIY6J+YGuikIB5nuseYtlbwRLZZ1nZzkz6T3QvdB

9UX1Q/VH9U5G7fdJFiHJG69pBI3kg9yPrgYz6NKRT+pjl6lLUIFjmMNGiW/jT8qqw0/GolEBS+9r5kDJHwI1isGWyuhiFX2b4xpZYWDAgFMsEOnmDpKAWu2WgFSsF42UOpYCgjqRdB3ebJ8JRehLlbZElkGcRX0rzJwdk2uqHZr5koXqISGTmi4Fk55ZJhISM6IaaJFkVOBulBBY9BCuJq1B7aAUjQ6WHAYZFpITeptTkpNA053dQZNObwLTk5NM

c6zZErOdbKGMzfCCJwLpJ8mPYIgQwk5MzGQKmZEpep3rq48B0hAwUTOe3UDhCZdNl0uXSFtmMFb6kLOSMhUwVmomPUcvhYxlsUsrRcljM0yWSVNHDc2mqjQO2RRzm9keRUPZFrIX2ROzR4uns049naCJbwjFR3OaxUpLrEWX32rCA17lAAgninII0AdQB1AJAGZWCSAPXAGoCYAMSoC9mIyU0BZIT5qVum5PLSWEV2RRR4GYCcIoRC+Atxe9n8IG

XwU+wBSFpaq2qSDE6QUhY4+B/Srxm8/rbZsQVfydJZ4cnMXk7ZyAWBORDp1x4qWWyi50lFeEdJLplrKbeZ35HMJCI+86njWQKxnAUyjpQF1AW0BUPiDAVMBSwFHOyEOUGh1DlDLJPOYmC02UbBuh7SBY1esgVlAI6c0dDLQAgACOKu2ATUucBT7DSequD/iBrgcsmvAGBAYgAEmfmetyIuHq9xJgUY/kz6FAVUBV1BSoX0BRc0qoXOAKwFVZTbNI

/5yQTvov8m9QisOsYxldgaIBXQiMQw3K3YY0DXSvjsskgIItcUDCRqXMWEFcYQSJfZnjkXkUi5eRnUbI7ZcllG+k/ZEOkq6d5GmQW8ANkFIMgq2o9KycmRdmacZCRhcGFG+lnmabnJNDnbQI3mNQWbqR6RuTmjZopYaJoL9HyGWYW/qdPmeYWt7HBAfQXN1DU5uwXb1J0AFABQhTCFcIUIhf6ASIUohWiFC9knBboIKZHnBd+p0wUyDIwmF5CWyK

vE9gisaAtIa8BClDGIKSGjOdsFi4WZIXsFEgCn+fpA5/mX+axA1/mzoqTU4EDzOXoIqZFLOTfUupSR0G9mnQTgyGxgRGK8lNU0GHCcJMnwhl5vBX/UxzkxlF8FmzQ/BbRUfwV7IZwptzlrgCS6qyCwgX323AU0uSn6dLkI1AIFTLlCBeGFFzkSmRoGFwBcxpUy78FHyb4akHSrwKLEURmx3B6G8dAIoWw8etScNMPyWuTutJUc/Snw2Xv2NtkwBY

1Z9tntqTJZEcnchY/ZyvLY2ekF0ql1heE5mvJw+ICIfhCBDvExJLkmJEKc0Rp8yQupAsnHxJy5eOIDhXUF70aa5uEhO6nwplxFVhLtTFdKwXA6Umz+gkUVhooO84XilDsFL4XLhW+FqIYfhRrgX4UsQD+Ft/n/hZBp/dQNkUeFyzmXBUycj6ah2CEQGCjKFnfUMljgiJvmD9LTCKWRYzmOlEuFIGkcQC2gLzlEgG85oUXn1NBpF0gdOdMFbGhosW

tI7WD58K/UGeCCujUI0yGhkRsFETkdkShFnwWnOa1F2Lq/BVA0/wVIGWMFQIUVIcxU9zlghZZenWrpcN2gXNyDAG5Er1n/eNgIs/QQ2AhUVCSycLLUKtxLwMGiJxqsZrUu0MiEFD4E0WxC+B1xsBqK4oL6l0DN0oguOR6FwR3OEkXX2XEFhSwJBRYhATkKWdjZ9cGU8U2WKzIdhlCZPCQuNulsIcBJOeUFKTmMYqH05RI1BQzZIx7ycHpYauAhAB

e2XNIyQEtkSIAO2m4gYxmu2G4g7mAKce4gryruhcBenoVQgRNeRFkjRR/a9cAtoEcE8wBJwPcKkJYsqDBA7RzN2O1ICfb4FDUIw/LndGRoQ9qYNl44zwDQQJGqxlTDliAFx7BUFCCi52xB2QMpZ0W9cXypRYWIuXAFPxl+ObLBxRkPRceZlwC2IXjZyu5jSGtICFR+DKZpp0l4BfmFsClImT2F2oW5xoDFNmmT3Ff+enGNrCMwHFyHeWVEBsVn/p

SAxsWiuNVpBrFLLkBSXZLRbAAMrj4w+U3ZgalgqWu+pZlJKQYcnf4Wxbc+GKAmxdJxv97nkvYZLZkescA+TPrVJPgApADkQASoQ/oOMhKo0kg58EKUOVktTED4ZdBBLKc2TDQMhKeFb+BEmi9pWcGFhTz+ebHbmV4yd9lL1nJFlYUKRdLFMKEYBTLYoxKk/s6ZsTECqP7ZXgRvZpdJBlnt0pkxEZLlgHL+M1lfmXh6VbyWvKBulvESVtm+ptDblo

GYWHisvIOIj9Y52KiCWULNNjeadIwCcpj8yXzDxRau1yinfo8k13ZTxftQR4ElUEA26KB+NiFa+YSBBuzpezGc6Qcx236EkWyZe340vP5c4t6SEaPFj8w7xXS408XM1ofFcjiLxWUBCBkbaasZnWrrVJtU21S7VPtUh1THVKdU51SXVGyRZDJuOmlZEtQJ4JJU0tScOtQ0d0z0nNpqjoRrkbgiKXD4uS+E9TgzQVNaneyTFnZop4W/OaJFO8jRBc

LFsAVSRWWFt0Uk8fdFWNnSxXahA6nBgCpFDYVy5HY4uOQtheS+X5FBBEnQj5kdxYZquQmGdBbARE5mRRtiklINBSlGlqZ/WTgl3oTl1DpSoXApxH4QxCWI8P4m1uSpIQuF5ZG3qZs6kzncVMMF6TTzORMF7TnpkVFFkkCcucYUZ8r35g0hJ0ZI+M1M8PBqJQc5ppGAaZlFXkXZRdzo8UAwAN94FDBjADsZ+4VhRcVFwLoXBbqUp0Af1E3YABZNGS

M050CfxFJwW0ivNE2ASEWouuhFbUVnORhFlzlYRdRpOEVkacCFeEWUacNFjzlYhFSyniX4hD4lccWa2ONgtQhTeHqghH7ASKtIJSJ/iHkFtQjHFNWpZGjfwdsqi5mF0CfZBHSoUhfZzIUtPjEFIck32XN0tCUbSZLFDCVBOfR83L5RZINgZdA4Ba6h39mqxTdQ7Ubo4BrFyTlq/oA5uWSAJVtUJMGgJUdUJ1RnVBdUV1TCBfqpWoEtGdTZFxmFyY

TOyhD+gCeA0PRCKEXZfuAI9GVE1yW3JeBA9yX/QfT0PDnudPbkW2TedJoWJhneWSjBvllowTDQzyWo9MnZcjkX6iPZRnY8oQvJOMVLyXLpB4jdmeRAqkBExfgAW8n/IpVxvhCv7ONm9QhICGZ6iR7iqPyoW3EK5IVZMRmX4Mw0mDjwMhwQYemdKc1MTkxNtHDugqgrEQLFCNkXRQi5VCWDJfEFaNkWmQeZ1ZZVhT7pwtkChREyozjsYPvWYoEpMT

KulGpqcOT+MhmPEYupQiUONOJ0GtRAxYaFpsELWRIAC6JV9vSosIC+2HOiqqjwxbScBwBpgGo682jKcCvA2l59QejFEIFLGV6FPsH8ISg0tUr1Sig5KVloBqSE9KhSePcQnMoEgVZKLSkVgWbZHpBWOfi5WnjxcG7KheBqDHSF7Vr4udQUC3FkJY3wFCVFxctJJcWlhb455YVIBfJFxRrY2U+RAVRhOWwlkECStFSExLkAiNypKKG1CIQFjikGRT

KF8qX4nmk5ih7IGRPcg4XZOcGUVkV5OUGlIGwbFqISR5FmxgmiB6AS+EEs47D7ORolHkXPhVGRr4XoANM5c9l7hdoIpwVGJZ+p5SHHhZcFphJkwG2RTUU4uhlFm9RZRXU5Okp6SgZKRkroBX4lQyHqlMYlQSVgulJwSEgcbgfm7HbC8DmWAbSKVO6Q96AJJashSSVANO1FHwWdRZhF3UXYRQCFuEUpCLklBEXghdvKuCTdoKPiygAuokSp1jjGUr

li2dAkxrJUcEgpcJGmgiT58Ov6gU71HHgMmhz26u0lhiBOyuBI9BqWZBnFhcVGocXFJYUqur8ZEsUYubyFPuk/4kKlHyoXhPDiiKGNOBrAZ3SUItdMo1lPmYZFL5mwEkA8Ee56xQsE6kAQIMSIVyCaGcoQvGUOSQJlHy58NLnKVvph0E1pHHqgqfD54Klt2Uj5uTJ1MPxlthmsKcHFBFmwpYf5OSkIpeHEFDDpVGO8J4CNAMXOR2nF2H0SJdC+SO

1goDx0mRT+VS7I+LOw3WZh0Nb2sthLyNXY4zS+cEjYg54FSOBlSck/6laS8LnBCcjZnKVmoZyFQ4EVhYeZVcXjJc6xVGW8mod04IjvRWt+PCUU6EROmFJdhZrFFQUcZYKoPhKSljckXMznuPC8qHGPPNhuUInciTekVcxfKH/8sXEaQIBGkAliUAN2k3ZXfl0AqszteW+JeokpfF5oqImO+U8Y7Pl88UA21okAFINChLzKgOwwUkSx8gM8N3kHrL

llnFD5ZRnpb+n2VsRW+FauBU5Wf2mEmUTO6a6CMXllY4JB/uxWdkndmJ889qy0wlxxVWUUci55tWWyEUIADWXfCtaJMFAtZWhC7WXVuV1lqdlfxbnYfWVvKANlR5xDZWXZo2V18uxQE2XrZVNlm2XMiWCJYlCL6ctWw8yLZSRWCfIKVIfp/VmGVPWk0Emw+c3ZcEkI+TzpimWrZUgs3MyHPDbCXUTbZV1h2kSwHH48KugVZaWsUYDVZSdl6Lx4Ru

dlDX6NZVdluNA3ZT8Cd2W2uQ9lD3lwoL1lzFz9ZUH+H2UoAV9lVhE+rJNlmOWEmJZJVbgg5c5WYOWg5ctlQcUZzko5MIYqOexGoCJJwMwAx8H6ACCZmIWwIkBibdjEcGQkPslOOJJOSI6tYJ8e7FkOyJPmE5LCSPHSLFqIPHdMSEjfLqkSIkXkPudFAJ6XRWyFmC5cpTJFXIVhZXylEWUQ6bGZtcWC+I+i6dzsydHQ1xFX8NGQoMAzbNKFcqVGRb

+UMli7FM40l55SBXNZPRm2YNrwiuBGpdrg2k5y4MQAucLq4BgMhAw4+PJwF7Z+YMEsQB5OYGbJnCELGSBevCF2pedZgSKVAPQoeDL6QC0xRKmjhSuoVCKlNLS+RkzE5J3s6mBR8GiUuo745B6GYpoy+vnFa4j3WjypUQWqkf0ln8lO5TdF3KWtWRjZlcUZpdLFk3HPRb4O8yLswbE5NRlzzhXQdXSumWUFfHYTWYtsDY5CWJKW3MhCyDF8aACxKG

hC2iiOsfv+h3I0oNcp7Mhd+VBZsVzm6MlJyAl36EeMz0Kd/AssFQLiQgIYQeilPPKM0onn5bjQTymcoS8444LSOISAPq5AbumYTbnsUNqqXmCyVpcChIrtaPmcifHvpBphrQqW7H1plJhP5Av8Ps5Y5SuO3MwMZOS2RWWtuaLOXTGFyoB5Z+WSsOGgl+U7eU6xErbvsvOMqNDKyI/lSIzQFeTpxvmSQnUMn+Vj+czlv+XTGP/luLyAFfFAwBXZwK

AVFrjgFVtEkBU20UlJ7Ylv5SuYZiqIFZYoznkDVjL8N/EYFagcwYQ4FUkkaRj85ZsCr45UgrPMpBUTxfWZGrirDvYu8OWuxSpxQalqcRYZqOVkytQVKILiFbxxPwJX5bpxTBUVcsEuEVA06ewVweGZDoeJSXkf5eaCaJiy0Rz5ghXEXJEYIhXr6EAVtBUSFQusolY/RBAgshWcFa/l1FDv5ayqKhWAIGoVlMKoFZoVGHmYFYikcey6FUyk+BXTZU

y8RhXEFSYV8rZDVoSMvWQ/xQoxwVnKOYCxH9qBgAcAfm76AHEJFXFIyRLApEQGZD6ooZQPthdOsVI/3HqgNgiBYPRaBD7zJbGlzulO6QDpSaVmfGXFv8lppfPla9bY2d0Vy+WzLkPI7GjqwdjMeY5fkdgIrzQxDE4pYj775f9FknA0alwpefb02aqlL0nGhU8S2EhycOOiSsCu2A4eC+IAQnjYIgh+YICIF7ZT7FrJp1mV5aYFvpb6AMoAGoDdoO

wALqUlzk5eMOwMhO0IukjXhMoOVkorXLpIMdC+GlkeZKVyVK4xWLEJMvhgsxUshQ7lAyXXRSQ8LuWhZasV4WUL5eMlu0lyxTle85JmpmfFTcXyHjKucy7plislv0XnFeCqtnqYkdcVu3ENXmqlkskSADMZbV7aIH+kENjqtMWA6sBOYCny9sEMIGIAsIAEDNq0R8pWpcdZRgUV5TrJ9qVQySeAuNwqOmVKxRwOBRDSOOxK/jFSUqjrbs8AI0D14L

kFWh5eOPEs8dAVhqGxpKW0pbnQfVpjSBrl+/SZsYMpgQk6Kd3OYQlu6TPliAXouTyFUsVUlUpF3VnaJebkqkVwodZKM3iNxbgFOkDFpT/Zc0hEYjSlsqWkBX9FXJKdOJohIsk8uWrm4iVJRpIlEVKWplJwwKJGnJNS/2KkpQwMEZAJLG9AsvTX4EbmGubjoIEsQpHg7I6cQQ6bgNKocQTozFh08EDx0O5FazpaJYMFrDLTXLNcxADzXABFh4WTBf

OloEX9gFQkAMVjSJXYdlKJagcqdUUvQNvm6iWPhRGRA5VbpfpKhkrGSoVFyZHDIROVkUVTlaRE2kh61N6oMLbC8C3spuoduMt+/6mHOchFr6XdkS+l3wUdTjsh6SXXOZkl/UVHNL+lIGD/pViE9ABniPpA8wCEAI66xKEq5Q80WMnUIoOSnUjLPtpART4G9snQq0jX2C7JCEg/3J5wyajHEAv60JLhEjOQlCZ4lPnBtuW9cUAhElleOaLFNCV+lY

kFbVn8GWMlEOmMybhiE5oLkJkmSkB7noWluJQtxgyo/CXdhWQFaqk1Sn1Ug1TCsSNUY1Td4pNU01SzVPDaGoVUOScl3pkWCL5wq6mfmQaF8eUyBYnlryAtersAdXofVCvAhHx7Ipdshjol9MmebJ7K4BJwN2wLsGseR1mWhi9xWMWS2Zipe8EHiFd88QCgUCOAqkAhOeBV9rTaeMew5NnNkjBs+4TcCAuo27D3ZpAF/eyqWG9MdGifpqRifCTO9i

6S26AYUoMSUAV1bKyFRJXshdPlpJVgoeSV7uWUlRDpcclTcR8qa8B29oWlU0jr+rWGOdBJMrTkKZWGWaIFovA/iO9WfcUKVXyV9xXKVYKVgLnCcBaFhHwXcZbAYgAqOrKV2PrglgGQLiLiZTYeCiAAlcYFQJU+hVZeI4D4AHBOxkDLZQ/5mIYiWCXQPnAjyLFwnYXzQGiaZdgwdHv0aJmCab2AF0xScATivUa42MYgS2w68vxqO7CxVUSihJWT5d

yuSVUhZSlVAZXppesV0sX1ltFlFRoYCLEQ9SEaaknBP9ktCPNI+cKU2bbkn9TGVLu2seU1VeLJRoX1VTjyC8C2It6SmuCyQGR8PAARYHe2DoVylU4iBNSEfDhaGAwD+odZotnl5csZNjohWXjF/oDkQMTB4JbK5dNVEpmhBG5W5iAlhDBsBmkU/gtAg0lsqMhsTggdceEE++6wGg6V+JXoLvFVF1V6Kc7l11XTKf451FX8pagFd8ShlS+RwgokKX

lVwHyzzvEy4EgyCnw+v1WMYjQkmmAqpYpVoNW7zmIAuwDjouJwB2wXtsYiPXqt9jTxLiJwgCEAhHwF9ATog1VqlRDJGpVM+ieA/oBjvKY4CNTTRWTVOvKBGungHpDPou4Fy1XErvP6BtSnhYS+/nTYlZ0pgr4BydPubKUBZaRV1CUppcMlD9lrFRxOillAKaLV55lQomQMdGX7Fcs+zJVN0lMmCtXdHmzgN3Ax5ZIFwNV6IkpVzV6wxmwyGeUzAD

K0rIA8VKU0ErQaBWpVW2S0nj/u+CQW1TjVOx7/xao54nChNueIv6ik1br2oQQrQLBs+Wj+0uiaw0COnG0c24R3oJdAPda4IrMlbNV4lYRVrKX25eylkkVBZSSVfNWdqQLVoyVC1akFZilZVaFUFCSQmaWqBXatjszGI56cVWllaZWhnrnVytVZlbNZtVWM2S7YBAy0BQTUUkBz0iX0S0A2HpJY19AO2i4ikWCHaEIyQNqggcqV5lXgySsZeNXsRs

+AcACNAO2g40VPRYvZDeyYOlnQedDFdLzyy7wHaKYmqRCfxPOmS/bM8uyotWTQGt0cCdDxWHuwkghmyvhl/2mEZWRVexEUVXdFgtUe5T7pHtLe5TU4rgqOFqa65aWfVZVGfdwrgWNZ4eXsZTnVvpAgPIqxDDnU9Dr5GzCuQgkctllJ2fs8wrjiNVgKFkFOWSdp9eB70F244Iil+tg2smXFmfJliPnAriClojUxPHc4EjW4bihaIcUH+WHFvo4P6n

xVQ1SCVeNUIlUzVHNUujlpWdNaxlI8JNx2L2iy1ICg4vTT5OXYcv7bvNbqPeW+kciinmXcasdc2mrKNej4Y9LuOU2pCaVjKeTJQ3HSRevVKmm8pZl2NFU+6YspzCUZIVEiEZVDbJjYRE4aWU2O4GI8JSnwpoXn1aslLimnJeNaNNXVVdzxDaX1BTk5zaWjZkMAHrSuyjsmE9QWTIXm5SlaoGcAWUyDgMISfjXNEgE1VbSqpjnwjISqwAdMpdgR8L

2VG5UbpUMFXdQGJXuVZwWHlSBFYLpjSAiAtaQkaJjpKGkrNbBlVsDX2HlmbxZOJWulGTV3qbolDACAVcBVoFWGJeFFizWnOnfUuLG0hHnw3zShEN+mu7w8bPFFjzWdHA+lKSXJJR1FRGldRYORX6VZJQNF+EW/lbjF7EYdsESA8UDqMT76XF7imbr21TLg+TKa89QA+jMQoOzYFL3ImCjuBczumOTo+FomRnQL9mvyuaZX4GBI8uSG6f5lSNkR1a

vV8TU8fq7lqVXJNdvVHF7UYJcAUqmJ1QxVqsCFEBvl2MwE5IJscwADgHL+pVWdxQqlxMoYKKxgNQULBMTOt7l60Ml5qFYHdtbEJAlHnHSkGbK5wGICqKCaUXysnOGwkbQJ6IJYmPecsjBD0a5QMrlAvpxy85jTrLdR0rA4AOeAZdnhVvo1lMpq0Eq17kCH5FR5S8VFMuK1lfmSta1Q0rU+8oPx8rVHLh7OSejKtWBAqrX4wuq1pYwApNX4olyDwO

SI04JQjFehCvyG/CasprVkSRa1KAFWteI14eSwUHa1jcpkKA/ks75J8MRoGJBvlOsuIKktaXYVF+naNbt+rd5TeW61E4LEnDK15MIG8ROkvrUZtSq1EdEPzJ5QXOFxpGG1qRiEgJG1BTbUTDG1GN7KKCa1+bhHnG4ASbVSRCm1lvx2XLa1pn6ZtY61jRUbTvyZ1tVq6v6ALEAngKcgL+pHuQoGWzJpxYWaPwjclTMQ7Vo2OfbkDuQclFZMeHRraB

CICEWcOstBknjPYhvg+RRJxWS1JFXFhVQ1pY7R1RXFFJX3VeMl/an0VfsBQ1IdnleZTyTp1TQup6DVMjLUJAVlVRy5AjWv7NllhPxwoCj59+jTMe3+XrWCLL2kMPQRALI5SMDIbuiguHk8oDRAMGRmPL6MulDDDmPouKClvg+KGEY0TAiYCrUJJBgw7fy7GkiwZzDToZpQizgD+Dth5ij7Uarx5rXIAYeyi4Amvk8YHhE3PP3A+6SAwXB1WbU7gY

h1dTHIdXK1qHXR/lkACgCYdSVQ02G4dewJBHUcdcR1BQ6gjOR15OrYmFR1jIg0dVOkdHVmggx1a/zMdUPR+Wnb3px1HfHcdRikfHXXvgJ1OQ5CdbnAInUOcrm1kljWwAW1GvTCOQjlbsVyZR7FCmU6NZgEYnUIdbXMUnV1Aih1tkJydRh1MXRKdTh12ySqdW6k2ACEdfnRDw7m0dp1M6q4toFhR5ysiAZ1TQYyoPR1abCMda8CuN7mdWx1lnXEdV

x1YgA8dR8YdnXwWiQwjnVJuBlIhKD4WewpDhm9RdcVKDRloYQASwDwmPpA6QV9mWlZZRx6gIbpTKl69NDs2akYFCZoslhaIOT+fe4ehgOSi6jBLH0oVanR4Fogj4hAGgu2HNXrEf8h4dUvtZHVORrJVfzVpGWBlSk1qAWnlHvVPIYnFgNggHXKcA20xNg7utw1rGWVpRHlaJB4lDB13GWkkMJQzPxmKFtEVHnJvl91Pi7JFeJ1pSGfJU3Wb+CNtM

+IhmRIWbQOiOVmGdfFiEk75EkqGFzfdUD1f3VNma11ocWcKeHFauokgBXsLEDKAMoAoIEDdYt6fQg+ToIgGHABRjBls3gYFKw0n0BtCE5liMjo0ocQRGIwdBhleUBhFn6Q9ETiIgvi5DXzFZQ1+3XA6ZXBm9VkZUGV8ykfQFDpA2AboIKOevLpegsl2ES/iHpZ/LWCJdWl0HUitR91bao3xID144JQHIB5J3yoHIJlgGqa9fkY2vWEpLr1RRVyNY

3hTDhg9SmQAm4oKvbKLsWFmb51mjX+dWW1UKmNNgiqRvU/dWXAOvVCyHr1acAwJE1JijmLtdLlrRXsRoSoI4BkObtWOxmBscO6ofCYKCXQzdiEmp0mVPVt2NbKM0CaVK0WetlP2EvAp6BcEqMsnsk1ca22hlTiEpg2W3XWRtfiXpXksa7p5FWHdRvVx3V3VXHV20lYfpMljwDHaJYI75FNjshs5jQUTv0IJTXslWU1vYVvdWr1H0GT3HCKBMLjfB

HMuSZT9R1QeKAHlhIC8/At1lp8FcA9eW7uY/WZgutQ0/VT9fUwc/UUcVp8Mgr4VgBZevnueXJibnXo4ObKo8h+gQ3ZN44iOfEp5hniOYF1uIjFiuP1ZEyb9bkm2/VERvP1e/Ux4Af1K/UtdUIOmPUAhdj1nWr0AEQyJ4CVALPo1y7E9ZiG8fXwUgYZ9R5iDKycbKlQGuZ6uqD+1Y6AE+5uTphwDdj+7MfZ3qLW5Z9O8MiIdmX1lD7iWTBitIBbsA

NVVfWmoWvV1LVklbdVsdVCrvDWNsC1HsfivfXsyb4FSh6jEskxj3UCJfApgrUXAMK1fR4F1eZZnLCbnPfkO4E7OLGh1qkXOPfoegCFWCyKdbU70Rz5/cD+tSVlW+HzpIxkhOp3fM/oH6FJ6Uq5x+QkYdCM4ZyFuFyJig3vZc/+rVYMuHigJfzMpK1cdAoKir21S4LgepigczAirCQsdmyBsOoAm1HA9Y4BUg3mFf12MtDyDcveXrWPZU21GUmwHG

vhCyxaDYgCOg01PL3pE7nVeZl1+qTGDWlc4HohDSGgpgF2XI4UXZjWDZPotg0cSR5QDg0DNlVyzg3TiEYCncx5wB4NooBeDasOTMYrplzy42qB1d51NhXACe7F1rGu9bfFmnE+DZdEfg3kFdiYcg25qAoN6Q0D2TO1H/Gw3gQRmg2o5jENtFC6DS8JnFAJDbH5SQ2VJCkNjBhErOkNiFCUytkNC7I2DSHeBQ3cSTqkMrkVguYorg2WPHTWVQ3gQJ

IA87XzyeVaNGkorpDkUAAIFIIpgPFFdMXaq9zERBAEV9Djdb+IvKoy+lJU3zRnaMEQigy3WgXgetT3yQZ4hLXTCCZGqFTulSylnpUT5bop/P5XVbQNN1XC9Sd19LVCftDgvJ4t9YdAELrxEKa6HXG1hoCIM5B8mD9Fe+UD9drFQ/VCNSINpTBHgPgVzbx1MIQEAPZO8fs8Zohi6B/x27Hy0f6AaIJoZAdQVki1mNygKfimUH+kPvItslAcKbq0jX

K49I0zqkh4LZjMjQth9ABsjUSsHI3CityN/TwVIMIsuLz9DcKNJCxijSf1UPjudef1hbXnxamsxbVtDWI5O35u9fBCEo2OfnZE0o3/LNyAco2QZAqNFuHKjUsEqo2lVnyNvxi/6LIN2o101rqNe/lS6aY1WPXmNR/abACVAFN6G9ZHgFle8DW7TDN4MDzl8ApANpIEhezAoHYOtKkSTZ4ToFZMbwCg8MI+bpAxZEE1w+XkJJGlkIgYiPGV/MUAIV

2BpyorWuQN0dBHyqEJQqnLFYUZqI0N9YwNTfWvKk9VtjZtpa4IqCEWJP0pMq6HdPNmfLVh5amVHJVX1ar1Qg3yVdSN0zydUUGym3K1UEkV+YmaMHvo6qqm9SxAR/XLBNCMV8zMpLp5LUQlMW3RHdFMADHMhEbQ6mL5J14xgQGwDLiNAL0YyugRihHxxRXhFXzxSw3jUBQJM1CW6J/4utAzJFH+0hjfRODRaegRsK5AMsKN/n6C04DygkT8NbU0oG

y41Q1jmN1lToLMHNeN+xioUM9+PGEalmkw3g2siAxyG5hEoYuNjlDLjdUGq43rje7+W42tJDuNtXgdMfuNas6mYRFqJ40kTWeNCZhbDT0Y9Zi3jSQVpazhVk+NcFAvjS5Ab41BmP2ckIB26D+N0IJ/jRW+dTAOrOXMjTDViaMx0rUQTZ4N0E2PZXBNT7GxskhN1QJFGLoQjHVyYt7sVTIuCrHwTEXmsTBGPnW2FWaNwakWjZ0NWdEzjRhN4sIiTN

hNWQC4TceC+E1bUBuN1HpyLNuN1IKySux1KokUTbfMVkgfuDRN58bnjd8wl43XjTnoARQ1FQ+NToJsTTnAHE3MMHsY741qAAw6fE01zL+NP773voBN2AFxKFag4k1D/OBNSaCQTZAYaAAwTTwOck0DtbfxNX4OlqlAqk0BjSY1mmW3DWrqgwCzXAuJ7yzsPlANEpkJEOfKJRBIdFOZTjjToD44y1JI+IGQ84FeOJGQCcUzlTkSCUU4lfU48Ng4RP

Ro1kp6WcQN1ICeMQwgJeUUNV5MFA11jbkZSxUkZUkF/xnkZTaZxwBQ6Uxmfqg4cOu22ll2RdPCn/Y8NSON5I0H5enwV9KitUF1GbC3zFq+RigBQGXZTZiXhtqqqLIY4fOkgbWYmHB5uwInDtPRyFCsiE8IYolLMDURmrHXJKKMGTD3TUecOFCeiM9Ne1CvTbwV700EEV9Njph8AvUwoIz8UQDN3PjAzSmkY04chCmoesBkqStw/yWiOYZNN8WI9V

wGNySQzd9CMM1PTSgBL00YRmYqSM1VoSjNAHhozZlJ/02MiEDN4RHXeX/1uME3DUORnWr1wBEexKgagBkA0fWNTY4FKOzDSKnQYzjC+I0IqcSMhKIKmdz+nvjkYRafiOxgfCDwlp7JZMDdtgUia2iBcJE1ryqnbjWNW7DelQ2N601UVVvV9DXbTQjJHY2zLkPaLnocta0sBVVzzpNA/XRbSNnVY43UFH/BE9m9TiUOCDZdRASgy5i4GP4wEsoUeB

LoLACdMXGZj5ABzTNhwc3WQKHN1gDhzbkMkc118n8p9KWhWIimVBYkzbf18PWsmRTNy05xzSNWCc08DmHNp4I1qCIA6c3o9f/1QY2OGUz6IGX1wIgeNGCUWTGNLnAJeHDs/pCJLBcBFnpT1BN4FpxdjMXglBlrFG/gikCw0uiIpmQneh9MYzgdOOv6M03sGdE1nxlEZWF6tfWJNaHKn7WN9ceZ01TV0gji2kh5NespU6lzzuDGRNg8DVxVl9WCyb

ih6vXTPFSyYW43zePqu+ZN2BE0XPVw5Vf1Aan6TX517Q0o5Q/1183YuS6x4zZusVLlMzZtSZ1qwkYgUBQAmUCEnGTuxOCu1eqmgLLjddfQP9wQiGLwxxDaTcXEIPDSeKKcEJlcaXGiAZAKYu8e60gGBssuo+Uibjmxi82BZcSVvpWrzfuZ681pVV+1YvV2mTSVE5pecKXYvLomnDtun1WJYs3lffVkjVWlecmXzSP1PbGfMNx1YMHVADAAPIDG7K

Gg1nnaKlSyxLY5vmwCNXiigAigpEw5vqH+gM0cAEEc53wIIHIAVgD5iVp1174kLA9kbPzNdphAIgCcUNZ1VXVOgiDhZHX6Lduxj2XWtf5hFlDJgMwAW3JJFZSRNj6VfDwO0lx5fKzNZcBIeE11doDE0MJENphVggi85jCQEWCMmeF5vCasB3L/MPhQM9EJfhYtdEm9qsQAwfj5nGFuwPbCLVW4oi3iLQYAki3KedItH4m1uLquYHgKLQQA9LhUoC

eWai0aLepCWi1TULot1i2ywi21Ri3F+CYt3hSVdWO1Hxh6LfVRoVZ2LeI1djDUUC4tRKFuLZFxHi0MtvVR3i0ttY110IwuTcEtBBUWcSBhAfiIAMTeRXnscrEtB1GJtdV1iwLJLaktwlByYkFSzuI58PXEv9y5zVzp+c0daaINQi1VdSItYi1kALktHWURubQqMi1FLfUwNlClLUotFS0u0avQ1S1jqLUtOi2qSV0tlLhH0YqgzS0xuZHNZi0jtT

Z1PA5WLRTRNi09LczlYjWTtf0tZk2uLeCRjgCjLcuyWwI+LUBk2aTTLUTpsy2JvIeh4S0igJEtv/7RLYq4ATDrLaO1my0lUNstTABpLeVNGmUCzYANIY3sRpUA/oAagPEA6rn1wGBVks0SwGw0EwHNUqXQApqYTnDciDrtWv2A0VL0Hknw1AztdMnQbPUHbiE4tZULsJpa0fBPtWQNtY2UDdae1A1UtWsBslm0taH2ovUSqV30ALKOnMIgN9XTzq

hU2UqG6b0Ip80X1aONF82hoQItnLBn/IuYES3E3mgAeUQ1UZuWC/hMBKSI+1EgUchQfm4cAuOJEwBT+dV8rEKrzF5pzwlFJIfoFNbmSYVNc4a8iSwJwnWW6CFEc+giYeoBgbmfLcJAOS3pAEOcpah4APygtAE5QVBBfqQ3LRIt7tEDMNKA57gtmHnoxIiViKmwp3xxQJNQH6FkZO92YS1J/LtEqQYeARVQvSRW8QswYK0F6GzCkK1ZfnisB6woKf

ihBxh2Ldi8io24AJgpwFAoKXzCaZmNus9kg8BWULtQpcCYKagAi61hVqxC9SRl2f6ACgBVwJgpGAEVUGfeb5j5TURA7gH8MZZgDNApJCa+ZRVyuI8sguXnCd/lO3yVYT4uRbKE0H7h46pLLb3opeHSGHoNhYJRiX7gMnpctigVxxhura7eHq0sBOoVWtA+rUv4/q3xnH5udaiYich5eRXHGMwJtlBRrXfpxST0Nj8tza0tiXWCFmCYWBSgIuGEgO

mtMALhzNCMecB+pOsQFa20XAWtMUDFwMWtkEE2fmWtua1PQksM1a08/FcwnAD1raSIja0yMC2tNTxtrUN2Ha3rQl2tPQYgfn2tcaStLe/ARbIzfCOtR35jrWgAE639VrutjpbFPLOtW607rQGgDbrnrmut8cybrdutReQz+CEw+60oAYetx62nrULeMJiXrUKAaABjgHxwd63R+A+tKuhPrVW+L61F6HlN6tbnArKAX63CdT4uv628YQBtPelzDf

+kIG1J2CPADpr/EuhUD9jZEJog5FrNDY71783O9Z/NDhXfzcgwEG226FBtBAAwbReuiXk++L6tXYLEdQGtfW6obfOoYa1kQsCw2G2ZadGtm6SxrfLW8a1GtcooSa2kbamtusSUbWz8JnlLYTONOa23LXmtjG1/rkWtpXwFPOxt1yTlrbktla2BADxtY6h8bTxGOojwsE2tBgAGtqJtaCx3DBJt6EbZpN2tMm2I6gCk8m1DrUptiS2jrT6s6m1Trf

Ct2m1BoLptS611mYZthIDrrVJQN227rRZtIEAHrUetJ609/uetZDAObdetzm0O2K5tMK1MYfoVlvmA5QoVjGThVh+tAW12GM51wW2xzH+tYW0NbYKkxTwdXNFtcYR8zTClTK3tdUANH9qEQTwALaCuQAjJvK2/WV+IRCL8okp4ag6FeED4C/SmaAdSaA0MOmgiKPi5wrza6/qwGmvmJHDDAapqtVkelWJZBDqmzZqtoCHarTX1CTXULSHqDA2rnt

tNylkstfsB0qigPCfpNLRqWdZoKeBnsPaRw41o6cQ5LaD0WLMAzAAwAJlAtngSVewFwfo4Mn0qY4C9uvlRSsEG7Rg5PFW5ZESApAAMKCeAnICK7pbtxyU/ES6Rt9X9xZn6J4kriRucjIgWRN+oWtCRglwCVojr6D1WulaW+KHowCBwaDYcHFY7rEjQR5ziMGCtloIbgqCwPa2fMG5JVehXLVW4ZaD3LSEwZvkJmcFEdwwZ/tUYQbJcFbkMLfGSeR

yNqLhI1DFN6YwHuZ1yNw6DmHGkNkk+7bXRHzxYchWymgJYADZuUADy6EykZXnBRI5Cmf6XCcOydy5vhvH+jfGPrSzQ/4mPghMCZHHkLAS4stnJKBnt00RZLVNtd0T3ZQF5QHG1QjSgQQ3KKN8J1wpnuNMY8AJFsltEAZjCUCEi6RGMiPpAWsLzmIWtZoG2KP6+ebI93rOt3JmP/Gd89cCBPDmt39HVSUEA8bxHRKQAgVEWsI88caRx8iZ1ipiiUL

4AfNyf+EVWzQzZrvT8u/HbodIYrIh+7YocCgSB7ZuCrIgh7TpWHAB9VkCMEEFR7dUChLyYrHHtuczybUntN+3RsKntBWRL7ZktYlDZ7RvtCXkVmcF5RKwRYTAVRehoCZSAyJgJTW5xVe3OADXt1Ex17dBy8oJN7ZCJp4xenJhyDvLNdp3tmADd7b3tGLjipFIdWYkj7XSkn/gnfNxJD0LbjkJJv9opYe8JPf6L7bQqtB27/mvteS0ZubZ5W+1iiD

vtgw3zmBpEgYqH7QTCHAAn7WXAZ+20qunhV+0UHTJJzG3TUA/tcOEScs/tFuEL6JCJH+0BvF/twGE/7f5huLaUUAAdnIiz0jSgIB19hIV1ZAJEZKjtYVDQHSa+s77+qhG0QkjSVE2e0mUc6Tf1py0smectD8Re7QgdPu3IHdlx2+11CVYd0bCYHYOYoe04HQWMEe29iVaghB1HnMQdboDx7QOtpi3kHRWoKe0gftQdBh2Z7XQdHkmmHa75+e3MHW

SY6E2l7c3xnB3EGNwdTkK8HfwdO+GCHQxCwh2atc3tjQziHaNyXjBSHS+CXe0UgD3tfe3/0RexxfjAzX8O34A+taodE+0ebVPtWh2z7bod/R3Hstoqhh2WGMYdOe10rZvtFR0WHVLWvR177XzEth0zUaysDh3jgs4dF+1pBiAR7h3MVs6Bx5yP7b4dsWGzrd2YgR2f7c7ooR2XiX/tkR2AHTEdvMQApKAdCR3RpMkdn5CpHde+Vw1ZKbvB0tmZgZ

gAygDEqG1A1ARQLXEQ87Di+qLwbgjreuGQQFKBDGpZn5F62UNmJdCLYFoUSjZr9qsWo0gk4Hfm0ni89VzVCI0UyZQtIu3o2Uk1Bq2nda7ZP1hnERfGn4hRVC/2Ql5uCFuQ3C2s8RdNndK/EdmVRcku2H+MZrkXRHnAbnmPCpCtdgUxzUvkRp2s+Tp5o1DAThstmFA0BlPyHNTbZDuwpdDQ9baOrQ0fzeaN5M36Gs1ANp1XhiadD5hH9eadiS2WnZ

ClCjnQpbSRWmX8ocf54cTPgA6GGoBVyOK01JW91RLACXi8qk9oG6BAtCyd2Y1sOFJUOOQjTZtFTbYF+pEmNPHLsGc2BUg7tCHARODWCBSB3O2wjfVZs+787StNixWtYo2NIOn19eLt/T5o6HsAuNn2zaOp3qi9CC6h3KLk/gee1BSSrRB1ArX/kYPBQNW3FarV/JUPFegAWKxXbItAxiILAIyA8uAt8I2pVyImHm5gWrR7IpudN3A7TfMZBZ42pZ

ZV3oXgaCg0CAAjgJgA+9TEqEnAxmVLXEQ0w0gF+oIglsgFRidJ0/a14OcWiSEE5PBAwTpixoSmCFRaFCz+l1y8EumFWVmhlPbK8828WudVEp1xNZMpVC0ynTQtdLU2zQqdcF6DnfsQMgxy+KIlBxyIdpKl6JDJ9hS5coVlAOQA9AA01FXAJEDRjc7tLUqysW9Bbu1OrcUd+m0x2YtR8Ljq6IpypHVmteGd8HWJ7Q+Gj74cAgwVEO3DaXTW1B1wHZ

Bkp4x8rBxdraGXMOYtSbViUGQdAl1Vvqoowl1vrVykJCziXQnynFlRMcS1LO0vzQ5B1/V6Td6d6W2+nQj1/p12aZwCudnsXXFQDzAVsvJd1XVdHd4Uyl1ZvqpdHfnqXVxRml1KTBjtMZ1mNck+nWovXpcAlQAUMFXI4JXuGtN457VTkETgKh4Tai7Kv6I8WJ3YL9QtHM8ATRoYUliWgGK0NFjYhU4x0B9FvSW4UhX18I3mzdwZB3XSnTylaF1yne

iNPlR7ADC1WxUy2EL4uxT/7NyWqQlcyYhSGFJezQ6tAFH6nZclChhRmHK4L+hbRACt8RgRbeig/THmQOGYgMG9Xbeowk0ORA0tyTBJ6SNdTohjXSjAey3o0u1MYNi88F5VRbWXxa1pd/VGTYXNbs6TXWCwMsKiTaW+8pbDXbT5S11nkjXN/M2pLompofUQhSCxp4BS3n1JhB69FezA96CjNK7KQpz/7MAu/CTQlmOmtJydHJN4IYZD8qkSsfDsEh

GGClh12Nkd0njPogU1xC2AIYjZtJqtnUVdpplR1TQ1dCV0NelVRq3RjYwtClrK1CIIo50NojGVCyWnQJXYwSykXcbt6AAUXVRdNF1HJfRdWoXM3HqdVTVdGYuddVWKogciyRat9nOiMYgm4ErAKjql4AIBS2QS+HDVrti/1W6FBgXY1bal6pVV5e2ZLFi03bjdMCViIezAMXg2OYK6Pob9KT+dkPhaZCzGrIRolhuEAEioPCTkt3UFbGTA7BLE1g

viGtTk/jNN8aUEZUtNtY2o3T45b7UY3SMlIvXynQy1ksDCoTo0OaWOIUZoQ1iaDOgh2MyawcHp6FJ79P6eSvV8DbOdgSF02RRENTUWRZ6RlKYG3dYxBOjG3dEZV6Xm3UU+oARmJpM1nkUjpd5F6AC3nfedJ4CPnTA5U6UHhQeVR6WTlXhmSqF5wnfw4VJXpSLiQpwLUpdAH2YAaYc1FZH3qd3yZ4hPXbjaY5UV3bOlpUWmJS3WO4TxGUjktOK8lM

TYa8g0JJgI+myfNR1FT5VfNW+laSUfpRkl9c1q6prtPfo67XrtDjVENPMhkkA1mpuw1QU1zlv0AwhKeEtqRp7yDHDsDrQJeDJYr+zyrUYQMHRk6Fsy+/QKfHldBXDj5c2pKN1UDT6Vwu3IjUd1G030JZVdI3D42t7dmTW5pY2Aadx5JqfwhF00LhjMctj9xtOdyvV8LY6tdaV6xXHdwpJSJRUm1KFXQTfdcu3T2nJSj92+kuj4UYhZJhsFopT9Bc

OlxzWjpaLgePKaAHAADGnEoful76ltOQPdJiUwCK2R5eb7NZsFziXrpa4lm6USAHjtBO1RAGYJTD0LNZXdR5UzNDi1z9QI2PyowOqSPU6ZC/Yo5CngIzmmkS1Fj5X4aWhFWLq/Ne+lFETfpYNFoIV/pavd7dXsRhqApu3aqc+A/XWupe3NNaIJLLoWCOLItbrAIDy7tLpI9WRaIAc2PRw+dP9i/RFa5FWdhdCrOfkUF5BDSJTFWPF1WXGlH92LzV

/dWq0/3ejdKF1lXWLtG82tjVvN7D7KRcaRDiGqPUZorDizgSw6lumfVflS1vrtXfrBTF2oPSP16D3JRgWVid1s/tFwb5ToduVZ/sb+PROwRZ3BPTndlD06JdQ994C0kDAAswAgmaI9M6UwaWw90FQcPXeVBzVPhf2V0zXbIII9hO2XNQElTZFV3Wc6c6D70LKSBbVmJksFB0wfXt24PcgcYHPd6j1yEARpWyEOBbi6K93biHo9wLUmCB+Va92dai

DSlAX0PbgAPK1TkYT++uClxGwWjs1y/tP26cSz4k0htaStlZiVanBQ+KfE6LHCugQ+nc3bhFPsSil0/m/dJA187RqtbZ3LzY4Ols1z5Qk9Eu0Kne7ZeN0RMnr07RwqWOzJG0gBDOD1uhKU3XJ0EgAb3drtuu367eqBIbpdTkzdRT2iyWquFCEYtj/pZrXd7WBVYM01iTkC6zz7HR98qw6lmgjwFcbmIO8eJy1XxYUdZZllAMy973lnfGy9cUBBWX

/Fd13ALR/a7T0rwJ09JNV3Pe3NatzkItcmZwCktYA8VBThFugI97ZIZTyuW/TCtcTkC9RCSGCN8zKz9MC9PCTqWGC9CN2VjfBdtF6RPYLt0T3O3bE9s+Wyne4Ohq3bTaJ+0u0RMroypiBfXo04TR4SgdbyeOiK9Wrt4QzEOaY9cVDmPRbtpL3kMuS9up2UvV1d1L1YfPttOxgMvWVEFHUApGK9YFU1aYhsfVpcvY9QduLJ6vDBJo3bXSW1u11+nU

uKGb2pvQcdYFUS5XE+gY2VTcGN/l0f2t2g8wBVwO00KjJsfrC1GZ3CKQWmwuLsaNy57Lp91rvWC/TwoZtVWfCM7Vb6ohLP1PfdsthBokxSAAWLsJXYIT087btqYm7BCfa9CmlC7TE9pV0uveVdbr3u3RiNoyqv2Rd19Dr2TFi+7MnbZEnKxEQBSFqdzim8LYxd/C0XJUm94M3HeT4Uc5yFpJuMg10izOHhAPnVrtjlC6xMdWJQjACJ4WR43Bx8jO

tQZp2bGKddk1G3rZcwztFx8iYYg5iZ6aa8kShAsMm2bDkKGM7oIH1gApW4YlBfvbNdSizZ+L+9PTD/vZ2uQOWc+aosOH1+QHh97owEffadx6EwfS5t8H2OAYh9dQIofQwcGKoDeOkdbRx3SWOmB4T+niltyFln6cyZPeHDyUF1b72gfbR9EH3fvaIEJH3gWKEtNj4UfUB9kn24fWZI35z6uVB9QO1nUMx9QbbNCmoESH2BFWawFi7ofd8xkZ0o8v

URbXVSvcgZKDS27fbtju073XWeU0D7ZkZUrkyWrRq9kPgfYhU0Xizjvc/yPjifEkL4R2hR8OFVIxIISEp2ukjxBEbNkL3LTY7dpcWWzUNgrkYHvUA9v0h7AM5VKT0+3ek9TsCF8AKEVyZsNW3BCTHAtriGA8h3vWcVOp2ioszdQ8Gx3eZFGD3lPTvmNko+SPvQbUbOEtomx1z75gXwfnBwxJs9+WYHJj4KgX1cWfSmUyq7XEAo5UXSbM09oz18PX

ZgEz3CPX3dh6WsPcelVSHTPtFkyZA50HSZwvAELY8UC5obxJU5wz1TNRN92yAUABwARiJjALFAIq49PVc14j1LNWc6eNiBEhNAk9T+yaaUuNI9yBeZrWBbPS+Vz6WL3do9y93/Ne11xz0/lac9KH7byrgAo1QuGZgAScALTTH1PRG4bLu04ThVtCkx7LpqWFgSCZZ1HvLVaJYfXUzt072hEHL6pxRraFVFxlTNLHBdqC4bvVC9sX3JpU69u73+lc

2NPZ0nQX2dv83YXYtwkcYaWIS58eBFBWQk51pslTwtL3U3AQm9KhmcsH8KKaEOndfkX+V5wPod5cBpvg25K4wTLd8JSHXxnBWMAOHQfde+oM10jLLZVzA/MFrQgv0WgsD2Tx1i/dl5kG2sQhPo8n3S/Wnosv3rQo8KJr41ETm9iyW8fUDi2R0V0Hy9O11nLYK9vqB8/SlpAv28TC9Cmv3JKNr9FcygsDL8Bv1hdUb9m+Ry/dp9NRF1vZZ9AA3Y7S

ytffYHfUd9J33hXWpg5CI7sIjsZ4QavZrZFWIDkjBAIxG7em24lUbE4F0cOtSCnVWk00gL4qKd4L1CxWQtFLUULchd5P2UVfC9tC2bzUE5ewDoBSi9T/KiFr/q/uWACcHpsN2saHi9cAboAHZ9J4AO7aQATu0xvZqFUlVi0szdHu0woMmyy+335GDBi4a5gKv10/02dXP9ghg4bvI12aBFElVFhcQWjh6d/qkaNS3ZWjVfzeW1WdFL/RYtK/0GKH

AZCK4NvVjt1n0T2Z11mUAg5ESA0VmQDa9dWIWR1PSd4LrNOC+IMpEU/uGQZt30gDF4hulcadaVfdjTFmcAgNrNxckZ4dyzeKOKCNjsLeWN7jFzFSbNxP3f3RbN4sXUNa96df2JPQ39/IVevUl6tZq0kFCZ2L4SgdfixZElfar+ZX0xRtz9lX2DHmzdD9WvQOq0LfCogPgkVbRGdN5wSsBHoCCi4rQ6ov/uyIBF9E8ALdXS3VbVst1q6nAAsMlCRo

GWIY6KvcXYYRYuklh0HmDJLMu86Ijnyu0cGeBbZNOZWD6/HDUWJQV6eNqZUX3VjSgDUT1oA6mlExAJfeyO43FeBnsAIZXpNT1ZrMEGyuzJ1ITR1IjIFZ0FPTD6q14LcTz9pTBrJDb8qenv5ErWK2RDJOCYUkIUyNwySSTeA0MkJrjBAwP63DLf/DoIAbDrlnZWoQPLjGVE4QNrJL4DSEz+A4UwgQOEoFEDoQOapDb8kQNAGXkD1MJxA0lWECAV6U

kDIKiWFXb9Zb0O/V7FFoCoSoEDKXEZAyHWAQNpAzkDRQMxA0MkBQM0vLkDXQP36O3k8QNEghUD3DLJA9ddmO23XS0V0r2dQc+A51R8fD+QELEF+q/gtgiTIC6hRRS+OB4EvShbMjnNaJbE5K0m7VrpXaxavGrxGi2apf1VjZQlK9WV/RgD1f20NdbN2N3bTXA1zf28mr82TqHx9jCZBX1rkBTaM72uA9K+z2JGjc+9e5raALbVGIreXFbwFj4ysq

KMcG7MyNTI9HH+7hgKlQIErWDtyjCiYRwAXKpIfXfo1xh1AiRcGLApugiqwIO1iqCDaj5+vkUC2ZwbPLCDEfwHsgiDrCqv6cp9RQJog3+BcYDt/tiDuTAOmj+aTpqs6tU0NQMGTfYV9/XH/Xlq+IP+gISD4IPLjVCDZIMS6Nwwn45VuCEtM2W0gxJC9IMiQYyDWIPpXDiDEr1WfVMDNn2BIo0AHbBQAEy5QgD0AGmd0gNCCgiAvRwOxaw0EvA+pV

DBfD7xHow6bIQTeG6QNxkGBn82rc6nRRWNgsW23YtN1RAxfagDxV2dnUL1yF2JfeMuh71VXQghp70OzWjs0+QYyqxVaQnvusV07P3anQ+9YtKlNLGFN02lMNnAYsiaAFqKy2VgzWmDNECZg9UDW135Hfy9Yn1X6SygOYMZg30K4uWB9dGdY9nGPX32nfJSZEnAmIpTVa/9u0zPAECihxk45PglDG6yxnbiSTHGFNNJEPhRUprkXUhn2OBdhdChWD

Ro3rTxHi6QOT0IA9d6xFXqrV6DRgM+g/F9rr2Bg8l9fZ2yxXT9DSxXSvmF7wMkYp2FkqVXJiraLGW8DZHpCqU1dkDu7u2F1ZbaS51g1RgA8PjidGV2BNQzAIQMucDN2AciH0D9evwD71T/7Nogrc0i2WXlmMUyMtjFsZ35JQeIWS6EAMMABKiDAAyx6Z2LyHh0aPGbvNhoHtqXaSImqdDXSnQhtTLhBJJ4yZbwUimQRp6tzh6GbDxsaMfwJfrMpa

6Di9UxXi2dhgMOvcYD77XL4GYDzD7RySb6ewA1xU8Dz1XJqLWpB037zbeZetSviHXUPwOxBmyo0LQq1ffVIx53oIfOKnCPntJDYnAicFrkcuDtTBgMLmCsgNnliwBz0oIDl53DVdedgSLnVIQAVZ4QIkM+EP2wIrN4S8BzSE20MHwXTugoZdh/iJNJ1aSx3HIh3qgCdJ/ELc420NbqAdjOEsfwdjjzSau9RHYbEeKdJP3YkiYDlP0Ivb2dYti7Tk

jWz0AWOZLVKclRgxRiJP4H0EJDc5IhLAu2ngPUCtuKKkLali6WbSoqggX8bxwciplDzpaZ4cqWXCgF/HlD4+rL2edMaWyx4NQinp2zTtyDpbVH/ZaN48q9nFhQhUOKlsVDaiq5Q6qD4f3gNX32dcDXIIFixACPA8Tth0CW4oJI4LqtdP6eRRQ6oRCIwQTLflY5EaL75m6QeWzG2au86fCv+dJ4cMQug4gDgu7iRcvVV0WJVTQNuq2yRW7l6F33Aw

qdDLHbg7cQUeUnoIB1vplFBb8IEHY9/Qg5JDn0AGQ51Cg1XfYFZL0MXdrF8vRdsVONgGpfKV0ArerAwxFsFv1wlTeF13D8qF511hWpbSZdB/0u9U1Dxk15amDDPUN1zRH9zb3sRkYALaDEqMTk8QBfQ8ZDsSJdtinQkBqanev6M0PM8vsUAAWa2KEKetns7e2UskgYsVqhvYBTEt3IScV4lJbZoT1+Qzt15LV7dZS1v90nQzS19A2hQ9T94UNe5R

xD9DrqnlLw/p4H1rU9HC2BELMk5AP8sXd0lLmFYNg5uDn4OfTdBv6iBTWlgdVpQ4BqxPyt6kbDyDZT8uVi8tjSaeDIUEaGXQ7OKFmmXWTN5l2+mroA3ozow429zK1Yw332GsN4OclZjn1+3EBiCRB9ElrkAYZuqn6obRyBkisDyz7hBEUm8W0TpiZMoV4jCPOoJOTLqIpA7Ghy/jbd4T123Z6DDt3eg2jdebQ3A1Z8TEPVwcYpng57AEvlTDVRZH

w+xOTjnfRlqdW3mbj4mR3D9RWlvDXLzhlYesN6hYXqCoalPfmVqlKWplL6L93EymBJ7NqOUonDRjLKKeA62qZcPeQ9miXjOXt9W6Uz2ROlM30g9X0983131B7abdivNKYgafDfujKS0qVDZrsUHCat3euVud1UPfndEAA4w3jDxxBfQ6I9gEURRZd9q8PqWDnE2F4l4DSFZzpTQPomAYbX4NmRr31PpQvdPzX7PQOR+LoAtV+VFGlDRYY94EM9VK

Q55DmEw0rdbqXo2ByUN1IB2LhePqVWQYgiouLKWt+idQ2HaI2UFdjUIq9OIwhVCKp44DqbMTSl6cONqcbNNENLg3RDxV1tkPnDNgyFw8kFW00KndH110MqwC1MU3huIRrB1yGk3dMErXRzqbKBzcOMLq3DPpI1lWIlsoU1fT3DFSbMOA811+BBBbgjIOIEI4JZ7GjEIyo9mo7VOeN9ed1uJWOlmADzw7M5k6W9NDfD1zVwaRKmceDBxuYGxNiLpf

XYOMpf1GcZWhYrpWvUIz0zwxoj/D3oAANDz4BDQ3A1Z33TPcBFNzXc8JUySAgkPZoMosT2CH4jlYahWPxDWGn3lYklWLq/w6+ln32bOlc5DbC/faAjILVnPbWDIp70APFZyL7hHmBlNXGR8Mpw7Kh3UGg1Q2amJomN3l7Bhk8hKXA6xpllkcYsw5/Bs+I7cLIM5c6NnZRDYkX+QwhdgUMUdgUZXZ0APVjddC1GrYy9eAOhVISwNRY8sfhEmCjH1f

8qKlg+gS9DB4hGAPFAPaqJQHha2sOagYquRqnS8Capqz5SBktpd3zHAq+0xKBxqZh9WyNRafUw4cyOAHsjwCAHIwt+q7ziZd60kmVd9Xv9po0+nQ7DBc0WXfVUxyM7I5Zg5yPpnB6p4wO+XU29hMFYhODkc9KlYED9YGWrFqHd265n8NrljWBnVqCNo+z9KeEET+YZpnSQ2s1jAVhlh0aNI3hlZwNH+gdDjuWXVfAFLt0x1aLDsCHhQ3RVz5G0lT

4EQ2b59dPOkIjaRQI+wHwZ4E604Q5PdQIjgPBU3cUyR4BGANVULaChXcsj7LnVduhUwXDyHgbDRyNqmGFcaELAw68chyNYJNsjbhXwwpKjjlnGyNWaA4CLwjyc9yPGjUKYxl12w4jDGW28g81DitKyo98j8qN4rQH1UKUALcH1QC0ag2YFaH7doLHaoi1gZRdoC0iBqufG5FozEAfQ2PTwSG5MK3DdnlngqkbCphbpBY04IN5l58a+Ze0Zc4NE0q

QtmcNLza+1gvVouSFDWAOIvR7dmI2ZVbVdRmjLBWMiMTIrqOY0ecahBCjpZ02QdQJ2TrTrkHrA2WV/pFRRywZk5dko/mLywo5EzsNQXH8OdIDD6OXAekSAAB4ERkTMyI9QMwWi3ql5A349CZb8lzAjPILludl2VqrKqkCqQDfEvDA+RPIVkGStXE6pgQBAncX4HGB15JzQUVCjfLaNwPnalqUokdAdUG/1u6PE5EB10IATnP0UhkllDSx9EkFhrN

WMZgBmAJGcY60zrpUGD4ZDo8Y+1aNcBPf4Zy6gboDBZaMHjSFNVbhDoM+j8/U6AMT8y/jAVsusUHqto+2jVGj7aAvAbyUYsFo8rkIDo7lpSIPOpBXpo6Pjo6pAk6Mj8Q+xs6MRqQMwC6OXMEujhIyDAKuje8WkeUm6m6PAUNujB6OUY3ujIiZHo/4UtL28REG2wEEXoyQYV6Oubvusd6PlUIFBRn0/o7gAf6PtPKcu9VC7LZDlB+kVYkfpIDy08U

J9MPVO9TqjZl0vI0uKuRzBYOWjLE3Dab+jwNj/o3Wjh+QNoyBjRHpgY6PMEGMzBdBjuTCwY/2jOWmBadOjSGP3nWOjqGPoY77OmGPMVthj86PwAoujvPbAVkRjUo0bo/RCW6M/pNRjO6P7o7kmp+THo8K9ojBno0xjglCXowaIbGO3o7Gu96OngdxjkSS8Y2pj/GNPLoJj4MHyORZ9v8VqgyIDnWogVcTBjQC2Xi9d28mq5eDYCtih6aPI71YHtX

3YqGzYon0oOzFeOL6jqdD+o/SQgaORcFMSGGkrqeB11r2CxecD5f38w1cDJV1/3XX1PSN3A30j202PVYMjz1XVPd3StRo0pTaRe9BPQElDPcU1CBQuIqNt+J+joc55TfFjf6MUcToAR3iaY5iw3wBNozwA+kSAAK4E4GNTyE6Vt/Ddo1xRpjw1nHBjpmPTaXFjRejv6VZjN8RWYzZj5mNVuFhjYT6OY5IwlzD/AMuj+UBuY+ujpGOeY+RjwhE+Y1

RjfmNQ47Rg0qPXJGtjo7mVo6pjNaMeiNoAu2NAY6GgB2Oiekdjp2N6Y+dj92i38IZjObDGY3c48GNmY49jNKDPY2Ojr2Njo+9j5ONfYwOuP2OfwH9j+EyYsIRjjFDuYyDjp+heY32AkONmpBDjPmP76YV4omMw5fLtGqNumo8j9sM8g3tdFl0KY9XRjQYeaUjjjzy1o2jjfw6Y46BjJ2NnY6bZ/qpQgITjOYDE48X4g6MfY8OjlOOoY29jeQZTo3

Tj9mPfY0EATmPM4wDjbOOG1sDjdahkYxwADOG8475jfOPQ4x7jXb1pYx6OC7XNFVljH9plYAbor0ABwWBl5pJSxrpGvsna5aDsHbHBOASUCfaUaHUcJSIXAXtcg9a1I0Ygh4QqVL6Q1kEdKaQjHjkRPbRDW72OvTQjA2PFsfQjm03uvQqdCdU2Ay9uAbSISHpZ3KJho7WGFsjEygXJu+Xxgx20asPbIEeA+gCUXWwAxjitzXRdOsNbtm5wtJAWbq

apCcDi6MY8hNS/o+XAAGPejJPoxfyWYy9j8a4xMMvjVmOqQKeZdIyGQPf4YgD9VHPjC+M8gEvjI6Ob44uu6+N2VpvjbJEQwywQU7AS+CWVrz42w/v9SOWH/ZltfIOkkNPjq5AH47xj8+MaYyfjyGNn42vjIsgV6VfjrsM3/eqDd/3V5YuAHGAmIsMAEsOjQ7wAWPTo7MTkalxSqAgNmgySDK22SjYVNGyEJsifKue8AGK42Fnj1eYY4h6QO0NWDu

6DfPX23WbNOcNO3aXjQsN0DcGAFeOAPRhdSaOjKrvVqaNBWGcAy8CN42KBvzm1hnFs0lgOOR3j971d42RdhZQUABvJ+gCqQByAfKNxvUtis0jRZNjpRvGKPPFx7PbL426oVOOAE0G+xfxv3C9jVmPb40UydKrGPMlpb7E4BBoT+hOr4zoTSSB6E1oTY6PX47bFt1B34zDSxZ2SY16d2qMv40jDb+P6oyygxhOqE7xx6hOj6ZYTVONAE7oTONl2E1

vjYBOTAyH10wN99lVU+gCSAGu08UDPnRMqIfCh2M7WbcZucCKB0KOQ+O1Mk/aEgQaeL2hj9mUSwVhVPlbpx1wUYX9J5iVEDQvVcI0XA4dDU+VKac69FP3dncSjUKHhQ8y1tePK7jDcp1z4PXTxU7DrxMfw00izgxHd54OmbluQOGzp1JP9oqO1vKoon+O1qEjjEIwIpIIJj6McGLO5N5wscUGYSWMLEwlj2lAwsOaMKxNG44e46xPj6hBSV3AF8F

sy84FuE/VDTyNS4xW9JtJvI/S8WxPzE4t81aNLEwcTcPxHE2sTFBW+43PJpJ3vcTLlffYOBKcg9AD5HBQATf0IE3TVD4ihENgIcFSBEOiaxNhXXGfEi8K4Xrq9TXTWOIMIoZDYdh0prc4D1ReQiKZGMgn0pf2UE8gDlCPF40Kp9BNakXqtpgNrg+IeYsOpgHsAP7XkoxOaQSy9CFqgprrULjLV5PJG7n/6qOkznZZpLMFXFStjsNAvE9/jbxMiyD

+Q/VRrtEjQxKDsyH4TLGT9VAlxBvVT43vjs+O7E8LpkpPSk8stcpMqEwqTSpOrDpBjJ6AO5BdJiwUFg1qjIn3d4UCltrGSyKKTixMSk3UAUpPS1rKTLh1JabgAipNhrFET6P5JPgCjB4jtNPXAi4AUALBADU2Gg3WejbQ8nQfQMGyOCdCjV1xZwhM46OBClFnFUVJGdPeIKil8JJeEfWDLwOjs7thfPeGjxJaRox6D0aMC9XC9tJNsXiSjqYCwgD

vu2kjOA4B1EiIBDCcc/JS1MqMTgAbrJYVgcyMLIwgASyOsuT9DjN0cZeqSGJWJvRQqUI45mJqkaaS2jMBkXxNMzW1QoaD1wOig+EnIUC2gEgCw40OTe47tA0zWeKDjk+Tjk5PfODOTDQnzk4uTC37o2ELjb+Ai4xJjcMPCfUyZlpOIRn5Zj5AJ6SOTWwzpGBuTI+lbk5xQO5Nzk0rE+5NGNVf9FU3gEzETVqNq6kIAscL4AJcAI5FgEP6AuFpVyE

YAFDC99IQAgwDEqIrdLYPnwcmo42YECiJYtcRfDW1GfxzwyK0IzSzhBIHVOC1XFcQNC4MPMpu9LunbvXnDZePljswTvSP1/fMpOiAxyvrgvNoj5U3FE2I0LqsUStSHTacVFAOqw+ITnTKco9yjvKNdk0Q51u1cBS4ZPACJiqplUrFqjiIFo+OUJEkZO3F6xcDFSl6HcUj42PrGHsWAOERPACEAFYDzaKY6pAwqBTbA8GgyQKyAbwCaQyBDVlVwpQ

D9Xbp8U5cAPKMjQ1Y9xdhvoq4414RAA5vc0KPGIKUSDcbNOE5lV+CBXrNxDyHyw50pOSLzPdKRMZZWEmKdFCPZw8uDucOUk+Cep0OYYFRTw2M0UxKpMkC1HgbK6qYxQ1GIjdKy9LFwzKNng8iZ4k5bkMZ07cOdGY4kXcN1NY0FESHslOjMsWwNhlRmIhJaTQE0giRWEmN9jiMnw5ojeWTV/oMAIKM1hYUhpwUGIxd9PiNrffC6dMaamdFmY9TxBL

LivhrJqIQS6UUOIy4lTiN2YABTR1DAU0eAoFPgU5BT0FOwU7RdZd3+JSw9y8OzPavDjzWsxsQmPpI1ortSQgiSIPegLgiJ8FyE38PRIxo9z5VPpXEj3SEJI3CINzmAtd+VySP/fTZV4cRtk5IAiyO3PbH6yt0olJld9oMi+MmQXw0kcHlogkg+Fj41IZDoLbLir4Qx8AFTzoMuJvi+e7BsqP2T8804o0T9ZJOkUyXjq4P7veuDrBNHvTsAJq30gE

8+p/BaHoSNJZKfEqdNLKPnTQmDB+V9k9Hd+oXVNdV9ZT0SI3CmsuJOTKMILWAgomFwu1LAPAOSYGZ/7OO6i5II07hVi/T3oKYSpdgGUjTk5iOfxC1T81NtU84jdEgZIyRAWSPndafU4wXnfXN9B1NyUlB+RtNbxIM9s1O7fQtT2yB+kwGTQZNTPXtTJUX9Pa/DGIiNtEgIqCJ4yA0huF7a2enEk7p3U12RD1Mfff/Dr1OccO9TwCMghUg04CNgOP

geJ4BDoJIAwWzuGpPm24RSbHj0TvoTalHmkF07hLL4HiHI7Fh2snjm2AKoR9l8WeQTEaMLzVGjJFOxNRMpHzK0I4o0CVNu3RuDYtjucMNiNOI5xGqdythtNYG9rzQQdryT+aP8kxvCf/1KcJKW2WFWSC+C/CllRAPTrEFUUMPT+W5cg7cTjUPeEyjDLKCj05oCE9NqZVfqtc1uw5jDPpPhxEIAXDZjAHAA5xI+423NpmWK4vkUNOKIGt+dTPLdpa

ycEHaR8PSpc7CExpSBYwEI0l0shak1NIXTeZPF0wWT5C1HQ2LFwUOtEwmjYUPlk3bN42O2NppaVzrsNXTxvzSk6B9iQbQzI8JkolPiU614w+MrIwDuUYj1xEepzF3KECgpXwrEY9kDa2BOQlmEaegtoFutTsTP9cSCWXzl8jGCOClYM/SNODMnUCmhUYTxmIQzyKokM1hYZDPh8tBZR15CDJg1cN38qHVDfy7T0+W9jsMm0pgzSorUie0DuDMq/f

Qza1CMM8Qz6/UsMy+cbDOek9kpcZ3baR/aCNTAlvAzvsORbGyocQSSWG3YYzjd5trlYcAq2Zpg0vCSrpviE+TR0NPCW/bBcHgjhiCETnHDseCKRvKu2KNC7rjTkVNUI9FThNPxPX/T9JPUYCZT2I2DQarGOsE0tKoe2lmLsIUjndMM0wWjfiFCWKfZxVM3FVV9uZWhIeVTmD3uphcUdSVWM32ls+z2EvYzmRCOM+/EKiNTw0Ol6iOq04tTgFMrU2

tTv3EbU0QAW1OLw0BFc6USPa/DQ+ywPEtqXQU5PWt9EhL0RHScF8pm08fDrT2nw1vT4wC701pp8zW9PfbTK8Nvtl3Gy6VcPc1F7wVvfTEjb33PUwc93323/YCFCQjZJT+lX1OO8JZTB4gH1BQASwCE9S/CjeUF/TeFDUYDE+3l5fD1U3IgO1VwSGxuE3jgOmegdBkFbNAupEQanWdAVsDNI7tDfSX1E3ijPNWo2c0TNf0lk6L+7RPlkwSZLCMD7B

Hc1dpE6FAaWtr8FrPkiD2R3ZZpSnCpxLB19bJgTClp4ZmyXb/oqUIRAHapZ5ZYUIM2KgT2xG+JEiwpTcgdymUDfPLcVp363qOT6RgWqSLoinK6EbBxCgB4s4qkjM4SgkSzzugks5cY1fjJUOSzfGWUs7bcB5PmEmDwjxTSFp1dDvXnkwClaFnIw/tdz44QzfeTrmmYs45CTLPC3CyzvTH4s+yzFQ6cs7xxIiiks+XM/LMiZXAAVLPmff/N1w3RE5

ajkBNM+oaiRIBQAFXI9ixSA4VjsSKG4hTmRaNuEofJNmXgSBGOMSFSIagtKRDbsDNaczTuZaegk83Qlj5l96B+ZWcDtr27dSLFRZPoA1bNNdMk0z5U2iAqao9Q5Axy/mMjWT0I6ekQsj2ng2fN9q0Y6VwDQpPTE3QgxYr0BB2Y1VA7Gtcpk5P+EZ7Oii3lLY883KzC5TG+O5x/6QQVAuWHUJkBiHmS1rUVcGrEMDEw5ECEABqKfVEL6ZgAZ+MGE+

igKCm7IKe5nFHSNdSgzSqDmD6Kb8VEM8uCIO04eemcOUlyOLRAf6P3+NZA7VFpRMZ9XvkemIAAOASp/HSs0bCAALgEglHcyMvj4RPU44YTdrZls+cwIEAz6JWz0OHVs29NsBykzvtQ7y2Nsxc4zbOOVqJcbbMVFfWoXbOhDb2zwaT9s6gAg7PDs4NCo7Pjs/YTk7PTs65AxrzdiD4qtWW4mMuzFcCrs/gV67PSifmcJ4Dbs2pju7PjubVcDED9MH

0Np7OSguezXQAXszSgN7N2VnezBhOC4z3Ix5Pu2rDlU9OS4zPTeqNz04/1TWUvs5mwVFBVs4FcNbMmzpYo9bOkTP4NHpgAc/hWQHPt6e2zbbJgc/Ct5LZ9s9SgA7NDs6J5cHOX48ETYnFTs8N5KHNk5XlQC7Mz3sPAXujMKdhzxLhrs3Cw+HOhaURzbvgkc/uzYbiHs2WsVHN9XLestHP0c8ATmABMc/YTPl01g6szOO3sRswA2eSCIomd824hk6

qeTez/Yi5ZAbTFnevgSlTDdWJ8OvJKIFnT0KLGacTWqagKWPPVPXHZse/TVBNZwzQTUVN0E14zA5pU/WWTfjPK5eCzRpyRaBw0b7qHzbJ+ampckUlDUYjtjikxwpP1VINpaWmiNSGCXnMIc1vjgHkV6T5z/XPMyMnyI5k6IIB5VpSinBfjRfBQfuNzzMhIgIZz87M/AmmKAzDXDDaN1a4NXKyAbu4dc3uzXXM9o9woDHMgEzpzA3PecxETgVwjc8

9if9y0yAw6wj4U6CLIM3MxvnNzN1BR/oIcaEIrc6wwhOF3lptz7cmT02aTLQ0eE3D1Ar31AzsgqWmVeYtzB3O9c8dzQsiDc2dzIsijc1dzE3MihFNz93N8ALNz4qDzcy9zojVvc4oYH3Nh/hvF6gKX/YXW5rNek/SRgXN99gBVZ4g5CDEA8BMRc5FsCEjEKVW0ReAh9AJYBsroImfYwkjLqDSl27weYGDsYPjBwE9AZdrhksEZ1KUQLuFTuKMJVY

0T39MMQ/qtSX1JsyNw3UkxyutIgkj7nvRlm5DR1E3YteAhvfwjjNOc/cp+4qKy9cKTzNEAeLcKHg37UBA2eKARoRSQtllG8z4YlQ0NeGbzKXwW86XyASpS+t9VM6DrPbkd2JHmkxeTPllXk8ClFy2eAibz9vPVDY7zcKCW8wSZof0ZY71DEBMddYEidQCJjOANamyWPU6zDlObvGhV3gR64tUlZm6pwUgIdZ3Fndu8eBlGXtsD58YJ9kRDxFo+ye

pY3TqfM1YO3WMl00Xj+NP0Q4SjH7U+M+Vzyl5dWV0TtJVLcJNDMUM7sNLV4oUAHP0oNeDNc3pMOGyTOCWzrKDAIB4NtkQQNpbzD6M+PEowsUCAIGddMa1AYSwC02mocyc4MRgPZKrM42RHJJIA2yTsZHoorPDguA8wezhSpFBcFABpSKGgNNjsiBHt/oJAIAHAng2h8315LaGhcuKgQ7lMHLr5qLgESl8QAtYGGFCu6S20qg140/MpfLPzsWMEXH

7gi/OPPL3pOsRr86xKghx01tvzrWR78wfzkeRH8+rCALhBGOfzh+SX860KN/M2iHfzqyCrCo/zIfP1MOHz4T5woO/zJXmXDnr5mLAQwnck//Mfk+v9bnQsEEYyYXAISIlDf3PwwwDzon1Wk+J9uIiT88ALFw0v8/QAc/MtnAvzVczL841tq/OrgvALojWICzukaAC78xrQqAs6COgLJ/OYC57o2AtRPFfzV/HsgLfzdAL384ooJAvCC07zr/NjUJ

QLYfnDuV/zgU2/8wwLfRhMC6azeG5NFZK9MfNk89vKmS6ZQI0A9ABLAEIAgNMYpW9dl+CrRYMI073Nlb3NJfNCDKVSBUZFvd89YaPLQfIehFNI3YuD7jPkk9QjJXMaum0T97o7VoWqHTj+UuzJTbSQfPkj7UiRM3lTWsXM08apYkMg1XeDztie2MfaW2Taau9U/FRyQGyAUEB/rBdxVqAVgBX28tiyIAyeplPP2uZTYEM7M79TGSNQADyjENRk7n

LYC6jLsGTorDRL4vLYPk7SOos0MHyx3JugBlJAkitqD9NjCHr0vZT/7CIkYvMxsxylfWMouffZzfPnQyNjrtlLAFhdQDP5Tm1GSnBiCETouGgxVPXEdkrD846Eo/PxDgx5CgkxsESkJgvqAJxjIrnxmKkoMFjpuBc4vYhp6ECtIqSRTevzylYNVqHxkYF+uOzjvoK1UaXo0KjXY8qTCrwP8V8LTyyD6A14IfP/C13Ma1BAi5wY6HjUuGCL8ZgQi9

0t9BjQizq2cIu/6AiLhtZIixQxgLA6+XJi/xK4+Ah0V9LZkdbD6jUS4zJjzyNFHdONmItt6diLDZi4ixcN+IuKzISLvxgZKCSLz2Rki/LQi1GcTXsYNLg0izvh8IuajaN8jItwC6iLc7OKM2SdsIY6ZWA4mUAnIESADiL0AHZTKfO73Z9ModLxklrUvxIv4Nj9xdqUNBNKm+KQ8IjGUQQbC1bpDeax4NHcFiY//djTrjN8w7GzAsOBytLzIsMt8y

CzfjOEw+CzgIi9dIuwROjbsJAzyg5Z4DAzEdMjkRTITCjuuiP9klWu7ZnJY/PCNdON9/M7OG0YVNZ/DsCLIGrU/LTNn8DRgqv1dguXRCWLitZli5wYFYt6jFWLZkihaiiR5mawLu7zGOA+qvSZmqP/cxaTvvM/PteTMKB1i8WL5Zili5iw5YsgDq2LGLx0zQf8eosAk/dd28qYAHzIVchniHcgCr2Wi+hofF7R4JfWn4jm2Kb2IiaxiI+guQVWTF

UII4NzSHcZHkos8ufZz4hWMv6LtRNEbPtDBwuXA1/Tu5kAs7cDibMXQ2wTkAYN06lsXIRlXnTxcYW6btYxUoHKw9dJmNyvQ2MAJ4DZga16bACnfdmLhu3yE1QDeYsfC0WLA+29bUuyHzxBjCIu6+mu3rWLmEuz0RYLuEvnGPhLEBnsM8xogRozzY4zK6iP4zyLpb0NQwIzcmMm0g7wX6MiQRLQnM26jBMMBEsdi78j/nNuC5H928rDKsoA8UBwAM

lZ2tNFtjCVp8QT5GD4CXAboC9AS+LYFP3YJI3fCMF9/exFwtQk7S4dLhnjxBRtHErUoQQ/LuC9RFN4PKXT9Y1pC/Gz1dNojXLzv0hLAC6G5cNfCCKEOTEaaoeDR80bfZQ07cX5s7KF7KOwS/BLewCIS3yj8DnpdOmLmBmVAFmL7JHdk2P9FL3oS9eDC53iQ0pTM6BatNpOReDMA+9UDIBXIjsip85Yk5AQs6J+qN4xZ50ehfyeWkMy3cCVnWp+S4

uACEuRHjAj58Hn5jCA5shi+kpLUnzfCA9oiFXqS4njM9Xh3CnwfhAq2q5T6KKW4jeLxJMZwwWT5kurTa1iMVOoudSTTBNAs1sBkYvKXhiF4LOnQKMSx4RE6Crz8TLoCLs2TFMiE6V9TNPxvZnJ8TP1pRzT3cO6UiGmy7BYmrfs1OQq2uBmA0tdHMrTvD0W02UAokviS5JLdTO3w4NTY9SsxZUI+Wh6oInw5TT9BLtcx5P1CIfDO319M90hJzVrix

NUm4vfUK9LhiOdOTiG59m+qKnQ7TNXBahUC76AJkPaESOqPXMzP8N+03/DEYVfffRUH1MgIwY9KSO81ILNH9oFMqCWYUvFhjVLxdgpLPrpe1yNS0tVS7blgXrApSIx8E5lblWQ8EZ0r4g4+GODsRrlKdhlK6AxcFzDvkPCNMNL+XPE0njTZdPV9RXTFFMe6dZLLY2Jo6TTyT3XC0ie1OTVWTWTG0Uyrrxs0nhFdk2TZQt7S8bioiPcU+IjJ0vupl

zL8EX+UnzL4KaCy4dGoDy/iHdLRzX9M+1TT0sSS0sAUkvXw+OVA1NGI8Lw0EBSxgfQCRlswf0542YqVBwWfuzGUr0zLT1gy9Q9xos8AKaLLFgeIztTRUV204ElBtPcIVMznD0eCJEjj6X3Uzs9mj2EaQHT75WJI0TLodMPOWTL5z2hjW5EnICEAPkpZO4o7ONAl0yg+GUuC/QGZA4pTgj1lJxF1kydkrScVTK4dOXaCHSihqKGr9NvybXzI0v18z

LLZFMTSycLjEMzSxYDFjawOCjK+fB9EwK+RC0ooV9Z12ikjZ3jfDVoS+8LcUtx6T5E0igCGNAczDAcRD1CoXINFaAcF6qLZGHepSSCoKRNJnJfDquWi2RIwNgYcYQgfqWog3kVwJaBlajOSKb4BlAPqDGcHLKerdeselajpJkAUkQ9DNBMDhysQTJQJehWQGEkxQojgEetIig8UJqM0ExI/O6y3vgiLmAOqbKgHMSAv9p+CD0NbGMteMS2FgLcvL

/omUkgqBows4LiQsuhHNHOSXlQ1fhZuD0MMlBiKktR/oo4gx/LxDBMIO8khVCYAHW6rTYUMPXAHLJ5MXXodaiqAltEne2CC1EAIfMXzISLs7MmvJf4IH0NRL+ubehwsFLhyzBNiEXAsfEnllHC9cAVwMCAi7gqQvArNHjgrgboKCsKABL8LEApURnA3M6eXIOYhigl4ZSAMrmd5Nidfk08YS48Uo3bfNgYToKbCu3eGQ3pCgsNPuQdDFXoGTA0UD

SgDcrnGA3KQi1HRByytI3iXEiwHA530eOo1PwaRKxc1cxU9tCsutYHDPfYCbDAUOGkh/6U4fNtRWWEtiiw7NAbCpt8XLYZKL2IqSgU0KfLOATny6RLl8uRFNfLQoC3yw6Y98szLTUOMdgxfq/LCSjvy4OY6qyEEce55cA/yy+of8u7ip98QCsFbTSsoc7JUNpQECtF6FArdbowK7GwzdGyVmJWIwwoK9FQ6CuCKypCP6E4K1r8eCuRFAQrWvDEKz

OOw3hkK6KAFCvRGGWI9SggQXQrH9EDiYM8KgQsK3eMbCuESuIxnCssg9wrJDgf6NZQwQACK8OYQisiK2VY2445KPAYx1381kGY5w1eDaB+ud6KK2hz2iuFMTcx67OaK/3k8Bg6K8JceivCK4Yr6cArOHUCpitbKxYrxuhWK1XANisBoFAA9iscjU4rEiiuK5nh7itbDf3AXiu2jT4r9m2LQsejLCsh/n8OvHl6HZ5EgtDJMFEr/wr2QLErlFDxK3

3A7A5SoFEd+i56jOkrpVyZK86s2StqLEWo2mNy6IpEDBElK2YVZSuCc4hKHrKzvu3YLdZGq6FOnHN8i3cTgjN1bqdEPYjHy0beDStas7p1zSv0OA0xbSsrkxZcCqBdK3itPStjJF3wb8vz7ScsIyvRfmMr0fmTKwArs4s2QMAr3xr0mNBW4Cs97csrd4zQKwVQc4lwK+UYCCvmK8grxui7K/9NIKsHK9grLA4Ccn7FpytEgIQrL6iSDSQrVyuCoO

QrWQKUKycO2QyPK5YY9CsXfMv4zCu00TH+7CvfK85QXCtDKycsPCsAq/wrgiv6K6IrRDiQq5IrZcDSK0ALsisXDfIriKsb80QoWKuoqyMxgbh40IkoUqRzqwq225x5wPor+KvGKzxEiehmK6aY6avxQOSrlKtIoDSrGgEVKPSrytG9Hf2tzKv98cRjf+SvmD9tnKu/+NyrmQ28qwYN/KvhK4XRwqv7LKKrYSviq2gACStMvEkr0qvboSIu8quwNo

qrYRXKICqreStNmIUrFOFWQFqrw+g6q86wWFhVK35zgC0jVZ1qLEAXNN2gZ1SzaPXL16CJjpXOwpEoIgGzGFJU1csyBp6uygES2Gg7cArYtjMqNv40QvhhdngSostNnWu9uPEfGaNL7Z1gzNPL5cWzy0TTdJOt89DgIOQqanNjRXhQmcdodZPd5tzFrwv68/mLgMNGYjUrNqs+uHaroc4Xy06r0HMoTF4cvis8DnUoRvwxvE4A+BHgeScJM42JQB

SA3aBDnHUAeBCT6DMOji2mEYIAPf55MbIV4zDKeapAMTz2uY5Exjxa0NWYdUzjxQEDfa1O+IhYchEX6NDNSkF88VLQ3bCCUXky1lDmRBSAcgC0qq+NexjVq4qYwQCPpA5JlYgqQs4cA4jQTDD87Qr9ra6tBKoUTc6wbjwB+MQERXVdqxVQ3rjXKfRJt4KsDuoo55rQgpfx/5mo/IttDa0iHEQAcACztAlrZzw7OJtt72VeYe+Gs/HebZkkhEYFEV

NpAHGPZZaKzmvZwPI43vlSNUor0VB2bJDEyBgpwNnhQlY3DLKWlujn5DNQVy056D7oCgD+Hl6YbKAysCURduhwqyl84iuHUKoCkkFpUbWsLYgQAItr7yWQaloL1YyW3Kbz82tAUAG8LED9ta1tXQARfj7odZj4XAgVNVayjChcZUJF7YVhFeEHju4NYosQNoy2Neg4gmwsCotcEbkCqewvq0ErUmLCXfOsr+VdZVI8dvNwGJikNyzVK0fLu2v1K6

P59quaazu42ms3GLprHKsIg/UonHK7UNYw3vima7eJ5msIGFZrtFw2a3zgdmt6/FhR8YBOa38rOe21mDz5ECAea8EAXmseiD5rQhzginBWWVbBayuusw5uGFq+RUFJzUl+NKCxa91reTIaGUlrSoulPC8tB1Dpa4MkAm1HfDlrboh1uvlrYBikZGgsUowla7Le7rzla0P4lWuhK8AgtWtDCZv4DWusQva5LWvgWW1rZuuxcnFrRrJyADL5A2ucVs

NruU0fYx2J565rc2x1U2vwrTNrH8tzaxc446H7czxQK2vEg4dUQgAba6kpSEzJa26wdStCYFpEB2sMKEdrNLpPDmdrFeH/mJdrtLjKK74BSw4uRA9rjIjPa2DBX2vvay689vPt6z9rf2v7GIDryyxXjZxxyhVg61JdEOunrPexRWGw62cN8OspfIjr5dFr+HD2FItu6It8fqyY612YdYg462wd+OvmzKbzxOunch3JigZ71gnB3LnXE3wzXHMsSw

KLyDAqa+TrBVDqa5ERsov7OLTrG5j06xetcJiNYczrxms/oezreUmc65Zr1mu2a+VCguss/M5rxDCuaw75Dy2S6xTqeIgy60kUcusHmCJ6+bCDfkrrQ7EQ9qrr4Wvq68Y+musC3l1r8Wt662TIBuuajaFRoqAIGOiggevZa8Wk/Cx5ayQCBWu262H89uuTRO/Ajuud6n/WruvMTDVrybKe6y+xZICNa77rtuita6sCgetYHDgbIet9awXt7a2Da2

UYtvGIY+CJseuTa9+juBhJ61VrYG7za1q8z2tmsBnrfxhraznrQGMW+QQbN+urkCXrmLCHa8drleudMOdr0hi169drUKs0QI3r+3zN6w3MdPSva5bFHeusiJ9rWAuBPL9rWz7/aw8wO/kD6/BNWRUj60vr3I2RcZPrkZzT6xOrCOvRtkjrC+t/jEvrYmG2sqxKGw3r69jrHfm46woV2+uwq/bze+us/BhrFqNAPsJLWIQfWNCanAyNAL/N8ENgEk

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
```
%%