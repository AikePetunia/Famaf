# Probabilidad y Estadística — Parcial I (práctica F, CLAUDE ejercicios)

> Armado a partir del análisis del Parcial I 2026 (nota 4): el usuario hizo bien la mayor parte del ej. 1, solo parte del ej. 3, y todo bien el ej. 4. Los puntos débiles identificados son **probabilidad condicional mal planteada** (denominador incorrecto), **Bayes cuando el evento condicionante no es sencillo**, **independencia discreta y continua**, **marginales de una densidad conjunta**, e **identificación de modelos de conteo** (Geométrica vs. Binomial Negativa vs. Binomial vs. Hipergeométrica).
>
> Se incorpora un ejercicio tipo ej. 3 del parcial real (distribución conjunta discreta con tabla, cov, correlación e independencia), Binomial Negativa y Geométrica en el mismo ejercicio, y covarianza/correlación de una distribución continua.
>
> No se recicla ningún enunciado ni ninguna fórmula de los parciales A–E ni del Parcial I 2026. El lenguaje es el de los parciales y prácticos de la cátedra: "función de probabilidad de masa", "densidad marginal", "distribución acumulada", "coma decimal", etc.
>
> Convención: decimales con **coma**, $\Phi$ de tabla con 2 decimales, 4 decimales en los resultados. Tiempo sugerido: 2 h.

| 1a | 1b | 1c | 1d | 1e | 2a | 2b | 2c | 2d | 2e | 3a | 3b | 3c | 3d | 3e | 4a | 4b | 4c | 4d | 5a | 5b | 5c | 5d |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2,5 puntos)

Una caja de galletitas de una marca contiene $n=14$ galletitas, de las cuales $M=5$ están recubiertas de chocolate y el resto son simples. Se extraen $m=4$ galletitas **sin reposición**.

Sea $X$ = número de galletitas con chocolate entre las 4 extraídas.

**a)** Identifique la distribución de $X$, especificando todos sus parámetros. ¿Cuál es el valor de $E(X)$?

**b)** Calcule $P(X=2)$ y $P(X\ge3)$.

**c)** Calcule $V(X)$.

**d)** Si en cambio las galletitas se extrajesen **con reposición** (es decir, independientemente, con probabilidad constante de chocolate $p=5/14$ en cada extracción), ¿qué distribución tendría $X'$? ¿Sería mayor, menor o igual la varianza respecto al caso sin reposición? Justifique sin calcular.

**e)** Ahora se extraen galletitas **con reposición** (con prob. $p=5/14$), **de a una**, **hasta sacar la segunda** con chocolate. Sea $W$ el número total de extracciones realizadas. Identifique la distribución de $W$, calcule $P(W=5)$ y $E(W)$.

---

## ▶ 2. (2,5 puntos)

En una planta industrial se fabrican artículos en tres turnos: el turno mañana produce el 40 % del total, el turno tarde produce el 35 % y el turno noche produce el 25 % restante. Las tasas de artículos con algún defecto son 3 %, 5 % y 8 % en mañana, tarde y noche, respectivamente. 

Sea $D$ el evento "el artículo tiene algún defecto" y sean $M$, $T$, $N$ los eventos correspondientes al turno de producción.

**a)** Calcule la probabilidad de que un artículo elegido al azar tenga algún defecto.

**b)** Se elige un artículo al azar y resulta **sin** defecto. Calcule la probabilidad de que haya sido producido en el turno **noche**.

**c)** ¿Son independientes los eventos $D$ y $N$? Justifique con la definición.

**d)** Se eligen al azar 3 artículos producidos en el turno noche, de forma independiente. ¿Cuál es la probabilidad de que al menos uno tenga algún defecto?

**e)** Ahora se eligen al azar 3 artículos del total de la producción (sin saber de qué turno son), de forma independiente. ¿Cuál es la probabilidad de que exactamente 1 sea defectuoso? *(Use la probabilidad calculada en a).)*

---

## ▶ 3. (2,5 puntos)

Para cada cliente de una tienda online se registran $X$ = número de veces que ese día visitó la página sin comprar ($X\in\{0,1,2\}$) e $Y$ = número de artículos que compró ese día ($Y\in\{0,1,2\}$). La función de probabilidad conjunta es:

| $p(x,y)$ | $Y=0$ | $Y=1$ | $Y=2$ |
|---|---|---|---|
| $X=0$ | 0,05 | 0,10 | 0,15 |
| $X=1$ | 0,10 | 0,20 | $a$ |
| $X=2$ | 0,15 | $b$ | 0,05 |

**a)** Determine $a$ y $b$ sabiendo que $E(X) = 1$. Halle las distribuciones marginales de $X$ e $Y$.

**b)** Calcule $E(Y)$, $V(X)$ y $V(Y)$.

**c)** Calcule $E(XY)$, $\text{Cov}(X,Y)$ y el coeficiente de correlación $\rho(X,Y)$. ¿Son $X$ e $Y$ independientes? Justifique usando la tabla.

**d)** Una visita sin compra genera un costo de $\$2$ (seguimiento de comportamiento) y cada artículo comprado genera un ingreso de $\$8$. Sea $G = 8Y - 2X$ la ganancia neta del cliente ese día. Calcule $E(G)$ y $V(G)$.

**e)** Calcule $P(Y \ge 1 \mid X = 2)$ y $P(X \ge 1 \mid Y \ge 1)$.

---

## ▶ 4. (2 puntos)

Sean $X$ e $Y$ los tiempos de espera (en minutos) de dos clientes distintos que llegan a una ventanilla bancaria, con densidad conjunta

$$f(x,y)=\begin{cases} c\,(2x + y) & 0 \le x \le 2,\; 0 \le y \le 1 \\ 0 & \text{en otro caso} \end{cases}$$

**a)** Determine $c$.

**b)** Halle las densidades marginales $f_X(x)$ y $f_Y(y)$.

**c)** ¿Son $X$ e $Y$ independientes? Justifique.

**d)** Calcule $E(X)$, $E(Y)$, $V(X)$, $V(Y)$, $\text{Cov}(X,Y)$ y el coeficiente de correlación $\rho(X,Y)$. Interprete el signo de la correlación.

---

## ▶ 5. (2 puntos)

Una empresa de transporte tiene dos tipos de vehículos: furgonetas (40 % de la flota) y camionetas (60 %). El tiempo hasta la primera falla mecánica (en meses) de una furgoneta se modela como exponencial con media 18 meses; el de una camioneta, como exponencial con media 12 meses.

**a)** Si se elige un vehículo al azar de la flota, calcule la probabilidad de que supere los 15 meses sin ninguna falla mecánica.

**b)** Un vehículo elegido al azar supera los 15 meses sin falla. Calcule la probabilidad de que sea una furgoneta.

**c)** Se eligen al azar, **de forma independiente**, 5 camionetas. ¿Cuál es la probabilidad de que exactamente 3 de ellas superen los 15 meses sin falla?

**d)** Una furgoneta lleva ya 10 meses en servicio sin falla. ¿Cuál es la probabilidad de que falle en los próximos 8 meses? Justifique la propiedad que use.

---
