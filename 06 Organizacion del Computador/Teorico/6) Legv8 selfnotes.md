---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
f = g + h + i + j; ^6CEdapM4

ejemplo rápido y basico. ^g7Gthf2k

Por ejemplo, acá se almacena y se carrea
el valor de x0, (es una suma una atras
de otra). ^FCtBIZXq

ADD X0, X1, X2 // f = 2 + 3 = 5 ^xp9MXihh

ADD X0, X0, X3 // f = 5 + 4 = 9 ^0t9hGc05

ADD X0, X0, X4 // f = 9 + 5 = 14 ^3fbcVgvz

ADDI (Suma inmediata de bit)
 ^1yRRN4Mf

Suma inmediatamente 5 bits. ^xIVSjfRo

b) f = g + (h + 5); ^2pMRrW3I

ADDI X0, X2, #5 // f = 3 + 5 = 8 ^t6kQYIKc

ADD X0, X1, X0  // f = 2 + 8 = 10 ^lEcDnfio

El funcionamiento de la direccion de memoria es exactamente 
el mismo. Se diferencian en que son "Contrarios"
    LDUR, se carga la inforamcion de A[X2, #40] en X1
 (Registro destino/A modificar).
En STUR se carga la informacion de X1 en A[x2, #40].
 (x1 Tiene le dato que quiero guardar en memoria)
 ^DsbJYDrT

cuando se usa una instruccion que usa flags,
hace que se disponga el uso que se les puede dar.
del tipo:
SUBIS X0, X0, #0
-> Permite usar flag (después de esta instrucción) de
B.LT else 
B done
B.GE 
y muchos otros.

Dada  ^xpMF8v91

Se ejecuta una instrucción que setea los flags (ej.: SUBS X0, X1, X2) ^TZENbeSo

El procesador actualiza internamente las banderas N, Z, C, V según el resultado ^JTAUfQOq

Luego se usa una instrucción condicional como B.LT, B.EQ, etc. que examina esas banderas para decidir si salta o no. ^gpHap4wm

Son 4 bits especiales que guarda la ALU (Unidad Aritmética Lógica) después de una operación, indicando: ^UXVR3KZc

N (Negative): Si el resultado es negativo. ^6a8OgJOq

Z (Zero): Si el resultado es cero. ^urijRj2c

C (Carry): Si hubo acarreo (útil en sumas). ^XT3hKISZ

V (Overflow): Si hubo desbordamiento (con números con signo). ^1aPae5Hz

R: Instrucciones entre registros, add, sub, shifts inmediato
I: Instrucciones de inmediatos, addi, subi, 
D: Movimientos de datos, load, store, y sus versiones
B: Insutrcciones de salto.
CB: Saltos condicionales.
IM: Movimiento de muchos bits hacia un registro ^VBLUtsIc

Opcode: Equivalente de hegemonico pero entiende el procesador.
Relaciona el binario de opcode, con el ADD por ejemplo ^akopZBPr

Con esto visto, podemos relacionar el
mapita visto, con las instrucciones de acá ^G9urmYF7

Como no necesita inmediatos, el shamp queda en cero ^SCfdDyNt

solo tiene sentido
en ARMv8 ^EIWRh6ck

registro que usa para calcular
el acceso de memorai ^v4EmFPVN

direccion de 
registro (target) ^ddNyZsvS

dt_adress ^NzpWBLGz

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

Límites de los 32 bits. ^yxkZqbNR

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

Los formatos ("Plantillas"), son moldes o reglas de lectura.
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

OR / ORI: Compara los bits. El resultado es 1 si al menos uno de los bits es 1. Se usa mucho para "encender" (forzar a 1) ciertos bits sin modificar el resto. ^tBvGT3qG

LSL (Logical Shift Left - Desplazamiento a la Izquierda): Agarra todos los bits y los empuja hacia la izquierda. Los espacios que quedan vacíos a la derecha se rellenan con ceros. (Dato de color: desplazar 1 lugar a la izquierda es exactamente lo mismo que multiplicar por 2). ^w2CHfspz

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

## Embedded Files
cd041e2c148823f55f76502932b10f4142b08ebf: [[Pasted Image 20250514182428_426.png]]

a13f69304ebf938d68b750f1ae960694d6475e43: [[Pasted Image 20250514183249_129.png]]

486b42011509339e340c72d517e4b3ad3187e1e9: [[Pasted Image 20250603143440_619.png]]

8f97dc051ba7af4cbfd4cdbf897e3077cd9937b1: [[Pasted Image 20250603143555_327.png]]

9ae507a3828f21e973a403b4aab5d286331f5d7b: [[Pasted Image 20250603143623_198.png]]

f417e8cda410962d36b43471dcfc935442890c3a: [[Pasted Image 20250603143644_114.png]]

d9f6d30026855fa4cb8a91167f215871e351919c: [[Pasted Image 20250603144931_480.png]]

f1feeffdbc3690569f3e3ad5f240c34fb9667d0f: [[Pasted Image 20250603144957_161.png]]

8b6ec3485d0b480332473f7d330dfccde31bbe8a: [[Pasted Image 20250603145004_410.png]]

8328acd6b8c157269a9afcf7ce743b27e23dc18f: [[Pasted Image 20250603145014_171.png]]

6494ce4bfe49045c0cba846d924ad003a5688f1f: [[Pasted Image 20250603145020_778.png]]

471a39525713533c0b4d4379414f3350687708db: [[Pasted Image 20250603145030_925.png]]

20e475fd3962f04b48dc11eea6f849b1646e2e81: [[Pasted Image 20250603145047_041.png]]

96bd2dc5a9c49c050cb36ccb9193c457972f421a: [[Pasted Image 20250603150654_422.png]]

cc1b523ba0f03408fb71221d96322ac3189413ef: [[Pasted Image 20250605144122_104.png]]

2a6701e4efa0cf1b85519826e978a1b22e204e4e: [[Pasted Image 20250605145139_204.png]]

ffb3ec7b4539bd97596aa816ab38189f51869ca1: [[Pasted Image 20250605150003_779.png]]

041a61fade6048dc91fdb2479b9a49aa48766ea9: [[Pasted Image 20250605150023_047.png]]

4e59dc0f611a91c9ced8849eb9a008418924ed92: [[Pasted Image 20250605152514_148.png]]

d967aefc4105ee36d8b6355db199151a7ec6c13e: [[Pasted Image 20250606160945_339.png]]

11912157e975cd3ede532f9fdf61c9b7589dace8: [[Pasted Image 20250606162223_379.png]]

65412a585be47a9bfcc08497c79efb2518a4b9a7: [[Pasted Image 20250606162500_243.png]]

67b5588486965e39dbd0cea88719e93eca83087e: [[Pasted Image 20250606162606_364.png]]

c3ba222583369a78b4f44b181116402c50d3a6cf: [[Pasted Image 20250606162832_308.png]]

8534c0f604ab0308ed6a69d60b93112148b0686b: [[Pasted Image 20250606162930_874.png]]

319cc3a4fcd7502dd204875ef3fb41f8e3f1a4d6: [[Pasted Image 20250606162958_742.png]]

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

%%
## Drawing
```compressed-json
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
```
%%