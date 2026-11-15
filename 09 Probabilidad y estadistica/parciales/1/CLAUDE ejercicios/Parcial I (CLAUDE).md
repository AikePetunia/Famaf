# Probabilidad y Estadística — Parcial I (práctica I, CLAUDE ejercicios)

> Modelo de examen de práctica estructurado en 4 ejercicios (10 puntos en total), calibrado con el formato, nivel y temáticas del Parcial I 2026 y los parciales 2024–2025 de FaMAF.
>
> **Pautas del examen:**
> - El enunciado no indica qué distribución, teorema o propiedad debe utilizarse en cada caso; la identificación del modelo forma parte de la evaluación.
> - Los conceptos de probabilidad condicional, probabilidad total e inferencia Bayesiana se evalúan de forma integrada en los distintos contextos.
> - Convención: decimales con **coma**, cuantiles $\Phi(z)$ con 2 decimales en $z$, y resultados finales redondeados a 4 decimales.

| 1a | 1b | 1c | 1d | 2a | 2b | 2c | 2d | 3a | 3b | 3c | 3d | 3e | 4a | 4b | 4c | 4d | 4e |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2 puntos)

Un centro de soporte técnico atiende computadoras portátiles corporativas. Al recibir un equipo, se registran dos variables de interés:
- $X$: tiempo previo de diagnóstico asignado (en horas), con valores posibles en $\{1, 2\}$.
- $Y$: cantidad de componentes que requieren reemplazo físico, con valores posibles en $\{0, 1, 2\}$.

La función de probabilidad de masa conjunta $p(x, y) = P(X = x, Y = y)$ se describe en la siguiente tabla:

| $p(x, y)$ | $Y = 0$ | $Y = 1$ | $Y = 2$ |
|:---:|:---:|:---:|:---:|
| **$X = 1$** | 0,15 | 0,25 | 0,10 |
| **$X = 2$** | 0,05 | 0,20 | 0,25 |

**a)** Encuentre las funciones de probabilidad de masa marginales de $X$ y de $Y$.

**b)** Calcule las esperanzas $E(X)$ y $E(Y)$, y las varianzas $V(X)$ y $V(Y)$.

**c)** Calcule la covarianza $\text{Cov}(X, Y)$ y el coeficiente de correlación lineal $\rho(X, Y)$. Interprete el significado del signo y la magnitud de $\rho(X, Y)$ en el contexto del problema.

**d)** Si se sabe que un equipo demandó 2 horas de diagnóstico ($X = 2$), ¿cuál es la probabilidad de que deba reemplazársele al menos un componente ($Y \ge 1$)?

---

## ▶ 2. (2 puntos)

Un equipo de ingeniería realiza pruebas de estrés sobre instancias de bases de datos distribuidas. En cada prueba individual, la instancia falla ante una sobrecarga de tráfico con probabilidad $p = 0{,}25$, de manera independiente entre una prueba y otra.

El protocolo exige ejecutar pruebas consecutivas hasta registrar exactamente **4 fallas** para dar por concluido el informe de estabilidad.

**a)** ¿Cuál es la probabilidad de que se requiera ejecutar exactamente 10 pruebas para completar el informe?

**b)** Calcule el número esperado y el desvío estándar de pruebas necesarias hasta completar el informe.

**c)** Suponga que ya se han ejecutado las primeras 6 pruebas y en ellas se observaron exactamente 3 fallas. ¿Cuál es la probabilidad de que el informe se complete exactamente en la prueba número 8? Justifique su planteo.

**d)** Si en una etapa preliminar se decide aplicar un ensayo fijo de **12 pruebas**, ¿cuál es la probabilidad de registrar al menos 2 fallas en total?

---

## ▶ 3. (3 puntos)

Sean $X$ e $Y$ dos variables aleatorias continuas cuya función de densidad de probabilidad conjunta está dada por:

$$f(x, y) = \begin{cases} 2(x + y) & \text{si } 0 \le y \le x \le 1 \\ 0 & \text{en otro caso} \end{cases}$$
**b)** Obtenga las funciones de densidad marginales $f_X(x)$ y $f_Y(y)$. Verifique formalmente que ambas integran 1 en sus respectivos dominios.

**c)** Determine si las variables aleatorias $X$ e $Y$ son independientes. Justifique su respuesta utilizando las densidades marginales obtenidas en **b)** y las características geométricas del soporte.

**d)** Calcule $E(X)$, $E(Y)$, $\text{Cov}(X, Y)$ y el coeficiente de correlación $\rho(X, Y)$.

**e)** Si se observa que $X = 0{,}6$, determine la función de densidad condicional $f_{Y \mid X}(y \mid 0{,}6)$ y calcule $P(Y \le 0{,}3 \mid X = 0{,}6)$.

---

## ▶ 4. (3 puntos)

Una planta siderúrgica elabora varillas de acero estructural mediante dos líneas de laminado: la línea **A** (que produce el 65 % de las piezas) y la línea **B** (que produce el 35 % restante).

Se sabe que la longitud (en cm) de las varillas elaboradas por la línea A se modela mediante una distribución normal con media $\mu_A = 200\text{ cm}$ y desviación estándar $\sigma_A = 2\text{ cm}$. Por su parte, la longitud de las varillas elaboradas por la línea B sigue una distribución normal con media $\mu_B = 201\text{ cm}$ y desviación estándar $\sigma_B = 2{,}5\text{ cm}$.

Una varilla se considera **conforme a las especificaciones técnicas** si su longitud está comprendida en el intervalo $[197\text{ cm}, 204\text{ cm}]$.

**a)** Calcule la probabilidad de que una varilla elegida al azar sea conforme a las especificaciones si proviene de la línea A, y calcule la probabilidad correspondiente si proviene de la línea B.

**b)** Si se toma una varilla al azar de toda la producción acumulada de la planta, ¿cuál es la probabilidad de que resulte conforme a las especificaciones técnicas?

**c)** Si una varilla seleccionada al azar de la producción **no** cumple con las especificaciones técnicas, ¿cuál es la probabilidad de que haya sido fabricada por la línea B?

**d)** Para optimizar el corte en la línea A, los ingenieros necesitan identificar la cota superior crítica: ¿qué longitud es superada únicamente por el 5 % de las varillas más largas producidas por la línea A?

**e)** Si se toma una muestra de **6 varillas** producidas de forma independiente por la línea A, ¿cuál es la probabilidad de que al menos 5 de ellas cumplan con las especificaciones técnicas?
