1) a) Expresar el número 10111100100110101000110100110000 en decimal considerando que se encuentra en formato IEEE754. b) Mostrar el contenido de los distintos campos del formato en binario.

a)
1) Bit de signo.
Tenemos 1 -> Número negativo.

2) Exponente / Normalizacion
01111001 a decimal es -> 121 - 127 = -6

3) Fraccion:
00110101000110100110000
Sabemos que este numero se normalizo y habria que agregar el 1 que se saca, y correr la coma para obtener el numero entero. 
1 + 001101.01000110100110000, ordenamos:
100110101000110100110000 * 2⁻⁶ = 000000.10011010100011010
normalizado:
0.0000010011010100011010
Pasando a decimal:
−0.0188661515712738037109375

b)
1   01111001   00110101000110100110000
BS    EXP             Fracción

2) Diseñar un circuito de registros de 4 bits que cumpla con el siguiente comportamiento: 

00 Salida en paralelo 
01 Retención del dato 
10 Reset 
11 Entrada en paralelo 

Cuando el circuito debe retener los datos, cada flip-flop debe mantener en su sa lida el mismo dato aunque la entrada se modifique.
-> o sea, ademas de hacer out, hace un bucle con el dato que saco, debe de ir a un mux de 00, y ese 00 al in del FF y escupir y retener el dato

En la salida en paralelo, los datos almacenados salen por los pines parallel_out[0-3] y el dato se retiene sin modificarse.
-> Prácticamente lo mismo

En la entrada en paralelo, ingresan datos nuevos por el pin parallel_in[0-3] y las salidas (parallel_out[0-3]) debe permanecer en cero.
-> este iria en el mux 11, y simplemente entra el dato, en la salida de este, tiene que ponerse en 0. El 0 lo forzamos haciendo un AND con
Sel_1 negado O Sel_2, con la salida del FF y conectado al OUT.

Finalmente, en reset todos los datos almacenados son reemplazados por unos en el mismo ciclo de reloj.
-> aca en la entrada 10 del mux, pongo un 1 y que sea la entrada del FF, y no saca datos, simplemente le otorga el 1.



![[Pasted image 20260630094536.png]]

3) Basados en el sistema de memoria de la figura:

Analisis:

	Entran A[0..31] o sea, 2³² direcciones de datos. 2³⁰ equivale a GIGA.
	Aumenta el ancho de las palabras en paralelo en los chips de ram.
	Solo tiene chips de ram
	Probablemente tenga posiciones espejo

Se pide: 
a) Indicar el tamaño de cada bloque de memoria (RAM #1, #1, #2, #3, #4, #5) expresado en cantidad de palabras x ancho de palabra en bits. 

#1, #2, #3 de RAM:
Le entran 2²⁸ adress, sabemos que 2²⁰ es 1M, 2⁸ es 256.
Tiene capacidad de 256M.
No está en paralelo ni nada, y se marcan que salen 64 bits.
Son de 256M x 64 bits.

#4, #5 RAM:
Le entran 2²⁹, sabemos que 2²⁰ es 1M, 2⁹ es 512.
Tiene capacidad de 512M.
Està en paralelo marcando una salida de D[0..31], le entra a cada chip 32 bits.
Bloque implementado
512M × 64 bits
├── RAM #4 → bits D[0..31]
└── RAM #5 → bits D[32..63]

b) Dibujar el mapa de memoria implementado, indicando la dirección de inicio y final de cada bloque. 

c) Indicar si esta implementación presenta posiciones imagen o espejo. De ser así, indicar su ubicación en el mapa y a que bloque que real corresponden. 

| A30 | A29 | A28 | CHIP      | HEXA          |
| --- | --- | --- | --------- | ------------- |
| 0   | 0   | 0   | #1        | 0x0000-0x1FFF |
| 0   | 0   | 1   | #2        | 0x2000-0x3FFF |
| 0   | 1   | 0   | -         | 0x4000-0x5FFF |
| 0   | 1   | 1   | -         | 0x6000-0x7FFF |
| 1   | 0   | 0   | #3        | 0x8000-0x9FFF |
| 1   | 0   | 1   | #3 ESPEJO | 0xA000-0xBFFF |
| 1   | 1   | 0   | #4,#5     | 0xC000-0xDFFF |
| 1   | 1   | 1   | #4,#5     | 0xE000-0xFFFF |


d) Calcular la capacidad total (expresada en bytes) de memoria implementado (no se consideran las posiciones imagen)

Tenemos 3 chips de 256M x 64 bits.
Tenemos 2 chips de 512M x 32 bits.
Sabemos que la cantidad  tiene que ser menos a 4G (pues a[0..31] son 2³² = 4G)

El espejo/imagen es el chip #3 que no debe ser contado, terminamos con:

2 chips de 256M x 64 bits.
2 chips de 512M x 32 bits.

Sabemos que 8 bits = 1 byte ->
64 bits = 8 bytes.
32 bits = 4 bytes.

Para 256M:
2 x (256M × 8bytes) = 2 x 2048Mbytes = 4 GB)
Para 512M:
2 x (512M x 4bytes) = 2 x 2048Mbytes = 4 GB

Implemetacion total: 8GB


4) Diseñar un sistema secuencial de dos bits de entrada (B, A) y una salida (LOCK), el cual se utiliza para controlar la apertura de un candado. Las entradas se codifican de la siguiente manera:

| código       | A   | B   |
| ------------ | --- | --- |
| No permitido | 0   | 0   |
| A            | 0   | 1   |
| B            | 1   | 0   |
| No Permitido | 1   | 1   |
El sistema debe iniciar con LOCK = 1. 
La secuencia de apertura es: „A‟-‟A‟-‟B‟-‟A‟. 
Si esta secuencia se ingresa correctamente de manera consecutiva, la señal de salida se desbloquea LOCK = 0. 
Para cualquier otra secuencia de „A‟ y „B‟ el sistema debe permanecer bloqueado. 
Una vez desbloqueado el sistema, el mismo se volverá a bloquear solo ante la recepción de ‟B‟- ‟B‟ en forma consecutiva.
La combinación de entrada de los bit A y B simultáneamente en 0 o 1 no esta permitida, y su aparición representa un error en el sistema. 
De registrarse alguno de estos dos casos, el sistema debe ir inmediatamente a un estado de error (con LOCK = 1) del cual se sale solo ante la ocurrencia de la secuencia ‟A‟-‟B‟ de manera consecutiva o no.
Se pide: 
a) Diagrama de estados 
b) Tablas de transición de estados y de salida 
c) Simplificar mediante diagramas de Karnaugh todas las funciones que lo permitan 
d) Implementar los circuitos combinacionales de transición de estados y de salida utilizando compuertas lógicas de cualquier tipo y número de entradas.