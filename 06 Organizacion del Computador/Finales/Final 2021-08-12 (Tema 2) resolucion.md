1) 
a) Cuál es el número decimal negativo más grande expresable en el formato IEEE754, (Sólo mostrar el contenido de los distintos campos del formato en binario. 

Sabemos que los campos de IEEE754 esta compuesto por:

BS  Exponente   Fracción
1    8 bits      23 bits

El bit se signo claramente tiene que estar en negativo.
Sabemos que el exponente tiene que ser lo mas chico posible, o sea:
Exponente: 1111 1110
Ya que, cuando pasamos de IEEE754 a este se le niega - 127
La fraccion debe ser lo más grande posible, algo como:
1111 1111 1111 1111 1111 111
Terminamos con un número:
1 00000001 11111111111111111111111
Este es el menor con mayor magnitud

El negativo mas grande en si es:
BS: 1 (Negativo)
Exponente: 0000 0001
Fraccion: 0000 0000 0000 0000 001
1 00000001 0000000000000000001


b) ¿Cuál es el número expresable en el formato IEEE754 inmediatamente menor al anterior?; 

El numero expresable en el formato ieee754 inmediatamente menor al anterior es el mismo numero sumandos un bit.

c) ¿Cuál es la diferencia absoluta entre los números de los puntos a) y b). 

no lo vi

d) ¿Cuál es la diferencia relativa entre los números de los puntos a) y b)

no lo vi


2) Diseñar un circuito combinacional que reciba como entradas dos números de 2 bits en formato binario natural, y produzca como salida la división entera entre el primer número y el segundo. Además debe proveer el resto de dicha división entera. Note que la salida tendrá 2 bits para el cociente y dos bits para el resto. Además debe haber una salida div_0 que se ponga en uno cuando se intenta dividir por cero. En ese caso el resto de las salidas es sin cuidado. Los circuitos deben implementarse con la menor cantidad de compuertas nor de dos entradas.

| Entradas |     | Salidas |     |     |
| -------- | --- | ------- | --- | --- |
produzca como salida la división entera entre el primer número y el segundo (O sea, k2k1/n2n1 = algo)

| K2K1 | N2N1 |     | Coc2 | Coc1 |     | Res2 | Res1 | Div_0 |
| ---- | ---- | --- | ---- | ---- | --- | ---- | ---- | ----- |
| 00   | 00   |     | X    | X    |     | X    | X    | 1     |
| 00   | 01   |     | 0    | 0    |     | 0    | 0    | 0     |
| 00   | 10   |     | 0    | 0    |     | 0    | 0    | 0     |
| 00   | 11   |     | 0    | 0    |     | 0    | 0    | 0     |
| 01   | 00   |     | X    | X    |     | X    | X    | 1     |
| 01   | 01   |     | 0    | 1    |     | 0    | 0    | 0     |
| 01   | 10   |     | 0    | 0    |     | 0    | 1    | 0     |
| 01   | 11   |     | 0    | 0    |     | 0    | 1    | 0     |
| 10   | 00   |     | X    | X    |     | X    | X    | 1     |
| 10   | 01   |     | 1    | 0    |     | 0    | 0    | 0     |
| 10   | 10   |     | 0    | 1    |     | 0    | 0    | 0     |
| 10   | 11   |     | 0    | 0    |     | 1    | 0    | 0     |
| 11   | 00   |     | X    | X    |     | X    | X    | 1     |
| 11   | 01   |     | 1    | 1    |     | 0    | 0    | 0     |
| 11   | 10   |     | 0    | 1    |     | 0    | 1    | 0     |
| 11   | 11   |     | 0    | 1    |     | 0    | 0    | 0     |

Los circuitos deben implementarse con la menor cantidad de compuertas nor de dos entradas.
OR:

| OR: | x   | y   | s   |     | NOR: | x   | y   | s   |
| --- | --- | --- | --- | --- | ---- | --- | --- | --- |
|     | 0   | 0   | 0   |     |      | 0   | 0   | 1   |
|     | 0   | 1   | 1   |     |      | 0   | 1   | 0   |
|     | 1   | 0   | 1   |     |      | 1   | 0   | 0   |
|     | 1   | 1   | 1   |     |      | 1   | 1   | 0   |
or: x + y
NOR: (xy)'

![[Pasted image 20260702135926.png]]![[Pasted image 20260702135933.png]]

3) Diseñar y esquematizar un banco de memoria, (memorias mas circuito de mapeo) para un procesador de 16 bits de bus de datos y 22 bits de bus de direcciones con 4 kbytes de ROM en las direcciones más bajas y 32 kbytes de RAM en las direcciones más altas. El sistema debe tener la mayor cantidad posible de posiciones espejo. Las memorias deben ser del mayor tamaño posible en cada caso, pero limitadas con un bus de datos de 8 bits.

"para un procesador de 16 bits de bus de datos y 22 bits de bus de direcciones"
-> Tenemos A[0..21] Direcciones que entran, y D[0..15] direcciones que salen

->"4 kbytes de ROM en las direcciones más bajas y 32 kbytes de RAM en las direcciones más altas."

Sabemos que la memoria rom es la que se encuentra mas arriba en un mapa de memoria, y en consecuencia la primera en tener que salir. Abajo del mapa, la ram.
4KBytes:
Sabemos que 1K = 2¹⁰, entonces 4KB serían 2¹² (A[0..11] bus de datos de entrada)
32KBytes:
Sabemos que 32k = 2¹⁵, entonces le entran A[0..14] bus de datos al chip

"El sistema debe tener la mayor cantidad posible de posiciones espejo."
Las posiciones espejo se producen cuando hay Direcciones NO implementadas. 

"Las memorias deben ser del mayor tamaño posible en cada caso, pero limitadas con un bus de datos de 8 bits."
Necesitamos conexiones en paralelo para llegar a las D[0..15] direcciones 

![[Pasted image 20260702145049.png]]


| A22 | A21 | A20 | A19 | A18 | A17 | A16 | A15 | chip  | hexa          |
| --- | --- | --- | --- | --- | --- | --- | --- | ----- | ------------- |
| X   | 0   | X   | X   | X   | X   | X   | X   | #1,#2 | 0x0000-0x3FFF |
| X   | 0   | X   | X   | X   | X   | X   | X   | #1,#2 | 0x4000-0x7FFF |
| X   | 1   | X   | X   | X   | X   | X   | X   | #3,#4 | 0x8000-0xBFFF |
| X   | 1   | X   | X   | X   | X   | X   | X   | #3,#4 | 0xC000-0xFFFF |

4) 
Diseñar un circuito secuencial que detecte la entrada de dos sietes consecutivos o no. La entrada es un numero binario natural de 4 bits. Al detectar la secuencia enciende un led. Para apagar el led debe recibir tres dos consecutivos. En ese caso todo se reinicia otra vez. 

Se pide: 
a) Diagrama de estados 
b) Ecuaciones de transición de estados y ecuaciones de salida 
c) Diagrama en bloques del sistema completo, indicando claramente las entradas y salidas de cada bloque, y las ecuaciones o relaciones que las vinculan a dichas entradas con dichas salidas. Más precisamente, representar al combinacional de estados, el combinacional de salida como bloques con sus entradas y sus salidas y las ecuaciones que las vinculan, y también representar los flip-flops, con sus entradas y salidas, sus clocks y resets. Representar las uniones entre los flip-flops, el combinacional de estados y el combinacional de salida. 

Ayuda: Obtenga las ecuaciones directamente del diagrama de estados.