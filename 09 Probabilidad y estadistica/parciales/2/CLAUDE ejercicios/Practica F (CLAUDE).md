# Probabilidad y Estadística — Parcial II (práctica F, CLAUDE ejercicios)

> **Simulacro de examen calibrado con el formato, nivel y extensión real de FaMAF (Parciales II 2025 y 2026).**
>
> Diseñado para practicar directamente los 4 puntos flojos del examen sin sobrecarga matemática:
> 1. **Máxima Verosimilitud e Invarianza:** Deducción de $\hat{\lambda}_{MV}$ (con derivadas), estimación con muestra y uso de invarianza.
> 2. **Muestra chica ($n < 30$, $\sigma$ desconocida):** Uso de $t$-Student (¡no $Z$!), despeje de error estándar y comparación de anchos.
> 3. **Inferencia de Varianza:** Uso de Chi-cuadrado $\chi^2$ (¡no $Z$!), IC para $\sigma^2$ y **conclusión por dualidad con el intervalo**.
> 4. **Datos Apareados:** Construcción de IC para $\mu_d$, **conclusión del test mediante el IC** y cálculo del P-valor.
> 5. **Momentos e Insesgamiento:** Comprobación directa de insesgamiento y deducción simple por método de los momentos.
>
> **Convención:** Coma decimal ($,$), valores críticos de tablas habituales de la cátedra y resultados con 4 decimales (o redondeo natural).

| 1a | 1b | 1c | 2a | 2b | 2c | 3a | 3b | 3c | 4a | 4b | 4c | 5a | 5b |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. Máxima Verosimilitud e Invarianza (2 puntos)

El tiempo de espera $X$ (en minutos) en la fila de atención rápida de un banco sigue una distribución exponencial con parámetro de tasa $\lambda > 0$, cuya función de densidad es:

$$f(x; \lambda) = \begin{cases} \lambda e^{-\lambda x} & \text{si } x > 0 \\ 0 & \text{en otro caso} \end{cases}$$

**a)** A partir de una muestra aleatoria $X_1, X_2, \dots, X_n$, obtenga el estimador de máxima verosimilitud de $\lambda$, $\hat{\lambda}_{MV}$. Escriba la función de verosimilitud $L(\lambda)$, la log-verosimilitud $\ln L(\lambda)$, halle el punto crítico igualando la primera derivada a cero y verifique que es un máximo con la segunda derivada.

**b)** Se registran los tiempos de espera de $n = 5$ clientes elegidos al azar:
$$1{,}5 \qquad 3{,}0 \qquad 2{,}0 \qquad 4{,}5 \qquad 1{,}5$$
Calcule la media muestral $\bar{x}$ y obtenga la estimación puntual de $\lambda$ usando el estimador hallado en **a)**.

**c)** Utilizando la propiedad de invarianza del estimador por máxima verosimilitud y el resultado de **b)**, estime la probabilidad de que un cliente espere a lo sumo 2 minutos en la fila, es decir, estime $P(X \le 2)$.

---

## ▶ 2. Muestra Chica con Varianza Desconocida (2 puntos)

El intervalo de confianza del 95 % para la resistencia media a la tracción $\mu$ de un nuevo polímero con distribución normal y varianza desconocida fue $(38{,}22; \; 41{,}78)$, construido a partir de una muestra de tamaño $n = 5$.

**a)** Indique qué distribución de probabilidad corresponde utilizar para modelar este intervalo y con cuántos grados de libertad ($\nu$). A partir de las cotas del intervalo dado, encuentre el **error estándar** ($SE = s/\sqrt{n}$) que se utilizó para construirlo.

**b)** Si ahora usted considera que es preferible reportar un intervalo de confianza del **99 %**, ¿cuáles son las nuevas cotas de este intervalo?

**c)** ¿Cómo espera que sea el ancho del intervalo del 99 % comparado con el del 95 %? Justifique conceptualmente.

---

## ▶ 3. Inferencia para la Varianza y Dualidad con Intervalos (2 puntos)

Una máquina envasadora de harina debe operar de manera que la variabilidad en el peso de los paquetes sea muy baja. Se toma una muestra aleatoria de $n = 10$ paquetes y se obtiene una desviación estándar muestral de $s = 4\text{ g}$ ($s^2 = 16$). Se supone que el peso de los paquetes sigue una distribución aproximadamente normal.

**a)** Diseñe un test de hipótesis de nivel $\alpha = 0{,}05$ para evaluar si la varianza poblacional difiere de $9$ ($H_0: \sigma^2 = 9$ vs. $H_a: \sigma^2 \ne 9$). Indique el estadístico de prueba correspondiente, su distribución bajo $H_0$ con sus grados de libertad, determine los valores críticos en la tabla Chi-cuadrado y tome una decisión en el contexto del problema.

**b)** Construya un intervalo de confianza del 95 % para la varianza poblacional $\sigma^2$.

**c)** Compare ambas respuestas: ¿cómo se relaciona la decisión adoptada en el test del inciso **a)** con la pertenencia del valor nulo $\sigma_0^2 = 9$ dentro del intervalo hallado en **b)**? Explique el principio de dualidad.

---

## ▶ 4. Datos Apareados y Conclusión por Intervalo de Confianza (2 puntos)

Para evaluar si un programa de capacitación reduce el tiempo que tardan los empleados en procesar un trámite, se toma una muestra de $n = 25$ empleados y se registra su tiempo antes ($X$) y después ($Y$) de realizar el curso.

Para cada empleado se calcula la diferencia $d_i = x_i - y_i$ (tiempo antes menos tiempo después), obteniéndose los siguientes estadísticos muestrales:
$$\bar{d} = 3{,}60\text{ minutos} \qquad \text{y} \qquad s_d = 2{,}50\text{ minutos}$$
Se asume que la distribución de las diferencias es aproximadamente normal con media $\mu_d$ y varianza desconocida.

**a)** Calcule el margen de error y construya un intervalo de confianza del 95 % para la diferencia media poblacional $\mu_d = \mu_X - \mu_Y$.

**b)** Utilice **exclusivamente el intervalo de confianza** construido en **a)** para concluir si existe evidencia significativa al nivel del 5 % de que el programa reduce el tiempo medio de procesamiento (contraste bilateral $H_0: \mu_d = 0$ vs. $H_a: \mu_d \ne 0$). Justifique según la posición del valor $0$ respecto al intervalo.

**c)** Calcule el estadístico de prueba observado $t_{obs}$ y concluya respecto al P-valor de la prueba. Verifique que la conclusión coincide con la del inciso **b)**.

---

## ▶ 5. Insesgamiento y Método de los Momentos (2 puntos)

**a)** Sea $X_1, X_2, \dots, X_n$ una muestra aleatoria de variables independientes con media común $\mu = E(X)$ y varianza $\sigma^2$. Considere los siguientes dos estimadores para $\mu$:
$$\hat{\mu}_1 = \bar{X} = \frac{1}{n}\sum_{i=1}^n X_i \qquad \text{y} \qquad \hat{\mu}_2 = \frac{X_1 + X_n}{2}$$
Demuestre formalmente si $\hat{\mu}_1$ y $\hat{\mu}_2$ son estimadores insesgados de $\mu$ aplicando las propiedades de la esperanza matemática.

**b)** Sea $Y_1, Y_2, \dots, Y_n$ una muestra aleatoria de una variable con distribución de Pareto cuyo valor esperado poblacional es:
$$E(Y) = \frac{\theta}{\theta - 1}, \qquad \text{con } \theta > 1$$
- Obtenga la fórmula del estimador de $\theta$ por el método de los momentos, $\hat{\theta}_{mom}$, igualando el momento muestral $\bar{Y}$ a la esperanza teórica $E(Y)$.
- Si una muestra de $n = 6$ datos arroja una media muestral $\bar{y} = 1{,}50$, calcule el valor numérico de la estimación $\hat{\theta}_{mom, obs}$.
