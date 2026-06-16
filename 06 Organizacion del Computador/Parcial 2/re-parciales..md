Cosas que me hacen falta "saber":
- Sobre instrucciones, son:
1. Me dan una instruccion, y indicar si modifican memoria, registros o nada.
2. Me dan una instruccion y debo escribir un equivalente a skip (o nada si no tiene)
3. Identificar instrucciones ilegales

- Contar cuantas veces se ejecuta una instruccion, algo del estilo:
`MOVZ X1, #3, LSL #0`
`L0: MOVZ X0, #0, LSL #48 `
`L1: SUBI X0, X0, #1 `
`CBNZ X0, L1`
`SUBI X1, X1, #1 `
`CBNZ X1, L0``

Y contar cuantas veces se ejecuta, subi x1, x1, #1.

- pasar codigo de C a ASM, y ASM a C.
- Armar programas
- Ensamblaje, desamblaje de código 
- Big endian, little endian,
- Cuanto pesa un programa en memoria 
- Instrucciones no documentadas.
- Cosas con datapath 



------------------------------------------------------------------------------------------------------------------------------------------------

📝 Simulacro Intensivo de ODC - Nivel Parcial

#### Ejercicio 1: Efectos y NOPs

Para cada una de las siguientes instrucciones, indicá qué componente arquitectónico modifican (Registro, Memoria, Ambos, o Ninguno). Luego, escribí UNA instrucción equivalente que actúe como un "Skip" (NOP) utilizando el **mismo nemónico**. Si es imposible crear un NOP con ese nemónico, poné una raya (-).

| **Instrucción original** | **Modifica (Reg/Mem/Ambos/Nada)**  | **Equivalente a NOP (Skip)**                                                                                   |
| ------------------------ | ---------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `STURB X5, [X2, #0]`     | Memoria, hace mem[x2, #0] = x5.    | Stur siempre tiene que guardar algo en memoria                                                                 |
| `ADDI X0, X1, #10`       | Registro, agrega hace x1 + 10      | ADDI xzr, xzr, #0 Necesita inmediato en 3r operando                                                            |
| `CBZ X1, loop`           | Registro, si x1 es cero, va a loop | cbz x1, 1 (salto a la siguiente linea)                                                                         |
| `LSL X9, X10, #4`        | Registro,                          | lsl xzr, xzr, #0                                                                                               |
| `LDUR XZR, [X4, #8]`     | Nada, pues xzr es un vacio         | - . No es posible guardar un dato en un registro y que guarde el mismo dato, siempre termina siendo modificado |
|                          |                                    |                                                                                                                |

#### Ejercicio 2: Instrucciones Ilegales

El ensamblador tiró error en las siguientes líneas de código. Explicá en **una sola línea** por qué son ilegales (ya sea por límite de hardware, sintaxis o arquitectura).

- Justificación 1:`LDUR X9, [X10, X11]`
Ldur necesita un campo de # 
- **Justificación:** 2. `ADDI X5, X5, #-14`
Las operaciones aritmeticas inmediatas no aceptar inmediatos negativos
- **Justificación:** 3. `STURH X32, [X1, #0]`
No existe x32

#### Ejercicio 3: Conteo de Ejecuciones (Tracing)
Dado el siguiente fragmento de código en assembly LEGv8:

```
      MOVZ X1, #2, LSL #0          // 0x0000 0000 0000 0002
L0:   ADD X0, XZR, XZR             // x0 = 0
L1:   ADDI X0, X0, #1              // i++
      SUBI X2, X0, #3              // x2 = i - 3
      CBNZ X2, L1                  // NO ES CERO, goto l1
      SUBI X1, X1, #1              // x1-- 
      CBNZ X1, L0                  // x1 == 0? goto l0
      ADD X3, X0, X1               // x3 = x0 + x1 
```

Respondé con el número exacto:
x0 = 0
x0 = 1; <- IMPORTA
x2 = 1 - 3; == -2;
CBNZ != 0, vuelve l1.
Segunda vuelta:
x0 = 1 + 1; <- IMPORTA
x2 = 2 - 3; == -1;
CBNZ != 0, vuelve l1;
Tercera vuelta:
x0 = 2 + 1; <- IMPORTA
x2 = 3-3; == 0;
CBNZ == 0.
-- Pasa del branch -- 
x1 = 2 - 1; == 1;
CBNZ x1 != 0, vuelve l0
x0 = 0;
*hace 3 vueltas de nuevo de las primeras iteraciones*
-- Pasa del branch --
x1 = 1 - 1; == 0;
CBNZ == 0, sigue de largo y termina

a) ¿Cuántas veces se ejecuta la instrucción `ADDI X0, X0, #1` en total?
**6 veces, pues sub cuando no da, vuelve a setear en 0**

b) ¿Cuántas veces se ejecuta la instrucción `SUBI X1, X1, #1` en total?
**2 veces**

c) ¿Qué valor final queda almacenado en `X3` al terminar el programa?
**x3 = 3 + 0, o sea 3**
#### Ejercicio 4: Traducción ASM a C
// Recordame: Deberia de tomarme ejercicios que tengan instrucciones bitwise para yo saber y entender como se traducen bien.

Decompilá el siguiente código assembly a lenguaje C. Asumí que `X0` tiene la variable entera `i`, `X1` tiene la variable entera `j`, y `X2` tiene la dirección base de un arreglo de enteros de 64 bits llamado `A`.

Fragmento de código

```
      SUB X9, X0, X1
      CBZ X9, L1
      LSL X10, X0, #3
      ADD X10, X10, X2
      STUR XZR, [X10, #0]
      B Fin
L1:   ADDI X1, X1, #1
Fin:
```

- **Código en C:**
```
x0 = i, x1 = j, x2 = A[]

if ((i - j) == 0) {
 j++;
} else {
 a[i] = 0; // stur xzr,  [x10, #0] ¿? se que tira lo q tiene guardado a la basura
}
```
#### Ejercicio 5: Ingeniería Inversa y Límites

Un análisis de la memoria RAM muestra las siguientes dos instrucciones de 32 bits codificadas en Hexadecimal.

a) Desensamblá el código a instrucciones LEGv8 legibles:

```
0000: 0, 0001: 1, 0010: 2, 0011: 3, 0100: 4,
0101: 5, 0110: 6, 0111: 7, 1000: 8, 1001: 9,
1010: A, 1011: B, 1100: C, 1101: D, 1110: E, 1111: F
```
- `0x8B020020` $\rightarrow$ **Instrucción:**
1000 1011 0000 0010 0000 0000 0010 0000
Type R.
Opcode(11): 1000 1011 000 (ADD)
Rm(5): 00001
shamt(6):00000
Rn(5):00001
Rd(5):00000
ADD x0, x1, x1

- `0xB4FFFFE1` $\rightarrow$ **Instrucción:**
 1011 0100 1111 1111 1111 1111 1110 0001
 Type CB (Conditional branch)
 Opcode(8): 1011 0100 (CBZ)
 Cond_br_adress(19): 1111 1111 1111 1111 111
 rt (5): 00001
 
CBZ X1, #-1

b) Para las instrucciones tipo `CBZ`/`CBNZ`, ¿cuál es el rango máximo de salto permitido expresado en bytes? (Podés dejar la fórmula matemática expresada con potencias).
Al ser un conditional branch, es segun el campo inmediato de su instruccion, o sea: 19 bits. (0111 1111 1111 1111 1111), o sea 0x0007 ffff * 4 butes = 0x000f fffc su maxima direccion de salto.
Siendo en bytes, [-2¹⁸,2¹⁸-1) * 2², quedando 
[-2²⁰, 2²⁰ - 4) bytes. 
#### Ejercicio 6: Endianness en Memoria


```
0000: 0, 0001: 1, 0010: 2, 0011: 3, 0100: 4,
0101: 5, 0110: 6, 0111: 7, 1000: 8, 1001: 9,
1010: A, 1011: B, 1100: C, 1101: D, 1110: E, 1111: F
```

Acabás de ensamblar a código máquina dos instrucciones consecutivas.
(Ensamblar -> Big endian)
- La primera instrucción dio como resultado: `0x14000005`
0001 0100 0000 0000 0000 0000 0000 0101
Type B: (Branch)
Opcode (6): 0001 01 
BR_adress: 00 0000 0000 0000 0000 0000 0101

B 5 (No puedo calcular el "donde estoy"(PC) pues no me lo dan, pero intuyo que por el 0101 solo salta 5 lineas adelantes. )

- La segunda instrucción dio como resultado: `0x8B010002`
1000 1011 0000 0001 0000 0000 0000 0010
Opcode(11): 1000 1011 000
Rm(5):00001
shamt(6):000000
Rn(5):00000
Rd(5):00010
ADD x2, x0, x1


Sabiendo que la arquitectura LEGv8 utiliza **Little Endian**, volcá exactamente cómo quedarían guardados los bytes en la memoria RAM, rellenando la siguiente tabla:

| **Dirección** | **Byte (Hexa)** |
| ------------- | --------------- |
| `0x3000`      | `0x05`          |
| `0x3001`      | `0x00`          |
| `0x3002`      | `0x00`          |
| `0x3003`      | `0x14`          |
| `0x3004`      | `0x02`          |
| `0x3005`      | `0x00`          |
| `0x3006`      | `0x01`          |
| `0x3007`      | `0x8b`          |

#### Ejercicio 7: Señales de Control (Datapath)

Completá la tabla de señales de control de la unidad principal para la instrucción `LDUR` (Load Register). Usa 0, 1 o X (Don't care).
LDUR: R[Rt] = M[R[Rn]+ DTAddr]
LDUR type D:
OPcode-DT_address-op-rn-rt

| **Señal**    | **Valor** |
| ------------ | --------- |
| **Reg2Loc**  | X         |
| **ALUSrc**   | 1         |
| **MemToReg** | 1         |
| **RegWrite** | 1         |
| **MemRead**  | 1         |
| **MemWrite** | 0         |
| **Branch**   | 0         |

#### Ejercicio 8: Porcentajes de Uso y Far Jumps

a) Si un programa tiene la siguiente distribución de instrucciones:

- `R-type` (Ej: ADD, SUB): 45%
    
- `LDUR`: 20%
    
- `STUR`: 15%
    
- `CBZ`/`B`: 20%
    

¿Qué porcentaje total de las instrucciones en este programa hace un uso activo del sumador (ADD) que está dedicado exclusivamente a sumar `PC + 4`? Justificá en una línea.
El calculo de PC se usa el 100% de las veces.

b) Estás en la instrucción ubicada en el PC `0x00000000` y querés saltar de manera incondicional a la dirección `0x80000000` (El segundo GiB de memoria). Escribí la/s instrucción/es necesarias en assembly para lograr este "Far Jump".

movz x9, #0x8000, lsl #16 
BR x9

---------------------------------------
----------------

Parcial 2 2024-06-12 DONE "modelo" 2026

Ejercicio 1 Escribe un skip, UNA instrucción que no hace nada, con cada nemónico. Si no se puede, poner raya. 

| Instruccion | SKIP              | Just                                                          | INSTRUCCION | SKIP              | just                                                                   |
| ----------- | ----------------- | ------------------------------------------------------------- | ----------- | ----------------- | ---------------------------------------------------------------------- |
| ADDI        | ADDI XZR, XZR, #0 | XZR es un vacio aritmetico                                    | LDURH       | -                 | Daria segmentation fault                                               |
| ADDS        | -                 | Siempre seteará flags                                         | LSL         | Lsl xzr, xzr, #0  | Aritmetica en el vacio                                                 |
| ANDI        | ANDI xzr, x0, #0  | si hago AND con las 2 mismas cosas, da lo mismo               | MOVK        | -                 | Siempre modificaria una pos hexa, a no ser que ser el destino  xzr (?) |
| ANDS        | -                 | Siempre seteara flag                                          | ORR         | ORR xzr, xzr, xzr | nada con nada digmaos                                                  |
| B.COND      | B.cond 1          | Salta secuencinalmente a la otra                              | STUR        | -                 | Siempre modificamos la memoria por mas q queramos guardar algo inutil  |
| BR          | -                 | No hay registro q te mande a la sig linea o calculada digamos | STURH       | -                 | mismo                                                                  |
| CBZ         | CBZ xzr, 1        | Salta secuencialmente a la siguiente linea                    | SUB         | sub xzr, xzr, xzr | Aritmetica en la nada                                                  |
| EORI        | EORI xzr, x0, #0  | Compara el mismo registro con nada, obtiene el mismo valor    | SUBIS       | -                 | Setearia flags                                                         |
|             |                   |                                                               |             |                   |                                                                        |
|             |                   |                                                               |             |                   |                                                                        |

Ejercicio 2 a) Se aplica una técnica de loop unrolling en un programa para que duplique los elementos de un arreglo, enteros de 64 bits.

| ProgIzq                                                                                                                                                                                   | ProgDer                                                                                                                                                                                                                                                  |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ADD X0,XZR,XZR <br>ADDI X1,XZR,#0x32 <br>ADD X2,XZR,XZR <br>L1: LDUR X8,[X0,#0x50] <br>ADD X8,X8,X8 <br>STUR X8,[X0,#0x50] <br>ADDI X0,X0,#0x8 <br>SUBI X1,X1,#0x1 <br>CBNZ X1,L1 <br>RET | ADD X0,XZR,XZR <br>ADDI X1,XZR,#0x32 <br>ADD X2,XZR,XZR <br>L1: LDUR X8,[X0,#0x50] <br>ADD X8,X8,X8 <br>STUR X8,[X0,#0x50] <br>LDUR X8,[X0,#0x58] <br>ADD X8,X8,X8 <br>STUR X8,[X0,#0x58] <br>ADDI X0,X0,0x10 <br>SUBI X1,X1,#0x2 <br>CBNZ X1,L1 <br>RET |
|                                                                                                                                                                                           |                                                                                                                                                                                                                                                          |

|         | Ocupacion en memoria | Instrucciones Ejecutadas |
| ------- | -------------------- | ------------------------ |
| ProgIzq | (9+1*4)Bytes         | 3+6n+1                   |
| ProgDer | (12+1*4)Bytes        | 3+9n+1                   |
|         |                      |                          |

b) Este es un fragmento de ProgIzq. Escribe 2 permutaciones equivalentes y 2 no equivalentes. Hay 5!=125 permutaciones posibles pero no todas hacen lo mismo que el código original.


|                                                                                                    | Equiv1                                                                                                     | Equiv2                                                                                                 | NoEquiv1                                                                                           | NoEquiv2                                                                                              |
| -------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| LDUR X8,[X0,#0x50] <br>ADD X8,X8,X8 <br>STUR X8,[X0,#0x50] <br>ADDI X0,X0,#0x8 <br>SUBI X1,X1,#0x1 | ADDI X0,X0,#0x8 <br>LDUR X8,[X0,#0x50] <br>ADD X8,X8,X8 <br>STUR X8,[X0,#0x50] <br>SUBI X1,X1,#0x1<br><br> | SUBI X1,X1,#0x1<br>LDUR X8,[X0,#0x50] <br>ADD X8,X8,X8 <br>STUR X8,[X0,#0x50] <br>ADDI X0,X0,#0x8 <br> | LDUR X8,[X0,#0x50] <br>STUR X8,[X0,#0x50] <br>ADD X8,X8,X8 <br>ADDI X0,X0,#0x8 <br>SUBI X1,X1,#0x1 | LDUR X8,[X0,#0x50] <br>ADD X8,X8,X8 <br><br>ADDI X0,X0,#0x8 <br>SUBI X1,X1,#0x1<br>STUR X8,[X0,#0x50] |
|                                                                                                    |                                                                                                            |                                                                                                        |                                                                                                    |                                                                                                       |

Ejercicio 4 Desensamblar el programa que se volcó directamente desde la memoria RAM, byte a byte. 
08 00 45 F8 
08 01 08 8B 
08 00 05 F8 
00 20 00 91 
21 04 00 D1
```
0000: 0, 0001: 1, 0010: 2, 0011: 3, 0100: 4,
0101: 5, 0110: 6, 0111: 7, 1000: 8, 1001: 9,
1010: A, 1011: B, 1100: C, 1101: D, 1110: E, 1111: F
```
(LE)
0xf8450008
1111 1000 0100 0101 0000 0000 0000 1000
Opcode(11): 1111 1000 010 (LDUR, Type D)
DT_address(9):0010 1000 0
op(2):00
Rn(5):00000
Rt(5):01000
LDUR x8, [x0, #80]

0x8b080108
1000 1011 0000 1000 0000 0001 0000 1000
Opcode(11): 1000 1011 000 (ADD, Type R)
Rm(5):01000
Shamt(6):0000 00
Rn(5):01000
Rd(5):01000
ADD x8, x8, x8

0xf8050008
1111 1000 0000 0101 0000 0000 0000 1000
Opcode(11): 1111 1000 000 (STUR, Type D)
DT_address(9):0010 1000 0
op(2):00
Rn(5):00000
Rt(5):01000
STUR x8, [x0, #80]

0x91002000
1001 0001 0000 0000 0010 0000 0000 0000
Opcode(10): 1001 0001 00 (ADDI, Type I)
ALU_immediate(12): 0000 0000 1000 
Rn(5):00000
Rd(5):00000
ADDI X0, X0, #8 

0xD1000421
1101 0001 0000 0000 0000 0100 0010 0001
Opcode(10): 1101 0001 00 (SUBI, Type I)
ALU_immediate(12):0000 0000 0001
Rn(5):00001
Rd(5):00001
SUBI x1, x1, #1 

// estaria bueno practicarlo con branches

## Ejercicio 5 
Ensamblar estos dos programas:

```
0000: 0, 0001: 1, 0010: 2, 0011: 3, 0100: 4,
0101: 5, 0110: 6, 0111: 7, 1000: 8, 1001: 9,
1010: A, 1011: B, 1100: C, 1101: D, 1110: E, 1111: F
```

|      | Ensamblador                                       | Codigo máquina                           |
| ---- | ------------------------------------------------- | ---------------------------------------- |
| DL1: | .org 0x2000<br>L0: SUBI X0, X0, #1<br>CBNZ X0, L0 | # Ensambla en 0x2000<br>0xD1000400<br>0x |
| DL2: | .org 0x4000<br>L1: SUBI X0, X0, #1<br>CBNZ X0, L1 | # Ensambla en 0x4000<br>0x<br>0x         |
L0: SUBI X0, X0, #1
Opcode(10): 1101000100
Aluimmediate(12):0000 0000 0001
Rn(5):00000
Rd(5):00000

1101 0001 0000 0000 0000 0100 0000 0000
0xD1000400

CBNZ x0, l0
Opcode(8): 10110101
COND_BR_address(19):
Retrocede 1 linea (-1).
0000 0000 0000 0000 001
Complemento a 2:
1111 1111 1111 1111 110
Sumo 1(para -):
1111 1111 1111 1111 111

Si retrocediece muchas lineas, deberia de usar la formula de :
Direccion destino = PC + (imm * 4)
Quedando  (Pues, estoy ensamblando):
Imm = (Dirección Destino - PC) / 4
ponele q l0 esta en 0x2000 y estoy en 0x2004
(0x2000 - 0x2004)/4 = -4 / 4 = -1 

1011 0101 1111 1111 1111 1111 1110 0000
0xB5FFFFE0

org 0x4000
L1: SUBI X0, X0, #1
CBNZ X0, L1
lit es lo mismo xD 

Ejercicio 6 Dada la compilación con la siguiente relación entre variables y registros: ● x ↔ X0 ● score ↔ X1 ● speedx ↔ X2

![[Pasted image 20260615132705.png]]Explicar en una línea si la compilación es correcta o no y por qué.![[Pasted image 20260615132940.png]]
No esta haciendo -speedx, solo hace un -1, sumo un 1 (quedando en 0)-

![[Pasted image 20260615134136.png]]

Ejercicio 8 Un opcode genera una instrucción no documentada que hace que Control tome estos valores 
Reg2Loc ALUSrc MemtoReg RegWrite MemRead MemWrite Branch ALU ADD 
0 0 1 1 1 0 0  
Describir qué operación realiza: ______________________________________________________
Memoria a registro
Escribe en registro 
Lee memoria
Add
Realiza una suma entre registros, para leer lo que se guardo en memoria en ese registro para luego colocarlo en otro registro
Invente su nemónico: 
AMR (Alu Operation In Memory To Register)

---------------------------------------
Parcial 2 2024-06-19 DONE

| Instruccion              | Si/NO | Just                                                |
| ------------------------ | ----- | --------------------------------------------------- |
| LDUR X0, [X9, XZR]       | NO    | LDUR necesita inmediato en el tercer campo          |
| EORI XZR, X1, #65500     | NO    | No es posible hacer XOR con un inmediato tan grande |
| ORRS XZR, XZR, XZR       | si    | Simplemente skip seteando flags                     |
| SUBI X1, X30, #-1        | No    | En aritmetica inmediata no permite negativos        |
| Br X0                    | Si    | x0 es un registro, BR (Branch Register)             |
| MOVK XZR, #Fa110, lsl #0 | No    | FA110 es de 5 bytes y no 4                          |
2)Escribir un programa en LEGv8 que dado un número en float32 en X0 produce un número TensorFloat32 también en X0. La representación de TensorFloat32 se basa en truncar float32 para pasar de una mantisa de 23 bits a una de 10 bits.


X0 = número grande con mantisa de 32 bits.
Debo de usar. 
```
LSR x0, x0, #13 // desplazo a derecha los bits para borrar
LSL x0, x0, #13 // desplazo nuevamente a la izq para conservar valores 
```

3) Para estas instrucciones con operandos inmediatos, dar el intervalo en bytes. Puede expresarse de la forma (2^k)-j. El paso es el incremento mínimo entre un valor y el siguiente y puede ser 1, 2, 4 u 8.

|        | RANGO OP IMM             | PASO |
| ------ | ------------------------ | ---- |
| LDURB  | [-2⁸⁻¹,2⁸⁻¹-1)           | 1    |
| ADDI   | [0,2¹²-1)                | 1    |
| B      | [-2²⁵ * 2², 2²⁵ * 2² -1) | 4    |
| B.COND | [-2¹⁸ * 2², 2¹⁸ * 2²-1)  | 4    |
| CBNZ   | [-2¹⁸ * 2², 2¹⁸ * 2²-1)  | 4    |
| MOVK   | (0,2¹⁶-1)                | 1    |
LDURB, type D:
Opcode(11):
Op(2):
DT_Address(9):
Rn(5):
Rt(5):

ADDI, type I:
opcode(10):
ALU_immediate(12):
Rn(5):
Rt(5):

MOVK, type IM:
opcode(9):
LSL(2):
Imm(16):
Rd(5)

Entendamos que los campos de inmediato funcionan asi:
Si acepta negativos, es un numero signado y por el signo, se le resta 1 al exponente.
Si NO es signado, 2^imm toma su immediato normal y no acepta 0.
Según su salto, es a cuanto se le tiene q multiplicar su campo (si sus saltos son de a 4, a su inmediato (segun signo) se le multiplica 2²)

4)

| Entrada | Entrada |     |
| ------- | ------- | --- |
| X0      | X1      | X0  |
| 15      | 5       | 5   |
| 14      | 7       | 7   |
| 21      | 14      | 7   |
|         |         |     |
x0 = 15, x1 = 5,
no se cumple nada
x0 = 15 - 5, goto l8

x0 = 10, x1 = 5,
no cumple
x0 = 10 - 5, goto l8

x0 = 5, x1 = 5, cumple
b.eq l1 (goto ret)


---
x0 = 14, x1 = 7,
x0 = 14 - 7
no cumple
x0 = 7, x1 = 7
cumple, goto l1.

---
x0 = 21, x1 = 14
no cumple
x0 = 21 - 14;

x0 = 7, x1 = 14;
cumple ls, goto l3
x1 = 14 - 7;
goto l8
cumple b.eq l1
ret

b) Decompilar el assembly a “C”

```
int i = x0;
int j = x1;
while (i != j) {
	if (i < j ) { // se que dice b.LS (<=) pero tiene dpss un == y no entraria mas
	 j -= i;
	} else if (i > j) {
	 i -= j;
	} 
}


// El programa iguala los inputs
```

5) Dada una implementación incompleta de la ISA LEGv8
![[Pasted image 20260615152526.png]]a) Supongo que Control tiene una salida más que indica CBZ(1)/CBNZ(0), agregar lógica, cortar cables / agregar cables de forma tal que acepte los dos tipos de salto.

- Cortar el cable que sale de la flag `Zero` de la ALU.
    
- Poner un MUX de 2 a 1.
    
- Al puerto `1` del MUX, conectás el cable `Zero` directo (para cuando la instrucción sea CBZ).
    
- Al puerto `0` del MUX, le conectás el cable `Zero` pasándolo previamente por una compuerta **NOT** (para cuando sea CBNZ).
    
- El selector de este MUX es la nueva señal de Control `CBZ/CBNZ`.
    
- La salida del MUX va a la compuerta AND del Branch.

b) Indique cómo deberían estar el resto de las señales para estas instrucciones.

| REG2LOC | ALUSRC | MEMTOREG | REGWRITE | MEMREAD | MEMWRITE | BRANCH | ALU |
| ------- | ------ | -------- | -------- | ------- | -------- | ------ | --- |
| 1       | 0      | 0        | 0        | 0       | 0        | 1      | 01  |
|         |        |          |          |         |          |        |     |


---
Parcial 2026 "Abstraction Breaker".

1)decir si modifica un registro y/o memoria o nada.

Al pc y los flags no se les considera reigstros. NO puede hacer ninguna suposicion acerca del contenido de los registros ni de la memoria

ADD X0, X0, X0 modifica registro
ADDIS x0, x0, #0 Es "skip", setea flags.
AND x31, x31, x31 Es skip, "Y esta con con Y esta cosa, es Y"
ANDIS X0, X0, #0XFFF Modifica un registro
B 0 NO modifica nada
Bl 1 Modifica un registro
CBNZ x31, -1 no modifica nada
EOR x8, x8, x8 modifica un registro
LDUR x31, [x0, #16] No modifica nada, x31 es XZR
LDURB x0, [x0, #0] Modifica un registro, hace valor = a[i]
LSR x30, x30, #63 Registro
Movz x0, #0, lsl, 0 Modifica un registro
ORRI x7, x7, 0 skip, no modifica nada
STURB x30, [x30, #8] Modifica memoria
STURW x30, [x30, #16] Modifica memoria
SUBI x1, x2, xzr No modifica nada, subi necesita un inmediato
SUB x2, x2, xzr es skip


2) Indicar exactmanete cuantas veces se ejectua la instruccion subi x0, x0, #1

```
	MOVZ X1, #3, LSL #0       // x1 = 0x0000 0000 0000 0003
L0: MOVZ X0, #0, LSL #48      // x0 = 0x0000 0000 0000 0000
L1: SUBI X0, X0, #1           // x0 = x0 -1
	CBNZ X0, L1
	SUBI, X1, X1, #1
	CBNZ X1, L0
```

Sabemos que el registro x1 es literalmente 3, por lo tanto el SUBI X1, X1, #1 Se ejecutara si o si 3 veces. 
Luego, como tenemos:
0x0000 0000 0000 0000
pero antes, de ver branch, restamos 1 (A traves del subI a observar)
Como el CBNZ hace q volvamos a subi,  pero tenemos un subi, nuestro registro antes del primer CBNZ hace:

```
L0: MOVZ X0, #0, LSL #48      // x0 = 0x0000 0000 0000 0000
L1: SUBI X0, X0, #1           // x0 = 0xFFFF FFFF FFFF FFFF 
```
ese 0xfff tiene q ir hasta 0, entonces este itera 2⁶⁴-1 veces
(el calculo es valorDigito * 16^pos)

Entonces tenemos que esta instruccion sola

```
L1: SUBI X0, X0, #1           // x0 = 0xFFFF FFFF FFFF FFFF 
```
Itera 2⁶⁴-1 veces.
pero hay que tener en cuenta el bucle externo.

```
	MOVZ X1, #3, LSL #0       // x1 = 0x0000 0000 0000 0003
	
L0: MOVZ X0, #0, LSL #48      // x0 = 0x0000 0000 0000 0000
L1: SUBI X0, X0, #1           // x0 = x0 -1
	CBNZ X0, L1
	
	SUBI, X1, X1, #1
	CBNZ X1, L0

```

Demos el hipotetico caso, que x0 puede terminar siendo 
x0 = 0x0000 0000 0000 0000 ,
aun queda subi x1, x1 #1 que resta -1 a x1, o sea

0x0000 0000 0000 0000 0003 -1 y esto lo tiene que hacer 3 veces. 
Estas 3 veces, tiene que hacerse de nuevo el bloque anteriormente mencionado.

Tenemos que:
2⁶⁴-1 veces de  iteracion de subi x0 y cbnz x0 
1 instruccion externa, pero no importa
subi x1, cbnz x1 reinicia el subi digamos
Nos queda en total, las veces que ejecutra subi1 x0, x0, #1 

((2⁶⁴) * 3)

3) El siguiente programa en assembler LEGV8 pone a 0 la memoria en el rango [0x0000, 0x1000)
```
	.ORG 0Xc0c0 // esto solo indica en que instruccion estoy
	MOVZ X0, #0X1000, LSL #0 
L: SUBI X0, X0, #1 
	STURB XZR, [X0, #0]
	CBNZ X0, L
```

a) indicar cuantas instrucciones ejecuta en total, dejar el valor expresado como sumas, multiplicaciones y/p potencias.

3n + 1 Instrucciones

b) Escribir una version modificada que ocupe la misma cantidad en memoria, pero que ejecute 2, 4 u 8 veces menos instrucciones 

```
	MOVZ X0, #0X1000, LSL #0 
L: SUBI X0, X0, #8 
	STUR XZR, [X0, #0]
	CBNZ X0, L
```


### Ejercicio 4: Desensamblado a medida

La siguiente secuencia de bytes es código máquina LEGv8 volcado desde la memoria RAM. Desensamblar el programa completo a código Assembly, detallando el Opcode, el Formato de Instrucción y el valor de cada campo.

Plaintext

```
29 00 42 F8 // LE: 0xf8420029

2A 01 02 8B // LE: 0X8B02012A

21 08 00 D1 // LE: 0XD1000821

DA FF FF B5 // LE: 0XB5FFFFDA
```

```
0000: 0, 0001: 1, 0010: 2, 0011: 3, 0100: 4,
0101: 5, 0110: 6, 0111: 7, 1000: 8, 1001: 9,
1010: A, 1011: B, 1100: C, 1101: D, 1110: E, 1111: F
```

// LE: 0xf8420029
1111 1000 0100 0010 0000 0000 0010 1001

Opcode(11): 1111 1000 010 (LDUR) TYPE D
DT_address(9):000 1000 00
op(2):00
Rn(5):00001
Rt(5):01001
LDUR R[RT] = M[R[Rn] + DTAddr]

LDUR x9, [x1, #32]

// LE: 0X8B02012A
**1000 1011 000**0 0010** **0000 00**01 001**0 1010**
Opcode(11): 1000 1011 000 (ADD) type r
rm(5): 00010
shamt(6):0000 00
Rn(5):01001
Rd(5):01010

ADD R[Rd] = R[Rn] + R[Rm]
ADD x10, x9, x2

// LE: 0XD1000821
**1101 0001 00**00 0000 0000 1**000 00**1**0 0001**
Opcode(10): 1101 0001 00 (SUBI) type i
ALU_immediate(12):0000 0000 0010
Rn(5):00001
Rd(5):00001
SUBI x1, x1, #2

// LE: 0XB5FFFFDA
**1011 0101** **1111 1111 1111 1111 110**1 1010**
Opcode(8): 1011 0101
COND_BR_address(19): 1111 1111 1111 1111 110
Rt(5):11010

CBNZ x26, -2

ejercicio 5 pasar de ASM a C entre variables y registros:
```
	CBNZ X0, ELSE
	SUBI X8, XZR, #1 // hago x8 = -1
	EOR X1, X1, X8 // dx = d1 ^ x8
	ADDI X1, X1, #1  // dx ++;
	B EXIT
ELSE: ADD X0, X0, X1
EXIT:
```

x=x0, dx=x1

```
if (x == 0) {
	dx = -dx;
	dx++;
} else {
	x = x + dx;
}
```

![[Pasted image 20260616104559.png]]

Ej 7) Un opcode genera una instruiccion no docuemtnada que hace que Control tome estos valores

| REG2LOC | ALUSRC | MEMTOREG | REGWRITE | MEMREAD | MEMWRITE | BRANCH | ALU    |
| ------- | ------ | -------- | -------- | ------- | -------- | ------ | ------ |
| 1       | 0      | 1        | 1        | 1       | 0        | 1      | PASS B |

Sepas que las señales hacen:

Reg2loc: Selecciona las instruciones [4-0] para leer ese registro
Regwrite: escribe en un registro.
Memread: lee un dato de la memoria, como un LDUR
Branch hace un salto de un lugar a otro (B.cond, CBNZ, BL, BR, etc)
ALU PASS B: hace un branch

Que operacion realiza (inventada):
Escribe en un registro, la posicion en memoria y checkea sio tiene que hacer un salto condicional
