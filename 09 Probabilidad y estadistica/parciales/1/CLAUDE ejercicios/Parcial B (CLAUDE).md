# Probabilidad y Estadística — Parcial I (práctica B, CLAUDE ejercicios)

> Estilo de los parciales 2024-10-04 / 2024-11-18 / 2024-11-19 / 2025: Bayes con 3 clases, densidad/acumulada con constantes a determinar, Binomial Negativa (Boca–Talleres), combinaciones lineales de variables (como $Z=bX+Y$), TLC, exponencial con mínimo de independientes.
> Ejercicios **modificados** de los TP 1–4 y de esos parciales (cambié contextos y números). Sumé independencia de eventos, Hipergeométrica, De Moivre–Laplace, Gamma (bomba de reserva, TP3 ej. 13) y Weibull (TP3 ej. 15).
> Convención: Φ de tabla con 2 decimales. Tiempo sugerido: 2 h.

| 1a | 1b | 1c | 1d | 1e | 2a | 2b | 2c | 2d | 2e | 3a | 3b | 3c | 3d | 3e | 4a | 4b | 4c | 4d | 4e | 5a | 5b | 5c | 5d |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (2 puntos)

Un taller recibe chips de tres proveedores: el 45 % de $P_1$, el 35 % de $P_2$ y el 20 % de $P_3$. Un chip resulta defectuoso con probabilidad 0.02 si es de $P_1$, 0.03 si es de $P_2$ y 0.05 si es de $P_3$.

**a)** Calcule la probabilidad de que un chip elegido al azar sea defectuoso.
**b)** Un chip elegido al azar resulta defectuoso. Se decide atribuirlo al proveedor con mayor $P(\text{proveedor}\mid\text{defectuoso})$. Identifique a qué proveedor se lo atribuye.
**c)** ¿Son independientes los eventos "el chip es defectuoso" y "el chip es de $P_3$"? Justifique.
**d)** Si se sabe que el chip no es de $P_3$, ¿cuál es la probabilidad de que no sea defectuoso?
**e)** Se eligen 10 chips al azar, de forma independiente, del total recibido. ¿Cuál es la probabilidad de que ninguno sea defectuoso?

---

## ▶ 2. (2 puntos)

Sea $X$ una variable aleatoria continua con función de distribución acumulada

$$F(x)=\begin{cases}0 & x<0\\ a\,x^3 & 0\le x<2\\ c & x\ge2\end{cases}$$

donde $a$ y $c$ son constantes.

**a)** Determine $a$ y $c$. Justifique.
**b)** Halle la función de densidad de $X$.
**c)** Calcule $P(1\le X\le 1.5)$ y $P(X\le1.5\mid X\ge1)$.
**d)** Calcule $E(X)$ y $V(X)$.
**e)** Calcule $E(Z)$ con $Z=4X^2-3$ y el percentil 75 de $X$.

---

## ▶ 3. (1.5 puntos)

**(I)** Una jugadora de básquet convierte cada tiro libre con probabilidad $p=0.7$, de forma independiente. Va a tirar hasta convertir 3 tiros.

**a)** ¿Cuál es la probabilidad de que necesite exactamente 5 tiros?
**b)** ¿Cuál es la probabilidad de que necesite a lo sumo 4 tiros?
**c)** Escriba una relación entre el número de tiros realizados y el número de tiros fallados, y úsela para dar el número esperado de tiros fallados.

**(II)** El club tiene 12 pelotas, de las cuales 4 están desinfladas. Se eligen 5 al azar (sin reposición). Sea $H$ el número de pelotas desinfladas entre las 5.

**d)** Calcule $P(H=1)$ y $P(H\ge3)$.
**e)** Calcule $E(H)$ y $V(H)$.

---

## ▶ 4. (2 puntos)

Sean $X$ e $Y$ variables aleatorias con $E(X)=4$, $E(Y)=6$, $V(X)=9$, $V(Y)=16$ y coeficiente de correlación $\rho(X,Y)=0.5$.

**a)** Calcule $\text{Cov}(X,Y)$. ¿Son independientes $X$ e $Y$? Justifique.
**b)** Sea $W=2X-Y$. Calcule $E(W)$ y $V(W)$.
**c)** Calcule $\text{Cov}(2X-Y,\;X+3Y)$ e interprete.

El tiempo que tarda un empleado en atender a cada cliente es una variable aleatoria de media 3 minutos y desvío estándar 1.5 minutos; los tiempos de clientes distintos son independientes.

**d)** ¿Cuál es la probabilidad aproximada de que pueda atender a 64 clientes en menos de 198 minutos? ¿Cuál es el menor $t_0$ tal que, con probabilidad aproximada de al menos 0.90, atienda a 64 clientes en menos de $t_0$ minutos?

**e)** El 20 % de los correos que recibe es urgente. De 150 correos, aproxime la probabilidad de que a lo sumo 35 sean urgentes.

---

## ▶ 5. (2.5 puntos)

**(I)** Un dispositivo consta de 4 componentes idénticos conectados **en serie** (falla el dispositivo apenas falla uno). La duración de cada componente es exponencial con media 500 horas, y los componentes fallan independientemente.

**a)** Calcule la probabilidad de que el dispositivo dure más de 100 horas. ¿Qué distribución tiene la duración del dispositivo y cuánto vale su media?

**(II)** Un transbordador lleva dos bombas de combustible: una activa y otra de reserva, que se activa automáticamente cuando falla la principal. Cada bomba dura un tiempo exponencial y en promedio falla una vez cada 50 horas (independientes). Una misión requiere bombear durante 80 horas.

**b)** ¿Cuál es la probabilidad de que el sistema de bombas no funcione las 80 horas completas? Diga qué distribución tiene el tiempo total de funcionamiento y cuánto valen su media y su varianza.

**(III)** La vida útil (en horas) de una válvula sigue una distribución Weibull con parámetro de forma $\alpha=2$ y de escala $\beta=100$, $F(x)=1-e^{-(x/\beta)^{\alpha}}$ para $x\ge0$.

**c)** Calcule $P(W>80)$ y $P(50\le W\le120)$.
**d)** Calcule la esperanza de $W$.

---
---

# RESPUESTAS

> **Modelo** = qué distribución/propiedad uso y por qué; **Otra forma** = camino alternativo para chequear.

## Ejercicio 1

**Modelo:** población dividida en 3 grupos que forman una **partición** ($P_1,P_2,P_3$ disjuntos, suman 100 %) ⇒ **probabilidad total** y **Bayes**. En $e)$ 10 chips independientes con misma probabilidad ⇒ producto (o Binomial con $k=0$).

Sea $D$ = defectuoso.

**a)** $P(D)=0.45(0.02)+0.35(0.03)+0.20(0.05)=0.009+0.0105+0.010=\mathbf{0.0295}$.

**b)** Bayes para cada proveedor (el denominador es el mismo, $0.0295$):
- $P(P_1\mid D)=\frac{0.009}{0.0295}=0.3051$
- $P(P_2\mid D)=\frac{0.0105}{0.0295}=\mathbf{0.3559}$
- $P(P_3\mid D)=\frac{0.010}{0.0295}=0.3390$

(Suman 1 ✓.) Se lo atribuye a **$P_2$**, aunque $P_1$ es el que más chips aporta: pesa la combinación cantidad × tasa de defectos. *(Truco: como el denominador es común, alcanza comparar los numeradores $0.009,\,0.0105,\,0.010$.)*

**c)** Independientes ⇔ $P(D\cap P_3)=P(D)P(P_3)$.
$P(D\cap P_3)=0.20\cdot0.05=0.010$ y $P(D)P(P_3)=0.0295\cdot0.20=0.0059$. Como $0.010\ne0.0059$, **no son independientes**. *(Otra forma: $P(D\mid P_3)=0.05\ne P(D)=0.0295$.)*

**d)** $P(\bar D\mid\overline{P_3})=\dfrac{P(\bar D\cap(P_1\cup P_2))}{P(P_1\cup P_2)}=\dfrac{0.45(0.98)+0.35(0.97)}{0.80}=\dfrac{0.441+0.3395}{0.80}=\mathbf{0.9756}$.

**e)** Cada chip es defectuoso con prob. $0.0295$ (total, $a)$) e independiente:
$P(\text{ninguno})=(1-0.0295)^{10}=0.9705^{10}\approx\mathbf{0.7412}$. *(Es $P(\text{Bin}(10,0.0295)=0)$.)*

---

## Ejercicio 2

**Modelo:** $X$ **continua** con acumulada dada. Herramientas: $F$ continua, $F(-\infty)=0$, $F(\infty)=1$; $f=F'$; $P(a\le X\le b)=F(b)-F(a)$; $E(X)=\int xf$; $E(g(X))=\int g f$ (como en el parcial 2022, ej. 3).

**a)** $F$ debe ser continua y llegar a 1: en $x=2$, $a\cdot 8=c$ y $c=1$ (a partir de 2 ya se acumuló todo) ⇒ $c=1$, $a=\frac18$.

**b)** $f(x)=F'(x)=\dfrac{3x^2}{8}$ para $0\le x\le2$, $0$ en otro caso. *(Chequeo: $\int_0^23x^2/8\,dx=8/8=1$ ✓.)*

**c)** $P(1\le X\le1.5)=F(1.5)-F(1)=\dfrac{1.5^3}{8}-\dfrac18=\dfrac{3.375-1}{8}=\mathbf{0.2969}$.
Condicional (achica el espacio muestral):
$$P(X\le1.5\mid X\ge1)=\frac{P(1\le X\le1.5)}{P(X\ge1)}=\frac{0.2969}{1-F(1)}=\frac{0.2969}{0.875}=\mathbf{0.3393}$$

**d)** $E(X)=\int_0^2x\cdot\frac{3x^2}8dx=\frac38\cdot\frac{2^4}4=\mathbf{1.5}$.
$E(X^2)=\int_0^2x^2\frac{3x^2}8dx=\frac38\cdot\frac{2^5}5=\frac{12}5=2.4$ ⇒ $V(X)=2.4-1.5^2=\mathbf{0.15}$.

**e)** $E(Z)=4E(X^2)-3=4(2.4)-3=\mathbf{6.6}$ (linealidad, sin hallar la densidad de $Z$).
Percentil 75: $F(x_{75})=0.75\Rightarrow\frac{x^3}{8}=0.75\Rightarrow x^3=6\Rightarrow x_{75}=6^{1/3}\approx\mathbf{1.817}$. *(Fórmula cerrada: no hace falta tabla.)*

---

## Ejercicio 3

**Modelo (I):** repito ensayos independientes de éxito $p$ **hasta el $r$-ésimo éxito** y cuento ensayos ⇒ **Binomial Negativa** (como Boca–Talleres 2024): $Y\sim BN(r=3,p=0.7)$, $P(Y=k)=\binom{k-1}{r-1}p^r(1-p)^{k-r}$, $k\ge r$; $E(Y)=r/p$, $V(Y)=r(1-p)/p^2$.

**a)** $P(Y=5)=\binom{4}{2}(0.7)^3(0.3)^2=6\cdot0.343\cdot0.09=\mathbf{0.1852}$.

**b)** $P(Y\le4)=P(Y=3)+P(Y=4)=(0.7)^3+\binom32(0.7)^3(0.3)=0.343+0.3087=\mathbf{0.6517}$.

**c)** Fallos $X$ = tiros − 3 (los 3 aciertos están siempre): $\mathbf{X=Y-3}$. Entonces $E(Y)=3/0.7=4.2857$ y $E(X)=E(Y)-3=\mathbf{1.2857}$ (y $V(X)=V(Y)=1.8367$: restar una constante no cambia la varianza).

**Modelo (II):** extraigo sin reposición de una población finita con dos tipos (desinflada/inflada) y cuento del tipo pedido ⇒ **Hipergeométrica** $H(N=12,K=4,n=5)$ (TP2 ej. 12; **no** Binomial: sin reposición, las extracciones no son independientes).
$P(H=k)=\dfrac{\binom4k\binom{8}{5-k}}{\binom{12}5}$, $\binom{12}{5}=792$.

**d)** $P(H=1)=\dfrac{4\cdot70}{792}=\mathbf{0.3535}$.
$P(H\ge3)=P(3)+P(4)=\dfrac{4\cdot28}{792}+\dfrac{1\cdot8}{792}=\dfrac{120}{792}=\mathbf{0.1515}$.

**e)** $E(H)=n\frac KN=5\cdot\frac4{12}=\mathbf{1.667}$.
$V(H)=n\frac KN\left(1-\frac KN\right)\frac{N-n}{N-1}=5\cdot\frac13\cdot\frac23\cdot\frac7{11}=\mathbf{0.7071}$ (la Binomial daría $1.111$; el factor $\frac{N-n}{N-1}$ es la corrección por población finita).

---

## Ejercicio 4

**Modelo:** propiedades de $E$, $V$ y $\text{Cov}$ de combinaciones lineales: $E(aX+bY)=aE(X)+bE(Y)$; $V(aX+bY)=a^2V(X)+b^2V(Y)+2ab\,\text{Cov}(X,Y)$; $\text{Cov}(X,Y)=\rho\,\sigma_X\sigma_Y$; bilinealidad de Cov (TP4 ej. 9 y parcial 2024-11-19 ej. 4).

**a)** $\sigma_X=3$, $\sigma_Y=4$ ⇒ $\text{Cov}(X,Y)=0.5\cdot3\cdot4=\mathbf{6}$. Como $\text{Cov}\ne0$ (equivalente: $\rho\ne0$), **no son independientes** (independientes ⇒ Cov = 0).

**b)** $E(W)=2(4)-6=\mathbf{2}$.
$V(W)=4V(X)+V(Y)-2\cdot2\cdot1\cdot\text{Cov}=4(9)+16-4(6)=36+16-24=\mathbf{28}$. *(Ojo: el signo del cruzado es $2ab$ con $a=2,b=-1$; si hubieran sido independientes daría 52.)*

**c)** $\text{Cov}(2X-Y,\,X+3Y)=2V(X)+6\text{Cov}(X,Y)-\text{Cov}(Y,X)-3V(Y)=18+36-6-48=\mathbf{0}$.
Interpretación: $2X-Y$ y $X+3Y$ están **incorrelacionadas** (sin relación *lineal*), aunque $X$ e $Y$ no sean independientes.

**d)** *Modelo:* suma de $n=64$ variables iid de media y desvío conocidos, sin conocer la distribución ⇒ **TLC**: $S=\sum X_i\approx N(n\mu,\;n\sigma^2)$.
$E(S)=64\cdot3=192$, $V(S)=64\cdot1.5^2=144$, $\sigma_S=12$.
$$P(S<198)\approx\Phi\!\left(\frac{198-192}{12}\right)=\Phi(0.5)=\mathbf{0.6915}$$
Busco $t_0$ con $P(S<t_0)\ge0.90$ ⇒ $\frac{t_0-192}{12}=1.28$ ⇒ $t_0=192+15.36=\mathbf{207.36}$ min.

**e)** *Modelo:* $X$ = urgentes de 150, ensayos independientes de prob. $0.2$ ⇒ $X\sim\text{Bin}(150,0.2)$, y con $n$ grande uso **De Moivre–Laplace** (TLC para la binomial): $X\approx N(np,\,npq)$, $np=30$, $npq=24$, $\sigma=4.899$ (se cumple $np\ge5$, $nq\ge5$).
Sin corrección: $P(X\le35)\approx\Phi\!\left(\frac{35-30}{4.899}\right)=\Phi(1.02)=\mathbf{0.8461}$.
Con corrección de continuidad (discreta ⇒ 35.5): $\Phi\!\left(\frac{35.5-30}{4.899}\right)=\Phi(1.12)=0.8686$ (más cercana al valor binomial exacto; aclará cuál usás).

---

## Ejercicio 5

**Modelo (I):** vidas **continuas** de tiempo, sin desgaste ("falla una vez cada 500 h") ⇒ **Exponencial** $\lambda=1/500$. Sistema en serie ⇒ dura lo que el mínimo: $\{X_{\min}>t\}=\bigcap\{X_i>t\}$ y por independencia se multiplican las supervivencias (TP3 ej. 12; igual que el "mínimo del lote" del parcial 2024-10-04).

**a)** $P(X_i>100)=e^{-100/500}=e^{-0.2}$ ⇒
$$P(X_{\min}>100)=\left(e^{-0.2}\right)^4=e^{-0.8}\approx\mathbf{0.4493}$$
En general $P(X_{\min}>t)=e^{-4\lambda t}$ ⇒ $X_{\min}\sim\text{Exp}(4\lambda=1/125)$, con media $\mathbf{125}$ horas (la cuarta parte: con más componentes en serie, peor).

**Modelo (II):** la bomba de reserva arranca cuando falla la principal ⇒ el tiempo total de funcionamiento es la **suma de dos exponenciales independientes** (misma tasa $\lambda=1/50$) ⇒ **Gamma** con $\alpha=2$ (Erlang, tasa $\lambda$): $T=T_1+T_2\sim\Gamma(2,\lambda=1/50)$ (TP3 ej. 13).

**b)** $E(T)=\frac\alpha\lambda=2\cdot50=\mathbf{100}$ h; $V(T)=\frac\alpha{\lambda^2}=2\cdot2500=\mathbf{5000}$. El sistema "no funciona las 80 h" si $T<80$. Para $\alpha$ entero la acumulada se obtiene con Poisson: $P(T>t)=P(N\le\alpha-1)$ con $N\sim\text{Poisson}(\lambda t)$, $\lambda t=80/50=1.6$:
$$P(T<80)=1-P(N\le1)=1-e^{-1.6}(1+1.6)=1-0.2019\cdot2.6=\mathbf{0.4751}$$
*(Otra forma: integrar la densidad $\lambda^2te^{-\lambda t}$ por partes; da lo mismo.)*

**Modelo (III):** tiempo de vida con tasa de falla **creciente** (desgaste, $\alpha=2>1$) ⇒ **Weibull** $W(\alpha=2,\beta=100)$; su acumulada es cerrada, no hace falta integrar. ($\alpha=1$ sería la exponencial de media $\beta$.)

**c)** $P(W>80)=1-F(80)=e^{-(80/100)^2}=e^{-0.64}\approx\mathbf{0.5273}$.
$P(50\le W\le120)=F(120)-F(50)=e^{-0.25}-e^{-1.44}=0.7788-0.2369=\mathbf{0.5419}$.

**d)** $E(W)=\beta\,\Gamma\!\left(1+\tfrac1\alpha\right)=100\,\Gamma(1.5)=100\cdot\frac{\sqrt\pi}{2}=100\cdot0.8862\approx\mathbf{88.62}$ horas. *(Con el Weibull de $\alpha=2$ la media es menor que $\beta=100$.)*
