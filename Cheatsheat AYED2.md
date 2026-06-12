// 1. Liberamos de adentro hacia afuera free(robot->codo->mano); robot->codo->mano = NULL; 
// Seguridad free(robot->codo); 
robot->codo = NULL; // Seguridad


gcc -Wall -Wextra -std=c99 -g tests.c robot.c -o tests

valgrind --leak-check=full ./tests


| **Condición del while**  | **¿Para qué sirve? (Objetivo Lógico)**                                                                 | **¿Dónde quedás parado al final?**                              | **Peligro Mortal (SegFault)**                                                                                                        |
| ------------------------ | ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `(curr != NULL)`         | **Procesar/Leer TODO.** Copiar la lista, imprimirla, destruirla entera.                                | Te caíste de la lista. `curr` vale `NULL`.                      | ¡Ninguno! Es 100% seguro incluso si la lista entra vacía.                                                                            |
| `(curr->next != NULL)`   | **Ir al último vagón.** Ideal para enganchar nodos nuevos al final de todo (`insert_back`).            | Quedás parado exactamente encima del **último nodo válido**.    | Si la lista está vacía (`curr` es `NULL`), intentar leer `->next` explota. Requiere un `if` previo.                                  |
| `(curr->next != target)` | **Buscar al anterior (`prev`).** Sirve para borrar un nodo del medio o insertar algo antes de un nodo. | Quedás parado en el nodo que está **justo antes** del objetivo. | Mismo peligro que arriba. Además, si el `target` no existe en la lista, te vas a caer al final e intentar hacer `NULL->next` y ¡PUM! |

b
aike  …/parciales 2/lab04-redo/ej4   main ✘!?    v16.1.1  ♡ 13:33  ./main 
Lista antes del append: [ 20, 10, 0, ]
Lista después del append: [ 20, 10, 0, 88, ]

![[Pasted image 20260610221553.png]]
![[Pasted image 20260610220308.png]]
![[Pasted image 20260610220322.png]]
Que es tad:
Como se implementa
Qué es poliformismo:
Cómo se implementa:
Listas enlazadas'


