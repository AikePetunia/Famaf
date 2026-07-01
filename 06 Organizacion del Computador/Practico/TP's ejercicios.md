Ejercicio 7: 
Diseñar un circuito secuencial de 4 estados “00”, “01”, “10” y “11”, con 2 entradas E y X. Los valores de salida en cada estado son iguales a la codificación de dicho estado. 

Funcionamiento: si E = ‘0’ el circuito permanece en el mismo estado sin importar el valor de X. Cuando E= ‘1’ y X= ‘1’ el circuito pasa al siguiente estado (de “00” a “01” a “10” a “11” y de vuelta al “00”). Cuando E= ‘1’ y X= ‘0’, el circuito vuelve al estado anterior (de “00” a “11” a “10” a “01” y de vuelta al “00”). 
Minimizar las ecuaciones en caso de ser posible. 
Implementar el circuito utilizando Flip-flops tipo D y las compuertas lógicas necesarias.

![[Pasted image 20260701133002.png]]

Entradas del combinacional

| Entradas del comb. de estados | Salidas del comb. de estados |
| ----------------------------- | ---------------------------- |

| Estado Actual | Entradas | Estado siguiente. |
| ------------- | -------- | ----------------- |

| Q1  | Q0  |     | E   | X   |     | D1  | D0  |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 0   | 0   |     | 0   | 0   |     | 0   | 0   |
| 0   | 0   |     | 0   | 1   |     | 0   | 0   |
| 0   | 0   |     | 1   | 0   |     | 1   | 1   |
| 0   | 0   |     | 1   | 1   |     | 0   | 1   |
| 0   | 1   |     | 0   | 0   |     | 0   | 1   |
| 0   | 1   |     | 0   | 1   |     | 0   | 1   |
| 0   | 1   |     | 1   | 0   |     | 0   | 0   |
| 0   | 1   |     | 1   | 1   |     | 1   | 0   |
| 1   | 0   |     | 0   | 0   |     | 1   | 0   |
| 1   | 0   |     | 0   | 1   |     | 1   | 0   |
| 1   | 0   |     | 1   | 0   |     | 0   | 1   |
| 1   | 0   |     | 1   | 1   |     | 1   | 1   |
| 1   | 1   |     | 0   | 0   |     | 1   | 1   |
| 1   | 1   |     | 0   | 1   |     | 1   | 1   |
| 1   | 1   |     | 1   | 0   |     | 1   | 0   |
| 1   | 1   |     | 1   | 1   |     | 0   | 0   |

La tabla más chica, es la tabla que pone el número abajo.
Combinacional de salida

| Estado Actual |     |     | Salida |
| ------------- | --- | --- | ------ |

| Cod | Q1  | Q0  |     |     | S1  | S2  |
| --- | --- | --- | --- | --- | --- | --- |
| E0  | 0   | 0   |     |     | 0   | 0   |
| E1  | 0   | 1   |     |     | 0   | 1   |
| E2  | 1   | 0   |     |     | 1   | 0   |
| E3  | 1   | 1   |     |     | 1   | 1   |

Diseñar una máquina de estados que funcione como detector del patrón “1011”. La máquina debería mostrar un ‘1’ como salida cada vez que se encuentra el patrón, y un ‘0’ en caso contrario. No debe considerarse las superposiciones en la secuencia de entrada, es decir si: “....1011011….” el output correcto es “....0001000….”

Sepamos que por la cantidad de estados, es la cantidad de "necesidades" que tiene el diagrama.
En este ejercicio:
tenemos que detectar 1011. O sea 4 bits. O sea 4 estados.
Tenemos que iniciar la maquina de estados. Agregamos 1 estado más.
Un error es volver al inicio. 
lo que vos llamás "bits de transición" son las **condiciones de entrada**.