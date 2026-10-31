# Probabilidad y Estadística — Parcial II (práctica E, CLAUDE ejercicios)

> Armado con el estilo de los parciales 2024/2025 (misma profe): 8 ejercicios, 16 puntos. Segundo refuerzo (complementa a la Práctica D): acá el foco es **proporción/Binomial con p-valor exacto**, **dos poblaciones con variantes que no habían salido** (diferencia $d_0\ne0$, apareadas asintóticas), y un ejercicio **integrador** para practicar la decisión "¿qué Caso es?" de punta a punta.
> Todos los ejercicios de dos muestras y de proporciones son **adaptaciones literales de las Guías oficiales 7 y 8**. Completa a las prácticas A, B, C y D (no se repiten los mismos sub-temas).
> Convención: z, t y χ² con 4 decimales; resultados finales con 4 decimales (o redondeo natural si es un n de muestra).

| 1a | 1b | 1c | 1d | 2a | 2b | 2c | 2d | 3a | 3b | 3c | 4a | 4b | 4c | 4d | 5a | 5b | 5c | 5d | 6a | 6b | 6c | 6d | 7a | 7b | 7c | 8a | 8b | 8c |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2 puntos) Binomial exacta: elegir región de rechazo, Tipo I, Tipo II

*(Adaptado de Guía 7, Ej. 11.)* Dos empresas de TV por cable quieren instalarse en una región. Sea $p$ la proporción de suscriptores potenciales que prefieren la primera empresa. Se toma una muestra de $n=16$ para probar $H_0:p=0.5$ contra $H_A:p\ne0.5$, con $X=$ cantidad de la muestra que prefiere la primera empresa. Se proponen tres regiones de rechazo candidatas:
$$R_1=\{x\le3 \text{ o } x\ge13\}\qquad R_2=\{x\le4\}\qquad R_3=\{x\ge12\}$$

**a)** ¿Cuál de las tres es la más adecuada para este $H_A$? Justifique (no alcanza con calcular, hay que pensar la forma de $H_A$).
**b)** ¿Cuál es la distribución de $X$ bajo $H_0$? Úsela para calcular la probabilidad de Error de Tipo I de la región elegida en a).
**c)** Calcule la probabilidad de Error de Tipo II, $\beta(p)$, de esa región para $p=0.2,\ 0.4,\ 0.6,\ 0.8$.
**d)** Si $5$ de los $16$ favorecieron a la primera empresa, ¿qué concluye?

---

## ▶ 2. (2 puntos) Binomial con $n$ grande: p-valor exacto vs. aproximación normal

*(Adaptado de Guía 7, Ej. 13.)* Se usó un robot para ensamblar $500$ cables de computadora y se encontraron $5$ defectuosos. Los ensambladores humanos tienen una tasa de defectos del $3\%$. ¿Apoya esto la hipótesis de que los robots producen una proporción **menor** de defectuosos que los humanos?

**a)** Plantee $H_0$ y $H_A$.
**b)** Calcule el p-valor **exacto**, usando la distribución Binomial($500, 0.03$) de $X=$ cantidad de defectuosos (sin aproximar).
**c)** Calcule el p-valor **aproximado**, usando el estadístico $Z=\dfrac{X-np_0}{\sqrt{np_0(1-p_0)}}$ con corrección por continuidad ($P(X\le5)\approx P\!\left(Z\le\frac{5+0.5-np_0}{\sqrt{np_0(1-p_0)}}\right)$), y compárelo con b).
**d)** Concluya a un nivel de significación de $0.01$.

---

## ▶ 3. (2 puntos) Proporción, muestra grande: sensibilidad a $\alpha$ e IC

*(Adaptado de Guía 7, Ej. 12.)* Una muestra aleatoria de $150$ donaciones en un banco de sangre revela que $92$ eran de sangre tipo A. Se quiere ver si el porcentaje real de donantes tipo A difiere del $40\%$ que se considera poblacional.

**a)** Plantee $H_0$, $H_A$ y calcule $z_{obs}$ (ojo: el error estándar del estadístico de prueba usa $p_0$, no $\hat p$).
**b)** Decida con $\alpha=0.01$ y con $\alpha=0.05$. ¿Cambia la conclusión entre ambos niveles? *(A diferencia de otros ejercicios de este repaso donde sí cambiaba, acá no — piense por qué, en términos de qué tan "lejos" quedó $z_{obs}$ de cualquiera de los dos valores críticos.)*
**c)** Construya un IC del 90 % para la proporción real de donantes tipo A (acá sí con $\hat p$ en el error estándar) y compare su conclusión con la de b).

---

## ▶ 4. (2 puntos) Dos muestras independientes, Welch: acotar el p-valor

*(Adaptado de Guía 8, Ej. 5.)* Se cree que las personas infectadas por *E-canis* tienen, en promedio, un recuento de glóbulos blancos más bajo que las no infectadas (ambas poblaciones normales). Para $n_1=15$ personas infectadas, $\bar x_1=4767/mm^3$ y $s_1=3204/mm^3$. Para $n_2=10$ personas sanas, $\bar x_2=7360/mm^3$ y $s_2=2415/mm^3$. No se supone que las varianzas poblacionales sean iguales.

**a)** Plantee $H_0:\mu_1=\mu_2$ contra la $H_A$ que corresponde a la creencia enunciada.
**b)** Calcule $t_{obs}$ (Welch) y los grados de libertad de Satterthwaite (redondeados **hacia abajo**).
**c)** Decida con $\alpha=0.05$.
**d)** Acote el p-valor con la tabla de $t$ (entre qué dos valores cae).

---

## ▶ 5. (2 puntos) Dos muestras independientes, Caso A, con diferencia hipotética $d_0\ne0$

*(Adaptado de Guía 8, Ej. 1.)* Las personas con síndrome de Raynaud sufren peor circulación en los dedos. Para $10$ personas con el síndrome, la salida de calor promedio al sumergir el dedo en agua fue $\bar x_1=0.64$; para $10$ personas sin el síndrome, $\bar x_2=2.05$ ($cal/cm^2/min$). Se supone normalidad con $\sigma_1=0.2$ y $\sigma_2=0.4$ **conocidas**. Se quiere probar que la salida de calor de quienes padecen el síndrome es, en promedio, más de $1\ cal/cm^2/min$ menor que la de quienes no lo padecen.

**a)** Plantee $H_0:\mu_1-\mu_2=-1.0$ contra el $H_A$ correspondiente.
**b)** A diferencia de todos los tests de dos poblaciones vistos hasta ahora (donde $H_0$ era $\mu_1=\mu_2$, es decir diferencia $0$), acá la diferencia hipotética es $d_0=-1.0\ne0$. Escriba el estadístico de prueba correcto (con $d_0$ en el pivote, no $0$) y calcule $z_{obs}$.
**c)** Decida con $\alpha=0.01$.
**d)** Calcule el p-valor.

---

## ▶ 6. (2 puntos) Datos apareados, pero con $n$ grande (asintótico, no $t$)

*(Adaptado de Guía 8, Ej. 8.)* Para determinar si la exposición al DDT está asociada al cáncer de mama, se midió el nivel de DDE en sangre de cada mujer con cáncer y en una mujer sana "pareja" de ella (misma edad, condición de fumadora, etc.), y se calculó la diferencia de niveles entre cada par. Para las $171$ diferencias obtenidas, $\bar d=2.7\ ng/ml$ y $s=15.9\ ng/ml$.

**a)** Plantee $H_0$ y $H_A$ (bilateral) para la diferencia media poblacional $\mu_D$.
**b)** Calcule el estadístico de prueba. *(Pista: son datos apareados, pero $n=171$ es gigante — no hace falta $t$ ni suponer normalidad exacta de las diferencias, alcanza con el TCL.)*
**c)** Decida con $\alpha=0.05$ y calcule el p-valor.
**d)** En la Práctica B, Ej. 5 (apareadas), se usó $t_{n-1}$ con $n$ chico. Acá, siendo también datos apareados, se usó $z$. ¿Qué es lo que realmente decide si una prueba de una muestra (incluida la de diferencias apareadas, que al final es una muestra de $D_i=X_i-Y_i$) usa $z$ o $t$?

---

## ▶ 7. (2 puntos) Integrador: identificar el Caso antes de calcular

**a)** Para cada viñeta, diga qué Caso (A/B/C) de test para una media corresponde, y por qué (en una frase, citando el dato que lo decide):
&nbsp;&nbsp;&nbsp;&nbsp;i) $n=50$, $\sigma$ conocida $=4$.
&nbsp;&nbsp;&nbsp;&nbsp;ii) $n=35$, $\sigma$ desconocida, se calcula $s$.
&nbsp;&nbsp;&nbsp;&nbsp;iii) $n=22$, $\sigma$ desconocida, población normal.
&nbsp;&nbsp;&nbsp;&nbsp;iv) $n=60$, $\sigma$ desconocida, se calcula $s$.

**b)** Para la viñeta iii), con los siguientes datos: se midió el tiempo de secado (minutos) de una pintura nueva en $n=22$ probetas, obteniéndose $\bar x=48.6$ y $s=5.4$. El fabricante afirma que el tiempo medio de secado es $\mu_0=50$ min. Plantee $H_0$/$H_A$ (bilateral) y calcule el estadístico de prueba observado.
**c)** Decida con $\alpha=0.05$ y calcule el p-valor. Concluya en el contexto del problema.

---

## ▶ 8. (2 puntos) IC para $\mu$ **y** para $\sigma$ (no $\sigma^2$) de la misma muestra

*(Adaptado de Guía 6, Ej. 8.)* El tiempo de reacción (TR) ante un estímulo, para $n=16$ nadadores al arranque con disparo, tuvo $\bar x=0.214'$ y $s_{n-1}=0.036'$. Se supone TR aproximadamente normal.

**a)** Obtenga el IC del 90 % para la verdadera media del TR.
**b)** Obtenga el IC del 90 % para la **varianza** del TR (con $\chi^2_{15}$).
**c)** A partir de b), obtenga el IC del 90 % para la **desviación estándar** del TR. *(Ojo: no hay una fórmula directa con $\chi^2$ para $\sigma$ — hay que armar primero el IC de $\sigma^2$ y recién ahí tomar raíz cuadrada a ambos extremos. Como la raíz es creciente, el orden de los extremos se mantiene.)*

---
---

# RESPUESTAS

> Cómo leer: primero **Modelo**, después el paso a paso, y a veces **Otra forma** u **Observación**. Los cuantiles se dan con 4 decimales (equivalen a los de tabla, sin redondeo de tabla).

## Ejercicio 1

**Modelo:** $X\sim\text{Binomial}(n,p)$ bajo $H_0:p=0.5$. Para un $H_A$ **bilateral** ($p\ne0.5$), la región de rechazo tiene que poder detectar que $X$ sea *demasiado chico* **o** *demasiado grande* — tiene que tener masa en ambas colas.

**a)** $R_1$ es la adecuada: es simétrica alrededor de $np_0=8$ y cubre ambas colas ($x$ chico **o** grande), que es justo lo que corresponde a $H_A:p\ne0.5$. $R_2=\{x\le4\}$ sólo cubre la cola inferior: si saliera $x=15$ (evidencia fortísima de que $p\ne0.5$, para el otro lado) $R_2$ **no rechazaría**, lo cual es absurdo para un test bilateral. Lo mismo al revés con $R_3=\{x\ge12\}$ (sólo cola superior, se perdería un $x$ muy chico).

**b)** Bajo $H_0$, $X\sim\text{Binomial}(16,0.5)$. $$P(\text{Error I})=P(X\in R_1\mid p=0.5)=P(X\le3)+P(X\ge13)=P(X\le3)+(1-P(X\le12))\approx\mathbf{0.0213}$$

**c)** $\beta(p)=P(X\notin R_1\mid p)=P(4\le X\le12\mid p)$:

| $p$ | $0.2$ | $0.4$ | $0.6$ | $0.8$ |
|---|---|---|---|---|
| $\beta(p)$ | $0.4019$ | $0.9339$ | $0.9339$ | $0.4019$ |

*(Tiene sentido que $\beta(0.2)=\beta(0.8)$ y $\beta(0.4)=\beta(0.6)$: $R_1$ es simétrica alrededor de $p_0=0.5$, así que alejarse lo mismo del $0.5$ para cualquier lado cuesta lo mismo en potencia. También tiene sentido que $\beta$ sea mucho más grande cerca de $p_0$ ($0.4$ o $0.6$) que lejos ($0.2$ u $0.8$): cuesta mucho más detectar una $p$ que está cerca de la hipotetizada.)*

**d)** $x=5$: como $5\notin R_1=\{x\le3\text{ o }x\ge13\}$ (porque $3<5<13$): **no se rechaza $H_0$**. *(Chequeo con p-valor: $P(X\le5)\approx0.1051$, p-valor bilateral $\approx2(0.1051)=0.2102>0.05$, mismo resultado.)*

---

## Ejercicio 2

**Modelo:** $X=$ cantidad de defectuosos $\sim\text{Binomial}(500,0.03)$ bajo $H_0$. Para $n$ grande y $np_0$ no tan chico, $X$ se puede aproximar por $N(np_0,\,np_0(1-p_0))$ (TCL/De Moivre-Laplace), con corrección por continuidad.

**a)** $H_0:p=0.03\qquad H_A:p<0.03$ (los robots producen *menos* defectos).

**b)** $$p\text{-valor}=P(X\le5\mid n=500,p=0.03)\approx\mathbf{0.0025}$$ (suma exacta de $P(X=0)+\dots+P(X=5)$).

**c)** $np_0=15$, $\sqrt{np_0(1-p_0)}\approx3.8144$. $$z\approx\frac{5+0.5-15}{3.8144}\approx-2.4905\qquad p\text{-valor}\approx\Phi(-2.4905)\approx\mathbf{0.0064}$$
Es parecido al exacto de b) pero no igual ($0.0064$ vs. $0.0025$): la aproximación normal con $np_0=15$ (no tan grande) y en la cola, lejos del centro, pierde precisión — el valor **exacto** de b) es el confiable acá.

**d)** Con cualquiera de los dos ($0.0025$ o, más conservador, $0.0064$), el p-valor es $<0.01$: **se rechaza $H_0$**. Los datos apoyan que la proporción de cables defectuosos es menor usando robots que con ensambladores humanos.

---

## Ejercicio 3

**Modelo:** proporción, $n$ grande. En el **test**, el error estándar usa $p_0$ (la hipótesis nula, fija); en el **IC**, se usa $\hat p$ (no hay $p_0$ porque no se está testeando nada, sólo estimando).

**a)** $H_0:p=0.4\qquad H_A:p\ne0.4$. $\hat p=92/150\approx0.6133$. $$se_0=\sqrt{\frac{0.4(0.6)}{150}}=0.04\qquad z_{obs}=\frac{0.6133-0.4}{0.04}\approx\mathbf{5.3333}$$

**b)** $z_{0.005}=2.5758$ (crítico al 1 %) y $z_{0.025}=1.96$ (crítico al 5 %). Como $5.3333$ es mucho mayor que **ambos**: **se rechaza $H_0$ en los dos niveles** — acá no cambia la conclusión. *(En otros ejercicios de este repaso sí cambiaba porque $t_{obs}$ o $z_{obs}$ quedaba *entre* los dos valores críticos; acá $z_{obs}=5.3333$ está tan lejos de los dos ($2.58$ y $1.96$) que ninguno de los dos niveles usuales lo salva: la evidencia es abrumadora, no "al límite".)*

**c)** $se_{IC}=\sqrt{\dfrac{0.6133(0.3867)}{150}}\approx0.0398$, $z_{0.05}=1.6449$:
$$IC_{90\%}=0.6133\pm1.6449(0.0398)\approx\mathbf{[0.5479,\ 0.6787]}$$
$p_0=0.4$ queda muy por fuera de este intervalo, consistente con el rechazo contundente de b).

---

## Ejercicio 4

**Modelo:** dos muestras independientes, varianzas **no supuestas iguales** ⇒ Welch. $T=\dfrac{\bar X_1-\bar X_2}{\sqrt{S_1^2/n_1+S_2^2/n_2}}$, con $gl$ de Satterthwaite $=\dfrac{\left(\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2}\right)^2}{\frac{(s_1^2/n_1)^2}{n_1-1}+\frac{(s_2^2/n_2)^2}{n_2-1}}$ (siempre se redondea **hacia abajo**, nunca hacia arriba: usar más $gl$ de los que corresponde da una tabla *demasiado optimista*).

**a)** $H_0:\mu_1=\mu_2\qquad H_A:\mu_1<\mu_2$ (infectados con recuento más bajo).

**b)** $$se=\sqrt{\frac{3204^2}{15}+\frac{2415^2}{10}}\approx1125.8761\qquad t_{obs}=\frac{4767-7360}{1125.8761}\approx\mathbf{-2.3031}$$
$$gl=\frac{\left(\frac{3204^2}{15}+\frac{2415^2}{10}\right)^2}{\frac{(3204^2/15)^2}{14}+\frac{(2415^2/10)^2}{9}}\approx22.5519\ \Rightarrow\ \mathbf{gl=22}\text{ (redondeado hacia abajo)}$$

**c)** $t_{0.05,22}=1.7171$, $RR=\{t\le-1.7171\}$. Como $-2.3031<-1.7171$: **se rechaza $H_0$** — hay evidencia de que los infectados tienen recuento medio menor.

**d)** $t_{0.025,22}\approx2.0739$ y $t_{0.01,22}=2.5083$. Como $2.0739<2.3031<2.5083$: el p-valor (cola inferior) cae entre $\mathbf{0.01}$ y $\mathbf{0.025}$ (valor exacto $\approx0.0156$, consistente con la acotación).

---

## Ejercicio 5

**Modelo:** dos poblaciones, $\sigma_1,\sigma_2$ **conocidas** ⇒ Caso A, pero ahora probando una diferencia hipotética $d_0\ne0$ en vez de $0$: el pivote general es $Z=\dfrac{(\bar X_1-\bar X_2)-d_0}{\sqrt{\sigma_1^2/n_1+\sigma_2^2/n_2}}$ (cuando $d_0=0$, como en todos los ejercicios anteriores de dos poblaciones, este pivote se reduce al de siempre).

**a)** $H_0:\mu_1-\mu_2=-1.0\qquad H_A:\mu_1-\mu_2<-1.0$.

**b)** El estadístico correcto resta $d_0=-1.0$ (no $0$) en el numerador:
$$se=\sqrt{\frac{0.2^2}{10}+\frac{0.4^2}{10}}\approx0.1414\qquad z_{obs}=\frac{(0.64-2.05)-(-1.0)}{0.1414}=\frac{-1.41+1.0}{0.1414}\approx\mathbf{-2.8991}$$
*(Si por error se usara $d_0=0$ acá, el estadístico saldría mal: la pregunta no es si las medias son iguales, sino si difieren en más de $1$ unidad.)*

**c)** $z_{0.01}=2.3263$, $RR=\{z\le-2.3263\}$. Como $-2.8991<-2.3263$: **se rechaza $H_0$** — hay evidencia de que la salida de calor en quienes padecen el síndrome es, en promedio, más de $1\ cal/cm^2/min$ menor.

**d)** $p\text{-valor}=P(Z<-2.8991)\approx\mathbf{0.0019}<0.01$, consistente con c).

---

## Ejercicio 6

**Modelo:** datos apareados $D_i=X_i-Y_i$, pero con $n=171$ enorme ⇒ no hace falta $t_{n-1}$ ni normalidad de las $D_i$: alcanza el TCL aplicado directamente a $\bar D$, igual que el Caso B/D de una muestra.

**a)** $H_0:\mu_D=0\qquad H_A:\mu_D\ne0$.

**b)** $$se=\frac{15.9}{\sqrt{171}}\approx1.2159\qquad z_{obs}=\frac{2.7}{1.2159}\approx\mathbf{2.2206}$$

**c)** $z_{0.025}=1.96$, $RR=\{|z|\ge1.96\}$. Como $2.2206>1.96$: **se rechaza $H_0$** (hay diferencia). $p\text{-valor}=2(1-\Phi(2.2206))\approx\mathbf{0.0264}<0.05$, consistente.

**d)** Lo que decide $z$ vs. $t$ **nunca** es "si los datos están apareados o no" (apareados o independientes, al final siempre se reduce a una muestra de *algo*: $D_i$ en apareadas, $X_i$ en una muestra simple). Lo que decide es exactamente lo mismo que en el test de una muestra: si $\sigma$ (acá, $\sigma_D$) es **conocida** (Caso A, $z$) o si hay que estimarla con $s$, y en ese caso si $n$ es grande (Caso B/D, $z$ por TCL) o chico (Caso C, $t_{n-1}$ exacto, requiere normalidad). Acá $\sigma_D$ era desconocida pero $n=171$ es gigante, así que cae en "Caso B/D de una muestra" aplicado a las diferencias — exactamente la misma lógica de casos de siempre, sólo que la "muestra" son las diferencias apareadas.

---

## Ejercicio 7

**Modelo:** repaso de la clasificación de Casos para test de una media: **Caso A** ($\sigma$ conocida, cualquier $n$) ⇒ $z$; **Caso B** ($\sigma$ desconocida, $n$ grande — $\ge40$) ⇒ $z$ igual que A (por Slutsky); **Caso C** ($\sigma$ desconocida, $n$ chico, población normal) ⇒ $t_{n-1}$ exacto.

**a)**
i) **Caso A**: $\sigma$ es conocida, así que no importa que $n=50$ sea grande o chico — siempre se usa $z$ cuando $\sigma$ es conocida.
ii) **Caso C**: $\sigma$ desconocida y $n=35<40$ ⇒ no alcanza para la aproximación del Caso B, hace falta $t_{34}$ (y población normal).
iii) **Caso C**: $\sigma$ desconocida, $n=22$ chico, se pide explícitamente normalidad (justo lo que exige el Caso C).
iv) **Caso B**: $\sigma$ desconocida pero $n=60\ge40$ ⇒ por Slutsky, $z$ con la misma tabla que el Caso A (no hace falta $t$).

**b)** $H_0:\mu=50\qquad H_A:\mu\ne50$. $gl=21$.
$$t_{obs}=\frac{48.6-50}{5.4/\sqrt{22}}\approx\mathbf{-1.2160}$$

**c)** $t_{0.025,21}=2.0796$, $RR=\{|t|\ge2.0796\}$. Como $1.2160<2.0796$: **no se rechaza $H_0$**. $p\text{-valor}=2P(T_{21}>1.2160)\approx\mathbf{0.2375}>0.05$, consistente. **En contexto:** con esta muestra no hay evidencia suficiente para dudar de que el tiempo medio real de secado sea de $50$ minutos, como afirma el fabricante.

---

## Ejercicio 8

**Modelo:** normal, $\sigma$ desconocida ⇒ IC de $\mu$ con $t_{n-1}$, IC de $\sigma^2$ con $\chi^2_{n-1}$; para $\sigma$ (no $\sigma^2$), se arma primero el de $\sigma^2$ y se toma raíz cuadrada a los dos extremos (la raíz es creciente, así que no cambia el orden).

**a)** $gl=15$, $t_{0.05,15}=1.7531$.
$$se=\frac{0.036}{\sqrt{16}}=0.009\qquad IC_{90\%}(\mu)=0.214\pm1.7531(0.009)\approx\mathbf{[0.1982,\ 0.2298]}$$

**b)** $\chi^2_{0.95,15}=7.2609$ (chico, denominador del límite superior) y $\chi^2_{0.05,15}=24.9958$ (grande, denominador del límite inferior). $(n-1)s^2=15(0.036^2)=15(0.001296)=0.01944$:
$$IC_{90\%}(\sigma^2)=\left[\frac{0.01944}{24.9958},\ \frac{0.01944}{7.2609}\right]\approx\mathbf{[0.0008,\ 0.0027]}$$

**c)** Tomando raíz cuadrada a ambos extremos de b):
$$IC_{90\%}(\sigma)\approx\left[\sqrt{0.0008},\ \sqrt{0.0027}\right]\approx\mathbf{[0.0279,\ 0.0517]}$$
*(No hay una distribución "$\chi$" con tablas de uso directo para armar este IC de una — por eso el camino siempre es: IC de $\sigma^2$ con $\chi^2$, y recién después raíz cuadrada.)*
