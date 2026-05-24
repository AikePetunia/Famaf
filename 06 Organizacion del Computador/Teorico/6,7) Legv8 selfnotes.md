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

Es la arquitectura standar en telefonos y en mac. Usa el diseño de instrucciones reducidas y simples (RISC), siendom uy ordenado y todas sus instrucciones miden 32 bits, siendo rapido y facil.
Siendo un chio tan simple, un chip arm consume 1w. Es capaz de manejar internamente datos de 64 bits, a pesar de seguir teniendo instrucciones de 64bits. ^Wonm1Szv

Es un subconjunto educativo de ARMv8, una version "Lite".
Las instrucciones son codificadas en binario, llamado codigo de maquina. ^YDgZ7UiO

Operaciones Aritmeticas ^GRByUQc5

ADD a, b, c // a gets b + c ^Pqgeydkv

Todas las operaciones aritmeticas tienen esta forma. ^FEJCIR3R

Principio de diseño 1: La simplicidad favorece a la regularidad ^byLky3KL

La regularidad hace la implementacion más simple.
La simplicidad habilita mejor rendimiento a bajo coste. ^EkysWBeo

Operaciones de Registro ^je25KLPf

Las instrucciones aritmeticas usan operadores de registro. ^tkmy2d2O

LEGv8 tiene 32 x 64 bits archivos de registro. ^ry5oNL8T

Usado frecuentemente para acceder a datos.
64-bit data es llamada "Double word"
    - 31 x 64-bit su proposito general es registrarX0-X30
32-bit data es llamada "Word"
    - 31 x 32-bit su propsito general es sub-resgistrar W0-W30 ^BG8GWkc3

Principio de diseño 2: Lo pequeño es rápido ^BwfVYavO

La memoraria principal tiene millones de ubicaciones ^UiRQxv1T

Operaciones de Memoria ^e0xgyOH0

La memoria principal se usa para componer datos.
    - Arreglos, estructuras, datos dinámicos

Para aplicar operaciones aritméticas.
    1. Cargar valores desde la memoria a los registros.
    2. Almacenar resultados desde el registro a la memoria

La memoria es byte-addressed
    - Cada address se identifica como un byte de 8-bit

LEGv8 no requiere tener palabras alineadas en memoria, 
a excepcion de instrucciones y el Stack.
 ^oYfXsyct

Registros vs Memoria ^uOVZEn8m

-Se accede mucho mas rapido a los registros que la memoria.
-Las operaciones en datos de memoria requiere cargas y almacenamiento.
    -Entre más instrucciones, mas debe ser ejecutado
-El compilador debe usar registros lo mas posible para guardar variables.
    -Solo se debe almacenar en memoria las variables menos utilizadas.
    -La optimizacion de registros es importante. ^jLunPi0X

Operadores inmediatos. ^yxU6khos

Datos constantes especificadoes en una instrcciones: ^5NEpCsgB

ADDI x22, X22, #4  ^1GRnLXMi

Principio de diseño 3: Haz el caso común rápido. ^TISaBUCv

-Las constantes pequeñas son comunes
-El operando inmediato evita una instrucción de carga. ^Yroc3vzQ

Límites de los 32 bits (words/ registros w). ^yxkZqbNR

Sin signo (+): el rango va desde 0 hasta 4.294.967.295 (2³²−1)
Con signo (complemento a 2): El rango va desde -2.147.483.648 
hasta 2.147.483.647 (−2³¹ a 2³¹−1) ^Scdpvzvr

Extension de signos ^o9oY1S3U

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
     vacíos con 1s, Si es un 0, rellena con 0s. ^TyHKvY6h

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

(Inmediato) ^JO9bZ0ar

Útil para matematica y logica pura, pero acá se quiere operar un registro contra un número fijo ("Inmemdiato") que se escribe en el codigo.

Ej:
    ADD x1, x2, #500 (x1 = x2 + 500)

El cómo se reparte el espacio: Se sacrifica uno de los registros de origen (Rm) para hacerle un hueco de 12 bits a al número fijo. Con 12 bits podés escribir números hasta el 4095. ^GHQoJBPO

Útil para llevar datos desde la memoria RAM al procesador (Load) o viceversa (Store)

Ej:
    LDUR (Traer dato), STUR (guardar dato)

El cómo se reparte el espacio: Necesita un registro "Destino/fuente" (Rt).
Necesita un registro "Base" (Rn) que tiene la direccion de la memoria.
Te da un hueco llamado address (direccion) de 9 bits para poner un numero de compensacion u offset (ej: "anda a x2, pero movete 8 bits más adelante) ^fhHFbWqL

(Datos / memoria) ^DmPEjTb5

Principio de diseño 4: El buen diseño demanda buenos compromisos ^2pbkPbKw

- Los diferentes formatos complican la decodificacion, 
pero permiten instrucciones de 32 bits de forma uniforme.
- Mantenga los formatos lo más similares posibles ^la0hzjjc

Programas guardados en la compu ^Ve7iTGkC

Concepto bisagra en la informatica: Para la computdora, un programa, los datos son 
todo la misma cosa.
Si se mira una memoria ram, se ve millones de ceros y unos. El procesador no sabe QUÉ 
representan, ya que todo convive en un mismo lugar y se lee igual. 
Por eso un programa como un compilador, puede agarrar texto y transformarlo en otro programa.
 
Las instrucciones son representadas en binario,  como los datos.
Las instrucciones y los datos son almacenados en memoria.
Los programas pueden operar sobre programas (Compiladores, linkers, etc) ^m2KQzQw5

Operaciones lógicas ^b5SaNy0V

Las operaciones logicas son distintas:
no les importa el número entero, sin o que operan bit por bit de forma individual.
Es útil realizar este tipo de operaciones por que sirve para "Extraer e insertar grupos de bits en una palabra". (Mascaras) ^HR2eIEI4

OR / ORR / ORI: Compara los bits. El resultado es 1 si al menos uno de los bits es 1. Se usa mucho para "encender" (forzar a 1) ciertos bits sin modificar el resto. ^tBvGT3qG

LSL (Logical Shift Left - Desplazamiento a la Izquierda): Agarra todos los bits y los empuja hacia la izquierda. Los espacios que quedan vacíos a la derecha se rellenan con ceros. (Desplazar hacia la izquierda equivale a multiplicar por potencias de 2 (2^i)).
LSL es muchísimo más rápido que llamar a una instrucción de multiplicación tradiciona ^w2CHfspz

LSR (Logical Shift Right - Desplazamiento a la Derecha): Empuja los bits hacia la derecha. Los huecos de la izquierda se rellenan con ceros. (Es como dividir por 2). ^mXTcKeL0

AND / ANDI: Compara los bits uno por uno. El resultado es 1 solo si ambos bits originales son 1. Se usa mucho para "apagar" bits que no te interesan (ponerlos en cero) y dejar prendidos solo los que querés analizar. ^NBX2iD9F

EOR / EORI (Exclusive OR): Es la famosa compuerta XOR. Da 1 si los bits son diferentes. El apunte te hace una aclaración clave acá: en otros lenguajes existe la operación NOT (~) para invertir todos los bits (cambiar ceros por unos y viceversa). En LEGv8 no existe la instrucción NOT, se logra usando EOR contra una máscara llena de unos. ^9RvmkOY2

Explicacion de por que pinchila podes bajar cualquier programa de cualquier cosa y anda en la compu re bien: ^jmuveZrO

El ISA (Instruction Set Architecture) es un contrato/Manual de idiomas. Es la frontera entre el softare (codigo) y el Hardware (transitores fisicos del chip). Es un reglamento estricto.
"Los primeros 11 bits de una instruccion 10001011000, significa que la compu debe realizar una SUMA entre registros" ^bhc9jTzW

Standarized ISAs ^Dq0Nv7Kc

Es un reglamento publico y fijo. Cualquier empresa puede agarrar el manual de ISA LEGv8, ARMv8 o x86 para poder construir un procesador fisico real que sea entendible.
Entonces, intel, amd o mac pueden crear chips totalmente distintos, pero mientras se respete el manual del ISA, se entiende la misma info  ^0z11hjSa

Fábrica A arma un chip minúsculo para celulares que ahorra mucha batería. ^bTC1997F

Fábrica B arma un monstruo gigante para servidores que consume mucha energía pero va re rápido. ^SlON3yU6

Por dentro (Microarquitectura): Son totalmente distintos. Tienen cables diferentes, tamaños diferentes y velocidades diferentes. ^fEkOEgwY

Por fuera (Interfaz): Los dos procesadores leen exactamente los mismos comandos binarios de 32 bits porque ambos hablan el idioma del estándar. ^hDMRmysh

x86 tiene su propio ISA, y ARMv8 tiene su propio isa. Por eso, hay programas distintos para ARM y para x86 ^2pXIA5Zy

LegV8 es una isa educativa. ^ggpgzMdL

Cuando se programa en alto nivel (C, Python), hablamos de "lógica", como un if (A > B and C === D). Pero en nivel procesador, y ISA. Las operaciones lógicas significa estricta y literalmente "Operaciones bit a bit" (Bitwise).
Se agarran dos chorizos de 64 bits, pse pone un arriba del otro, y se compara columna por columna hacia abajo. ^gvTKajzn

Aplica tabla de 
verdad AND a cada bit. ^qHzCOdWj

Aplica tabla de 
verdad OR a cada bit. ^dWnn6VvW

Aplica tabla de 
verdad XOR a cada bit. ^hFZkWQaL

shamt (Shift Amount): Es el campo de 6 bits dentro de la instrucción (en el Formato R) que le dice al procesador exactamente cuántas posiciones debe desplazar los bits (puede ser un número del 0 al 63). ^Sv12IVb8

Operaciones de Desplazamiento ^DekfbQVV

Operaciones condicionales y salto. ^czzl6dp7

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

acá ya es programacion en assembly ^Gq3x5eH0

Es un "Lenguaje" de Assembly ^jnVy0fE9

Operaciones de bucle. ^kmLdznpw

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

que básicamente hace la cuenta y, además, Setea (actualizá) los foquitos del panel según cómo te dio el resultado.
Que, 
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

La memoria es un gran arreglo unidemiensional, donde la direccion actúa como índice de ese array,
comenzando en 0. Por ejemplo, en la imagen el tercer element es 2 y el contenido en memoria es 10. ^MCIOqm9x

Acceso Estatico (ej: A[4]):
si estamos accediendo al indice 4, entonces deberiamos acceder al bit correspondiente a 4.
Indice 4, para el bit a acceder: 4 * 8 = 32
LDUR X9, [X6, #32] ^wAH37iAl

Cada registro de 64 bits (8 bytes). pero cada cuadrado tiene 1 byte (8 bits) ^FxbGdxeD

EJ: f = -g - A[4] ^2358xAFQ

f = X0, g = X1, Dirección base de A = X6. ^QDMyjPTC

Acceso Dinámico (ej: A[i]):
ya que el indice i va cambiando por cada iteración, se debe multiplicar por 8 para dar un 
acceso real. Utilizamos la instruccion de LSL (Multiplicar). Para logar A[i]: ^XlyUgFjq

Instrucción Store (“guardar”) Copia el contenido del registro X1 en la posición de memoria direccionada por el contenido del registro X2 sumado a la constante #40. ^FleG0o4I

A esta misma, se puede acceder por DobleWord, Word, o Byte ^9ssaSHIv

Tenemos para guardar datos sobre memoria (STUR), 
o cargar datos desde memoria (LDUR) ^d6iUBRhQ

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

LEER  y traer(LDUR) ^TqLO7WWF

Acceso estatico y dinamico ^QCNGBKzS

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

Pseudoinstrucciones ^rHtlEpTD

Las pseudoinstrucciones no son instrucciones reales del procesador, son atajos que te da el ensamblador. El ensamblador las "desarma" en instrucciones reales antes de generar el binario. ^zKMsBFWH

no es un "archivo aparte" ni un "procedimiento aparte". Es simplemente una sección de código que el compilador identifica como indivisible. ^3Kle20AD

Para que un trozo de código sea un bloque básico, tiene que cumplir estas dos condiciones: ^mEAtwQqZ

Entrada única: No puede haber saltos (labels) que caigan en medio del bloque; todos los saltos deben ir a la primera instrucción. ^gkImCTRr

Salida única: No puede haber saltos hacia afuera en el medio del bloque; el único salto permitido es el de la última instrucción. ^RJXXp4NU

Procedimientos ^3QWMLCSt

Procedimiento de hoja (Leaf procedure) ^Yzsg7nMe

Es una unidad lógica. Tiene un nombre, recibe parámetros (datos de entrada) y puede devolver un resultado. Se usa para reutilizar código (escribís una vez, llamás mil veces) ^8w7lZpNw

Es un procedimiento que, al ejecutarse, no llama a ninguna otra función. Es un callejón sin salida en el "árbol de llamadas". Por eso se llama "hoja": porque es el extremo, no tiene ramificaciones. ^96tWxZ59

Dentro de main, tengo el bloque básico 1, luego un salto (BL), y luego el bloque básico 2. El procedimiento main contiene a esos bloques. ^9JFUY9zV

Los bloques básicos terminan donde hay una instrucción de salto (B, BL, CBZ, BR). ^vftcnVxv

si tiene procedimientos llamando a otros, es non-leaf procedure ^k4xIh6c1

Memory Layout ^Cq45w0Yq

La memoria es lineal, pero el sistema operativo y el compilador la dividen en secciones para organizar los datos.
Es una convencion de software, no una restriccion de hardware ^mVf1heEh

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
    Nota clave: El Stack y el Heap crecen uno hacia el otro para aprovechar mejor el espacio de memoria libre entre ellos. ^q6PxUYQy

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

Los registros generales en legv8, x0-x30. miden 64 bits (Double word)
si toman limites nativos sin signo, es 0 a 2⁶⁴ - 1. ^p6WMH5dF

¿cuando saltamos? ^xrKLD4Ep

¿a donde viajamos? ^51PrxDZE

para calcular la direccion fisica de la ram (en Bytes) a la que tiene que mover el PC, está la formula: ^y2mk1jr4

Dirección real de salto = PC + (Inmediato x 4) ^wd9RizTN

Cómo calcula el viaje: ^XX1RY2pP

La CPU calcula la distancia en cantidad de instruccion de donde esta parado(0x08) hasta donde esta la etiqueda (0x10).
Pero, la proxima instruccion de donde està parado es 0x0c (1 instrucción de distancia) y L1 está en 0x10 (2 instruccion de distancia)
Entonces, el compilador guarda el numero 2 adentro del campo inmediato de la insutrcion B.NE.

Cuando la CPU decodifica ese binario, aplica matematicas: ^FxCqaYxa

Dirección real de salto = PC + (Inmediato x 4) ^W9ehogeO

Dirección real de salto = 0x08 + (2 x 4) = 0x08 + 8 = 0x10 ^Ez3lBmMA

ahora el hardware sabe que tiene que saltar a la direccion 0x10 (la correcta, linea deseada) y no ir a 0x0c (la siguiente instruccion secuencialmente, linea no deseada) ^my4lxcRU

delay loops ^xvSAD0Eb

solo tiene sentido
en ARMv8 ^Uy40Po4k

registro que usa para calcular
el acceso de memorai ^MxxQhBhb

direccion de 
registro (target) ^re8RhWzg

dt_adress ^AMjTw0Eb

Opcode: Equivalente de hegemonico pero entiende el procesador.
Relaciona el binario de opcode, con el ADD por ejemplo ^eKF5lOqu

Ensamblado, desamblado de instrucciones ^ESfzzSPS

B-type instructions ^NxOs1F2K

opcode (Operation Code): Es el campo más importante. Es el número que le dice a la unidad de control: "¡Ey! Soy un ADD, o soy un LDUR". Es la etiqueta que identifica la instrucción.
Rn (Register n): Es el primer operando de origen. Indica el número del registro (de 0 a 31) que contiene el primer dato.
Rm (Register m): Es el segundo operando de origen (en instrucciones tipo R).Rd (Register destination): Es el registro donde se guardará el resultado de la operación.
Rt (Register target): Es el registro destino en instrucciones de memoria (LDUR) o el registro fuente en los STUR. Se llama diferente para que la unidad de control no se confunda.
shamt (Shift Amount): Se usa solo en operaciones tipo R. Le dice a la ALU cuántos lugares desplazar los bits (ej.: LSL X1, X2, #4 -> el 4 va acá).immediate / address / offset: Es un valor numérico "hardcodeado" d
entro de la misma instrucción. Es un número que ya viene listo para usar, evitando tener que ir a buscarlo a la RAM. ^LZ9ZKkKv

long story short: ^XZDI4qki

Carga ancha. Para armar números de 64 bits en varias pasadas (MOVZ, MOVK). ^corlrGLk

IM-format Instructions ^SRygBU0k

(saltos normales) ^4xs8xsDa

Far jumps ^n4jBFgjF

El problema de los saltos comunes (B, CBZ), su limite de distancia dentro de la propia instruccion es de 32 bits. Si se quiere saltar a una de 64 bits que esta en la otra punta de la ram, la instruccion no es suficiente. Es una mezcla con la instrucción MOVZ ^UqX9TMfw

Se plantea una solución de dos pasos.
ej: se quiere saltar a la direccion 0x0000 0000 4000 0000 ^5bQQ4bf1

B / CBZ: Usan Branch Addressing (matemática de PC + offset). La dirección destino está adentro de la instrucción. Son limitados. ^NVAG3ABN

BR: Usa Direccionamiento por Registro. La dirección destino está afuera (en un registro). No tiene límite de distancia, puede saltar a cualquier parte de los 64 bits de memoria. ^FA0g8zdc

Tabla de saltos (resumen) ^XPU1gQBV

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

si ya guardaste el valor de f en X9 (o hiciste la cuenta necesaria), el registro X0 ya es "libre" para ser reciclado. ^n2Cey4zK

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

## Embedded Files
cd041e2c148823f55f76502932b10f4142b08ebf: [[Pasted Image 20250514182428_426.png]]

a13f69304ebf938d68b750f1ae960694d6475e43: [[Pasted Image 20250514183249_129.png]]

d967aefc4105ee36d8b6355db199151a7ec6c13e: [[Pasted Image 20250606160945_339.png]]

11912157e975cd3ede532f9fdf61c9b7589dace8: [[Pasted Image 20250606162223_379.png]]

65412a585be47a9bfcc08497c79efb2518a4b9a7: [[Pasted Image 20250606162500_243.png]]

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

aa22f23efcc11b9d75fa481a9286f5e9f43a3354: [[Pasted Image 20260517144218_894.png]]

5cbd8d1528d63e335cad3966d237cf3721604d65: [[Pasted Image 20260517145923_515.png]]

8a6353a430c776de14cece2501ac653e85abe3d9: [[Pasted Image 20260517221732_056.png]]

167bc3bc7c54962e8ca7653c99beb52fdc07ab6a: [[Pasted Image 20260517221826_227.png]]

bd001d9505e456918dd4c3a7bb3995583fa6d337: [[Pasted Image 20260517221838_399.png]]

aeabf86ef785948d0c198a2642647cc63c089a20: [[Pasted Image 20260517223358_203.png]]

0910e33d28bbab85a3d7e393861301ad277d1ccf: [[Pasted Image 20260517224807_842.png]]

5beeab9be66fff62710e4f84a6c52e19d1530973: [[Pasted Image 20260517225153_796.png]]

8acceb1a55efb74e83993d5536ddea3bbadf95c7: [[Pasted Image 20260518151929_851.png]]

bd8ab4adc11b9af143e6596e616243598f3e3636: [[Pasted Image 20260518152037_652.png]]

4cd0723072264567432144f6881a43d9ae51185a: [[Pasted Image 20260518152123_150.png]]

ae29163d7f9f95e77f9f4d18b49175f281750433: [[Pasted Image 20260518152230_617.png]]

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

3341e9c147316be4e9f74785243d02f6c1433394: [[Pasted Image 20260519120829_142.png]]

1cb4f7962c1d065c678fa36f5cf271a3025c59a1: [[Pasted Image 20260519121016_255.png]]

92a0ea069c6d96042d7becaa615c3285ca555b60: [[Pasted Image 20260519122448_118.png]]

b912fc099fe19f794a6ecc394bcfc5ca4443322b: [[Pasted Image 20260519122628_667.png]]

193acc52afae093d451c7a2330a7eba4fb9a9c4d: [[Pasted Image 20260519122657_057.png]]

493100eeb9e0e78ae8118b1f92f47024f4ecb6c3: [[Pasted Image 20260519123800_670.png]]

0a9da633156c3f3aeb12228956f2eb94034d49c4: [[Pasted Image 20260520144034_095.png]]

7116d2e74eebf8508967c8c1f3a34e4a0089a831: [[Pasted Image 20260520144149_813.png]]

efdd946181b6f5808ef7837fc4b9eb64851c5f26: [[Pasted Image 20260520144227_454.png]]

2298fa30e34889aa8b5b75237de8977ee03b60f6: [[Pasted Image 20260520154137_997.png]]

320137fdb75eb92219a3f9a966c520661592cf67: [[Pasted Image 20260521073216_846.png]]

c669726ee9df05300299207f86f8c7844be3e691: [[Pasted Image 20260521074824_684.png]]

bca514d848a18e7e115343626cbb97aded48f986: [[Pasted Image 20260520154506_782.png]]

a58cfcea1f392693ae33f2e1d6acde1b292551e4: [[Pasted Image 20260521083310_908.png]]

0b3fb93191f55af0e1d78283b099cc392767a6e9: [[Pasted Image 20260521083440_731.png]]

ab983b6f6ea0d814ccbdd4069a51f7e738a69f95: [[Pasted Image 20260521103343_016.png]]

f71c23aad3eecd9c716102584656957e2021f532: [[Pasted Image 20260521103638_934.png]]

8b052a99abe523e8ed73f944633ae6bce91ddd92: [[Pasted Image 20260521103701_617.png]]

8ae866fc7fd2a23a6d24846ff54c96c99dc270d0: [[Pasted Image 20260521104017_704.png]]

a7f43be1a367f6b77cc5f3cb7ffba4a04c08982a: [[Pasted Image 20260521104801_623.png]]

87573c5e9f6a874cef16bcd6cb3215c7109a7c12: [[Pasted Image 20260521104810_101.png]]

544c601709b36d52db7e161cce92b3ef69cbd0af: [[Pasted Image 20260521104955_036.png]]

4ce43ad36a86e1fdcd9d5e87755c11eaf62e8848: [[Pasted Image 20260521105347_089.png]]

13819c78d822c7ba3b295a65db43b639f7a3fffd: [[Pasted Image 20260521105357_421.png]]

cdd28e3e32a13c75a7c864983f25cbf900d4c2a3: [[Pasted Image 20260521105436_488.png]]

4c5d1403168f55220da1643d522bb4cc87c8b775: [[Pasted Image 20260523133113_527.png]]

ffc647dc64c20689e9e4a0e5a2bb3db764c78885: [[Pasted Image 20260523164421_513.png]]

ed249245e5a3440deef19222363ae4122dcd5cb8: [[Pasted Image 20260523164827_065.png]]

24e89e86fd530965442ee6524508aa32d137a769: [[Pasted Image 20260524125808_554.png]]

b07ba5691ba41f40d64fb57da9fa0295a3f4a1d7: [[Pasted Image 20260524130639_473.png]]

%%
## Drawing
```compressed-json
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
```
%%