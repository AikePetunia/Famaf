# Probabilidad y Estadística — Parcial II (práctica A, CLAUDE ejercicios)

> Armado con el estilo de los parciales 2024/2025 (misma profe): 5 ejercicios, 10 puntos, ítems a/b/c/d, mezclando temas dentro de un mismo ejercicio (estimación + IC, test + errores/potencia, dos poblaciones, varianza + proporción).
> Pensado para **ejercitar fórmulas**, no para cronometrarse: no hace falta resolverlo todo de una sentada.
> Convención: z, t y χ² con 4 decimales; resultados finales con 4 decimales (o redondeo natural si es un n de muestra).

| 1a | 1b | 1c | 1d | 2a | 2b | 2c | 2d | 3a | 3b | 3c | 3d | 3e | 3f | 4a | 4b | 4c | 5a | 5b | 5c | 5d |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2 puntos) Estimación puntual

El número de defectos por día en una línea de producción, $X$, se modela como $\text{Poisson}(\lambda)$. Se dispone de una muestra de $n=8$ días: $3,5,2,4,6,3,5,4$. Se proponen dos estimadores de $\lambda$:
$$\hat\lambda_1=\bar X \qquad \hat\lambda_2=\frac{X_1+X_n}{2}$$

**a)** Muestre que los dos son insesgados para $\lambda$, y calcule $V(\hat\lambda_1)$ y $V(\hat\lambda_2)$. ¿Cuál es mejor (menor ECM) para $n=8$?
**b)** Calcule las estimaciones $\hat\lambda_{1,obs}$ y $\hat\lambda_{2,obs}$ con los datos dados.
**c)** Calcule el error estándar **estimado** de $\hat\lambda_1$.
**d)** Por invarianza del estimador de máxima verosimilitud, estime $P(X=0)$ (ningún defecto en un día).

---

## ▶ 2. (2 puntos) Intervalos de confianza para la media

El tiempo de proceso de un servidor (en ms) se distribuye normal. Se toma una muestra de $n=20$ mediciones, con $\bar x = 5.3$.

**a)** Si se sabe que $\sigma = 0.8$, obtenga el IC del 95 % para $\mu$.
**b)** ¿Qué tamaño de muestra haría falta para que el margen de error fuera a lo sumo $0.2$, con el mismo nivel de confianza y el mismo $\sigma$?
**c)** Si en cambio $\sigma$ es desconocida y la muestra dio $s=0.95$ (mismo $n=20$), obtenga el IC del 95 % para $\mu$.
**d)** Compare las longitudes de los intervalos de a) y c). ¿Qué dos factores hacen que el de c) sea más largo?

---

## ▶ 3. (2 puntos) Test de hipótesis para la media, errores y potencia

Una máquina llena bolsas de un producto; el peso nominal es $\mu_0=500$ g, y se sabe que el peso se distribuye normal con $\sigma=12$ g. El encargado sospecha que la máquina está llenando de menos.

**a)** Plantee $H_0$ y $H_A$.
**b)** Con una muestra de $n=25$ bolsas se obtuvo $\bar x = 495.4$ g. Decida al nivel $\alpha=0.05$.
**c)** Calcule el p-valor del inciso anterior.
**d)** Si el verdadero peso medio fuera $\mu=490$ g, calcule $\beta$ y la potencia del test (con $n=25$ y $\alpha=0.05$).
**e)** En el contexto del problema: ¿qué significaría cometer un error de tipo I? ¿Y uno de tipo II? ¿Cuál le parece más costoso para el fabricante?
**f)** Suponga ahora que $\sigma$ **no** se conoce, y que se tiene una muestra más grande de $n=45$ bolsas con $\bar x=495.4$ g (igual que antes) y $s=11.8$ g. ¿Qué Caso de test corresponde (A, B o C) y por qué? Decida con $\alpha=0.05$.

---

## ▶ 4. (2 puntos) Dos poblaciones

**(I) Apareadas.** Se mide la presión arterial sistólica de 8 pacientes antes y después de un tratamiento:

| Paciente | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|
| Antes | 145 | 150 | 138 | 160 | 155 | 148 | 152 | 142 |
| Después | 138 | 142 | 135 | 150 | 148 | 140 | 145 | 138 |

**a)** Plantee $H_0$ y $H_A$ para decidir si el tratamiento reduce la presión media, y decida con $\alpha=0.05$.

**(II) Independientes.** Dos máquinas fabrican piezas cuya vida útil (en horas) es normal, con $\sigma$ conocidas: Máquina A: $n_A=12$, $\bar x_A=340$, $\sigma_A=15$. Máquina B: $n_B=15$, $\bar x_B=325$, $\sigma_B=20$.

**b)** Obtenga el IC del 95 % para $\mu_A-\mu_B$.
**c)** Pruebe $H_0:\mu_A=\mu_B$ vs $H_A:\mu_A\ne\mu_B$ con $\alpha=0.05$, y compare la conclusión con la del IC.

---

## ▶ 5. (2 puntos) Varianza y proporción

Un fabricante afirma que la varianza de cierta medida es $\sigma_0^2=1.5$. Una muestra de $n=20$ piezas dio $s^2=2.3$.

**a)** Pruebe $H_0:\sigma^2=1.5$ vs $H_A:\sigma^2\ne1.5$ con $\alpha=0.05$.
**b)** Obtenga el IC del 90 % para $\sigma^2$ (y para $\sigma$) con esos datos.

En una encuesta a 150 personas, 85 dijeron preferir el producto X por sobre la competencia.

**c)** Pruebe $H_0:p=0.5$ vs $H_A:p>0.5$ con $\alpha=0.05$. Calcule también el p-valor.
**d)** Obtenga el IC del 95 % para $p$, y calcule qué $n$ haría falta para que el IC (con el mismo nivel) tuviera longitud a lo sumo $0.05$, **sin usar** el $\hat p$ de esta muestra.

---
---

# RESPUESTAS

> Cómo leer: en cada ejercicio primero **Modelo** (qué fórmula/distribución uso y por qué), después el paso a paso, y a veces **Otra forma** u **Observación**.

## Ejercicio 1

**Modelo:** cuento defectos en un período fijo con tasa constante ⇒ **Poisson**. Para comparar estimadores: $E(\hat\theta)$ (¿insesgado?), $V(\hat\theta)$, y si hace falta, $ECM=V+\text{sesgo}^2$. Por invarianza del EMV, $\widehat{P(X=0)}=e^{-\hat\lambda_{MV}}$, con $\hat\lambda_{MV}=\bar X$ (igual que por momentos).

**a)** $E(\hat\lambda_1)=E(\bar X)=\lambda$ y $E(\hat\lambda_2)=\frac{E(X_1)+E(X_n)}{2}=\frac{\lambda+\lambda}{2}=\lambda$: **los dos insesgados**.
$$V(\hat\lambda_1)=\frac{V(X)}{n}=\frac{\lambda}{n}=\frac{\lambda}{8}=0.125\lambda\qquad V(\hat\lambda_2)=\frac{V(X_1)+V(X_n)}{4}=\frac{2\lambda}{4}=\frac{\lambda}{2}=0.5\lambda$$
Como ambos son insesgados, $ECM=V$. $V(\hat\lambda_1)=0.125\lambda < V(\hat\lambda_2)=0.5\lambda$ para cualquier $n>2$: **$\hat\lambda_1=\bar X$ es mejor** (usa toda la muestra en vez de solo 2 datos).

**b)** $\sum x_i=3+5+2+4+6+3+5+4=32$.
$$\hat\lambda_{1,obs}=\bar x=\frac{32}{8}=\mathbf{4}\qquad \hat\lambda_{2,obs}=\frac{3+4}{2}=\mathbf{3.5}$$

**c)** $\hat\sigma_{\hat\lambda_1}=\sqrt{\hat\lambda_1/n}=\sqrt{4/8}=\sqrt{0.5}\approx\mathbf{0.7071}$ (se reemplaza $\lambda$ por $\hat\lambda_1=4$ en $V(\hat\lambda_1)=\lambda/n$).

**d)** $\widehat{P(X=0)}=e^{-\hat\lambda_1}=e^{-4}\approx\mathbf{0.0183}$.
*(Chequeo con la fórmula directa: $P(X=0)=e^{-\lambda}\lambda^0/0!=e^{-\lambda}$, igual.)*

---

## Ejercicio 2

**Modelo:** población normal, $n=20$. Con $\sigma$ conocida: Caso A ($z_{\alpha/2}$); con $\sigma$ desconocida: Caso B ($t_{\alpha/2,n-1}$, con $n-1=19$ grados de libertad).

**a)** $z_{0.025}=1.96$.
$$\bar x\pm z_{0.025}\frac{\sigma}{\sqrt n}=5.3\pm1.96\frac{0.8}{\sqrt{20}}=5.3\pm0.3506=\mathbf{[4.9494,\ 5.6506]}$$

**b)** $E=z_{0.025}\dfrac{\sigma}{\sqrt n}\le0.2$:
$$n\ge\left(\frac{1.96\times0.8}{0.2}\right)^2=61.46\ \Rightarrow\ \mathbf{n=62}$$
*(Siempre se redondea hacia ARRIBA: con $n=61$ el margen quedaría apenas por encima de 0.2.)*

**c)** $t_{0.025,19}=2.0930$ (tabla $t$, fila 19, columna 0.025).
$$5.3\pm2.0930\frac{0.95}{\sqrt{20}}=5.3\pm0.4446=\mathbf{[4.8554,\ 5.7446]}$$

**d)** Longitud de a) $=2(1.96)(0.8)/\sqrt{20}\approx0.7012$. Longitud de c) $=2(2.093)(0.95)/\sqrt{20}\approx0.8892$. La razón entre ambas es $0.8892/0.7012\approx1.268$, y se descompone en **dos factores independientes**:
$$\frac{t_{0.025,19}}{z_{0.025}}=\frac{2.093}{1.96}\approx1.068\qquad\qquad \frac{s}{\sigma}=\frac{0.95}{0.8}\approx1.188$$
El primer factor es el "impuesto" por no conocer $\sigma$ (la $t$ tiene colas más pesadas que la $z$ para compensar la incertidumbre de estimarla con $s$). El segundo factor es simplemente que, en este caso, $s=0.95$ resultó bastante mayor que $\sigma=0.8$ — **no** es que $s\approx\sigma$; de hecho el factor $s/\sigma$ pesa más en el cociente que el factor $t/z$.

---

## Ejercicio 3

**Modelo:** normal, $\sigma$ conocida ⇒ **Caso A** de test para la media. $H_0:\mu=\mu_0$ y como se sospecha que llena de MENOS, la alternativa es a cola inferior.

**a)** $H_0:\mu=500\qquad H_A:\mu<500$.

**b)** $$z_{obs}=\frac{(\bar x-\mu_0)\sqrt n}{\sigma}=\frac{(495.4-500)\sqrt{25}}{12}=\frac{-4.6\times5}{12}=\mathbf{-1.9167}$$
$RR=\{z\le-z_{0.05}\}=\{z\le-1.6449\}$. Como $-1.9167<-1.6449$: **se rechaza $H_0$** (hay evidencia de que la máquina llena de menos).

**c)** $p\text{-valor}=\Phi(z_{obs})=\Phi(-1.9167)\approx\mathbf{0.0276}$ (menor que $\alpha=0.05$, coincide con el rechazo).

**d)** Primero hallo el límite de la RR en términos de $\bar x$: $\bar x_c=\mu_0-z_{0.05}\frac{\sigma}{\sqrt n}=500-1.6449\frac{12}{5}=496.0522$.
$$\beta(490)=P(\bar X>496.0522\mid\mu=490)=P\!\left(Z>\frac{496.0522-490}{12/5}\right)=P(Z>2.522)\approx\mathbf{0.0058}$$
Potencia $=1-\beta\approx\mathbf{0.9942}$: con $n=25$, si la media real fuera 490 g, el test casi seguro lo detecta.

**e)** **Error de tipo I:** concluir que la máquina llena de menos cuando en realidad está bien calibrada (el $495.4$ fue solo una fluctuación del azar) — se pararía la producción sin necesidad, con el costo que eso implica.
**Error de tipo II:** NO detectar que la máquina efectivamente está llenando de menos — se seguirían vendiendo bolsas de menor peso que el declarado, lo cual puede ser más grave (reclamos de clientes, problemas legales por publicidad engañosa). En general, acá el error de tipo II es el más costoso para el fabricante a largo plazo.

**f)** Corresponde el **Caso B** (test para la media, $n$ grande, $\sigma$ desconocida): como $n=45\ge40$, por Slutsky se puede reemplazar $\sigma$ por $S$ y seguir usando la **misma tabla y el mismo estadístico $z$ que en el Caso A** (no hace falta pasar a $t$ — eso es justamente lo que distingue al Caso B del Caso C, que es para $n$ chico). Con $H_A:\mu<500$ igual que antes:
$$z_{obs}=\frac{(495.4-500)\sqrt{45}}{11.8}\approx\mathbf{-2.6151}$$
$RR=\{z\le-z_{0.05}\}=\{z\le-1.6449\}$. Como $-2.6151<-1.6449$: **se rechaza $H_0$** (p-valor $\approx0.0045$). *(Nótese que acá el estadístico salió más negativo que en b), aunque $\bar x$ es el mismo: con más datos ($n=45$ en vez de $25$) el error estándar es más chico, así que la misma diferencia observada pesa más como evidencia.)*

---

## Ejercicio 4

**Modelo (I):** mediciones ANTES/DESPUÉS en el MISMO paciente ⇒ **apareadas**: se trabaja con $D_i=\text{antes}_i-\text{después}_i$ como una sola muestra.
**Modelo (II):** dos máquinas, muestras independientes, $\sigma$ conocidas ⇒ **Caso A** de dos poblaciones.

**a)** $H_0:\mu_D=0$ vs $H_A:\mu_D>0$ (si el tratamiento reduce la presión, antes $>$ después, $D>0$).
Diferencias $d_i=$ antes$-$después: $7,8,3,10,7,8,7,4$. $\bar d=6.75$, $s_d\approx2.2520$.
$$t_{obs}=\sqrt n\frac{\bar d}{s_d}=\sqrt8\frac{6.75}{2.2520}\approx\mathbf{8.478}$$
$t_{0.05,7}=1.8946$. Como $8.478\gg1.8946$: **se rechaza $H_0$**; hay evidencia fuerte de que el tratamiento reduce la presión arterial media (p-valor $\approx0.00003$, prácticamente 0).

**b)** $\sigma_{\bar X_A-\bar X_B}=\sqrt{\sigma_A^2/n_A+\sigma_B^2/n_B}=\sqrt{15^2/12+20^2/15}\approx6.7392$.
$$IC_{95\%}=(340-325)\pm1.96(6.7392)=15\pm13.2088=\mathbf{[1.7912,\ 28.2088]}$$

**c)** $z_{obs}=\dfrac{\bar x_A-\bar x_B}{6.7392}=\dfrac{15}{6.7392}\approx\mathbf{2.2258}$. $RR=\{|z|\ge z_{0.025}=1.96\}$. Como $2.2258>1.96$: **se rechaza $H_0$** (hay diferencia significativa entre las medias). Coincide con el IC de b): el 0 **no** pertenece a $[1.7912,\ 28.2088]$, mismo resultado por dualidad.

---

## Ejercicio 5

**Modelo:** normal con $\mu$ desconocida ⇒ test e IC para $\sigma^2$ usan $\chi^2_{n-1}$ (Caso C). Para la proporción, $n$ grande ⇒ $Z$ aproximadamente normal.

**a)** $\chi^2_{obs}=\dfrac{(n-1)s^2}{\sigma_0^2}=\dfrac{19\times2.3}{1.5}=\dfrac{43.7}{1.5}\approx\mathbf{29.1333}$.
Valores críticos (19 g.l.): $\chi^2_{0.975,19}=8.9065$ (chico) y $\chi^2_{0.025,19}=32.8523$ (grande).
$RR=\{\chi^2\le8.9065\}\cup\{\chi^2\ge32.8523\}$. Como $29.1333$ no cae ahí: **no se rechaza $H_0$** (los datos son compatibles con $\sigma^2=1.5$). p-valor $=2\min\{P(\chi^2<29.13),P(\chi^2>29.13)\}\approx2(0.0639)\approx0.1278>0.05$, coincide.

**b)** Para el 90 %: $\chi^2_{0.95,19}=10.1170$ (chico) y $\chi^2_{0.05,19}=30.1435$ (grande).
$$\sigma^2\in\left[\frac{43.7}{30.1435},\ \frac{43.7}{10.1170}\right]=\mathbf{[1.4497,\ 4.3195]}\qquad \sigma\in[\sqrt{1.4497},\sqrt{4.3195}]\approx\mathbf{[1.2040,\ 2.0783]}$$
*(Ojo con el orden: el extremo inferior usa el $\chi^2$ GRANDE en el denominador, y el superior el CHICO — al revés que con $z$ o $t$, porque $\sigma^2$ está en el denominador del pivote.)*

**c)** $\hat p=85/150\approx0.5667$.
$$z_{obs}=\frac{(\hat p-0.5)\sqrt n}{\sqrt{0.5\times0.5}}=\frac{0.0667\times\sqrt{150}}{0.5}\approx\mathbf{1.6330}$$
*(Ojo: en el estadístico del test se usa $p_0=0.5$ en el denominador, no $\hat p$.)*
$RR=\{z\ge z_{0.05}=1.6449\}$. Como $1.6330<1.6449$: **no se rechaza $H_0$** (está muy cerca del límite). p-valor $=1-\Phi(1.6330)\approx\mathbf{0.0512}$, apenas por encima de 0.05: coherente con no rechazar, pero por muy poco.

**d)** $IC_{95\%}=\hat p\pm z_{0.025}\sqrt{\hat p(1-\hat p)/n}=0.5667\pm1.96\sqrt{\tfrac{0.5667\times0.4333}{150}}\approx0.5667\pm0.0793=\mathbf{[0.4874,\ 0.6460]}$.
Para el $n$ independiente de $\hat p$, se usa la cota $\hat p(1-\hat p)\le\tfrac14$:
$$n\ge\left(\frac{z_{0.025}}{L}\right)^2=\left(\frac{1.96}{0.05}\right)^2=1536.6\ \Rightarrow\ \mathbf{n=1537}$$
