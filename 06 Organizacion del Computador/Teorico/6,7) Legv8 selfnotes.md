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

6ada4d189237b056be85cb239af01703100426e6: https://cat-milk.github.io/Anime-Girls-Holding-Programming-Books/static/e1657d0a5c4aab06c7089ec771c82bb2/ed3fb/Takami_Chika_Stressing_On_Assembly.png

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

6Di9UxXi2dhgMOvcYD77XL4GYDzD7RySb6ewA1xU8Dz1XJqLWpB037zbeZetSviHXUPwOxBmyo0LQq1ffVIx53oIfOKnCPntJDYnAicFrkcuDtTBgMLmCsgNnliwBz0oIDl53DVdedgSLnVIQAVZ4QIkM+EP2xYmQi9XoRfJIIE2roKGXYf4iTSdWkFK5kIi1gJYQCqEfZVunPADw06OwjFleO1r2CxQvNdt0xNfWNxV2C9Wi5lP0Ivb2dYti7Tk

jWz0AWOZLV8/BRg6D6XLSjyJ2FEd3ng64pe7UqxZ4D1ArbiipC2pYulm0qbxwcitlDzpaZ4cqWZn0ycSNKhOSXFQ86k0AFyfSZQpjGXShZpl1kzeZdS4q9nFhQhUOKlsVDrpZqZVfqtc2Nvcytzb3sRnXA1yCBYsQAjwPE7YdAluKCSOC6rXT+nkUUOqEQiMEEy35WORGi++ZukHlsxtmrvOnwr/nSeHDELoOIA4Lu4kXL1VdFiVU0DbqtskVu5e

hd9wMKnQyx24O3EFHlJ6CAdb6ZRQW/CBB2Pf0IOSQ59ABkOdQoNV32BWS9DF3axfL0XbFTjYBqXyldAK3qoMMRbBb9cJU3hddw/KheddYVqW0mXQf9LvVH/ZaNkjnaABDDqoPh/bf9HXWBIkYALaDEqMTk8QA/Q8ZDsSJdtinQkBqanev6c0PM8vsUAAWa2KEKetns7e2UskgYsVqhvYBTEt3IScV4lJbZoT1EdhsR4p0k/WtN6ANWzW7dG4PhQ1

7lHEP0OuqeUvD+ngfWtT0cLYEQsyTkA/yxd3SUuYVg2Dm4Ofg59N0G/qIFNaWB1RlDgGrE/K3qxsPINlPy5WLy2NJp4MhQRoZdDs4NQ8jDGW28g2jDeWqmw91D9b0VTTf96oN3/YEimsN4OclZjn1+3EBiCRB9ElrkAYZuqn6obRyBkisDyz7hBEUm8W0TpiZMoV4jCPOoJOTLqIpA7Ghy/jbd4T1+Q8TSS4N0Q8VdbZA3A1Z8TEPVwcYpng57AE

vlTDVRZHw+xOTjnfRlqdW3mbj4mR3D9RWlvDXLzhlY+sN6hYXqCoalPfmVqlKWplL6L93EymBJ7NqOUinDRjLKKeA62qZcPeQ9miXjOXt9W6Uz2ROlM30g9X0983131B7abdivNKYgafDfujKS0qVDZrsUHCat3euVud1UPfndEAD4w4TDxxA/Q6I9gEURRZd9G8PqWDnE2F4l4DSFZzpTQPomAYbX4NmRr31PpQvdPzX7PQOR+LoAtV+VFGlDRY

Y94EM9VKQ55Dkkw0rdbqXo2ByUN1IB2LhePqVWQYgiouLKWt+idQ2HaI2UFdjUIq9OIwhVCKp44DqbMTSlWcONqcbNNEN5w1u9jr2Fw3/ddfUYAwGD4h7U/eFD0fW3QyrALUxTeG4hGsHXIaTd0wStdHOpsoFtw4wuHcM+kjWVYiWyhTV9/cMVJsw4DzXX4EEFBCMg4sQjglnsaGQjKj2ajtU543153W4lY6WYAEvDszmTpb0098PXNXBpEqZx4M

HG5gbE2Iul9dg4yl/UZxlaFiula9QjPfPDOiP8PegAQ0PPgCNDcDVnfdM9wEU3NdzwlTJICCQ9mgyixPYIQSOVhqFY/ENYafeViSVYugAjr6WffZs6VzkNsL99ECMgtWc9tYMinvQA8VnIvuEeYGU1cZHwynDsqHdQaDVDZqYmiY3eXsGGTyEpcDrGmWWRxuzDn8Gz4jtwsgzlzo2dlENiRQLDCF1CwxR2BRldnQA9WN10LUatjL14A6FUhLA1Fj

yx+ESYKMfV/yoqWD6Bb0MHiEYA8UA9qolAeFo6w5qBiq5GqdLwJqmrPlIGS2l3fMcCr7TEoHGpmH17I1Fp9TDhzI4ARyPAICcjC36rvOJl3rSSZV31e/2mjT6dTUMFzRZd9VTnIwcjlmDXI+mcHqnjA75dTb2EwViE4ORz0qVgQP1gZasWod3brmfw2uWNYGdWoI2j7P0p4QRP5hmmdJDazWMBWGWHRq0jeGVnA0f6R0OO5ZdV8AUu3THVoUOsI6

mAewB0Vc+RtJU+BENm+fXTzpCI2kUCPsB8GeBOtOEOT3UiI4DwVN3FMkeARgDVVC2goV3rI+y51XboVMFw8h6Gw2cjaphhXGhCoMOvHKcjWCT7I24V8MJyo45ZxsjVmgOAi8I8nM8jxo11Qy0N9sNI5Yf9mW18g9F8SqP/IyqjeK0B9VClAC3B9UAtGoNmBWh+3aCx2qItYGUXaAtIgarnxuRaMxAH0Nj08EhuTCtw3Z5Z4KpGwqYW6QWNOCDeZe

fGvmXtGXODRNKkLTnD5C0nQ1KdDCNrzfE9WAOIvR7dmI2ZVbVdRmjLBWMiMTKCINHUldp2OUJD1xwdIIsFV80KGH+kVFHLBmTl2Sj+YvLCjkS6AN6My/jAVsusUHp6RIAAHgRGRMzIj1AzBaLeqXkDfj0JlvyXMCM8guW52XZWqsqqQKpAN8S8MD5E8hWQZK1cTqmBAECdxfh0gHXknNBRUKN8to3A+dqWpSiR0B1Qb/WHo8TkQHXQgBOc/RSGSW

UNLH0SQWGs1YxmAGYAkZxjrTOulQYPhmOjxj71o1wE9/hnLqBugMFVoweNIU1VuEOg76Pz9ToAxPwto5zQbaNEep2j3aNUaPtoC8BvJRiwWjyuQiOjuWlIg86kFemTo9OjqkCzoyPxD7GLoxGpAzAro5cwa6OEjIMAm6N7xaR5Sbq7o8BQ+6Mno7RjR6MiJmej/hS0vbxEQbbAQTejJBh3o65u+6xPo+VQgUFGfQBjuABAY+08py71ULstkOUH6R

ViR+kgPLTxQn0w9U71DsNmXR8jS4q5HMFg1aMsTcNpgGPA2MBjTaNQXH8OxGPto7pEXaOjzDBjMwXwY7kwiGPDozlpgWnzo2hj951To5hj2GO+zrhjzFb4Y8uj8AKroxBjmLCkY4xQUo07o/RCe6M/pPRjB6PHo7kmp+Tno8K9ojBXo2xjglC3owaIXGOPo7Guz6OngfxjkSSCY1pjwmNPLqJj4MHyORZ9v8VqgyH10wMtES2gxMGNALZeL13bya

rl4NgK2KHpo8jvVge1fdiobNiifSg7MV44QaOp0CGj9JBho5FwUxIYaSup4HXeQ9mx5wPl/Xt1lLVV/cmjou0DmlT9sCHhQ49VoyPPVdU93dK1GvMltYZryNZK8APJQ8iZ4k5bkMZ09DnAw9zov6OhznlNqWNAYxRxOgBHeIfkfw7fAMPo5cA8APpEgACuBNBjU8hOlbfw/aNcUaY8NZxIY1Zj02kpY0Xo7+n2YzfE9mOOYzZjVbh4Y2E+bmOSME

RjvPbAVmRjvmOUY/5j1GPCEUFjdGMhYyjjtGAKo9ckB2OjubWjmmMNox6I2gDnY2BjVGjXY7djD2PGY09j92i38GZjObAWY3c4yGPWYz9jNKB/Y1OjAONTo0DjDOOg4wOu4OOfwJDj66P5QDDj26Nw46foAWN9gMjjZqRI40Fj++mFeJJjMOXy7bqjbpqvI41DPIN7XRZdKmPV0Y0GHmk44488jaME45djKLYVwCTjj2Om2f6qUIBU4zmANOPF+K

OjwOPjo0zjmGOA43kGc6Ps4y5jYONBAO5jPOMkY/zjSTB+Y0LjCOMi4+LjqOPBY2LjxOQ+XTWDOMM47exGZWAG6K9AAcFgZeaSUsa6Rr7J2uWg7B2xwTgElAn2lGh1HCUiFwF7XIPWjSNGIIeEKlS+kNZBHSkUIx45ET20Q7QjQqn0I2dDNLWmA2uDLCPTY5SjCdU2Ay9uAbSISHpZ3KLRo7WGFsjEyjVDqWWlNWrDZF31WPoAlF1sAMY4rc10Xb

rDW7ZucLSQFm6mqQnA4ujGPITUgGPlwCBj3oyT6MX8dmP/Y/GuMTAb4/ZjqkCnmXSMhkD3+GIA/VTL46vjPIDr4xOje+OLrjvjdlZ742yRUMMsEFOwEvglla8+tsP7/YajKMPGo87DpJAL46uQp+OCYyvjOmPPDCLI6GPX49vjoBOYAPfjWMN1zRH9A0N99m94HGAmIsMAksPjQ7wAWPTo7MTkalxSqAgNmgySDK22SjYVNGyEJsifKue8AGK42P

nj1eYY4h6Qe0NWDu6DfPX23WbN3oNo3Xm0RcM2DCXDyQVbTQqdu9XZo0FYZwDLwO3jYoG/OStjf4jSWA45u+Xxgx206sPbIESAFAAbyfoAqkAcgMKjcb1LYrNI0WTY6Ubxijzxcez2G+NuqMzj4BNBvsX8b9z/Y/ZjB+NFMnSqxjzJaW+xOAS6EyYTW+OGE0kgxhP6E1OjD+O2xbdQz+Mw0sWdsmNenQajcPUCvfUDTjyaE/1p1hN5ULYTzhPM4x

ATRhM42eETbJF1vUH1zRUFY/ajaupVVPoAkgBrtPFAz50TKiHwodjO1m3GbnAigfCjkPjtTJP2hIEGni9oY/ZlEsFYVT5W6cdcFGF/SeYlRA0L1XCNFwPHQ1PlSmnOvRT93Z3kow3j1GB7AMy1zePK7jDcp1z4PXTxU7DrxMfw00izgxtjWsUH5WYgbTUVo1KjtbyqKH/jtag44xCMCKSCCa+jHBizuTecLHFBmBljqxNpY9pQMLDmjJsTVuOHuD

sT4+oQUldwBfBbMvOB3hOzTtyDpbWow8ZNitJ7E8sTx+OLfPWj6xOnE3D85xPbExQVOWP/zdcNkwOJE97DTPoOBKcg9AD5HBQATf1oE3TVD4ihENgIcFSBEOiaxNhXXGfEi8K4Xrq9TXTWOIMIoZDYdh0prc4D1ReQiKZGMgn0pf30E8gDNCMu6du9rBPjYx7pHBObTe69Cp0/tTSjE5pBLL0IWqCmutQuMtXk8kbuf/qo6TOdlmkswVcVkqM/wC

sTS+NHE8LpP5D9VGu0SNDEoOzIFhO95P1UCXEG9fPjnxMAE98TIsiyk/KTyy1Kk0ETVgCqk2Gsqw6wYyegDuQXSeWjcuOOQfVDIn3d4UCltrGSyJKTWpNZAe8pcpPS1oqTLh1JabgAxpOCUDATfUNwEyCjB4jtNPXAi4AUALBADU2Gg3WejbQ8nQfQMGyOCfCjV1xZwhM46OBClFnFUVJGdPeIKil8JJeEfWDLwOjs7thfPTGjxJZxox6DS82vtU

FDeq30Dd0TUKFi2LCAO+7aSM4DgHUSIgEMJxz8lLUy0xPcVeslhWBLIysjCABrI6y5f0OM3Rxl6pIYlYm9FCpQjjmYmqRppLaMwGT/E0zNbVChoPXA6KD4SchQLaASAOjjk5N7ju0DTNZ4oHOTDOMLk984y5MNCWuTG5MLfujYUuNv4DLjMmMIw8J9TJn2k4hGflmPkAnp05NbDOkY+5Mj6YeTnFDHk6uTSsRnk0Y1V/0ew6CTdqPgk2rqQgCxwv

gAlwAjkWAQ/oC4WlXIRgAUML30hACDAMSoit0tg+fByajjZgQKIli1xF8NbUZ/HPDIrQjNLOEEgdU4LVcVxA0Lgw8ym720k3Qjq4P7veuDGF0ZowrJMcr64LzaI+VNxRNiNC6rFErUh02nFRQDA+M8o6pAfKMCo0Kjg5NEOdbtXAUuGTwAiYqqZVKxao4iBVPjlCRJGTtxesXAxUpeh3FI+Nj6xh7FgDhETwAhABWA82imOqQMKgU2wPBoMkCsgG

8AmkMgQ1ZVcKUA/V26wlOXAIKjY0NWPcXYb6KuONeEQAOb3PCjxiClEg3GzThOZVfggV6zcQ8hCsOdKTki8z3SkTGWVhJindQjDt3ME07dVeNakVWTwYBMk4A9jFNHvTJAtR4GyuqmMUNRiI3SsvSxcByjZ4ObY7MT4qNdw50ZjiS9w3U1jQURIeyU6MyxbA2GVGYiElpNATSCJFYSY32uI+fDuiN5ZNX+gwAQozWFhSGnBSYjF30BI2t98Lp0xp

qZ0WZj1PEEsuK+GsmohBLpRS4jLiVuI3Zg4FNHUFBTR4AwU3BTCFNIUyhTtF1l3f4lLD1rw7M9G8OPNazGxCY+kjWiu1JCCJIg96AuCInwXIR/w/EjGj3PlU+lSSPdISkjcIg3OYC135XpI/99NlXhxL2TkgCrI7c9sfrK3SiUmV32gyL4yZBfDSRweWiCSD4WPjUhkOgtsuKvhDHwoVPOgy4m+L57sGyoY5PzzQSjRP00k7E1EykfMmwTijSpU4

Mj9f3zKTsAJq30gE8+p/BaHoSNJZKfEqdNnKPnTQmDB+Wjk9Hd+oXVNdV9ZT0yI3CmsuJOTKMILWAgomFwu1LAPAOSYGZ/7OO6i5Io07hVi/T3oKYSpdgGUjTk1iOfxB1Ty1NdU+4jdEg5IyRAeSPndafU4wXnfXN9J1NyUlB+FtNbxIM9i1O7fStT2yAhk2GTEZNTPUdTJUX9PR/DGIiNtEgIqCJ4yA0huF7a2enEk7pPU12RL1MffUAjn1OccN

9TYCMghUg0UCNgOPgeJ4BDoJIAwWzuGpPm24RSbHj0TvqWQ4Xjx7A7hLL4HiHI7Fh2snjm2M5DxtmkWPjTQu6E03FTy4MsE4lT4J7nQ5hgFNN3A0MjNpnucMNiNOI5xGqdytjzE0oerzQQdoKTZ02QdaKjf/1KcJKW2WFWSC+C/CllRGPTrEFUUJPT+W5cg28jSuMVvSbS09OaAnPTbsPxE5K9XsO4w0z6QgBcNmMAcADnEl29VFlENHY4J0Cx8E

DqcFTfnUzy3aWsnBB2kfD0qXOwhMaUgWMBCNJdLIWpNTS0E7GjvkNlkwmjbRNixSYDIUNpo2FDqYCyIE+6xHDeqOw1dPG/NKToH2JBtAsjwmRSUzJTrXgT4xsjAO5RiPXER6nMXcoQKClfCuRj2QNrYE5CWYRp6C2gW61OxM/1xIJZfOXyMYI4KXgz9I0EMydQKaFRhPGYpDPIqhQzWFhUM+Hy0FlHXkIMmDVw3fyonp2PE4vTzxPf468TLKC4M0

qK1IntA4QzKv3MM2tQrDPkM+v1HDMvnFwz/pOew2CTO9PVAUgzZ4iyUwbtGFP3aAfZbdhjON3m2uVhwCrZmmDS8JKum+IT5NHQ08Jb9sFwhCOGIIROicOx4IpG8q74oxXTHxnUU8TT1fWk0wyT126N02LD6VM+VJZT2I2DQarGOsE0tKoe2lmLsKUj/dNs04PTfiFCWKfZ5VM3FVV9uZWhIdVTmD3uphcUdSV2M32ls+z2Es4zmRCuM+/EGiOzw0

Ol2iPa06tTEFMbU1tTv3E7U0QAe1Mrw0BFc6USPR/DQ+ywPEtqXQU5PWt9EhL0RHScF8o202fDrT0Xw3vT4wCH01pp8zW9Pa7T68Nvtl3Gy6VcPc1F7wVvfQkjb33vUwc93304w2kjBj0ZI3ZTB4gH1BQASwCE9S/CjeUF/TeFDUZjE+3l5fDNU3IgO1VwSGxuE3jgOmegdBkFbNAupEQanWdAVsDtI/tDfSUtE0SjPNWo2R0TNf1142xePRPKXg

SZHCMD7BHc1dpE6FAaWtr8FrPkiD2R3ZZpSnCpxLB19bJgTClp4ZmyXb/oqUIRAHapZ5ZYUIM2KgT2xG+JEiwpTcgdymUDfPLcVp363jOT6RgWqSLoinK6EbBxCgCEs4qkjM4SgqSzzujks5cY1fjJUFSzfGU0s7bc55PmEmDwjxTSFp1dDvV3kwClaFkvE/tdz44QzW+Trmk4s45CrLPC3OyzvTFEs1yzFQ48s7xxIigUs+XMQrMiZXAAtLPmfc

CTpJ3vcTLlffaGokSAUABVyPYsUgMVY7EihuIU5k60fRLw3NczoDyrQDEhUiGoLSkQ27AzWnM07mWnoJPN0JY+ZfegfmVnA7a9u3UixQL1cL2gs6L+tZOgM+UZc2P0OmjgreVy/lMjWT0I6ekQsj2ng2fN9q0Y6VwDYpOT/b6gxYr0BB2Y1VA7GtcpC5P+EZ7Oii3lLY883KzC5TG+O5x/6QQVAuWHUJkBiHmS1rUVcGrEMDEw5ECEABqKfVEL6V

ATdhP74+igKCm7IKe5nFHSNdSgzSqDmD6Kb8VkM8uCIO04eemcOUlyOLRAQGP3+NZA7VFpRMZ9XvkemIAAOASp/HSs0bCAALgEglHcyBvj0RMs42YTdraVs+cwIEAz6DWz0OF1s29NsBykzvtQ7y0tsxc4bbOOVqJcnbMVFfWovbOhDQOzwaRDs6gAI7Njs4NCE7PX46YTM7Nzs65AxrzdiD4qtWW4mGuzFcAbs/gVW7PSifmcJ4B7s1pjB7Pjub

VcDED9MH0NF7OSglezXQDXszSg97N2Vo+zphOS4z3IV5Pu2rDlC9OK4yIzTsNiM4/1TWXvs5mwVFC1s4Fc9bMmzpYoTbOkTP4NHpjAc/hWoHPt6V2zbbKQc/Ct5LaDs9Sgw7Ojs6J5iHN341OzYnGzs8N56HNk5XlQy7Mz3sPAXujMKXhzxLibs3CwRHOhaaRzbvjkc0ezYbgns2WstHN9XLesDHNMc5ATrHMuE8HjgC1APpH928rMANnkgiKJnf

NuUZOqnk3s/2IuWQG0xZ3r4EpUw3VifDrySiAF09CixmnE1qmoCljz1T1xg2ME014z5eM0U5XjdFOpo5dDzdOu2UsAyuVQs0ackWgcNG+6h82yfmpqXJElo1GI7Y4pMeKTOyCpaZV5JnPUoCGCkBPIcy4TgHkV6X5z++MiyMnyI5k6IIB5VpSinLfjRfBQflNzzMhIgL1z5qPacWmKAzDXDDaN1a4NXKyAbu71VINpaWmiNf1zu+P6c8NzmACjc4

FczMgTc3/ctMgMOsI+FOgiyPNzMb6LczdQUf6CHGhC63OsMIThd5Y7c+3J89MFg7aT95M+WY+TwKWmowdzPXOCHMdzenMxE2dzF3Pjc89iN3PTcyKEs3OPc3wAC3PioEtzb3OiNR9zihhfc2H+G8XqApf9hdYgk+j+ST5Bk+HEAFVniDkIMQCoE1FzkWwISMQpVbRF4CH0AlgGyugiZ9jCSMuoNKXbvB5gYOxg+MHAT0Bl2uGSwRnUpRAuMVOEow

lV/9O7mcCztwNBM1dDTFPdSTHK60iCSPue9GWbkNHUTdi14CG9wiPs05z9yn7iorL1nXPM0QB4twoeDftQEDZ4oBGhFJC2WcbzPhiVDQ145vMpfJbzpfIBKlL631UzoOs9uR3YkYDzcrPI5aIzirNgcWIxQZhm89UNTvNwoFbzBJmh/Xlj2MPb02HjffZ1AImM4A1qbJY9LrOuU5u8aFXeBHri1SVmbqnBSAh1ncWd27x4GUZe2wPnxgn2REPEWj

7J6ljdOj8zVg5DYznD3jMBQywTvoPBQ10TwDMUo9RgpxK7Tc2WagoR1KjgTaIgpvXg7cVFs5QDgsmZyZM45bMKvLSqDXi2RBA2VvMvoz48SjCxQIAgZ10xrUBhLALTaRhzJzgxGA9kqszjZEckkgDbJOxkeiis8OC4DzB7OFKkUFwUAGlIoaA02OyIEe3+gkAgAcCeDWHzfXktoaFy4qBDuUwcuvmouARKXxAC1gYYUK7pLVPzUQAz8yl8c/PJYw

RcfuBL8488vek6xOvzrEqCHHTWO/OtZPvzh/OR5Mfz6sIAuEEYF/OH5FfzrQq38zaI9/OrIKsKT/Oh8/UwEfPhPnCgH/MleZcOevmYsBDCdyQAC/+T6/1udCwQRjJhcAhIB9A8cwpj7yNFHdONwAu4AKALr/P0APPzLZyL81XMK/ONbWvzq4IIC6I1SAs7pGgAe/Ma0GgLOggYC6fzWAue6DgLUTzX81fx7IB383QCD/OKKKQLFw3kCw1h7/Nh+c

O53/OBTX/zjAt9GMwLFrN4bk0VW9MaM3Hz28qZLplAjQD0AEsAQgCg0xilb12X4KtFgwjTvc2Vvc2l80IMpVIFRkW93z3Ro8tB8h4UU0jdi4NV0/nDNdOlc5NjNZP3ujtWhaodOP5S7MlNtJB8xSPtSPEzxVMzEyOTxqliQyDVd4PO2J7Yx9pbZNpq71T8VHJAbIBQQH+sF3FWoBWAFfby2LIgDJ5WU8/aNlNgQ/szgNM5I1AAgqMQ1GTuctgLqM

uwZOisNEvi8tg+TtI6izQwfLHcm6AGUkCSK2qv02MIevS9lP/sIiTi83GzHKVXA8KpDEP6rUl9wTMjcEsAWF3ps/lObUZKcGIIROi4aDFU9cR2Sq1zekw4bOPzwjX8C/IJbelPLIPoDXih87xjIrnxmKkoMFjpuBc4vYhp6ECtIqSRTRvzylYNVqHxkYF+uD5jvoK1UaXo0KhvY+qTk/OfC12onBiYpL8LFw3/C13Ma1BAi5wY6HjUuGCL8ZgQi9

0t9BjQizq2cIu/6AiLhtZIixQxgLA6+XJi/xK4+Ah0V9LZkTbD6jUK4zwLS9PNQybScwy7wF8LwIs4i1EAfwsPhorMhIu/GBkoJIvPZGSL8tCLUZxNexg0uDSLO+Hwi5qNo3yMi/ALqIuLs2ozwFNBc/AT28qZQCcgRIAOIvQAzlOp87vdn0yh0vGSWtS/Ei/g2P3F2pQ0E0qb4pDwiMZRBGsLVukN5rHg0dwWJj/95dOHQ3sLlwOJo9LzZNMftW

3z4LPQ4EsAJMNQs4CIvXSLsETo27CwM8oOWeAIM3HTI5EUyEwo7roj/ZJVru1j8/EONguXRG0YVNZ/DqKLIA56jLTNn8DRgqv1RYs7OCWLitZli9iLFYsTDFWLZkihaiiR5mawLh7zGOA+qrVD7z5yY2ltfIt8c8rjS4oO8H+jDYv8gE2LASQtiz08GLx0zQf8+ouk8/SRrgtYhJgAfMhVyGeIdyAKvVaL6Gh8XtHgl9afiObYpvYiJrGIj6C5BV

ZMVQgjg3NIdxkeSizy59nPiFYyAYtNE0RsQYvktSNjBwsouffZEYvlc1TTEqmQBm3TqWxchGVedPFxhbpu1jFSgSrD10mY3O9DYwAngNmBrXpsAKd9uYuG7SoTVAMFiwsTCrwP8wG5oXKczbqMEwzr6a7etYvYSwPtvW1Lsh88QYwiLoRLHYu8vH3YnRyQiK4zK6hv4zyLpb1PE+W9Aot1bnWLpEuBuQMUKrL4S4FE1Es0M4CjIeOx88FzhgnEqM

oA8UBwAMlZhtNFtjCVp8QT5GD4CXAboC9AS+LYFP3YJI3fCMF9/exFwtQk7S4dLrnjxBRtHErUoQQ/LuC9lFN4PA3zq02tYrXTqLnJU/6D5gMsQ54OSwAuhlXDXwgihDkxGmqHg0fNG32UNEPzdq2yhTyjcEsIS3sASEvCo/A56XSZi5gZlQA5i+yRQ5Nj/RS9GEsqUyP1alMHcTOgWrTaTkXgzAPvVAyAVyI7IqfOBJOQELOifqjeMWedHoX8nl

pDMt3AlZ1qwUuLgIhLkR7wI+fB5+YwgObIYvqqS1J83wgPaIhVWktp4zPV4dwp8H4QKtpeU+iiluK3i5ST2cNlk1ZL7Z1gzLZL34uMQ0mzWwEpsx3zGIVQs6dAoxLHhEToqvPxMugIuzbsUxIT97168/4hmcmpM/WlfNN9w7pSIabLsFiat+zU5Cra4GajS10cmtO8PXbTZQDDKpJL0ktLALJLd8PjlSNTZiPC8KzFlQj5aHqgifDlNP0Eu1xXk/

UIJ8M7fSMz3SEnNeuLE1Rbi99QLTMPw6NTmZESxsEE3w3kKTM0qFQLvoAmQ9oxI6o9KzP/wyHTgCMRhV999FQ/U+AjuzP/UxHTgs0f2gUyoJbRS8WGjUvF2Cks+ul7XG1LS1VLtuWBesClIjHwTmVuVZDwRnSviDj4Y4OxGuUp2GUroDFwvMOrvWbUlCPRfUkLFeMFw6kLGrrpC14GSwDJPZcLSJ7U5NVZzZMbRTKuvGzSeEV2nZPnzYU9x0uSIw

Pj0iMXS+6mgsvwRf5SosvgphLLh0agPL+IT0tHNaMz3VNvS1JLMkvIy6YjnTnQQFLGB9AJGWzB/TnjZipUHBZ+7MZSwzMtPbDL1D0mizwAZossWD4jB1NFRS7TgSVm09whCzOcPR4IsSOPpc9TOz2aPYRpYdPvlakjlMvR0w85vNR0y+xGbABuRJyAhAD5KWTuKOzjQJdMoPhlLgv0BmQOKU4I9ZScRdZMnZK0nFUyuHTl2gh0ooaihl/TJZN185

NLRXM+M3STs0vlxfNL9FP140tLyl5GQ1CzQ0gmdK4h0tW3mV9Z12ikjZITfDXoS68LKYPk1hkovYipKBTQzDAcRD1CoXINFaAcF6qLZGHepSSCoKRNJnJfDquWi2RIwNgYcYQgfqWog3kVwJaBlajOSKb4BlAPqDGcHLKerdeselajpJkAUkQ9DNBMDhysQTJQJehWQGEkxQojgEetIig8UJqM0ExI/O6y3vgiLmAOqbKgHMSAv9p+CD0NXGMteM

S2FgLcvL/omUkgqBows4LiQsuhHNHOSXlQ1fhZuD0MMlBiKktR/oo4g9/LxDBMIO8khVCYAHW6rTYUMPXAHLJ5MXXodaiqAltEne3AIOcNXg2gfrneC7MmvJf4IH0NRL+ubehwsFLhyzBNiEXAsfEnllHC9cAVwMCAi7gqQkgrNHjgrgbo6CsKABL8LEApURnA3M6eXIOYhigl4ZSAMrmd5Nidfk08YS48Uo3bfNgYToKbCu3eGQ3pCgsNPuQdDF

XoGTA0UDSgDcrnGA3KQi1HRByytI3iXEiwHA530eOo1PwaRKxc1cxU9tCsutYHDPfYCbDAUOGkh/6U4fNtRWWEtiiw7NAbCpt8XLYnywIY0BwXyzgEV8tjUHIo9DgNMXfLQoAPyw6YT8szLTUOMdgxfh/LCShfy4OY6qyEEce55cD/yy+ogCu7ip98oCsFbTSsoc7JUNpQ0CtF6LArdbrwK7GwzdGyVmJWIwzoK9FQWCsiKypCP6H4K1r8hCuRFM

QrWvBkKzOOw3iUK6KA1CvRGGWI9SggQYwrH9EDiYM8KgTsK3eMnCuESuIxPCssg3wrJDgf6NZQwQDCK8OYoiviK2VY2445KPAYx1381sHzuIuKK16+WbiCHHorhTE3MVuzOiv95PAY+ivCXIYrYismK+nAKzh1AhYruyvWK8botitVwPYrAaBQAE4rHI2uKxIoHiuZ4V4rWw39wL4rto3+K/Zti0Lno+wrIf5/Drx5eh2eRILQyTCxK/8K9kAJK5

RQSSt9wOwOUqBRHfoueoxZK6VcOSvOrHkraixFqJ5jrySlK1ZA5StmFZUrInOISh6ys77t2C3WJquhTtwLn+OOw6OLgounRD2IDStG3k0rurO6da0rybq3yzrE98tdtaFEvSt4rf0rYyRd8J/L8+0nLOMr0X6TK9H5MyvAK7OLvQwLKxAr0FZQKz3tayt3jHArBVBziYgr5RjIK1YraCvG6Acr/03gq8creCssDgJyfsUXK0SAJCsvqJIN5Cu3K4

KgVCtZAjQrJw7ZDC8rlhhMKxd8y/hsK7TRMf5cK38rzlC8K6MrJyz8K8CrQisiK0YrEitEODCrMitlwHIrAguh8xfMhIsqK5hzaKtd+Bir2isKEborOKvLGM1cQZhGK4SrZis8RInoliummBmr8UCUq9SrSKB0qxoBFSiMq8rRvR39rayr/fHkY3/kr5g/bdyrv/i8q5kN/KsGDYKrUSuF0aKr+yziq5ErkqtoAMkrTLypK7Kr26EiLoqrsDbKq2

EVyiBqq4UrTZglKxTh2qt1qBUrRBzOsFhYtSsBc7ajI1WdaixAFzTdoGdUs2iNy9egiY6VzsKRKCJBsxhSVNXLMgaersoBEthoO3AK2I4zKjb+NEL4YXZ4EjLLTZ1rvbjxhXNE043zCVMqy5gDv4vYA9TTtP1ayzhde9Co7lCZx2itk93m3MXPC46Eh8uYS2Uw9Svn5D64DquhztfL7StwcyhMXhwBKzwOdShG/DG8TgD4EeB5JwkzjYlAFIDdoE

OcdQB4EJPoMw6OLaYRggA9/nkxshXjMMp5qkAxPPa5jkTGPFrQ1Zh1TOPFAQN9rU74iFhyERfo0M1KQXzxUtDdsIJReTLWUOZEFIByALSqr417GDWripjBAI+kDkmViCpCzhwDiNBMMPztCv2trq0EqhRNzrBuPAH4xARFdd2rFVDeuNcp9Em3gqwO6ijnmtCCl/H/maj8i20NrSIcRABwALO0cWtnPDs4m23vZV5h74az8d5tmSSERgURU2kAcY

9lloqOa9nA8jje+VI1qivRUHZskMTIGCnA2eFCVjcMspaW6MprLkBXLTnoPugKAP4eXphsoDKwJRF26AorKXxSK4dQqgKSQWlRtawtiBAA82vvJZBqmgvVjJbcZvOza0BQAbwsQP21rW1dABF+Puh1mPhcCBU1VrKMKFxlQkXthWEV4QeO7g2Iqyl8jLY16DiCbCyKi1wRuQKp7M+roStSYsJd86yv5V1lUjz283AYYous/GFuNqsrrnRNBVCqa5

ERcov7OJprNxjaa1yrCIP1KJxyu1DWMN74xmu3iaZrCBgWa7RcVmt84DZrevxYUfGADmuAqznttZg8+RAgbmvBAB5rHohea0Ic4IpwVllWgWuk68FrF237nODtEWuPPNFrnWt5MhoZCWvKi6U8Ly0HUKlrgyQCbUd8WWtuiHW6uWtgGKRkaCxSjEVrst7uvKVrQ/jlaxErwCDVa0MJm/h1a6xC9rlNa+BZLWsm67FyMWtGsnIAMvl9a5xWg2u5Tc

DjHYnnrptzbHUTa/CtU2vfyzNrFzjjoQOji2t/GCtrQgBra6kpSEyJa26wZ8tCYFpEe2sMKAdrNLpPDidrFeH/mOdrtLhqK74BSw4uRHdrjIiPa2DBH2uvay68DvMt619rP2v7GP9ryyxXjZxxyhUg61JdYOunrPexRWHQ62cNsOs0iQjra/hw9hSLbuiLfH6s6OtdmHWIWOtsHbjr5sxm84TrJ8V5+pjkigZ71gnB3LkPE38uwjPsS0pj1qtKa2

Tr9bij+Y6r6ms7uDTrG5h06xetcJiNYUzrhms/oWzreUkc6+ZrlmvWa+VCAuss/I5rxDDOaw75Dy0S6xTqeIjS60kUsusHmCJ6+bCDforrQ7EQ9m4YWr5FQUnNSX40oJrrsWs662TIeuuajaFRoqAIGOig/uuZa8Wk/Cw5ayQCeWvW62H8tuuTRO/A9uud6n/WzuvMTFVrybLu6y+xZID1a97rtujNa6sC/utYHB1rXWsaGSHr7a39a2UYtvGoY+

CJ0evja/+juBgJ6xVrYG6za1q8j2tmsDxQS2vEg4dUmestoxb5uBvbawXrcyyemCXrR2sxGJDrxWHSGFXrl2uwqzRAdev7fA3rDcx09M9rlsWt66yI72vYC4E832tbPr9rDzA7+b3r8E1ZFYPrc+vcjZFxY+uRnBPr4osmC/Dr5dEz63+Mc+tiYbayrEobDcvrmOsd+djrChXr6wirBOuqrCSd+/kBk6HjYksHiB9Y0JqcDI0Av83wQ2ASTJyTE9

dM4Y77hIFTvN034IcyGgPwYKGUOXO5c1bZSAOxU0wT1dO8ayLDgTNojacLv0hLAE39q8uy7UpwMUOeS+BLc7Z6ICjpA9PCkxvC67B8XuULRdVq1RPBq8A2Hv+IbmALooaiIdgRYFMAWuAx0O/CgiAKlZWAGuDwnsA18zOqla3VZJ0fcdvKbAC7TpgAwwC8NvXu0JWYpQ7IxoPQ8SUQhUbVJVjY7dh+TkegY+7PSsUisTLg3cFOScOHsNbqPJyrqB

iBFEO/Mydu7RsC7UrLKQvdGwtLFgMWNmO8Mco6BvXF0n74BWJAW32KRjKlob1IPYxdSUvFPQCD9wGLG5ULaoYqcCQMANqTCLBAIB7glvJApYSkDLpVr0B7Ii3wTbQ9C6jafQtVTZ1qVcisAMZQeNTXHmgTTGoGZAyQK6COnOia7yZMxg425noybDpLnJi+qGv6xtk+iw+L2wtqWLsL74vxs6NjgcpHC9WTkYtLy9GLA1NSw7Muf4hG6STZ9cOcU0

JempkHUrat/eNSE4PjFqoHfacMygAUMNG9cUuxvf9DiUvya9gzMKANfFGpKNCw60ALVql26MYLDwC0S12LM82MSwahLyOsSyfrdQNPkz6b4yS1CTQwAZvCS4FzZPNl1mA4qkCkAHsAJ4DVANq0aFO7i1pMYlj2xmfw2/bX05PCDKm/3BM0iRC7ehTkdXFI4sYG3ouRiL6LovMLpuqbz7Wam5+LS+510zXjQDMCa+mjGVPWA7+1mvKn7nDce0t08Z

o2Sh7PogrkZrEmy2sl0hORdI6ba2Aum+FLxDl1AN2gFenHVOQQyhMem/G9RJtUvRQqSgspfMOcqfjMAMaC+XxlREebpQmnm+ebNsX5hHRL3YuRm32LOk0Diz4TdpPA8z8+8ZsVyBNk15tnmw9CF5upmxhr6ZsZgR30HAAagJlAwwBagAWbJmWvnXBU4vTWCcaUYgyP3YnQ47qwdCUQBuXASMdG2KIcEl6LOJXKm26Qj4ttmx4zb4sdm/sLoYvam6

SjP4sVXX0baOhLAI8DULOIFjXgzZPYaErtweWa2sizvDoSUwCQG5uYAFubIj0oS1bt3ZMyjv6AVcDuYMFs7tmoMyKj7bFya4z9JJsxumOAkeQVwApbVEHvmI8p7GRKW6QbA4iqW52LgRoRm5yLUZvWk8QKiMO+E6J9DpPifZZ06luNjHm+p76LrEuL2SlxndtpH9qNADNUbAD6QH0TzYOFm5FslTLI+AjEsSHWSsAuoHWI5KeEXA0axk8hX4ghEk

20B17Jsc2bKpv+i91xrRsHQ10jEvPc1YiNJKMy85jdTdN/iy3TIYO8E3LkocN50AqppCpfkaIIVdjjm3ObgUv4vegAYwAiW2JbmgASWwJb91RCWyeiLaDgPi2gJ4DxADA5DVsM3QlLe5tem3Jb3UpV6OrCtCpOccf+YW4n8zYUw1seuNpbYZu6WwxL+lvPmzKzg4tIwxarimN8CzCg41u0euFuEujTWxvT1YNpmyuLeRvhxPFAdQBVyESADsJaUH

H9pYTyIa/jNeYWep0csay6IA/Y06C97qrUtDQZhX44sxEFbPhbfotPi/FbfMOJWzt1GptkW1LzFFvpW67dvRvy8xlTW4Mia46hX/1k6O9FMWQNtBpGMNxxgwdLMEsHiOXurVvtW51bbptB+hFLHfTVAMoAxAAtoP+IxwVdW5PjzpH7m+OTlmofa4/WjmyANtgLdNtkONwzzGizWxyL6z0LW/6BH+N+E8WD7dksoLTbrTb024BbCRMgU5oznWrUKv

QAR4Abm3tW2H6QBMvIseDRZLM0stQ6SFrZXTjPWxhb6Do05NfQaza5499brZtqm8RbSVvBi60TxKMAMzqbfZvUW5DbITPsQ1Czp2kksHS0Gmo/VYG9ZFrN2FBLz5lPbDyjPDZE2yTbh0o7m8OT5X0G828Le2PoABqAOgs02LQqccwyoG7uodv4C94gEds2+FHbOlv0S+zbvYvMSzJlvIsrW7wLjv0h22HbcdvaKpHbWcBE8+plGPWwE7kbRotYhA

dWgY7zAG9QOVttzcXYLUwzSFLG53R4FhKbukhzRQWm2Aj77taV5dqlYiXgPznkWnGiHrSdBHZFbMZwuTGzhP1ca4rLxXPKy4ibC8tgs/qbiuBMJcObSXrTwrBlyckq+l+RC1XuU/5Ltpv7y6PzfVsHm5ZqLBuyubWsbbKKG488yhv9MHGkbB2uUKeYPq7crOZh7wxPQp0YvOO+bd0kQAvXKXFRtahkmOfbEvGiNdfb5OnfGPfbFziP2yBAz9vnpG

79Mhvv2w5yZNoI8BzKE+6H67eTS1smWw+Tn5ug87iIruuBXF/b823+oL/bVR2p6wA76RVAO2BuD9sO4U/b1Ywv27WMCnnoayLbhovk82A4mVAtoKQA4rFNBGTuJB6lhMjYYgguktUbk+aF8OvASHSh9OeEPdvVwi6SqWRiy+GjzQhNnrfdwRA8sQT9672T2x0byQtdG4AzDkvMQ2XD8Naa4EjWyfAq3CBL+EShkFrB+pRDWLJrgdu5MRA7etAenC

sMPvJTCf6JCUFSXIBMES7Ubd7kvDAKpKm4ta6pKBurHDGQxNFQBOWzzASCYijAUMAbMPyumMOrU4uYsCcg0VCVivo+ZjuPKFmkVjtsSW1hZm0MZA47Bg0MAhOCZrJnmHI4BKueO2c84jBlZfY7CLypKIE7JALBO9CroTs0oOE7PFCROx3Je+vwOwVT5qs822ZbJYNIsr6+qRiWOy8t8Tu2O3eNTyiBzI47sfkqwink6TsJmB478bIXmN47eTvn8X

47QBs1uEE7Ffm9+faWS5PioJU7iQA0O84Loturixr+7lA8fISAkZOeW3ytM5DhkrLV1BRKIK3bsgOX0LKZkiCBo7z6IpHjsGfds72KJRoWQ0tDS64+cjuca8jdU8s8a14ys8srFbXjc9vJsxkLgqUw2xgQ19B+5RKl9GU98zQukWi0hHiUxjtU2yzdc+On3DKL0ihZ/JF13RjFK/uOHRQc3tQo8n2pKD0Ms7LnmEi78AIouzmK6LsF+RQw2LvSKH

eMNAZBUpuQjztfWTeTV/V2w++bgKUg846TmfqIuz2IyLvktq8YWt53sKS75LsWUSs7+WPVSx/aGoCDAHAAvwCYABqAjxswW059+mSSfpLGFsjommegfqbu2oTGTRLI7EvIMYhKNgeg17VxLBJA7sngLp6jMI0dI7ztBgPca9ZLM0t8a8wj89sZC1mlzMl1XXNIOcS6O/RlsvXMlQMEjRIwuwfbPJUKazckIOvJUG2sq4ZKrPEwq2vmKDWu6SvBrb

g7ReGhoGobU6uwbdT5ZQ6HUNACgb6x/DJCKi5+u+HzA6yBu6NUwbuaG5igYbtyqz/bUbvAC21hXr41USJ5PrxJu0J1ZQKM6v6GN0u0u42UXvMlvYWD9v3+E1+biQaxERgsAbuSYdm7pKAhu3m7b64Fu/WoeDvRu5AYsbuFbeW7z8yVu+Yo1buCuzHzIgMAJdkuiTDnMNh+4PCBGu5lTwRm5W60IvilxNB0DsZM7ikQSnaBBF4E5AwifCa96A0BEm

pZvSnUmWqtVFPvOxa72RpfO02Nqjulw+pplXMRbHGLfKoxZJMjkubkWoSNa0bUDEIjQpMEm+P9JjvXg8HbrKBheaW5paw9DImbviszXd4rc4ZKQvOJRIn7gtLWyzCFuUN2eDCOim75mRXlwO8sTrWB88+y0Ht3jLB7XVwpoei4SHuBSSh7ggJoezucfowxGDh7K5h4e4IqHy63hCdevOGNu7pN+qNMu/Kz/vMWXd64RHu2PCR7vilkeylpFHstPM

h7wUmoe/bWdHvvdoOJbFbBFRXA+HtZG9f9Bos6Q0z6YBAcAE6bK5vURbAlu91m9uugAxwp0C899+BSmX0Ia0C4XnUa4QSwdgAFbJxl0KVSagx8qBeQgTRTJpEFJC1Uk7Cb0L2vtc3z9ktMI45L6jvbScczZxHX2D6pSYtYm75Gkqjvbp67cKNge+kzUiP809bL1kV7UnIgtnuD85YgjOLQLkbqLnth0m7LHd0nNbybSAZ4hMSoxwUpy8w9izltM4

/DgSM3XEksIDweTlW2wvAntZjGvNpucLKmbd1LU89L1TP209mbuZv5m87T5XuD3bqUUWi24pkQGJHNOv9LbJwHevPUWBTiokHTeGkFy69TWj3Fy4c9pctR0zklf1OO8JXL5z0f2uubm5sV6UTtLlO73bzzRrpmJgdGE2qwdAX61ca5Yg6V6eOcmGcAcawToGB1a/JtHJFoOBPoVCdV40vyy2a7U9vTy469Pnv10z87ZXOW2xVzCvM3Q4C7XwikFk

LB086PiAEMCRKBEKjbpX0c071bMXvJS/1bmTkZM1up9TUa5gIggQTsEsQSj3spJs97CDuhBAGQ0kC5e2GVlZFdezmbeZsAS9MzJtPHU+0zlobTU4szOcvQyzHLFPtlAF4Z4FuQW4QA+1O9NDMz6csM+02lZzp/qbN7Jzmh02TLySMly3CIOzMx05t7WSNYhNVboluDgHVbAcORbCpYQVIRtKFwJkzJjZfgmdAGOYAmzhJOZVW0KsZhcFYeFOgCnB

HBKHSgopvcBltuMXQTE0sME56D33sfO6T9f3u9m8+7nBMskwrzksNQsz9Kup7Nk87NHwOYbBcBfDvRe785cLtEyFVTQvvZM9ZFxvvCZqlz67AsJsImsazbup1NNvtzhWQ92FQwy+z78AZgWxBbUFt9eyjLf0tj1BcWQlgxiKD4H1XC8KX7Ktrh0rUI0ctVMx7LOtPOW9n4blsUyIX7fssrOdbTTiO/1HEjwdPze+L7NEUfU1L7cQhly2t71Msbe1

9TVct99pjbVchtWx1bqvt7OyZMARB008qtrj5wVYsqMdCZWCdNpT48rvL6Y0tjAQU++/t2+7GjHnt2vXe700vZGm77dA0pU0ibTksaO5XDRpsy2GHUweWjG+22n1X44hZl8Pv8U4dLLwvEsBbLdptWyx5S1kVjRkf7rQCH+49LmfuxNLbTnXvKOi5brft/ad9L/d30+5V7/0tpSiCirgVC7O5SUnhT7E+iz9TY5vX7nVON+3Zgx1unW+dbu0mIB7

N9yAeoy0IIiqYEFBYInFL2OOEjYlgG1Lzaq8irlY4lmwVqPaszJMuJI0t7uj2j+z+l63s9ReA1ffZe28TbpNsL++zAnzS4hXrAVS7K21+IPhLVEmgo1mV97kiad6CYOE9bXWMBC3vm2TGl2FA9H3ul4/Xz5/swvZf7Vrv+e6+7CvPsI2D7lvqRW8V06Cr7gyyjJtg1oj4EQ40684kzS6kyW9y5EfsbqWdLWTO1fUl7RlR/HMYzZXRcZRbimmT9lK

BirdZk+5uVrWgnW2dbC4nkB6V7Yj2m04L7P3Bd+0szq6Xte+7LscsXwxLbUtuFHOExviNpyzM9qQeGBUz72ctrlYTLD5XcB/37pMuD+5szFMure4IH4/vCB0u1nWoiZMSoVqrKTCnzfgtYhZGQinj5M3eF23F+LEEsUptuxgbgKKN6vcdcj2kV2JBI7gXLQUVoO7sbwLDDOzHxC2HVCjtwm9PbTfNmB2o7FgcZU5sVbkvnu5LwT2I/Ks1dIyCIxA

epGKH4myizj72KQESek42s3eJD6lO6Okh0XtiKRpAz0kBu2ApwFsFKoiX0fqj0uLnA86AAQ6cbmcvnG0IDYDVtBx/ah1b6yQgAa1NO1Wr7ywuPPvd7QlhiDJyTo/QT+hYgQ2ZnaB3WMSy+GjGI51qmZM8hkKY0qBdAqwcvi1kZnns9I7C9s9uA+ycLVttnC9SVq0uLNIIkndNvagyVHC224kcWzbHXBylDfC13Bwsbt4Ps3XZgGeXwaIaiMuCa4J

DF6uBaoNsiK6Jz0gaG81oAHMFstZ3Ah5LdwEO9C1edbZlq6h2wmAAtoONkz4CjC5TBfQdvoiFYyIdjG34se7SmyOWAyJbA3X4FQ/IT1JN4xeD0Ghu66iCp8CCmhf3PO+SHbRtn++a7F/tXKlf7KI0e+8yTQYNnC8WGttvm2G5wONgaalxpf7ukqcROxjuv4EQtxJuH2/JeZJtCh9rwL8LY+kgiNhziEqyA3DI0YPJwyZB0gCcia9ma4HNIKodmVW

cbFlXWUxqHhEXbyvlFLu5JwEnAVcC+C17Szxu0tHDwb6Z88PHgj8pwsVTtp8QrcJugpiBL9mjSEIiT2ijGDntTWrkzj4jTeMcmbOnH+5OeCQu3uz6HJgd+hzsHL7su2QrzIyMDEzleQlhgOgSN9GU7Mf2N1dRqWKUFfeP99Yj7AdsJh/cHZlmPBxULaYcf0HDV79We2HBUYEDGhu9AmoZ7IgcihXDvVOpemobTQH+shqJANaqHFUvVh10hEsDfcB

T+EEf4yZzBVuUdLloIRWJ12A2SM9Q6oKZpkACfwDKg14C4IgzaaEemYKKgY4Taassh3JtOW6QAFACEkKIARPV08+Ihz9Q2OFtI3CSJwcWaKeDZmXwgygrT1WwksHRFoDnwP26NmziVzPJn2OjgEZBneiu97Gtyy4YHk8vLh957a4ee+8GH/RvUo9vWz1XF2llwzKPrZA4HwoZjSGbYVwduBzMbIHtXh71O1CjIGGlIkgCeKHnMVek4HFAAjCtDoA

C4fatF+Dh1PrzSKnnxTbjJvnpHoJgGR0ZHu/HmALBQagDmR0kkfq5JudZH5Sq5zGitFrClNgES5nvEsO3Go8PFvVx7xls8e37z/HMB86SQTkfOSIZH1XjGRx5HZkcNqxZHojCCK35Hmoxl4fZHyYF7W0BbB1vl27ZVdqoaAD8izlVoE3J4UXDyIomQyz0T8vEEkmbCgQWTA4OMnKpGump3yXc7V4tTeO60qpsxpZ6HANuV9Z0byLndm3ZL/3sW23

SHwPsZU1mjhwe8AJdAbgiU5hpq3CUI6X1gE+5eBPGH/IcKa/VuNm6sxJ+C0nFgzdtH+gI3OHtHASrHXHlsPcbrPdyL6dsxm7xzp+trW1ZuEW67R57CgcVVgzajtDvAW9ipB4h1AMLNs6LPgBiu8Id8rWQk58rx0sxH+dDGMSHAqXA8CLDS8uROZY6cTUxUFPgW4zQ8sXGib6Ln2PTDinGl9QNHnNWUh/FTcX00h2kLepsZC7Nj24fvXs3Yw1L5fS

RiJN0HnvzLrewbR3HUsXu0A08HB3GjqIjFi/SR4KED/wAWhRFgH1R/pBnlGtj6TrtcdsEuYBybFk5VS5hrH9qEAJaqakGlYADHtxDLCwzhIftjQYY0oZaLsCCihYcLtr3W5jLoVedJiPAOlYPbaCIzdRHckBqR0KdVWaKV04o78JtO3f6H/90Hdda7fzvqyyLVJMf7AYVo6OA0pfhE+LlsOqmoDjh0x4mHfs2qU3cVD9Um4E0uIdhw1bSQF3GLAO

CWW1l2wcXg8nCt9nDV00AytAaGx9MI2hWHoIdVh+qH2kOah8mprU7FgLMAFDDJxy5VRDR7G0nwHB60bqNJ4MfFIr0oRlRWxrN1KRC7hG+mC0UTTbL4B+Ig8E/GSktHKmPLcU4WS+b0U0srh7fZkkdBh+LDoDNN48vbQ2z8E4K6jNMaweyHCyWi4tPCagrlWxeHVAM6RwzHH1pMx08BVVvglimewWzA2m5gyMUBYHFQE+41VEFgodiaonPiXmBSaM

BHkIGgR2LH6ntq6tUAPAwIHifBDC2lG08kbdt+CediUPD6MurNkFJ8ahgo9O1nThJpvSgRlnrHfIQiJtQMInCnTqcc5kuLh5ZLxgcSR/jHqsuEx+rLPBOzR9PUZP4RR7GVtbESgUegMXAz1D7H14cx3YzHd4cP1fPBelW7AIyArzTytHzHuGiBkOq0eABHACuizBRq4KZVWNVqh5ybNYd/leDU9cBjVN2g8UBXXUTabYcBxtY44VSg+AiACD2tnr

dT/dYYONwIvzloLWbq+1wAHB5gueNY2KbIXRboCLcUpsfVIt6Hzvv3u6uHCCf8a0D7WVuVc4w1j/v7EEJszGsUxyZAiWQ8JS2BABw72+eHevPAoKIpE403h0QnqYcP1QQMRfRGIu+S75LicEY6F2IqcJCATmB6WCrgM9KqXvqiDiJe2CLH0IG2UwDTYDgsQI0ARgBrtdpOlUfoU6L0DWNk6JtkjDqB1UUUjoRYEv2eNFqTB3pkzDhTFuiQtJC54z

BU1+w+qCZoo2ydx0taMCc9x3An+3XWx4wjtsfmBxuHGVNpNaPHPIbq3GkmlieOPZYnfQT2PfVxJaPtSnFsAocKOveHEgA1VBnleABJ4j8VTwDK4KRErVUI7uds5UUfTC1VQEepx4YF6cfsJ5nHtYcy2ZUAFex1ALj+6KUvnTNF6lwedMlswqjio40IFcZjsDwkB1yJLN2e8R4xED0pPs0uQzxHaxQiCEcqKMb+CQNjGQSfe5/dTSdam2T9/jN7vb

SHDFP0h79I+kDg/bbbOtrqJu9FRNky1dgUyq7zxzyHJVOK1XPIu2Nx6aWov5ClwOKDit71gGxRCSQtoXxjz/GVvMdE2a74pyYtw4KYUCSnU6Rkp8r8FKfUvDMNNAadjEo275l46ND5SDtvm0DzzLtoO6y76q4k4QSnrjAF3sSnbrxMpyveUw2u6FSnwturO3Q7GZu5ZPwwyIXPgCRAswBnJ1kTovSPhCXgNeDy4L4ajMHTeHyoSZXJlnDwLsmDSV

3JbGikKUSThkZSWCBiW5DlLm57jIETy4775ZP7dV+Lc8vHC1CnU0c+VPpAds3WB7S0xOABtOOb7sefTLyioSPBEKMnFg7nQEDDcemHRzwsYW7WbhSAd5s767DELHrldMHVL5uN2dFH/Ke8e3FH/HtJpwmn8qdCu4qnIFtgOIQAS0Cq4PMAR4C126TDnqJXi90gEk7Q8b853qPY9IIgzdilUn1NU+Cd7qaFhwOeyXanpVIOp4PYN7u+9sDbptthi+

CnnRMDI5lbgmsSqfpA8J5hh5oOhylQ+xhOCOlK+nZoIEsLx44nZtj47FEL1Nsxuved4qCggg3ARFChKAX8ZUSHpyRKfiinp5Sq56dEKQpicMRKYio1gjPH67dHcZvoO8oQl6fHp/XAN6cqgnZblxs2s9vKHbD8o1GNpyAjXs8NbgQIOmpwCD5iEgv6H4gDgC10NyZUFhfdKRBt21aSLqYl04BiZMBDffBIbe7Gu9CbdgZfexbHWwdWxwPHaVPQp2

jobltt0zSB40BRVHFDIyCPiKhb/Slbp3vb1+4EIk/CR8sZIOsY4SikxOxMM5irHZYuw5jNRFCucG1LmJkVP+gMSjno7xgpA9xnuQyYjPxnMuqsKMhYo5giZxhtg1bcFcsw2Yq+a0L5GQAZzd/9mtiJjU2F9TumWyy75lvKEBRQutGXOHxnFUI2mEpnTrmqZ0VtGmdejB4U2mea+cKg/6fvcSrKmUCZQJUAxWQ0+zgZUs1SmR4h80ZH5ehez8H3EI

5lC0gnSV44+lSDWAx+s6A//TgtDr6ABQ7GOV0jp40n4kfNJ2RnlNOzpzaZ+kBps07HmvLcPK2U37tB3fADK7ZrSG4Sz5ssZ+3DAOoHaPU4s+O7Ix4jSjBjmCH8vEkBsI9NpHnmzB6yWAl6Aei4Ss73pBqkzsAiyM4AygDlUNigConMztQbxK3LLfjFjhiW+LJn4fw3OEdhJ2HhVl5Q26H9DH5uoISOuqCEHVAZfKWofyjBiHM8Uw7xnAzIYsjvLD

1tklBFrFMYq4xbOE1looxOEWxEV2ef+OB5SaDvLHwVYRXDrNHMFlGkABH8YtDnnFkwuQoLefN5c2dZ2S1nUK5tZ6GJD/HM679n3WebfL1nUQEDZyuCQ2feXMzIo2fjZ8wA34kFa0strt5rBDtnBYyLZzNCK2c5iWtn6SuWGGrIW2d4544Y72f7Z4QYtEBHZ6AYJ2dp6Gdng6yXZ1YAnazRGLdndUz3Z7Qbt8x6AM9n0lHJMO9noRVa0F9nGiw/Z3

9nI1AA5y1QalEViuWKC14OcnW+KWer23XUl/Xv4xnbDTumZ007yhCb6H7grWeTQuZzeJhm1gZrXWfEgvDnQf6I5+QChafgvCNnY2c40FjnNuszZ7jnc2fyfRZnk5hE51AV3CgoSY6W62fZwJtnlMgu54OsHzgkO/TnQ9nHZ7fodfjIUCznF2fqAQLnwIvcjHdnIfyPZ/lQAufI0eU7OnIyjG9nAazi5yrhsOc8grr8H36oesqMcufbZ7/NUfNOCy

WnH0c6ZWA4POgdsNgA3aCZQGMAqSe7OxIgddg4bJGQQChCnNUlevZ5mhYGK/L4Va3YWPTchGNibzPg+URwodSGvXUnvKnqtOWAwtnUkzonvof9x/ondseLS/e6B1Rt07CWidGbSypHSfY9yHDdu8to27VnnoQvVt3TqPuT3PFAOQBPDI8GSSiX5xwA2QasyAoAYsgX5xcMoYDLtJfnxADX58/nd+dsyI/nN+cv52zKqxaOCWQualhZ3ADz3Hu5p7

FHVqtJKs/nH+ciyF/n9+e/58/n+gCv58Wnc7trO4dbYDinIO29UABYgM+Ac3ppJ0Z6Stw3XImQ6YW8veheqWLkDLfmdvahGrgidjEj1pongXobB157WWfL5+0nKQVMU/XlSvMw6X5w3QSyIsY6Cn4cW5in3R6b5tEEJ0v+x3QDIx4roghU7yaIgDqiAxnGFswhwnD3wrqghHwMgKREwtkghzsnoDW41ZCH7EbXGATF9iwOs7LHd4huyb1HlpQLIe

t64dCcC1vEOdCAiL59/YdBKuE4MYVaB8/yPlvZ9iJwFsjW3VjHMJvaJ8RnP3v0Q5Rb88uQp4vLa+dS7YVnHyoLvF0gZpv7FdEXt5lsWbYIrNPFC+llhUws6A8UEyfyTuSb2yAh2MrgKjpiW6T6qwDytLRuKnDV1ayAbiBryHFQy6DwaOWHrCcgRxnHN8dZxx/a9ACIvpUAszmYrgoGVIQs8qtH2Z3yHh+ICzLzponiHJQvWzyoK9wvQAGl6MyMB1

9b4NiIxG10xlLHdOPb8jtvO5lnoKctJ8WxPRstjQObvqcrSwGnWiAC8FbAUVQzIwr+bgiclEULw/OLx+g4vhpaDo1nrGKcsOHzq+gJu5vz/TDVi+NQbHUwpCrs9M7fCVsYHyjS6jTqUf7CZ/TQutE9oY+KHhwFKI0GMqudnIgdjq6VrH1RGxid5HPoOHU1WLnMV/HkAL7O5wKJjDZAj1VK/bcXXED3FytzTxdF6Lforxdl+O8XaUAJfqIs1Oo2mL

8XGnmNnBOYOknFDQnoT4oglzWjYJchMBCXi1HQl6wwp+ERvLGEiJcSCQ7zWBzlLeiXppOI5BkQoaJAbFU2XNsa5yZngqdmZ2J2Kf4miE1hghx4l1ARaaSBhE1YdEEkl3aA/mLbGOSXbhiUl9sov+hu57SXMrnKinlBgGtQDuCXLe1Ql4NCMJeclw8w3JfRUEiXfJeol7349Zbl5wu170fFR/Q7vmzQmlAAI4BsrRiF8JN+VUg1cPvHaM+bMxAnTj

q7nj2eklbqPjhq9JhnfCRqaC87pA1LhwvnfcdDJYEXDdO3+wF7x5n66MNii2BClOvLhLk//TKu8QRY2Ju7rcO686xnx+fhh3unnXMsQAZr+TZ2AEno+STEoObsz/jRu9tYu7MkxB1Y3xpN+AAEHADleDOY5EmdCZ7ywIzmzGTevsy+HPaMFZwngaSCTlFsiYhhJ4EkeYKw3zjGoH8O3RgRfgkbcSiIERMM/+3boWWrNbUIrH3rCa2A/kVQDoHS56

Jz0OEewkdHBGNsAAFufVG+fre46+hgmBEBRIuyi2pn+phZuNn5MRRC0Cu4xABQ/MqwrzCrgF08yzjcGEy4EaALUPuXdioRtouXtL2A+fwE6nn6l2IE/v4BO6EYWdkNl/B1wWAopOukbZcKBOiqcRitWF2XnERVWBArsYRmGIOXZEkFmCOXkfJjl9xNMutTlxuXxJdlKjEbmcCLl5dEy5egimuXRZh1TJuXz/4IEdehu5cYnSeBIntjsvBNU6pdfm

eXMlAXlzK5H4KewtW45mu9QqeXMjDyjC+Xa6xvl48rjFdflxyKvYjC0ABXjFBAV6QwoFfValMYkFezlxDNeoPczAKgG/l8BOwYfxe5+BIEaFf/c4Zbb83LW5rn0pfa5/J0GFf3RM2XOFeql3hXnZckc92Xe1i9l//42gQDl+WYbgBUVzaYggA2fnnAE5fea10YWzgzlwTnky2sV5ZX7FcH+JxXMTzcV//ovFeZDduXAleBRHuXwlfBKaJX8k3zmI

+XF/jXUc6wOxrXl+nxnOuKV4+XylfPlw+Yr5fsu/UwmldxXI6IOld/l3pXS1GzUKuA8rjFQMZXEFd6UFBXZSppV9sol0TwV7ZXVJdtsj12jlduw2H9pduiSyVHR1vsrU2AMACz2Vu14dDqYDfs8W2e1b2AlBb0Gvs7KCrhop5KEvBhcOpcA9s20AEEEN1H4tocNNVJlwrLfhcu+8LDKjt+e7sHHSe+p5694RcOmc9ABgYtw7GVyCnFWwV4QKBv+2

eHHP1Vl0yEdXFc0pxnUgZkVqno7EQ4BNVEpgHwVqlRtIsC1omggVEEAN18nAS4ee2ouhBilD4RzqzXDmL2sBwVAuxQnUSG4ehKR7PugmgY6xh6MNVQ+uwIV9/RkTCkoOkCC1cngHUCSg188ess9ljLxYjXPNyfCXEcvGc1ROjX/YbOwvCLUTA41451BNemwETXYFhi+b0ODe1QOyv532POrnTXOrDpMIzX3FDM10SYrNfAYezX9le3dsssoIaPZf

zXQpcqVKvEqnxKdhTd0ZvNu7UDrbsfp6YCQtcS3CLXQVfi18v4GNfqi3SLMtcXgRwEj5zy10nY5dEPlp12ZNfmfm/b6tdkmJrXjDHmLgzXE5hM15cwLNdJ+DKNpIgm18EYAOvm1/CtltcMrSXbORu6F332VcBWUN2gUtsjgM/HlEe8ID/ctGYh9Ayly7z5FOQi6vvMGXOgu17tEjpIaPFzyLO9QGKKVIOn02Lw3fOHb8kup4LDuMek/R6n3zsTR9

6nRiccF9Dbf1fPVed0uqClZ60s0zoI6enwAxLGyxinJQvCF/REsPiMRBPzxTKm9ZebB9f3p8x68MTn2nUai1t8p77zRqP5p0uKEsTIUB5nUtmwhtXnuWRQAEnAxSn2VdnY4V20w3MABI4UxV6jKiFIDeMiqSI/+VZMVcLRcA7FL2hmsXGi3dfvEqBijqfpZ4tJSjsjR30jfoPTp3LzPqcjcFlUO+4rZqA8YhmJkP7ZW7Bh0FKFmkfAe6+Z29fw8J

KWoMOMvXSMVDesiw+n6adn12rnLEuO12xL76dCpxIAtDeoFytXLgsYF7lkmADyIKNU8QBD/YRaaCJKdu2FZ+bUxa31K+JuCPP6s7D7u13CQ/JPiPSjqKcQ19A3A6cn1mBi/p7PV4VdI9fEZSLDtf39myAz1GD6QEvb7JNsoiRoknDiJ7ExgChFBUgiuZlRp+Q3IEudc2NUMjMuTdQ3RTIuNydQbjd0NyfXT6eZpxfXQjNvp87X7DfoAJ43u40dMQ

/X1lXiBkqnhWDH1KfowwCkALqV3b0qIXEEvlIUIt60h1eTwuDYZ7wshGHQvn2ZWPoZDT5jppijVukwN/anfddaN94XhGf/M5Lz46eg2+GLF0OGJ7lnrtn6QABDtttFND49YhmLC1+RHtqRBzabDifQ1xFojje71+8LlaPmvMKI4no/o+M3HoiTN8fXimKseufXEpc3R8OLd0fZ2xjj0zfARlw3Bdc8N2tXYDhVAGyAl6ICKcYXGGjjmVrkSiBII5

acE/JSmRDYSq6RkGSFB7vo2MEQ2dBX0rEQcxGSoe9ZqWxTnQCnzZ2+F5sH/hcrg6wXX1fsF0e91+0yHudM5PUI3JvLQfsc0jsGb5T9N1DXR+d0RMpwFDcrx4/uxCcgxaMqzfDukFissyd9enSeTDz0uMbiNaIN2ISIRiIS3dsnUt2VS8IDwrvsRrqHU1SQU/6AEs0EF/94ByaSTlFomg5dkhZ68Mi+s5MgGTfVRfrd4V4PNS6S0oHiO4Y0tDTpxK

Igx+KC3QwXL1d/N29XHZ3ZZzOnGxeYN3a7eU7GJOeV7/0xQ4Bd8TkWJtho9icIt6Ij1+7DN+kX5J5TJ+gAr4NPAIrgljQa4OzHceAqOvxqCO7QxW5M8kDKQ+5g0SegQ0RHg0MsQKAQYwD6ABqAwtnwkzuwjqZWMhL4PgQOPTYp9J03XLzaZibBBZviUeAROPc1u4Qj52MBPMt9pSEQr+CHblU38U5G20DbIYsg24cLGZe6m4Y37fOSwPpAVgez1/

Q6N+AxJTwj2MyeCcHpHYWj8umLuWQQOFA4MDhDPpJbaEtbLrV2vjb0OAzbZDgokbTB2hytHiTKDtc+86TN/Itn60kq59uRN7En0Tdlp/w6ygAoOc4AWS4cAEnATFinICoyzgBniFTcT1gBsS/HZpT3qlJUBZfQKOt6K6AnXInR0aVviH/5qTcaIu5lqI5QA0pYj4MZxsIgMrc6N8NHrvuJs787q+deBpzeMcrTvZ9M69uHyQslmwsX5lMbCTNaR4

tsifqot6Sea8fkITjy4JYZ5f/ugRDY+i/VzYCCiNJUU8HIgAjuJOAlkpmH7rdcm1P728pIvoQAX9puWw/7gbdxYr2DcEhnymax0/YtAY+LYvBq3M3HaJZchC8AURKTwS1SOtRwCHjYZKm58OvZA9fdLkPXOMfvt+9X5tuBh+RnGDcwp1uH3Se4uV/9dGbNk8ITNC71xLs2ENc1Z4a3MPrdt9B3Gn4UMPh4bLgxGHfXtKonlg78VmcY5TltI1DK3t

vR0/kjUHXMBgKDss2MQy1N5Lus+Yw3sXsTw2v17btlnphlRDp3hbh6d0GYBnc0+ZmEEsqnuKZ3omcWd/q5Z8ymGzttQkyuLY53B3l5DWFx9LwSG7gY7nfjDT7oqw5xGfP2GtiLNDsxATevpys3bDcylwI9uncHdvEoMPTIUAF3gE7EoMF357ihd0XeEGu1zKIES5jRdw53/hUYuEyzSXcKZ3jlIPkMKLO73Dc0t332kgAWkGBQlsCc3ieI5ECKjr

tKvNCIgTNHhcczRbNViMg3pl2S5q3TujB87z3NEoJIctjmp53u+ZNryE6QiWd0FNWavjiKKeuwgdVrB0vV5sdyt7onS+cfV20nQLdcExwXskf2u/PEU+x1nbkLYoXQtzpAT8JFNK1zZm6Ruia3+3HrxxAA/FQS8O5gOPp35ipwEWBgQHYiV2wGTl1IpAynIqED60D4dxwnoLUDd8VkIGVJwPoApADzAKqgAniSALMAh9LYAGeIzGnMt9TBv+ak/i

tZY4XLvFOUG7CTwfJ8Un4sd4hDTqE8CChHs73lHDO9DKUPQydJZ3fUQ783zBfLF4q36DdT1yC3M3cMW5HwAzNQmct18TlWMnCSYHdJF6bLGndXgyj7yYcHtui36lMyQNOAsIB3bFq0/FQzAPgkbwAod2HQxiKcuXFQBwARYIT6+gUUt2wnosfUt+LH7EbgIhqAXaDMAH9Y2H7hEoNga9yhEM4JmE6TQOPUzGav+lRrNkpnFKrBCwtQN7anwGK915

o3Tqc2vRPbpFt5t3U3Bbdg22SjSCcWNonA3zYNZtEEtRqB1bWGFPVsaFMTG9fJFyvOUHfemxIABLgGd2VEpfdH1wt+THrzNxmnizevzdzbUpesoQETFfdld9ljDgvGNYytanuelzE32yAJWU6juvE7izK7ftxZlieDf867Rut63ewxEJ9MpTQ9xv/HqdOQNxA30pH7VeH3GjfwN/MXrzvklh+L5FsJ9w03XqchFz+3jscyd/lORNiS9LRngUbqWO

Y0LXvbQHL3pxeHS793OAbF98j0dOlPJc/3czePpws3TDfXRyw3sZvBN4V3T/clMTO3/QsEwT33Wag+AEMqkfrsQ2gTyORFoGycZOhQQLNDKOCjSFVS8kMdp7vZPK6KN5ISQbQp0sv3Pder98On6/fJl6OncfeAs2lbu/dFt003yrcwpyPHZjenWv0oyKKS9+ugTaJ69IY5JxcBS2cXhNZF92fnCwRhN8/L7UTLtJiA4TfNzD43NfeMNy+n0e5BN7

zbjhUJaAIPvA/gsIAPfl1el4VgFACyQGwA/oDxIIdp5ycltlPIcRZ1HNZKkroT9/Oo3n0boNdSJW5qVErcXSBFN20lgGLqN3A3+A/fNxxrhA9bESbbJA9m24W3E9f79yn3KCemJwCghXjlYuiZUYcYJ3L1U3huxnwjanfo6Yr3f3c+u1l8znnI9m7uqUKvsbEPwg/v97X3n/dmlpKXqDtN92276zdHPBM3x4ZbN+oz6Be7N8VU3mi+aD8wkgcmF4

4Sa3VQGnho617HoG+mTFLgKD5wtv0lqdXEZXS+kFAaecIbul+I3tlHnhOgG0UzTcLy2rSyt/z3BwsrF+WOaxdTYwvb5NQoyg9QKNYxQw06xVt9CCjkiRe394M31xx1HGfY//ubYn4HAtNJe6ZoQaJuXqUiM+oMDCfm3WZ8Pg9Qd1D+Eq0PLJx1G50PXlLdDz/5dUcoxkM9miMUPQ37OQfdU3BoCGhFZLr+SQf8+yUHKAeZke313ZWOg8QUKGl+SK

bqUebq5QQHWtNEB9sg2di52LCgBdjzNcNTKQeAj0rnB0blgN/11CbhI3k3+OwTQIixCQCi+6hFC3tFyxL7Q/vLe9L7Agf6PbL7k/tbe+xGLbfQODAAsDjlD+B0iEctCPegumpjk9P2PrNwbIYZcibuPT5VeybwQEVVDGuLyMmSU02WlWCPpf2DD31B8+evV1d36ZeJ9/zkEw9qyyn3XSc0D2CZe9CmICGnYoFE3TLVIywToIHVYQ+bI7DGqJbK9/

unApLo+0OFmPsx5o01dEuQM8wZ9aajRpu6gWD9dIDagXD1FvWVNQhNTK2mmBTWxp4WUlTxIpKPF1bEFNEHYz3ydN63GBl+t4aRFAerw7MzGctj1OnwesB1YmycaRkoaUY5aGkVYkKUUMvcPe3d5Pv3qQiPedjIj805Q1M/S2iP1AcPaNA6zjUF8M2VNiPHVe7aI0ledJfmlQecB0TL+csr0Ls95zl6e+TLRMgy+xXLdI/y++DUScCLQP1UzgAtoP

VQvmc5CNw2Z4iDgAxYxzeSKTpq+aZRaGv7CWQAtOcPAQbPQAaeWuSrQe8S1H5jk9A3UiBduJ8Su+7zSbLLBJXJW4hdJNM795OnILNft8ibJvofhSjK/5RPRijOEoHTQeHAB+cI+9uni8JICNzT3cM3g5MnD9Vv1ajV9ZSR2N3s2PrBbNC0KjpLZMG9OwDY+lYSMnDI9/snnCfhxNaQSB4w5ixAUJVD91LNgSqDEi7mM91Z0zZKuMgBoz9KKTHp4/

SdjyNcdnn9Kdxb+o6nu/rtm5v3nZvb92PXT7toNxDbkneUZ2yTckfR9v5GR3GenmcHz+Cp0N800aMmj+gzesCm6rGn8LsQAFIaJQz2QJqL5qTyTyLQZUSyT7WYWUQKTwskSk/Z7J8l8vp0BgVoxpbt4fX36Q8fm5kPLtdTOeXK6k+/6DQYZ0RLMFajUZ1vRwqnVefxnWA4WrREasZAGoAk9y3nd4gSQEROrBCrwJtdVPXNtmE6osRXYhhbD0FYEr

2nJTc4lZJwqXCSqKhs/w0ED0NHSDej16NHc0t79za7P7eyS94Pg9qwOpWq3QTWZSWX/YDhBUVTqw+It+G681IdcZ1zfMIm0LeBP5gJuyr8i7gx5GislLgWd1v0vu4jUA9Nxt6VGMUtFnexACrMsthR/q1PDMjQg7XDoaQebq7k18SlwDAA6LgUALVQy/hFZQbFNkf6fpcwPACAAG4EgAAuBObzhIDoVmQVNAvPgU6wC3LnGKzIHLJ3GDIPs2SM0J

L5bbxZPDCAfZRhFqU0+uMAAM36RIAASES8spmtDsTyckmrS/x1qDwArG2IwCdQ50/zLMGasGM09UnwlYBXT7wANupj9mDPlwAVwM9PPAAPT7pEP0+Iz69Pk8yE5Yv5qpfb+IdjfopdT1t8IO384aIRYFjL4Wq8ligzhsNCuczfsnpBuCtBpM0w6CwBPurQVRWd6tStXncCghAgtU/BiT68pivEq01PmRgtTx5ubU+hXEcCWZgI3n+OV/GYoH1PFC

wDT2LPnNDDTyejP6S9TzWckCRTTzNPc095UAtPnf5LT9v+xfhrT5tP1Q3bT38Ou0/h+TFj59GHTxXAx09oAKdPMjOAz3sJDMgjPBpUt0/Qlu5wj08vT29PSbLusvDnOCsS4enXvAB/T2dPuaR7CTomqRDQz4EE1EAjPCDPwc8cEHDPCM9Iz9nA0c+oz4QxS22l+B2oWM9Y4yXoIs83HabMWs8PzAKMJM93QtnkMhoUz7lyVM93MEawg8D6VzVCmd

aMz+p5GLBJDww3ymI6HEs33/cSD407fNulMNVPYBjsz4MknM9Eq595GRhwsMKI/M+hrYLPnU+d3qLPCs/9T1JU0s+JviNPcyRTzxNPSs8HgCrPtFDzT2YVi08iEW1yK08bT1tPejywGzuWe08eUabP5cDmz/cMfs/UUJdPds83TxyEjs98UDdjT0/xz27Ph8/wK8QLP0++z1bP/s9JoIHP1jjbuz3IEM/hz9/Pi0BRz4jPyM+6RPfP92SJz5jPZt

Ggl+UY6c/4z3IBhM8GfjnPCojqvP/kBc9AWEXPhn3rMGXP/VdfQphxVc9ZtbkwvXfbN4UPig9KTnAAlQC6hs2A9AA1WuSAR4AxxcQA8UBUsjs7vQckJKl4LUuFh3XUoVPsultAw3V3UK6Vvs0lnU8kWuJ4Jmc3gEKzvUg8YHa215Igfcavt8CnSxejD4L3HE/C9z5UHbBwp9sX+6PGRv7linfxMnjoxdq3C4IXm9dUA8rmBCc807eH7icjHmmA0k

N4DHrgF7ZvkgsAbJ7LQHqi3mA11S/CDiIz0icbl8cXndfHtve3xwFdpAAMIISAVciRc15PjLpXGdt6svTTCDsxWt2dpsXgldDZEMADiPj0FNMRcwAnoP6e0DdXXBhp6LEqplPnbK5Cd5ePVIemB4C364fAt8ovkLPbFxL44ZY1t+Ns0YdcU2HAtuK942JPW7acDyr3tml5MRcdYK4kMC+0CaBUpPMw8CtU0NZPGc+szzxBTJh4oGuMzN7Mzid+TW

GQCxgwjFBtL2IoYd6JpD7y+4xMV92YkmeXmhStg5ivLX+u4PMFqJAYxS2v61lhFziDA0iYsUG7UPkY6FYwWALQB2cXODVR40RqAkcuatAWsFSMRsARETHrEhtXCo4rw1GoAKd8crkRimOosDZWfq5xGQB6d9pBCGCDfuqkNm7FLS+Y4WwxGOneXk3fTzpE9XVDLyCv3KwNRFv0+rXKZ+qW3KzHqwKgAf3yCTvPojAKQWy4zbKLk5MtS3KLLKhXvu

gnJA8X+K9+q1E+MYo7Lxko9QqhAE1lSqz/Co2sGig2iAOsQxobLHi7dy/tL6rejAkx/r2IzrKsHACw6NDlWEiLJtCvgcXkgZijL5cYBM95fpMvnS+D/FKko+0OgRh7D+sgiwckyy/+5C5n/+hImACw8i1bL4ezjDEwWHsvBmsHL9S4Ry96q74B2ejnL6O7XufnrjcvviizLw8vE1DNUM8v/mGvL1sT2K/xnN8vp9u/L2oCQzw5CjhQQK95SXHWYX

7W5x53A/Qwr2ABofjwr7NEiK/Sr6u4VOtf5JhkEwDor1BMdbp9DdivdURYzXiv6FZR8SJjxK/fODEbZK9c1x2I1K/oVrSvOj70r1NdjK/7xSyv9yzirByv9gRcr/zXLNujIH1a2mrTmiBszSy5d+IP+Xe/9x5X+KSVeHEktM9TL47x3S8dq3hQyrADA5KvahiCQIG29M8QTAWc8q9wL4qvhEqTrwvxqq/jr1owEx2LL9BkOq/Ka68YobD4UEav3z

DbL/WvDoGuaY9Nlq+rraUDNq9Bfmcv04ttYSdhKK9n/Lcvrq8eR+6vqSTI0NskhOE+rx8vfq+83NUCwGGlXACvoa+ZYw/4Ea9gr1Gv4w0xr69hca+pTc/PCK+3CsmvyK/XL+mvZzCpKIcM2a+nsxygtKs4r/GY2Iy7wPivRa+ZYyWvh+iLUeWv1/iUr3BkVa9/DjWvXEKYsMCLTK8BrucwrK/7LOyvpShtrNyvzwyELwUPpaefRz1UhkfEqBQwwY

5D+uognISEjtq9s4Psuhjg2ZnwyKJYituD51hssVLX7MYZbnpP0xc7CeA5XS6h2jc1Nylbkp2/3dXj1/vidzlnlA9o6B2w1XMBp7xeA6Y3dT2N20tmhU2ehbNsD3abPKNe+j76cAB++qubXFsOuk66Lrpuun7bPVtLYk0vlo8tL1BzgyvMAOH50T7fC5NEzjBXZ/FvfQ2p/KJnDUQWiAKsxABLiW+zcnW4cs6YUQDvCoTjeG/YrYiwo+j5zxRkaC

w3PCLoNLwvYcdQe3IbuMBQ7MhavkpEEfmvrqx1hJgNFdmuIw3Rb7FvHpjXr6HO/Od9b0e4Zaypbx+XLAQZbyXA2W9e+LlvCgD5b2lj8FaHmGm6JW+pwESs5AI6/bboVW9JVrVv5byiZ01voWstb6V51a4DuyutObriY3A9+RbQ00uaA69w+c3PWuetz57tanM74UEgvW/G8ZwYh6RJb8CLKW+SgmlvfXNMiJlvU2/e+FAcs2/ofYVvfw7Fbwx1q2

9qpOtvRcwguCa422+UvGZ3yFB7b/b+ItfiVsdvGq4qe0BTy4tH+Y5b7EZeb776FZSsj4SwpsgzeJJY3LromrDBZPKtHnRoSORNJTRoRFrILdJefCRbxs4SkFKtTLAM+gNGb1ePvjNgp2ZvAYefV0Uv93dHvTZvQ5uaj0Nsz4gksAyjsTFQJwjpMHS8RYh2DS+io+Fv3gd+hFH7aQe2j42lDuIYFITYqtqJJm1SNjMdOENY14S4+BUSkAc9+32VhA

cfDzrTkDjDKhJvd4Dt+79LnTlomuyoGcNSL+jWwvC3UsSwwlhIIg8QMI8de3CP8nQs+mz6HPq+y47v0wVaIAhI4xWI8Sdm/0sOtMEsS/Ld41rkxI/fNbwH5I8NB32P1I8nPRP7tMv0j6h+HbDSBkRAqkDMy5XXQ0AzoPLb/CSC8w3YMwvET8bH/XSNziDdqTfZkxzu/qriouncMljZ4olPb7fJT3o3N3cGNxQPRjeSwB2wDC2223eFRnR1w0KOAV

W6buDIdGZwDPovBfddt0r3XA+kkHWZc6PAK6ptH67zAKGAl7LAZK4YOfjzuM6wNHtyuT0gLCi3roB4MUR77+1vBST9nPjhzcn6ctdPot5H70cd+iy5XPm7TWyLrtRAS3Oc1m2vbyxQa58s3m7UgFJAKBe2WdftDbqr7w+J6+82rpvv2+/YQrvvgfjuiczXBsKgb3dIJ+9FrvC45+9wH1auV+8xTTfvFBF370lBD++n28fvTk0v7wO7b+8prqjznK

8/79qsaW7ghIAftQ3D8kYyBspiYLYIajVf92O3ec3Dr/dvncAr77bY4B8+rJAfW++qzDvv0Os1rgfviB+P7ygf+itoH89EF++YH8Sg1++VjLfvrMKLwAQftahEH8RNsTDyLKQfQb7kH5/vlB+arL/vNB8AHzwAQB8AU2wpvUNCb05PuO999hJLdoBGAN30XfT6QKpAlQBHVDcSPADkQFHF5WPMLyB2gSo15rdbKzI3aFJ8EPAVHMZ0q8T6RZiV+F

MWIwModiUgmzgg4qiR8JCIDx6tdNkv8wHrB7H3zg+pW0mjfO82x33vk0dKLyNw+e8NkxnB4OxsNVC3OkXphV3YKw/ub2sPl4ORDxaPd9Vq9wdxM9JGIocARjr0hXBAKjouIhq0HR/NgEtkkOKqqJDsBceaF5S3Xi8Qh/O7H9qLgI6iisFy4HCTJe/ENBumMXiTzg+ZeOaSKQuw89SfzBtFalRoIkRi+cRk3WWNOC28EmyoJxxzLpsPne9c7/kv/j

FuD63zxbdRi5oAMI4Asl9doKKAdct3uT0SCJc3fFOqw3f3yu9712P1qOcREDbuYsgCH2FuT/V/H6NnGXxAn9pdLPKG5nkmSqXGZxkPiSlZD78ftufgnzkAm+/yD8CjIA8EvcdbwqH6QDAAL/3BL3r2BhIJeFfSduLoFEvikNJ2ZvSAw0iuPtu8LKhaHMp3G2bdHOOZSZA8xYcqUfc+Q7GzubcZHyZv1wO3j7Lzii/NN0xTHbBdWRW3xpvvJo/SaX

o75zL4PVVrSFxpiu9JM8rvNANNZ1KAIsiU5zbuzMhIivzpFnd1iKqfc7BlRH8fap+qn9TIWp8ebjqfGp96n1cTbk6MZ8EPjbdgFzmnV9df4zfXJtIGn5TI6p/zeSaffi2aiuafBUcOT5XnDRfsRg1UkgA1TVXIKcD2djxqBOS1ZLqgHMVbXHSlUNW+yRt3IYZY9EJYeIYmS0PlpgbeCQKqEfCQMzXz39Ocn+kfALOZHxOn2R+tJ7kfk9eCn8LvA5

3bFwlDa0DeS5y1cNxFBXgTuqCsD7vbZU+A7nUfS++SyHWZISI4HZpAvswQHw8Gl7Lql+bMNXw9MJ+5r+vF+NJc4HrMg4XoYd4BuD5HIKvol+OC1EAC6C/ogrPViw26ZymUMMV3kZxHY0XoJEBPua02Vkfol3Bc/zxEgjFu+0eH412fkFa9n+cY/B8Dn6rMQ59BmCOfJQazZOOfLLb1UVOfyoO9RLOftl1ZR75Hi59bRMuflxirny2I65/J+ALpW5

8+d9Dru58RVgefAiv/n67oJ5+hPGefDwYpp+PkELR+qMUmzB+bNs5XDffwn57FWQ8gH+Bf3Z+0QDef+6zNboIfxStPCcawcrlcYX+unWfvn9VvRKzTn+6Mfi3AuPOfGeRwq0Bfy/MAblIEdZmbn5Kw258Z6DVle59wX0efiF+SEbvxdTDnn+if/UMkL7MU/VQ6ev6AdQAjgHAAhwCqgRwASwD3K4fa4P0vxz3nRSbcJAPIzBTWZXbJVhJ9Wm0s06

CsbmFbAzlolAMohzJr8o2moMBaFPD4tOQ899AFeS+6NyvNZA/uDxlPFjaTaNRnH/b4tQrtPtnihaMIQ9oO6XPvCvdZ9u2ffscpSwHHIx63bDrgti9BYK7YQtknAK1Vx9qOhZuQQNpF9LK0HV7IT/UXBycHiBQAAyrEqBnl3aAEmfCT8PCKJkrUU3UOtAJYk/fx4KgiqCaXAd+i0C4i0+0paZ/0hCq93pI2F1E0jE9Fllv3+besT/0josMCn1ZvYt

gdsLGLZS8pLLPILYVE2KJ0QT388CVP1R8e25VbD6nc9BzwyAZ+b01b3pSNAOH6sIBR+iFvmyPfH6M3CcB1mc+MwCvSKha4jECbkxdfvB++zNdfu8C3X3cjMWy3S5gIQEIqxddvsPWN9wifZk8/wPdf3HAPiU9fN5+yX4GTmJ/oAAgGW18JkXqV5I9tSJ0go6YVNIfux6ACWBIMSlhtpUfD3JV95RGOtP6saNo7HPI7XILztRIQ7GePwkfCNA77w9

cidwq3hS9SR0PH1GC6ioWqBZd+SKPagk95pWbYD/cVl+4HF4P39+IT3rslPb4H0fv+B23m1IRZ0GbYdji0kMn1s0YD1b9K8EAR8M3YLBYehjqgrOqiEuDwjOL3HkTfvMvtWrmPFTMW77CPVu92YD36ffpniH1eoe8Vj8X7XAgwfEXgu2QwfJSODXtZqf10uGVsPH7v2Qc5++gAJV/6QGVfFcNR6nGPrTMDe2C6qOCpIsiW1eayZmPU85KUInFFGk

UEy22P1QfEy7UHqe/1B8AjGe9NBzSPA48570OP4cRh+hH6R1+6e+DTN1DLSMLi/PouErTx7LpZwg3H3c0dpwv6e9kgBBpgeHYU6G3W/afmEt4auE4FRpzvw2PMT/m3Yw+Mk1mXewfKL65L2U/34NN4tcSAdS+i2lmy7Q7fP3eKn/OdcXuWywl7QAdt5qNSg+ycFsSfRwHKI/49bj3VGsSwY8Z12AyQtd+LH21SUYgGZE3feE4nAOGPC8MSACxAQe

/s+qpuRQf9e27TOw/lBy8PETk8PS7f96nu357fFV+m31QH5t8pxDQkx4RmTNFwC5WuynC31UMYKO9Aye/vfXUHPY+S+5SPI/vJ31nvrQfjH2H1sF5BgOANcENzH9Wkw3XXSvGG1dlL4jBsxRICwZfQrUdNODhVU3jjOH2nr9Pp4lbd6bd0oSkfjIGn+8bbBZ88n7zvSVPjRxZvSrcD79DgeNTDYuBIkFKHdLUaZR+OB78m2Cpjk/KfUemnX+B7l9

uOiPYtkG4v96nr0j/yAB3JmAjjOHd9JW7fX/JjmdsTt/dHT/dyP7I1Cj/5D133OO+T2exGxuj1SN63mABZT2gTgrpIoniUcti0Zbg/9J2NlJC0/GofVQIvUlQiEkg82V/JkJg2OC1b9F/5f11qI/OBhm9t32OnLg+mbyw/7vsC77TfNFuTX5rLop+jqeIjZP6AdX3zX5EWk+GQfMWiP9zf4j9x6VXATncdu488/08jAm2sSIo6rOcExOihgNf8Cj

CptYHO0OF+9WeqjnP/mFj5NKAaqxBRHMTeBBAx3rjE6DFQP00lZS0UYzDRUXUdDv5gWBxCIO/2wCWoA6yU558sUGtzZ+U/uMKVP5O1x5ygl0BrFpd26P53U5g33jqXbGFWd2YYI0QQeQ+JaejsFeC8YlfzmPOvcrhuPMlQsK9BuIQ4THEgjJ7jkedT6LoVbxy5P/4b4lACD2M/byxDrBsEZT8VPwitBjULPzU/5vU/ONqT0hiNP0mgzT8QQa0/ow

DtP8AgnT/JeVXMuq8Ie8wA/T+i3ji8DrwjP1CuRT+UyJM/peczP9bW9i1/P4aKSz8slz7tqz+fF2ILk6qbP9SCOz/9+Xs/8ZgHP4DrnhvUwvgVZz8KSSoEi5hL+RRj8ZwWLpYT/tpQwzCSctj+P/c1qQ/e8+AXDp+Wq8vTNbpPP0gVgrivP/T5mqwfP6U/XoA4v+G2eL/VP+bMtT+PuEC/vYQKLqC/w1bgv4osbT9qudC/w8ywv79NdE3RFIi/Ie

2DP5nkvhgFb6M/sr99btQfUz+Oukq/XzAqv7FRZpdpK3Kr0hgkv1qXbHWIasgbWz+cxAUo1L++zPs/TneHP+VXyignPwkkKU0XPxXM7L+/Z3c/XL+95IJvBj/aZc5PvmzbVKrKDIAGgwSfNhYwPEj4weK7hMu8atwD1a44tGb1OC7JEvh88zqgaV1RT0HVlD/MPG4zFdi0P12B9D9cn4w/SF07vXyfxcPd399XBR8nvblb/gTjIp+I70W08dOpZR

yxENVn+fdRX+G6mneP9w9rejW6PxefRTKSP1hQ8j9oX3OoU/Ki+jr0Z1yce6+bgTdDr5IPWW0cN0u/k7UyP/o/2O/pv9YfIXPMAMSI7TSpEwoG0EClxF0z1CI14JjJzDgYLSh0sJJshFRa7Kno7Np4OPicNMXQzDwX9TWiHod5c80TwT/ED4Wf3b/Fn6sXfb/FLwUfaX0BpzemmulIpwI/x+4ws0ogzZ8DN62ftR8c380vk9wyxEvedujqv+Hkkr

+WKI0YAg8ysqyv7yyYv+8s1MgAH4q/3kRI7cUkBSiBAPOA+Jge4c/M4VYtbfsYY7u0tgU/TT+YVnrQ6/Vhz5C/c8pdzyRNnT/Hlwy/Jr9qDRNWa446PBz5Ie1VP20oVr+XP75rl4ZkShkATehSYeOJqwSfLEx/YwBKv991UKi1VxpAybmw9ByZlST4TCVQwn/SGD650L/WKgJ7aCyViuKgDUTJUCBNA3hu+Jbzq+hqf/M/A11wsMM/rkCFb7UMgq

/GsBwxT+Gaf0B5XqyKCagVTa8GH9Qf2tiDrIMAMz+uv6m14w1oML2YLBgebuv+NTw69WTInxfwFSeqNOo7GuwVilfPeYIPdyk4KwdvW4IDFO4AWozijbaNfi2//gC/sXd4ilK/1H+EM7R/7z8Mf5F8tB8sf1Nkvekcf3FQYFBigDx/cBh8fwggwImeG4J/3viOf9Csw+jifyhjbT9SfyeWHMSyf0c/Ub8rjKa/hRiZTepjqlF1Hep/digov+CKOn

94skd+5EYefyl/5wSmfwLQ5n/4v6nx1n+NYdCM9n8DDDIPTn8FJH65ra3uf/ZQNVE+f/HZ3In9mIF/vz/Bf9a/c2/hf2ILDyV9wMdy1pi06ed/lX8Jf0aAfX/JfyGA9H+7Z+l/4NF4v9l/PLDL6BZ3BX/euEV/az9+v+S/fx3mzJV/fVHVf7IPRzw7P/bEJ6GKHNvr4+TQAxjSSdBM/vu/2aeys+O3I4viv1wGJH9tf4/82hWdf+mK3X9sKDR/+n

/9fyl/TH9fPyN/EW31spx/E39yqz68M3+EbYDQ4TALfy8/MjM6v02Yq3/PzOt/MhrSf9SC23+Rv8G/e3+Kf5JNHl2almD/z6Qaf+d/qriMzbp/138Gf7d/GP8mf2Z/gRHPf1q/r3+2f6GgH38ajF9/ecDOf9L5f39h/B5/hW1A/xP55AsBfyd/QX8ORCF/fahhf/bAHbnKrzP40X+I/4qvyP+5DBu4aP9rBIYfqX+Mfxl/cz+/P3j/S+gvkIT/vA

GFf6b1xX++v2S/MuoVf7k/1P+Bv243n0/1f/9EjP/Nf6m/V78OW0Y/REVTaHsAxABVwLgkpMVq1C0IzBTS8Edo1SULkPEiOdDiZcKF5qfERD/cGQmpeFy1U1rQLvs7R2ghLHunQT/xoxX92/ed33E9BMc3Hwvb0om5dpXQ2qBQM73zwHV8k1N4lBQnTBk/pm5ZP9JP+59zeUMaGQzAII15Kfl9ecu5aKpNjNe5Qy1kmH9AA3kMsYtclkDDZK2NrJ

mvWDWCZgJzBQ602hOUCYAB3MxZ3KzMQs/CF+S6IxoJjvJsgEb4s+BYfS1zhxbz/jBdxhDjElWp/gcoiCTGbGGzPSUEL5gEAE/jnYoC0CHrI4l9proywgyYCxkTFg4qAbsYAAD1CADNwAI9lfEA8+kRR3/6WGCa8t//WHov/9y/IAAPrUEAAo1woADQTDgAOlrq61OXQoegszAuPFT+JQAyQBoG48mI3fj/RugA2lw8uFkK65pBrUMNXJYYhGMiAG

FoQ0tuX5cgBqeQVAEgAOlYLQAwgw9AC4VY2UCYAXWvUNArACeAAcAK4AXwBc6U31Yz5yAQjhPiZPP6+ITcmRC8APD8HagAQBX/9iJg//wmoqIAkSYbbIJAFWAI5ZPpAGQBftc5AGvJCHEIoA3q4mbhMDBUAI3MA0xeHaJlBQ5xaAO7YDoAiSiegCiVZCdS5xsRvdWgxADTAHRd3MARkAjZgWQCMpI2AL/PgufdgwW0QHAEsbxpQC4AtwBgJompLL

VyIXsJvZ+uhWADgBZm0qAJIADQAkJZUcBnVjmJltSQa0lhcWVB3ZmuCh24Su+gbM0EQDkgjjAMoF1CN7V4Y7wSDrvpD1Vt+HJ8Y+5MTxCfrB/Zh+PZtzN7sT3WLhw/O4+gxsA070qCfENB0UxoVMc55ywdGtgKFTB/+hqlJ77CDVxTk8dPgBIQDP/7LuUKUrlARVUf/9hJjgFTJMGOAfQBkatPmBpAPAMKJ/D5WdQC48ilAJyAdIsPNIKZhMgGqA

PwAUYAlyA6lAqgH5205fnFjZww44Jfp76Ph+AcEA9wAoQCAQHYIGBAVEAsEB9agIQGlANoAjCAytq8ICcAGQgORAbCMG8aLE0GgFlAIIAdzjYwBbWE8QFp6ECjoSAraIxIC5MTjTlDKMfiM9gV1M7T7c/w4Pse/E1GD8RSQH8AP+AbD0QEB0gBqQHNd2iAeCA3ABxUBGQFfKBceMyAuABThxdQFqALYgqiAiHa3IDMQGu435AVwoQUB8ZhhQHx+F

FAT0A35ifQDLD7+nxXkoWcKCwrUA925zHwB8PJiJs8JGgUYw1diccFoUQsIGplzboTzX1unh0GOghxBp0Av0xqJvQUFPGQkh+wB6MkNtoDbfM+tTdQn71Nx7fuDbS4BJbdOH64AzifpOQSHESNgtW5K1Eg+KvEbiyE99534dn0yhk7yGlApAD//5coXRxq1DP4cTYDQQEyMEpMg8+RwQtY0EvCc/yMtnKAgo6CoCf8bGSA5FEmgDsBSRUwb5l23k

vjYEYlQ2qkRwCvkh8zhQAR/UYkYTiTPgCMAPoATKAaD8njb+CwOIDNaWG4qRBm0Qw2HbyhNAeGwvGoeNilZhY7iDwJJkGjYydB8xRvauFmFj0QT0wMwyLzLxnIvff+Ci98wG3H3xCG6eAVUq/9GUZ7FXFCtuwfmWoQ8Z37FswiHoR/Pm+Z+dUpaA9wYQMrgHiowWBEdy/hTCwP/uDjAmoYEdxuYHmmn0iVoWCO41cAFX28Xh6A642/KM6gAm6DQC

u+SZhADedfUKXACrgFngBcesWYlEC6Lw9tEQZTCckNJEyDnsAl4H82S+6+0xlgBF4F6EHJ8KMMVeA+TCX0H7elCbecGDSdx7AfgI7vl+AyYe97oO2Ci7x4nrMuFu6CMQtpY0GgOLgxnElgbjg3N4tn3U7tFfKCBKu8bbDxX3UptfON+qeCRICBA2lzgNOiFTgV2xgtg8VCRsOuge6g9LgfiqW9xqLlfHOouhECir7hxDHAEeAG5AdNRC4D6QBEyE

iwYygLaBnAA2bwXHjjSDKMtjgRQhcaXXwAgtdNOL+Acx4HNjk+PXYDtifh8RMDhVQjZjEvFnUp+I3wFGBykgfH3A/+rVlVR7J9xN9LtKAFkFo4TirWN14hh93XqynchpVA1gMX3rFfGCBRkCDuKOQxlaB7acEsPxVjXT/7lYQouiIBQt+w56TycBcwJjVICGtRc9k6FX1QnmA4fAACVk6gCEABYgHpYSEsbgh52CL9GDeiraF48G4QQHjRbBhuCU

fNEskuISciPiELDnixY701spZZq4bFwTvhnWvmBXNMwHGby7fqcAsaOET8xr7fgJP/qq3B1CcuRkx7umRO6NmzTfKOwZweCq7RIbjcHKmyE+5nYwKayobuiLRd+KzFVhz7THRLC9AdeQhmxZQHIOxijtfXKAuXAZQYHTgNWrrOA6zg8wBiKAFMkKUlu1aIgm7xer5LD2AXPU4Z0gxXRwl6vlHPCClwc+MljNPrYptwfEFCmZb6W1JizqBixzbosX

VMu8Cde96IfyF3sovd92twDl1DwxChMojIDQonJZBiQrXx0geEPdxI9ZQVKjp1D3ruVAfXqDMJ9DYRHDK7mDAuWB/vUFYEFGAJSMrAlEiailEkISDF+3NsOPI67B9hwEtzykHqRAf/K0txh2KRdVIOGjAnZuGMCIAAnABrkFwOUc085wriSNAFOQLJAV2wHAAEgDHNzj6pJ4a/AufBeW4Q10S5ndQE647Q9EyAuyQPCPeLZMmE6BdigKWA/+nA7Z

qYowhdRxuXziqsJ3bve1N8bu7FQOP/lWRMU8gYpi7rFhh5gQpAp7uuOh2EyAFiJ0NyVI8OadM1ySRXwggZLA75o9C4tO5PSRagYD3ezKwnAmwCfASlTPNoSG0rXo4qSQgCORCpwOeCauAMBgEQLGPv13beU9cAmi6nIBIgN2gTQApyAWIDzAB79CEeKwAYrEKAC17h9gWtAB586qY9PBYJxgyrLVYbq5b9t7IYW2bsOQiaGCUZBcNCit0bAJtebz

M67AzEyhUxTgWdVPnuFx9ru5id0ifoPHCBkJQBc4HKAHzgZKAZRelGVbgGrxBXQGWNAV8tZ9xQrIVT7JGLAvD+ukDYgz1wL4RgZApuBEhd1KaqqCfTNpOAx0IiBGQCGOjfqp0gSZAVqA/irNH3N7iaiMqWGMUxoE291HgXb3Foin8Dv4Hj4gqQLGNVjUI0Bv4zzwV7mtgIQ8IOBR4fBA6kTPtFFKj8oggc4i4dEI0GOmEXw5ScvC6Qf1NducfTy+

zgZwn7nAMegbJArwMmjE8y6ipQYDlFUKU+L+xMGoYUlw/ga3CWB0CDzbrGLwAntzxEFgKPdtxAS6FOiF2gBrw2QdHVBVEByyA4gGkALhorEF2mSZsDSAC/qOXYzcggsDroGJ8HaaVuQIGBq6jqAPpASnA+kASACVXz9AbjIE6467ABrBuCGqUunJHsG505vVAI4ljuAEEAUI3ZU+TrcpmPsmLGLpK59kRiYswIzAUcAmD+TD9CoFTp0kQWqPUqBD

/sauZHcQUlpOpFsc6thAFzE4HhbnvLVs+7NQkOj2yiN5oWnRNOEW52U4edD1lL8lfheR+tB14aP15/hxLf2sDSDL372W3hShm/UZkLiJj4LfOk8njhPPoq92gMthuEjs0OrZCfk1ggYiBnoGOKifwa8Bh6Bb3qXu2NsmZkBgobDgJnQXQNzPocAwa+7d8CoGft2CLr5fUqBBwd+74WKVKpAHYKEysDxwvajYA+bgBAzm+EHd/oq9KFnBkbzGmeqk

MxkjNCgehPAYTKgfMwRL71MByhp1DH3I+oFtSyH8yw5L5jBF46GFn8i1rmNOoufXii4g1rQKv7Sw4gkCf/CoZ1/0gaXT+VrUMKZiwyt3G52tk+QdEUS6IaRgmxD/IKqeKJdWiYRUNdSygoKr5PRCCFBt5Zt0bQoJYIrCgsAw8KCk/BiDSTAiig2ziaKDXsIYoNrRtigj54gCB/VaQwMnyMl6Pzg9jgro6GwJFfjz/VZuARMvmCDwC+Qax9X5Bsih

4/C81wFcHigYFB1KCzmBgoLpQSS4BlBnuMmUGiiHzUCyg8Ngtp12UE+DRu8qsCaiW6KCHToeaQFQc+MIVBeKCbYHELwhvoaAGzenyIjAD+gF9AQSfdO48SIXm5BpwsZl6QcBQueICow50EeINBFJ5Caw4upAo5F3Bq4+ZaCfMFC4jutHKRCxSdMBSU9LY5A6ROQUf/fveBYDNADd9Ch0ooHUkcvD4G4YfdwukhyUOU+4ECR+Z1ZwL4Ch0KSeyp9a

bYciAR1LFAPtulsVMLiNoOIkLbFfwgK6gjujpIkWwGIPG7eR78TYEnv3QAPWgsnUTaD+kEAZ3uukVxA8Ax4AzwAXgCvADeAO8AD4AnwCDAB6DqklCUy8z0Trh6yibpLHwOOgvpBSGgI8E1TNPyE3S42ZExoM4WVWme7OSoh4RDUqaFBiyK5fLNuTfAKb7dI1EQQUvTmB9487/bbSW76EXAwdSqT1h1K+3SdgMQ9INOzx8+YorY23OkjkSpBh+coE

Ff8A8rEoZB4OlVMBb7q7xqptZFYmwJ6D/9iR0HPQSgIVHi16CJb5eBFa9lU5N4elu9Xb4QAC9oEJEX2gQboUR7ljy/vp05Ib2UHxZvAHoOgTFwINqmXHZWYrGdGdvnl7ah6FQAagD1ACaAJ/fBMepQchBB0R3rnM3be9qzzVanAAgTEEJrYAMguY9lmYx3w7HpkHAf2UD8KR5bM23pv2PPJKAwswHAUMECxPqHVS+q6CtU6P+VLhP3YAnI29d4QD

LvFD4BB0ZhMZxl1LjuPWRsFVSK+gz2k1+xjQAp5HtcOZUd8D70G5LwYflmAk4BI19UG65IJKgZ4OOoABccGLbXhEJYCMTJFCMD0ZaonNnvzDf3Va+kGC/IxVTlrQdcXFi6H686Xr+YVPWKhrWHCjSg/ojobwBoqMkEZatow9ybKQSwoALoSkAtOMi3AZOwuXtLxfbeR/5x0aCAEuug8we/QhLxBhjm+GdSEnpbNcSWDMngpYKLODUrdLBaPlDRBZ

YJzohmCXLB4MIBQSYcyKwZe4TKgk3l2Xbi1ma3lVgtZWmKxWECvCXqwd61aXUzWCItqrDix8KdpOIMXMoDLrMNyNgUWDQdBioCHt5tYOUeB1g0Ri2Fh8WQZYL9+H1g7aiOWCUqD2Rx95HY8M1go2CSsETYPxdsq2CA2hQEnmLwsDmweGYeN4DWDUdQrYNX5s6ggYBQyDM+hyACpEGMAltA8QB+RCRFEMgL8AU5AovFi967gKxCqNSE2QM3glGzw8

Dh4EGg/sAY/ZrmxBgIWtJcZdzokyBIKR7sC7KrjYBOga8h7MoIgFfuvYPL0O7mCboHXj0rJqw/C4BUiCLGwGyRjlDFkBW2gHVad5fkSwai/gctB/0DeQ4j3HggHFg/7u81kBSrcVAHkBaFexElpQGEAuYGaqkrVO8KbthCuAOYEldJvcNGKHi9xbKW1VIQT4vD+0wSQyADHiD4qItAlBsl7spagzhyxwRqgMcK9stxLD63VHCilqOG44aoD8QMhE

wUFtxOLgkt8Q6rjyzzPhkg7k+t0DGcEPQNLPh4PE30e9RkFQ1omLAoLAscmzJVZVBJola5sLgmtBkdlugBWzGUAKsgSBAdApL2TfvizWiirURqh2cw87DnD10BYYX8MbWQdngRK0xYNkMIEMMqB5/zFuV/ZoBMGH8XKx2lYiUSBvlXpDwaLaxWBxZrVwAmNECkArIALbhBv2pbMxMNcaEtByPrg7Sz8MikLOAyih0DBswhGtumYRzq8oxsoA/MCU

ttefGyAqeD3nC/2xXPm9vAfaNahOvJMZDXwR8YH1Y7vIDMAXIxSeKoxepgoQEmLievjXwcaAp2EKRtMOb2uCABGMJT3wL9492KDCVhcAvgiqgS+DgL6cGAMwBjraEULokSqBfoFIvvI+B0CrxghbjdsGjAvxjV9aZe1ZjrH4NDfKfgy9m8IkL8FmsHtcON+G/BBLhBfhMvARQIwAUr4sd52QCIr2nwTcwJOwo6gWhwF5y/yJucW3Qd5ZB4AgfSj0

OSYbPwofh4CrgjFk5v48WKuJK8XcbRzVA4iygUqACeCk8GVwBTwU3g6ja76QZ1ZwENDzuKJHPB8tF0UD54PdSBAQyrWxeD6lCl4KzgOXgjzus8xq8GlrAaKnXg1IYAgsuCFkS26djm4PKg9y4O8HS3GJiHe4XvB5Et+8F88UHwdPJRGAli5nzDSsHHwUpQSfBQwoQgA3MFJGHPgvAAT+CHDbBGGXwRkocVIm+CYdrpwA8IevvHfBmEA98E4mAoAI

fgmv8YhCVFhQELo5r9zS1YFH1FlZR+AG8D2yDAh9+DjHAIoCcIS/gni+Z7l/DCJG0/wU8xRYEP+DPRo/K181oAQ3F4jqR0ioUeBb4iEQpWktahoCHOSVgIf0weAhNbVECHvOGQISgCAoM6BC78FYENsITvefJI9sxU/i8UWIIRauUghpQCGXhnl2gOtwsWghxFx6CGlr2TMA4+GIgtKFnnwihB5Ymo/IcWXSDZUFZD1YITzoRPBqMBk8EyPCcIdw

QjDyvBCaiH8EKPOIIQkTyIhDyGAhEK+YKmwSQhiSQZCHjDTkIYd/G7s+zglCGXwBUIR0MHYhlSRW8H4oHbwekKcRi9X9lWwEuH0IeeJSPWpwJz/BD4NMIb7XSAElhDNjqPnCnwe0Q+whPZ958FN4JSIcikFfBbN48CGeENwIfkkHwhgPUq9J3fH3wYEQvFAR+C73DlEL1ZhecCIh1RC6TBlPFiIXpRVohD+CkiEIkMOXq/gtIhMWA0QEEAiyId/g

4YcuRCbI75EIIAEAQh0CbB1q3ClEMJIWEQvq4MBCOPoqRAQISEQxohi4Y0CE1PHiIW0QmfB6JDzxIEEP0WJfxEghhIAyCF1MHSAJQQueYNBC+hpEAHGIdRvT8CXf8BkFYqUGAdsgLduvmh4gBQE0aACVkf+gPDZnwC9zEPALLFF+OM+JIyCOnFT4EOUWoelQgwOxz4k4wNfWXbc0YY5PhxiFUdNpNaBu92hPiQazVU+HegoRBFIcPL5U3zEQWcA/

nePmDs4FeBlfJHmXDeAA1hBCZCjka5reZHDYROBy+DR4OrQTOgUXBCeVmryRx00vH8AFSc8Ph10THcQI+C4iB20cEATuL/AGE4MfaIY+GuCwQ5Ut21wURArEIImRuVqa4BAqiGWHdozqZHra2aH33MtVE4ytG5fVB/JzxklPgHyqc6BHnScIK47kv/bsYzMYgnoDXyIHt7g68eXmCW+bM4LyQX5g1RexYCsvoAnF3TqY0SeO8TJ+TTecE3ThWg9g

emBAM/ouOUlLGwbKUQY0RaISPK0zMF8oM3YD5xHyEmSWS1q+QrweFv1oFwK+lrHsJIFFEfaCfr74XwC6gdgy9Q91EnyE3GG/ITjPLwecRNCo4el0Mfig0I5Oi7cq4BCRh7qn6A4XBJ1xL6AAHE8SEWTZaqAqhYKiNnmJ0KfWVH68mIrkx46GqJjiVZGkmgZweL64FzoAg3EmS8rcdfSpT09TuQPPI+5Z8fKh1AH9TgeQjAgxhQIviZkOVsKsUUpB

wfQicHg8AgQWog4hyyIUOADOfFdpP1UJ8A91liAD7nygAFMAM8QmAB6ra42zzFugzLpKUKIRyx6G0n/G/8CPw0a91Frn3hyhJbxH8hIs9+lq10V8msCLXsQ+DAXwQIeQdBMXACvIa2U0cJB/m5WCTlTJQ/fwX16kskeSNq5NrCtvNW2qkYTPEBQwQjC2FkN16uQHdGI+fTQEFOFThonDkrEue5Hc4jOdWlQC0D7WuBfLCiH5CnOan/kYolFcDOeJ

VxYGwtflJEPqwZ7eCShE371MBVIVlQqowjq9GN62q0OMPp+d0QfX5RxAVUGyMJNgqleK3McMjxb17ECm4XVgjytFCH2FBpnpwEJygSIteZj3fgsuENQpCEfdFp7w1oHbAAR1Uisq5BC9YOUGLgMZQhDeplCYehQggsoXBQqyhNdEqqG2UM4MPZQmRgHehx/LZUJcoSH8FwaeBFCXieUKOyjIoHyhV/5+Vb+UP57FwoIKhv6RgXChUPCoeMvLWe0V

CTwKxUPoIn6cdGacig9JJbCTqYKJcFKhTCo0qFqpG/8JlQ+6izisfXB90Un2pOcUq4RVDlmB+qzKocNheDqxBCqqH4uHaoYIcHSukVCuRKBmFB/HTQVqhr2DK14dUNTrPtQq4UKHhU3B4GzaVju4QgWg1DHzjDUKT0PB1UyQQGRaK610RKoB8Ca7B6boJRAVQFmoYl1Tteaw4LB4pgP4SOIIIV+DJldsEtuxHAQJzc3cBlClqF1JEU/verHOY/6s

4AI+uFHntZQ3ah5NCL9YOUKOoWRxZyhVRgcsr9/F5omWsLyhN1DzWC+UNZiA9Q8fQT1DFqLBtVQAG9QiKhy09kq7pjBfBHFQzuYyytAaFJUJBoVI8VKh3Ch0qGQ0Luol6cDkauVDgdr4FV1VIVQwO8xVCet6o0LCuJVQ+6iWNCGN4rc1xoQ1QldehNCWqGAizaoYnQwQ4nVC7KGU0OvcMlrfqheTEOaEDLxQWDFXTigxdCufj9YJdGLzQ5CA/NC2

shF2x6hjddbv+gyCb35dulUgPipfQAsKBLgDhCEkAITDFiAzAASbZKMhxCOvA6aQY/YN0DqmTypuheaZC4vRt1wKoWjIK3YTkwfjg1LLNc1iPlegMaAaZJywBplj2QQuHNI+XuDO37Xj2yQXePU5B9sdWcELp22Llw+ZakqkCLNC6xTzZgdMHDo4GDvx5rD2BQBdAOpBSp80W5mL3Upo5DAG0WrRlfaqQw1aFq0PzAjZ4KmgqtFUnNsiBkATh5CE

HWpU1wRcbTzOeMMq4BZLlZ4P6AExOaBM6h4R30CGF24Dy8gNoTpxuTDWul4EJKBiktbL7VpGWjt6LZ6sdmgXOTwCG3oYPXK6Be9CPMFMPy3Ib57JMh2aDbj51AFKXnxQqaQmPY80wHTWwKOvECRCuZYm26FYBkoXJQ1zEilCZ6QqULUoRpQ46+esMDJh3kK2jjIdIvwzqQKOpbDGS+LC4a+YeVBxvzMs06hGWMPGuOFETjqUgmIKi0ofvIfqxxho

l6AGYG3eFd+drY5GFcHHHRoowm0YyjCSZylA3UYa2hPRhYBhW9qe5DwXgYwnAWFv9yjCmMJhvOa+DOaRP5iHwx0CFgaO3aVB8oD9sGjgOmeJYwnV81jCdOqSUDsYa0oGJIjjCiCouMKqoazEdxhkKhDGHhDUoglmYHxhzVAXo6ugOj5n13YHBrdCDxCnABPAJ4g+gABJwiVLFImcJB4hObUcQ4p6HoVDy0OHGao0NNVL7o1cRMKCvIElgagploJ9

2GJ0GV0NgGNBIzj7Qfw3ITzvehhTODGGGcUImvqmABEKgEsBiw66VjKmw8TD+V/BH7DI5EtkK1zavMj4tCxZoXGTOCnrcFKu/491iJwAsYFUwDRQhW1BZhxQAUAFE2FOaqFAI2QibS5YJBybae6VxQRRYWDmwcUkHBWWxCsCERbV4YF3wZgIiN57YC6mGBfptQHyShIpfRDgFWp1MrMP7eF+Ra8hYZB3LBdtDzSX/UEQAcwDkVCWJDUuP5DAPAC6

VKwV1EHXQJ4BkzgJ5zqmOazFbK/Asqzi06XsNgCKZyOxzDeWCnMJqoucw3DkVzDTwQkAHYAHcw5X4kYAl16/TQmIYtdfEw5rIFngOdTTCPL/ACyQSBfmHMHH+YZyA6FwQLD0NoNtVQ3t8XCFhRdCYOaYZGeSJA7NVBVbgEWFafHcVMWJTxUTJdvGEBuDOUpiwrWiGmDcWEkr1RdqKzHhyE+RAAbwQFGEFBVAcBLlcUHZ+AIIvv9fCD2OzCSWH7ML

NFOSwqygJzDZFoLbSFABcwulhgukGWGrbSeocywx5hlihjlAvMPMgG8w7lhnzDV+bL9QFYeyvM/wjE1MwhisOq2j61SVhZX9pWE15EeSDCwvu8mm1PLrKsJ8msiw9VhhopNWG/n21YToCXVhOLDQRSGsKNIROgwrG28pBGEJJ2EYdm/ZSh8oBxGHIvRZlkXHcgoYfQ9IqYCBDyo0IXBaV0ohIpraCLIQK3GB4yiUHnToiAvgbLYVJud/BqciQJll

6iXjKJqu/8hr7HIP0blzAr32R71PEGgPWatFk1HpOWBReLAOAxvMjVAkPoy4FJKFVIJiwQR0LbI+dVYMGR+3gwZZFRDBbeYY6DDsJhjlCiMdhZWZJ2EUzHkBlLwU++L0spnIUBXgKBhQnjBAvt0R7Y9F5UJrzNEo/CQbEYv40aOGfwa2AjUUMg7OI2gDgHvCQAmZoEGFCwEYaj7fIv2/steeCMZwTwNugdMseZEcP6eISYsungcB+azM3qZ8B0aD

gkIbJKzQdaR5p3xEDk85LGgCu5JTz1lksfmsOcDsBPoyiTybyscPwgQRqanAF3z07VJ6vGWQe+hTkxR6lTmztLA6X5oW5A1yFOD33oWMwtih49drj5MMIXtqJkNMh4ZB7gGenkPDnPOQG0gxI624fH2gltUg28hfqkF36x3gFYMlAQ/IVZwwYFGcJwYCZwnZhaqNMeiVpEZimBdbVAqj9G56S0KdrtLQ+KORM41bxznFLlGZwoHBVh9e/7bylwaJ

lAUCAhABtFCEWiexiC2HI63/kCNDl2hgLFMENaAiHZ08Yr3HpwiWNabAhIc2VKWCHGjGfAmKcAnc2DKe4MOQccAuhhsnC2J6TMLLPtMw6jA8IVq0SQBEejJi9UK2a6cPr6F8A2YUCgT+IVI0404urSTYdIVLQA5ahlmChzFfwpow4gqNJcgpph0NYuFQQoSIyc1TwTEsP7MHrofEydhgaCAYuHbyO7XUqafMxuvh8rGi4r7MF5S/fgnzhHRHDcPE

8QtcRcBSgTRsH8whpAB1q2Sgq9L6FXVoCbca5gqrYJv6oRnufsqqKCgMi4RqCfQkH+EsMYlaEWly5rnKWAQFWcMO8I2EuVj3eWhMMTrEFh5+gJV4PREevkR9IGIbpxnGG4MDwYpkMOVw4dC1/BCiTG4YLpCbhdxdQTDTcPp0qiAObhL+QUJqqoLuoitw4VhV+FiUAbcJYUA7YOfQO3Db1z7cIIYPEwJuYdhgyGAl0NwIVkYTagV3CFyyO+DQ+iy8

NEET3C1mC5DFe4ebMd7hdugvuEVvDHwgoQv7hplC2+5lQzXIB5wUJ0ZfB46A7wMijge/PLuSxCCu4jr2ExIDw5+eXygQeHdcOUWBDwp34A3CbFBDcMRoUGYXnhdQl0LhylwbEPWIGbhGPCTUHY8PLmJ4CVbhBPDgEBE8LaSIVhYIAZPD9VwU8N/2qSganhirhTuFIi3p4SLoRnhKzBmeHzmBM+mzwsqEHPCYnZ20QvWAjwxkGH3CdmHfcMF4Xd5K

P+0JhReFulxJ5saQ4Ae87c0qgS/GlEiSxSx+jnIBVCaIHhtvMlZaqVpIHBDroDuoCFGW0GJ05Exo8WQTATRQ8zMKpJdZQ6oDcFKX9IOSXe900Eft2XYW+g7MuQTkVL5t0yW4GAKBVSv7sIXYTxyQLAWQzS0wAV6j5711UgLRANEugURkzj3lk9YOawNPwlj5e55B+CnUI6rG/SkfEjK6sgCJfim6afhs/DCCKOMEPQg4wEJ8p5tpUZtdyCAOvw0O

cm/DbAF4AJ34ekrLYMk7ClIDa+w52qwfKVB9p8ZUGK8K4PhXIGfhvfhNRQL8PMYCfwpMAZ/Ch/w3sUv4bEca/hHFwt+F38OF1DreH0+qfDLjbEbhAgA7CYyg5Hd0H4+kHBEBFUUSwZXQg0Hn0lrwAltKCqv78PiTdxiTYnwkKHiU3URLBcO0oYd0uVvhIiC4yEvoJfgSVwgPBfmCRT5H9xlsLuwRYsS5opkbuBWnUvHgN8oe6d3gEj3ErsFjYMcm

cCCDTr78L/4RmcAI4UCt0KBdgkeiK1veR4FjwpKDDmADcr6wIauT5xTK5lQlmyOEoXMIl5tf+ETDCkEW74ZZWZ3hdCByCNpxodvKreefE63SqCLeYOMCDQRY1cLfgjUG0EWwoXQR4+pgx4odGLtAcDBZhWacjLqhMONgXdvU2BnTJ9BGBREMEWRMFZWsgj8UDyCIsEadQKwRKgjuJZqCLsEaNXPfiWgjH7wDhCkoPAIq1mj9cUGjxQBesFNoS4A2

1YwuHeolpONI7GuEuAj7kYlhCePuTddriinhlyHUDFz6sJwgiIq9xH9gkpVMlix+FnMdAj04HUh1fQcfQ79urODKz5sMKDgI6EUSwIWD6Mp+vVk/BKtCHgUWDxYGKrkrsCoGQGqXwDpJ4BawoCK02cwAhIAcv5VMChAe34WKsLPCuPptYX+IWJ7MZg5ugjZ7T3lcMLgAJCgDBxjhGMUBvMIgYaf4FwjLBbijV5bJ38FYRxrR1hGJJBlZGJQbYRQf

DWeGxsGEoPsIhF+Fgsv+ZpCiHQOcIgERcRE/xIIGF9ZDEkT/mcREHTQM/kjRFrkLwR7gUOkH9oIV4ZwfQIRJKRHhFeuSt4C8I/H+UdsWjB+GED4dbob4RewjnVb0TVBEcN4IERZwjrDiWC3BEbeYXJQdwiv+aY7077s3QtTB/Do6gCVAAUJg7CTVOA/I3iQsqBzhMOdPfoVaQg0EIdGtlO9pXPgL7cdJaKNX4jubIYEknskgqS1nTtwe6jNoRBV0

OhHt8NE7lcfHchvmD4aycDFy7HGA6YIyck2NDWaFeAYQImuBlaD8vCzCJZ1PDXaqQ3vUpX7joRCYNOAIwAQ6sPxwPZFQyErATruNph1TB6SWfAjhQFTOTVDUAFTlwvSHTOGN4wlYfzgxGF9YVOCNYYdQwBWAPCLHZLaIy18SHIg2BOiLBFC6IuR8J+gBM61FXeEhnsX0RyP5ZdaBiKnoh7w+cAgzx50hhiNuYT7tKUY0YieVTzsAr4NdKaDKsvCb

SZ+CL2wQEIodBGIjYxGqFXjEaQAB0RSYjY+Q7pFdEWmImXUnoiD2JZiJaoJX5I1BOegWnaqvwLESGI4sRT59SxF26HLETgwJkR+dd3QGeQLAcOVgf0A0FNPoZx/U8+gkhEc80dAyhF7KjOdtUSKcGElgLcpboCJhpZfFwuzPIJ0zQKCymLA8D2Uc01SpaqiJIzsg3TNBiCdkyGs4OmvgMIm6g4El7G43QUGItpZTehdThGuHJjy40p1zWbh05YGA

gugHzUPzwnigZvCIJE++HzUG/8cH8gyRChjaMM/IcHwpt4lxgaRCG1kuMDQQC9OGPD4JEL+GgkehcVC4cEjqKyQSKasEhIsFeEP5NxjF0IwkWqNQgihJAcJGAIDwkQnyDKyu1wpeFmMXFLkZPZZuqIi3OEWXXAkeRIhCRyFAYJGo8JlIO7+H9CREi0WAuUOokShI1t4dEjiRGlVjEkcxI49YqIBK2HWs0nQViETHudQBYyJJwCaLkP6G/ABlQ1EK

fal9jrTVF7M96p0eJxlh5Yn3uIDEImBZVCpn1DaJLiC+U2BI8HzcuR3/r/TPf+w18iuGjX39wWcgvzBuN1VpbiCGkqIvXCzQxJ8RRxHhAWHjpw922kGDx1JHD1yYu5QZ8A1EARqxIVkGYF7ubtg+j4EpFJSO+hClIvUQlIhASaW9WNkLGsEaAy5EP47i0L1Rh/wsJhTYiIKGkQEykTNhHKR1Yg8pEZCOyNsuI69+/nCsQiEAGwPDwkFtAvZk5j66

Dw2Ypb2PCcF04AfDFWUGEIHSGguKqEWVCbpnhkMm3b0W3Fg7cR7JiEsDHgSThiDc1RFeX1zAUn3d8RgeCv0GvQN+9FC7a+wRaDmUatjnPYNWkN22bGV8P6bgQU1rGuNN8q7MLDpuPFPWM7sTi6YogHAAlwFjXGVEK6RLAQbpH5qDukbThA3Yj0iQvw/qFekTNbGNO00jUERhThCYRVI/wR7ldv+HoAHekcv4T6Rud53Xj3SN+kUh6J6RAMjfOHd9

wz4dsgDnAlQB+Pj0ABPADpgnkRyxQ1pDwInQKC0eHoujj1r0CTki6tAZMJGmbCQF2CdyRX5Jsg4ieU5AntBE4B86NQItgy1DD8uGZINugeMwv3BK7DpI5o6DqAPRbANOIKBukCzJQPrJf/Ghcrko+TAjE0EESB7IxekpZEBZO53SFH+5VAwlLhX2RlRGVkTjnVWRdahYoKi1gg5FShOkKW8NwZCKVDTtmkPXiRbldTJ4BAO1kSStPKgasj9ZEMzz

a5OjI5ChmP5hlT8VFMcNK7VsOe4DRqTqS2nyNbAP+uFO8xsBkJDJgTZoAKcuCIy+ZqkBwvjlwr3sEkDmKGKj15qutIlUeAsi6b6SwG+jkx2Kgod0soTJAIOeAZrlKcgX49v/Y1HyVzB2GYshxdVBOArolUnGsbcTgRfQKsRLZD2RBe2cEsLiIwIAlwEXYCXAdzAhwANC5tkN2TiQgnQuiD8++zxQHwAM+AHgAvDZ5gCGmz0vm80J+mZL41gH7BnJ

PhumSpkZGhUES+fTPQAfiIrs98CzY4dv1oYbdAw+hubQs4EKcPvdHUAGeubAicgr5FFv/srkEUKKKEuyRQ+WkMleQn/2sUZe8ZiCLFkh/Qg7iWuATEQ7IkZAK8VL8Gi/RxOAyQDioPmHA0MWvdBiQKtAZAOrgq3uxCCYk5AD3JOuHETjAePIKAAmNwMkYrNMbqTX1nnxL4nL4InQavhjBZe8p1xxA/limCMMutlSm41CIicAlsKoy00170G0CJGY

dJwukmvuCJEG+SJPoYHgm222xdgXYwxxbCnBUJtEmBRLSj6txPYeog/XmisifXb4Sj5SAbxWqhgME+FHBinEiIIomB2DMjwIw9yRPAYZbRl2EBckYF8/0abNUAYRROEpRFG9c3UkY/XQDO+8EiQB41DgAApAACG8JN0RA1cTawFJUWPALj87ZIGBg8CH0oIjEUaIQwzYKPDDNbAPBR0U8CFGcj19ksYUUm+JrtG+BkKIXYUcg7MBJV0k5GNNymYV

cA+qoUOkcWpVgGYUXwjJmm05pWerGOx4UYZwrKirWFLDqp6wo4rXRH9GeWsElFS1iSUZaCFJR4iiSEySKOw2NZlZERoFCbWHgUIiYZWjNJRG6wMlFoi3n6tkopauhTD+gF+cJQaIMAeKAqkA4AD2BFHkSnTKeQtO1u4rI0m7zhXQcMkpBcnjxljXXIicUEpM0dA7ZRr9jWKPnwZTICHQNpapoLb4c+I0n6VCjEyE0KN6EYHgtpu2xcpYxc0nHfv6

9RsclptkyxCnFUQZwoxVcMeDB2ELvy+Rol3T3yO1DoaEjMDXYtwsXYmOLNLlFQ0K9ODcolAB2b1bYqegQGwN6STTcs+9cL7GTwFTtbIv/uXXMHlGiNWSUakwl5RGgCXZGtSJQaNxGeaBEDhEcETIPyqkUI3SmcWx64hBoNmFnORK8gklhaCxxsXKOKrGTxI3qgZHSEyThsPWULeI7tgLJjaTXcka6nP+mS7DM4EpyOifjMwgF2X4iAEGXQDhgosw

6pe8TImiRgBGPYRBgrhRsWDY8EKax7fLBNFnKdG9kDD3EIe7AjIoKiuPkaxj2QlEwmHxSAim40GZDN7WfAlosMSsPLIGZDoHHKoCYtH/BHncAdaGlxlngAAdfmAIzIdaAwb52sISuTVVMlQC8EqhhgKCEBEQrG6wD2hAW0i9DqKxkoHJ/aKuGgkN2TVUGyGGPpcUA9y4sKAhAkeVrRtbEI3QAz0arIGy3q8CbrmiSiqlFMiwYoL2oZ2A8uhJFADr

h8oBwAVmQMTANIjXKD3BDa8Edy7XdO3IO2CGWrJ6bV+Wvwovz+sFMoGVyaoMvgBTDYOENh7EZzMSszqjyMZ7gi2iJHeLF2D3D3sLakJWoPWLBN8gnUU3SCqPymsKohyuJ4BRVH+/mxMGMkc1RymtVaSyqOP4vKo6j0iqiGgSxzATtgRQMfSGqiRro4TCt8rAcXVRi2dxICGqONUQzIGd8ZqjZBJDJEtUaC8PVmjgEOFir+XWoMagBXQTqjcTARvx

PLgXxD1Rd5x6lDeqM4xHdQ6ChLXwA1EzjVWIe5QUNRkKRw1FXr0xQVGo+AWMaiwNyNAHjUX6uQrKyajU1F8xHTUdwCX54Waj3iZoTEswHmo+RcDp0RvzFqKQ9GMKMtRFesUqBwkMnLhexedm3459Fb0jXrUTqkINWorZEJQaAOLFh2oyfBp44weD64HOmHrmOu8znCGxFS0PCYTLQx7oOEwhVHOENp7AwoAdR9/4JVEjqOlUVwJcdRCy1CJrTqJ1

eLOotKQ86j1VE6+U1UcuoivB3Xdua56qJnoJuok1RO6i8ojmqP3UXCgK1RevxbVHngFPUQ6oi9RgUkr1H0vzdUQpCO9RVFAvVEMyB9Uc+or8hb6jGRAfqPWIZkAMNRHAB9uYmrwh5nILADRzK8gNEgaMTUedQcDRl0R7ywZqJg0W13ODRAzAENHRAPzUchootR+AIS1HoaJ+DBWo7DRVai8NErq2nikRov/Ig3lSNGtqJVoO2oqd8naj1FFRNyfr

iDgsoAY7xMzRygGTpoaHWBEIdJIyAVCOc9p0BdmKnixfmgHXBU7JviYugTCQMOBnXidBnEsPIs1RwnxCKUj+tuePbGOsZDOhEMCI1Ebd3QXeq7DuKEvQM4fJogY4+UJlSwhERGmAFeEKYRkCDeVEnKINhm/QmDujR9Ae7HAAdtE4iAf+HVUpIDFgAcRA4eV+EIRkWvTBYGz6EgTRXA7i9QFFuQPGgR5AyaBuWRFwARYFOQNj6fc+PsDnxCaoD9yr

JYGtBYgwKdorCzf8uj4LAoQEhDKiFhGRbkacdOGDQjFN4cO1RNLK0ToIuUCPJGLsN8UdvI3t+XfCe74jcFy+G3TTdAiZBTyGtLGAwRghfngdS9DlE8qJOvrWApqBRH9YIFwdyB7lQhfOSml40apgQEK4AuieTgCEDVVChwAu4i3wE0ML8IWE6jQNu0T3ItuqtHCsQgtoDPECKhU2SLXp2i4IOhegMwkY9A/JEtgDhknPjLJwEzQ4xdY7iwSDJJlL

1aihnSlQAZOCEugJQSYhh7uC35KyjzTQQso9URyo8gi5ZoMCUTmgzvEuXZc4ThhiUjjz6RRBUkgvHqt5Q2YSe7UIkC78aninCJDMKJnaP+XEB4Cp+a00YL98SOaP/N2KzTrBFoBXoINkwgAl55ZbxIMDxQFp2wejiGCsiFmnrRQEW4xVwFTA+a31XmtvcxhLKA3dFSiA90WNvCqg/n9vdE7Twniv7okQAgejd54oMDJWvtPMPRnXDe/i1UFb1jHo

ivRjIgE9FBgCm3kB4XZgiVdfNbp6ICVMT+VBMdjg+PogUPUflbI/wBgKis9HAiMPYhXML3RCxhC9EJsGL0fLeKq4uv8K9Gh6NLgNXoqJ4teio9HvZHn0WNRX7eTeik9E05QFQKnomhwnejx0EaSOrYYYJUKhpwwk4DVADQET6g2ihG/I6775CRp3GiaPBa2Ah6zzkT0DZtmNRO4WNJ+04r91sHv3XXXR3S59dHzKP+biwTPmR1Ci6VEUZzFsHUAK

LKqH9cQoWm1aWJQ0azQoRA9kzcqMfofh/dTMj2lI7KrMHKYB3eBG8IQA33DPF1h3j6yMHerNCJUAkKATWim6LzQLNAs3BpzxNvC64fAxUq9CDEAGGIMejwTZQGv9a56n13rnv3oxYhg+jbWEBAIoMXHObAxNBi8DFrKzUMAwYt4wTBiAaAsGNBYE1I1T2LIj0+Eib1XEZ96fAA8wBE8FX6O8PqL0X449xY+BEgphHqnOgCkIELoDNwS+AZ6loeWA

0OZ8d6Hndw3kfTgnneyOj2CZgGM4nhAY0H2X4icTS0nCH4djMQ+sdilkNh2Zm0gcto45RhZC1tFT3zcToKHB+q/XpSw6KlTioCybKhC6cACait9gORD8AA5E8nBl4L4UMsRCPA3uRY8DQUYNAGIANytSQAg785JZthwFpAW/a5spJ9GYKCqELjHNICxoW7B/45V8HHqmMgTXmOujOlITCHnYDryPpOJ7doE670O5kaMwukm1hjyaa2GI4nPIQZqc

g+JDqhZT24oZIAbaRYq5cNjrwBxArExbVuCOkpUxGVHRTgLgoQuVANgUBiFzivggg5+RZoYF0S2CC6dKnEJZOnGhzgAWhWXQBgMfeOhXAMBgq8EgYSqVbuR4CjPW599kXAJlAeIAQgB+zoRHgXHjpMSEapaV4+i4CLumDXSesC6kcjriOphGgN8IMlRuHQnZSuCFeij9ubf+Wbdu44rSMN0RnAxgRu8izdHvyF6MVVUVy2SB4f4Ho6J99qh/PBhw

uJ+k4qwFZvkHAd1o+YUC5GfHyLkRL4dIgpciljbbIDcRNJANk8EWBZZGLQFa9NIXV5oGeV0uCRYCulBLwMCAaONaBg3aM8Xu5AzshK4jQ/R9GKRMRY/OAgjqgw4I+9y7cO8eEJY+vIp6FpeAcEIxaCPgWDMkyzBOA3JFGlXRAKTEFg74wLLAJxgSCkvFk/9G5cIOQeuQihRjr0llE5H26MVxQ9HR5bcj5Gw22mkdwkZXIQHdawxl+yDbg/QwuR50

jDDGQGhqCrog1rQstkNMFMKFpVJSqJuARAY/hRf2j+FP6AGoAfh4CQi1yBrgMr9GhQUsgpbxziA9YgYg5taHg0TEEVIDMQUVUCxB7eBrEEuGhgIOEgOxBZiAHEFFVCcQTvIFxB/6w3EEoNFAoA3kMqoAPEBE4+yPTwB/GbsqHC9JNboXiITOdKTZkU2wXZIxkwLQa3uDGmhkZm9ztlSN3AtHeHRVKjPJE0qJhMSaYsrhaciLkGrS3BZA9MM+ROJi

jEBfyL/vtHgvpyWuRSTGZFw/oM0hTaAucASPjqhmr6DRgMRMGeVq5FAKMNROe9FyB3OiuTF3aJ5MQ9owrAuAATwAx6HHDD4AAyRXEUuNzwSAE+iZfNuQxLA+eaSWCegCKEIh+3nB5aiP2Fwtp0pCfIatwppwnsGtgBzItlcv2kDdFAGKduiAY5ZRo5iglGMh1Fkb44aDo1/9WlgmTDNOLWkXwU2k15ZGQdzmtOv6TrmkgxGRCDlyDADusHNAwIA1

aHQ6j0Gkawulm5rdHoBEWJ30N4oby46gB9sLw3g7nl8w6ixBUi1yBw7AivIkQSd+Kp1wZFDgMbEVDI9ERhFisrhqREYsWRYlixNhRyAGr8wJYQhQ30+aBdimFtSIPEDnYM8Q3aAKGC7aUFMUjg3aYV9Abp4PpjHYS2nXwgEcN3bB79BJsLL1Obq+GBnQYtG3+tjSAKD8UFjgTxC6A0APwnBE23QjTdGXILzvrtcK+wgeUZfBT7HrKJQkdBmiSYBR

xo3EFXFzfB+RypABzYesXFwfZgeqgoSctgYqcE7sE+2X+qywAvMBUFA0GGTZMTgyRie+HFhgZsqr2Qkg/N40XwQZwqEEtA6kImloqKFes1bPFmfeWofWBvGxIsx87OdMboCodhrkFzAHHYTUbGDYA1g0cRw2XvQe2/a6B3O8OjEyQN3IdqIrKeq0srYxuGOsbrAYktBd1ABNJeGLUQT4Ysea7yD1tEafkt4jgwMZI8ai6KB5UGJQPENFXW0C8y9A

QoNYVj+cTVsGzBSxG7PH/Zs2zKCUDKRBuwmiS2scLPMvQjXUCngBQBS8miLVC4q7F7wSOFH92uYoMZIofkKxCCbT/UYuzMvWqYkfmC96EzgGlrWsAmvESWx8Gx+sQtrdKs1BjKjAC6TSFJWIcYa8KQIsbDYVSDMErYagPIhSIxhXAk4vRkJGxCMiC2HXWMqML3ZAmA0dlAgA7nz2IeRvJZ4/s9XHZffmzEM4AUuAB30kL4VJFQ9OlWU8SToJCAjh

rk1IYp9c6xif5avz3UVOUslcT38tW9H7wnghJsbXyJN0oB1R0auQkJMKoCeP89gFxeJwqSusbjPcgAH6F6qilYSBsdzWBkGTitvwSpVmt8KkkQZIFXw8lCyBFw2uXQuACHAIPFC7ilSuI/efT8ZdkX4pRmErEEaySVy6+h2eBkAECorGYGdUORhZbF/DioMdtYyowdVDbmC3YPbAC7sUoizJDC5jo2OsAiMvU8Mq3JexDWsgMkgocCdiALh6TDAY

ArUGIEerwpeDHZiYCmv4YdYxlhnYhc4DMfR6oIN+MxQYrhBkhN/g/6vvte9kIGQu57iKFogIYwSiYMRxZnZp1g/Ql9YuVgcgsMfgpr3BXPiZeT6pBCJkh1iCYkZlAMdIVmAnKDi6GOYHzERFYLGQQV4MfiyrOQAec4hWC/RLKABwuMUtAkuYxCOp7FdxFsWf8csQ/G0ltocpBU/phzbuxMpB2mAowBCNg+YM3wj/EzeEVsnDOCuAe0UjdjI1GLs1

FXlHQ6dwqFxr4gVsnArrNtIYcAE5K2SEiHXsQ2tEgAVdiDKAd2N8WiBAWgE5Q4xZ7ciTBsUttM3hO9izmD4YXzsiskTNkJtBkqDEiAR3jaNADmpHIxJFhQByAP+cdygVmFlKyhMCSSAQYSRQmDjSJjznHDAGVCVwwu1B8mxerT/wTbMQvQWQE3/CiYkBUBQoK9ajPAq9I1AX6+GlcT7WIYBEoDE2I7/L08SER0QEADpIwFlwFvvROyZqD97HCXwZ

ER0AjmgHAJSoISUWUVrUCDlI1b0rGHcUQb/LgvMYU3YlmKyq2KH/BRRfr8sfE7RAHfhgAACQoiUToJl8HW8J/MFZcJDa0hhBhiT+HiBga+AA6y5gavA72LCgAjNeX4M6EwRH56LCgOXAVQEPOhuxCOjDfTFs8F4A0VB8bCVBnlGEtYr6iiOszFCNACrsYyMeiCPzA0OSN6kVbB/Y/Q26BxtkgiOLP+JV8KIAbNEyK4X8R70HZnRuxobhTCITsVT2

rbVSlkhW1wV7DYSQxveNfPWrWsEnEgqK6YJqNC6epawb5iIelbRgEaED8xohYZ7UsPicU3Y1PWV+CR8ipMCz4l5XHexaYQ+7FrYAHsdgAFoMKkEF1h/DhadgvoOMSphVecb1iCeHKnmcxQV4EXS6RJHpMMBWGJgxqBzaHWaM9yP7wlSEKYixJExgRtUTkCegUDBFA/L0ChN1piwQQ49rgbKB5OPmdnrhWY0idlC2SxtVBYMUtKCRmVAOxI5+Etot

PeAVBN1CChxX4K85g8wM3hZiohaxE3keeIU4v4UisRWnF6HWj8IWnSJcZtE84DxiOAQDQQeT6/ahBdZb4UrEKxKa5SaegyTCD/mBcAssKTm0lAkag/kB7mM/MBQ4xAFQRQVOIucVfYhbWZB1nv7oGCwMRRYsvQx6onHHKTRW3oHyTMSOCQ4YB78UxYL3pa1kM8Vk9B+VwpdrzQVDwOARY7Fb6FQuBOI+MUa4ID9rJrW/LjlcNAE8/w5wz0uJpcND

YnMwQhiffCUgCgOsJQX5QlSggRY1OPVLKq4wf41j57ohwaD+iNGEI78KeQaoTlzD//PAJD9ahjBWhSpmH7Zmx/TigP+gpRbc0Nw8jjjItwydc9cKA0LiXG6KZmcYWjwCrmPgrcJ/rd8MUdCSWxy0GPQiKgPfiJLiClB2AFNcX78EasIVBfoQirzJSE/oX74wz9a9LKKCnoO1yVF4GEojfDO0VYAG+OD0444Z0q4U0DX8CPPbahgc03WCX/BT4mXe

VqhV9F6mCq9FT2qyIUWEETiGvhMACwFqVpJigKQp4RbInBViNgYOKsOsQnf5UMSsgMQwHIAOTjqXHdiGyDJVYYpa9Lg1QBIoBzQh0UFFIyHoGJHoLC8wliYUgh/hg/8j4cQLfHgvaiWYhjsrjYQW0eHv8QF0DYCzlLkBDdAEl+MvyjwoKDAb2LfSM/MS0U6aEQ0BFQUJOutQCdxHTip3EYsCIccKvNZxTg0MI5/lhAQN/YqEEwz8GOI8OOkMLxnI

/qWxhV3BrbxDAJfYypRi7Nsgxkr0XDNOoSbeNwxvfAD5BwMBi7NDIFG0VwBKuFPDApNWxQnfgiDZLbV9vE2IOkRh+QyPGXRDPXpFxBVwnyC8PEOjAgACB+QAAKATpnBEAAlQdFAg+JokgYqhVvPeCOFAZTFxuTujFV6NphBEwT6hwPEpJG7gDZQTBxzW8z3FYeL9sY18EL8SZkVXHe2LVcfEYL+8DbipOZwATRATnAK9C4HpW0aS4hqePG4jKQtY

gXi7fMHUccjY2p4NURy5jweIhsZhzBbO0hwF7FYcWI+l08QlxakR5KB9PCR1qaMPGhwDjnXE34XrUMujOTxxyh3bEXWL+HLXRMuyVDMkLgdLyqhB7YlSIwVEojBGUAAcbWYEpxoegCVQijTsAiF4nmxnAQnQR1AAzcX7ncHaz1ZRGAEXEOoHD2cc+UR0LxIYLBtceLxPyAqN4k3RGeIyUGnoUICLX8eL5551WsR0DDax8v8obEqeL3HPC4IsRb4Y

f0LhiLUAQygpBxZH8YvGdePxsVt8Pxad1i+QGJOOxVu/rfwwrBhUDrEuA+sSasGag4NjeuZ/WI8OuZ4wZIINiARaVOM6cVUosbxitjH7wREULsR53RGxtL1kbEZvFVFgHY5Na4ItYDjneKFbLjY7JhR3jCbHdtXYYCvY0eimSiDV7L8x1scmAZRQAFkXQC02PeQIusejCjNjD2KFRAm/qzYtuY7NiAWDzLUq8dUCMLxzyl+bGqAEFsVWtEcQ1dFQ

DoGgm/8BLYy34UtivJpc2P//PLYoWeL3iangq2MBsUP+KP8CoNNbGJeN2Eqm4CH8+tilFCSjF88Ri4blgyQp5xhkrwVXuKnKSINtj0Z61zAOOrR4R2xsjAojokxF5no94uR8IXjg7GGuPJiG6wNFaAdjJ2JAi0XSCHYz8gYdjcdKO0VJ1tHY5SIYrjp7zXOJRgEnYy/wKdifCh6r3Tsf5ozOxfrCaL6wfRYoMN4LKsBdi+nimiDn6hpEMux/PYHw

zhOOrsSpQEziqdYKlA20NW8fe4lbmqQAUfEsBHrEB3YtUhXdipMQ92KGcQUyT1IVelMYJjqBHsZgxPFA49jBvyT2MdENY7WexDZx57F7gj1IUvYqC+H3jNRDv2L28e+OFbm9jjV0DxFQ+8aadI+xK5gT7HNdjPsdXRYF+n7iEPELa02VsswO+x0VAH7HNdifsaZ+KMAOfgNhRaiDr8V/YyzkegBf7GatiHZIA4vlxJCxL7FgOND8V6YSBxYUBoHE

ba3LmPA4qcQJ1jlFp1AjN4Wg436gygBMHG/lmwcVckZ5g+Dik/FEONPWCQ4wgAZDi2uEEwEocZlQbziuYl7QB4oEiVjmoBiAcHNvwDxgHdANWMS/OqUj4/CEAW4catyboAfDi7Hi4AEEcVZEYRxH3j4kinPnpXscoYMR0jiagSL+KzcPsdBRx49ElHEGyJUcbjlNRx5PizFCaOKekdo4qL+vgA9HGjMQewZ4tV/BxjjloSR+DMcf6Mb6xKrjU0J3

0VscfSkM3hjjjfTDUYQXZNfEdxxYBhPHFmsF7PL446iAPFAAnE9smCcfhkUJxtcx23FkYTZVDE4jAJk7j6/HdiCScTn447yRvF0nGHWEycbWYbJxHTjcnFX8IKcf6AIpx5DFYXF++OUiOS2EQJtnjjPr6uOLWAssBpxenjwMbNOPkNq04s5hdfidAn7ENgsD04nwWQIjSHFF6Gwkb3Y6JI/djI/FjOJH8FEQjA4/LYgaGzAmpQGQVSfxVEAFnG+k

CWcQKXV3QqzivMYbOMZGOeo/Fel3C6gT7OJpEICXY5xpHJTnErL1I5FS40QJfBDFAkQCLt0CxjIGI/oAnnEJrVecXEw8ESnziY2F0EWnmCDYlSI9HNAXHTcOBcWbWUFxNKBwXHK0RQcStAfo6MLjHo6SLjzooi48mQQ4Bpq5ZmDwgOi472eWbgsXHxmBxcVoARSE0rB7ViEuOliHUAWNxfahjUDkuKC8ec4nUQlzjRGq0uInEcq4r2x43iFHypeO

x4SzQFSE/8BQKClHR5cfL/PlxjVCk55FWEFGMK45fIjZwTOLfOK9/iO4mVxXVdKLgKuLU1pgY5TxWwTaDF3UVsUFq4h1invjbKF6BPmdoy4n2xlAt1qB1eL9+Oa4i2ee/xEdbJUHh8ZdEE5gaVwC2EUVmZ8a643uiudFPXHAr2NhJWJP1xtvxA3GViGDcXy4UNx1ihw3EytkjcQRKaNxcAjZhh7gjBCYaIJNxiNAnQSpuJsCbgAXLx7bJb9oYSg1

ZJHbE8SOARC3GZAnSriW4lig4lwjdgAbi2oTtYjpeftja3FwGHrcRnQxtxeKBm3EgflbcZXY6uxtYAu3FOADPVL24ukW/biXkpDuI65CO48UJ47jtAm9cxncXoQKpQ9gAhQAJskQsDqWVdxSkjePLA0NpQFSIQfIyIsy7LJMOxWgkCQ9xTvJj3HsuNk8WawC9xQfDM8LXuLPnkG5H3xqTjCN4UgmfcWEAV9xabhkqAfuPz8ekE3JgP7iwgk0oHQj

lnAYIAtIoC4DAeJyhKB4u/wFHNo/CSeJ0oFqXGDxUO84PEWBINCcdlFDxFHN8CKYeKdBJ0UBVBDHiBdKEeNx8oJQEjxGWsBDDkeJuES+oKjx37E1loXJCE8LSgSjajHiWPFseIkyDJQLjxQYA79C8eKpEPx42EO/jAhPGfABE8TLcdbsz6hKvLZhNTgFJ4twiNM1ZaAWsFu5EKwAVACniMmHF/gEMcCE+Us6nipQmaeK+MPSkb1IuniiVj6eNDWk

1ETQACbiTPEtnGQCWrY80C/DjTALWeKLCYIcezxPjxZSxhAGI+mesBdxBHkPPFw9g4WFrPEhYvelsjCP3gRQEKo75wwXjE/yYsER8VJECLxEVxVbxTpAy8dc4v0w8XjKAIEXFD0IWnZlxaXiCfFJm0DrlKIbLxzITmAk8DgK8a4NBdxnnjoc7s5x1vOV4siYsITqvFrAlq8beEhBW8ZxGvGo9hiIBnDXUK8QR1/RECjfCBDIoSxAKileEkpHwCSt

YrpI61jmfGHePVoYB4XrxNqRI2xHWKNeEv4wf40hhYQlSRPTnpN4t3Y03idfJPWKM1vN4t6xmKBlvGR+Bs8et4sYcD4SzPEoBO28UwAb8SxkTHlGhaw+CbDY25gFdEsbF+fwu8Y7rW3wqNibvEY2LO8ZmkHGxx2dLKFl6Fe8bq1BPI1dEM8FfeLLktRQKmx/3iabF02JB8WuvMUwd60uogs2J4HGzYwxQsPj6ImjePGoY+cPmxmgEpKARfmfsaKI

DHxfYQsfETaQK0pLY6RW+PjYQlE+MrcQFE0nxANinwmU+JM8mn4QqINPiIom62JsjjeYUNxvel/AIbKHNscdlTnxL94UAI8+PKyqSIe2xAvjBzBO2OF8X3PBkaiQT8IlwaEl8V146XxbFw/ThRzXl8QUYW8snkSVfEYsMrUFHY3LSkfJa7HiuNi8br4wagdagDfEJsiN8YgKDOxA3i7RA52IB2lb4/Ox7niZGB2+JLsXzER3x4+hnfH8BLd8ZQcD

3xohgG7HvhObsRloUIEgfjiUHB+P1SAM4pwJRAgRnFD2Jj8QShaag8fiY8AT2P9EtPYsCAqfieRQqKAz8bPoLPxLEoJAlv2OMiaFEg7x/gTi/FSsFL8YfY8gCPQppuGn2OiKJGcWvx0YTLAmOiEb8d47Vaw99jIEiP2M2cNKATvxeLw17HRhL78T/Y4lBf9jh/HEuFH8arWT9xE/ixJE5RGviLP4n0Y8/jy3iIONOsSv46bha/iMfib+O5mOFCXB

xTjBVwn5MX9Egf4sWgR/iT/GoLDP8UnYKhxl/iOMR0OISVnf49yOzDjdCCsOJf8Rw497xXDiCBxf+KvWqd8X/x//jAwBBnXRLiFEhowIAT6Z7fOHACWu4SAJljj5HHRMMUcR8oJ2Rf/xVHHmRKfCWgE1ABIbZMAliMH0cbgEhls+ASeRKEBLd8MQE90UpASqDHkBJscaQoIvxqsIuFS0BMJnvQEyBIjATTTQFYJ0iD44/V47ASdIDWyi4CcBfEJx

a/gwnH8BKicfeyWJxlLYFAlfuKdcBwYbGJQYTpAndWFkCcQweQJe3jMgn5OJA/I0EtQJj0cNAnj+DJ1kPEjuJejw9Ak3uPqcReEjSs59IWnHkkDacd1hP6JXTjaVg2BL6cY9NfJsYMTw/EjOLcCT9jSZxcixpnFEglmcYSMeZxpkTFnGYoGWceiXeMJ6zjzaFbOOiCbs48Iw87I27EngASCbUVeDW5/F4X76hKucQnYl0AV/DsgkPOKsiPkEzw2h

QSkwDFBNgsF84j6i8ZxfnH1DH+cQbYv7WKDispG8FRBcfkCBoJKgSIXH7fH8CS0E+Q2xbxYXEdBIgol0E5FxvQT7NYDBO38rKgYYJa1BRgl4uNLWAS4/EA0wTZgkqsBMGt7+RYJqQTlgmzxKwoGsEumcGwS4byjz1wibsE9lxT2FDglkiWOCZGw04JK69zgmdqEuCfCYa4JbCSIBESuLpnFK4/hRqii5XHhQCfYq8EygxgiSRZ7quIX8Jq4lI62r

i06z/BI2Gga4haJuvk+8GYVzvCeoEC1xUISK3HTGBi8Xa4kwaiISnXFG2N48bX4quhTGF0QnF+GJQFiE3WuoKRcQlR0JCfCG4w2xRITlmARuLmoGSE0yusbjDYi2JJmwsm4+kJ8zA03HXGGZCaAZGSSbISusJzqP8uFyE49RPITLFB8hLLcYKEgFBQISpyaihJrcZThJUwR4TpRbShIjmJ8AFtxZTBnYD8BKVCeSYbtxQCs+3EGGE1CdPeYdxV39

R3EQDmpQFGEtIJtMScwCGhMPoh0UE0JU+El3HPQgo9Gu460Jm7i1SHbuLHwVNbFACToSiJTRikeeHK490JpHJPQkKsAI8T6Eq9xhZh/Qkl+EDCWQJJ9xBSQwwkFYN4vkMkn3x6Bw4wmN+ExYImEgg2KYTxDD9+KG1nMEzMJNHIlwlQeLzCdq2AsJNyS2tbFhOQ8agddqiP6EKwk8DirCbh46KCtYS69LMeQbCelrUkQVHjrhE8OPbCalxTsJ75Bu

wnVhOigsYwJjx8htWPEdsHY8UOEsdIPHi/xIC/EnCRJ2XWsM4TrCJzhLA8VmEwVAOYTpPH7b12SbgYN1gO4SqzKbBKO8Ty4mpJpRFG3F7hMYyIYEy8J4GMDPE3hISSflpR8JQ/4D3AbDTfCTTElbmn4SzIlOeMGSDwEtzxjkTTKCyAX0/KBE+X+4ESCMaBeJJXjBEszEcESqqHheJfOJF45CJs0TRohmeXSiAl4rCJQ4gcIn5xJIWKpEzKJRESeB

w5ePrUKRE3Aw5ETEvFMvEdUp1nMrxGLgYQkxeMYiSqyblwLET6vHxmHYiXnXCw+cQBEBGBIh9oI73fSASx5ISzNEjY7hwlauoJ+51vSaYEkgPP0ZakC5BUwphkDx6MRoWKoa/YhI4eKOVUA+I8H6lN8htF6J1pUajo/t+v0gMDLV0iiQpiObTcdui88A/CCumktomax6DMeb5XF0DMlclEFRT29hQAvbwZXs0YL28vojv2LlDSXVjdnO1w82Qps7

/6BTdGu/Jjez286V6vb1jYKrMH0Rw4jqPETpPi3scoblYmCs8hj5g0MtvxEwSxzGiqpGlKNPfl945jeijx+t5rpNW2huk8dJIqxJ0mcV3myBBMLv+VbCkiadamJUPjDGXAsoAx5Gk90cCvbkfBEyjUa6QnTC1uuQmWrGe+Iik6JIDZODmTUwxXcc45FkyRYocNo43RmZca0lIfzrSUfKMMOR2wRQgCPz+vKToSCQMpkqj7TCK7SZ8Ay9h79DAjEj

HlUvG/VEuAeAALQoZhwM3GmAILAD7o7JFF9FkQMJwL0AKjoTzHnnWgYeCHFIxZCDt5TzADqtG5AJYAVcBvUFqGKM9NrvW/MVYBf76jkMMaPKhdSwM5tEsQGnmnhBzyAcxFaTVpFdCJHMahk7mBI3ARwCggVttsWBXIkNuidICiUIrVFvmckc0eCm2ioThXMWa3CAAbVMVgDa9ysZOzZDXA5qVp+6qqHpcL4KVVQGCDf6qtkM5MdxkjshvGSdcHsR

ghyPoAam4J4AA8DvaPD4NDTPqMSikxBhKIDH7PcUI3UEnCnkIpZTZqqpkp9B9Aiq0maZJ6EQ+PTwcG8kekToiEwJjhk494/tl6ooT8OeQaQ3ML4T4hJBDzJTCsfVeTbRlOi6E7BYE1sKPSVNJNVQeKgxLzBsNsiL0AwIFubpxECe4mcYkBq2sl7tGo923lJtADUAuocNQAgDR9gYCIf1UmuimqRuEmh2NsDNo4zbR7JiUJAObFW0QkO1lj+tE+Fz

pwb1Y372/VitRHbSRHAPuQi0xO4MjoDXRlYePRnb806bFqyQNQJivtBA8nRzcDKdELxEdCnHHbeOakcQ7CYQLoTiRoIawztpfJBjGWu0a5As8xvOjo0lM+kcCPXAGAAANAvbrlaKG1BRqEJMKFjajEl3yzLKriR4yHbg2zFAd2WghSo8Ex8GS5iqIZMyySNo2ExpXCrgEjgF4oadkuGQk5IaaruxyEoTVA91orodcvQ3yJqPt2k6zJHic5IAO2lr

qtogMTgI0FCRCzyBXROqodH01dQrUDuYD8wCEAEBRQOS/MmjHwCyV2Qg8QjrpnXSuuiPAPCotdBjgVcVHs4G4QbSmCz0L1VuTh5xisUdy5VrGUVIh7QYCH4JrqgNfkGBRYXLxHkjSmXTLqxj6DBtHqZKQyd5fNh+QvdTTF1pLPoV+IhmCONM2KThLEE2AohbwKd2T9IELWJzKvF7c6Wc99RsynxGaRvCVQ3J2XDWgBSIDF4KvALBBkPAHwpXqXww

XrfQjBFLoqXQ0uhrimhwjv2piVUiRICBfKKEqLqQDSFEYgy4lEsIULKO+T998x4xBwtAGJvO3eowU/h50+14wYBw/Fy0BYO6ZoUimpuZmBbqL9Di1SgPGI4TwHdZmZHCk74UcKBan99bPeRvBCO5YhEWAFlUUxSeXR6IHJxBgUCXaTM+AlhElhfNE7tnO6Gk+CKIpEA87idIL1fecCrc41hzhNSTWHLNdwKa8itE67ZKfgUqPO3Jr8CJO49GKQKG

RAYYA3aBpvQomKdySMYpliWBRtha6jgjqLyTRuGVhJrtDIGKdMTFgpnJjcCN5yrGMB7k4iLCuwWAMaoYDD/WHbBHbReAAtrJjojsgTvaS+EQcc9TgDZMrDtoXPnRhdd+MmMaUqAMoAFdqXg8X47NjlinuCIZLI+E8ZhaL0KMqISwK26qs0EUTlgS3hl8VflUXgkwdjooXdsKegcCxqR9zDE9WNPyYnI+D+4w94LEeWHswFQoRcAt+T78nzKSkHAC

yPqMEZAsTGy2BMyd+aCKR7x9yskAwMg7qToh7JEW9FQxPyMB7jK0auRckA6vQuCk1wHgANk8IQBasTcoCCwNwybSc71RT45c6K4ye2QiXJ6BS+5GjZIEKUIUiuuFKhhTEYU2t1NocCHq7KhDLGjYGI0MGzSwQ+JQjGI+dhHkFiaQ7ooXAuMyQuSZODpIH6sszR2T6DYzy4fqYzeRDODXxEGJzhMQvbIgMKMoztLWxhtMYdIhtiS3AgvpE6JQMX/k

kjJriciZDumLoQLC4jVYkoA4zGOSSMQVEAJMxgsAUzHwODTMQVwDtg1iCszFgYBzMRf1GAgBZjG+BFmNQlgzdNXU0cU7FisWB0QEP6I04ZPIRwZ+s0ybjpAEFEqXB8XIQSXNHrtuZnksNxjwhoJgx3AS1edgzeV4QCxg1YKYyBOyxgBi8cnPwIJybwU24+5dd8snCyxc5JOpAIYOfAviqEZO8McRkpQptWTLNRc0OksQwceyOlqR5KBCeB3wsVAW

Ho2KBPiljqGEupisSSxDKRzIA8BJNNMBQM9mu1AbdyUUEY5lP+WVAzFjnjDV6Kb0e35ADyhsAjWDqAGkoJ8U15KPxTJLFv6GwQCCUsuAZ7M0rj3IHlmMQAaEpfNBFZ752QPvAnovdiIIBmLHMGEr8soAVwAMnYuaxu6DUAESUxkpenZOMKrkEBKRIwBl44EAQmDeKCOoDxQRM4jaD9NoWrGYsTcwq8M5ICn+Y0/AgbDCrJfRc+hESmZnACfFSA5H

s4LwD8F2gFLlASJUlwgqQASlwlLPZg7Yf5guYBr2bpfmFnu2AW7B5DZlVRkWPRKWRYzEpmKA4Sn/uQC1ExY8ixp8A8SkQIHBKaCACNAJJT5PSwlPIsfKU4IAipThLoolNVbB8Um0p3xS7SnkWPFINIAV0pqAACSmslLdwl6Uibs5JTj8ICoCpKYKgFioj4J6SnslMM1jqkOMpCAAsynWAE5KbWoOEpPJS63j8lNS+CYoYUpwgBRSnrqjhKWa5KUp

DvMuP4pfDlKeHo/0pc08lSlDiBVKWGsNUpgRCNSmH5FJENqU4pIupTyLH6lJk7PaAY0pp0cPOgRpil6sHcbbBbwQj0kIwLkUY6fZGBe35oF5mlOFAf+kUkQaJTwym2lN+KUiUx0pgJSXSmEuJNNDGUiEpnpTSSkCAmDKRJJBEpbZTAyntgFRKSGU9QAO5TASmRlJckEeU/EphJT4ynnlMKBA/YlMplIBqSnplLpKQ5QBkpBpT4OoslJkAMEAfMpJ

Lwc1pFlPIsSWUoRQZZTOAAVlO8uCKUuzcl5TDrGSlK/IA2UsCgTZT9fEtlNUYm2UqC4ypSgQGqlOdgOqUtpAKzAaIBjqB1KU6U0NAI5S9OxjlMXEZGksvAo+SDxDxQE5DOyoTKAfd9A273EBalr5wSTgFsh1cmKRkspPPUZakRE56dplJRp2gv2Yu0EwhTMjMwT/jrdSLXRlTdoyFvGXssQnIpEa3BSu75aZPG0Tpk08yAacrCRKdknNpMY+I8+V

MLJg+BH4YdsgM8QfroA3TdalQ4eTbDgKPKNQAwJywgDFAGMSmo/0SdGNQJUKQsEb3Onl1S8gfbxjYDnoUTOGq5JwwmMAK8vQEGbeUP9k/4tP1yghF5Ci4NVxSt7JFUcwouYTbe/qiJRDlvHF+tLPVC4vFEnO7OzGj8H/zF9xVyTPRRdb2G0r5Uvre/lTM2EVzCCqcv4PtyYVSgd4RVPgrDJBKCCZblYqkQ7yB6ulU5Kpz5DUqkI73SqcreTKpm5x

cn5ziLyqZck5RgMW1ReEW/S6jKxTAQmXSBFdoCWIXKaK/Va2azdvKksjRKqSukgKpuejKql5UGqqTlvWqpaL886LjbXmGrb5ZqphXU/kkVbzD+O1UmChUfw0qnQ7zj4sC8W4UlX8BqnfTyGqXzcQqpEaSm6Fp8LnbvIY3LIjlTwAyQBgDLgd7GaKn8Q30yBDEDspn1Kf0P4hR+i8WHLfnrdPWytuZw4y9RkwJhegrsk3DQttAOxRgUK3fbxRBXCt

5EHZM2kblkuoAT+SXtwFlwwpLqPIUcbscaFxsqHRnDTVHCxsBJCimEJyvYdaPTXeN7CY/bz326EGWpeOgwmxWCAg4j5ESB8Z306zV48mvDznhknk+9SbFSRdGDAE4qQ7vM2+nTlRDJNnnCXtgUKYQKz0o979Fm2RrzUsvJWQc2MEXw0Nvv36Qf0tPs/EYVe0rHtvDKJyuoVRMCwujYeKAEFO6tIQlakRlEXuiRwxb2ae9E76wNEz3kPkhB+qRiDx

CWVP9dIG6ZBhf1T10Fw0wHPHFFEOMAlgcQpgyHJHKAECSwpUZcKFEYlDUDUuWIWcOwLYBNlBwJmjUhHRPiiTgFGmNaToTk5gR8NZSZAmrR6Asc7fYuZ3R50y4+BuKZ2kxpe9xS/cm0lGvYQndd1MQ/IttBJojxYhDwEHEIiZ/+Ix1I5KJ+wmAOEgAU8mYAGpdLS6f9hAI9Kx7TQz9kt8VSNEKP0qkJ50AulN8SXOKrGCCx4nNSFqRxU1yWN990OH

TBWCQd4KRek1RIrwq3W3h4IvUy+g5tTYmiW1J7yaRwm2p4dNlSAqYMgRnL7fnREENMqBVyEyoD11IwA/VR4oAioTZWr+FWYANVofYEhEH3gcTYP+OF/dAHg+cGa4jTI5eAoVNt3irvA55tBAO64Cy5emHeCTh4GBmY6q0RTITGDmMR0YnUxIpK+ccslp1NYEWLvJssFwFpKi940lkbOYyOMFOCfcm83weKSmHcjJ6lM8Egt8DsRGJwcz00wAzDzr

sHk4IfaaaAYnAEgAtzTnRJlTFApacc0Cmg5LV1L3QnEI2ABaF6CmywobTFQW6FTRYBiA2gEsGLwBhIzhIXezolmHDkCNENUcdSoGkJ1KYfknUhD+WlTBZFi2BHABcLL8RE3tX9h7pymRtIU/wIaXgjeTYNK0QRVTZU+uAAHgwiyHoUAMaWn6dIwjGkDBmZkKY043QB6S6xE3UDwvsUojoa7nDlCCWNOvzjY0svOr0cSeYsNM61Nl0GAA2AB+FLtK

MKsWG0U2QgX0fhB8IEWyUv7J4yfUZDdLTkJnMgM5Bs0EDTyEpW5JPyc+gy4+yGSAfZuWNTqUdkgKRZS9RXwBkHdyU1sZZhMvhYBioVFjYlFIs6RBRSi6n+GOVPh40kWQbjSyoh1NOZkA00pyu9jT5ymX10/4WiI5sRTTTSUAPBiXFj407b29cAWqi2FCTACP2DuQ+I9JBB6IAoXOy6aIIs+IqDRYdE0gfSpNlSJhYiJy8qGWfMtBeTEjoctmlYOC

SaQ4PVSpi+dNSIJkJtjinUvyRadS+76++21Rvx3YGuxaCdIpHMlBRNyVSmpYW9qmkLCOVPkMJSja1owhQCWgnZrjXg6lw5cAfkFyuClXlZQPQATxgDImrOEj4ScOMjIUQjs0h0UQnisJQRkUcJEV0bDEJoIWXQ5SI8ADVAFWuR9anboeIe3G9p1AU6iY2r+oj7s6YxyACaLANXPd5ZzmpasNazUzQS3gNXAMU6M96QT3uT63MS2WA4GSSnlAoe2k

MHLScUaUKSh0AfNMGyHjQRJQPzTnsh/NKVFOUVNQwQLTdzAg0LBaXtCUTOqgBzBHVAmw3HC01t4CLT3MZItJWoCi0traUJhuQEYtKxAD7tbFpe/4S0ixqPJaT1zbnsRLTcAAktIT4U5zCNRjNYqWnA/lpacNE+lpyi5GWkedxZaWaINlpcVce/hbBh2uOWabZpbxiZqkdNMqkcJY5sRbzS8PE8tLeyFirAVp3vl/mmSxI2oJFAEFpUbVPJr/UIrm

DK0zQJZeiFWk8UCVaRS4TLR+ag1Wkx8UsAYgAmAEiWhNfgf/2iHnq0vFpxq8ywnGtOomMS0+CsTlDL16uaOggndNUOcOlFn0j1a1vPg60vzcTLSAeRZuLpvK60xPYCwJGKmvVIGaexGbxKFDBjKDEqHcRME03Ba8PgoOFHMhpSuy6Bfs0M907THtSIfrTuW4oNvVWfr5/SZjJrlb1p2xTo+4LFxoYZYYyhRWNS95FeBktVE+6HGMc5UHA6QQGKaT

FYUDEV2I8im/5N5Uf/khd+LWR6y6j6PXGBDEMVWcKAzNbwAjwhN/LLleJglrym0UA5ZHKsBMwM3Yb7FEpGw3AKJAgAtIodhKFKFnSUaAeN4D/5W/xKpArBMJQQAASYSYQjCuHLSNAArMgBzDeOLWMLv+D2eysRVYgX4wy+N+0wgBKkJcIQcb2kxGKnJhiHMRwewDcIrlH9EJyEMNFkAFNmGzaetYjVpqgDyKBiLgo6cDlRzWMqwN/h80GA6by0vc

MXPYcPTCUHI6UecX4A+ecuFAYdPiHsKIHv4OHTBgB/tNGqJlAB80BAAjMq1UBE6W9kHWg7PYeWQotnzOFJ0rJ41EBI/hydMw6fUwbDpbMgv97AUCsKKosL9WDcoSOkgEzFkGSAK7OMRgRzgxK02+JkKX1gtL0aqIcxA45OcYLmheVTY57EcyGHNvzXhc/ZxpDCRMFeyL3oUuAvQZ69TUyHKAasCR6hv3xHASUyCS6baA+f85VhcvxQAUFzrwwBlp

MasIiB8UDH+DneIrpFmNu2CjMT9SMSvCqsaQAqHFK0FU6QwvR8YDcpS5QJcR06ZzQeT0dHoJOkJK2mYH7/PXGqkFAYjodIs6Vh7KzptbIGunVAHU6d+rCQ0vLDLwJN6La6SSgbnsBnTQKzddMzZODPQkYhqtUADydIMeK/tEbpNnTmJgarErPGKrKbpXtAgOloABA6UB+HAI5cBfXyTiSIgD109fRkDt1umbdJ9OMN0pTpbMh2xp0jBfadno5Cgx

lAEcLO6Ck6b+0+Q2fG8AOkKlO06ad03lpqSgwOmN+JKoJB0sOY0HSzWqLuJcklTCYCwgf5ogKDO1Q6Rt0obp5sJggA4dLw6V7AzkpaxhyOR8KnciL+rUjpT+deQEVAKcBMlobzptHSdjT0dOpLpZnKT+bi1I6E20QlararUiYHEQ0WlWAPesTaAlSEGa8AemCdNKEsJ00Hpb2QxOmddPXXJJ0snplmhZOmDdIU6Zj0tIMo3S+elqdI06TN0kHpG6

peWl6dIu6TTWAb8xnTKjRS9PR6TL0q0EWPTrOnr6Ds6WJQBzp9kAnOlC8VYHG50oMwHnSk0CxKyp6YNXZNCgb8AulIQmC6T7PULSYXSHXK2r1h6FF0xJQQoBYukjAkcBIl0snpyXTraGpdPr1Ol0kPpmXSEwTZdPa7Ll0tPOY61hKCFdNGpH9CbRgyFBRqTldIFQF9hb8UbhEYjB2gH0AHV0gNWrawZVjVACa6VPKVCEgvTVenC9I66X92a7pjNj

eum84we6Rj0g3pcvSVOkK9IYXhN05rph+RwwjK9JO6VX05wBH3ZFulaVmW6RNEVbp93TalZ69Ky+Ip0hYEOHTdunqrBL6RqAQ7pmbVjunPDCF6UJBQfpV3SPGA3dMzZC07frpSvFHukV0RG6a8qMapVWNN+xb9jxRoekxxp/yih9HCRI+6W+077pGBEv9p/dMvZP2se5YQPTWyl99JA6eD0j7skPSK4DQ9JUWLD0+MSCPT2tCIdOR6ch02tcaPSD

+lYdJe6bh09fQruQv9pfq2I6cT05zp2X4sQGCuVP8A70iLGYvkGOn09MN/oz01jpeTF2OnAjCN8Bz0vNpXPS+OkRrwa6UJ0roAc3SRem19PF6SujSXpZnTpelT9Nl6cp0hrpE3Se+ladM/6Wr0wfpmvSjOkS9PBnswMyfpT3S2BlG9MHMCb0wjpBPTHOnIDMt6a50wzWecBbemhoHt6W1uR3pXWF6u7LaRbEoF0r6ez88Quke9N8UIX+SLpyZtNy

nkAAD6fF05fwwfS0Bn4EOYAOH05fwkfSrBm69J8iLH0rygs2QE+kFdI02kV01PpzrAM+kfYzZWJV065I1XSRuy1dLdAgJ00aopfSl+ktdMr6SB0ugZS3TIla3dJk6Wt0ifpUAzLOkwDLb6a/0jvpEQzu+madNm6Wv0+bp+nT+Blb9Pr6Tr0xIZA3SRBmH9JgGXP06VYYQzF+mTdOX6Sr0s7pG/Su3yFDNu6bv0rcEpQzkhnT9MN6Smo19Jx+j30k

f2kFUGwAM8QxNsA25+gLsLuzzc3My5CJtRgRjB2LAMahIengnMpOCHlqOngPu2AFjemH7AJiKXqYqTh8RSed5yNJ4KQo01OR0OAI+p5l2MqAIgcrOTY51OHxMma4YxA6axRyi7ikeVM65kG05SgKtDqGBCHSqhNiCEPw+agA3IJmH5rlwoBv8t8wisph6Hg6bboTqhyedPJqUuBTQmhWKeg6ZlqXBC1jFaWbhb3QmLSk0CujhGBN+nX9OqGtAYgO

UTyiBYbVQEVv4lVil9OEoCgpWTatAkt1pS0V+NMtw/GEyusyCIE61SgNS8f1sTRh4mCsXA6MCz0vxgKvEIdamgL3MCehGjw86oygQtUCWFF07eoBGICOOnauLFURD4hlIiE0iPH6LA9ZAvhEySPEwCJi6EBFoJy0yKITwy114vDPTEVEcY34nwzuJbfDMy3r8MjIA/wyzCryezD+CCMu3CVE1fkgq/UhGXkqPoasIylqCzhILaY88ZEZHq1Jfgnp

zPZJSqdEZoFBMRlbLBHVilNNcM+Izt1pEjJN8CSM1RJbJckDa37QbcFGwv6CJelxfoMjNKuEyM5IBIbBWRklALwAa64hCuvN4ZJQyQl5Gf4RQCYoeROelCjM1FIOo+/Qw6i91FujJzQmYoQvazIyQ64KjLsaf2LLn+s1TOmn8SKXFI8M7lpKoy4en9iPeGdvtL4ZqSgfhm/CL1Gb4Eg0ZDHs0FjGjMPGqaM8EZKWkLRmkBO5WNaM+rp1KS7Rk0oA

dGVenZ0ZoShixkejOr1uVE8uYPoyPeqEjP22oGM/MRMRtKRkSpD2WDSMxwhebkEOkFUOVSUaA+MZxQD+4CQgI5GSmM4vwMa50xlf6EzGefxbMZZAzcxnJnHzGXxoosZNStAYjSjLLGckAisZTBC/5qOC3dLo5PDGRH1TCsD1wEaAOlUQKBXDS837X4FIaB7VFMeJjMywLW6l6vPpueYZElhNPgvVmiCNcnQDEYCcbGJ9zWudExQhDJalT2ibn5NG

0VE/cAxqYAjm5hM3KTtC0SMgj5RBk4rMOmwBwmPRpVojrkgGf2HOJX0hIBSqtUlC9s2IYLz2Hlk1KwoVih/kXMJ1QwwijCpCAkJmASGXtQB1kedi0OnjCVEGS309gZnvglVicDOyGSr0niZ4Gs+JkT/kwyHrjG7GJHogEBAjJGoOJMnXCGSopJmpKDH6XrQOSZ49EFJnnMFYGcpM8QZIVTRqg1DJX6fEA7JWOkzI0jUoBadotEQyZiihjJmesmIY

BJMmSEd3lP9CVsmGoOwAAOiHQzBzBH9JEolxvd/p+FS++nkQHe7KkoIrKYnp+OI+/VWFAFMjzuN8topmOTNw6YDBTiZrXSwAG8TOIYPxM6lAgky9wwiTIrmKZMm4widkQpmpKBkmdZM/Dk8kzm+kjdLSGZxvRXpR5oNJl99K0maE8alA5UyDiDE4z8melU2qZ2QDzJlbfEsmbz2GyZ5nT9ek7dLimS5MiuAbkySpnaTLKmbpMu7pRHpzumJcXMcQ

OMhMwwUyLJlT+DCmZpQCKZ41E8pmxTNUmW/0vCpOQz79YsHWIYGlMmbsTLSQmD2ildWt12DTWZ0yYBkEmTGqbNkrOEF7wfODUIn7GO00w9+fEiWNEuNIUMEVM7iZHky1pleTMvWKJ6KqZ4vkjRl7TLMmZJMyaZnyQ9cYzTJYGUpM9qZC0ychFK9O4Gav06QBpUyBpnrTM16frjEaZV1SUgEmSXqmRZModm00yWpm2TLamRUM7GZrkzNJmQzKJmdD

MnyZW0yzng7TIRmakofaZk0zDpkvqGOmdHeU6ZDMyZ+mvdOxmUpbK6ZKvTkplDdlSmWYVdKZiXFMplnWJemSKMjGZ5QyxZkFTJeqRMDZipue9t5RzwMxXOWUbtARkMqr7TBx+SgOSJFqqIdo6ApxASgY8QanIv78OmqV2DezBtDI3G5Np2RbB3RpwV9oAAxT4joLEviM74dlk99Bx5k1NiRQxSPOCIBOUtpiaFzbKQWIjcM4nRxGT7HBgSzrAeZg

aIAzmV84Cq4AosVvqZ7BfnkUITUUHFVt6wNqI2MF0cZEqmTmaBAby4ac905mSMTZcGDBTM4jNAc5mSKDJEMHoAGCDnJw7hq3HUUvRM2cGCxDXK6/Xx4MYCowuZkPAU5klzNXKR5aDOZlcyoLjVzOMgI4wOuZ+czdrYKWKKYQ0ovGGxKglgDPgAcwA0ASEsqeAl6iTujs0PhdANEHbgYHgAYg4kb59TTwaujW5y7NNLSfNoeaa+zS0y5hyX8UShk/

2Z3fCRCnrKKZUYpGXzgBnDYmIXDPFCvLgM2y2FiGcn4f3DgEjSdOoxdTurrJ+nzsh4VKDiKe4JFCoACJgKGgfiUksx1rFQXGAWYCoFWBkCQ4FmMFTAWRAsqyIG3loFnWBMPyEgsi3qYvDCcAAzKv6XmnZcp8EJr4hILO93Cgs8hsUCz+vAwLKwWQwVHBZ8ljvGmwMKZ9CtMaTELDDhClVmORwWtcTxYD9hmeoXAQ+aI7iA9Bf49fkKSiNnerUyI/

JjBcOClpNPofORMk5ptCjcsmMqLJyU1sK02O+UD9yVLxqgWFwaTwAb0KmnPdUZyf2DGBmABTH5H4NLSlgwgZGq86BNQzmHmPtHrUL2w82hIsBgQH/DunAeB6LVUOMCZWMHaX32fQAGupnwCVABFAHAjLChdEUs4RzGxfwCZ7UOgiuJrtDumU84Cjfb9EzDQ2PaSNNL+mWk8+ZFZMj2nJFPvdCOAP+BjhiuQ5JZKh9vcggqcOstlKbyFMFwZNZRb6

+jS0mbP/ymdr5rVkQQR1LDDu8CPAPFASlUOzA6ipQemogGqTN3cTmtPCgQAHKWbQoQ5AVSyalm2jHumSETNf6nFi8FnXjkBmfLw7gxJSjWNGjrxF1nHo1pZ1Yx2lkngE6WeawdIwPSzGln9NMYWWrqLGBmABepL0ADiIFJvYpE40BsCTyQGJmhPyFZkb6YAj6Y9kysK3YSJZqwy4ljHzK+0LEsvYppEysj7iIMTITIs1ZRuWSHDEKLP8WAmHNI8U

TMmJklNOfjMV4U0R15CU6gm7x2Yrg07qULigF0m6EUqWdUs+ZZlrBrsYxMCWWejjcFZojUZllzLNqWRzM3pZgtCrCpX9SGWZ0gkZZzjSLLpIrNT1iis6FZaKy5Fi+TIRWVPMhhZWQifYazQJ5APoAK5owlQttZN4GyJq9MEQQpVIyiypbEKJjjSaGmK8gywDnLIfEKz1QEx5vY1dFzsKoRtbkqEx8ZD7oESIOeWfA0o7JaJjm8Z1hVtJM1FfYggW

Bu8xjpl4fJks4wsPaU8+7zGPlAgubIfGI+Mx8Y7X31WX39OQmnIZFCaFBzsqVJbKPS+RMnBA1BSuMdvKI8Aw+MXXRGrJzvmHBcI0IQc7ihIKW1yn6QVoCGp5OzwNG386BiWfUR5SJ3eyyVKn5K9VLLgWxQpGlqZIlWdJuDSpATMjikpFIKQdsXZak/5Qiybux28sTdaLlij0wfu7T4zmQZPw4JCpdThwpY+2DWScmZ8QYayEqS75MjWVI2OG4TdS

EOFYOVpWcQAelZhqgZ6mZ5MG9l46MAG5upKuhrfU7WWRoexw+K4x6kV5PtgUeASPG8wBo8Za1OKDv4jc2+6QcWfbR3179nN7Tsehcs9nq71OH9iPk3WZWIRZCbyEwtWayPAJYHhcvAhdjA2iuGXO6YvF5RabChVumEvAJ2ZobRfjinQG56m0IWnioqy4lkJsxpvm/AqiZ1GARwDmmKQabY2UII0wAW67ZPUadIwWa0xAKy7+5qE0qav/M9bEAeT7

75B5I1zNShYnQ5BM/iA3rMOWrfwe9Z2t8s/Zs+3vUjAAJtZLayxamUYJPCrWiA4oFw83SAoaR3CMUTAvAdQhYbhSYMyDvBw/W+2yBECZ6WGOAF7lDPJYe8h7qR0GiyJpgYkaWzErwohpSx0WYgZgs3fs0eALrLF9pA/f8k6e9P0rp3zAcLMAAnqR4A6QDcCiOnFGFcAKvzQ2sDaTXA4BumD0y1ghpHRQLjLsFxHY2y92hMrI68lv/lVk5aR8ciDm

mXzITWRCnLJppzSjskTmO2LiwtAakhTSbqCzgxtIry3XuQzwsD0DgBHvIWEAccMxggB0Zm7E82aXAdA4ABcF1AREkpyBYxeGBfrTIZFCROhkSSkPzZ3my0RaQqJ7/ig0B4g9AAiQCNADEBqJkzQeZc5Go5lgF8kPY5I084HAUJzJZEA/gr6PE0pcQz7CRVWljCncP1Mflj/jEDEh3aQcAvdpbRiDTFCqV2GahdG+ZaOi60mIWIfme/UbmKl7TENi

ZLJEEXh2JKGX8yYsGL9DdHnJVIopCWDPdpOUBi2YqXC5iK3MzlJTVhZwlSYDgEUQAL/BQjHPLLOkaF4wK1SXiJPAGwb9vRmg95ZiV5b2K9CaeGGBZeSSUursBFB/MXxabZsId/NmiNSKYg9Y6+xC2yzrGi4W6oatsv9GeVYWUhbbL4YsW8XbZOWD9tkWcyHQNV0wQ4z2zckl/Dn2otFNUcRrIMqypQQFh8IGiPSyhSiB9GdzNGWaDMvBQN2yvNmz

bNJ1iDs07ZL2zZnhvbKvOGprDbZ0bxyXjjUV+2d9s4jRAOykmBA7Nz6fNsnHZYOzMWAQ7O4mnN+ftp2sy3qlXGyxCJlADUA5EAj6j6AD69D4g0xSfEZjb4lwAbyEy3bSx7jpBBiljQMmKA8MxR6lpJcQQSG/fvChY4oqCUrnRa0j6UmQIi6YWRB3rIiCGTgdjk1oxcRSD2mGmNgaWwXbTJdaTQw52b0zklw7DGULaSY1ht2C2gK4HID2ChTO6Rub

OM6MzkkY8EThCPg45HpNu1eEhp8Gh96B7IgcROcAExEXnYRgAO2j+bsMfa3ulxiWKnhxBIIJlQAgMXthhoAV7G7QLAADgAYwBXRwHImObn0IIKkT2gaEjR1MHemogQuMQT0kOh8CCIfqhUU4ouNNg8TMfnRRNShLl6ozVXSCCIIStgNo1JpGWSDikZNJ8vrIstOp0ncv1lXC3KJBYICJRU8dZzHiEj9UPnU24ZU+NqUwQ11BWSPBNQplOigsAg2k

VwE1k7XAWKx1FKWIjwSBzgCVoqsk3EBJx1YBurAZxZKyzOtRLAEJ5KwIIQA8QBc34IqKa2EZLZTEB6zuOwdTTumHwSZxweLUDmy7FEdJNYxKpkS5oDj7hEifsPe2Gg8jRNlKlxdkcHpA0/Yp+ik/ZkWbPb2Udkx7uardJyDpYip3JIU1/A6kChJ7KcCCQXms7lOtTJOua1nAbAW5HGrwvYgMJHMrzUwgykHHyKfFsBl6/SmYPB1I5xYKhyzD9nC2

iEYM6P8xNBhQEUgnFrKn4JIYxbCBAiWLj5QXK4mcM0o0gtEC6FbcVetK5YXqsvKD4mEzQvUkHPQLrZRmLScyTwhA428U+r4+lmEsPVXMpnZ44ZIDyYhYHI43gWMqjwEoySa4IXEIOf9EGVybRhyDllwEoOfCkLHgefFaDnW1noOYyMRg5h/hmDkOnU0STYwzNRGLguDmfNNwYA64ZBWECAT0il6K8CUPxMpapExAnitNkmwgdQKQ5UMMIpwf7IFH

IL6TgxHcywKH4rKXFKgc4Pk6ByFDnfCOwOSBQBGReBz7+L0dI0OfbELQ5ZByYpoUHJimo2JRDyNByolzGHIYORHY98EsS4WDkcimsORwcw0Et/ieDmYoKcOapEd9mmLBhDldRFEOWauR+sPhyqUAN0OakkhQqFRgSIxkDAgF2qLMfClQIlRmVnLXGsmKTgOtIpiBFIAf+UbthfKLV2WHQARp7QIXYK7KXBuLhdFBStxVz4GGg0yRj6y7lkmbOCyl

fMzJpb4jj2kWNhHAKL3UMqiqzwHqCL0h4M57OcCk2x13iV0HMqZ3ADShG0xdpRAuitWfjbMBwUAApp59E2YADYgl45xDlFGT1wFhHPNcdtuVqzO24Y6SQOYUsie4DqysQj/wEwAIfKJw+RKlwXRk8mpCMuoEHwvc0rYDDdWU/DJ4DssuwMREyRolnkFy0NYBk80WCCJBF8FBYIcMMxEzccn3LLCfkc0ks+SayklnEx3eWclkYYmb+T/XrLYxqXoD

Xf5ZWiyuUbEOXeOQeAT453xytKG9FP9tivOG44T9h2JkjDEA8iMMf0Al2Eg+SyjPLseuyIGIbn9kJQWDMawvF+MJghYjh9DTuB/LhHMQryFkJGp6GgkDYPWMasYDM0lwTyUDnDH18YeAHxgRJqpKEtrDL8DkZgTBzFSOAANLpIQzQBJoyOAT+yFKwSm6cU5QshJTnSnP9FLKc/ns8py/v5KnLyoB1QbIYayRfYlNmE1Ob7YlrI7XlxgS9zxNXOHQ

o058M1KOoblMNfAKgJWcIqBrTmVANtOa64+05hSppFDOnPyASaM/y4NIoxQBTEN8cHD4FdAaXB+168pyBmXishVmFl0vTl7qylOaB+EAwzIz7ZgDXSV4oqc8LyIZyVTmijAjOXtQKM5pOsYznJ/jjObYcp9ciZySDDGnN06qmcrfQ6ZyrTmPK3chLmc4SagHJjokl4JdOUOMks5WMSWdlAow3WSpY4/Z4CIiQA+AA7EURQPg6VwB1BB4Fx3AWJkt

XSW8QWpabmjELHundfArjgKjibZAw0sRTXBE7zNMKpw+H5UCVuZ0GZjl4ba+Xleamlk8VZPszFlFG7Lu7tpUutJh/cu9k+9BELIULK0i17ShJ5T5EwbI804U5YJzXdnqU3FaLK4fMOowBBckzwWbpFq0LiyBAwQgCIQJLgMXlGVoO+zqVlM+iUUfvs05AlLJvFnBL1mKWa9dRC7ECaapPnM1stls0WI3npeb6/1IL9EX1MOggqydai9nkSWLaRa3

E5JyFioXzPUqY8s40x+wz6VHvrOoHopA+J+T9gK6Cd4ybHDtAuxSZsp0FCIHJxRD2kjT8gyoi/ATDV/MsLOPdWmwJwPS60E9ORnkQy5oFljLninL/XESscy5a2CV4yVnNWacx3GRRBCzIC4KKPghPpc3cuMREJxzTK1sMHZc6i4Zkd4tkt0OUseHEUgApyAjAAEDE5WgTIk+Uftw9rxvQGrSBugJs8TjhlaiN131wFcmeu+XJ1sEpJRUO0CJDcdh

IeTRBAByKiCGC2YZh6NSeZEH0PAuWNoxRp1EyvB622wr9tXHXrZwEh9w6yfmWCsjYO45CcAHjkj4jFmpIw0fZOlzJSyZqyFkA4YQDyxugWzlc0P+eHIAoM5PZzMMhDJH8SensfnsglEjQEhnJ1ObjQMc5nBzceBU2O4mOXAa2EhJhs2S6hOfAux053QdPB+FgVb1OiF2okRQQ1yTdAjXP4YL6cts5k1z1trBnJmueGcvXC81z7ZjkthdbJhkFa5t

/DuZ6GggGdu0kIc4O1y61B7XMpwsyM+2Ix1yBxCnXKtcI5cjlMbGAEYhbDl8Adf0ruZwkTBrn2GCuuZdcsa5MpzmQFTXPDnL2c565I1c3rm1FQ+ueqQcyEq1zlnDxnI2uek7AG5V4IscrA3LHcckAsG5VEFIbkO1jMPkCOfa2rsimfT43EhHMXAFhAekjhMnEqEuAFSIFtAUVyjjkZ7PREIEELkIB0Z/64xrGMQO1MSQQ3WYWFGBVS36DuENF6Hs

YW5xxLBptOjgeXA7plBVDAXKb2ZWkqRZuxy29kvLLTqSYnBi29EQKhFGZNDmfUZMGw52Yf8mEmO/mSKc5A54Gy6slT7PVSpLADPK9LgHETGIjhAIvbLr0BNQ7JhicHFRDhEfioL9V7HCUXPy0Sg0PYAZyxVIBJwBj8F4fDLZVXEyBgG9k+gJKSRII63o4LYiUMRiO3XNph3acfSBmMVawA2bIS5rQEFo4B2GXYBQuSlRsazQLlG6PImSso2VZgcy

NR6KXIgOcFSWXo9myZBjctQBJNpc244vU5LLmRDWsuebOVG5plz7LmeR2TfD3c3y5KN4WvgD3MCubEwKYhMNzutmaXARuYQszy5IK5R7kaDSMuf3czNWU9yHLlH6I0UZpIg5mPiCBjbcCkgHnMfXwU4zSnBBcI2lHjBlTIgFBRBsyAoBXUCGGXHEtQhi7RXSl54FTmHxwFZpoFBldGjRhXc9LJ+tyz8mG3Pk4Yksk9p/RMGTno7A5FsWXHZRWay3

OiOCHZOh1ctvwuKkATk98l6uUPTdC5+iyX3qLgBRueg8/hggx0qK6hoGN0Pa5QDiB444KHIKzWCMboc/aTSgc2Qs9KSiNCIu6J3rhilCFST/1kecNkAihw5PFSkJlcLRASEJ2jjb7YS+KnMBn47lwT+0SJTAagAAH7xd0AQCkRayAT5gkgFFKzyDKV42Tp8pyrhG1rDiwk8Oa+IxQJdP5QO2ZZFSrMO8u/Ebn7F+EweXTPLqIohh9Xz2HS1xky4W

WsGDzRrnYPLqMJY8PB5ubkCHn4ZCIeSnxeuApDyp+ZcUGNnKDc8ZxlwiP0J0POWOgw8jlAzDynQSsPPceBw8mOJ8Pi2vhyLhu5HJ4uxWFcBhHk0iXHueI8g0C/pzWqw+pNkeZ2c2mewqxFHmmROUebmEsJ5j2U7FaaPJ6+BWYZCgujz2xRHnAMeSysdzGEgJAJljVLdRhsOOG5A2AF7keXJ6QY02XR5QshMHmHmgz2jg81G5+DzIOSEPLVocQ8xx

5vXk1NguPIlnG48kfwHjyanhePPrZLZrRh5KHiWHmoELYeUE8nvQITyeHlVQj4eXCdSJ55cBonmMtliefH4FOsRoDEnkw52SeTNdVJ5CjzU8JKPMgSCo87J58K1cnnvWPyeRVBIp5EkpLqH0QEMeYwMs2EgEyU+GZCIjud0c+KAlQB6ADKAC94GOAIQApyBTkCVnhcAJoAEiApABdL5/pIlgL4KHa4kml3/q5XRgysEsb8QatwaYxXM38vDeAu50

BuA3CRiLwTRN9GfhIwoVOToxyLYKbz3PW5NuT0mk13NpOSe07iexcDB7Rm1MwcE1cw44POCSNCdyA7SSPs5B5/VzUHku3MMWYD3BVobthZySGYPKim97BeAhHwSWAIQO1aEtkNFqc6Jw7mzt3Z2QeIHzOG8kRwAgUA8tqfsmHYoKIyeRy72kdPHSUMB7MpVbT9vQsmBhbaTw+BlcNjnvRtTpWwepcpg4hJAGTCHDmVc+OpGNTKrlAHP2OYA8w45Q

1iA07SqHyTPZsl+peGTgMkoXOG2Y+0x25ulz/iI/wBXuUiCPy5h+R+nmD3KCuRZcgy5vdzuFDGXPDeZvc4e5kJ9Z7mbDlhpPXZdXOlsjkdnhHJNpN5coquY9y43kb3L57FvcylZHzyZXmaKMRSke5GAAH1gzxCjZw1ALMAMZkYwBqgDEqFP0M4adLZEgBBjnYgCG1MYgcHYwTgf+R0qUwnNJYQsIIZEfcT+WN2gfSdDHcvKZ2W6r0JjWBgUaxGmi

A3oDwA02Od7MgA5pmzpLnJ1MpeRY2RcAWYMTjk/oNGwGccnwYWuR2rmBRmzIWos1+pqfZOTmVlzWvr39e2BjU5mpzhInIDsCc3c23Y5LL5STmdubvsj+0wwAb3ktThP2YrkqriYYDDap1CAfQBdOTPm9dgCqRukCKnkw0bfoHBA6ULYZKneQw6FfEZqUbuB0NBtyj/syxBKTSLDF7ZOa2QksonJOaDFwABYIDTpzxIxkKWUI6jnyM+qlNACV01mV

ULkxDmfef+PAxpPgc6am1NUFvrsPNvMbZQsTzQfLzjBzU+D5xhREPk6eCjvjrfajZhGCNQAVvKreTW8ut5JEAG3lNvKGeGKhHDZ9eTdam6eD16LamOXaMyEYiw5EgU+U7JIdZEY8JAC2TnsnBQARyc0nyAOHd1MVzHz6aeoucIsA6V2C1qF0WSRACRBu8lx317yausmB++9T7alCBzE2cfUtCeco4FRxKjidIR7UoHiaCIr8BfplLoBxwxDYzDgu

pDh2UDlvI3Hso4vRWqb8lHxUb3jDZpgcY3R445ANTsWkgjOmEhurH7tIw+YFDLD52TTjzKLgAwyXpUreIN3AIa7ux1PDtn3dcgAR9h9kxzK3bMwuJMOKhS1d4M1KFvsHkiL5mWUovkJcBqhgwMfFg8Xziwjr4jJ9k+Vfj596kIRxQjnwADCOLaYbazmNm6lHbTgNgNrAWDgFYamlCfuaHuIaWmOJ+NkrNDzln37JdZpI8V1kJ3z3qYS6Rz5LQdnP

kYFKxCB+FIyU3Vygl7SsVJCAxQ+oefDRvAjSWCccGOmLqWTFJJODo7BdkuZmJTwlTI+HxiYF+cjgtFK6QiQEjK8yxjWT/csl5BtyzNk5IJlWQHMoJyi4A9Ml2bwKpDWpU10V2T+kDXTFeAZ3c0U5nLyBnT0fPjuiWsu0eT3yfDRa6VmCmndMAAXnQDKg712m8LzLetZNGyitGQgF6OURQPT5XdTv77SVGG9nHjdDBIzQEYi88DPPMmQFqY6nyz77

U3UiudFcxcAFu0kg6oj1w2aYlFmMAiBF4SrMOtwR0zCHg+PpUiBYnlwwVUHQTZJI95MEibNtqUY9Fz5bxyPjkwnMcKSd8obUqwDJLDjsHGOU44QWWb5Q4YyJjS27utoMyM/QcpOB6WRMMW0cfdZ9Ez+Cy/fJAucu8nY5gPzKKrA/NvmRKpRcA7Y1UP4WCF0QvZsjvqKKcEgiNlGjmfkUv15KDzC1m80xR+YAHfQk2cVTfnioyhsHWScNo1vztdJa

FGJ+YRgno5CAA+jmU/OnWU7vVeQYfQrShGNCvCtn8gqM2GTb/5s/K/YaUIAJpsJzr7615O1qX7fM50opo61Ld4y2gFgHOv5KyoCcgh+2s+at8+X5b5V7PkuLO3lH8chB5xsyvPnQvPTwKP6CyYC8Q/1mX3KhctpIQdOQxNl2nGIBVJGrBQkcIZC+QhMxnQqPUIdtwwac7fmkvLjWeS8/+5F+TLN5XAMEKYBLRFMONZp5whSJJch4/ARGG0VKPmgn

I5eaH86e+AAdZ743ZnS4engbM6KtwmIpFADkRqv8qto4TRvAjJ/PvUqn89P55GCkA4yfO/vgTMQIYGDNR7gNIWC4A/YSmYRlQFEAl/ObqcOg/e51QBD7kZ/J1qd/fDJuU9R6qbEFDCjFX7Ff0+GSBi41xkW+SshLepNnyd6kbfLXWT38iu2pAAlgDDKnEjJaLFV5qJNEHQnh2L6GIMe8QGHR8KFMrkgyY0bG/ZfqJ2UbsizvFvYyTfkMhcIP4N7O

26k+s0FOsFiZLltbNrSWjoehAbdN5MlhXxiZC3BCUCLR4sEGsvIq+aKjOTWTtsF35uiTaiKMJd8hwwkPRIsvBRImypPAUGp5XRa/KIzeWEchs5DYyGJLGAtjYCFck0hhWiJADxACcPvAwy4AxKgrzkJ3JGtAmQRIIVCZhCyo3yjyddMMOAaXgeC4sd3DoExaCaAtfDOlKRIR42GzaMTWSXzLoGeMwkWc3swA5rljHXnYfNuPouAZ3J7yyuBrdvPs

2aK+Z6GSTIZd65LIWMVR8v1GOyNJtmQUPdEkMtQ8JLjx/NReYHt0GwwCVYhgLagXRAPqBXssYiYTQLKDAtAo4yLy8Q3EdaIBVDPJ1WkJKg4V+AkST0kBtOqkQGEIwFdQKq+R3ly6BSbVZoFZeJ2jmb0z9Puzc1ZZSB5nwD6yVJ3ME0xbAQghf1kWEgmgII01QsSClYYwhojZCL3LIqe8/Qlb5zETetm6QFt++fQ6tkbDIa2frs9L5LBMWtmH/0yB

Vl80H5rDD3lmLNEsEAVPBtEaDTngHvHnvAT93bQF84EJ9mj9W+hCT5F44vwisupsbR0kiCRHIhf+CfhZzLG6frPpLUWfV04RjRiVYrMhKL65VjxYQ7L2IWWvl0vJ4EmFi7FGADHEPa4TZxzqjV+qwguj8vCCjdUiIK9ql2l3hIqiCnvQhOt6BaLZCxBflQ3OA0+18QUHCkJBZc8YkF2fjhNF4rHJBd9CA8s1IL6TC0gtxMILQyC6rZjL5RnRnqef

Ioxp5OnYGQWrciZBf8Q5KIuUEbI4H0X1oL/gzkFn295ZghUBL0tiCm/QAoLWORCgpJuUp4wIABbgsYnigvobBSCnACREYZQVaGEZGHSCvLRMryUGjEqFIAB2wLwyIIAEJzH3LPYJ8uNyk4uwphl1CFOKA0PPfo78MkyxmJgfRGJYKwkjSVJw60qA8hjmOWbw4lz+eqgp0+BeZs74FlmzsvkFZwZObheGcGx7zpERC+CcBqV0ROMEILAUDRUy2jmf

8XoFDgL/PzPuKZFkveeN4ofl3/imYjaOlXMDMSU2DsWZ4UFH+JlEWwidNZWRC0QAvqLH5Uow0S0h0jISK56VKIUPRKzh8KCsiDQAJK4iCC3/ieDB/7QmSNeWLS2AKsfITQjEbBaMJFZayddtHEPhlAoC4AOn43lxegV14nRxhAbZoFTYLJogtgp1FsC8AsZK3jOwX1tQJyr2CsNa7gABwUbsixhP4dGIwo4LxwWC6WD0dOC2SRs4K3fBV+AWBUuC

r3+q4Kr1rrgqdVvqkLcFsATlWxpAwmSPuCpiSh4LcqLHgrhkZwAZwA54LlgXOWJYFu/MBX0szRLMlH3TcuX8oxe56oKs6INgvsBUMtWdxCs5HwV1YOQ4pH4V8FRB0ewUEoUe8jeCr8FRVBBwW/grGGv+CiAAY4KPwKUBCnBUno0CFBkSVvEQQsXBdwAFcFQExYIXHE3ghZUkRCFQcTu8EoQv1SGhCz0SGELavFRKBPBThCvCFl4KCIXt93kYiBM9

YFXRyObn8MHiAFXICkAJ4BBgD57ycdP6AfAAdIBjslmuGObhpgMUk9oNKQrk/i4XvOoeHgnGAn4ThoOelOYyI2y+ktlFnLQRV6BEUzysBfAkgWh1XYKWl8zgpjvzV3kpo2AOcbc7aSAyoM6ld5QhsLw+PvZ2i9YM5t5XPeVzfUzckIKaPlFLNXjvVkt25GAAZ6QfABgns+HCjCJptfbCEiGn/iEANhCRtU+snCx0YaVoXIbJF5iRslYhFmAKQAKu

QI4BEm6SAGtIJIATAAf0dlADcSGQgPXAd+ArkLa0gJLC3JGJYLtwAlgTjJ9Ik97mqSNsx1alcfCwPBpXPsfB8ICaIN4DrXGRsMjSMSBMUKSXnofPihWRM3f5TAiCwWg/OH3qms1XR2tQ33RcCOlkU/JVMgNYLKgUYXIO4tq0Af+GIh1VBjoldghrgDuRkeB3yS2QPgnoyABCB3DJXF7ktzFyVYU7kxkuTeTGFYEuAIN3DgAR4AxgCQUyOnKXszmk

FcZJXScL3aCL3LcBpaJoZTLA6Mh8Hr0SIWOjJ/B5Yo32AHnEfEOv4gjGRZgsTSpJci6FTvz+T5PQPvdIuAXSpqSy01kR3Gh+TD81lSO7A5dhvQr/juxMscAQv1slBJgGqGKOGbias4ItEkPiWpkHVvUjqQulShIkQHKoNqYS6pVhtfhzSwt9mK7kZcA5IzGJLgFSHQM7oESC+qQWbzUAl+HKVDMGawsLBqz6wvdGNhGSWF6sKeIAyws6qYwzX8FR

zwYajKwqJGF1U23YUsL7YWawo/QhpCysQVsLZfLzbUO7GrCyqwpUMLfoBBAxalM6NXc9V8wtl1nMzebYC8MCt3krYXiwpkZnFXL2FAsJZYU7b2dhYY8JWFgEZVYUgQQ1hchQLWFyFxdYX+wtdQIHC714SPZFYQ7nJElrYUrEImVBLkC/rDcBe4aCsCy8gaXxLbBSyiXfKPAD9gt3SQGnItGpUZMkY5kaVx9zQUsJTC1I8nqpo+DHQo9wZsM//ZlJ

zeT5Mwoytg7kscx0OBFwBhFwZOa22EpmkhTfHCk6FGOfWUcr5QfzNkYYJSJknf84pZJsLQ4WFwtVbOERZD6hOECPpQc3IoNEPaTCMNR0UClQns5ryvG7W3sKB4lXwuz1jJ9LNhctF4VKGPHRQE/C5EEqIJt2bM/wUaqDGBsMTghRED0u3TeU3PAdBp6SxlkIuzPheZyD+Fl8LQ8JwUBvha28RVhMCsH4WAIpIgM/ClEEgCKcpLegogUbK88OILVR

846aACXCKoYnwFYIhSdrfCCm6hfKNBq06ATPR11FObAXwWCkPltTXkjCAT7AMPd48Qw8tjkMwoeWdSc+RpMgK0MlyAsQaY3cljA/G5um6EuWyheKFGhIfQhofbAbMZyWDwVBEXPE49L4rGAoNSAEcAkx9gzGUqhZZB1QSoUfQox9LAUGe+B1QH5SekRAAAOBCLISOoMTAeWREgE6HDMkKoUfQpWMC2Irg5h2wdfQOiK9EVIqgjmNuEVM4aZwqxTm

Iu3CAoABGetiKQkUf71lsJCzOkYWiKOADeItUgPoihNcRiKTEVAQVRBtCDe5S1iLwkWvQCzZI4i0pQySK877uIvIgJ4iwcw8SLEkV+IuyRSmcQJFZiLoQYhIrCRTUi16ACgBIkUx0CrGT4InFZKIj6zl8eyXFLEi0pFSKpDEUuIsTfNUirigliLdIg2IvqRfYiyP0TiLW2TGIoKRekiopFXiLdEUJIt8RSnJGJglSKbqCDIrsRaEih6eWSL5gCNI

tsRYOAZZZO9yT9EqWJIgC4ibtAzi0LkGWPz/EMN1COkmDhpFFT+j19vsqQMgUeJ/mh4DVkPMa9TZBcNgxzLgPHHYJ1YlD54gLBEWvtSkBTSc2S5b6zJYCTH2QVNOHBhCkLdYDm3EAkQqIIfeFD7TNkaIul6EMflJYcqCLl1Roos7BDZw/zoZkonIZDyF00iEc61hiNyUdkWXQ7YJiigfQTgK5DGmkNmKF/WeuApn5fqnBLzSfsgPcAF1/dlNnuS2

66K7mbCZXdtEfD+EFjqL6gkmwF6CJwYeeim9kkxcimrmDYilbDIN2Zh8h15SRSsgUL2wogFlTPGwz7Yz5FfQJlqgsLB+kdtzdOF/5ORRRHkzypzq1IPqlUOuUDPROZ249F3sGMiHqqC48IqIkfEoFiA0Gy3ra4AVArxhzFYg3NKdhbrG6Iv3NeUDnZXFADyJZJgHCss1aRiktMK88WfqjYsu/DewgDBP2JIGIKBh79Bq0QluAgKdIUFYk2oijQkh

BvTCRzCIdCyAT4FXLcASEw/wb7JvCqBzD+UNqTSPypEtwNa6Vw6/PKMdAq+qRVaRIfVjRXFWdmETvEUDj0xCrlMOxB8MG+AAACk6ySuIRSLnpoagAHtcBLs3CGP6SBGOa+DgEiB97azLgv72mCoW3QBcKSUEy3FIBO38UXQg6K4XGXYRRBOyzJ/eTGQGWGEmHrFuOiqWFCoMo3AhXG1iU+JbQ6APDzn6Gov9ooFJYNF6G0ETAWooD/MZQxl4dqL3

5bgiidRXTck1FYaKnwQeoonxCcOBpIqbBvlZ+ooG8AGi+YcQaKynY58UhhOGi7VxJGFo0WSg2N8fGiljkFQwKwSWmDdcX3RfKhGaLMWEBFFvyv4k+p+8h1C0V2vF6riWi9fQZaLKkgVorAxRdEw5IRWkxKx9fGO8A2i2DiTaKvQCtosElpcvMqZboEOXac9k/Yv2i1WYNHth0VoYrHReZ3KWFk6LBbjTorNBLOi8QEki4F0UtoCXRRi4TxWgBl10

UcYvVhVuiss57U9TTmh4VJQBMCDOaTnJKEzpbAZ7uRC6wFTjSE4V1bjP+CjQo1FhdFSxb+sJ3Qhei12I1qKYtL4tmoyLeix1FzohnUWPovXBO6iytkr6LvUXwsE/RXuk/1F3ChA0UYAP/RaGi9cE20JQTAgYqyovCDONFMRg+vCJov/+AG1bhQsGKknjwYq0iCG4rNFmgz5xgoYvzRaOi/qixlZMMUfJFLRbJ6XDF9kJK0WbjnorBkCbl4taLJFD

1otE8uRiiwZlGK20WN6RoxQNMujFQuk1NbUVk4AMxiodFGww2MWx8RDhcK0v0SU6LpYQzotogHOigTFwCLhMUrn2ZVmJi4KI4glN0WNRO3RTJihpgcmL90VazN3OeDfTGRDhBV4E8ABIgIrgL2RumDdGLmMmksCXgbPZRfD54DM1P2BXwgC8cVpU646sajHuJY3DSMi5D96C2aDXuMIgdYZUH9yrntGMN2TKiuBpIPz5lI3GPAZjtVTRZ1jcc5Fn

kNPSqp8e9p9tztUWfxl1RdCChYIab5BWbwEAsYIaIQNgSGFqxgVDHBxX7C9OuZsxJPLK624ugY41ZJkBFaq7ZYLaUMI4+M4Bhz/mGk8LKiGDi+7WS3wrKBQ4qRxSQYOHF92sEcXOxHJxeDRSkZg2VwdqzCU7WleXLHFpqC3YlzizWoHjipisWwY1ig8JEHKOemQpmamK4EXAzIQRajs9AAROKvzCiAFJxTTilYYsOKxOqsiGpxTqqGHFP2EbgmFU

ADfhq8R0JGOKWcXeJLZxSPkC6Igk1Ao7c4pIRZCcg8QqL5hgA/cU9/IRaWaqZdBLyBXZnLNnnjK64c5VNizZ5LZCLtXORE/GphToXoMHIWEo8uIUsYHiw2vOkaXa8nYZVVzKJl2GNTAIuAXJpTKicfAo+EwbEV863Zc0c02Kb8h+7jqi4qF95CksWHorYAOxJYTRTf9WsU3807BNUMZoG5INLMI5gDErDOcSkGF79bLI0CUtBATALPFpBEc8UFwo

/hQXigfSF7EGOLmHPXHPAKTccFeLjWFFCNa6N4SeZ0QHdEdlcGPjhZ0ik2kVeKDUWZ4oDEmKCN7KueLC4VN4qf0i3igdQbeKPxzwgy7xUCTYCZCAi33nsRmJUPoAGoAvBpxkG0IoSZJteJtoEPBOzyIdjtkrpYj0gMXhoOgakhY7m3nXk6vL5CwI61AKgPTiSTGBso+tFk3z+nBv3RrZ2wzD2lPYuN2ZBcuQF5zTti5MfkoaLqiqZGTm9gIEuCke

oIH8xFFXaSU8XsTPtRUSsEDcBW0QdqgYstgXJRBe4PWsB9puQFpxiCLFjk/kyOAAgQV++Ls8ntFELASAiAGUk5qI8pDyYW4eQXZwGQJe1hVAlWVF0CVKLSBeDL5PAA8gi8CWbWE9hb8OYglsgCasWAeAEON2zMzyligf8qOXJkTGDIIL60lQDYEXxWFxR0ip0+dW5aCVdovjBHlERgleWtmCXT3CwJcxWDgl6Hh8CVpwp4JfE8nF2sHEBCXz6QbZ

snOUQlM2La4VO1PDiBSATSA+gAA3Q0IrWxX7cDxqTFItCiLSNfMTb2ayYD1MfVDY/MTPvtMbhIVUUd06zvRa0YSwIpqoMhuSrf3Pt+XPCvxRC8K8wEs4JN9HDJQtU7ZMqyRJi1nMXj9QhRoeVdVnz70JrPASpH5MboD+JIEuUJRKvOVwaBKjCWXsxB1hBirglueLvviOYW7RQrC5UUrdigzALLFU5uYS2yy+RK6CWFEvyoSUSznsZRKpX4VEv/ME

QSoMwtRKUgT1EvjAoxkZol1BKk3keQyQEEz+U9qscLhlnD4vkJZTNWwi9BKVCX4FS6JTeBOjm5RKgsUJort0AMSvOAQxKsvgjEpdAkBCugleGRqHYWErZuZeYjuoAlRhOCjrP8UPQAYgAqkB96QUQFmAPoAeSB3gKE4SnfM2kKBIeHgMqgJtSScG+TsjYHlqG+AlMm1MhwWuQjXXZsULv8VSooy+X/iiC5NVzqMAFZHKgWTmaNmUPtKckYIWYzJg

oDQFB8K4CVA4tTxeIXWDu5ULNcDSIQORMVwOWSLtp0cCWwH/3L7YZIstWRIsA8ngERRyY6GFFxiPW5R7MwLnifChgCABKgDdoBm7oFodt5WIUMBBkwA6QPcUK50AlhhtS9YCk2KegeMBwOjaSBzxlvuTxscJZYwFzfk/3HTwOxgYlgc81LclAp3IUT/ix7F1aSxEUm7LkBSvLbd5uqklVmovQQypqdG0xmSzeLHMrmeFrfsFS59qy2SW5ZEGAIVk

LH8J4BLgDQJX8QQyuHfoxOgIw7VJTjxp3JKdpmUw2zGK4lbKKLLAqMcaDuzHBpRDaM9zNjWJaTPZn8IrlHn987f5APzEoV7DP1JQASsWwTCg26a4Tg4kY+UHmFem4fxDvJg4UZoC9tifhAHqA4p2knvV5ZPyy7kWvJruUx8lZ/LWgfXTbvJR12c8i2yAzuhS1paLf20WovXtGb81ajbyyuc2o5rZdS9yNQCEnkg7VgcYG/b7+xKBNoBoFXD5G4YU

EEzoEUgZJ+X2WIIA2sl6fl6yUFqJh2OujEWFLZK6aztkpl8tg7XlY+MIeyW37T7JaG4KjmO88GElmANHJSK08uYHrlgEDB/2nJfkMa5QN3D5yXeGACVM9WTQYQGwfOg4xjKkbrAdy5aoLJ27smSXJaqAldyrXlbPIgv3OoFuS/gq4VZWyWld0siB2Sjjyp9sbwR8rGPJdm408lFcoT2aXkpHJXs8sclKU07yURQinJTzWJ8l7vI5yWS/AXJRcSvr

Qb6TQKajRRNFmeITJcqlDGVl7GFEqMsURfoDCQTTYgGk6uuy6CNoy8h6hD8aVp4taVVuOt0t63bdHF5tNj0Lo4vOEPZRezO1JTCSj4FmXzroWvYt+rlzsU45f6D+KF2JieFo9CwTYmth2wqnSO0WZe896G5Nxmw5sACpuE9uDtuj7z0mQTpgoXNCCk3FwmQKbhGUupuKyPPhAw3UqwGfnR8AZnCUnqyOQuHZ3UBGJmpUeoxqfIBCRFenHYTuEMfs

S6gZyCqfGeBYCnUSOgeKKrnB4pfWZfkx3JcgLsjHuWKIJPSAJ7Qs8IzuiNlD4fENszIls78FDKZWSA7tCC2r5ZdTgA6+Uqm9tfYAKlMsY67DeCi45v10XdMZu8BNm63393iT8wUqtFL6KUIByr+VOs9AFnTk/k4Pez6UC+UGYCDXsfCQ9UqO6EdoBAFDayXbBDlTmuOJVdqlt985mYIYLvqCL7YgFXAdY74d/OE2V38pTBdcL0uhXbEygLCFKuQ8

dzPiXnwTBsBhfVeQuBI+Yp2yQANDj4XsWp7AMLbT/yqpCeEXCcNKVQyHNxnolrBdSElp0LUgW/3JXeSIitMlyUK67mg/JQ/qo0iaAtRZJe5ZFJl8N7idS4zGdfXk/EWg6PtI3IlqvdXblRWJRjFpVUGAT55OcmzD1XRCciJsATmBj7TFgHZ0RYvTUM0rzSEWq9ljtIQAVSAewA/ADhXR0kCmOYuRslhbZL7wHYcKtAKMgjnCloo6SxnTANYAn0XV

94yDR4DfiLS7VJB96DbllLvKiJbmCoH567z4iXCa0cMUdoLmMgsD48WgXXbDLJrHcIxWyFNby0XL7ocERTFYQLvBjnaDGBSMoNpFRSjiUVZvKSVErSy9+VFKxbYf2hkANx8PYA/oA4JYU0oRyHYlISwcCJftGIjgNlAHdYnA5liPzmQdDZpVIvAh8inhHig0uyGlrzSv5FLiB+aXSUveBU7dIWlzvyRaWeDkXAEWA9eFpJ82MDQ/NE6HNaG/YctK

pppVAt7SWUAA2ltll06U8OUc5GrS95MGtL8FkUQoaeYBSxpsmdK18Ud9yXEVGk3oZ1FKP7RyQBAqptAQgAtacqo4HTA2yEpLeFiagpTUADSGw7DQnaAl9Fo3aXE2A9pZw0L2l3NLHnZ+0rEBQHS0+Zj4ig6XnQuERVKsp5Z4dL4az+lmEMokhOWGalyQaU3tPzdNyTFRFzpjfUSyvj3riXS5ghpTA96W4LO6UBOgNQGuSYJjHVjIcaQXSgClWj8S

DAq0sNpZXS42l7EZqAgpLXFaN0yYJp2AgYwEHoD3oD85UjWKRIz0Bn3PB4j3SksF1qcOaVhVC5pYNLYel0UKSyaB0vuxU1s2ElepKfqUvYrd+XjU5XceP0jPBE1L15DCioOAulNryBJ0uj4C1w6Seh9KwZqH0qhhjVxHOlZ9LtJp8RP/JUuUpe5MNBD6X0LLR/EbS9Z24cR9AAtoEwAFXIeIAZKLgwXBLw/petoBnCEMY9LKmoE+JLZme8Q7CZAh

5hGl7pSAyz2l4DKfaUq2hHpTZY9vAMDLbXnRUt/xQgy/MFIBzsvkiyK/EXHgKgs1OTpERTGIvkUswg9BOlKuUY/EQxmNMESUsRDK6RgkMrcJmQy+s6udLT4ia0vZdNQysV+VEK6GV30uLec1IiulhyK+hnsRgBtD4g2O0eEAKaUWwBZ5HcA1ul6JoirlVj2IiHGse2uBODJGXs0ukZWWACBlvtKoGVvySUZVFSh7F0qK1GWyop+Ba9i2tO9Vy9cT

vTCiqD8s9XIzO1REDFkpxJRfWXvZaJVLGUeMsoKsoQGxljHo7GWn0trhpQykE42tKkdk2ApHxfrSuplpdLAKbMiKYZbw3bI4g/8/rA+0A0Ho4Sry27dcDKhyfDFppBIUjWO7RHsx433WuEAyp+EUjKB6UyMqEpXfde8R49Ly0lJkqruWtImIlXRiQUVh4sRJYfImC5XqgdsjVGIUQYtfaMgSngv/YA4t5Ub3spd6tTL06no40aZTvrZplCbdWmVO

Mr/JVfSmhlbjLM9G9MqMheYfJuhgzKih5AIg1AP6xU5A/ZNf0k8Mp/6KvcKTS3nBmpgoIhi4DCAH90M+8XZIJ0GAZQky9ZlSTLZGVbMpiWTsyiQFBwtQ6U7yLnpalC+hRTKjbrjedCiqFo082AL3c8egVMtgJVUypTguMgU6UafisZUUyd5llkFPmXq0scZfnS9TFutLNMVcBnoZV40xhlD9LmGVgOB79ORAATwVZ5YJmMAuPxEiia6MVWcLpzgU

hWkIwmXHwWikcRyefSnjASooeaX1sCsx3U2VaP5bKeFg9cJUWSQPZgft1R92o18XfntbLkBaY3KRF7CVn0TD20fKMvS2T8gIhDfYEmK1RY8yzYxH24FNbLnzLBNx9dfQmfj96K5LVqYHF0yQ46KR5Rg0wmM5ppQFlw094XuEUEUD8sdQ6pJ+FAzmB20QAcYHySxW42UXbzK6AAxcq2H4sveQ+mL7jnlGJuMD8JJLsOqBz9UNGcqCJN0taiv97RJB

EAE6YSlAJLtVghmrArZXekSaIRqQtK7bijc8titGlW9Rh/PEaQH06n+XGLCn+kUf5RKGjnItnH14I7JItZ5BkAIZP+H4EAWLNzhRf0pBqFqRzCDbLtWrNsoVMBOoIdlOXUR2Wt6x3ZSIwVkQrrI90J6riLgBbPDkSuIi+4ATMDqAPq1EuAzgBTojl0KaFBB9DqgFIAX1Dc0F9isEcMqIAbK51RBssHMCGy3tCYbKBRpoACibFGy9fQMbKxKxxsuy

rmHeSeSybK9aGC6AWBemyyHkhEp9xnKtndcJPePNloaKcN7/ICLZYARCQi6+gy2X/2wrZfAYDMI/Yyw/i1stxMLwAVygLQKm2WNsr4BFQLR8CF2Nb0Wno2RheTqLtlTwTaBZbUD7ZTOyskwL7E92UYWCHOEiCbowk7LGOnTsph5HssedlGsTtOJLso1NHv8KtF3wZ4UA0cpGYFuy8NAh7Lh2UCcrX0Wpy49lc3JT2W7cMg3KM8WNAsxhr2U00HT0

Peyx9ltVxE8gvstM5YfkD9l5nKzmDVO3osrU7YGBQuKXOGsNy6adMCoHuGbJf/h/soL0omMUNlq4BgOWRsraYOBywNlY3J42X7ryQlEmynKZ93kFwVVGAzZShyhtwaHK4NAYcpT8Fhyip4jgCB+Lm/1LZa28ctl9HKuKBVsrI5TWy8qJ+it62VKcrP/HRy29FrbKCBjtspiooOqdjlshzXPJH9W45eJywdlR7LqpgacvH0uOy5LQInLLM5icrykS

qMbkhC7L4YQycpaiEuyhTlG7LaOVyxFU5SlitrlwtAYsIc+N3ZepobBgJTYxhx6cqhXAEUV4Ry+gb2XWcofZeyvccEYeRNxivssy3p1QT9l9nKKKWdHIS2VNuC0SmAAjZmBL0TSdrdfEcrVIeeoirWo0LKpUxRCPFnpQIOmmELW/Luw3EcG37VCF9UM2/PlZBgd52HKMsyZQC3bJlz2LXfk2mSwMlkLfiBYSMWHTj7z4hhdS7z6JaM/1IaYHwsXv

XCFZPz9+bgZ6JEajo/c9+ej8q+7bv1mET9kkskhKLEYH/MqLpfBCbHlG79KUXvVOxUOAAPmAT644ACx3jBhvCUaAAwIB0gBlABwYBTxBgAVVBiagtnS0dFo6XoALthujqylBwsNb+LsCMDKxeXeFAl5WkAdzc1uTZeUhIH9ADhYCXW3jlleXkCEl5a3aTXl8vL9ABS8q+pfkAXXlyTQcLDxQBR0QtYcXlJvK0gAmSAnbMby1XlaQABFDYrJuAHby

tXltsUGSou8rSAKVAWacHvL9eXtjxW+c7yxPaevLdOyd/ID5Zby+3lSuUfBAsQDgIAiMeW8ovLA+VW8oUJhUgM3l5oAz8AB2m9yPgAMxwWfAJ8hgy0N1LLiDrAafLyQD4AEqwBUICXg34gdor8IJ3QUby+c4BgAjmoMAHwHLYgMfsfOILOA+8rN5c3jX/EovK65b9ak3XM7yzvl8oBzwATWHU0CQAA+oucBYUDRFFfsIPylnIjaAv6zRJHIupQFX

AAN2Mg1B1hmuAEvy+4EeoAqpiJaCnULPy1kAN2MRWpqHEpkHYHafArcBm+Xx8oN5QgAEyQjyUHcCM0kSgO0kTqmuPAx+XF23zMNZQYu2JRTJpjCAHuQO5AYu2eQISQCkAGMoNzyq/UX/KmACj8rn0E1AVBAzfKjPEZwGYANUAT+AcABh+UIACAFcEAcflM7KEABeaHJALXywLQQ1TX2jOQCqKVHyxzgJi9HEgssP15akAd5KHHh+ATX7UpEMgK2n

4wzIS9qLJGCANRtboADmpEaxxaGhwARUGvEsW8aYCSMGAFaLy+2AOFR4BVOwB9iMuaRIQdJQoBU/MDiYcoAXgVIArkjjwiBxtEQK19osAql8h5iARIG7QAw8LCUAIB/gCAAA
```
%%