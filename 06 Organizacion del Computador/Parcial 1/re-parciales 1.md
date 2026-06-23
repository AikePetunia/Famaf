#### 2026 - 1er Parcial ODC

1) Convertir el siguiente número decimal a formato IEEE 754 de presicion simple (normalizados): `-20,5` (en base 10)
Indicar el resultado en hexadecimal.

El formato IEEE754 es:

(-1)^bs*(1 + fraccion) + 2^normalizado 

-20,5 -> Es un número negativo.

`BS: 1 (-)`

Pasemos a decimal el número 20,5

10100,1

Normalizando:
1,01001 (Corrimos 4)
Recordemos que la parte de fraccion, deben ser de 23 bits.

(-1)¹ * (1 + 0100 1000 0000 0000 0000 000) *+* 2^4+127.

Paso el exponente a binario
131 = 1000 0011

Quedando:

1   10000011  0100 1000 0000 0000 0000 000
BS    EXP       FRACCION

Ahora a hexadecimal:
**`0xC1A40000`**


``` 
0000: 0   0100: 4  1000: 8  1100: C
0001: 1   0101: 5  1001: 9  1101: D
0010: 2   0110: 6  1010: A  1110: E
0011: 3   0111: 7  1011: B  1111: F
```
b) Valores signados:
A: 0xB1 (1011 0001)
B: 0x8F (1011 1111) -> (0100 0001)

C = A - B = (A + (-B))

1011 0001
0100 0001

1111 0010: 

2)
a) Expresar cada funcion como sumas negadas, asegurando que la implementacion resulte ultilice la mejor cantidad de compuertas NOR (de la cantidad de entradas que sea necesaria). Completar la tabla:

Nor es una compuerta universal, capaz de representar cualquier compuerta.


| Funcion           | Expresion como sumas negadas | N' DE NORS |
| ----------------- | ---------------------------- | ---------- |
| F = A'            | (A + A)'                     | 1          |
| F = (A+B) * (A+C) | ((A ** B)'+(A* * B)')'       | 3          |
| F = B + A*C       | ((B + A)' + (B + C)')'       | 3          |
|                   |                              |            |
B) Encontrar una expresions equivalente de 
F = (B' + C')* A + A * B * C + B * C 

| Paso | Aplicar...                    | Expresion Resultante                |
| ---- | ----------------------------- | ----------------------------------- |
| 0    | Original                      | F = (B' + C')*A + A * B * C + B * C |
| 1    | P4 Distributividad            | B'A + C'A + ABC + BC                |
| 2    | T6 Absorcion                  | B'A + C'A + BC                      |
| 3    | P4 (Distruvitividad factor A) | (B' + C') * A + BC                  |
| 4    | T5 DeMorgan inverso           | (B*C)' + A + BC                     |
3)

Dada la siguiente funcion canonica:
F= A'B'CD'+ A'B'CD+ A'BC'D+ A'BCD+ AB'CD+ AB'CD+ ABC'D 

a) Obtener la fuincion minimizadacomo suma de miniterminos a traves del mapa de karnaugh:
![[Pasted image 20260621154744.png|276]]
![[Pasted image 20260621162145.png]]
Queda:
F = bc'd + a'cd + b'cd + a'b'c 
![[Pasted image 20260621163139.png]]

![[Pasted image 20260621163450.png]]
Se requiere diseñar un sistema secuencia que genere una secuencia numerica especifica de 3 bits de salida (x2, x1, x0) el diseño debe priorizar la utilizacion de la minima cantidad de ff. el sistema cuenta con dos entradas de control: dir, y skip.
la secuencia principal es 1->3->5->7->1
Es un sistema de dos entradas (Dir, skip)
Dir = 0, secuencia avanza 1 -> 3 -> 5 -> 7 -> 1
Dir = 1, secuencia retrocede 1 -> 7 -> 5 -> 3 -> 1

Skip = 1, el sistema debe saltar al siguiente numero de la secuencia actual y pasar directamente al posterior, ejemplo: si el estado actual es 3, dir = 0 y skip = 1, el proximo estado sera 7 (saltando el 5). El dir es irrelevante

Cuenta con 5 estados:
1->3->5->7->1
Tiene 3 bits de entrada, 2⁸ estados PODRIA tener, pero este sistema secuencial tiene 3 flip flips d 

![[Pasted image 20260621165007.png]]

a) si el sistema se encuenta en el estado con salida 5 (101) dir 1, skip 1, el siguiente estado es: 1 (o sea, 001)
c) Cual es la escuacion simplicada para el bit menos signiciativo de la salida x0?
respuesta 1
![[Pasted image 20260621163509.png]]
D) suponga que ahora midifcamos el diseño de tal forma que la salida de los ff que codifical el estado actual q2, q1, q0, son directamente las salidas del circuito (no hay combinacion de salida), al realisar la tabla de transcion de estados, cuantas filas tendria la tabla completa
32 filas

Ejercicio 5)
SE requiere diseñar una unidad logica con entredas en serie (In) y en paralelo (I[3-0]). Ademas cuenta con las salidas: Serie (Out) y paralelo (O[3-0] la entrada op selecciona el funcionamiento)
op = 0: carga paralela, op = 1, registro desplazamiento.
ademas, debe generarse una salida extra out_1 que se pone en uno cuando a la salida de los flip flops se encuentre en el patron "0110". 

![[Pasted image 20260622193430.png]]

![[Pasted image 20260622193930.png]]

a) Calcular la cantidad de memoria implementada en bits:
Tenemos 3 chips de 4k de 8 bits.
Tenemos 2 chips de 8k de 4 bits (o sea, uno solo 8k de 8 bits)
4k * 3 = 12.
8k * 1 = 8k.
Total implementada: 12k + 8k = 20k * 8

b) el metodo de la tabla:
tenemos que:
a15, a14, a13, a12, son los que manejan la memoria.


| A15 | A14 | A13 | A12 | CHIP  | HEXADECIMAL   |
| --- | --- | --- | --- | ----- | ------------- |
| 0   | 0   | 0   | 0   | #1    | 0x0000-0x0FFF |
| 0   | 0   | 0   | 1   | -     | 0x1000-0x1FFF |
| 0   | 0   | 1   | 0   | -     | 0x2000-0x2FFF |
| 0   | 0   | 1   | 1   | -     | 0x3000-0x3FFF |
| 0   | 1   | 0   | 0   | -     | 0x4000-0x04FF |
| 0   | 1   | 0   | 1   | -     | 0x5000-0x5FFF |
| 0   | 1   | 1   | 0   | -     | 0x6000-0x6FFF |
| 0   | 1   | 1   | 1   | #2    | 0x7000-0x7FFF |
| 1   | 0   | 0   |     | #3    | 0x8000-0x8FFF |
| 1   | 0   | 0   |     | #3    | 0x9000-0x9FFF |
| 1   | 0   | 1   |     | #3    | 0xA000-0xAFFF |
| 1   | 0   | 1   |     | #3    | 0xB000-0xBFFF |
| 1   | 1   | 0   |     | #4,#5 | 0xC000-0xCFFF |
| 1   | 1   | 0   |     | #4,#5 | 0xD000-0xDFFF |
| 1   | 1   | 1   |     | -     | 0xE000-0xEFFF |
| 1   | 1   | 1   |     | -     | 0xF000-0xFFFF |
|     |     |     |     |       |               |
