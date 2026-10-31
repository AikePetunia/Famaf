# Probabilidad y Estadística — Parcial II (práctica D, CLAUDE ejercicios)

> Armado con el estilo de los parciales 2024/2025 (misma profe): 7 ejercicios, 14 puntos. Refuerzo específico de los temas que quedaron flojos en A/B/C: **χ² (IC y test de varianza), máxima verosimilitud con invarianza, y lectura/cómputo de conclusiones de hipótesis (p-valor vs. α, distintos gl)**.
> La mayoría de los ejercicios son **adaptaciones literales de las Guías oficiales 5, 6 y 7** (estimación puntual, IC de una muestra, test de hipótesis de una muestra), elegidos puntualmente para tapar esos huecos. Completa a las prácticas A, B y C (no se repiten los mismos sub-temas, salvo el refuerzo intencional de χ².)
> Convención: z, t y χ² con 4 decimales; resultados finales con 4 decimales (o redondeo natural si es un n de muestra).

| 1a | 1b | 1c | 1d | 1e | 2a | 2b | 2c | 2d | 3a | 3b | 3c | 3d | 4a | 4b | 4c | 5a | 5b | 5c | 5d | 6a | 6b | 6c | 7a | 7b | 7c | 7d |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2 puntos) Máxima verosimilitud en una normal, con invarianza

*(Adaptado de Guía 5, Ej. 7.)* El espesor de pintura de baja viscosidad $X$ (en milésimas de pulgada) se supone normal. Se midieron $n=16$ observaciones:
$$0.83,\ 0.88,\ 0.88,\ 1.04,\ 1.09,\ 1.12,\ 1.29,\ 1.31,\ 1.48,\ 1.49,\ 1.59,\ 1.62,\ 1.65,\ 1.71,\ 1.76,\ 1.83$$
$\sum x_i=21.57$, $\sum (x_i-\bar x)^2=1.7192$.

*(Ojo, trampita a propósito: el EMV de $\sigma^2$ en una normal es $\hat\sigma^2_{MV}=\dfrac1n\sum(X_i-\bar X)^2$ — divide por $n$, **no** por $n-1$. Es distinto del $S^2_{n-1}$ que usamos siempre en IC y tests. Acá, para todo lo que sea "por MV", hay que usar $\hat\sigma_{MV}$.)*

**a)** Calcule una estimación puntual de la media por el método de los momentos.
**b)** Calcule una estimación puntual de la **mediana** de $X$ por MV. *(Pista: en una normal, mediana $=$ media, así que por invarianza del EMV, $\widehat{\text{mediana}}=g(\hat\mu_{MV},\hat\sigma_{MV})$ con $g$ muy simple.)*
**c)** Calcule una estimación del **percentil 90** de $X$ por MV (invarianza: el percentil 90 de una $N(\mu,\sigma^2)$ es $\mu+z_{0.10}\,\sigma$).
**d)** Estime $P(X<1.5)$ por MV (invarianza).
**e)** ¿Cuál es el error estándar del estimador usado en a)?

---

## ▶ 2. (2 puntos) χ²: IC para media y varianza, mismo dato con dos $n$ distintos

*(Adaptado de Guía 6, Ej. 6.)* En un triatlón se midieron las pulsaciones máximas (latidos/min) durante la prueba de natación. Se supone distribución aproximadamente normal. En ambos incisos $\bar x=188.0$ y $s_{n-1}=7.2$ (son dos muestras distintas de la misma población, no se mezclan los $n$).

**a)** Con $n=40$: obtenga el IC del **98 %** para la media $\mu$ **y** para la varianza $\sigma^2$.
**b)** Con $n=9$: obtenga el IC del **95 %** para $\mu$ **y** para $\sigma^2$.
**c)** Compare el ancho del IC de varianza de a) con el de b). ¿Por qué el de b) es bastante más ancho si $n$ sólo bajó de $40$ a $9$ (no es sólo el factor $1/\sqrt n$ o similar, que además ni siquiera aplica tal cual a la varianza)?
**d)** En a), ¿los valores críticos $\chi^2_{0.99,39}$ y $\chi^2_{0.01,39}$, cuál va en el límite inferior del IC de $\sigma^2$ y cuál en el superior? Justifique con la fórmula del pivote (no de memoria).

---

## ▶ 3. (2 puntos) χ²: test de hipótesis para la varianza (unilateral) + dualidad con el IC

Una envasadora de gaseosa debe garantizar que la varianza del volumen envasado sea $\sigma^2\le4\ ml^2$ para cumplir una norma de calidad (si la varianza es mayor, hay botellas que se llenan de más o de menos). Se toma una muestra de $n=21$ botellas y se obtiene $s^2=6.1\ ml^2$. Se supone que el volumen envasado es normal.

**a)** Plantee $H_0$ y $H_A$ (unilateral: la norma se incumple si $\sigma^2$ es mayor que $4$).
**b)** Calcule $\chi^2_{obs}$ y decida con $\alpha=0.05$.
**c)** Calcule el p-valor y verifique que sea consistente con b).
**d)** Obtenga el IC del 95 % para $\sigma^2$ (bilateral, el que ya conocen) y vea si $\sigma_0^2=4$ cae dentro. *(Ojo: la dualidad exacta sería con un test bilateral al 5 %, no con este unilateral — igual sirve para chequear si el dato es "compatible" con $\sigma^2=4$.)*

---

## ▶ 4. (2 puntos) Máxima verosimilitud en una normal: percentil e invarianza (otro ejemplo)

*(Adaptado de Guía 5, Ej. 9.)* Se supone que la resistencia al corte de soldaduras eléctricas ($lb/plg^2$) es normal. Se midieron $n=10$ soldaduras:
$$392,\ 376,\ 401,\ 367,\ 389,\ 362,\ 409,\ 415,\ 358,\ 375$$
$\sum x_i=3844$, $\sum(x_i-\bar x)^2=3556.4$.

**a)** Estime $\mu$ y $\sigma$ por MV (recuerde: $\hat\sigma_{MV}$ divide por $n$, no por $n-1$).
**b)** Estime el **percentil 95** de la distribución por MV (invarianza).
**c)** Estime $P(X\le400)$ por MV (invarianza).

---

## ▶ 5. (2 puntos) Leer y calcular conclusiones de hipótesis

*(Adaptado de Guía 7, Ej. 14 y 15.)*

**a)** Para cada par (p-valor, $\alpha$), diga si se **rechaza** o **no se rechaza** $H_0$:
&nbsp;&nbsp;&nbsp;&nbsp;i) $p=0.084$, $\alpha=0.05$ &nbsp;&nbsp; ii) $p=0.003$, $\alpha=0.01$ &nbsp;&nbsp; iii) $p=0.498$, $\alpha=0.05$
&nbsp;&nbsp;&nbsp;&nbsp;iv) $p=0.084$, $\alpha=0.10$ &nbsp;&nbsp; v) $p=0.039$, $\alpha=0.01$ &nbsp;&nbsp; vi) $p=0.218$, $\alpha=0.10$

Para un estadístico $Z$ bajo $H_0:\mu=5$, calcule el p-valor y concluya a nivel $\alpha=0.05$ en cada caso:

**b)** $H_A:\mu>5$, con i) $z_{obs}=1.42$ &nbsp; ii) $z_{obs}=2.48$
**c)** $H_A:\mu<5$, con i) $z_{obs}=-1.96$ &nbsp; ii) $z_{obs}=-0.11$
**d)** $H_A:\mu\ne5$, con i) $z_{obs}=2.10$ &nbsp; ii) $z_{obs}=-1.75$

---

## ▶ 6. (2 puntos) Acotar el p-valor con tabla $t$, variando los grados de libertad

*(Adaptado de Guía 7, Ej. 17.)* Acote el p-valor usando la tabla de $t$ (sin interpolar) y concluya a nivel $\alpha=0.02$:

**a)** Prueba de cola superior, $gl=8$, $t_{obs}=2$.
**b)** Prueba de cola inferior, $gl=11$, $t_{obs}=-2.4$.
**c)** Prueba bilateral, $gl=15$, $t_{obs}=-1.6$.

---

## ▶ 7. (2 puntos) Caso C completo, con conclusión en contexto

*(Adaptado de Guía 7, Ej. 9.)* Según el Código Alimentario Argentino (CAA), un alimento es bajo en sodio si tiene a lo sumo $120\ mg$ de sodio cada $100\ g$ de producto. Se toma una muestra de $n=16$ galletas de una marca rotulada "baja en sodio", con contenidos de sodio (mg):
$$125.02,\ 121.45,\ 122.25,\ 119.37,\ 120.80,\ 124.78,\ 121.35,\ 124.97,$$
$$119.98,\ 117.50,\ 121.13,\ 123.09,\ 124.40,\ 126.97,\ 118.89,\ 121.72$$
Se supone que el contenido de sodio es normal.

**a)** Plantee $H_0$ y $H_A$ para determinar si la marca **no cumple** con la norma del CAA.
**b)** Identifique el Caso (A/B/C) que corresponde (justifique por $n$ y por si $\sigma$ es conocida) y calcule el estadístico de prueba observado.
**c)** Decida con $\alpha=0.05$.
**d)** Calcule el p-valor y concluya en el contexto del problema (en una oración, como si se lo tuviera que explicar a alguien que no sabe estadística).

---
---

# RESPUESTAS

> Cómo leer: primero **Modelo**, después el paso a paso, y a veces **Otra forma** u **Observación**. Los cuantiles de $z$, $t$ y $\chi^2$ se dan con 4 decimales (equivalen a los que se leerían de la tabla, solo que sin redondeo de tabla).

## Ejercicio 1

**Modelo:** $X\sim N(\mu,\sigma^2)$. Momentos para $\mu$: $\hat\mu_{mom}=\bar X$. Máxima verosimilitud en la normal: $\hat\mu_{MV}=\bar X$ también (coinciden), pero $\hat\sigma^2_{MV}=\frac1n\sum(X_i-\bar X)^2$ (con $n$, no $n-1$ — a diferencia del $S^2_{n-1}$ insesgado que se usa en IC/tests). Invarianza del EMV: para estimar cualquier función $g(\mu,\sigma)$ (mediana, percentiles, probabilidades), se reemplaza directamente $\hat\mu_{MV}$ y $\hat\sigma_{MV}$ en la fórmula poblacional de $g$.

**a)** $\bar x=\dfrac{21.57}{16}=\mathbf{1.3481}$.

**b)** En una $N(\mu,\sigma^2)$ la mediana es $\mu$ (la normal es simétrica). Por invarianza, $\widehat{\text{mediana}}_{MV}=\hat\mu_{MV}=\bar x=\mathbf{1.3481}$ (mismo valor que a), porque la mediana poblacional es literalmente $\mu$, no hace falta tocar $\sigma$).

**c)** Primero $\hat\sigma_{MV}=\sqrt{\dfrac{1.7192}{16}}=\sqrt{0.1075}\approx0.3278$ *(compare con $s_{n-1}=\sqrt{1.7192/15}\approx0.3385$: son parecidos pero no iguales — el de MV es siempre un poco más chico porque divide por $n$)*.
Percentil 90 $=\mu+z_{0.10}\,\sigma$, con $z_{0.10}=1.2816$ (el valor con $P(Z>z)=0.10$):
$$\widehat{p_{90}}=1.3481+1.2816(0.3278)\approx\mathbf{1.7682}$$

**d)** $$\widehat{P(X<1.5)}=\Phi\!\left(\frac{1.5-1.3481}{0.3278}\right)=\Phi(0.4635)\approx\mathbf{0.6784}$$

**e)** $se(\hat\mu_{mom})=se(\bar X)=\dfrac{\sigma}{\sqrt n}$, estimado con $s_{n-1}$ (el insesgado, no el de MV, porque acá se pide el error estándar del estimador de a), que es un estimador "normal" no un EMV): $\dfrac{0.3385}{\sqrt{16}}\approx\mathbf{0.0846}$. *(Si en cambio se usa $\hat\sigma_{MV}$ para estimarlo da $0.3278/4\approx0.0819$; cualquiera de las dos es aceptable, son estimaciones del mismo $\sigma/\sqrt n$ poblacional.)*

---

## Ejercicio 2

**Modelo:** normal, $\mu$ desconocida y $\sigma^2$ desconocida ⇒ IC para $\mu$ con $t_{n-1}$, IC para $\sigma^2$ con $\chi^2_{n-1}$ (Caso C para ambos, porque $\sigma$ no se conoce). Pivote de varianza: $\dfrac{(n-1)S^2}{\sigma^2}\sim\chi^2_{n-1}$, y como $\sigma^2$ está en el **denominador**, el cuantil **chico** de $\chi^2$ va en el límite **superior** del IC y el **grande** va en el límite **inferior** (al revés que con $z$ o $t$).

**a)** $n=40$, $gl=39$. $t_{0.01,39}=2.4258$ (para 98 % bilateral, $\alpha/2=0.01$).
$$se=\frac{7.2}{\sqrt{40}}\approx1.1384\qquad IC_{98\%}(\mu)=188.0\pm2.4258(1.1384)\approx\mathbf{[185.2384,\ 190.7616]}$$
$\chi^2_{0.99,39}=21.4262$ (chico, va en el denominador del límite superior) y $\chi^2_{0.01,39}=62.4281$ (grande, va en el denominador del límite inferior). Con $(n-1)s^2=39(7.2^2)=39(51.84)=2021.76$:
$$IC_{98\%}(\sigma^2)=\left[\frac{2021.76}{62.4281},\ \frac{2021.76}{21.4262}\right]\approx\mathbf{[32.3854,\ 94.3594]}$$

**b)** $n=9$, $gl=8$. $t_{0.025,8}=2.3060$ (para 95 % bilateral).
$$se=\frac{7.2}{\sqrt9}=2.4\qquad IC_{95\%}(\mu)=188.0\pm2.3060(2.4)\approx\mathbf{[182.4656,\ 193.5344]}$$
$\chi^2_{0.975,8}=2.1797$ (chico) y $\chi^2_{0.025,8}=17.5345$ (grande). Con $(n-1)s^2=8(51.84)=414.72$:
$$IC_{95\%}(\sigma^2)=\left[\frac{414.72}{17.5345},\ \frac{414.72}{2.1797}\right]\approx\mathbf{[23.6516,\ 190.2620]}$$

**c)** Ancho en a) ($n=40$): $94.3594-32.3854=61.974$. Ancho en b) ($n=9$): $190.2620-23.6516=166.6104$ — casi **2.7 veces más ancho**, a pesar de que la muestra sólo se achicó de 40 a 9 (menos de 5 veces). La razón: con $gl$ chico, la distribución $\chi^2_{gl}$ es mucho más asimétrica y dispersa relativa a su media (su varianza es $2\cdot gl$, pero lo que importa acá es la forma relativa de las colas), así que los cuantiles $\chi^2_{0.975,8}$ y $\chi^2_{0.025,8}$ quedan mucho más separados entre sí (relativamente) que $\chi^2_{0.975,39}$ y $\chi^2_{0.025,39}$. No es un efecto de "$1/\sqrt n$" como en el IC de la media: para la varianza, pocos grados de libertad penalizan mucho más fuerte.

**d)** El pivote es $\dfrac{(n-1)S^2}{\sigma^2}\sim\chi^2_{n-1}$. Despejando $\sigma^2$ de $\chi^2_{0.99,39}\le\dfrac{(n-1)S^2}{\sigma^2}\le\chi^2_{0.01,39}$ (que es como se arma el IC a partir de $P(\chi^2_{0.99,39}\le\chi^2\le\chi^2_{0.01,39})=0.98$), al invertir las desigualdades (dividir invierte el sentido) queda:
$$\frac{(n-1)S^2}{\chi^2_{0.01,39}}\le\sigma^2\le\frac{(n-1)S^2}{\chi^2_{0.99,39}}$$
Es decir: el cuantil **grande** ($\chi^2_{0.01,39}=62.4281$) queda dividiendo en el límite **inferior**, y el **chico** ($\chi^2_{0.99,39}=21.4262$) en el **superior** — exactamente como se usó en a).

---

## Ejercicio 3

**Modelo:** normal, $\sigma^2$ desconocida ⇒ test para la varianza usa $\chi^2_{obs}=\dfrac{(n-1)s^2}{\sigma_0^2}\sim\chi^2_{n-1}$ bajo $H_0$ (igual pivote que en el IC, pero ahora con $\sigma_0^2$ fijo en vez de despejar $\sigma^2$).

**a)** $H_0:\sigma^2=4\qquad H_A:\sigma^2>4$.

**b)** $gl=20$. $$\chi^2_{obs}=\frac{20(6.1)}{4}=\frac{122}{4}=\mathbf{30.5000}$$
$RR=\{\chi^2\ge\chi^2_{0.05,20}\}=\{\chi^2\ge31.4104\}$. Como $30.5<31.4104$: **no se rechaza $H_0$** — con esta muestra no hay evidencia suficiente de que se incumpla la norma (aunque el dato está bastante cerca del límite).

**c)** $p\text{-valor}=P(\chi^2_{20}>30.5)\approx\mathbf{0.0621}$. Como $0.0621>0.05$: no se rechaza, consistente con b) (y tiene sentido que dé "cerca" de 0.05, porque en b) el estadístico también quedó cerca del valor crítico).

**d)** $\chi^2_{0.975,20}=9.5908$ (chico) y $\chi^2_{0.025,20}=34.1696$ (grande). Con $(n-1)s^2=20(6.1)=122$:
$$IC_{95\%}(\sigma^2)=\left[\frac{122}{34.1696},\ \frac{122}{9.5908}\right]\approx\mathbf{[3.5704,\ 12.7206]}$$
$\sigma_0^2=4$ **sí** cae dentro de este intervalo, consistente con el "no rechazo" de b) — el dato es compatible con $\sigma^2=4$ (incluso con valores bastante más grandes).

---

## Ejercicio 4

**Modelo:** igual que en el Ejercicio 1 (MV en una normal + invarianza), otro dataset.

**a)** $\bar x=\dfrac{3844}{10}=384.4$. $\hat\sigma_{MV}=\sqrt{\dfrac{3556.4}{10}}=\sqrt{355.64}\approx\mathbf{18.8584}$ (de nuevo: divide por $n=10$, no por $9$).

**b)** Percentil 95 $=\mu+z_{0.05}\,\sigma$, $z_{0.05}=1.6449$:
$$\widehat{p_{95}}=384.4+1.6449(18.8584)\approx\mathbf{415.4193}$$

**c)** $$\widehat{P(X\le400)}=\Phi\!\left(\frac{400-384.4}{18.8584}\right)=\Phi(0.8273)\approx\mathbf{0.7959}$$

---

## Ejercicio 5

**Modelo:** comparar p-valor contra $\alpha$ directamente (se rechaza $H_0$ si y sólo si $p\text{-valor}\le\alpha$); para $Z$, el p-valor depende de la forma de $H_A$: cola superior $\Rightarrow P(Z>z_{obs})$, cola inferior $\Rightarrow P(Z<z_{obs})$, bilateral $\Rightarrow 2P(Z>|z_{obs}|)$.

**a)**
i) $0.084>0.05$: **no se rechaza**.
ii) $0.003<0.01$: **se rechaza**.
iii) $0.498>0.05$: **no se rechaza**.
iv) $0.084<0.10$: **se rechaza** *(mismo p-valor que i), pero acá $\alpha$ es más laxo)*.
v) $0.039>0.01$: **no se rechaza** *(ojo: $0.039<0.05$ pero acá $\alpha=0.01$, no $0.05$)*.
vi) $0.218>0.10$: **no se rechaza**.

**b)** ($H_A:\mu>5$, p-valor $=P(Z>z_{obs})=1-\Phi(z_{obs})$)
i) $z_{obs}=1.42$: $p=1-\Phi(1.42)\approx\mathbf{0.0778}>0.05$ ⇒ **no se rechaza**.
ii) $z_{obs}=2.48$: $p=1-\Phi(2.48)\approx\mathbf{0.0066}<0.05$ ⇒ **se rechaza**.

**c)** ($H_A:\mu<5$, p-valor $=P(Z<z_{obs})=\Phi(z_{obs})$)
i) $z_{obs}=-1.96$: $p=\Phi(-1.96)\approx\mathbf{0.0250}<0.05$ ⇒ **se rechaza** (justo en el límite).
ii) $z_{obs}=-0.11$: $p=\Phi(-0.11)\approx\mathbf{0.4562}>0.05$ ⇒ **no se rechaza**.

**d)** ($H_A:\mu\ne5$, p-valor $=2(1-\Phi(|z_{obs}|))$)
i) $z_{obs}=2.10$: $p=2(1-\Phi(2.10))\approx\mathbf{0.0357}<0.05$ ⇒ **se rechaza**.
ii) $z_{obs}=-1.75$: $p=2(1-\Phi(1.75))\approx\mathbf{0.0801}>0.05$ ⇒ **no se rechaza**.

---

## Ejercicio 6

**Modelo:** igual idea que con $Z$, pero con $t_{gl}$ (los $gl$ cambian según el ejercicio — justo lo que hay que tener presente siempre con $t$). Como no se interpola, el p-valor sólo se puede **acotar** entre dos columnas de la tabla.

**a)** Cola superior, $gl=8$: $p=P(T_8>2)\approx\mathbf{0.0403}$. Tabla: $t_{0.05,8}=1.8595<2<t_{0.025,8}=2.3060$ ⇒ se acota $0.025<p<0.05$ (consistente con el valor exacto). Como $p<0.02=\alpha$... en realidad $0.0403>0.02$: **no se rechaza** a $\alpha=0.02$.

**b)** Cola inferior, $gl=11$, $t_{obs}=-2.4$: $p=P(T_{11}<-2.4)=P(T_{11}>2.4)\approx\mathbf{0.0176}$. Tabla: $t_{0.025,11}=2.2010<2.4<t_{0.01,11}=2.7181$ ⇒ se acota $0.01<p<0.025$. Como $0.0176<0.02$: **se rechaza** a $\alpha=0.02$.

**c)** Bilateral, $gl=15$, $t_{obs}=-1.6$: $p=2P(T_{15}>1.6)\approx\mathbf{0.1304}$. Tabla: $t_{0.10,15}=1.3406<1.6<t_{0.05,15}=1.7531$ ⇒ cola simple entre $0.05$ y $0.10$, bilateral entre $0.10$ y $0.20$. Como $0.1304>0.02$: **no se rechaza** a $\alpha=0.02$.

---

## Ejercicio 7

**Modelo:** población normal, $\sigma$ desconocida, $n=16$ chico ⇒ **Caso C**, $T=\dfrac{\bar X-\mu_0}{S/\sqrt n}\sim t_{n-1}$ bajo $H_0$.

**a)** El CAA exige $\mu\le120$ para considerarse "bajo en sodio"; la marca afirma cumplir eso, así que para encontrar evidencia de que **no cumple** hay que poner la afirmación a favor de la marca en $H_0$ (lo que se quiere "desafiar" con los datos va en $H_A$):
$$H_0:\mu\le120\qquad H_A:\mu>120$$
*(En la práctica, el estadístico de prueba se calcula igual que si fuera $H_0:\mu=120$, porque el caso más desfavorable para $H_0$ dentro de $\mu\le120$ es justo $\mu=120$.)*

**b)** $n=16<40$ y $\sigma$ desconocida ⇒ **Caso C** (no corresponde la aproximación del Caso B, hace falta la $t$ exacta, y por eso se pide normalidad). Con los datos: $\bar x\approx122.1044$, $s\approx2.5965$, $gl=15$.
$$t_{obs}=\frac{122.1044-120}{2.5965/\sqrt{16}}\approx\mathbf{3.2419}$$

**c)** $t_{0.05,15}=1.7531$, $RR=\{t\ge1.7531\}$. Como $3.2419>1.7531$: **se rechaza $H_0$**.

**d)** $p\text{-valor}=P(T_{15}>3.2419)\approx\mathbf{0.0027}<0.05$, consistente con c). **Conclusión en contexto:** los datos dan evidencia fuerte (muy significativa al 5 %, de hecho también al 1 %) de que el contenido medio real de sodio de estas galletas supera los 120 mg permitidos, así que la marca **no cumple** con lo que su rótulo "bajo en sodio" promete.
