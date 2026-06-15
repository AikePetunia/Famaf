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
