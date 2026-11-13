# Probabilidad y Estadística — Parcial I (práctica C, CLAUDE ejercicios)

> Armado a partir de tu autodiagnóstico sobre el Parcial I 2026 (ya rehecho — **no se reutiliza ningún enunciado de ahí**, solo se ataca el mismo tipo de error). Formato de la solución: igual al de los parciales resueltos (fórmula general → sustitución → tabla extendida si corresponde → **Respuesta** en negrita), no el formato compacto de las prácticas A/B.
>
> Mezcla variables discretas y continuas, distintos modelos de conteo y de tiempos, y lectura de tablas en varias direcciones. Como en un parcial real, parte del ejercicio es reconocer vos mismo qué corresponde usar en cada ítem — el enunciado no lo dice.
>
> Convención: $\Phi$ de tabla con **2 decimales** en el cuantil $z$, resultados con 4 decimales. Decimales con coma, como en los parciales reales.

| 1a | 1b | 1c | 1d | 1e | 2a | 2b | 2c | 3a | 3b | 3c | 3d | 4a | 4b | 4c | 5a | 5b | 5c | 5d |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2,5 puntos)

Un gimnasio registra, para cada socio elegido al azar, $X$ = número de clases **grupales** que tomó esa semana ($X\in\{0,1\}$) e $Y$ = número de clases **personalizadas** que tomó esa semana ($Y\in\{0,1,2\}$). La función de probabilidad conjunta es:

| $p(x,y)$ | $Y=0$ | $Y=1$ | $Y=2$ |
|---|---|---|---|
| $X=0$ | 0,10 | 0,15 | 0,05 |
| $X=1$ | 0,20 | 0,25 | 0,25 |

**a)** Encuentre las distribuciones marginales de $X$ e $Y$.
**b)** Encuentre $E(X)$, $E(Y)$, $V(X)$ y $V(Y)$.
**c)** Calcule $\text{Cov}(X,Y)$ y el coeficiente de correlación $\rho$. ¿Son $X$ e $Y$ independientes? Justifique.
**d)** Si se sabe que $X=0$, calcule $P(Y>1\mid X=0)$.
**e)** Cada clase grupal cuesta 3 y cada clase personalizada cuesta 2. Sea $Z$ el total de clases pagas en la semana. Calcule $E(Z)$ y $V(Z)$.

---

## ▶ 2. (2,5 puntos)

Dos sensores de una línea de producción miden, respectivamente, $X$ (en una escala $[0,1]$) e $Y$ (en una escala $[0,2]$), con densidad conjunta

$$f(x,y)=\begin{cases}k(x+y) & 0\le x\le 1,\ 0\le y\le 2\\ 0 & \text{en otro caso}\end{cases}$$

**a)** Determine $k$.
**b)** Halle las densidades marginales $f_X(x)$ y $f_Y(y)$.
**c)** ¿Son $X$ e $Y$ independientes? Justifique.
**d)** Calcule $E(X)$, $E(Y)$, $V(X)$, $V(Y)$, $\text{Cov}(X,Y)$ y $\rho$. Interprete el signo.

---

## ▶ 3. (2,5 puntos)

El tiempo de respuesta $X$ (en segundos) de un servidor ante una solicitud tiene un mínimo de procesamiento garantizado de 0,2 s, y para $x\ge0,2$ su densidad es

$$f(x)=0,5\,e^{-0,5(x-0,2)},\qquad x\ge0,2$$

**a)** Calcule $P(X\le 1,2)$, mostrando el cambio de variable en la integral.
**b)** Obtenga la función de distribución acumulada $F(x)$ completa.
**c)** Se miden 4 solicitudes independientes, todas con esta distribución. Calcule $P(\min\{X_1,\dots,X_4\}<1,2)$ y $P(\max\{X_1,\dots,X_4\}\le1,2)$.
**d)** Sabiendo que una solicitud ya tardó más de 1,2 s, calcule la probabilidad de que tarde más de 2,2 s en total.

---

## ▶ 4. (2 puntos)

Las fallas de un servidor web siguen un proceso de Poisson con tasa $\lambda=0,4$ fallas por **hora**.

**a)** ¿Cuál es la probabilidad de que no haya ninguna falla en un turno de 8 horas?
**b)** ¿Cuál es la probabilidad de que haya a lo sumo 2 fallas en un día completo (24 horas)?
**c)** Aproxime la probabilidad de que en una semana (7 días de 24 horas) haya más de 70 fallas.

---

## ▶ 5. (2,5 puntos)

El diámetro $X$ (en mm) de los rodamientos que produce una máquina es $X\sim N(\mu=15,\ \sigma=0,3)$. Un rodamiento es aceptable si su diámetro está entre 14,6 y 15,6 mm.

**a)** Calcule $P(X\le15,6)$ y $P(X\ge14,5)$ por separado (una es de cola superior, la otra de cola inferior).
**b)** Calcule $P(14,6\le X\le15,6)$.
**c)** ¿Qué diámetro caracteriza al 5 % más chico de todos los rodamientos (percentil 5)?
**d)** Se eligen 8 rodamientos al azar, de forma independiente. ¿Cuál es la probabilidad de que al menos uno esté fuera de especificación?

---
---

# RESPUESTAS

## Ejercicio 1

**Modelo:** $X,Y$ discretas con pmf conjunta dada por tabla. Primero las marginales (sumando filas/columnas), después $E,V,\text{Cov}$ con las fórmulas usuales. Para $d)$, cuidado: el condicionamiento reduce el espacio muestral a la fila $X=0$, y "$Y>1$" dentro de $\{0,1,2\}$ es **solo** $Y=2$.

**a)** Sumando cada fila y cada columna:

| $p(x,y)$ | $Y=0$ | $Y=1$ | $Y=2$ | $p_X(x)$ |
|---|---|---|---|---|
| $X=0$ | 0,10 | 0,15 | 0,05 | **0,30** |
| $X=1$ | 0,20 | 0,25 | 0,25 | **0,70** |
| $p_Y(y)$ | **0,30** | **0,40** | **0,30** | **1** |

$$p_X(x)=\begin{cases}0,30 & x=0\\0,70 & x=1\end{cases}\qquad p_Y(y)=\begin{cases}0,30 & y=0\\0,40 & y=1\\0,30 & y=2\end{cases}$$

**b)** $E(X)=0(0,30)+1(0,70)=\mathbf{0,70}$. $E(X^2)=0,70\Rightarrow V(X)=0,70-0,70^2=\mathbf{0,21}$.
$E(Y)=0(0,30)+1(0,40)+2(0,30)=0,40+0,60=\mathbf{1,00}$. $E(Y^2)=0,40+4(0,30)=1,60\Rightarrow V(Y)=1,60-1,00^2=\mathbf{0,60}$.

**c)** $E(XY)=\sum xy\,p(x,y)$: solo contribuyen los términos con $x=1$ (los de $x=0$ se anulan):
$$E(XY)=1\cdot1\cdot0,25+1\cdot2\cdot0,25=0,25+0,50=0,75$$
$$\text{Cov}(X,Y)=E(XY)-E(X)E(Y)=0,75-0,70\cdot1,00=\mathbf{0,05}$$
$$\rho=\frac{0,05}{\sqrt{0,21\cdot0,60}}=\frac{0,05}{\sqrt{0,126}}=\frac{0,05}{0,3550}\approx\mathbf{0,1409}$$
**Independencia:** $p_X(0)\cdot p_Y(0)=0,30\cdot0,30=0,09\ne0,10=p(0,0)$. Como no se cumple la igualdad para **al menos un** par, **no son independientes** (basta un par que falle; no hace falta chequear los seis).

**d)** $P(Y>1\mid X=0)=\dfrac{P(Y=2,X=0)}{P(X=0)}=\dfrac{0,05}{0,30}\approx\mathbf{0,1667}$.
*(Trampa común: calcular $P(Y\ge1\mid X=0)=\frac{0,15+0,05}{0,30}=0,6667$ — eso responde otra pregunta. "$Y>1$" en un rango $\{0,1,2\}$ excluye $Y=1$.)*

**e)** $E(Z)=3E(X)+2E(Y)=3(0,70)+2(1,00)=2,10+2,00=\mathbf{4,10}$.
$$V(Z)=9V(X)+4V(Y)+2(3)(2)\text{Cov}(X,Y)=9(0,21)+4(0,60)+12(0,05)=1,89+2,40+0,60=\mathbf{4,89}$$

---

## Ejercicio 2

**Modelo:** par **continuo** con densidad conjunta en un rectángulo $[0,1]\times[0,2]$ (no triangular: los límites de las integrales son simples, no dependen el uno del otro). Mismas fórmulas que en el caso discreto pero con $\int$ en vez de $\sum$.

**a)** $\displaystyle\int_0^1\!\!\int_0^2 k(x+y)\,dy\,dx=k\int_0^1\Big[xy+\tfrac{y^2}2\Big]_0^2dx=k\int_0^1(2x+2)\,dx=k\big[x^2+2x\big]_0^1=3k=1\Rightarrow\mathbf{k=\tfrac13}$.

**b)**
$$f_X(x)=\int_0^2\frac{x+y}3\,dy=\frac13\Big[xy+\frac{y^2}2\Big]_0^2=\frac{2x+2}3=\frac{2(x+1)}3,\quad 0\le x\le1$$
$$f_Y(y)=\int_0^1\frac{x+y}3\,dx=\frac13\Big[\frac{x^2}2+xy\Big]_0^1=\frac{0,5+y}3,\quad 0\le y\le2$$
*Chequeo:* $\int_0^1\frac{2(x+1)}3dx=\frac23\left(\frac12+1\right)=1$ ✓; $\int_0^2\frac{0,5+y}3dy=\frac13(1+2)=1$ ✓.

**c)** $f_X(0)\cdot f_Y(0)=\dfrac{2}{3}\cdot\dfrac{0,5}{3}=\dfrac{1}{9}\approx0,1111$, pero $f(0,0)=\dfrac13(0+0)=0$. Como $0,1111\ne0$, **no son independientes**.

**d)**
$$E(X)=\int_0^1x\cdot\frac{2(x+1)}3dx=\frac23\int_0^1(x^2+x)dx=\frac23\left(\frac13+\frac12\right)=\frac23\cdot\frac56=\mathbf{0,5556}$$
$$E(X^2)=\frac23\int_0^1(x^3+x^2)dx=\frac23\left(\frac14+\frac13\right)=\frac23\cdot\frac7{12}=0,3889\Rightarrow V(X)=0,3889-0,5556^2\approx\mathbf{0,0802}$$
$$E(Y)=\int_0^2y\cdot\frac{0,5+y}3dy=\frac13\int_0^2(0,5y+y^2)dy=\frac13\left(1+\frac83\right)=\frac13\cdot\frac{11}3=\mathbf{1,2222}$$
$$E(Y^2)=\frac13\int_0^2(0,5y^2+y^3)dy=\frac13\left(\frac43+4\right)=\frac13\cdot\frac{16}3=1,7778\Rightarrow V(Y)=1,7778-1,2222^2\approx\mathbf{0,2840}$$
$$E(XY)=\int_0^1\!\!\int_0^2\frac{xy(x+y)}3\,dy\,dx=\frac13\int_0^1 x\Big[2x+\frac83\Big]dx=\frac13\int_0^1\left(2x^2+\frac83x\right)dx=\frac13\left(\frac23+\frac43\right)=\frac13\cdot2=\mathbf{0,6667}$$
$$\text{Cov}(X,Y)=0,6667-0,5556\cdot1,2222\approx-\mathbf{0,0123}$$
$$\rho=\frac{-0,0123}{\sqrt{0,0802\cdot0,2840}}\approx-\mathbf{0,0818}$$
**Interpretación:** la correlación es casi nula y **negativa**, aunque $f(x,y)=\frac13(x+y)$ "parece" sugerir que $X$ e $Y$ crecen juntas. Esto es un buen recordatorio: la covarianza **no se puede adivinar** mirando la forma algebraica de $f$, hay que calcularla. El signo negativo aparece porque el rango de $Y$ (hasta 2) es más ancho que el de $X$ (hasta 1), y eso distorsiona cómo se reparte la masa conjunta en las esquinas.

---

## Ejercicio 3

**Modelo:** $X$ es una exponencial **desplazada** 0,2 s (tasa 0,5): $X=0,2+Z$ con $Z\sim\text{Exp}(0,5)$. La acumulada se arma integrando desde el borde del soporte, con cambio de variable $u=t-0,2$ — exactamente la construcción que te costó. El mínimo de i.i.d. usa $P(\min>t)=\big[P(X>t)\big]^n$.

**a)**
$$P(X\le1,2)=\int_{0,2}^{1,2}0,5\,e^{-0,5(t-0,2)}dt$$
Cambio $u=t-0,2$, $du=dt$; cuando $t=0,2$, $u=0$; cuando $t=1,2$, $u=1$:
$$=\int_0^1 0,5\,e^{-0,5u}\,du=\big[-e^{-0,5u}\big]_0^1=1-e^{-0,5}\approx\mathbf{0,3935}$$

**b) Caso 1:** $x<0,2$. Para estos $t$, $f(t)=0\Rightarrow F(x)=0$.
**Caso 2:** $x\ge0,2$. Igual que en $a)$ pero con límite superior genérico $x$:
$$F(x)=\int_{0,2}^x0,5\,e^{-0,5(t-0,2)}dt=\big[-e^{-0,5(t-0,2)}\big]_{0,2}^x=1-e^{-0,5(x-0,2)}$$
$$F(x)=\begin{cases}0 & x<0,2\\1-e^{-0,5(x-0,2)} & x\ge0,2\end{cases}$$

**c)** $P(X>1,2)=e^{-0,5(1,2-0,2)}=e^{-0,5}\approx0,6065$.
$$P(\min\{X_1,\dots,X_4\}<1,2)=1-\big[P(X\ge1,2)\big]^4=1-(0,6065)^4\approx\mathbf{0,8647}$$
$$P(\max\{X_1,\dots,X_4\}\le1,2)=\big[P(X\le1,2)\big]^4=(0,3935)^4\approx\mathbf{0,0240}$$
*(Para el máximo se usa $F$, no la supervivencia: "todas por debajo de 1,2" es intersección de 4 eventos independientes con la misma probabilidad $F(1,2)$.)*

**d)** $\{X>1,2\}=\{Z>1,0\}$ y $\{X>2,2\}=\{Z>2,0\}$. Por la propiedad de falta de memoria de la exponencial, $P(Z>s+t\mid Z>s)=P(Z>t)$:
$$P(X>2,2\mid X>1,2)=P(Z>2,0\mid Z>1,0)=P(Z>1,0)=e^{-0,5\cdot1,0}\approx\mathbf{0,6065}$$
(Es el mismo número que $P(X>1,2)$ en $c)$: tiene sentido, porque "ya esperaste 1 s de más" no cambia nada hacia adelante — la parte exponencial "olvida" cuánto pasó, el único corrimiento es el 0,2 s fijo del arranque.)

---

## Ejercicio 4

**Modelo:** Poisson con $\lambda=0,4$ **por hora**. Para cualquier intervalo distinto hay que **reescalar** $\lambda$ multiplicando por la cantidad de horas de ese intervalo — ese reescalado es justo lo que hay que leer con cuidado.

**a)** Turno de 8 h $\Rightarrow\lambda_{turno}=0,4\times8=3,2$.
$$P(X=0)=e^{-3,2}\approx\mathbf{0,0408}$$

**b)** Día de 24 h $\Rightarrow\lambda_{día}=0,4\times24=9,6$.
$$P(X\le2)=e^{-9,6}\left(1+9,6+\frac{9,6^2}{2}\right)=e^{-9,6}(1+9,6+46,08)\approx\mathbf{0,0038}$$

**c)** Semana de $7\times24=168$ h $\Rightarrow\lambda_{sem}=0,4\times168=67,2$. Es suma de muchas Poisson independientes (una por hora) con $\lambda$ grande $\Rightarrow$ por **TLC**, $S\approx N(67,2,\ 67,2)$, $\sigma=\sqrt{67,2}\approx8,198$.
$$P(S>70)\approx1-\Phi\!\left(\frac{70-67,2}{8,198}\right)=1-\Phi(0,34)=1-0,6331\approx\mathbf{0,3669}$$
*(Si en el enunciado la tasa estuviera dada "por día" en vez de "por hora" — por ejemplo $\lambda=0,4$ fallas/día — la de la semana sería $\lambda_{sem}=0,4\times7=2,8$, un número completamente distinto. Antes de reescalar, siempre identificá en qué unidad viene dado el $\lambda$ del enunciado.)*

---

## Ejercicio 5

**Modelo:** $X\sim N(15;\,0,3)$. Estandarizo con $Z=\frac{X-15}{0,3}$. Para el percentil 5 hay que buscar el $z$ tal que $\Phi(z)=0,05$, que al ser menor que 0,5 cae en la cola **inferior** y por lo tanto $z$ es **negativo** — justo el paso en el que conviene no confundir el área (0,05) con el valor de $z$.

**a)**
$$P(X\le15,6)=\Phi\!\left(\frac{15,6-15}{0,3}\right)=\Phi(2,00)\approx\mathbf{0,9772}$$
$$P(X\ge14,5)=1-\Phi\!\left(\frac{14,5-15}{0,3}\right)=1-\Phi(-1,67)=1-\big[1-\Phi(1,67)\big]=\Phi(1,67)\approx\mathbf{0,9525}$$

**b)**
$$P(14,5\le X\le15,6)=\Phi(2,00)-\Phi(-1,67)=0,9772-(1-0,9525)=0,9772-0,0475=\mathbf{0,9297}$$

**c)** Busco $z$ tal que $\Phi(z)=0,05$. Como $0,05<0,5$, el $z$ buscado es negativo: por simetría, $\Phi(z)=0,05\Leftrightarrow\Phi(-z)=0,95\Leftrightarrow -z=1,65$ (tabla: $\Phi(1,65)\approx0,9505$, el valor más cercano a 0,95) $\Rightarrow z=-1,65$.
$$x_{0,05}=15+(-1,65)(0,3)=15-0,495=\mathbf{14,505}\ \text{mm}$$
*(Ojo con el error típico: acá el valor que se despeja es $z=-1,65$, no $0,05$. El 0,05 es el **área**; el $z$ hay que buscarlo en el cuerpo de la tabla.)*

**d)** $P(\text{fuera de especificación})=1-0,9297=0,0703$ (complemento de $b)$).
$$P(\text{al menos 1 de 8 fuera})=1-(1-0,0703)^8=1-(0,9297)^8\approx\mathbf{0,4414}$$
