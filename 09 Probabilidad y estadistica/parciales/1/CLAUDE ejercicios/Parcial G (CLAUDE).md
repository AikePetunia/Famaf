# Probabilidad y Estadística — Práctica temática G (CLAUDE ejercicios)


| 1a  | 1b  | 1c  | 1d  | 2a  | 2b  | 2c  | 2d  | 2e  | 3a  | 3b  | 3c  | 3d  | 4a  | 4b  | 4c  | 4d  | 5a  | 5b  | 5c  | 5d  | 5e  | 5f  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |

---

## ▶ 1. (1,5 puntos)

Una máquina estampa logos en tazas. Cada taza que sale tiene probabilidad $p = 0{,}12$ de tener el estampado mal centrado, independientemente de las demás. Se elige **una sola** taza al azar.

Sea $X = 1$ si la taza está mal centrada, $X = 0$ si no.

**a)** Escriba la función de probabilidad de masa de $X$ y calcule $E(X)$ y $V(X)$.

**b)** Se eligen **dos** tazas de forma independiente. Calcule la probabilidad de que ambas estén mal centradas y la probabilidad de que **al menos una** esté mal centrada.

**c)** Sea $Y$ el número de tazas mal centradas entre las dos elegidas en b). Escriba la función de probabilidad de masa de $Y$ y obtenga $E(Y)$ y $V(Y)$ únicamente a partir de las propiedades de $X_1 + X_2$ con $X_1, X_2$ independientes, sin invocar fórmulas de otra distribución. Verifique que $E(Y) = 2\,E(X)$ y $V(Y) = 2\,V(X)$.

**d)** Dado que al menos una de las dos tazas está mal centrada, ¿cuál es la probabilidad de que las **dos** lo estén?

---

## ▶ 2. (2 puntos)

Un examen de conducir consta de **20 preguntas de opción múltiple**, cada una con 4 opciones de las cuales exactamente una es correcta. Un estudiante que no estudió nada elige cada respuesta completamente al azar, de forma independiente de las demás. Aprueba quien acierta al menos 12 preguntas.

**a)** ¿Cuál es la probabilidad de que el estudiante acierte exactamente 5 preguntas?

**b)** ¿Cuál es la probabilidad de que acierte **como mucho** 2 preguntas?

**c)** ¿Cuál es la probabilidad de que acierte **al menos** 1 pregunta?

**d)** Calcule el número esperado de aciertos y la varianza. ¿Cuántas preguntas esperaría acertar un estudiante que sí estudió y tiene probabilidad $0{,}8$ de acertar cada pregunta?

**e)** El estudiante que no estudió rinde el examen junto con otros 9 compañeros que tampoco estudiaron, todos de forma independiente. ¿Cuál es la probabilidad de que exactamente **3 de los 10** aprueben el examen? Calcule primero la probabilidad de que un solo estudiante apruebe.

 f) Probabilidad Condicional directa (restricción del universo)

Suponga que el estudiante que **no estudió** ya respondió correctamente las primeras $10$ preguntas (por pura suerte) y contesta las $10$ restantes al azar e independientemente.
1. ¿Cuál es la probabilidad de que apruebe el examen dado este hecho?
2. Compare este resultado con el caso en que aún no respondió nada y responda: el evento _"aprobar el examen"_ y el evento _"acertar las primeras 10 preguntas"_, ¿son independientes? Justifique con la definición formal.
    

 g) Ley de Probabilidad Total (partición de estudiantes)
En la escuela de manejo, el $70\%$ de los alumnos **sí estudió** (probabilidad $0{,}8$ de acertar cada pregunta) y el $30\%$ restante **no estudió** (probabilidad $0{,}25$ de acertar cada pregunta). Se elige un alumno al azar que rindió el examen.

- Calcule la probabilidad total de que este alumno haya **aprobado** el examen. (Sugerencia: use el dato de tabla/calculadora $P(X \ge 12 \mid \text{Estudió}) \approx 0{,}9900$ y el valor ya calculado $P(X \ge 12 \mid \text{No estudió}) \approx 0{,}000935$).
    

 h) Teorema de Bayes (probabilidad inversa: efecto $\to$ causa)

Con los mismos datos del inciso **g)**, usted revisa una planilla al azar y observa que el alumno **aprobó** el examen.

- ¿Cuál es la probabilidad de que ese alumno sea uno de los que **no estudió** y haya aprobado por puro azar?
    
- ¿Y si en cambio el alumno **desaprobó**, cuál es la probabilidad de que haya sido uno de los que **sí estudió**?
    

 i) Con independencia vs. Sin independencia (con reposición vs. sin reposición)

En el aula hay un grupo de exactamente **$10$ alumnos**: $7$ que estudiaron y $3$ que no estudiaron. El examinador llama a **dos alumnos sucesivamente** para revisar sus exámenes.

1. **Con independencia (con reposición):** Si tras revisar el primer examen lo devuelve al montón y vuelve a mezclar antes de sacar el segundo, ¿cuál es la probabilidad de que ambos alumnos elegidos hayan estudiado? ¿Cuál es la probabilidad de que el segundo haya estudiado dado que el primero no estudió?
    
2. **Sin independencia (sin reposición):** Si aparta el primer examen antes de tomar el segundo, calcule la probabilidad de que ambos hayan estudiado y la probabilidad marginal de que el segundo alumno elegido haya estudiado.
    

 j) Combinación de Bayes + Binomial (evidencia parcial en el examen)

Un alumno elegido al azar de la escuela ($70\%$ estudió, $30\%$ no estudió) responde las primeras $5$ preguntas del examen y se observa que **acertó exactamente $2$** de esas $5$.

- Dado este resultado parcial en las primeras $5$ preguntas, ¿cuál es la probabilidad actualizada (a posteriori) de que el alumno **haya estudiado**?
- 
---

## ▶ 3. (2 puntos)

Una empresa de telemarketing realiza llamadas hasta conseguir la **primera** venta. La probabilidad de que cada llamada resulte en venta es $p = 0{,}15$, y las llamadas son independientes.

**a)** ¿Cuál es la probabilidad de que la primera venta se produzca exactamente en la **cuarta** llamada?

**b)** ¿Cuál es la probabilidad de que hagan falta **más de 6** llamadas para lograr la primera venta?

**c)** Calcule el número esperado de llamadas hasta la primera venta y la varianza correspondiente.

**d)** Ya se realizaron 6 llamadas sin conseguir ninguna venta. ¿Cuál es la probabilidad de que hagan falta **más de 4 llamadas adicionales** para lograr la primera venta? Justifique la propiedad que utiliza.

---

## ▶ 4. (2 puntos)

Un inspector de calidad examina piezas de una línea de producción una por una. Cada pieza es defectuosa con probabilidad $p = 0{,}20$, de forma independiente. El inspector detiene la revisión cuando encuentra la **tercera** pieza defectuosa.

**a)** ¿Cuál es la probabilidad de que el inspector examine exactamente **10 piezas** en total?

**b)** ¿Cuál es la probabilidad de que necesite examinar **a lo sumo 6** piezas? Enumere todos los casos posibles.

**c)** Calcule el número esperado de piezas examinadas hasta encontrar la tercera defectuosa, y la varianza.

**d)** Se sabe que la **primera** pieza examinada fue defectuosa. Dado este dato, ¿cuál es la probabilidad de que el inspector examine exactamente **10 piezas** en total? Escriba la expresión correcta antes de calcular y justifique el denominador.

---

## ▶ 5. (2,5 puntos)

Una planta embotelladora tiene dos líneas de producción. La línea **A** produce el 55 % de las botellas y la línea **B** el 45 % restante. El volumen (en ml) de las botellas de la línea A sigue una distribución normal con media 502 y desvío estándar 4; el de las de la línea B, una distribución normal con media 498 y desvío estándar 6. Una botella se considera **apta** si su volumen está entre 492 ml y 510 ml.

**a)** Calcule por separado la probabilidad de que una botella de la línea A sea apta y la probabilidad de que una botella de la línea B sea apta.

**b)** Si se elige una botella al azar de **toda** la producción, ¿cuál es la probabilidad de que sea apta?

**c)** Una botella elegida al azar **no** es apta. ¿Cuál es la probabilidad de que sea de la línea B?

**d)** ¿Por debajo de qué volumen quedan el 10 % de las botellas de la línea A? *(Percentil 10 de la línea A.)*

**e)** ¿Entre qué dos volúmenes, simétricos respecto a la media de la línea B, se encuentra el 90 % central de las botellas de la línea B?

**f)** De un lote de **8 botellas** tomadas al azar de la **línea A**, de forma independiente, ¿cuál es la probabilidad de que **al menos 7** sean aptas? Use el resultado de a).
