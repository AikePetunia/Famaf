# Probabilidad y Estadística — Parcial I (práctica A, CLAUDE ejercicios)

> Armado con el estilo de los parciales 2024/2025 (misma profe): 5 ejercicios, 10 puntos, ítems a/b/c/d, mezclando temas dentro de un mismo ejercicio (Bayes + Normal + Binomial, Poisson + TLC, conjunta + covarianza).
> Los ejercicios están **modificados** de los TP 1–4 y de los parciales 2023–2025: cambié contexto y números, no la mecánica. Sumé Covarianza/correlación, independencia, TLC, Chi-cuadrado y Lognormal (TP3 ej. 16–17).
> Convención: Φ de tabla con 2 decimales, resultados con 4 decimales. Tiempo sugerido: 2 h.

| 1a | 1b | 1c | 1d | 1e | 1f | 2a | 2b | 2c | 3a | 3b | 3c | 3d | 3e | 4a | 4b | 4c | 4d | 5a | 5b | 5c | 5d | 5e |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2 puntos)

Sea $X$ el número de impresoras fuera de servicio en un laboratorio en un día elegido al azar, con función de probabilidad de masa

| $x$ | 0 | 1 | 2 | 3 | 4 |
|---|---|---|---|---|---|
| $p(x)$ | 0.3 | $a$ | $c$ | 0.2 | 0.1 |

**a)** Determine $a$ y $c$ sabiendo que $E(X)=1.5$. Justifique.
**b)** Obtenga la función de distribución acumulada de $X$.
**c)** Calcule $V(X)$ y $E(Z)$ con $Z = 2X^2+1$.
**d)** Sea $Y=1$ si el aire acondicionado del laboratorio está apagado ese día e $Y=0$ si no. Si $Y$ es independiente de $X$ y $P(Y=1)=0.2$, calcule la tabla de doble entrada de la distribución conjunta de $X$ e $Y$.
**e)** Encuentre $\text{Cov}(X,Y)$ y $P(X\ge 3\mid Y=1)$.
**f)** Calcule $V(X+Y)$ y $P(X+Y\ge 4)$.

---

## ▶ 2. (1.5 puntos)

El número de consultas por día que llegan al mail de la secretaría de la facultad puede modelarse con una distribución Poisson de parámetro $\lambda = 3.2$.

**a)** ¿Cuál es la probabilidad de que un día no llegue ninguna consulta?
**b)** ¿Cuál es la probabilidad de que en dos días lleguen por lo menos 2 consultas en total? (Suponga que los días son independientes.)
**c)** Suponga que un cuatrimestre tiene 90 días. Aproxime la probabilidad de que lleguen a lo sumo 300 consultas en el cuatrimestre.

---

## ▶ 3. (2 puntos)

Sean $X$ e $Y$ las proporciones de uso de CPU de dos procesos, con $X\le Y$. La función de densidad conjunta es

$$f(x,y)=\begin{cases} k\,y & 0\le x\le y\le 1\\ 0 & \text{en otro caso}\end{cases}$$

**a)** Determine el valor de $k$.
**b)** Halle las densidades marginales de $X$ y de $Y$.
**c)** ¿Son $X$ e $Y$ independientes? Justifique.
**d)** Calcule $P(Y\le \tfrac12)$ y $P(X+Y<1)$.
**e)** Calcule $\text{Cov}(X,Y)$ y el coeficiente de correlación. Interprete.

---

## ▶ 4. (2.5 puntos)

Un laboratorio recibe muestras de un compuesto de dos proveedores: el 30 % del proveedor A y el 70 % del proveedor B. La concentración del compuesto (en mg/l) de una muestra de A se distribuye normal con media 50 y desviación estándar 4; la de una muestra de B, normal con media 52 y desviación estándar 1.5. Una muestra se considera aceptable si su concentración está entre 46 y 56.

**a)** Si se elige una muestra al azar, ¿cuál es la probabilidad de que sea aceptable?
**b)** Si la muestra elegida resulta aceptable, calcule la probabilidad de que sea del proveedor A.
**c)** ¿Qué concentración $t$ deja por debajo al 90 % de las muestras del proveedor A?
**d)** Se eligen 10 muestras del proveedor A, independientes. ¿Cuál es la probabilidad de que por lo menos 9 sean aceptables?

---

## ▶ 5. (2 puntos)  Otras distribuciones

**(I)** La variabilidad (en ms) de los tiempos de ejecución de un algoritmo sigue una distribución chi-cuadrado con $k=6$ grados de libertad, $W\sim\chi^2(6)$.

**a)** Calcule la media y la varianza de $W$.
**b)** Calcule $P(W>12.59)$ y $P(W\le 1.64)$ (use la tabla de valores críticos).
**c)** Si $Z_1,\dots,Z_6$ son normales estándar independientes, ¿qué distribución tiene $Z_1^2+\dots+Z_6^2$? ¿Cómo cambia la media si una optimización reduce los grados de libertad a 4?

**(II)** El tiempo de respuesta $X$ (en ms) de un servidor es lognormal con parámetros $\mu=3$ y $\sigma=0.5$, es decir $\ln X\sim N(3,\,0.5^2)$.

**d)** Halle la media y la mediana de $X$.
**e)** Calcule $P(X<30)$ y $P(X>25)$.

---
---

# RESPUESTAS

> Cómo leer: en cada ejercicio primero **Modelo** (qué distribución/propiedad uso y por qué), después el paso a paso, y a veces **Otra forma** (otro camino válido para chequear).

## Ejercicio 1

**Modelo:** $X$ *cuenta* impresoras → variable **discreta**. Se usa la pmf ($\sum p=1$, $p\ge0$), $E(X)=\sum x\,p(x)$, $V(X)=E(X^2)-E(X)^2$ y $E(g(X))=\sum g(x)p(x)$. Para $d)$–$f)$ uso independencia: $P(X=x,Y=y)=P(X=x)P(Y=y)$.

**a)** Dos incógnitas → dos ecuaciones.
- Suma 1: $0.3+a+c+0.2+0.1=1 \Rightarrow a+c=0.4$.
- Esperanza: $0\cdot0.3+1\cdot a+2c+3\cdot0.2+4\cdot0.1=1.5 \Rightarrow a+2c=0.5$.
- Restando: $c=0.1$ y entonces $a=0.3$. Ambos $\ge0$ ✓.

pmf: $p=(0.3,\,0.3,\,0.1,\,0.2,\,0.1)$.

**b)** Acumulo: $F(0)=0.3$, $F(1)=0.6$, $F(2)=0.7$, $F(3)=0.9$, $F(4)=1$.

$$F(x)=\begin{cases}0 & x<0\\0.3 & 0\le x<1\\0.6 & 1\le x<2\\0.7 & 2\le x<3\\0.9 & 3\le x<4\\1 & x\ge4\end{cases}$$

(Escalonada: es discreta, salta en los valores de $X$ y es continua a derecha.)

**c)** $E(X^2)=0+0.3+4(0.1)+9(0.2)+16(0.1)=0.3+0.4+1.8+1.6=4.1$.
$V(X)=4.1-1.5^2=4.1-2.25=\mathbf{1.85}$.
$E(Z)=E(2X^2+1)=2E(X^2)+1=2(4.1)+1=\mathbf{9.2}$ (linealidad; **no** hace falta la pmf de $Z$).

**d)** $P(Y=0)=0.8$, $P(Y=1)=0.2$. Por independencia multiplico cada fila:

| $X\backslash Y$ | 0 | 1 | $p_X$ |
|---|---|---|---|
| 0 | 0.24 | 0.06 | 0.3 |
| 1 | 0.24 | 0.06 | 0.3 |
| 2 | 0.08 | 0.02 | 0.1 |
| 3 | 0.16 | 0.04 | 0.2 |
| 4 | 0.08 | 0.02 | 0.1 |
| $p_Y$ | 0.8 | 0.2 | 1 |

**e)** Independientes ⇒ $E(XY)=E(X)E(Y)$ ⇒ $\text{Cov}(X,Y)=\mathbf{0}$.
*Chequeo:* $E(Y)=0.2$; $E(XY)=\sum x\cdot1\cdot P(X=x,Y=1)=0.06+0.04+0.12+0.08=0.30=1.5\cdot0.2$ ✓.
$P(X\ge3\mid Y=1)=P(X\ge3)=0.2+0.1=\mathbf{0.3}$ (condicionar a algo independiente no cambia nada).

**f)** $V(Y)=0.2\cdot0.8=0.16$ (Bernoulli: $pq$). Como son independientes, $V(X+Y)=V(X)+V(Y)=1.85+0.16=\mathbf{2.01}$.
$P(X+Y\ge4)$: casos $(4,0),(3,1),(4,1)$: $0.08+0.04+0.02=\mathbf{0.14}$.

---

## Ejercicio 2

**Modelo:** cuento eventos (consultas) en un intervalo fijo de tiempo, con independencia entre intervalos ⇒ **Poisson**, con $E(X)=V(X)=\lambda$. Propiedad clave: si $X_i\sim\text{Poisson}(\lambda_i)$ independientes, $\sum X_i\sim\text{Poisson}(\sum\lambda_i)$ (TP2 ej. 15). Para $\lambda$ grande uso **TLC** (TP4 ej. 14).

**a)** $P(X=0)=e^{-3.2}\dfrac{3.2^0}{0!}=e^{-3.2}\approx\mathbf{0.0408}$.

**b)** En 2 días: $T\sim\text{Poisson}(6.4)$.
$P(T\ge2)=1-P(T=0)-P(T=1)=1-e^{-6.4}(1+6.4)=1-0.001662\cdot7.4\approx\mathbf{0.9877}$.
*(El complemento ahorra sumar infinitos términos.)*

**c)** En 90 días: $S\sim\text{Poisson}(90\cdot3.2=288)$, con $E(S)=V(S)=288$. $S$ es suma de 90 Poisson iid ⇒ por TLC $S\approx N(288,\,288)$, $\sigma=\sqrt{288}\approx16.97$.

$$P(S\le300)\approx P\!\left(Z\le\frac{300-288}{16.97}\right)=\Phi(0.71)=\mathbf{0.7611}$$

*Con corrección por continuidad* (sumar 0.5, como pide tu teórico): $\Phi\!\left(\frac{300.5-288}{16.97}\right)=\Phi(0.74)=0.7704$. La profe, en el parcial 2025, resolvió sin corrección: conviene aclarar en la hoja cuál usás. Las dos dan ≈0.76–0.77.

---

## Ejercicio 3

**Modelo:** par de variables **continuas** con densidad conjunta ⇒ integrales dobles. Región **triangular** $0\le x\le y\le1$ (por eso hay que cuidar los límites: si integro en $x$ primero va de $0$ a $y$; si integro en $y$ primero va de $x$ a $1$).

**a)** $\displaystyle\int_0^1\!\!\int_0^y k\,y\,dx\,dy=k\int_0^1 y\cdot y\,dy=\frac k3=1\Rightarrow \mathbf{k=3}$.
*Otra forma (orden inverso):* $\int_0^1\int_x^1 k\,y\,dy\,dx=k\int_0^1\frac{1-x^2}{2}dx=k\left(\frac12-\frac16\right)=\frac k3$ ✓.

**b)**
$f_X(x)=\displaystyle\int_x^1 3y\,dy=\frac{3(1-x^2)}{2}$, $0\le x\le1$.
$f_Y(y)=\displaystyle\int_0^y 3y\,dx=3y^2$, $0\le y\le1$.
*Chequeo:* $\int_0^1 3y^2dy=1$ ✓ y $\int_0^1\frac{3(1-x^2)}2dx=\frac32\cdot\frac23=1$ ✓.

**c)** **No son independientes.** $f_X(x)f_Y(y)=\frac92y^2(1-x^2)\ne3y=f(x,y)$. Además el soporte es un triángulo, no un rectángulo: saber $Y$ acota los valores de $X$ ($X\le Y$).

**d)** $P(Y\le\tfrac12)=\displaystyle\int_0^{1/2}3y^2dy=\left(\tfrac12\right)^3=\mathbf{\tfrac18=0.125}$ (con la marginal, sin doble integral).

$P(X+Y<1)$: región $0\le x\le y$, $y<1-x$ (⇒ $x\le\frac12$):
$$\int_0^{1/2}\!\!\int_x^{1-x}3y\,dy\,dx=\int_0^{1/2}\frac32\big[(1-x)^2-x^2\big]dx=\frac32\int_0^{1/2}(1-2x)dx=\frac32\cdot\frac14=\mathbf{\tfrac38}$$

**e)** $E(X)=\int_0^1x\frac{3(1-x^2)}2dx=\frac32\left(\frac12-\frac14\right)=\frac38$; $E(Y)=\int_0^13y^3dy=\frac34$.
$E(XY)=\int_0^1\!\int_0^y xy\cdot3y\,dx\,dy=\int_0^13y^2\frac{y^2}2dy=\frac32\cdot\frac15=\frac3{10}$.
$$\text{Cov}(X,Y)=\frac3{10}-\frac38\cdot\frac34=\frac3{10}-\frac9{32}=\frac3{160}\approx\mathbf{0.01875}$$
$V(X)=E(X^2)-E(X)^2=\frac15-\frac9{64}=0.059375$ (con $E(X^2)=\int x^2\frac{3(1-x^2)}2=\frac15$); $V(Y)=\frac35-\frac9{16}=0.0375$.
$$\rho=\frac{0.01875}{\sqrt{0.059375\cdot0.0375}}\approx\mathbf{0.397}$$
**Interpretación:** correlación positiva moderada: cuando $Y$ es grande, $X$ tiende a ser algo mayor (tiene sentido, $X\le Y$). Cov $\ne0$ es coherente con que no sean independientes (ojo: la recíproca no vale).

---

## Ejercicio 4

**Modelo:** la concentración es **continua** y "normal" (enunciado) ⇒ estandarizo $Z=\frac{X-\mu}{\sigma}$ y uso Φ de tabla. Como hay dos poblaciones con proporciones dadas ⇒ **probabilidad total** y **Bayes**. En $d)$ cuento "aceptables" entre 10 muestras independientes con misma probabilidad ⇒ **Binomial**.

**a)** Sea $Ac$ = aceptable.
- A: $X_A\sim N(50,4^2)$: $P(46\le X_A\le56)=\Phi\!\left(\frac{56-50}{4}\right)-\Phi\!\left(\frac{46-50}{4}\right)=\Phi(1.5)-\Phi(-1)=0.9332-0.1587=0.7745$.
- B: $X_B\sim N(52,1.5^2)$: $\Phi\!\left(\frac{56-52}{1.5}\right)-\Phi\!\left(\frac{46-52}{1.5}\right)=\Phi(2.67)-\Phi(-4)=0.9962-0.0000=0.9962$.

Prob. total: $P(Ac)=0.3(0.7745)+0.7(0.9962)=0.23235+0.69734=\mathbf{0.9297}$.

**b)** Bayes:
$$P(A\mid Ac)=\frac{P(Ac\mid A)P(A)}{P(Ac)}=\frac{0.23235}{0.92969}\approx\mathbf{0.2499}$$
Notar: A aporta 30 % de las muestras pero solo ≈25 % de las aceptables (A es peor: tiene más dispersión).

**c)** Busco $t$ con $P(X_A\le t)=0.90$ ⇒ $\Phi\!\left(\frac{t-50}4\right)=0.90$ ⇒ $\frac{t-50}{4}=1.28$ (tabla inversa) ⇒ $t=50+1.28\cdot4=\mathbf{55.12}$ mg/l (percentil 90).

**d)** $W$ = cantidad de aceptables entre 10 de A $\sim\text{Bin}(10,\,0.7745)$.
$$P(W\ge9)=P(W=9)+P(W=10)=10(0.7745)^9(0.2255)+(0.7745)^{10}\approx0.2262+0.0776\approx\mathbf{0.3038}$$
(Binomial porque son ensayos independientes con misma probabilidad de "éxito" 0.7745, calculada en $a)$; se reutiliza el resultado anterior.)

---

## Ejercicio 5

**Modelo (I):** Chi-cuadrado $\chi^2(k)$: suma de $k$ normales estándar al cuadrado; $E=k$, $V=2k$; sin fórmula simple de acumulada ⇒ **tabla de valores críticos** (fila = grados de libertad, columna = área a la derecha). Es un caso de Gamma con $\alpha=k/2$, $\lambda=1/2$.

**a)** $E(W)=k=\mathbf6$, $V(W)=2k=\mathbf{12}$.

**b)** En la tabla, fila $k=6$: el valor crítico con área $0.05$ a la derecha es $12.59$ ⇒ $P(W>12.59)=\mathbf{0.05}$.
El valor $1.64$ deja área $0.95$ a la derecha (columna 0.95) ⇒ $P(W>1.64)=0.95$ ⇒ $P(W\le1.64)=1-0.95=\mathbf{0.05}$.

**c)** Por definición, $Z_1^2+\dots+Z_6^2\sim\chi^2(6)$. Con $k=4$ la media pasa de 6 a 4 (baja; la varianza de 12 a 8).

**Modelo (II):** Lognormal: $X>0$ y $\ln X\sim N(\mu,\sigma^2)$. **OJO:** $\mu,\sigma^2$ son media y varianza de $\ln X$, no de $X$. Para probabilidades: aplico $\ln$ a ambos lados y estandarizo. $E(X)=e^{\mu+\sigma^2/2}$, mediana $=e^{\mu}$.

**d)** $E(X)=e^{3+0.25/2}=e^{3.125}\approx\mathbf{22.76}$ ms; mediana $=e^{3}\approx\mathbf{20.09}$ ms. (Media > mediana: distribución asimétrica a la derecha, típico de tiempos de respuesta.)

**e)**
$P(X<30)=P(\ln X<\ln30)=\Phi\!\left(\frac{3.4012-3}{0.5}\right)=\Phi(0.80)=\mathbf{0.7881}$.
$P(X>25)=1-\Phi\!\left(\frac{\ln25-3}{0.5}\right)=1-\Phi\!\left(\frac{3.2189-3}{0.5}\right)=1-\Phi(0.44)=1-0.6700=\mathbf{0.3300}$.
