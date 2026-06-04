![[Pasted image 20260603121835.png|637]]
1.
Si es ilegal. Los operadores inmediatos no aceptan numeros inmediatos negativos.
2.
Si es ilegal. Ldur no soporta inmediatos > 255
3.
Si es ilegal. Offset causado por > 63
4.
Si es legal. XZR es registro

![[Pasted image 20260603122402.png]]
![[Pasted image 20260603122416.png]]
Está mal el codigo de asm por que mira < y >, y no < y >=.

3.
Completar la tabla de señales de control de la unidad principal para la instrucción `CBNZ` (Branch if Not Zero). Usa `0`, `1` o `X` (Don't care). Si alguna señal depende de una asunción específica de tu Datapath, pon un asterisco y acláralo.

Reg2Loc: 1
ALUSrc: 0
MemToReg: X
RegWrite: 0
MemRead: 0
MemWrite: 0
Branch: 1
ALUOp1: 1
ALUOp0: 0

![[Pasted image 20260603123342.png]]
X0 = 0x1000, X1 = 0x3
Este realmente no se como hacerlo y necesito ayuda a entender. jamas lo entendi, mi weak point. Ademas de calculo de saltos + posiciones de hexa. voy a verlo despues
![[Pasted image 20260603123914.png]]
ADDi X0, X0, #1: 
Type I, R[Rd] = R[Rn] + ALUImm
Opcode(10): 10 0100 0100
ALU_Immediate(12): 0000 0000 0001
Rn(5): 00000
Rd(5): 00000

HEXA: `0x24400100

ADD X1, X1, X0
Type R, R[Rd] = R[Rn] + R[Rm]
Opcode(11): 100 0101 1000
shamt(6): 00 0000
Rm(5): 0 0000
Rn(5): 0 0001
Rd(5): 0 0001
1000 1011 0000 0000 0000 0000 0010 0001
`0x8B000021`

SUBI x0, x0, #1.
Type i, R[Rd] = R[Rn] - ALUImm
Opcode(10): 1101 0010 00
ALU_Immediate(12): 0000 0000 0001
Rn(5): 00000
Rd(5): 00000
1101 0010 0000 0000 0000 0100 0000 0000
`#0xD1000400`



#### puse mal las direcciones PC, en realidad era 0x400X no como estan puestas XD

// #0x04008
CBZ X1, L2 
if (R[RT] == 0) 
	PC = PC + CondBranchAddr

inmediato = (L2Hex - PC) / 4 = (0x4010-0x04008)/0x4 = 16400-16392/4 = 8/4 = 2 

opcode(8) = 1011 0100
cond_br_adress/Inmediato(19) = 0000 0000 0000 0000 001 
rt(5)=00001

1011 0100 0000 0000 0000 0000 0010 0001
=`0xB4000021`

// CB range = [-2²⁵,2²⁵]
// L1 = 0x4000
// L2 = 0x4010

// L1 = 0x4000
// B Range = [-2²⁵, 2²⁵+1]
// #0x4000c
B L1
	PC = PC + BranchAddr

Inmediato = (Direccion Destino - PC) / 4
0x4000 - 0x400c / 0x4

 4000-400C=
pido prestado

 3fff-400c = FFF4 = -0xC

alternativamente:
0x4000-0x400C = 0 - C = -12

inmediato= -12/4 = -3 (Complemento a 2) + 1

opcode(6) = 0001 01
br_address(26) =1111 1111 1111 1111 1111 1111 01

0001 0111 1111 1111 1111 1111 1111 1101

=`0x17FFFFFD`
// def necesito practicar esto


6)

LDUR X8, [X0, #0] 
ADD X8, X8, X8 
STUR X8, [X0, #0] 
LDUR X9, [X0, #8]
ADD X9, X9, X9 
STUR X9, [X0, #8]

No equivalente 1:
LDUR X8, [X0, #0] 
ADD X9, X9, X9 
ADD X8, X8, X8 
STUR X8, [X0, #0] 
STUR X9, [X0, #8]
LDUR X9, [X0, #8]

No equivalente 2:
LDUR X8, [X0, #0] 
STUR X8, [X0, #0] 
LDUR X9, [X0, #8]
ADD X9, X9, X9 
ADD X8, X8, X8 
STUR X9, [X0, #8]


Equivalente 1:
LDUR X8, [X0, #0] 
LDUR X9, [X0, #8]
ADD X8, X8, X8 
ADD X9, X9, X9 
STUR X8, [X0, #0] 
STUR X9, [X0, #8]

Equivalente 2:
LDUR X9, [X0, #8]
ADD X9, X9, X9 
STUR X9, [X0, #8]
LDUR X8, [X0, #0] 
ADD X8, X8, X8 
STUR X8, [X0, #0] 

### **Ejercicio 7: NOPs y Flags (Preguntas Sutiles)**

**a)** En el TP 6 aprendiste a hacer instrucciones "Skip" o NOP. Un alumno propone usar `SUBS XZR, XZR, XZR` como su instrucción NOP estándar, argumentando que como `XZR` siempre es cero, nada cambia. Explicar en **una línea** por qué en un programa real esto **NO** es un verdadero NOP inofensivo.
no es, por que está levantando flags que no se usan, gastando memoria, logica y espacio.

**b)** Si quiero saltar incondicionalmente a una dirección que está a 2 Gigabytes de distancia en la memoria RAM, ¿por qué no puedo usar la instrucción `B` y qué instrucción debo usar obligatoriamente en su lugar? (Respuesta corta).
BR

### **Ejercicio 8: Desensamblado Directo (Ingeniería Inversa)**

Un volcado de memoria RAM reveló las siguientes dos instrucciones de 32-bits en Hexadecimal. Realiza el proceso inverso y escribe la instrucción en lenguaje ensamblador LEGv8.

_Ayudas de Opcodes:_

- `B` = `000101`
- `MOVZ` = `110100101`

Little endian <-
**1)** `0x17FFFFFD` $\rightarrow$ 0001 0111 1111 1111 1111 1111 1111 1101

Type B:
opcode(6):0001 01
br_adress(26):111 1111 1111 1111 1111 1111 1101

B 0x7fffffd (-3)

**2)** `0xD2B95FE5` $\rightarrow$ 1101 0010 1011 1001 0101 1111 111 0 0101

Type IM:
opcode(9): 1101 0010 1
Rd(5): 00101
lsl(2) 01
Immediate(16): 1100 1010 1111 1111

1101 0010 1011 1001 0101 1111 1110 0101
 
R[Rd] = MOVImm << instrucction[22:21] * 16

Movz x5, #0xcaff, lsl #16  


![[Pasted image 20260604115218.png]]


creo variables -> las verifico (corto circuito) -> logica
loop: 
	LSL x3, x2, #3 // offset = i * 2^8 (para ldur)
	ADD x4, x1, x3 // x4 = direccion exacta de a[i]
	// si a[i] != 0 terminamos
	LDUR x5, [x4, #0] // lee a[i]
	CBZ X5, end // A[i] === 0 termina
	// evaluar B[i] > 0
	ADD x6, x2, x3 // guardo en x6 b + offset
	LDUR x7, [x6, #0] // lee a[b]
	CMP x7, #0 
	b.le END 
	// cuerpo while
	add x5, x6, x7 // a[i] = a[i] + b[i]
	STUR x5, [x4, #0] // guardo el resultado
	ADDI x0, x0, #1 // i++;
	b loop
end:

ej 10: no se hacerlo

ej 11:
![[Pasted image 20260604121546.png]]

loop 1:
subi x0, x0, #1
SUBI: R[Rd] = R[Rn] - ALUImm
Type I:

Opcode(10): 1101 0001 00
Imm(12): 0000 0000 0001
Rn(5): 00000
Rd(5): 00000

Bin: 1101 0001 0000 0000 0000 0100 0000 0000
=`0xd1000400`

CBNZ x0, l0:
if (R[Rt] != 0) PC + condBranchAddr

Direccion destino (L0)(Donde voy): 0x2000
Program Counter (Donde estoy): 0x2004

Direccion Destino = PC + (Immediato x 4)
Direccion Destino - PC = Immediato x 4
(Direccion Destino - PC)/4 = Immediato

Immediato = 
0x2000 - 0x2004 = 0 - 4 = -4 = -0x4

-4/4 = -1
A binario complemento 2
0001 -> complemento -> 1110 + 1 -< 1111 (restos 1)

Type CB: 
Opcode(8): 10110101
COND_BR_address(19): 111 1111 1111 1111 1111 
Rt(5): 00000

Armado:
1011 0101 1111 1111 1111 1111 1110 0000
=``0xB4FFFFE0``


.org 0x4000
l1: subi x0, x0, #1 
	cbnz x0, l1

subi x0, x0, #1:
R[Rd] = R[Rn] - ALUImm

opcode(10):1101000100
alu_imm(12):000000000001
rn(5):0000
rd(5):0000 

1101 0001 0000 0000 0000 0100 0000 0000
=`0xd1000400`

CBZ X0, L1 
(lo cambie por hacerlo distinto idk):
if (R[Rt] == 0) pc = pc + CondBranchAddr

L1 (Direccion Destino) = 0x4000
PC (Donde estoy) = 0x4004

Calculo de cond_br_addres:
Direccion Destino = PC + (Immediato x 4) 
Direccion Destino - PC = Immediato * 4
(Direccion Destino - PC)/4 = Immediato 
(0x4000 - 0x4004) = -0x4/4 = -1
1 = 0001 (complemento a 2 + 1) = 1111

Direccion Real de salto = 0x4004 + (-0x4 * 4)


O, simplemente decir "la insutrcion está a -1 renglon xD"
opcode(8): 10110100
cond_br_adress(19): 111 1111 1111 1111 1111
rt(5): 00000

1011 0100 1111 1111 1111 1111 1110 0000
=`0xd4ffffe0`

#### **Ejercicio 12: Límites de Formato y Saltos Lejanos (Far Jumps)**

Dadas las siguientes direcciones de memoria: `0x00014000`, `0x00114524`, `0x0F000200`. 
**a)** Si el valor actual del `PC` es `0x00000000`, ¿es posible llegar con una sola instrucción `B.cond` a las direcciones de memoria arriba listadas? Respondé Si/No para cada una justificando matemáticamente en 1 línea. 
**b)** Si el valor del `PC` es `0x00000600`, ¿es posible llegar con **una sola instrucción `B` (incondicional)** a las direcciones arriba listadas? 
c)** Si el `PC` es `0x00000000` y quiero saltar al primer GiB de memoria (`0x40000000`). Escribir **exactamente 2 instrucciones** contiguas en assembly que posibiliten este "far jump".

Para saber si llega, tenemos que primero tener en cuenta que b.cond es de 18 bits (2¹⁸-1 = 262.144 instrucciones). O sea:
0011 1111 1111 1111 1111 = 0x3ffff 

	Con la formula de Destino (max) = PC + (Immediato * 4):

0x3ffff * 4 (bytes) = 0xffffc
Maximo lugar a llegar = 0x0000 0000 + 0x000f fffc = 0x000f fffc 

0x0001 4000: si 
0x0011 4524: no
0x0F00 0200: no

B)
Para el campo de de Branch, sin condicion, sabemos que el opcode es de 6 bits, y el inmediato es 26.
Los limites de saltos de branch sin condicion, es de [-2²⁵, 2²⁵-1)
con 2²⁵-1 = 33554431. O sea, rellenando en bits:
0001 1111 1111 1111 1111 1111 1111 = 0x1fff fff 

Sabemos que la formula de destino es:

Direccion Destino = PC + (Immediato * 4)

Calculemos Immediato * 4:
0x1fff fff * 4 = 0x7fff fffc
Ahora pc + coso
Direccion Destino = 0x0000 0600 + 0x7fff ffc = 0x0800 05fc

0x0001 4000: si 
0x0011 4524: si
0x0F00 0200: no

C)
PC = 0x0000 0000
1GiB = 0x4000 0000
MOVZ x9, #0x4000, LSL #16 // x9 = 0x0000 0000 4000 0000
BR X9

#### **Ejercicio 13: Porcentajes de Uso del Datapath**

Considerando la siguiente distribución de ejecución de instrucciones en un programa X:

- `R-type` (Ej: ADD, SUB): 52%
- `LDUR`: 25%
- `STUR`: 10%
- `CBZ`: 13%

Responder con el número exacto y por qué: **
a)** ¿Qué porcentaje de **todas** las instrucciones utiliza la _Data Memory_ (Memoria de Datos)? ** 
Aquellos que usen memoria. LDUR, STUR (35%)

b)** ¿Qué porcentaje de **todas** las instrucciones utiliza la _Instruction Memory_ (Memoria de Instrucciones)? _(Ojo con las preguntas sutiles).
100%, pues de algun lado tiene q salcar la instruccion xD

_ **c)** ¿Qué porcentaje de **todas** las instrucciones hace uso del bloque _Sign Extend_ (Extensión de Signo)?
CBZ + ldur + stur

#### **Ejercicio 14: Modificación del Hardware (Datapath)**

La unidad de Control original de LEGv8 levanta la señal `Branch = 1` cuando lee un `CBZ`. Si el registro leído es cero, la salida `Zero` de la ALU es `1`. Esas dos señales entran a una compuerta `AND` que finalmente decide si el MUX del PC salta o no.
**Consigna:** Agregando **una sola compuerta lógica** (NOT, AND, OR, XOR) en el diagrama del Datapath & Control original, explicá cómo cambiás la implementación para que la instrucción ejecute un `CBNZ` en lugar de un `CBZ`. ¿Dónde pones el cable y la compuerta?

un not antes del and en la parte de z