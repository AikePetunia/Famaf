# Probabilidad y Estadística — Parcial I (práctica E, CLAUDE ejercicios)

> A diferencia de C y D, estos **son** ejercicios reales de las guías 1 a 4 (tal cual, sin cambiarles contexto ni números), elegidos porque pegan justo en lo que marcaste flojo. Sirven para practicar con el material original de la cátedra y como banco de respuestas para autocorregirte cuando los hagas en frío según el plan de estudio.
>
> Convención: $\Phi$ de tabla con 2 decimales en el cuantil $z$, decimales con coma.

| 1a | 1b | 1c | 2a | 2b | 2c | 2d | 2e | 2f | 2g | 3a | 3b | 3c | 4a | 4b | 5a | 5b | 6a | 6b | 6c | 7a | 7b | 8a | 8b |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (Guía 1, Ej. 16 — adaptado a este formato)

Una compañía realiza el 50 % de sus envíos a través de la empresa de correos 1, el 40 % a través de la empresa 2 y el resto por la empresa 3. De los paquetes enviados por la empresa 1, el 2 % llega tarde a su destino. El 1 % de los paquetes enviados por la empresa 2 llega tarde y, de los enviados por la empresa 3, el 5 % llega tarde.

**a)** ¿Cuál es la probabilidad de que un paquete elegido al azar llegue tarde a su destino?
**b)** Si un paquete elegido al azar llega a tiempo, ¿cuál es la probabilidad de que haya sido enviado por la empresa 1?
**c)** Si se eligen 10 paquetes al azar de los enviados por esta compañía, ¿cuál es la probabilidad de que ninguno llegue tarde?

---

## ▶ 2. (Guía 1, Ej. 11)

Uno de cada 25 adultos está afectado de cierta enfermedad para la que se ha desarrollado una prueba diagnóstica. La prueba es tal que, cuando un individuo padece la enfermedad, el resultado de la prueba es positivo en un 99 % de las veces, mientras que un individuo sin la enfermedad mostrará un resultado positivo en el 2 % de las veces.

**a)** ¿Cuál es la probabilidad de que un resultado de la prueba sea positivo?
**b)** Dado que el resultado de la prueba es positivo, ¿cuál es la probabilidad de que el individuo tenga la enfermedad?
**c)** Dado que el resultado de la prueba es negativo, ¿cuál es la probabilidad de que el individuo no tenga la enfermedad?

---

## ▶ 3. (Guía 3, Ej. 3)

Un profesor siempre termina su clase después de que suena el timbre y antes de que hayan transcurrido 2 minutos desde que sonó. Sea $X$: tiempo (en minutos) que transcurre entre que suena el timbre y el término de la clase, con densidad

$$f(x)=\begin{cases}kx^2 & 0\le x\le2\\0 & \text{en otro caso}\end{cases}$$

**a)** Encuentre $k$. ¿Cuál es la probabilidad de que la clase termine antes de 1 minuto después de que suena el timbre?
**b)** ¿Cuál es la probabilidad de que la clase continúe entre 60 y 90 segundos después de que suena el timbre?
**c)** Obtenga la función de distribución acumulada de $X$, el percentil 75, $E(X)$, $\sigma_X$, y la probabilidad de que $X$ esté a menos de 1 desviación estándar de su valor medio.

---

## ▶ 4. (Guía 3, Ej. 7)

La distribución de resistencia para resistores de cierto tipo es normal. El 10 % de todos los resistores tiene una resistencia que excede los 10,256 ohms y el 5 % tiene una resistencia menor que 9,671 ohms.

**a)** ¿Cuáles son los valores de la media y la desviación estándar de la distribución de la resistencia?

---

## ▶ 5. (Guía 3, Ej. 12)

Un sistema consta de $n$ componentes idénticos conectados en serie: apenas falla un componente, falla todo el sistema. Cada componente dura un tiempo exponencial con parámetro $\lambda$, y fallan independientemente unos de otros. Sea $X$ el tiempo en que falla el sistema (la duración más breve entre los $n$ componentes).

**a)** Exprese el evento $\{X\ge t\}$ en términos de los eventos $A_i=\{$el componente $i$ dura al menos $t$ horas$\}$.
**b)** Calcule $P(X\ge t)$ y, a partir de ahí, la función de distribución y la densidad de $X$. ¿Qué distribución tiene $X$? Para $n=5$ y $\lambda=0,01$, calcule $P(X\ge100)$.

---

## ▶ 6. (Guía 4, Ej. 2)

Dada la función $f(x,y)=kxy$ si $0\le x\le1$, $0\le y\le1$ y $x+y\le1$, y $0$ en otro caso, con $k$ constante positiva.

**a)** Determine $k$.
**b)** Halle las densidades marginales de $X$ e $Y$.
**c)** Halle $E(X)$, $V(X)$, $E(Y)$ y $V(Y)$.
**d)** ¿Son independientes $X$ e $Y$? Justifique.

---

## ▶ 7. (Guía 4, Ej. 3)

Sean $X,Y$ variables aleatorias con densidad conjunta $f(x,y)=k(x+y)$ si $0\le x\le10$, $0\le y\le10$, y $0$ en otro caso.

**a)** ¿Cuál es el valor de $k$? Calcule $P(X+Y<5)$.
**b)** Halle las densidades marginales de $X$ e $Y$. ¿Son independientes? Calcule $\text{Cov}(X,Y)$.

---

## ▶ 8. (Guía 4, Ej. 5 + Ej. 11, combinados)

**(I)** Una persona tiene dos bombillas para una lámpara. Sean $X$ e $Y$ el tiempo de duración (en miles de horas) de la primera y la segunda, independientes e idénticamente distribuidas, exponenciales con $\lambda=1$.

**a)** ¿Cuál es la probabilidad de que ambas duren a lo sumo mil horas? ¿Y de que la duración total entre las dos sea a lo sumo 2000 horas?

**(II)** El tiempo que tarda un empleado en procesar el pedido de cada cliente tiene media 1,5 minutos y desvío estándar 1 minuto, con tiempos independientes entre pedidos.

**b)** ¿Cuál es la probabilidad aproximada de procesar los pedidos de 100 clientes en menos de 2 horas? Determine el menor $t_0$ tal que, con probabilidad aproximada de al menos 0,90, se procesen los 100 pedidos en menos de $t_0$.

---
---

# RESPUESTAS

## Ejercicio 1

**a)** $P(\text{tarde})=0,5(0,02)+0,4(0,01)+0,1(0,05)=0,010+0,004+0,005=\mathbf{0,019}$.

**b)**
$$P(E_1\mid\text{a tiempo})=\frac{P(\text{a tiempo}\mid E_1)P(E_1)}{P(\text{a tiempo})}=\frac{0,98\times0,5}{1-0,019}=\frac{0,49}{0,981}\approx\mathbf{0,4995}$$

**c)** $P(\text{ninguno tarde de 10})=(1-0,019)^{10}=(0,981)^{10}\approx\mathbf{0,8254}$.

---

## Ejercicio 2

Sea $D$ = tiene la enfermedad, $P(D)=1/25=0,04$.

**a)** $P(\text{pos})=P(\text{pos}\mid D)P(D)+P(\text{pos}\mid\bar D)P(\bar D)=0,99(0,04)+0,02(0,96)=0,0396+0,0192=\mathbf{0,0588}$.

**b)** $$P(D\mid\text{pos})=\frac{0,0396}{0,0588}\approx\mathbf{0,6735}$$

**c)** $P(\text{neg})=1-0,0588=0,9412$. $P(\bar D\cap\text{neg})=P(\text{neg}\mid\bar D)P(\bar D)=0,98\times0,96=0,9408$.
$$P(\bar D\mid\text{neg})=\frac{0,9408}{0,9412}\approx\mathbf{0,99958}$$
*(Casi seguro: con esta prevalencia tan baja, un resultado negativo es muy confiable — al revés de lo que pasa con un resultado positivo en $b)$, que solo da ≈67 % de certeza por la misma razón: la enfermedad es rara.)*

---

## Ejercicio 3

**a)** $\int_0^2kx^2dx=k\cdot\frac83=1\Rightarrow\mathbf{k=\frac38}$.
$$P(X<1)=\int_0^1\frac38x^2dx=\frac38\cdot\frac13=\mathbf{0,125}$$

**b)** 60 y 90 segundos = 1 y 1,5 minutos:
$$P(1<X<1,5)=\int_1^{1,5}\frac38x^2dx=\frac18\big(1,5^3-1^3\big)=\frac18(3,375-1)=\frac{2,375}{8}\approx\mathbf{0,2969}$$

**c)**
$$F(x)=\begin{cases}0 & x<0\\\dfrac{x^3}{8} & 0\le x\le2\\1 & x>2\end{cases}$$
Percentil 75: $\dfrac{x^3}{8}=0,75\Rightarrow x^3=6\Rightarrow x_{0,75}=\sqrt[3]{6}\approx\mathbf{1,8171}$.
$$E(X)=\int_0^2x\cdot\frac38x^2dx=\frac38\cdot\frac{16}4=\mathbf{1,5}\quad E(X^2)=\frac38\int_0^2x^4dx=\frac38\cdot\frac{32}5=2,4\Rightarrow V(X)=2,4-2,25=0,15,\ \sigma_X\approx\mathbf{0,3873}$$
$$P(|X-1,5|<0,3873)=P(1,1127<X<1,8873)=\frac{1,8873^3-1,1127^3}{8}\approx\mathbf{0,6681}$$

---

## Ejercicio 4

Sea $X\sim N(\mu,\sigma^2)$. Dos condiciones:
$$P(X>10,256)=0,10\Rightarrow\frac{10,256-\mu}{\sigma}=z_{0,10}\approx1,28$$
$$P(X<9,671)=0,05\Rightarrow\frac{9,671-\mu}{\sigma}=-z_{0,05}\approx-1,65$$
Restando la segunda ecuación de la primera (para cancelar $\mu$):
$$\frac{10,256-9,671}{\sigma}=1,28-(-1,65)=2,93\Rightarrow\sigma=\frac{0,585}{2,93}\approx\mathbf{0,1997\approx0,20}$$
$$\mu=10,256-1,28\,\sigma\approx10,256-0,256=\mathbf{10,00}$$

---

## Ejercicio 5

**a)** $\{X\ge t\}$ ocurre si y solo si **todos** los componentes duran al menos $t$: $\{X\ge t\}=A_1\cap A_2\cap\cdots\cap A_n$.

**b)** Por independencia, $P(X\ge t)=\prod_{i=1}^nP(A_i)=\prod_{i=1}^ne^{-\lambda t}=\left(e^{-\lambda t}\right)^n=e^{-n\lambda t}$.
$$F(t)=P(X\le t)=1-e^{-n\lambda t},\qquad f(t)=n\lambda\,e^{-n\lambda t},\quad t\ge0$$
Es decir, $X\sim\text{Exp}(n\lambda)$: el mínimo de $n$ exponenciales independientes (misma tasa) es exponencial con tasa $n\lambda$ — esto sí es un atajo válido, a diferencia de cuando las distribuciones no son todas exponenciales (ver práctica D, ejercicio 3).

Con $n=5,\ \lambda=0,01,\ t=100$: $$P(X\ge100)=e^{-5(0,01)(100)}=e^{-5}\approx\mathbf{0,0067}$$

---

## Ejercicio 6

**a)** Integrando sobre el triángulo $0\le x\le1-y$:
$$\int_0^1\int_0^{1-y}kxy\,dx\,dy=\int_0^1ky\cdot\frac{(1-y)^2}2dy=\frac k2\int_0^1y(1-y)^2dy=\frac k2\cdot\frac1{12}=\frac k{24}=1\Rightarrow\mathbf{k=24}$$
*(Usando $\int_0^1y(1-y)^2dy=\int_0^1(y-2y^2+y^3)dy=\frac12-\frac23+\frac14=\frac1{12}$.)*

**b)**
$$f_X(x)=\int_0^{1-x}24xy\,dy=24x\cdot\frac{(1-x)^2}2=12x(1-x)^2,\quad0\le x\le1$$
Por simetría, $f_Y(y)=12y(1-y)^2$, $0\le y\le1$.

**c)**
$$E(X)=\int_0^1x\cdot12x(1-x)^2dx=12\int_0^1x^2(1-x)^2dx=12\left(\frac13-\frac12+\frac15\right)=12\cdot\frac1{30}=\mathbf{0,4}$$
$$E(X^2)=12\int_0^1x^3(1-x)^2dx=12\left(\frac14-\frac25+\frac16\right)=12\cdot\frac1{60}=0,2\Rightarrow V(X)=0,2-0,16=\mathbf{0,04}$$
Por simetría, $E(Y)=\mathbf{0,4}$ y $V(Y)=\mathbf{0,04}$.

**d) No son independientes.** Alcanza con el soporte: $f(x,y)\ne0$ requiere $x+y\le1$, un triángulo, no un rectángulo — conocer $X$ restringe los valores posibles de $Y$. Numéricamente, en $(0,5;\,0,5)$: $f_X(0,5)f_Y(0,5)=\big(12\cdot0,5\cdot0,25\big)^2=1,5^2=2,25\ne f(0,5;0,5)=24(0,25)=6$.

---

## Ejercicio 7

**a)**
$$\int_0^{10}\int_0^{10}k(x+y)\,dy\,dx=k\int_0^{10}(10x+50)\,dx=k(500+500)=1000k=1\Rightarrow\mathbf{k=0,001}$$
Para $P(X+Y<5)$, con $c=5<10$ la región triangular no queda recortada por el cuadrado, y $\iint_{x+y<c}(x+y)\,dx\,dy=\frac{c^3}3$ (resultado general para este tipo de región):
$$P(X+Y<5)=0,001\cdot\frac{5^3}3=0,001\cdot41,667\approx\mathbf{0,0417}$$

**b)**
$$f_X(x)=\int_0^{10}0,001(x+y)\,dy=0,001(10x+50)=0,01x+0,05,\quad0\le x\le10$$
Por simetría, $f_Y(y)=0,01y+0,05$.
**No son independientes:** $f_X(0)f_Y(0)=0,05\times0,05=0,0025\ne f(0,0)=0,001(0)=0$.

$$E(X)=\int_0^{10}x(0,01x+0,05)dx=0,01\cdot\frac{1000}3+0,05\cdot50=3,3333+2,5=\frac{35}6\approx5,8333$$
Por simetría $E(Y)\approx5,8333$.
$$E(XY)=0,001\iint(x^2y+xy^2)\,dx\,dy=0,001\left[\left(\frac{1000}3\right)(50)+(50)\left(\frac{1000}3\right)\right]=0,001\cdot\frac{100000}3\approx33,3333$$
$$\text{Cov}(X,Y)=33,3333-5,8333^2\approx\mathbf{-0,6944}$$
*(Negativa, tiene sentido: dentro del cuadrado, la densidad $k(x+y)$ favorece las esquinas donde $x$ e $y$ son ambos grandes o ambos chicos de forma pareja — pero ojo, esto no se puede "ver" solo mirando la fórmula, siempre conviene calcularla.)*

---

## Ejercicio 8

**(I)** $f(x,y)=e^{-x}e^{-y}$ para $x,y>0$ (producto de densidades porque son independientes).
$$P(X\le1,Y\le1)=P(X\le1)P(Y\le1)=\big(1-e^{-1}\big)^2\approx\mathbf{0,3996}$$
La suma $T=X+Y\sim\text{Gamma}(2,1)$ (Erlang), con $P(T\le t)=1-e^{-t}(1+t)$:
$$P(X+Y\le2)=1-e^{-2}(1+2)=1-3e^{-2}\approx\mathbf{0,5940}$$

**(II)** Suma de $n=100$ tiempos i.i.d., $\mu=1,5$, $\sigma=1$. Por TLC, $S\approx N(150,\,100)$, $\sigma_S=10$. Dos horas = 120 minutos:
$$P(S<120)\approx\Phi\!\left(\frac{120-150}{10}\right)=\Phi(-3,00)\approx\mathbf{0,0013}$$
Busco $t_0$ con $P(S<t_0)\ge0,90\Rightarrow\dfrac{t_0-150}{10}=1,28\Rightarrow t_0=150+12,8=\mathbf{162,8}$ minutos.
