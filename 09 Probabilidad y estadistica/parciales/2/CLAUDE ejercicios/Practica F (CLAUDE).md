
---

## ▶ 1. Estimador de Máxima Verosimilitud, Invarianza y Propiedades (2 puntos)

Sea $X_1, X_2, \dots, X_n$ una muestra aleatoria de variables independientes e idénticamente distribuidas provenientes de una población continua con función de densidad:

$$f(x; \theta) = \theta \, x^{\theta - 1}, \qquad 0 < x < 1, \quad \theta > 0$$

**a)** Obtenga analíticamente el estimador de máxima verosimilitud (EMV) de $\theta$, $\hat{\theta}_{MV}$. Plantee la función de verosimilitud $L(\theta)$, la log-verosimilitud $\ln L(\theta)$, obtenga el punto crítico mediante la primera derivada y demuestre formalmente que dicho punto maximiza la verosimilitud evaluando la segunda derivada.

**b)** Se toma una muestra de tamaño $n = 10$, cuyos registros arrojan que $\sum_{i=1}^{10} \ln(x_i) = -4{,}00$. Calcule el valor numérico estimado $\hat{\theta}_{MV, obs}$.

**c)** Utilizando la propiedad de invarianza del estimador de máxima verosimilitud y el valor obtenido en **b)**:
- Estime la probabilidad de que una nueva observación supere el valor $0{,}5$, es decir, estime $P(X > 0{,}5)$.
- Estime la mediana poblacional de la distribución (el valor $m$ tal que $P(X \le m) = 0{,}5$).

**d)** Considere ahora que se desea estimar la media poblacional $\mu = E(X) = \frac{\theta}{\theta + 1}$. Se proponen dos estimadores alternativos basados en la muestra:
$$\hat{\mu}_1 = \bar{X} = \frac{1}{n}\sum_{i=1}^n X_i \qquad \text{y} \qquad \hat{\mu}_2 = \frac{X_1 + 2X_n}{3}$$
- Demuestre si $\hat{\mu}_1$ y $\hat{\mu}_2$ son estimadores insesgados de $\mu$.
- Calcule las varianzas $V(\hat{\mu}_1)$ y $V(\hat{\mu}_2)$ en función de $V(X)$ y $n$. ¿Cuál de los dos estimadores tiene menor Error Cuadrático Medio ($\text{ECM}$)? Justifique.

---

## ▶ 2. Método de los Momentos con Parámetros Iguales (1,5 puntos)

Sea $X_1, X_2, \dots, X_n$ una muestra aleatoria de una distribución $\text{Beta}(\alpha, \beta)$ con soporte en $[0, 1]$, cuya función de densidad es:

$$g(x; \alpha, \beta) = \frac{1}{B(\alpha, \beta)} x^{\alpha - 1} (1 - x)^{\beta - 1}, \qquad 0 \le x \le 1$$

Se sabe que el primer y segundo momento teórico de esta distribución están dados por:
$$\mu = E(X) = \frac{\alpha}{\alpha + \beta} \qquad \text{y} \qquad \mu_2 = E(X^2) = \frac{\alpha(\alpha + 1)}{(\alpha + \beta)(\alpha + \beta + 1)}$$

Considere el caso particular en que ambos parámetros son iguales, es decir, $\alpha = \beta$.

**a)** Evalúe $E(X)$ bajo la condición $\alpha = \beta$. Explique conceptualmente por qué en este caso **no** es posible utilizar el primer momento muestral $m_1 = \bar{X}$ para obtener un estimador de $\alpha$.

**b)** Utilice el segundo momento poblacional $\mu_2 = E(X^2)$ y el segundo momento muestral $m_2 = \frac{1}{n}\sum_{i=1}^n X_i^2$ para deducir la fórmula del estimador por el método de los momentos de $\alpha$, $\hat{\alpha}_{mom}$.

**c)** Una muestra aleatoria de $n = 5$ observaciones arrojó los siguientes valores:
$$0{,}32 \qquad 0{,}48 \qquad 0{,}55 \qquad 0{,}62 \qquad 0{,}43$$
Calcule el valor de $m_2$ y obtenga la estimación puntual $\hat{\alpha}_{mom, obs}$.

---

## ▶ 3. Inferencia con Muestra Chica ($n < 30$, varianza desconocida) y Margen de Error (2 puntos)

Se analiza la resistencia a la tensión (en MPa) de una aleación metálica experimental. Se asume que la variable sigue una distribución normal con media $\mu$ y varianza $\sigma^2$ **desconocida**.

A partir de una muestra aleatoria de tamaño $n = 7$, se construyó un intervalo de confianza del 90 % bilateral para la resistencia media verdadera $\mu$, resultando:

$$\text{IC}_{90\%}(\mu) = (42{,}352; \; 47{,}648)$$

**a)** Explique por qué sería un error metodológico utilizar los cuantiles de la distribución Normal estándar $Z$ para trabajar con este intervalo. Indique qué distribución de probabilidad debe utilizarse y con cuántos grados de libertad ($\nu$).

**b)** A partir de los límites dados del intervalo del 90 %:
- Halle la media muestral observada $\bar{x}$.
- Halle la amplitud total del intervalo $A$ y el margen de error $ME$.
- Utilice el valor crítico correspondiente de la tabla para despejar el **error estándar estimado** utilizado ($SE = s/\sqrt{n}$) y deduzca el valor de la desviación estándar muestral observada $s$.

**c)** Con la media muestral $\bar{x}$ y el error estándar $SE$ hallados en **b)**, construya los intervalos de confianza para $\mu$ al **95 %** y al **99 %**.

**d)** Compare la amplitud de los tres intervalos (90 %, 95 % y 99 %). Explique claramente la relación matemática y conceptual entre el nivel de confianza ($1 - \alpha$), el valor crítico y el margen de error.

---

## ▶ 4. Inferencia sobre la Varianza Poblacional y Dualidad con Intervalos (1,5 puntos)

Una máquina calibradora de piezas automotrices debe operar garantizando una variabilidad muy reducida en el diámetro de los pernos. Se toma una muestra aleatoria de $n = 10$ pernos y se mide su diámetro (en mm), obteniéndose:
$$\bar{x} = 25{,}40 \text{ mm} \qquad \text{y} \qquad s = 0{,}08 \text{ mm} \quad (s^2 = 0{,}0064)$$
Se asume que el diámetro de los pernos se distribuye de manera aproximadamente normal con media $\mu$ y varianza $\sigma^2$.

**a)** Se desea contrastar si la varianza poblacional del proceso difiere del estándar admisible de $0{,}0025\text{ mm}^2$ al nivel de significación $\alpha = 0{,}05$.
- Enuncie formalmente las hipótesis nula ($H_0$) y alternativa ($H_a$).
- Escriba el estadístico de prueba correspondiente. Justifique por qué su distribución bajo $H_0$ es Chi-cuadrado ($\chi^2$) y **no** Normal estándar ($Z$), indicando sus grados de libertad.

**b)** Calcule el valor observado del estadístico de prueba ($\chi^2_{obs}$). Determine los valores críticos de la tabla Chi-cuadrado para un ensayo bilateral con $\alpha = 0{,}05$, defina la región de rechazo y concluya en el contexto del problema.

**c)** Construya un intervalo de confianza del 95 % para la varianza poblacional $\sigma^2$, y a partir de él obtenga el intervalo de confianza del 95 % para la desviación estándar poblacional $\sigma$.

**d)** Aplique el principio de **dualidad** entre pruebas de hipótesis e intervalos de confianza: determine la decisión sobre $H_0$ observando únicamente el intervalo hallado en **c)**. Explique detalladamente por qué ambas conclusiones son equivalentes.

---

## ▶ 5. Prueba de Hipótesis: Error de Tipo II ($\beta$), Potencia y P-valor (1,5 puntos)

La resistencia a la compresión del cemento utilizado en obras viales sigue una distribución normal con media $\mu$ y desviación estándar conocida $\sigma = 12\text{ kg/cm}^2$. La especificación técnica exige que la resistencia media no sea inferior a $100\text{ kg/cm}^2$.

Se toma una muestra aleatoria de $n = 36$ bloques para verificar si la resistencia media es significativamente inferior a la norma, planteando:
$$H_0: \mu = 100 \qquad \text{vs.} \qquad H_a: \mu < 100$$
Se fija un nivel de significación $\alpha = 0{,}05$.

**a)** Determine la región de rechazo en términos del estadístico estandarizado $Z$, y determine el valor crítico expresado en la escala original de la media muestral, $\bar{x}_c$ (es decir, la regla de decisión: *"Rechazar $H_0$ si $\bar{X} \le \bar{x}_c$"*).

**b)** Suponga que el verdadero promedio poblacional de la partida de cemento cayó a $\mu' = 95\text{ kg/cm}^2$.
- Calcule la probabilidad de cometer el **Error de Tipo II**, $\beta(95)$.
- Calcule la **potencia de la prueba** frente a dicha alternativa ($1 - \beta(95)$).
- Interprete en palabras qué significan el Error de Tipo I ($\alpha$), el Error de Tipo II ($\beta$) y la potencia en el contexto del control de calidad de la obra.

**c)** Tras ensayar los 36 bloques, la muestra arrojó una media observada $\bar{x}_{obs} = 96{,}20\text{ kg/cm}^2$. Calcule el valor observado del estadístico de prueba $z_{obs}$ y obtenga el **P-valor (valor-p)** exacto de la prueba.

**d)** Enuncie la regla de decisión basada en el P-valor y tome la conclusión tanto para $\alpha = 0{,}05$ como para $\alpha = 0{,}01$.

---

## ▶ 6. Muestras Pareadas (Datos Apareados), Margen de Error y Conclusión por IC (1,5 puntos)

Para comprobar la efectividad de un programa de entrenamiento físico destinado a reducir el tiempo de respuesta motriz, se evalúa a un grupo de $n = 25$ atletas antes y después de completar el programa.

Para cada atleta $i$ se define la diferencia $d_i = x_i - y_i$, donde:
- $x_i$: tiempo de respuesta antes del entrenamiento (en centésimas de segundo).
- $y_i$: tiempo de respuesta después del entrenamiento (en centésimas de segundo).

Los estadísticos muestrales calculados a partir de las diferencias resultaron:
$$\bar{d} = 3{,}40 \qquad \text{y} \qquad s_d^2 = 3{,}24 \quad (s_d = 1{,}80)$$
Se asume que las diferencias $D = X - Y$ se distribuyen de forma aproximadamente normal con media $\mu_d$ y varianza desconocida.

**a)** Explique la diferencia fundamental entre un esquema de **muestras pareadas (o apareadas)** y uno de **dos muestras independientes**. ¿Por qué este problema se reduce formalmente a una inferencia de una sola muestra?

**b)** Calcule el error estándar estimado ($SE$), el margen de error ($ME$) y construya un intervalo de confianza del 95 % para la verdadera diferencia media poblacional $\mu_d = \mu_X - \mu_Y$.

**c)** Utilice **exclusivamente el intervalo de confianza** obtenido en **b)** para concluir si existe evidencia estadísticamente significativa de que el programa de entrenamiento modifica el tiempo medio de respuesta (prueba bilateral $H_0: \mu_d = 0$ vs. $H_a: \mu_d \ne 0$ al nivel $\alpha = 0{,}05$). Justifique formalmente según el criterio de pertenencia del valor nulo.

**d)** Calcule el estadístico de prueba observado $t_{obs}$ y determine (o acote mediante la tabla $t$-Student) el **P-valor** de la prueba. Verifique que la decisión adoptada sea consistente con la obtenida a través del intervalo de confianza.
