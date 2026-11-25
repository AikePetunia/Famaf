Ejercicio 1.
Se ejecuta el proceso `./sgemm 4096 4096 4096`, en una pc con 4 nucleos reales, sin nucleos virtuales. Proceso es cpu-bouind, mohilo y no hay otros procesos corriendo en el sistema. A continuacion se listan mediciones que se hicieron tirando una cantidad de procesos iguales y se reportan los valores de **(walltime, cputime)**

walltime -> Tiempo de pared, tiempo que se tomo irl.
cputime-> Tiempo que se paso en "running" en el procesador. 

A) Completar las casillas vacias con valores aproximados.
ASUMO ! Que son Cant. de procesos qe corren TODOS al MISMO TIEMPO, que una tabla NO afecta a la otra.

| **Cant. de Procesos** | **Mediciones**                                                                                                                                                         |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **2**                 | `(1.47, 1.47)`, `(1.46, 1.48)`                                                                                                                                         |
| **3**                 | `(1.54, 1.52.)`, `(1.53, 1.50)`, `(1.55, 1.53.)`                                                                                                                       |
| **4**                 | `(1.61, 1.54)`, `(1.59, 1.55)`, `(1.64, 1.56)`, `(1.69, 1.54)`                                                                                                         |
| **5**                 | `(2.10., 1.56.)`, `(2.13, 1.49)`, `(2.15, 1.50)`, `(2.13., 1.59)`, `(2.12, 1.58)` ("un 25% q cuesta de tiempo irl de un proceso, se le pasa al resto de los procesos") |
| **8**                 | `(3.54, 1.56.)`, `(3.44., 1.57)`, `(3.50., 1.60)`, `(3.51, 1.52)`, `(3.54., 1.56)`, `(3.49., 1.59)`, `(3.50, 1.55.)`, `(3.48, 1.59)` ("misma logica q antes, * 4")     |
![[Pasted image 20261125103245.png]]
Walltime: Tiempo que paso en la vida real. (Todos son de aprox 12.)
cputime: Tiempo gastado en el procesador. 

IO Bound: El proceso se quedo durmiendo esperando por I/O, pero el proceso es liviano. 

Cpu bound: Uso un nucleo puro sin nada adicional, 100% individual. 

Cpu bound & multihilo: Uso un nucleo y hilos, aumentando el paralelismo y gastando más procesador. 

Ejercicio 2) 

Secuencia de fotos en un heap de 4KiB = 4096 bytes. SOlo una operacion ocurre entre fotos del heap. Se utiliza la estructura de datos de OSTEP, cap 17: "Free space management", es decir que la estructura de datos que mantiene la free-list y los bloques alocados ocupa 8 bytes.
Todo esa en decimal y en bytes. La base del heap es la direccion virtual 16kib, o sea en foto 0, head = 16384. El inicio de la memoria esta arriba, y crece hacia abajo. 
Complete el campo size.

(Anotame: Re-leer el cap 17).

![[Pasted image 20261125104314.png]]
Un header ocupa 8 bytes.  
Un size, representa los bytes utiles que pueden guardar informacion. 
Secuencia de fotos en un heap de 4KiB = 4096 bytes.
(Bloques ordenados de arriba hacia abajo)
El heap tiene una capacidad de hasta 4096
Por cada malloc(100), consumo 100 de size.
###### Foto 0:
¿ CUANTO TIENE LIBRE ?
Tiene SIZE y NEXT. Es un bloque libre. 4096 - 8. 
Los 8 estan ocupados
Size: 4088 (4096 - 8) 
###### Foto 1:
Size: 100  (16392 = malloc(100))
Size: 3980 (4096 - 8 - 100 - 8)
###### Foto 2: 
Size: 100  (16500 = malloc(100))
Size: 100  (16392 = malloc(100))
Size: 3872 (3980 - 100 - 8)
###### Foto 3: x
Size: 100 (16608 = malloc(100))
Size: 100 (16500 = malloc(100))
Size: 100 (16392 = malloc(100))
Size: 3764 (3872 - 100 - 8)
###### Foto 4:  4096 - 100 que aloje: 
Size: 100 (16608 = malloc(100))
Size: 100 (free(16500)) <- Free 
Size: 100 (16392 = malloc(100))
Size: 3764 (Fragmentacion)

No recupera el espacio el head por que no es contiguo.

Si free hubiese sido en 16392, se le devuelve el tamaño al heap y no habria fragmentacion externa 

Free recibe un puntero, no una memoria. 16500 ES un puntero.

![[Pasted image 20261125110854.png]]
El bloque esta alocado: Tiene size, magic.
El bloque esta libre: Tiene size y next

![[Pasted image 20261125104300.png]]

Ejercicio 3.
PLanificar con Round Robin (Q=10) para los siguientes procesos monohilo que tienen mezcla c espera por I/O
Suponga que hay 2 nucleos en ejecucion, y es por eso que cada celda de tiempo esta subididia en donde, por ejemplo, si una casilla esta marcada como |a|b|, significa que en un tiempo dado, A se ejecunta en un simultaneamente B se ejecuta en el otro.

| Proceso | Inicio | CPU | IO  | CPU |
| ------- | ------ | --- | --- | --- |
| A       | 0      | 1   | 6   | 1   |
| B       | 0      | 8   | 1   | 5   |
| C       | 5      | 10  |     |     |


| **Intervalo** | **Núcleo 1** | **Núcleo 2** | **Eventos / Estado de I/O y Ready**                                  |
| ------------- | ------------ | ------------ | -------------------------------------------------------------------- |
| **`0 - 1`**   | **A**        | **B**        | Arrancan A y B. En `1`, A pasa a I/O (`1` a `7`).                    |
| **`1 - 5`**   | —            | **B**        | A en I/O. En `5`, llega C (`CPU=10`).                                |
| **`5 - 7`**   | **C**        | **B**        | A sigue en I/O hasta `7`.                                            |
| **`7 - 8`**   | **C**        | **B**        | En `7`, A termina I/O pero **espera en Ready** (núcleos llenos).     |
| **`8 - 9`**   | **C**        | **A**        | En `8`, B pasa a I/O (`8` a `9`); A ejecuta su última CPU y termina. |
| **`9 - 14`**  | **C**        | **B**        | En `9`, B termina I/O y ejecuta su última CPU (`5` u.) hasta `14`.   |
| **`14 - 15`** | **C**        | —            | B termina en `14`. C completa su 10ma unidad y termina en `15`.      |
![[Pasted image 20261125173452.png]]

Ejercicio 4)
![[Pasted image 20261125173659.png]]

Cada tabla de paginas de 4kib con 2 niveles que pasa de un esquema (10,10,12) a uno (20, 12)
10 bits de nivel 1
10 bits de nivel 2
12 bits de offstet
![[Pasted image 20261125175039.png]]
![[Pasted image 20261125173858.png]]

CR3=0xFA110 

a) Direccion virtual 0x00000E5A es:

Tenemos 12 bits de offset, que seria 0xE5A.
El resto, son 10 bits de L1, 10 bits de L2
0000 0000 00 -> 0x000: 0x0B0CA, UWP
0000 0000 00 -> 0x000: 0x0CA5A, UWP 
![[Pasted image 20261125175033.png]]
Tenemos 
0x0CA5AE5A

B) La direccion virtual 0x00800F00
Tenemos 10, 10, 12
(00 0000 0000): 0x000 :0x0B0CA UWP
(00 0000 0010): 0x002 en CR3 :0x0B0CA SR-
12 de offset: F00 (1111 0000 0000)

No es valida, pues l2 no tiene una valida, no está presente esa direccion.

C)0xFFFFFFFF
Tenemos 10, 10, 12
10 de l2: (0011 1111 1111): 0x3FF: 0xFA110, SWP
10 de l1: (0011 1111 1111): 0x3FF: 0xFA110, SWP 
12 de offset: F00 (1111 0000 0000)

0xFA110FFF

### Ejercicio 5 (Imagen 6)

Para el mismo esquema de paginación del Ejercicio 4:

- **a) Hacer el mapeo inverso de la dirección física `0x00CABE5A` a todas sus direcciones virtuales.**
    
Offset: 0xE5A
Las tablas que tienen 0x00CAB presente son:
0x0CA5A: 0x002: 0x00CAB 
0x0B0CA: -
0x00000: -

`0x000, 0x0B0CA`
`0x000, 0x0CA5A`
`0x000, 0x00CAB`

        
- **b) Hacer el mapeo inverso de la dirección física `0xFA110505` a todas sus direcciones virtuales.**
Offset = 505

Busco 0xFA110.

    `0x3FF, 0xFA110`
    `0x3FF, 0xFA110`
        `0x3FF, 0xFA110`