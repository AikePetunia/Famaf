# Probabilidad y Estadística — Parcial II (práctica C, CLAUDE ejercicios)

> Armado con el estilo de los parciales 2024/2025 (misma profe): 4 ejercicios, 8 puntos, ítems a/b/c/d/e, mezclando temas dentro de un mismo ejercicio (MV/momentos + invarianza, IC para $p$ + tamaño de muestra, test Caso C ($n$ chico) + dualidad, dos poblaciones Caso B + dos niveles de $\alpha$).
> Completa a las prácticas A y B (no se repiten los mismos sub-temas). *(No incluye regresión lineal: según el cronograma, Parcial 2 llega hasta la Clase XXI y regresión son las Clases XXII-XXIII, posteriores — no entra en el examen.)*
> Convención: z, t y χ² con 4 decimales; resultados finales con 4 decimales (o redondeo natural si es un n de muestra).

| 1a | 1b | 1c | 2a | 2b | 2c | 3a | 3b | 3c | 3d | 3e | 4a | 4b | 4c | 4d |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2 puntos) Momentos, máxima verosimilitud e invarianza

Sea $X$ una v.a. continua con densidad
$$f(x;\theta)=\theta x^{\theta-1},\qquad 0<x<1,\qquad \theta>0$$

**a)** Halle el estimador de momentos $\hat\theta_{mom}$ y el de máxima verosimilitud $\hat\theta_{MV}$ para una muestra $X_1,\dots,X_n$ iid. *(Ayuda: $E(X)=\dfrac{\theta}{\theta+1}$.)*
**b)** Con $n=10$ y $\sum_{i=1}^{10}\ln(x_i)=-4.5$, calcule $\hat\theta_{MV,obs}$. Si en cambio se sabe que $\bar x=0.75$, calcule $\hat\theta_{mom,obs}$ (son datos de dos muestras distintas, no busque que coincidan).
**c)** Usando $\hat\theta_{MV,obs}$ de b), estime $P(X>0.5)$ por invarianza del EMV.

---

## ▶ 2. (2 puntos) IC para una proporción y tamaño de muestra

**a)** A partir de $\hat p=\dfrac{X}{n}$ (con $X\sim\text{Binomial}(n,p)$) y la aproximación normal $\dfrac{\hat p - p}{\sqrt{p(1-p)/n}}\approx N(0,1)$ para $n$ grande, escriba el pivote y deduzca la fórmula del IC de nivel $1-\alpha$ para $p$ (reemplazando $p$ por $\hat p$ en el error estándar).

En una encuesta a $n=400$ personas, $268$ se mostraron a favor de una política pública.

**b)** Obtenga el IC del **99 %** para $p$.
**c)** ¿Qué tamaño de muestra habría que usar para que el margen de error, al mismo nivel de confianza, fuera la **mitad** del de b)? (sin volver a usar el $\hat p$ de esta muestra en la cuenta, es decir, calculando directamente en función del $n$ de b)).

---

## ▶ 3. (2 puntos) Test para la media con $\sigma$ desconocida, $n$ chico (Caso C) y dualidad

Un fabricante prueba un lote piloto de $n=16$ baterías artesanales y afirma que la duración media es $\mu_0=500$ ciclos de carga. La duración se distribuye aproximadamente normal, con $\sigma$ desconocida (y, al ser $n$ chico, no corresponde la aproximación del Caso B).

**a)** Plantee $H_0$ y $H_A$ (bilateral).
**b)** Con la muestra piloto se obtuvo $\bar x=480$, $s=34$. Decida con $\alpha=0.05$ y con $\alpha=0.01$ (indique si cambia la conclusión).
**c)** Calcule el p-valor (puede acotarlo entre dos columnas de la tabla $t$, o darlo exacto si tiene calculadora/software).
**d)** Obtenga el IC del 95 % para $\mu$ y verifique la dualidad con la decisión de b) al 5 %.
**e)** A diferencia del Caso A, el Caso C no tiene fórmula cerrada para $\beta(\mu)$ ni para el tamaño de muestra $n$. ¿Por qué? (pista: piense qué distribución tendría el estadístico de prueba bajo una alternativa $\mu\ne\mu_0$, no bajo $H_0$).

---

## ▶ 4. (2 puntos) Dos poblaciones, varianzas iguales (Caso B) y dos niveles de $\alpha$

Se comparan los tiempos de espera medios (minutos) en dos sucursales de un banco, con muestras independientes y **suponiendo varianzas iguales** (la variabilidad del proceso de atención es la misma en ambas sucursales, solo cambia el personal/afluencia). Sucursal 1: $n_1=20$, $\bar x_1=12.4$, $s_1=3$. Sucursal 2: $n_2=25$, $\bar x_2=10.8$, $s_2=2.5$.

**a)** Plantee $H_0$ y $H_A$ para probar si la sucursal 1 tiene un tiempo de espera medio **mayor** que la sucursal 2 (unilateral).
**b)** Calcule la varianza combinada (pooled) $S_p^2$ y decida con $\alpha=0.05$ y con $\alpha=0.01$.
**c)** Calcule el p-valor.
**d)** Obtenga el IC del 90 % para $\mu_1-\mu_2$ (con varianzas agrupadas) y compare su límite inferior con el de la decisión de b) al 5 %.

---
---

# RESPUESTAS

> Cómo leer: primero **Modelo**, después el paso a paso, y a veces **Otra forma** u **Observación**. Los cuantiles de $t$ se dan con 4 decimales exactos (no hace falta interpolar en tabla).

## Ejercicio 1

**Modelo:** método de momentos ⇒ igualar $E(X)$ (poblacional) con $\bar X$ (muestral) y despejar $\theta$. Máxima verosimilitud ⇒ armar $L(\theta)=\prod f(x_i;\theta)$, tomar $\ln L$, derivar e igualar a 0. Invarianza del EMV: si $g$ es una función, $\widehat{g(\theta)}=g(\hat\theta_{MV})$.

**a)** **Momentos:** de $E(X)=\dfrac{\theta}{\theta+1}=\bar X$ se despeja
$$\bar X(\theta+1)=\theta\ \Rightarrow\ \theta(\bar X-1)=-\bar X\ \Rightarrow\ \hat\theta_{mom}=\frac{\bar X}{1-\bar X}$$
**MV:** $L(\theta)=\prod_{i=1}^n\theta x_i^{\theta-1}=\theta^n\left(\prod x_i\right)^{\theta-1}$.
$$\ln L(\theta)=n\ln\theta+(\theta-1)\sum\ln x_i\ \Rightarrow\ \frac{d\ln L}{d\theta}=\frac{n}{\theta}+\sum\ln x_i=0\ \Rightarrow\ \hat\theta_{MV}=\frac{-n}{\sum\ln X_i}$$
*(Tiene sentido el signo: como $0<x_i<1$, $\ln x_i<0$, entonces $\sum\ln x_i<0$ y $\hat\theta_{MV}>0$.)*

**b)** $\hat\theta_{MV,obs}=\dfrac{-10}{-4.5}\approx\mathbf{2.2222}$. Con $\bar x=0.75$: $\hat\theta_{mom,obs}=\dfrac{0.75}{1-0.75}=\dfrac{0.75}{0.25}=\mathbf{3.0000}$.

**c)** $F(x;\theta)=x^\theta$ en $(0,1)$ (se integra $f$), entonces $P(X>0.5)=1-F(0.5;\theta)=1-0.5^\theta$. Por invarianza, con $\hat\theta_{MV}=2.2222$:
$$\widehat{P(X>0.5)}=1-0.5^{2.2222}\approx\mathbf{0.7857}$$

---

## Ejercicio 2

**Modelo:** $\hat p$ aproximadamente normal para $n$ grande (TCL aplicado a una Binomial); el IC se construye "despejando" $p$ de la desigualdad $|\hat p-p|\le z_{\alpha/2}\sqrt{p(1-p)/n}$, y se reemplaza $p$ por $\hat p$ dentro de la raíz para poder calcularlo.

**a)** Partiendo de $P\!\left(-z_{\alpha/2}\le\dfrac{\hat p-p}{\sqrt{p(1-p)/n}}\le z_{\alpha/2}\right)\approx1-\alpha$, se despeja $p$ (aproximando el error estándar con $\hat p$):
$$IC_{1-\alpha}(p)=\hat p\pm z_{\alpha/2}\sqrt{\frac{\hat p(1-\hat p)}{n}}$$

**b)** $\hat p=268/400=0.67$. $z_{0.005}=2.5758$.
$$se=\sqrt{\frac{0.67\times0.33}{400}}\approx0.0235\qquad E=2.5758\times0.0235\approx0.0606$$
$$IC_{99\%}=0.67\pm0.0606=\mathbf{[0.6094,\ 0.7306]}$$

**c)** El margen de error es $E=z_{\alpha/2}\sqrt{\hat p(1-\hat p)/n}\propto 1/\sqrt n$. Para que el nuevo margen sea la mitad, $\sqrt{n_{nuevo}}=2\sqrt{n}$, es decir $n_{nuevo}=4n=4(400)=\mathbf{1600}$.

---

## Ejercicio 3

**Modelo:** población normal, $\sigma$ desconocida, **$n$ chico** ⇒ **Caso C**, $T=\dfrac{\bar X-\mu_0}{S/\sqrt n}\sim t_{n-1}$ **exactamente** bajo $H_0$ (a diferencia del Caso B, acá no hace falta ni se puede apelar al TCL: $n=16$ no es grande, así que hace falta la distribución exacta $t_{n-1}$, y para que valga esa distribución exacta la población tiene que ser normal).

**a)** $H_0:\mu=500\qquad H_A:\mu\ne500$.

**b)** $se=\dfrac{34}{\sqrt{16}}=8.5$. $$t_{obs}=\frac{480-500}{8.5}\approx\mathbf{-2.3529}$$
Con $\alpha=0.05$: $t_{0.025,15}=2.1314$, $RR=\{|t|\ge2.1314\}$. Como $2.3529>2.1314$: **se rechaza $H_0$**.
Con $\alpha=0.01$: $t_{0.005,15}=2.9467$. Como $2.3529<2.9467$: **no se rechaza**. Acá **sí cambia** la conclusión según el nivel, igual que en el ejemplo de los focos del apunte: hay evidencia moderada (significativa al 5 %, no al 1 %).

**c)** $p\text{-valor}=2\,P(T_{15}\le-2.3529)\approx\mathbf{0.0327}$. Con tabla (sin interpolar) solo se puede acotar: como $2.1314<2.3529<2.9467$, el p-valor cae entre $0.01$ y $0.05$ — consistente con b).

**d)** $$IC_{95\%}=480\pm2.1314\times8.5\approx480\pm18.1173=\mathbf{[461.8827,\ 498.1173]}$$
El valor $\mu_0=500$ **no** pertenece al intervalo, coherente con el rechazo de $H_0:\mu=500$ al 5 % en b) (dualidad test-IC, ambos bilaterales al mismo nivel).

**e)** Bajo $H_0$, $T=\dfrac{\bar X-\mu_0}{S/\sqrt n}\sim t_{n-1}$ (t central, la de siempre). Pero si la verdadera media es $\mu\ne\mu_0$ (la hipótesis bajo la cual se calcula $\beta$), ese mismo estadístico pasa a tener distribución $t$ **no central**, con parámetro de no centralidad $\delta=\dfrac{(\mu-\mu_0)\sqrt n}{\sigma}$ — y $\sigma$ es justamente lo que no conocemos. En el Caso A, como $\sigma$ es conocida, $\beta(\mu)$ se puede escribir con la $Z$ de siempre evaluada en otro punto; en el Caso C no hay una fórmula cerrada simple porque haría falta integrar la densidad de una $t$ no central (que depende de $\sigma$, que es justo el parámetro molesto que no tenemos). Por eso el apunte dice explícitamente que para este caso no se da fórmula de $\beta$ ni de tamaño de muestra $n$.

---

## Ejercicio 4

**Modelo:** dos muestras independientes, **se asume** $\sigma_1=\sigma_2$ ⇒ **Caso B** de dos poblaciones: se combina la información de ambas muestras en una varianza agrupada $S_p^2$, y $T=\dfrac{\bar X_1-\bar X_2}{S_p\sqrt{1/n_1+1/n_2}}\sim t_{n_1+n_2-2}$ bajo $H_0$ (a diferencia de Welch, que usa $gl$ de Satterthwaite y no agrupa varianzas).

**a)** $H_0:\mu_1=\mu_2\qquad H_A:\mu_1>\mu_2$.

**b)** $gl=n_1+n_2-2=43$.
$$S_p^2=\frac{(n_1-1)s_1^2+(n_2-1)s_2^2}{n_1+n_2-2}=\frac{19(9)+24(6.25)}{43}=\frac{171+150}{43}\approx7.4651\ \Rightarrow\ S_p\approx2.7322$$
$$se_{pooled}=S_p\sqrt{\frac{1}{20}+\frac{1}{25}}=2.7322\sqrt{0.09}\approx0.8197\qquad t_{obs}=\frac{12.4-10.8}{0.8197}\approx\mathbf{1.9520}$$
Con $\alpha=0.05$ (unilateral): $t_{0.05,43}=1.6811$, $RR=\{t\ge1.6811\}$. Como $1.9520>1.6811$: **se rechaza $H_0$** (hay evidencia de que la sucursal 1 tarda más).
Con $\alpha=0.01$: $t_{0.01,43}=2.4163$. Como $1.9520<2.4163$: **no se rechaza**. Acá **sí cambia** la conclusión según el nivel: significativo al 5 % pero no al 1 % — la evidencia es "moderada", no abrumadora.

**c)** $p\text{-valor}=P(T_{43}\ge1.9520)\approx\mathbf{0.0287}$ (entre 0.01 y 0.05, consistente con b)).

**d)** $t_{0.05,43}=1.6811$ (mismo cuantil que el test unilateral al 5 %, porque $1-2(0.05)=0.90$):
$$IC_{90\%}(\mu_1-\mu_2)=(12.4-10.8)\pm1.6811(0.8197)\approx1.6\pm1.3786=\mathbf{[0.2214,\ 2.9786]}$$
El límite inferior de este IC, $0.2214$, coincide (salvo redondeo) con el límite $\bar x_1-\bar x_2-t_{0.05,43}\,se_{pooled}$ que separa la RR del test unilateral de b): ambos "no dejan pasar" el valor 0, de forma consistente con el rechazo al 5 %. *(Formalmente la dualidad exacta con el test unilateral es con un IC de un solo extremo, $[0.2214,+\infty)$; el IC90 bilateral que se pide acá comparte ese mismo límite inferior pero además acota por arriba.)*
