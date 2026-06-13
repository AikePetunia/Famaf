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

| **Instrucción original** | **Modifica (Reg/Mem/Ambos/Nada)**  | **Equivalente a NOP (Skip)**       |
| ------------------------ | ---------------------------------- | ---------------------------------- |
| `STURB X5, [X2, #0]`     | Memoria, hace mem[x2, #0] = x5.    | STUR xzr, [xzr, #0]                |
| `ADDI X0, X1, #10`       | Registro, agrega hace x1 + 10      | ADDI xzr, xzr, xzr                 |
| `CBZ X1, loop`           | Registro, si x1 es cero, va a loop | cbz x1, 0 (salto a la misma linea) |
| `LSL X9, X10, #4`        | Registro, x10 + 2⁴                 | lsl xzr, xzr, #0                   |
| `LDUR XZR, [X4, #8]`     | Nada, pues xzr es un vacio         | ldur xzr, [xzr, ]                  |

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
L0:   ADD X0, XZR, XZR             // esto es skip
L1:   ADDI X0, X0, #1              // i++
      SUBI X2, X0, #3              // x2 = i - 3
      CBNZ X2, L1                  // ¿x2 == 0? goto l1
      SUBI X1, X1, #1              // x1-- 
      CBNZ X1, L0                  // x1 == 0? goto l0
      ADD X3, X0, X1               // x3 = x0 + x1 
```

Respondé con el número exacto:

a) ¿Cuántas veces se ejecuta la instrucción `ADDI X0, X0, #1` en total?


b) ¿Cuántas veces se ejecuta la instrucción `SUBI X1, X1, #1` en total?

c) ¿Qué valor final queda almacenado en `X3` al terminar el programa?

#### Ejercicio 4: Traducción ASM a C

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
    

#### Ejercicio 5: Ingeniería Inversa y Límites

Un análisis de la memoria RAM muestra las siguientes dos instrucciones de 32 bits codificadas en Hexadecimal.

a) Desensamblá el código a instrucciones LEGv8 legibles:

- `0x8B020020` $\rightarrow$ **Instrucción:**
    
- `0xB4FFFFE1` $\rightarrow$ **Instrucción:**
    

b) Para las instrucciones tipo `CBZ`/`CBNZ`, ¿cuál es el rango máximo de salto permitido expresado en bytes? (Podés dejar la fórmula matemática expresada con potencias).

#### Ejercicio 6: Endianness en Memoria

Acabás de ensamblar a código máquina dos instrucciones consecutivas.

- La primera instrucción dio como resultado: `0x14000005`
    
- La segunda instrucción dio como resultado: `0x8B010002`
    

Sabiendo que la arquitectura LEGv8 utiliza **Little Endian**, volcá exactamente cómo quedarían guardados los bytes en la memoria RAM, rellenando la siguiente tabla:

|**Dirección**|**Byte (Hexa)**|
|---|---|
|`0x3000`|`0x`|
|`0x3001`|`0x`|
|`0x3002`|`0x`|
|`0x3003`|`0x`|
|`0x3004`|`0x`|
|`0x3005`|`0x`|
|`0x3006`|`0x`|
|`0x3007`|`0x`|

#### Ejercicio 7: Señales de Control (Datapath)

Completá la tabla de señales de control de la unidad principal para la instrucción `LDUR` (Load Register). Usa 0, 1 o X (Don't care).

|**Señal**|**Valor**|
|---|---|
|**Reg2Loc**||
|**ALUSrc**||
|**MemToReg**||
|**RegWrite**||
|**MemRead**||
|**MemWrite**||
|**Branch**||

#### Ejercicio 8: Porcentajes de Uso y Far Jumps

a) Si un programa tiene la siguiente distribución de instrucciones:

- `R-type` (Ej: ADD, SUB): 45%
    
- `LDUR`: 20%
    
- `STUR`: 15%
    
- `CBZ`/`B`: 20%
    

¿Qué porcentaje total de las instrucciones en este programa hace un uso activo del sumador (ADD) que está dedicado exclusivamente a sumar `PC + 4`? Justificá en una línea.

b) Estás en la instrucción ubicada en el PC `0x00000000` y querés saltar de manera incondicional a la dirección `0x80000000` (El segundo GiB de memoria). Escribí la/s instrucción/es necesarias en assembly para lograr este "Far Jump".

