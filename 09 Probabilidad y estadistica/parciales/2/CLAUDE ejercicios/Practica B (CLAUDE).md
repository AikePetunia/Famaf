# Probabilidad y Estadística — Parcial II (práctica B, CLAUDE ejercicios)

> Armado con el estilo de los parciales 2024/2025 (misma profe): 5 ejercicios, 10 puntos, ítems a/b/c/d/e, mezclando temas dentro de un mismo ejercicio (estimadores + ECM, IC varianza + IC asintótico, test + potencia + tamaño de muestra, proporción grande/chica, Welch + apareadas).
> Pensado para **ejercitar fórmulas**, complementa a la Práctica A (no se repiten los mismos sub-temas).
> Convención: z, t y χ² con 4 decimales; resultados finales con 4 decimales (o redondeo natural si es un n de muestra).

| 1a | 1b | 1c | 2a | 2b | 2c | 3a | 3b | 3c | 3d | 3e | 4a | 4b | 4c | 5a | 5b | 5c | 5d |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2 puntos) Estimadores y ECM

Sea $X\sim U(0,\theta)$, $\theta>0$ desconocido, y $X_1,\dots,X_n$ una muestra iid, $n=10$. Se consideran tres estimadores de $\theta$:
$$\hat\theta_1=2\bar X \qquad M=\max(X_1,\dots,X_n) \qquad \hat\theta_2=\frac{n+1}{n}M$$

**a)** Para cada uno, indique si es insesgado y calcule su ECM en función de $\theta$ y $n$. *(Dato: para $M$, $E(M)=\dfrac{n}{n+1}\theta$ y $V(M)=\dfrac{n}{(n+1)^2(n+2)}\theta^2$.)*
**b)** Con la muestra $2.1,\ 5.4,\ 7.8,\ 3.3,\ 6.6,\ 8.9,\ 4.2,\ 7.1,\ 1.5,\ 9.3$ calcule las tres estimaciones.
**c)** Ordene los tres estimadores de mejor a peor según su ECM (para este $n$). ¿Qué le llama la atención del resultado si compara $M$ (sesgado) contra $\hat\theta_1$ (insesgado)?

---

## ▶ 2. (2 puntos) Intervalos de confianza: varianza y caso asintótico

Un proceso produce piezas cuyo diámetro (mm) se distribuye normal. Una muestra de $n=18$ piezas dio $s=4.2$.

**a)** Obtenga el IC del 95 % para $\sigma^2$ y para $\sigma$.

Por otro lado, el tiempo de atención en una ventanilla (distribución no necesariamente normal) se midió en $n=50$ clientes, con $\bar x=85$ y $s=6.1$ (segundos).

**b)** Justifique por qué acá corresponde un IC **asintótico** (Caso D) y no el Caso B, y obtenga el IC del 95 % para $\mu$.
**c)** ¿Qué pasaría con la longitud de ambos intervalos (a y b) si $n$ se multiplicara por 4, dejando todo lo demás igual? Justifique con la fórmula, sin recalcular.

---

## ▶ 3. (2 puntos) Test para la media, potencia y tamaño de muestra

El tiempo en los 100 m llanos de un grupo de atletas entrenados tiene distribución aproximadamente normal con $\sigma=0.05$ s (conocida de datos históricos). El entrenador afirma que un nuevo método de entrenamiento **mejora** (reduce) el tiempo medio respecto del valor histórico $\mu_0=0.25$ s.

**a)** Plantee $H_0$ y $H_A$.
**b)** Con $n=16$ atletas se obtuvo $\bar x=0.231$ s. Decida con $\alpha=0.01$.
**c)** Calcule el p-valor.
**d)** Si el verdadero tiempo medio con el nuevo método fuera $\mu=0.235$ s, calcule $\beta$ y la potencia del test (mismo $n=16$, $\alpha=0.01$). Interprete el número de potencia que obtiene.
**e)** ¿Qué tamaño de muestra haría falta para que, si $\mu=0.235$ s, $\beta\le0.05$ (manteniendo $\alpha=0.01$)?

---

## ▶ 4. (2 puntos) Proporciones: muestra grande y muestra chica

Una empresa de streaming afirma que el 60 % de sus usuarios usa la app todos los días. En una encuesta a 300 usuarios, 192 dijeron usarla todos los días.

**a)** Pruebe $H_0:p=0.6$ vs $H_A:p\ne0.6$ con $\alpha=0.05$, y calcule el p-valor.
**b)** Obtenga el IC del 95 % para $p$. ¿Es coherente con la decisión de a)? *(Nota: esta "dualidad" entre test e IC para proporciones es solo aproximada, porque el estadístico del test usa $p_0$ en el error estándar y el IC usa $\hat p$.)*

En otro contexto, se quiere testear $H_0:p=0.3$ vs $H_A:p<0.3$ con una muestra chica de $n=15$ (no vale la aproximación normal).

**c)** Usando $X\sim\text{Binomial}(15,0.3)$ bajo $H_0$, busque el $k$ tal que la región de rechazo $RR=\{X\le k\}$ tenga el nivel real $\alpha$ más cercano posible a $0.10$ **sin superarlo**. ¿Por qué no se puede lograr $\alpha=0.10$ exacto?

---

## ▶ 5. (2 puntos) Dos poblaciones: Welch y apareadas

Se comparan los tiempos de reacción (ms) ante un estímulo bajo dos condiciones experimentales, con muestras independientes y **sin suponer varianzas iguales**: Condición 1: $n_1=10$, $\bar x_1=4.2$, $s_1=1.8$. Condición 2: $n_2=8$, $\bar x_2=3.1$, $s_2=0.9$.

**a)** Calcule los grados de libertad de Welch (redondee hacia abajo) y pruebe $H_0:\mu_1=\mu_2$ vs $H_A:\mu_1>\mu_2$ con $\alpha=0.05$.

Para evaluar una dieta, se mide el colesterol (mg/dl) de 6 personas antes y después de 2 meses:

| Persona | 1 | 2 | 3 | 4 | 5 | 6 |
|---|---|---|---|---|---|---|
| Antes | 210 | 195 | 225 | 180 | 205 | 215 |
| Después | 198 | 188 | 210 | 175 | 192 | 205 |

**b)** Obtenga el IC del 95 % para la reducción media de colesterol $\mu_D$.
**c)** A partir del IC de b), ¿se puede concluir (con el mismo nivel) que la dieta reduce el colesterol en promedio? Justifique sin hacer un test nuevo.
**d)** ¿Por qué en a) se usa Welch (Caso C) y en b)–c) se usa el método de apareadas, y no, por ejemplo, un Caso B con varianzas agrupadas en ambos casos?

---
---

# RESPUESTAS

> Cómo leer: primero **Modelo**, después el paso a paso, y a veces **Otra forma** u **Observación**. Los cuantiles de $t$, $\chi^2$ y $z$ se dan con 4 decimales (equivalen a los que se leerían de la tabla, solo que sin redondeo de tabla).

## Ejercicio 1

**Modelo:** comparar estimadores vía $ECM=V(\hat\theta)+\text{sesgo}(\hat\theta)^2$; si es insesgado, $ECM=V$. Para $U(0,\theta)$: $E(\bar X)=\theta/2\Rightarrow E(2\bar X)=\theta$ (insesgado); $M$ es sesgado por abajo ($E(M)<\theta$ siempre, porque $M\le\theta$); $\hat\theta_2$ es la corrección de $M$ para hacerlo insesgado.

**a)**
- $\hat\theta_1=2\bar X$: insesgado. $V(2\bar X)=4V(\bar X)=4\dfrac{V(X)}{n}=4\dfrac{\theta^2/12}{n}=\dfrac{\theta^2}{3n}$. Como es insesgado, $ECM(\hat\theta_1)=\dfrac{\theta^2}{3n}$.
- $M$: sesgado, $\text{sesgo}(M)=E(M)-\theta=\dfrac{n}{n+1}\theta-\theta=-\dfrac{\theta}{n+1}$.
$$ECM(M)=V(M)+\text{sesgo}(M)^2=\frac{n\theta^2}{(n+1)^2(n+2)}+\frac{\theta^2}{(n+1)^2}=\frac{\theta^2}{(n+1)^2}\left(\frac{n}{n+2}+1\right)=\frac{2\theta^2}{(n+1)(n+2)}$$
- $\hat\theta_2=\dfrac{n+1}{n}M$: $E(\hat\theta_2)=\dfrac{n+1}{n}\cdot\dfrac{n}{n+1}\theta=\theta$, insesgado. $V(\hat\theta_2)=\left(\dfrac{n+1}{n}\right)^2V(M)=\left(\dfrac{n+1}{n}\right)^2\dfrac{n\theta^2}{(n+1)^2(n+2)}=\dfrac{\theta^2}{n(n+2)}$. Como es insesgado, $ECM(\hat\theta_2)=\dfrac{\theta^2}{n(n+2)}$.

Para $n=10$: $ECM(\hat\theta_1)=\theta^2/30\approx0.0333\theta^2$; $ECM(M)=2\theta^2/132\approx0.0152\theta^2$; $ECM(\hat\theta_2)=\theta^2/120\approx0.0083\theta^2$.

**b)** $n=10$, $\sum x_i=56.2\Rightarrow\bar x=5.62$, $m=\max=9.3$.
$$\hat\theta_{1,obs}=2(5.62)=\mathbf{11.24}\qquad m=\mathbf{9.3}\qquad \hat\theta_{2,obs}=\frac{11}{10}(9.3)=\mathbf{10.23}$$

**c)** Orden de mejor a peor (menor a mayor ECM): $\hat\theta_2$ (0.0083$\theta^2$) $<$ $M$ (0.0152$\theta^2$) $<$ $\hat\theta_1$ (0.0333$\theta^2$).
Lo llamativo: **$M$, que es sesgado, tiene menor ECM que $\hat\theta_1=2\bar X$, que es insesgado**. Un estimador insesgado no es automáticamente "mejor": lo que importa para comparar es el ECM completo (varianza + sesgo²), y acá la varianza de $M$ es tan chica que compensa de sobra su sesgo. Por eso $\hat\theta_2$ (que corrige exactamente ese sesgo sin agregar casi nada de varianza) termina siendo el mejor de los tres.

---

## Ejercicio 2

**Modelo:** población normal, varianza desconocida ⇒ Caso C ($\chi^2_{n-1}$) para $\sigma^2$. Para el Caso D (asintótico), no se pide normalidad: se usa que, para $n$ grande, $\dfrac{\bar X-\mu}{S/\sqrt n}\approx N(0,1)$ por TCL, reemplazando $\sigma$ por $s$.

**a)** $n-1=17$. $\chi^2_{0.975,17}=7.5642$ (chico), $\chi^2_{0.025,17}=30.1910$ (grande). $s^2=4.2^2=17.64$.
$$\sigma^2\in\left[\frac{17\times17.64}{30.1910},\ \frac{17\times17.64}{7.5642}\right]=\mathbf{[9.9328,\ 39.6447]}\qquad\sigma\in\mathbf{[3.1516,\ 6.2964]}$$

**b)** El Caso B exige que la **población** sea normal (para que $T=\frac{\bar X-\mu}{S/\sqrt n}$ tenga exactamente distribución $t_{n-1}$); acá no se sabe que el tiempo de atención sea normal (de hecho, tiempos de espera suelen ser asimétricos). Pero como $n=50$ es grande, el TCL garantiza que $\bar X$ es aproximadamente normal igual, y se puede usar el Caso D con $z$ en vez de $t$:
$$\bar x\pm z_{0.025}\frac{s}{\sqrt n}=85\pm1.96\frac{6.1}{\sqrt{50}}=85\pm1.6908=\mathbf{[83.3092,\ 86.6908]}$$

**c)** La longitud de cualquiera de los dos IC es proporcional a $1/\sqrt n$ (el resto de la fórmula no cambia). Si $n\to4n$, $\sqrt n\to2\sqrt n$, así que la longitud se **divide por 2** en ambos casos — el IC de a) pasaría a tener longitud $\approx(39.6447-9.9328)/2\cdot...$; más simple: cada semiancho se reduce a la mitad respecto del actual *(ojo: en el caso de $\sigma^2$ esto es aproximado, porque además cambian los $\chi^2_{n-1}$; para $\mu$, con $z$ fijo, es exacto)*.

---

## Ejercicio 3

**Modelo:** normal, $\sigma$ conocida ⇒ Caso A. Como se busca detectar una **mejora** (tiempo menor), $H_A$ es a cola inferior.

**a)** $H_0:\mu=0.25\qquad H_A:\mu<0.25$.

**b)** $$z_{obs}=\frac{(\bar x-\mu_0)\sqrt n}{\sigma}=\frac{(0.231-0.25)\sqrt{16}}{0.05}=\frac{-0.019\times4}{0.05}=\mathbf{-1.52}$$
$RR=\{z\le-z_{0.01}\}=\{z\le-2.3263\}$. Como $-1.52>-2.3263$ (no cae en la RR): **no se rechaza $H_0$** — con este tamaño de muestra y este nivel tan exigente ($\alpha=0.01$), la evidencia no alcanza para afirmar la mejora, aunque la media muestral sea menor que 0.25.

**c)** $p\text{-valor}=\Phi(z_{obs})=\Phi(-1.52)\approx\mathbf{0.0643}$ (mayor que $\alpha=0.01$: coherente con no rechazar; de hecho con $\alpha=0.05$ tampoco se rechazaría).

**d)** Límite de la RR en términos de $\bar x$: $\bar x_c=\mu_0-z_{0.01}\dfrac{\sigma}{\sqrt n}=0.25-2.3263\dfrac{0.05}{4}=0.2209$.
$$\beta(0.235)=P(\bar X>0.2209\mid\mu=0.235)=P\!\left(Z>\frac{0.2209-0.235}{0.05/4}\right)=P(Z>-1.1263)\approx\mathbf{0.8700}$$
Potencia $=1-\beta\approx\mathbf{0.1300}$. Interpretación: si el verdadero tiempo medio con el nuevo método fuera $0.235$ s (una mejora chica, de solo $0.015$ s respecto de $0.25$), este test con $n=16$ y $\alpha=0.01$ **solo detectaría esa mejora el 13 % de las veces** — está muy subdimensionado para una diferencia tan chica.

**e)** $\delta=\mu_0-\mu=0.25-0.235=0.015$ (cola inferior). Con $z_{0.01}=2.3263$ y $z_{0.05}=1.6449$ (para $\beta\le0.05\Rightarrow$ potencia $\ge0.95$):
$$n\ge\left(\frac{(z_{0.01}+z_{0.05})\sigma}{\delta}\right)^2=\left(\frac{(2.3263+1.6449)(0.05)}{0.015}\right)^2\approx175.23\ \Rightarrow\ \mathbf{n=176}$$
*(Comparar con d): para pasar de potencia 0.13 a potencia 0.95 frente a la misma diferencia, hace falta multiplicar la muestra por más de 10 — así de caro es detectar diferencias chicas.)*

---

## Ejercicio 4

**Modelo:** proporción, $n$ grande ⇒ $Z\approx N(0,1)$ tanto en el test (con $p_0$ en el error estándar) como en el IC (con $\hat p$). Para $n$ chico, se usa la Binomial exacta.

**a)** $\hat p=192/300\approx0.6400$. $$z_{obs}=\frac{\hat p-p_0}{\sqrt{p_0(1-p_0)/n}}=\frac{0.04}{\sqrt{0.6\times0.4/300}}\approx\mathbf{1.4142}$$
$RR=\{|z|\ge z_{0.025}=1.96\}$. Como $1.4142<1.96$: **no se rechaza $H_0$**. p-valor$=2(1-\Phi(1.4142))\approx\mathbf{0.1573}>0.05$: coherente.

**b)** $$IC_{95\%}=\hat p\pm z_{0.025}\sqrt{\frac{\hat p(1-\hat p)}{n}}=0.64\pm1.96\sqrt{\frac{0.64\times0.36}{300}}\approx0.64\pm0.0543=\mathbf{[0.5857,\ 0.6943]}$$
El 0.6 **sí** pertenece al intervalo, coherente con no rechazar $H_0:p=0.6$ en a). *(Como dice la nota del enunciado, esta coincidencia no está garantizada en general porque el test usa $p_0(1-p_0)$ y el IC usa $\hat p(1-\hat p)$ en el error estándar — son aproximaciones distintas que casi siempre, pero no siempre, dan la misma conclusión.)*

**c)** Bajo $H_0$, $X\sim\text{Binomial}(15,0.3)$. Probabilidades acumuladas:
$$P(X\le1)\approx0.0353\qquad P(X\le2)\approx0.1268$$
Con $k=1$: $\alpha_{real}=0.0353\le0.10$ ✓. Con $k=2$: $\alpha_{real}=0.1268>0.10$ ✗ (ya se pasó). Entonces **$RR=\{X\le1\}$**, con nivel real $\alpha=0.0353$.
No se puede lograr $\alpha=0.10$ exacto porque $X$ es **discreta**: el conjunto de valores posibles de $P(X\le k)$ es un conjunto finito de números (uno por cada $k=0,\dots,15$), y $0.10$ simplemente no es ninguno de ellos; hay que "saltar" al $k$ más grande que no supere el nivel nominal, lo cual deja el test más conservador de lo pedido.

---

## Ejercicio 5

**Modelo (a):** dos muestras independientes, varianzas no necesariamente iguales ⇒ **Welch (Caso C)**: $T=\dfrac{\bar X_1-\bar X_2}{\sqrt{S_1^2/n_1+S_2^2/n_2}}$, con $T\sim t_{gl}$ aproximadamente, $gl$ dado por la fórmula de Welch-Satterthwaite (se redondea **hacia abajo**).
**Modelo (b)-(c):** mismos sujetos medidos dos veces ⇒ **apareadas**: se trabaja con $D_i=\text{antes}_i-\text{después}_i$.

**a)** $se=\sqrt{\dfrac{1.8^2}{10}+\dfrac{0.9^2}{8}}=\sqrt{0.324+0.10125}\approx0.6521$.
$$gl=\frac{\left(\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2}\right)^2}{\frac{(s_1^2/n_1)^2}{n_1-1}+\frac{(s_2^2/n_2)^2}{n_2-1}}\approx13.77\ \Rightarrow\ \mathbf{gl=13}\text{ (redondeando hacia abajo)}$$
$$t_{obs}=\frac{4.2-3.1}{0.6521}\approx\mathbf{1.6868}$$
$t_{0.05,13}=1.7709$. Como $1.6868<1.7709$: **no se rechaza $H_0$** (muy cerca del límite). p-valor $\approx\mathbf{0.0577}$, apenas por encima de 0.05.

**b)** Diferencias $d_i=$ antes$-$después: $12,7,15,5,13,10$. $\bar d\approx10.3333$, $s_d\approx3.7771$ ($n=6$, $5$ g.l.).
$t_{0.025,5}=2.5706$.
$$IC_{95\%}=\bar d\pm t_{0.025,5}\frac{s_d}{\sqrt6}=10.3333\pm2.5706\frac{3.7771}{\sqrt6}\approx10.3333\pm3.9638=\mathbf{[6.3695,\ 14.2972]}$$

**c)** Como el IC $[6.3695,\ 14.2972]$ está **enteramente por encima de 0** (no contiene al 0), es equivalente a rechazar $H_0:\mu_D=0$ a favor de $H_A:\mu_D\ne0$ con $\alpha=0.05$ — y como además todo el intervalo es positivo, hay evidencia de que $\mu_D>0$, es decir, que el colesterol **disminuye** en promedio con la dieta (por dualidad test-IC, sin necesidad de calcular un $t_{obs}$ nuevo).

**d)** En a) las muestras son de **sujetos distintos e independientes** (condición 1 vs condición 2, personas distintas), y no hay motivo para suponer que ambas condiciones tengan la misma varianza del tiempo de reacción ⇒ Welch. En b)-c) son **las mismas 6 personas** medidas dos veces: antes y después no son independientes entre sí (una persona con colesterol alto antes probablemente lo tenga alto después también), así que tratarlas como dos muestras independientes (con Caso B o Welch) sería incorrecto — ahí se necesita el método de apareadas, que elimina la variabilidad entre personas trabajando directamente con las diferencias $D_i$. Un Caso B (varianzas agrupadas) tampoco sería apropiado en a) porque no hay razón para asumir $\sigma_1=\sigma_2$ (el enunciado lo dice explícitamente).
