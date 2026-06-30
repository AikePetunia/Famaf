1) (2 Puntos) a) Expresar el número 127,125 en binario mediante el formato IEEE754. b) Mostrar el contenido de los distintos campos del formato en binario. ¿Cuál es el número expresable en el formato IEEE754 inmediatamente mayor a 127,125?; ¿Cuál es el número en el formato IEEE754 inmediatamente menor a 127,125?

127,125 en binario: 1111111,001

Normalizacion: 1,1111 1100 1
1,111111001×2⁶

El numero es uno positivio, teniendo:

(-1)⁰ * (1 + 111111001) * 2^6+127

(-1)⁰ * (1 + 1111 1100 1000 0000 0000 000) * 2^133

Con los campos en binario

0    10000101  11111100100000000000000
BS      EXP           FRACCION

Si es el inmediatamente mayor:
0    10000101  11111100100000000000001
BS      EXP           FRACCION

Si es el inmediatamente menor:
0    10000101  11111100011111111111111
BS      EXP           FRACCION

2) Diseñar un circuito combinacional que reciba como entradas dos números de 2 bits en formato de complemento a 2, y produzca como salida la resta de ambos números. El circuito débe indicar también el acarreo de salida y el overflow. El circuito debe implementarse con compuertas de cualquier tipo y numero.

Sabemos que para conocer el rango de complemento 2 es [-2^n, 2^n -1].
Si tenemos 2 bits, es N = 2, dandonos un rango de:
[-2^2, 2^2-1], teniendo:[-2, -1, 0, 1]
O sea:

- `00` = 0
- `01` = 1
- `10` = -2 
- `11` = -1

Sabemos que la resta en binario es:
A - B = A + (- B).
Para la suma, usamos un OR (+)

Tabla de a y b:
Sabemos que A seria a0 + a1 (DECIMALMENTE) sabiendo que el rango es 
Sabemos que B seria b0 + b1 (DECIMALMENTE) sabiendo que el rango es
[-2^n, 2^n -1]

| **A1 A0**            | **(Dec) A (a0 + a1)** | **B1 B0** | **(Dec) B (b0 + b1)** | NOT B | OPERACION<br>(a +(-b)) | CARRY |
| -------------------- | --------------------- | --------- | --------------------- | ----- | ---------------------- | ----- |
| 00                   | 0                     | 00        | 0                     | 00    | 000                    | 0     |
| 00                   | 0                     | 01        | 1                     | 11    | 011                    | 0     |
| 00                   | 0                     | 10        | -2                    | 10    | 010                    | 0     |
| 00                   | 0                     | 11        | -1                    | 00    | 000                    | 0     |
| 01                   | 1                     | 00        | 0                     | 00    | 001                    | 0     |
| 01                   | 1                     | 01        | 1                     | 11    | 100                    | 1     |
| 01                   | 1                     | 10        | -2                    | 10    | 011                    | 0     |
| 01                   | 1                     | 11        | -1                    | 00    | 001                    | 0     |
| 10                   | -2                    | 00        | 0                     | 00    | 010                    | 0     |
| 10                   | -2                    | 01        | 1                     | 11    | 101                    | 1     |
| 10                   | -2                    | 10        | -2                    | 10    | 100                    | 1     |
| 10                   | -2                    | 11        | -1                    | 00    | 010                    | 0     |
| 11                   | -1                    | 00        | 0                     | 00    | 011                    | 0     |
| 11                   | -1                    | 01        | 1                     | 11    | 110                    | 1     |
| 11                   | -1                    | 10        | -2                    | 10    | 101                    | 1     |
| 11                   | -1                    | 11        | -1                    | 01    | 100                    | 1     |
| OPERACION<br>DECIMAL | RES<br>[-2^n, 2^n -1] | V         | s0                    | s1    |                        |       |
| 0+-0                 | 0                     | 0         | 0                     | 0     |                        |       |
| 0+-1                 | 0                     | 0         | 1                     | 1     |                        |       |
| 0+--2                | 2                     | 1         | 1                     | 0     |                        |       |
| 0+--1                | 1                     | 0         | 0                     | 0     |                        |       |
| 1+-0                 | 1                     | 0         | 0                     | 1     |                        |       |
| 1+-1                 | 0                     | 0         | 0                     | 0     |                        |       |
| 1+--2                | 3                     | 1         | 1                     | 1     |                        |       |
| 1+--1                | 2                     | 1         | 0                     | 1     |                        |       |
| -2+-0                | -2                    | 0         | 1                     | 0     |                        |       |
| -2+-1                | -3                    | 1         | 0                     | 1     |                        |       |
| -2+--2               | 0                     | 0         | 0                     | 0     |                        |       |
| -2+--1               | -1                    | 0         | 1                     | 0     |                        |       |
| -1+-0                | -1                    | 0         | 1                     | 1     |                        |       |
| -1+-1                | -2                    | 0         | 1                     | 0     |                        |       |
| -1+--2               | 1                     | 0         | 0                     | 1     |                        |       |
| -1+--1               | 0                     | 0         | 0                     | 1     |                        |       |
![[Pasted image 20260629095933.png]]
NOTA: es posible optimizarlo, pero no lo pide XD, la unica manera de optimizarlo es re-usando and's (si hay miniterminos repetidos en un Or)

3) Diseñar y esquematizar un banco de memoria, (memorias mas circuito de mapeo) para un procesador de 32 bits de bus de datos y 24 bits de bus de direcciones con 16 kbytes de ROM en las direcciones más altas y 128 kbytes de RAM en las direcciones más bajas. El sistema no puede tener posiciones espejo. Las memorias deben ser del mayor tamaño posible en cada caso, pero con un bus de datos de 16 bits.

- Procesador de 32 bits de bus de datos (D[0..31]), pero
- Bus de datos como mucho, de 16 bits.
- 24 bits de bus de direcciones (A[0..23])
- 16kbytes de rom 
- 128kbytes de ram.
- No posicion espejo.

**Direcciones más altas:** Son las que tienen los bits más significativos ($A_{23}, A_{22}, A_{21} \dots$) valiendo **1**. Están "al final" del mapa de memoria (cerca de `0xFFFFFF`).
**Direcciones más bajas:** Son las que tienen los bits más significativos valiendo **0**. Están "al principio" del mapa de memoria (cerca de `0x000000`).


Con esto, se lee:

- Necesito una conexion en paralelo para lograr los D[0..31], puesto que tengo chips de 16 bits. 

**Tenemos un bus de 32 bits, que lee 4 bytes por labara (8bits = 1 byte)
Demas decir, que no tenes que pasarnos de la capacidad de el chip especificado, si tengo 16kbytes en total, no pasarse.**

Para los chips ROM (16kbytes en total):

- Como tengo que lograr 32 bits de datos, pero puedo usar chips de hasta 16 bits.
- Si cada palabra del procesador ocupa 4 bytes, entonces la ROM tiene:
  16 * 1024 = $16.384 / 4 = 4.096$ palabras ($4K$ palabras).
- Cada palabra del procesador, ocupa 4 bytes (32/8 = 4).
- Para obtener un chip de 16kbytes x 32 bits, necesito:
```
4kbytes x 16 bits + 4kbytes x 16 bits. = 4k x 32 bits = 16kbytes.
Los bits se suman, no las palabras.
Necesito 2 chips de 4kbytes 
```

- Como se trata de un bloque de 4kBytes, tenemos: 2¹² = 4096/1024 = 4k. 
(Cada chip necesitaría que le entre A[0..11])

Para los chips RAM (128kbytes en total):

- Tengo que lograr 32 bits, a partir de 16 bits (Conexion en paralelo)
- Cada palabra del procesador ocupa 4 bytes (32/8 = 4)
- Tengo 128kbytes que llegar, que es:
```
128 * 1024 = 131072/4 = 32768/1024 = 32k palabras
```
- Como tengo que llegar a los 128Kbytes que llegar, de 32 bits
```
tengo: 32k x 16 bits. Los bits se suman, no las palabras.
32k x 16bits + 32k x 16 bits = 32k x 32 bits = 128kbytes 
Necesito 2 chips de 32k x 16 bits
```
- Como se trata de un bloque de 128kBytes, tenemos: 2¹⁵ = 32768/1024 = 32k. (Cada chip necesitaría que le entre A[0..14])

Diseño:

- No tiene que haber posiciones espejo, por lo tanto los A[0..23] tienen que estar conectados. Por lo tanto, un decodificador no va.
- Como los saltos son de a 4 bytes, hay un patron del:
```
- 0 = `...0000`  a0,a1= 00
    
- 4 = `...0100`  a0,a1= 00
    
- 8 = `...1000`  a0,a1= 00
    
- 12 = `...1100` a0,a1= 00
```
Podemos ignorar y no conectar a0, a1 total siempre es 00 para las palabras. 

Para el chip de rom:

	Tiene que usar A[0..13] pues son las direcciones que necesita para datos.
	El CS tiene que ser del resto de adress si dan 1. O sea, en un  AND gigante del resto de address.

Para el chip rom:

	Mismo, pero sabiendo que tenemos que usar A[0..16]

Para los CS, tienen quye estar el resto de direcciones NO usadas conectadas a un and. Para el and de la rom, iria de 

A[12..23], conectado a un CS de las rom.

a[16..23], conectado a un CS de las ram. Con a 17 negado (Si no tiene a[17] negado, estariamos repitiendo direcciones de la rom en la ram)
![[Pasted image 20260629120249.png]]

![[Pasted image 20260629115113.png]]
No entiendo logism: pero a los chips de ram tiene read/write, los and conectan con los CS de cada chip, y las salidas para ampliar el ancho de palabras


4) Diseñar un circuito secuencial que detecte la siguiente secuencia: 7,7 8. La entrada es un numero binario natural de 4 bits. Al detectar la secuencia enciende un led. Para apagar el led debe recibir cualquier numero par. Al apagarse todo comienza de nuevo.

- Se pide: 
   a) Diagrama de estados 
   b) Ecuaciones de transición de estados y ecuaciones de salida 
   c) Esquema de todo el circuito a nivel diagrama de bloques, indicando las entradas, las salidas y las ecuaciones que vinculan a las entradas con las salidas de cada bloque. 
   
   Ayuda: Obtenga las ecuaciones directamente del diagrama de estados.

Analizo:

- Tengo 4 estados:
1. El inicio (estado 0: 0000)
2. El primer 7 (estado 1: 0111)
3. El segundo 7 (estado 2: 0111)
4. El único 8 (estado 3: 1000)

- Esto solo transicion si se esta cumpliendo la secuencia, que es una secuenca de paridad. Crearemos una señal de ```"esPar"``` que permite la transicion entre estados.
- La entrada es un numero binario natural de 4 bits.
- La entrada solamente puede tomar los valores que aparecen en la secuencia (7, 8 y luego un par para apagar).
- Como cuento con 4 estados, funcionaria en base a 2 flip flips.

Sólo esta mirando la secuencia 7, 7, 8. 
->Si se interrumpe el patron, debe volver y reiniciarse. (Número par.)
->Si no se interrumple, es un bucle. Ej: estoy en 8, pero llego un 7, voy a 8
Tengo que ver una señal si:
- Estoy en 7
- Estoy en 8
- Estoy en número par -> Apaga un led.
- Si se detecta la secuencia 7,7,8 -> Enciende un led.
Tabla de transicion de estado. (Combinacional de entrada)

![[Pasted image 20260629182257.png]]

Combinacional de estados
Entradas del combinacional de estados.  Salidas del combinacion de estados

Estado Actual              Entradas         Estado Siguiente

| Q1  | Q0  | es7 | es8 | esPar | D1  | D0  |
| --- | --- | --- | --- | ----- | --- | --- |
| 0   | 0   | 1   | 0   | 0     | 0   | 1   |
| 0   | 0   | 0   | X   | X     | 0   | 0   |
| 0   | 1   | 1   | 0   | 0     | 1   | 0   |
| 0   | 1   | 0   | X   | X     | 0   | 0   |
| 1   | 0   | X   | 1   | 1     | 1   | 1   |
| 1   | 0   | X   | 0   | X     | 0   | 0   |
| 1   | 1   | X   | X   | 1     | 0   | 0   |
| 1   | 1   | X   | X   | 0     | 1   | 1   |
Combinacional de salida:

| Estado | LED |
| ------ | --- |
| 00     | 0   |
| 01     | 0   |
| 10     | 0   |
| 11     | 1   |
No hacemos karnough de 5 variables puesto que es mas facil sacarlo de la tabla tal como está.

D1 = q1'q0es7es8'esPar' + q1q0'es8esPar + q1q0esPar'

D0 = q1'q0'es7es8'espar' + q1q0'es8esPar + q1q0esPar'

LED = Q1Q0

![[Pasted image 20260629193813.png]]

5)
Decidir cuáles de las siguientes instrucciones en assembler se pueden codificar en código de máquina LEGv8. 
Explique qué falla en las que no puedan ser ensambladas. 
Para las que pueden ser ensambladas, provea el código hexadecimal de las mismas. 
Elija una de ellas y explique los campos y el funcionamiento de la instrucción elegida.

| Instruccion             | Ensamblable | Por que                                                               | Hexadecimal. |
| ----------------------- | ----------- | --------------------------------------------------------------------- | ------------ |
| MOVK X30, 0, LSL 30     | No          | Lsl 0, 16, 32, 48                                                     |              |
| LSR X0, X0, -3          | No          | Usar LSL para #-                                                      |              |
| STURH X20, [X21, #5]    | Si          |                                                                       | 0x780052B4   |
| EOR X29, X30, X31       | Si          |                                                                       | 0xCA1F03DD   |
| MOVK XZR, 65535, LSL 48 | No          | Los movk si o si tienen que ser hexa de 4 en 4, no pueden ser de mas. |              |
| AND X1, X2, 8           | No          | debe ser andi                                                         |              |
| LDUR X31, [X32, #33]    | No          | x32 no existe                                                         |              |
| LSR X0, X1, 0x7F        | No          | LSR no acepta > 64                                                    |              |
| BL -40                  | Si          |                                                                       | 0x97FFFFF6   |

```
0000: 0  0100: 4  1000: 8  1100: C
0001: 1  0101: 5  1001: 9  1101: D
0010: 2  0110: 6  1010: A  1110: E
0011: 3  0111: 7  1011: B  1111: F
```
BL -40
EL PC va de 4 en 4, entonces salta 40/4 = 10 bytes.
Type b.
Opcode(6): 100101
BR_Adress(26): 11 1111 1111 1111 1111 1111 0110 
1001 0111 1111 1111 1111 1111 1111 0110 

0x97FFFFF6

EOR X29, X30, X31
R[Rd] = R[Rn] ^ R[Rm]
Type R. 
Opcode(11): 1100 1010 000
Shamt(6):0000 00 
Rd (5): 11101
Rn (5): 11110
Rm (5): 11111
1100 1010 0001 1111 0000 0011 1101 1101

0xCA1F03DD

STURH X20, [X21, #5]
M[R[Rn] + DTAddr](15:0) = R[Rt](15:0)
Type D
Opcode(11): 011 1100 0000
DT_Address(9): 0 0000 0101
Op(2): 00 
Rn(5): 10101
Rt(5): 10100
0111 1000 0000 0000 0101 0010 1011 0100

0x780052B4