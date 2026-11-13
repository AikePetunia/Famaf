
---

## ▶ 1. (2,5 puntos)

Un sistema de monitoreo de invernadero registra $X$ = número de alarmas de temperatura por día, con $X\in\{0,1,2,3\}$ y función de probabilidad de masa

| $x$ | 0 | 1 | 2 | 3 |
|---|---|---|---|---|
| $p(x)$ | 0,4 | 0,3 | $a$ | 0,1 |

**a)** Determine $a$ sabiendo que $E(X)=1$. Verifique que efectivamente da $E(X)=1$.
**b)** Obtenga la función de distribución acumulada de $X$.
**c)** Sea $Y=1$ si ese día se activó el riego de emergencia, $Y=0$ si no. Se sabe que $Y$ es **independiente** de $X$ y que $P(Y=1)=0,15$. Arme la tabla de probabilidad conjunta completa de $X$ e $Y$.
**d)** Calcule $\text{Cov}(X,Y)$ de forma directa a partir de la tabla conjunta.
**e)** Calcule $P(Y=1\mid X>2)$. Si en cambio $Y$ **no** fuese independiente de $X$ y supiera que $P(Y=1,X=3)=0,03$, ¿sería correcto calcular $P(Y=1\mid X>2)=\dfrac{0,03}{p_X(2)+p_X(3)}$? Justifique.

---

## ▶ 2. (2 puntos)

En una línea de producción, cada pieza inspeccionada es defectuosa con probabilidad $p=0,1$, de forma independiente de las demás.

**a)** Se inspecciona hasta encontrar la **primera** pieza defectuosa. ¿Cuál es la probabilidad de que se necesiten exactamente 6 inspecciones?
**b)** ¿Cuál es la probabilidad de que se necesiten **más de** 10 inspecciones para encontrar la primera defectuosa?
**c)** Si ya se inspeccionaron 10 piezas sin encontrar ninguna defectuosa, ¿cuál es la probabilidad de necesitar más de 15 inspecciones **en total**?
**d)** Ahora se inspecciona hasta encontrar la **tercera** pieza defectuosa. ¿Cuál es la probabilidad de necesitar exactamente 12 inspecciones?
**e)** Sin calcular nada, identifique qué distribución (Binomial, Binomial Negativa, Geométrica o Hipergeométrica) corresponde a cada situación: **(i)** de 20 piezas elegidas sin reposición de un lote de 200 piezas con 15 defectuosas, cuántas son defectuosas; Hipergeometrica 
**(ii)** de 20 piezas inspeccionadas (con $n=20$ fijado de antemano), cuántas son defectuosas; Binominal
**(iii)** cuántas inspecciones hacen falta hasta la 4ª defectuosa;  Binominal negativa
**(iv)** cuántas inspecciones hacen falta hasta la 1ª defectuosa. Geometrica

---

## ▶ 3. (2,5 puntos)

Un sistema tiene dos componentes independientes conectados en serie (el sistema falla apenas falla el primero). El componente $A$ falla de forma repentina (sin desgaste) y su vida útil es exponencial con media 4 años. El componente $B$ se desgasta gradualmente y su vida útil $Y$ tiene densidad

$$f_B(y)=y\,e^{-y},\qquad y>0\ \text{(años)}$$

**a)** Calcule $P(A>2)$ y $P(B>2)$ (para $B$, integre $f_B$ por partes).
**b)** Calcule $P(\min\{A,B\}>2)$.
**c)** Calcule $P(\min\{A,B\}\le2)$.
**d)** ¿Tiene $\min\{A,B\}$ distribución exponencial? Justifique.
**e)** Calcule $P(\max\{A,B\}>2)$ 

esta bueno, pero tampoco me metas una gamma. es como si pusieras una log normal o weibull, no las identifico por q no las tengo integradas en mi cabeza y ningun ejercicio los da.

---

## ▶ 4. (3 puntos)

Una fábrica de baterías recibe celdas de tres proveedores: 50 % de $P_1$, 30 % de $P_2$ y 20 % de $P_3$. La capacidad (en mAh) de las celdas se distribuye normalmente según el proveedor: $P_1\sim N(3000,\,80^2)$, $P_2\sim N(2950,\,50^2)$, $P_3\sim N(3100,\,120^2)$. Una celda se considera **premium** si su capacidad supera los 3000 mAh.

**a)** Si se elige una celda al azar, ¿cuál es la probabilidad de que sea premium?
**b)** Si la celda elegida resulta premium, calcule la probabilidad de que sea del proveedor $P_3$.
**c)** ¿Qué capacidad caracteriza al 10 % superior (percentil 90) de las celdas del proveedor $P_1$?

---

## ▶ 5. (2 puntos)

Un centro de atención recibe en promedio 2,5 llamadas por hora que requieren escalamiento a un supervisor, según un proceso de Poisson.

**a)** ¿Cuál es la probabilidad de que no se escale ninguna llamada en una guardia de 3 horas?
**b)** Aproxime la probabilidad de que en una semana laboral de 40 horas se escalen **más de** 110 llamadas.
**c)** Si la probabilidad de que una llamada escalada termine en reclamo formal es 0,08, y en un día se registran 9 llamadas escaladas independientes, ¿cuál es la probabilidad de que **al menos una** termine en reclamo?

---
---

# RESPUESTAS

## Ejercicio 1

**Modelo:** pmf discreta con una incógnita (fijada por $E(X)$, igual que en el 2026 — esta parte ya te salía bien); después se arma la conjunta **multiplicando** la marginal de $X$ por la de $Y$ porque el enunciado **da** la independencia. El paso que falló antes es justamente ese: no adivinar la tabla, construirla con $p(x,y)=p_X(x)\,p_Y(y)$ para cada una de las 8 celdas.

**a)** $0,4+0,3+a+0,1=1\Rightarrow a=0,2$. Verificación: $E(X)=0(0,4)+1(0,3)+2(0,2)+3(0,1)=0,3+0,4+0,3=\mathbf{1,0}$ ✓.

**b)**
$$F(x)=\begin{cases}0 & x<0\\0,4 & 0\le x<1\\0,7 & 1\le x<2\\0,9 & 2\le x<3\\1 & x\ge3\end{cases}$$

**c)** $P(Y=0)=0,85$, $P(Y=1)=0,15$. Por independencia, cada celda es $p_X(x)\cdot p_Y(y)$:

| $X\backslash Y$ | 0 | 1 |
|---|---|---|
| 0 | $0,4\cdot0,85=0,340$ | $0,4\cdot0,15=0,060$ |
| 1 | $0,3\cdot0,85=0,255$ | $0,3\cdot0,15=0,045$ |
| 2 | $0,2\cdot0,85=0,170$ | $0,2\cdot0,15=0,030$ |
| 3 | $0,1\cdot0,85=0,085$ | $0,1\cdot0,15=0,015$ |

(Cada fila suma $p_X(x)$ y cada columna suma $p_Y(y)$; chequeo rápido: $0,340+0,060=0,4$ ✓, columna $Y=1$: $0,060+0,045+0,030+0,015=0,15$ ✓.)

**d)** Como son independientes, $\text{Cov}(X,Y)=0$ por teoría, pero lo confirmamos:
$E(XY)=\sum xy\,p(x,y)$: solo los términos con $y=1$ aportan: $1(0,045)+2(0,030)+3(0,015)=0,045+0,060+0,045=0,15$.
$E(X)=1,0$ (de $a)$), $E(Y)=0,15$. $$\text{Cov}(X,Y)=0,15-1,0\cdot0,15=\mathbf{0}$$

**e)** $X>2$ en $\{0,1,2,3\}$ es **solo** $X=3$ (no incluye $X=2$). Por independencia, condicionar en algo de $X$ no cambia la probabilidad de $Y$:
$$P(Y=1\mid X>2)=P(Y=1\mid X=3)=P(Y=1)=\mathbf{0,15}$$
**Sobre la variante no independiente:** **no**, esa cuenta estaría mal planteada aunque el numerador esté bien pensado. Por definición, $$P(Y=1\mid X>2)=\frac{P(Y=1,X>2)}{P(X>2)}.$$ Como $X>2$ es solo $X=3$ (no $X\ge2$), el numerador correcto es $P(Y=1,X=3)=0,03$, pero el **denominador** correcto es $P(X=3)=p_X(3)=0,1$, no $p_X(2)+p_X(3)$: ese denominador correspondería a $P(X\ge2)$, que es un evento distinto de $X>2$. La cuenta correcta sería $\dfrac{0,03}{0,1}=0,3$. *(Este es exactamente el tipo de error que marcaste en el parcial real: usar como denominador la probabilidad de un evento que no es el que efectivamente estás condicionando.)*

---

## Ejercicio 2

**Modelo:** ensayos de Bernoulli independientes con $p=0,1$. Contar ensayos **hasta el 1er éxito** es **Geométrica**; hasta el **$r$-ésimo** éxito es **Binomial Negativa** (la Geométrica es el caso particular $r=1$). Contar éxitos en $n$ **fijo** es Binomial. Elegir **sin reposición** de una población finita es Hipergeométrica.

**a)** Geométrica, $P(Y=k)=(1-p)^{k-1}p$:
$$P(Y=6)=(0,9)^5(0,1)\approx\mathbf{0,0590}$$

**b)** Cola de la Geométrica: $P(Y>k)=(1-p)^k$ (ningún éxito en los primeros $k$ ensayos):
$$P(Y>10)=(0,9)^{10}\approx\mathbf{0,3487}$$

**c)** Falta de memoria de la Geométrica: $P(Y>s+t\mid Y>s)=P(Y>t)$. Acá $s=10$, $s+t=15\Rightarrow t=5$:
$$P(Y>15\mid Y>10)=P(Y>5)=(0,9)^5\approx\mathbf{0,5905}$$
(Haber inspeccionado 10 piezas sin defectos "no cuenta": el proceso vuelve a arrancar de cero, como si recién empezaras.)

**d)** Binomial Negativa con $r=3$: $P(Y=k)=\binom{k-1}{r-1}p^r(1-p)^{k-r}$:
$$P(Y=12)=\binom{11}{2}(0,1)^3(0,9)^9=55\cdot0,001\cdot0,387420489\approx\mathbf{0,0213}$$

**e)**
- **(i) Hipergeométrica**: muestreo **sin reposición** de un lote finito (200 piezas), $n=20$ fijo, se cuentan "éxitos" (defectuosas).
- **(ii) Binomial**: $n=20$ ensayos **fijados de antemano**, independientes, se cuentan éxitos.
- **(iii) Binomial Negativa** ($r=4$): se cuentan **ensayos**, no éxitos, hasta lograr un número fijo de éxitos ($r=4$).
- **(iv) Geométrica**: caso particular de (iii) con $r=1$.

*(La clave para distinguir (i)–(ii) de (iii)–(iv): si lo que varía/azar es el número de **éxitos** con $n$ fijo → Binomial/Hipergeométrica; si lo que varía es el número de **ensayos** con la cantidad de éxitos fija → Binomial Negativa/Geométrica.)*

---

## Ejercicio 3

**Modelo:** $A\sim\text{Exp}(\lambda=1/4)$ (vida sin desgaste) y $B$ tiene densidad $f_B(y)=ye^{-y}$, que es una **Gamma(2,1)** (no exponencial: tiene "forma de joroba", refleja desgaste gradual). $A$ y $B$ son independientes pero **no** tienen la misma distribución, así que el atajo "elevar a la $n$" de un mínimo i.i.d. **no aplica acá**: hay que calcular cada supervivencia por separado y multiplicarlas.

**a)** $P(A>2)=e^{-(1/4)\cdot2}=e^{-0,5}\approx\mathbf{0,6065}$.

Para $B$, integro por partes ($u=y$, $dv=e^{-y}dy$):
$$P(B>2)=\int_2^\infty ye^{-y}dy=\big[-ye^{-y}-e^{-y}\big]_2^\infty=0-(-2e^{-2}-e^{-2})=3e^{-2}\approx\mathbf{0,4060}$$
*(Resultado general útil: para $\text{Gamma}(2,1)$, $P(Y>t)=(1+t)e^{-t}$; acá con $t=2$ da $3e^{-2}$.)*

**b)** Como $A$ y $B$ son independientes, $P(\min\{A,B\}>2)=P(A>2,B>2)=P(A>2)\cdot P(B>2)$:
$$P(\min\{A,B\}>2)=0,6065\times0,4060\approx\mathbf{0,2463}$$
*(Si uno confundiera a $B$ con otra exponencial de media 1 e hiciera $(0,6065)\times(0,6065)$, o peor, elevara una sola supervivencia al cuadrado, el resultado daría mal: acá las dos probabilidades son distintas porque las distribuciones son distintas.)*

**c)** $$P(\min\{A,B\}\le2)=1-0,2463\approx\mathbf{0,7537}$$

**d)** **No.** El mínimo de dos exponenciales independientes **sí** es exponencial (con tasa igual a la suma de las tasas), pero eso depende de que **ambas** partes sean exponenciales — la falta de memoria de cada una se "hereda" al mínimo. Acá $B\sim\text{Gamma}(2,1)$ no es exponencial (su tasa de falla no es constante: al tener forma de joroba, la probabilidad de fallar en el próximo instante crece con la edad, reflejando desgaste), así que $\min\{A,B\}$ tampoco lo es. En general, el resultado "el mínimo de exponenciales es exponencial" es una propiedad **especial** de la exponencial, no algo que valga para cualquier par de variables de vida útil.

**e)** $P(A\le2)=1-0,6065=0,3935$; $P(B\le2)=1-0,4060=0,5940$.
$$P(\max\{A,B\}\le2)=P(A\le2)\cdot P(B\le2)=0,3935\times0,5940\approx0,2337$$
$$P(\max\{A,B\}>2)=1-0,2337\approx\mathbf{0,7663}$$
*(Noten la diferencia de estructura con el mínimo: "el máximo supera 2" = "al menos uno sobrevive más de 2 años" es el complemento de "los dos fallaron antes de 2 años", por eso se arma con las $F$'s, no con las supervivencias.)*

---

## Ejercicio 4

**Modelo:** igual estructura que el ejercicio de Bayes con poblaciones normales que te salió bien en el parcial anterior — tres poblaciones (proporciones $0,5/0,3/0,2$) con capacidad normal de distintos parámetros; "premium" ($X>3000$) es una cola de cada normal. Probabilidad total para $a)$, Bayes para $b)$, percentil (cola superior esta vez) para $c)$.

**a)**
- $P_1$: $X\sim N(3000,80^2)$. $P(X>3000)=P(Z>0)=1-\Phi(0)=1-0,5=0,5$.
- $P_2$: $X\sim N(2950,50^2)$. $P(X>3000)=1-\Phi\!\left(\frac{3000-2950}{50}\right)=1-\Phi(1,00)=1-0,8413=0,1587$.
- $P_3$: $X\sim N(3100,120^2)$. $z=\frac{3000-3100}{120}=-0,83\Rightarrow P(X>3000)=1-\Phi(-0,83)=\Phi(0,83)=0,7967$.

$$P(\text{premium})=0,5(0,5)+0,3(0,1587)+0,2(0,7967)=0,25+0,04761+0,15934\approx\mathbf{0,4570}$$

**b)** Bayes:
$$P(P_3\mid\text{premium})=\frac{P(\text{premium}\mid P_3)\,P(P_3)}{P(\text{premium})}=\frac{0,2\times0,7967}{0,4570}=\frac{0,15934}{0,4570}\approx\mathbf{0,3488}$$

**c)** Busco $z$ tal que $\Phi(z)=0,90$ (cola **superior** esta vez: el 10 % de arriba queda por encima de ese $z$). De tabla, $z\approx1,28$.
$$x_{0,90}=3000+1,28\times80=3000+102,4=\mathbf{3102,4}\ \text{mAh}$$

---

## Ejercicio 5

**Modelo:** Poisson con $\lambda=2,5$/hora, reescalando a 3 horas y a 40 horas; TLC para la aproximación normal; binomial para el "al menos uno" final — los tres bloques de esta práctica en un solo ejercicio corto, como entrenamiento para la presión de tiempo del parcial real.

**a)** $\lambda_{3h}=2,5\times3=7,5$.
$$P(X=0)=e^{-7,5}\approx\mathbf{0,000553}$$

**b)** $\lambda_{40h}=2,5\times40=100$. Por TLC (suma de muchas Poisson horarias), $S\approx N(100,100)$, $\sigma=10$.
$$P(S>110)\approx1-\Phi\!\left(\frac{110-100}{10}\right)=1-\Phi(1,00)=1-0,8413\approx\mathbf{0,1587}$$

**c)** $W\sim\text{Bin}(9;\,0,08)$ (cada llamada escalada termina en reclamo, independientemente, con prob. 0,08):
$$P(W\ge1)=1-(1-0,08)^9=1-(0,92)^9\approx\mathbf{0,5278}$$
