---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
Probabilidad y Estadística: Parcial 2 ^rby52kKC

Apunte completo, organizado EN EL ORDEN de las diapositivas de cada clase: cada ficha de teoría está
seguida de inmediato por su ejemplo resuelto, igual que en la clase. Fuentes: clases de octubre (Flesia),
guías 5-8, parciales 2021-2025, cronograma 2026. Azul = teoría · violeta = ejemplo · naranja = nota · rosa = regla clave. ^08oQChD1

Mapa del Parcial 2 ^l0MfoKwm

TEORÍA ^A4IxghbY

Qué entra y dónde está cada clase ^Cpm5P0ep

Dentro de cada bloque, el contenido va EN EL ORDEN de las diapositivas: cada ficha de teoría
está seguida inmediatamente por su ejemplo resuelto, tal como en la clase. ^EynGSiQM

TEORÍA ^9UXRnfgY

Flujo de decisión: ¿qué IC o test uso? ^7HY82LlJ

NOTA ^brOgf8AE

Valores y notación que hay que saber de memoria ^52SbYVjU

Nivel 90% → 1.645; 95% → 1.96; 99% → 2.576 (IC bilaterales). Test unilateral al 5% → 1.645;
al 1% → 2.326. Subíndice α siempre significa "α de área a la DERECHA" (z_α, t_{α,ν}, χ²_{α,ν}). ^CLzuv6I6

Estimación puntual (Clase 7 y 9 de octubre) ^TkpHr3ke

TEORÍA ^Q0ofVyWu

Modelo de una población y modelo paramétrico ^s5pkXIoq

Una población queda definida por una o varias variables aleatorias y su distribución conjunta.
X = atributo medido sobre un individuo elegido al azar → X es una variable aleatoria con
densidad/función de masa p(x). ^8eGuhd35

La forma de p(x) se supone conocida; lo único desconocido son los parámetros. ^v1W0iBMY

TEORÍA ^RloEeJRu

Muestreo aleatorio ^1aSC4Exq

Muestra: x₁,...,xₙ (números observados, minúsculas).
Muestra aleatoria: X₁,...,Xₙ variables aleatorias independientes e idénticamente distribuidas (iid). ^mutzEwcx

EJEMPLO ^luLUtD2k

Ejemplo (los puntitos del ejemplo) ^JFRHmBIK

Tapitas de gaseosa: se toman n = 10 tapitas y se mide su diámetro. El ESTIMADOR de μ es la
variable aleatoria X̄₁₀ (todavía no sabemos qué va a dar). La ESTIMACIÓN es el número concreto
que resulta, por ejemplo x̄ = 2.98 cm, una vez medidas las 10 tapitas. ^RpZi4917

TEORÍA ^fcVGAVAU

Estimación puntual: estimador vs. estimación ^asRTLY4w

Media y varianza muestral ^1YHtqYY2

S² divide por n-1 (insesgado); Σ² divide por n (sesgado, pero es el estimador de máxima
verosimilitud). ^KiDpLUw6

TEORÍA ^va7PHPew

Sesgo ^jTSw4e0J

Insesgamiento: en promedio (a lo largo de muchas repeticiones del muestreo), el estimador "le
pega" al valor verdadero, aunque en una muestra particular se aleje. ^T1LMPysO

TEORÍA ^H6yJrTZP

Error cuadrático medio de un estimador (ECM) ^OKXpc37A

Si es insesgado: ECM = V(θ̂). Se prefiere el estimador de menor ECM; entre insesgados, el de
menor varianza. ^vu27f9Dn

TEORÍA ^h4q5ND4n

Error estándar de un estimador ^n3Xt2FRE

Se reporta θ̂_obs ± error estándar. Da idea de la precisión, pero no da un nivel de confianza
(para eso se necesita un intervalo de confianza). ^jL9VPngJ

TEORÍA ^5V3JS2a4

Eficiencia relativa (precisión y exactitud) ^gKW5BSPl

EXACTITUD ↔ sesgo (¿el reloj está en hora?). PRECISIÓN ↔ varianza (¿marca los segundos o
solo los minutos?). El mejor estimador: sesgo nulo, consistente, y varianza mínima entre los
insesgados. ^TJptEksO

TEORÍA ^1sSA66HB

Propiedades de X̄ y S² (demostración) ^pc7QMa1r

Por qué Σ² sale sesgado: E(Σ_n²) = (n-1)σ²/n, sesgo = -σ²/n → 0 (asint. insesgado).
Multiplicando por n/(n-1) se corrige exactamente: S²_{n-1} = (n/(n-1))Σ_n². ^Cbgo8vmG

TEORÍA ^lcYv3slz

Consistencia ^lHjkMsXy

X̄ es consistente (ECM = σ²/n → 0). Insesgado NO implica consistente (ej.: X₁ es insesgado para
μ pero su varianza no baja con n); y sesgado NO implica inconsistente. ^PCyw2sC6

EJEMPLO ^3MDMkMnp

Ejemplo: X₁,...,Xₙ iid U[0, θ] (dos estimadores de θ) ^c5DUt8SN

Con n = 10: ECM(2X̄) = θ²/30 ≈ 0.0333θ²; ECM(θ̂₂) = θ²/120 ≈ 0.0083θ². El máximo
corregido gana por mucho: su varianza baja como 1/n², no como 1/n. ^XFFdFrHe

TEORÍA ^gSpkxRe8

Momentos poblacionales y muestrales ^7sonDMR6

Método de los momentos: con k parámetros, igualar los primeros k momentos poblacionales a
los muestrales y despejar. Un parámetro → E(X)=X̄. Dos parámetros → se agrega E(X²)=M̄₂. ^8M4xq1JR

EJEMPLO ^uoqT9eKX

Ejemplo de momentos: p(x;θ) = (θ+1)xᶿ en [0,1] ^753CL20Z

Datos (n=10): x̄ = 0.799  →  θ̂ = (1-2·0.799)/(0.799-1) = 2.975. ^STxU49Ki

TEORÍA ^OF2aRTNL

Estimación de máxima verosimilitud (MV) ^I8dagoax

Receta (caso derivable) ^44jFZHr0

1) Escribir L(θ).  2) ℓ(θ) = ln L(θ).  3) ℓ'(θ) = 0.  4) despejar θ̂.  5) verificar ℓ''(θ̂) < 0.
Si el dominio depende de θ (ej. U(0,θ)) no se puede derivar: L decrece en θ, el máximo está en
el borde, θ̂ = max(Xᵢ). ^3Bgcq6rj

Principio de invarianza ^klNaqYKv

TEORÍA ^vwS4N4XP

Tabla de estimadores de MV ^gpNHp6ec

Con Bernoulli, Poisson y exponencial, el de MV coincide con el de momentos. Con la normal,
σ̂²_MV = Σ² es sesgado (asintóticamente insesgado); con U(0,θ) NO coinciden (MV = máximo,
momentos = 2X̄). ^O0lmprCM

EJEMPLO ^lKilpPFq

Ejemplos de MV ^jhjSDMKk

Exponencial (n=10) ^t5fsTSaU

Σx = 55.80 → λ̂ = 0.1792. Por invarianza: P̂(X≤5) = 1-e^(-5λ̂) = 0.5918. ^vAHyC2eo

Normal: percentiles y probabilidades por invarianza ^G7GZAjsb

TEORÍA ^cLYotOaa

Propiedades asintóticas del estimador de MV ^hNzBq57q

1) Consistente.  2) Asintóticamente insesgado.  3) Asintóticamente normal.  4) Asintóticamente
eficiente (alcanza la mínima varianza posible, cota de Cramér-Rao). ^LchyOJtM

Más información de Fisher → menor varianza asintótica. Con muestras chicas, el MV puede
igual salir sesgado (ej.: Σ² en la normal). ^NAVMK8OK

Intervalos de confianza (Clase 14 y 16 de octubre) ^PFoy2NcB

TEORÍA ^AJlvPAC2

Distribuciones derivadas de la normal (la base de los IC) ^9OUDFjI1

Sea X₁,...,Xₙ una m.a. de N(μ, σ²). Se puede demostrar: ^rh29l7SE

De ahí sale la t de Student ^8aNsgsrn

La t es simétrica, centrada en 0, con colas más pesadas que la normal (paga la incertidumbre de
no conocer σ). Con ν grande es casi idéntica a la normal. ^GP0Owms4

TEORÍA ^l7mzlqAu

Estimador por intervalo y método del pivote ^E3Y8Ky0n

L y R son variables aleatorias (funciones de la muestra). Con datos observados x₁,...,xₙ se
obtiene el intervalo OBSERVADO [l, r] (ya no aleatorio). ^RoBMjPEU

Receta del pivote (se repite igual para μ, σ² y p) ^3G8SekLk

1) Encontrar h(X₁,...,Xₙ;θ) con distribución CONOCIDA que no dependa de θ (el pivote).
2) Buscar en la tabla a y b tales que P(a ≤ h ≤ b) = 1 - α.
3) Despejar θ de la desigualdad a ≤ h ≤ b para obtener L ≤ θ ≤ R. ^tk2KUOWC

Observación: interpretación correcta del nivel de confianza ^8sgozhP7

El nivel (1-α) es propiedad del MÉTODO, no de un intervalo ya calculado. Si se construyen 100
intervalos con muestras independientes, se espera que ≈ 100·α de ellos NO contengan el verdadero
parámetro. De una observación concreta no se puede decir "la probabilidad de que μ esté en este
intervalo es 0.95"; se dice "tenemos 95% de confianza". ^0jGgdWJY

TEORÍA ^ZWHvS16U

CASO A: IC para μ (normal, σ conocida) ^IiFTuHQU

1) Pivote: estandarizar X̄ ^txZBYuYZ

2) Buscar a, b en la tabla normal: P(a ≤ h ≤ b) = 1 - α ^3bTdf2kj

3) Despejar μ ^kzAyCgPs

IC aleatorio de nivel (1 - α) para μ ^BycMrpNU

Es el intervalo SIMÉTRICO que da este pivote, y el de MENOR longitud (mayor precisión) entre
todos los que pueden construirse con él, para n y α fijos. ^j8cC4VCn

Longitud y tamaño de muestra ^4RDNzBlu

EJEMPLO ^MfardVss

Ejemplo Caso A: señal con ruido (n = 9) ^0kfE3dia

X ~ N(μ, 4), σ = 2. Datos: 5, 8.5, 12, 15, 7, 9, 7.5, 6.5, 10.5 → x̄ = 9. ^4Cs9B2fS

Salmones: ¿qué n se necesita para un error de ±0.1 lb con 95% y σ = 0.3 lb? ^x9IVSs4Z

TEORÍA ^gu8XczJ6

CASO B: IC para μ (normal, σ desconocida) — de dónde sale la t ^myoROhoF

1) Pivote: como no conocemos σ, se reemplaza por S ^qP4XEOvq

2) Buscar a, b en la tabla t de Student (n-1 grados de libertad) ^KA1RlB5N

3) Despejar μ → IC aleatorio de nivel (1 - α) ^ovC6s7Nf

Por qué t y no z: al estimar σ con S se agrega variabilidad extra, y t_{α/2,n-1} > z_{α/2};
por eso el IC con t siempre sale más largo (con el mismo x̄, s = σ). ^FYla9cox

EJEMPLO ^wLtzcBCb

Ejemplo báscula: calibración (percentiles, sin hacer cuentas) ^7IxQWNYj

Al pesar 25 veces un espécimen de 10 kg con σ = 0.200 kg, la balanza debe revisarse si
x̄ ≤ 9.8968 o x̄ ≥ 10.1032. ^KcZsCqQT

a) ¿Probabilidad de revisarla sin necesidad? Es el nivel α del test bilateral que define esa RR.
b) y c) se leen directamente en la tabla normal con z = (x̄-10)/(σ/√n), evaluando esos límites.
d) Despejando z de 9.8968 = 10 - z·σ/√n, se obtiene el valor crítico equivalente c. ^0R1k3KKR

TEORÍA ^ucSKIFR5

CASO C: IC para σ² (μ y σ desconocidos) ^YTVEmXr7

1) Pivote ^APLL5N5V

2) Buscar a, b en la tabla χ²_{n-1}: P(a ≤ h ≤ b) = 1 - α ^4mXRx3JA

OJO con el orden: el extremo INFERIOR del IC usa b = χ²_{α/2,n-1} (el valor GRANDE) en el
denominador, y el extremo SUPERIOR usa a = χ²_{1-α/2,n-1} (el CHICO). Queda invertido respecto
de z y t porque σ² está en el denominador del pivote. ^vvnXpwwD

3) Despejar σ² → IC aleatorio de nivel (1 - α) ^3mQiF9XJ

Tabla resumen de la diapositiva (X₁,...,Xₙ ~ N(μ, σ²)) ^5wutuFWE

EJEMPLO ^Rx2H6wQ2

Ejemplo: resistencia a la fractura del acero (n = 22, 99%) ^WkGQ3yL2

x̄ = 76.88, s = 3.784, s² = 14.324. ^rIMnVETD

a) IC para μ ^hhvKtwRs

b) IC para σ y σ² ^tfuuyo62

TEORÍA ^ulrYmau8

CASO D: IC asintóticos (muestra grande) ^CTIjnjnZ

D1) σ conocida (n ≥ 30, vale el TCL) ^qzjz1d1D

D2) σ desconocida (n ≥ 40) ^djGxWLyO

Por Slutsky, como S_{n-1}² converge en probabilidad a σ², se reemplaza σ por S_{n-1} sin
cambiar la distribución límite: ^5KYqmYsX

Diferencia con A y B: acá NO hace falta que la población sea normal (alcanza con n grande), y se
usa z en vez de t (S ya es consistente para σ; con n grande la t_{n-1} ya es casi la normal). ^2JBz1LfW

EJEMPLO ^7AhceB14

Ejemplo: eco de radar (n = 110, 99%) ^JzshMBEK

x̄ = 0.81, s = 0.34. ^833tX11A

TEORÍA ^Wj7aXRIV

IC para p: muestra Bernoulli grande (de la cuadrática a la fórmula simple) ^w71QMcu2

Sea X₁,...,Xₙ una m.a. Bernoulli(p), n grande. Por TCL, con p̂ = X̄: ^s4H4kLRK

Planteando el evento con el pivote y elevando al cuadrado, queda una ecuación cuadrática en p ^JSiLrER5

Las dos raíces son los extremos del IC de Wilson ^KjM6DzZf

Para n suficientemente grande, tres términos se vuelven insignificantes ^WRiSlSwX

Desechando esos términos queda el IC tradicional ^pWng7rRe

OJO: la diapositiva de la materia tiene una errata y escribe "n p̂ ≤ 10"; la condición correcta
(y la que se cumple en los ejemplos resueltos) es n p̂ ≥ 10. ^oXSFCGBu

Tamaño de muestra: n ≥ (z_{α/2}/L)², independiente de p̂ ^RjiiJx8k

Con L = longitud total (L = 2E, E = margen de error), y usando la cota p(1-p) ≤ 1/4
(máximo en p̂ = 1/2, la peor de las situaciones): ^VVjReasX

EJEMPLO ^DCRGMM9v

Ejemplo: matrices de silicio (≈98%) ^ymNg0NRm

De 356 matrices probadas, 201 pasaron. ^gGhaDgBb

Tamaño de muestra para longitud ≤ 0.05 con el mismo nivel ^lT040H6Z

Capturas que pegaste vos (quedan acá como referencia de esta sección): ^O5aopiTR

"Independiente de p" ^ULxn1bpT

Tests de hipótesis (Clase 23 y 28 de octubre) ^uqnyq1xo

EJEMPLO ^z4H92BJo

El problema que lo motiva: leche aguada ^zXqNHCTV

Un gerente sospecha que un proveedor agrega agua a la leche. El punto de congelamiento usual de
la leche es una variable aleatoria normal con media μ = -0.545 °C y desvío σ = 0.008 °C.
Agregar agua sube ese punto (lo acerca a 0 °C, el de congelamiento del agua). ^pB65GoWP

Se analizan n = 5 lotes consecutivos y el punto de congelamiento medio de la muestra da -0.538.
¿Es esto evidencia sustancial de que el productor está agregando agua? ^xo43Rbiy

TEORÍA ^jCwlyW4f

Test de hipótesis: ingredientes ^kkgoHfEq

H₀ — la hipótesis nula ^rKrvprF6

El supuesto por defecto para el modelo que genera los datos ("no pasa nada distinto"). ^2QMPnE0u

H_A — la hipótesis alternativa ^3pnceUBA

Lo que aceptamos como mejor explicación si rechazamos H₀. ^llzyzcfY

X — el estadístico de prueba ^n4HVCINL

Se calcula a partir de los datos. ^I0ZzZpIv

Distribución nula ^jkRjCfGj

La distribución de probabilidad de X asumiendo que H₀ es verdadera. ^gnspuINU

Región de rechazo (RR) ^V4VyKGBg

Si X cae en la RR, se rechaza H₀ a favor de H_A. ^Cv6bE6it

Región de no rechazo (RNR) ^Fl5PEA0I

El complemento de la RR. Si X cae ahí, NO se rechaza H₀. ^YjRQqnns

TEORÍA ^xZcqt57g

Planteo general: qué va en H₀ y qué en H_A ^7AUzYjBx

H₀ y H_A cumplen roles distintos. Por lo general H₀ es la hipótesis simple o "por defecto"
(las diferencias observadas se deben al azar), y solo se rechaza con evidencia suficiente en contra.
Si θ es el parámetro de interés, H₀ es un valor puntual θ₀. ^fugT5eUw

Las tres formas de H_A ^Ffh6Iw7y

En el ejemplo de la leche: el agua SUBE el punto de congelamiento, así que la alternativa es
a cola superior (μ > -0.545). Un test a cola derecha. ^In3wBT09

TEORÍA ^t844hpgI

p-valor: definición ^lcLRIa3D

Se llama p-valor a la probabilidad, calculada ASUMIENDO VÁLIDA la hipótesis nula, de que el
estadístico tome un valor al menos tan extremo como el observado. ^EzGeBKAA

Más chico es el p-valor, más grande es la evidencia en contra de H₀ dada por los datos. ^YFy7npok

EJEMPLO ^5n2qlD61

p-valor del ejemplo de la leche ^O1IDz6La

Bajo H₀, el estimador X̄ es normal con media -0.545 y desvío σ_X̄ = σ/√5 = 0.008/√5: ^dqM8oBo4

Una temperatura media de congelamiento como la observada ocurre solo 2.5 veces cada 100 mediciones
de leche NO adulterada. Hay evidencia de que la leche fue adulterada por el productor. ^psN5wUHr

TEORÍA ^gzExeOaQ

Significado estadístico ^vMSEHUhr

Si el p-valor es menor o igual que un valor fijo α, decimos que los datos son estadísticamente
significativos con nivel α. ^FJS2hRmx

CLAVE ^ZWxpzeWF

Regla de decisión universal por p-valor ^iNVndEA6

Para decidir si se rechaza H₀, en la práctica no hace falta calcular regiones críticas ni valores z
a mano cada vez: alcanza con comparar el p-valor contra α. Es la MISMA regla, dicha de la forma
más directa posible, y es la que se usa de ahora en más en todos los ejemplos: ^WFZ4EIxl

Comparar con la región de rechazo (z_obs vs. z_α) o comparar el p-valor contra α son dos caminos
que SIEMPRE llevan a la misma decisión; el del p-valor es el que generaliza mejor porque no
depende de qué distribución tenga el estadístico (Z, T o χ²). ^X3q0g0OQ

CLAVE ^UYdZjZTi

Test de nivel α: la receta completa ^MOhpIj3j

1) Se proponen H₀ y H_A. El test se diseña para evaluar la fuerza de la evidencia en contra de H₀.
H_A es la propuesta que vamos a aceptar si la evidencia nos permite rechazar H₀. ^jKXNBtE7

2) Se especifica el nivel de significación α, que permite decir por anticipado cuánta evidencia
se necesita para rechazar H₀. ^C4vXeElI

3) Se calcula el estadístico del test, cuya distribución debe ser conocida suponiendo válida H₀
(la distribución nula), y que permite medir cuán bien los datos soportan H₀. ^2Uuet5DA

4) Se calcula el p-valor de los datos observados: la probabilidad, asumiendo válida H₀, de que el
estadístico pese tanto o más en contra de H₀ como lo hace con estos datos. Si el p-valor es
menor o igual a α, el test es significativo con nivel α (se rechaza H₀). ^rA4Ok2qG

TEORÍA ^6CAUEaXe

Errores de tipo I y tipo II: qué son ^dpwZ8zlM

De acuerdo con el paradigma de Neyman-Pearson, al decidir entre H₀ y H_A podemos equivocarnos
de dos maneras distintas. ^JB5jDZ3d

Error de tipo I — rechazar H₀ cuando en realidad era VERDADERA ^qKSO43gQ

Es un falso positivo: el test grita "hay efecto" cuando no lo hay. Su probabilidad es exactamente
el nivel de significación α que el investigador elige de antemano: ^i5ujDFQp

Error de tipo II — NO rechazar H₀ cuando en realidad era FALSA ^vynbBYJi

Es un falso negativo: el test dice "no hay evidencia" cuando el efecto existe. Se llama β, y para
calcularlo hay que proponer una alternativa COMPLETAMENTE identificable (un valor puntual μ′,
p′, etc., no solo "≠ μ₀"): β depende de qué tan lejos esté la verdad de H₀. ^21ZXAMBx

Tabla de las cuatro situaciones posibles ^7HvUFuUu

Quién controla cada uno ^OETOUyOP

α lo FIJA el investigador antes de ver los datos (0.05, 0.01, ...). β NO se fija: depende de n, de α
y de qué tan lejos está el valor alternativo real de μ₀ (cuanto más lejos, más fácil detectarlo y
menor es β). ^YMOSyblU

En el ejemplo de la leche ^lrLB2Swp

Error de tipo I: acusar a un productor HONESTO de aguar la leche, cuando en realidad el -0.538
observado fue solo una fluctuación normal del azar.
Error de tipo II: NO detectar que un productor SÍ está aguando la leche, dejándolo pasar. ^iCNFf6HT

TEORÍA ^Qg6JquTS

Potencia del test ^8i3sAXIq

El valor (1 - β) es la probabilidad de que H₀ sea rechazada cuando es falsa: se llama POTENCIA
del test. Permite comparar dos tests distintos para el mismo problema: el de mayor potencia es
el mejor (detecta mejor un efecto real). ^fgspYFgG

Un test ideal tendría α = β = 0, pero eso no ocurre salvo en casos triviales. En la práctica, para
un tamaño de muestra fijo, achicar α agranda β (un test más estricto para rechazar es también
más fácil de "engañar" y deja pasar más efectos reales): si se quiere un nivel de significación
mayor (α más chico), se obtiene un test MENOS potente. ^PSdW5P91

La única forma de bajar los dos errores a la vez es aumentar el tamaño de muestra n. ^RAhRm1cr

TEORÍA ^0aCWmQdM

Test para la media — CASO A: normal, σ conocida ^USXLITfQ

Sea X₁,...,Xₙ una m.a. de N(μ, σ²) con σ² conocido. Bajo estos supuestos sabemos que
X̄ ~ N(μ, σ²/n), o equivalentemente √n(X̄-μ)/σ ~ N(0,1). ^QxQxQP6c

Estadístico de prueba (bajo H₀) ^LqzvYON6

Región de rechazo y potencia β(μ) para cada alternativa ^ryCGcgF7

Tamaño de muestra para que β(μ′) ≤ β₀ con nivel α ^Dd2ifD4d

EJEMPLO ^5oD5a8Rv

Ejemplo Caso A: rendimiento de autos (cola inferior) ^p3JMK9u2

El fabricante afirma un rendimiento de al menos 12 km/l. σ = 2, n = 30, α = 0.02.
H₀: μ = 12  vs  H_A: μ < 12. ^OND84uzw

a) Región de rechazo ^WlNGUpD1

b) Error de tipo II si el rendimiento real es 11 km/l ^ndukL7Of

c) Decisión si el promedio observado es 11.32 ^69Qdk5h6

11.32 no está en la RR (no es < 11.25), así que NO se rechaza H₀ con este nivel. ^yuHy9iVu

TEORÍA ^F05CkKpV

Test para la media — CASO B: n grande (≥30), σ conocida (TCL) ^VAQOzlMC

Sea X₁,X₂,...,Xₙ una muestra aleatoria con valor medio μ y varianza σ². Si n ≥ 30 y σ es
conocida, por el TCL el estadístico de prueba es: ^8KfTwxrL

Si n ≥ 40 y σ es desconocida ^DKfycdFI

Se reemplaza σ por S_{n-1} (consistente para σ por Slutsky), y vale la misma distribución límite: ^lAsMeIlb

La RR y la β se calculan EXACTAMENTE igual que en el Caso A (misma tabla), solo que acá valen
de forma aproximada. ^HkU1Vdox

EJEMPLO ^ln7I1MJC

Ejemplo Caso B: vigas de acero (bilateral) ^kLDuD5iY

Longitud nominal μ₀ = 5 m, σ = 0.02 m, n = 16. Si la probabilidad de rechazar un embarque
BUENO es 0.04, ¿qué rango de X̄ regresa el embarque al fabricante? ^Wvh3cuzf

Potencia si la media real es 4.98 ^RhTgHlb0

Potencia muy alta: hay mucha confianza en que el test rechace si el lote realmente mide 4.98 m. ^NvZFgzkV

TEORÍA ^N4rh6Di3

Cómo calcular el p-valor según el estadístico y H_A ^oI6kIbgC

Con la tabla t o χ² (que no tiene todos los valores) solo se puede ACOTAR el p-valor entre dos
columnas, por ejemplo "0.01 < p-valor < 0.025". ^W8OfZKlL

EJEMPLO ^nEJFveG9

Ejemplo: focos (Caso B, acumula p-valor y las dos conclusiones) ^xExygQSS

H₀: μ = 750 h  vs  H_A: μ < 750 h. n = 50, x̄ = 738.44, s = 38.20. ^WCDOIBmr

Hay evidencia de que el tiempo de vida medio es menor a 750 h con un nivel del 5 %, pero no
con un nivel del 1 % (el p-valor 0.016 está entre medio). No se recomendaría al cliente la compra,
aunque el error no alcance el 1 %: el riesgo es del 1.6 %. ^mU96z4i3

TEORÍA ^KOLoEcbk

Test para la media — CASO C: normal, σ desconocida, n chico ^20b6Ta9f

Sea X₁,...,Xₙ una m.a. de N(μ, σ²) con σ² desconocida. Sabemos que √n(X̄-μ)/S ~ t_{n-1}. ^dpIct40S

En este caso NO se da la fórmula de β (aparece una t no central) ni la de tamaño de muestra. ^lRDouPZ7

EJEMPLO ^BvWEVd1J

Ejemplo Caso C: punto de fusión del aceite (y dualidad con el IC) ^OJX9YORg

n = 16, x̄ = 94.32, s_{n-1} = 1.20. H₀: μ = 95  vs  H_A: μ ≠ 95, nivel 5 %. ^y9kdILEl

Como |t_obs| = 2.267 > 2.131, se rechaza H₀: hay evidencia de que el punto de fusión no es 95. ^dnYt9iHh

Comparación con el intervalo de confianza del 95 % ^trF5A8jT

El IC del 95 % no contiene a 95: la conclusión del test coincide siempre con la del IC bilateral
del mismo nivel. ^932EIKm1

TEORÍA ^O5C3838L

Dualidad: test bilateral de nivel α ↔ intervalo de confianza ^ip56J8KM

La región de "aceptación" (no rechazo) al nivel de significación α es, en términos del promedio: ^30lORKrj

Y se puede demostrar que esto equivale exactamente a que μ₀ pertenezca al intervalo de confianza
(1-α) para μ: ^DWi7MB9x

Dicho de otro modo: el IC de nivel (1-α) para μ es el conjunto de TODOS los valores μ₀ que un test
bilateral de nivel α NO rechazaría. Solo vale para tests BILATERALES (de ahí la comparación del
ejemplo del aceite). ^eyMJKJZV

TEORÍA ^7z2d7HfI

Test para la varianza poblacional σ² ^v0duSz9K

Sea X₁,...,Xₙ una m.a. de N(μ, σ²). Sabemos que (n-1)S²/σ² ~ χ²_{n-1}. ^9BMeskuY

EJEMPLO ^27jAE3dG

Ejemplo: variabilidad de un equipo de medición ^JmSPozU9

El investigador afirma σ = 2 (σ² = 4). n = 16, s² = 6.1, α = 0.05, bilateral. ^aU4j3QRD

Como 6.262 < 22.875 < 27.488, NO se rechaza H₀: los datos no contradicen la afirmación del
investigador sobre la variabilidad de su equipo. ^lfCpRRnr

TEORÍA ^AXt6fm1A

Test para la proporción — CASO i): n grande ^nkhNrTb8

Sea X₁,...,Xₙ una m.a. Bernoulli(p); X = ΣXᵢ ~ Bin(n,p). Si n es suficientemente grande para
aplicar el TCL, p̂ = X/n ~ N(p, p(1-p)/n). ^Oht4Z96A

Región de rechazo y potencia ^h4LOdsUl

Tamaño de muestra para que β(p′) ≤ β₀ ^9RVcTTrd

EJEMPLO ^RExZkT39

Ejemplo: campaña de emisión de gases (n grande) ^a0ADNZi8

En 2011 pasaba el 70% de los vehículos. Tras una campaña, en una muestra de 200 autos de
2013, pasaron 156. H₀: p = 0.70  vs  H_A: p > 0.70, α = 0.02. ^dXBXCt0a

Hay evidencia al 2% de que el porcentaje de vehículos que pasan la prueba aumentó: la campaña
fue efectiva. ^uOtkCQq1

TEORÍA ^xxu3oxRJ

Test para la proporción — CASO ii): n chico ^EmJHJ8eH

Si n es pequeño, la prueba se basa directamente en la distribución Binomial exacta de X. ^vb1Eb1rJ

La región de rechazo se arma a MANO eligiendo los valores de X más extremos a favor de H_A, y
se calcula α = P(X ∈ RR | H₀) con la binomial (no da exactamente el α pedido, por ser discreta). ^yNN8HiVS

EJEMPLO ^J07VGR6C

Ejemplo: familias interesadas en TV por cable (n chico) ^yxNUit4p

n = 25, H₀: p = 0.5  vs  H_A: p > 0.5. Tres regiones candidatas: ^pJMrJR8s

Como H_A dice que p es MAYOR, la región de rechazo debe incluir solo valores GRANDES de X:
RR_3 es la adecuada (RR_1 mezcla las dos colas, RR_2 apunta para el lado contrario). ^VQu936OS

β baja mucho de p=0.6 a p=0.8: cuanto más lejos está la verdadera p de p₀=0.5, más fácil es
detectarla (menor error de tipo II). ^8tYNJN8w

Decisión con 20 de 25 familias interesadas ^X9jmmrGr

X = 20 ∈ RR₃ = {x ≥ 18}  →  se rechaza H₀. ^k2rWNnpE

Capturas que pegaste vos (quedan acá como referencia de esta sección): ^W1Pd9erk

Dos poblaciones (Clase 30 de octubre) ^CLAyi24e

TEORÍA ^u6rm2YyG

Muestras apareadas ^5JFtZ4fK

En los estudios apareados: los sujetos se asignan en pares y los resultados se comparan dentro
de cada par (ej.: moneda para asignar tratamiento/control en cada par). Una situación típica es la
de mediciones antes y después en el MISMO sujeto. ^cXJH11RM

EJEMPLO ^FnD8evgK

Ejemplo: cursos de verano de francés (20 profesores) ^RlFDeXAK

Se mide comprensión del francés hablado antes y después de 4 semanas de inmersión. Se restan
las calificaciones (2do test - 1er test) para obtener la mejora de cada docente; esas 20 diferencias
forman una sola muestra. ^sqAJHPIG

No es probable observar, solo por azar, una mejora así: hay evidencia de que los cursos de verano
mejoran la comprensión del francés hablado. ^rEGzWwsu

TEORÍA ^TK2q9UVu

Resumen del caso apareado ^ob977y03

Con muestras apareadas, bidimensional (X₁,Y₁),...,(Xₙ,Yₙ), se define Dᵢ = Xᵢ - Yᵢ. Esas Dᵢ forman
una muestra aleatoria de una N(μ_D, σ_D²). ^x7d79VYU

IC para la diferencia media ^mcq990kH

TEORÍA ^Ix8rco3l

Problemas de dos muestras: qué cambia respecto de apareadas ^ajWQesRQ

La estadística inferencial de dos poblaciones compara las respuestas de DOS GRUPOS. Puede surgir
de un experimento aleatorizado (se divide a los sujetos al azar en dos grupos con tratamientos
distintos) o de comparar dos muestras ya existentes de dos poblaciones. ^JYvDrDJK

La diferencia clave con el caso apareado: acá las dos muestras son INDEPENDIENTES entre sí (en
el apareado no lo son, y por eso se reduce todo a una sola muestra de diferencias). ^4QlDm7XJ

Si las poblaciones son normales (o simétricas, con n grande), la inferencia se hace estimando la
diferencia de medias μ₁ - μ₂. Dos poblaciones normales difieren si difieren sus medias y/o varianzas. ^0cL1ZbLB

TEORÍA ^ht6SgwtP

CASO A: z-test para dos muestras, σ₁ y σ₂ conocidas ^mq4MEOx8

X₁,...,X_{n₁} m.a. de N(μ₁,σ₁²) e Y₁,...,Y_{n₂} m.a. de N(μ₂,σ₂²), independientes entre sí. ^S6yhmEdv

IC para μ₁ - μ₂ de nivel (1-α) ^cHx6KD7p

Es exacto si las muestras son normales, y aproximado (por TCL) si n₁ y n₂ son grandes aunque no
lo sean. ^HVJRlkBe

EJEMPLO ^rOxwAxY9

Ejemplo: test del agujero (trabajadoras vs. universitarios) ^dTSMFRJ6

Trabajadoras: μ₁ = 120, σ₁ = 28, n₁ = 10. Universitarios: μ₂ = 105, σ₂ = 35, n₂ = 12.
¿Probabilidad de que los 10 universitarios tengan una media MAYOR que la de las 12 trabajadoras? ^zik38cyJ

EJEMPLO ^RSZjnSm0

Ejemplo: sociólogo con muestras grandes (n₁=750, n₂=412) ^hiR73R5Z

Duda de que la diferencia histórica sea exactamente 15. Resultados: trabajadoras (n=412,
x̄=186.60, s=29.15); estudiantes (n=750, x̄=175.50, s=31.55). Como ambas muestras son
grandes, se usan las s muestrales en lugar de las σ históricas (sigue siendo aproximadamente Z). ^5y8Lydcn

El IC no deja afuera el valor 15 (lo contiene), así que no hay razón para pensar que los valores
históricos dejaron de valer. ^QgvTcZGZ

TEORÍA ^xjjuc6mF

CASO B: t-test para dos muestras, σ₁ = σ₂ desconocida ^lPHEw1LB

Si σ es desconocida pero igual en las dos poblaciones, conviene estimarla a partir de la muestra
CONJUNTA (desvío combinado, pooled): ^IzRMCIGn

IC para μ₁ - μ₂ ^4FJ2t0na

EJEMPLO ^MBrxtB8i

Ejemplo: templado del metal en agua salada vs. aceite ^1NVVVp9R

Agua salada: n₁=13, x̄₁=145.021, s₁=0.02396. Aceite: n₂=8, x̄₂=144.979, s₂=0.03137. ^REQoH9Gd

El 0 no pertenece al IC: se rechaza, con α = 0.05, la hipótesis de igualdad de medias. ^JMHhqzw3

Hay poca duda de que los dos métodos de templado producen una dureza distinta en el metal. ^TIuwfNeE

TEORÍA ^IGcudz85

CASO C: t-test para dos muestras, σ₁ y σ₂ desconocidos (Welch) ^yLyatOUv

Si las desviaciones poblacionales son distintas y desconocidas, se sustituyen por las muestrales,
pero el estadístico resultante ya NO sigue una t exacta; se aproxima a una t con grados de libertad
estimados a partir de los datos (fórmula de Welch-Satterthwaite): ^eXa93akX

Si gl no da entero, se aproxima al entero más próximo. La RR, el IC y el p-valor se arman igual
que en el Caso B, pero con T ~ t_{gl} en vez de t_{n₁+n₂-2}. ^CB6066kK

EJEMPLO ^Ond8xiFm

Ejemplo: DDT y convulsiones (6 ratas envenenadas, 6 control) ^5tYHZoeb

Segundo pico de actividad nerviosa (% del primero). Envenenadas: 12.207, 16.869, 25.050,
22.429, 8.456, 20.589. Control: 11.074, 9.686, 12.064, 9.351, 8.182, 6.642. ^WwJj91Kl

Test a dos colas (el aumento no era un efecto previsto, se observó en el experimento): ^siwwesSn

Evidencia sólida de que el tamaño medio del segundo pico difiere entre el grupo envenenado y
el grupo control. ^OYomSdDU

Checklist final ^nAyJGCts

NOTA ^VkfM96kT

Checklist antes de entregar ^OPmE0uGT

Estimación: ¿calculé E(θ̂)? ¿Lo comparé con θ? ¿Corregí el sesgo? ECM = Var + sesgo².
Momentos: E(X) = X̄. MV: L → ln L → derivar → igualar a 0 → verificar máximo. ^zfXcsOpD

IC: ¿σ conocida o no? ¿n grande? z_{α/2} o t_{α/2,n-1}. χ² con las dos colas (¡pueden estar
intercambiadas!). Redondear n hacia arriba. ^mjl1806Z

Tests: tesis a probar en H_A. α o α/2 según la alternativa. Estadístico con μ₀ (o p₀). RR del
lado correcto. Comparar p-valor con α. Decisión → conclusión EN CONTEXTO. ^w2vGKCEA

Formulario: todo junto (IC + tests) ^8LtEKKHT

Referencia rápida de todas las fórmulas del apunte, consolidadas en un solo lugar.
θ₀ / Δ₀ es el valor que propone H₀ en cada caso. ^MaXitpME

FORMULARIO ^EKwKZTKd

Tests para la media μ (una muestra): estadístico y distribución ^M5Ysw1lX

H₀: μ = μ₀ en todos los casos. La RR y el p-valor para A/B se leen en la tabla "Z o T" de abajo
(con z); para C, con la misma tabla pero usando t y t_{n-1}. El Caso C no tiene fórmula de β ni de n. ^XzdFqqED

FORMULARIO ^bPVIf1yM

RR y p-valor según H_A — vale para CUALQUIER estadístico Z o T ^Cdc2mR7v

Regla universal, para cualquier caso de esta hoja: p-valor ≤ α ⟹ se rechaza H₀.  p-valor > α ⟹
no se rechaza H₀. θ representa μ, μ₁-μ₂, μ_D o p según el test. ^ipl6gp7x

Para χ² (test de varianza) el patrón es DISTINTO (no es simétrico) ^5VbIYNJN

FORMULARIO ^ibCc3EBo

Potencia y tamaño de muestra (Caso A y test para p) ^NjxRoB7x

Para el test de proporción, β(p) y n tienen la misma forma pero con z·√(p(1-p)/n) en lugar de σ/√n
(ver la ficha "Test para la proporción — CASO i)" en el apunte). ^4WStq41Y

FORMULARIO ^SvtGvXoq

Test para σ² y para p (una muestra) ^aLIqKb9a

FORMULARIO ^3xTGJVlt

Tests dos poblaciones ^QRDAv9a4

H₀: μ_D = Δ₀ (apareadas) o μ₁-μ₂ = Δ₀ (A/B/C); casi siempre Δ₀ = 0. RR y p-valor: misma tabla
de "Z o T" de más arriba, cambiando θ₀ por Δ₀. ^ZtX82oGJ

FORMULARIO ^Kdxc0oyJ

IC para μ (una muestra) ^lqckmr03

FORMULARIO ^0wORDjZW

IC para σ² y para p (una muestra) ^OiCySVFI

OJO con el orden: extremo inferior usa χ²_{α/2,n-1} (el GRANDE); extremo superior usa
χ²_{1-α/2,n-1} (el CHICO) — al revés que con z o t. ^lhu7QPJp

FORMULARIO ^guV7ZZ6L

IC dos poblaciones ^RWGYaV9h

FORMULARIO ^9l6YrNqC

Valores críticos de memoria y dualidad IC ↔ test ^JA5wGDD7

Vale igual para σ² (con el IC de χ²) y para μ₁-μ₂. Solo para tests bilaterales. ^Lq5rhA3D

## Embedded Files
b30d4915392a9952585848f1646ad6244ffe8491: $$\begin{array}{ll} \textbf{Clase} & \textbf{Tema y dónde está en este apunte}\\ \hline \text{XV (7 y 9/10)} & \text{Estimación puntual: momentos, MV, invarianza, asintóticas}\ \to\ \text{bloque "Estimación"}\\ \text{XVI (14/10)} & \text{Distribuciones derivadas de la normal, IC para }\mu\text{ (Casos A y B)}\to\text{bloque "IC"}\\ \text{XVII (16/10)} & \text{IC para }\sigma^2\text{ (Caso C), IC asintóticos (Caso D), IC para }p\to\text{bloque "IC"}\\ \text{XVIII (23/10)} & \text{Test de hipótesis: ingredientes, p-valor, errores, potencia, Casos A y B}\to\text{"Tests"}\\ \text{XIX (28/10)} & \text{Test Caso C, dualidad IC}\leftrightarrow\text{test, test para }\sigma^2\text{ y }p\to\text{"Tests"}\\ \text{XX (30/10)} & \text{Dos poblaciones: apareadas, Casos A, B y C (Welch)}\to\text{bloque "Dos poblaciones"}\\ \text{XXI} & \text{Regresión lineal (comienzo)}\to\text{bloque "Regresión" (sin diapositivas propias)} \end{array}$$

ecc11b19eb3c936001a1bfe90132c8aa36580fb5: $$\begin{array}{l|l|l} \textbf{Situación} & \textbf{Estadístico (pivote)} & \textbf{Distribución}\\ \hline \mu,\text{normal},\sigma\text{ conocida} & \dfrac{\bar X-\mu}{\sigma/\sqrt n} & N(0,1)\\[2mm] \mu,\text{normal},\sigma\text{ desconocida} & \dfrac{\bar X-\mu}{S/\sqrt n} & t_{n-1}\\[2mm] \mu,\,n\text{ grande},\sigma\text{ conocida} & \dfrac{\bar X-\mu}{\sigma/\sqrt n} & \approx N(0,1)\\[2mm] \mu,\,n\ge40,\sigma\text{ desconocida} & \dfrac{\bar X-\mu}{S/\sqrt n} & \approx N(0,1)\\[2mm] \sigma^2,\text{normal} & \dfrac{(n-1)S^2}{\sigma^2} & \chi^2_{n-1}\\[2mm] p,\,n\text{ grande} & \dfrac{\hat p-p}{\sqrt{p(1-p)/n}} & \approx N(0,1)\\[2mm] p,\,n\text{ chico} & X=\sum X_i & \text{Bin}(n,p_0)\\[2mm] \text{apareadas: }\mu_D & \dfrac{\bar D-\Delta_0}{S_D/\sqrt n} & t_{n-1}\\[2mm] \mu_1-\mu_2,\sigma_1,\sigma_2\text{ conocidas} & \dfrac{\bar X-\bar Y-\Delta_0}{\sqrt{\sigma_1^2/n_1+\sigma_2^2/n_2}} & N(0,1)\\[2mm] \mu_1-\mu_2,\sigma_1=\sigma_2\text{ desc.} & \dfrac{\bar X-\bar Y-\Delta_0}{S_p\sqrt{1/n_1+1/n_2}} & t_{n_1+n_2-2}\\[2mm] \mu_1-\mu_2,\sigma_1\ne\sigma_2\text{ desc.} & \dfrac{\bar X-\bar Y-\Delta_0}{\sqrt{S_1^2/n_1+S_2^2/n_2}} & \approx t_{gl}\ (\text{Welch}) \end{array}$$

c7dc2b5adb7e44cdfa84a1da525a6a49c9e4eed7: $$z_{0.10}=1.282\quad z_{0.05}=1.645\quad z_{0.025}=1.96\quad z_{0.01}=2.326\quad z_{0.005}=2.576$$

405f246a3aa7c898ee20ab8bd753bf9d27cd8f78: $$z_{1-\alpha}=-z_\alpha\qquad t_{1-\alpha,\nu}=-t_{\alpha,\nu}\qquad \chi^2_{1-\alpha,\nu}\ \text{NO es simétrico de }\chi^2_{\alpha,\nu}$$

ba0827846157973bc3d56f856fb5dd1c6789445e: $$\{p(x;\theta):\theta\in\Theta\}\qquad\theta=\text{parámetro (o vector)}\quad\text{ej.: }X\sim N(\mu,\sigma^2),\ \theta=(\mu,\sigma^2)$$

f36fe75c96acf9014a7ac8a1ce89a287c3c421bb: $$\hat\theta=h(X_1,\dots,X_n)\quad(\text{estimador, variable aleatoria})\qquad \hat\theta_{obs}=h(x_1,\dots,x_n)\quad(\text{estimación, un número})$$

124a3be26a33fdd4d7dd14c63e05db2d3c55d1cc: $$\bar X=\frac1n\sum_{i=1}^n X_i\qquad S_{n-1}^2=\frac{1}{n-1}\sum_{i=1}^n(X_i-\bar X)^2\qquad \Sigma_n^2=\frac1n\sum_{i=1}^n(X_i-\bar X)^2$$

4dca4ef2400046a5688dfe939b1847ac11dac608: $$\text{Sesgo}(\hat\theta)=E(\hat\theta)-\theta\qquad \hat\theta\text{ insesgado}\iff E(\hat\theta)=\theta\qquad\text{asint. insesgado}\iff\lim_{n\to\infty}E(\hat\theta)=\theta$$

f98b468939eaed9cc10b2b63bb08e7186b2552c9: $$ECM(\hat\theta)=E\big[(\hat\theta-\theta)^2\big]=V(\hat\theta)+\big[\text{Sesgo}(\hat\theta)\big]^2$$

104c01ca94461a889eed34156ed6377f6525a5f3: $$\sigma_{\hat\theta}=\sqrt{V(\hat\theta)}\qquad \hat\sigma_{\hat\theta}=\text{error estándar ESTIMADO (parámetros desconocidos reemplazados por estimaciones)}$$

46a0837574baf48d7d2cf1467aca27d6ce98d9b8: $$ER=\frac{ECM(\hat\theta_1)}{ECM(\hat\theta_2)}\qquad ER<1\Rightarrow\hat\theta_1\text{ es más eficiente}$$

14e458dcacf7ebb21284a209b689c35fe97f95b3: $$E(\bar X)=\mu\qquad V(\bar X)=\frac{\sigma^2}{n}\qquad E(S_{n-1}^2)=\sigma^2$$

b8c5ec083dbdff74fd94d4befa72cf6b6266899b: $$\hat\theta_n\text{ consistente}\iff\hat\theta_n\xrightarrow{P}\theta\iff\lim_{n\to\infty}P(|\hat\theta_n-\theta|\ge\varepsilon)=0\ \ \forall\varepsilon>0$$

ce9d4bb8d99f269cc34393f9242219240103c3dc: $$P(|\hat\theta_n-\theta|\ge\varepsilon)\le\frac{ECM(\hat\theta_n)}{\varepsilon^2}\ \Rightarrow\ \big[ECM(\hat\theta_n)\to0\Rightarrow\text{consistente}\big]\quad\text{(criterio de Chebyshev; suficiente, no necesario)}$$

4bba63658089169e9a5b78e013a4c19586119e4f: $$\hat\theta_1=2\bar X:\quad E=\theta\ (\text{insesgado})\qquad V(\hat\theta_1)=\frac{\theta^2}{3n}$$

a300a9fb4f74404239ec5fc14135d2b007880e5c: $$M=\max_i X_i:\quad E(M)=\frac{n}{n+1}\theta\ (\text{sesgado})\qquad \hat\theta_2=\frac{n+1}{n}M:\quad E=\theta,\ \ V(\hat\theta_2)=\frac{\theta^2}{n(n+2)}$$

481da40ef81d95f889d5b5ba9125b8f43700ff33: $$M_j=E(X^j)=g_j(\theta_1,\dots,\theta_k)\qquad \overline{M}_j=\frac1n\sum_{i=1}^n X_i^j$$

2bb115017e4fde3eceffa77ef577fb27cc21e2ad: $$\begin{array}{lll} \textbf{Modelo} & \textbf{Ecuación} & \textbf{Estimador}\\ \hline \text{Ber}(p) & E(X)=p & \hat p=\bar X\\ \text{Poisson}(\lambda) & E(X)=\lambda & \hat\lambda=\bar X\\ \mathcal{E}(\lambda) & E(X)=1/\lambda & \hat\lambda=1/\bar X\\ U(0,\theta) & E(X)=\theta/2 & \hat\theta=2\bar X\\ N(\mu,\sigma^2) & E(X)=\mu,\,E(X^2)=\mu^2+\sigma^2 & \hat\mu=\bar X,\ \hat\sigma^2=\Sigma_n^2 \end{array}$$

b89a776311866c3af32de9168c1977a04f62dee8: $$E(X)=\frac{\theta+1}{\theta+2}\ \Rightarrow\ \hat\theta=\frac{1-2\bar X}{\bar X-1}$$

c0bdff7f98c4baf6490e5df61c714b7c574423b8: $$L(\theta)=\prod_{i=1}^n p(x_i;\theta)\qquad \ell(\theta)=\ln L(\theta)=\sum_{i=1}^n\ln p(x_i;\theta)\qquad \hat\theta_{MV}=\arg\max_\theta\ell(\theta)$$

10591d403f5732e85d67b67e743ea7fcfdcfb1c1: $$\hat\theta_{MV}\text{ de MV para }\theta\ \Longrightarrow\ h(\hat\theta_{MV})\text{ es el de MV para }h(\theta)$$

8f1cab2e50466b5dc3451a9661afeb2598fedfbc: $$\begin{array}{lll} \textbf{Modelo} & \ell(\theta) & \hat\theta_{MV}\\ \hline \text{Ber}(p) & \sum X_i\ln p+(n-\sum X_i)\ln(1-p) & \hat p=\bar X\\ \text{Poisson}(\lambda) & -n\lambda+\sum X_i\ln\lambda-\sum\ln X_i! & \hat\lambda=\bar X\\ \mathcal{E}(\lambda) & n\ln\lambda-\lambda\sum X_i & \hat\lambda=1/\bar X\\ N(\mu,\sigma^2) & -\tfrac n2\ln(2\pi\sigma^2)-\tfrac1{2\sigma^2}\sum(X_i-\mu)^2 & \hat\mu=\bar X,\ \hat\sigma^2=\Sigma_n^2\\ U(0,\theta) & \text{no derivable} & \hat\theta=\max_iX_i \end{array}$$

81a03570b498a01211486fd8bf532c9cf47b4325: $$\hat\lambda=\frac{n}{\sum x_i}$$

9371ede625f41871dd038ffd405a7acac3f1baea: $$\widehat{x_{0.90}}=\bar x+1.282\,\hat\sigma\qquad \widehat{P(X<a)}=\Phi\!\left(\frac{a-\bar x}{\hat\sigma}\right)$$

f7dd1b29f193180f0b234993e0ac5c019afa970d: $$\hat\theta_{MV}\approx N\!\left(\theta,\frac{1}{nI(\theta)}\right)\qquad I(\theta)=-E\!\left[\frac{\partial^2\ln p(X;\theta)}{\partial\theta^2}\right]\ \ (\text{información de Fisher})$$

41c1447ee585b11ff4de906b1f6b2df46ecf1db3: $$\bar X\sim N\!\left(\mu,\frac{\sigma^2}{n}\right)\ \Rightarrow\ Z=\sqrt n\,\frac{\bar X-\mu}{\sigma}\sim N(0,1)$$

89df33aa1205d130c0c8faf7431685fbe6864fa5: $$\frac{(n-1)S^2}{\sigma^2}=\frac{\sum(X_i-\bar X)^2}{\sigma^2}\sim\chi^2_{n-1}\qquad \bar X\ \text{y}\ S^2\ \text{son independientes}$$

61712e4531a70e05e4e5cb2df17d9b3f45d1a81e: $$Z\sim N(0,1),\ X\sim\chi^2_\nu\ \text{independientes}\ \Rightarrow\ T=\frac{Z}{\sqrt{X/\nu}}\sim t_\nu$$

419ad78aa6f86d60f7680c8affd5eb41411559d5: $$T=\sqrt n\,\frac{\bar X-\mu}{S}=\frac{Z}{\sqrt{\chi^2_{n-1}/(n-1)}}\sim t_{n-1}\qquad t_\nu\to N(0,1)\ (\nu\to\infty)$$

50eabc10fd09b2978ef8dbb8c6234ff431e08b48: $$P\big(L(X_1,\dots,X_n)\le\theta\le R(X_1,\dots,X_n)\big)=1-\alpha\ \Longrightarrow\ [L,R]\ \text{es un IC de nivel }1-\alpha$$

dc65538fdfb796da10f0ed605fee8092ef4d2120: $$\bar X\sim N\!\left(\mu,\frac{\sigma^2}{n}\right)\qquad h=\sqrt n\,\frac{\bar X-\mu}{\sigma}\sim N(0,1)$$

3fb132e80f5c27d489eeac2f1a4ee70ceeaf88e5: $$a=-z_{\alpha/2}\qquad b=z_{\alpha/2}$$

12d492122c8743da602aa81458b057ba16e011d3: $$P\!\left(\bar X-z_{\alpha/2}\tfrac{\sigma}{\sqrt n}\le\mu\le\bar X+z_{\alpha/2}\tfrac{\sigma}{\sqrt n}\right)=1-\alpha$$

66b126e38e09e22ee7fd934187e83f23c44bf91b: $$\bar X\pm z_{\alpha/2}\frac{\sigma}{\sqrt n}$$

60af0a9f287d70b0e41aa792cfc9301674281178: $$L=2z_{\alpha/2}\frac{\sigma}{\sqrt n}\qquad L\le L_0\iff n\ge\left(\frac{2z_{\alpha/2}\sigma}{L_0}\right)^{2}$$

b97c87cdb896b68eb5b1c98fc126abe46fa7f7fb: $$9\pm1.96\cdot\frac{2}{3}=[7.69,\ 10.31]$$

5394840c863eee09ee1fb1a669883b6ee9322413: $$1.96\frac{0.3}{\sqrt n}\le0.1\Rightarrow n\ge\left(\frac{1.96\times0.3}{0.1}\right)^2=34.57\Rightarrow n=35$$

440c33980d5e220f78e2ce00d5e890c404b897cd: $$S^2=\frac{1}{n-1}\sum_{i=1}^n(X_i-\bar X)^2\qquad h=\sqrt n\,\frac{\bar X-\mu}{S}\sim t_{n-1}$$

cc9b656fbf27ea40fbae2603d66c0e19ba18556d: $$a=-t_{\alpha/2,n-1}\qquad b=t_{\alpha/2,n-1}$$

1b68d8ae759ef96ba18c6ad86423fe166ba809fd: $$\bar X\pm t_{\alpha/2,n-1}\frac{S}{\sqrt n}$$

80d325735bfc957a31a86c039afb379da185b2ca: $$h=(n-1)\frac{S^2}{\sigma^2}\sim\chi^2_{n-1}$$

06e4ecad71c17b7b3db4d11cfdaeed3fcf836f65: $$a=\chi^2_{1-\alpha/2,n-1}\qquad b=\chi^2_{\alpha/2,n-1}$$

254654385b703a38acfd147e475b19cc00ffbca9: $$\sigma^2\in\left[\frac{(n-1)S^2}{\chi^2_{\alpha/2,n-1}},\ \frac{(n-1)S^2}{\chi^2_{1-\alpha/2,n-1}}\right]\qquad \sigma\in\left[\sqrt{\cdots},\sqrt{\cdots}\right]\ \text{(con la raíz)}$$

422ba8964a3b7d7c94316822217fd4db095664e7: $$\begin{array}{l|c|c} \textbf{Hipótesis} & \textbf{Parámetro} & \textbf{Intervalo de Confianza}\\ \hline \sigma^2\text{ conocido} & \mu & \bar X\pm z_{\alpha/2}\dfrac{\sigma}{\sqrt n}\\[2mm] \sigma^2\text{ desconocido} & \mu & \bar X\pm t_{\alpha/2,n-1}\dfrac{S}{\sqrt n}\\[2mm] \mu\text{ desconocido} & \sigma^2 & \left[\dfrac{(n-1)S^2}{\chi^2_{\alpha/2,n-1}},\dfrac{(n-1)S^2}{\chi^2_{1-\alpha/2,n-1}}\right] \end{array}$$

e31d46f26b7b0f9277b9e46023071091cc452aed: $$76.88\pm t_{0.005,21}\frac{3.784}{\sqrt{22}}=76.88\pm2.284$$

aa09d26cac1d3fffa2782cb275bc2cfbbcfe342e: $$\sigma^2\in\left[\frac{21\times14.324}{8.034},\frac{21\times14.324}{41.401}\right]=[37.443,\ 7.27]\Rightarrow\sigma\in[6.119,\ 2.695]$$

d4e8255a1e3c1c7faa0785107f0e6aed5251f634: $$\bar X\approx N\!\left(\mu,\frac{\sigma^2}{n}\right)\qquad \bar X\pm z_{\alpha/2}\frac{\sigma}{\sqrt n}\qquad\text{(IC aproximado)}$$

25ee55f82c6099153de8f36f809717eaea5ab788: $$\bar X\pm z_{\alpha/2}\frac{S_{n-1}}{\sqrt n}\qquad\text{(IC aproximado)}$$

f4dd7694c13bc211ac26d312d566e2d4a4d610ae: $$0.81\pm2.576\cdot\frac{0.34}{\sqrt{110}}=0.81\pm0.0835$$

10191c534904b84c256a047877fa1e8262e7eeff: $$\frac{\hat p-p}{\sqrt{p(1-p)/n}}\approx N(0,1)$$

2c5f6ec51d2abc6ca2e939e677434f5c64586204: $$P\!\left(\left|\frac{\hat p-p}{\sqrt{p(1-p)/n}}\right|\le z_{\alpha/2}\right)\simeq1-\alpha\ \Rightarrow\ \text{ecuación cuadrática en }p$$

4c499077e41e148f5e4c651f3a5a3ee3e08e6547: $$\frac{\hat p+\dfrac{z_{\alpha/2}^2}{2n}\ \pm\ z_{\alpha/2}\sqrt{\dfrac{\hat p(1-\hat p)}{n}+\dfrac{z_{\alpha/2}^2}{4n^2}}}{1+\dfrac{z_{\alpha/2}^2}{n}}$$

9f9dc0bd3df5e65726127377a0d7e7d107dc2c32: $$\frac{z_{\alpha/2}^2}{2n}\ll\hat p\qquad \frac{z_{\alpha/2}^2}{4n}\ll\frac{\hat p(1-\hat p)}{n}\qquad\frac{z_{\alpha/2}^2}{n}\ll1$$

01913f3250f030a5f90bd9346896651753d1e064: $$\hat p\pm z_{\alpha/2}\sqrt{\frac{\hat p(1-\hat p)}{n}}\qquad\text{válido si }n\hat p\ge10\text{ y }n(1-\hat p)\ge10$$

1281694648874f6b1cdb3be65a3922896a0d18b7: $$L=2z_{\alpha/2}\sqrt{\frac{\hat p(1-\hat p)}{n}}\le\frac{z_{\alpha/2}}{\sqrt n}\ \Rightarrow\ n\ge\left(\frac{z_{\alpha/2}}{L}\right)^{2}=\frac{z_{\alpha/2}^2}{4E^2}$$

bbf72c477c0aaf58aa5b449a1b1a97f0387c404f: $$\hat p=\frac{201}{356}=0.5646\qquad \hat p\pm z_{0.01}\sqrt{\frac{\hat p(1-\hat p)}{356}}=0.565\pm0.061$$

df2ebae9d41c1171ae73ebcc83a059d2296767f7: $$n\ge\left(\frac{2.326}{0.05}\right)^2=2164.8\Rightarrow n=2165$$

d5872b90f8b0e629f404d6f970092c0a6c84d069: $$H_0:\ \mu=-0.545\qquad\text{vs}\qquad H_A:\ \mu>-0.545$$

099ddc8df5c033b423f01bcbd9f75752af8bd30c: $$H_A=\begin{cases}\theta\ne\theta_0 & \text{prueba bilateral}\\ \theta>\theta_0 & \text{prueba unilateral a cola superior}\\ \theta<\theta_0 & \text{prueba unilateral a cola inferior}\end{cases}$$

987e396dca2d68488113a39e6353b27787b732fe: $$P(\bar X\ge-0.538)=P\!\left[\frac{\bar X-(-0.545)}{0.008/\sqrt5}\ge\frac{-0.538-(-0.545)}{0.008/\sqrt5}\right]=P(Z\ge1.96)=1-0.975=0.025$$

702d9f1ef9b69aa5b95adebd146691f3b48914ca: $$\text{p-valor}\le\alpha\ \Longrightarrow\ \text{se rechaza } H_0$$

6606bf5bdcd96e6a78740bb15f260e932c85d29f: $$\text{p-valor}>\alpha\ \Longrightarrow\ \text{NO se rechaza } H_0$$

00d46f1f5e6a4c6437135e3eff74cd3ac2e4dac9: $$\alpha=P(\text{rechazar }H_0\mid H_0\text{ verdadera})$$

0b86b2d198dd098350d3a26c4b4bcdb2b68b8505: $$\beta=P(\text{no rechazar }H_0\mid H_0\text{ falsa, con un valor alternativo concreto})$$

da88d1620e33092f12b9d3d00db13efc37418cef: $$\begin{array}{l|c|c} & \textbf{Aceptar } H_0 & \textbf{Rechazar } H_0\\ \hline H_0\text{ verdadera} & \text{Decisión correcta} & \text{Error de tipo I }(\alpha)\\ H_0\text{ falsa} & \text{Error de tipo II }(\beta) & \text{Decisión correcta} \end{array}$$

5066fafd933e7cfd7374843363c1abaae8f03d6d: $$H_0:\mu=\mu_0$$

9fabf9922965075e9977afabd78fae719431dc8f: $$Z=\frac{(\bar X-\mu_0)\sqrt n}{\sigma}\sim N(0,1)\quad\text{bajo }H_0$$

f264d8ca7f39eea65f39973d3dfd5c5039a05da4: $$\begin{array}{l|l|l} H_A & RR_\alpha & \beta(\mu)\\ \hline \mu<\mu_0 & z\le-z_\alpha & 1-\Phi\!\left(-z_\alpha+\dfrac{(\mu_0-\mu)\sqrt n}{\sigma}\right)\\[2mm] \mu>\mu_0 & z\ge z_\alpha & \Phi\!\left(z_\alpha+\dfrac{(\mu_0-\mu)\sqrt n}{\sigma}\right)\\[2mm] \mu\ne\mu_0 & |z|\ge z_{\alpha/2} & \Phi\!\left(z_{\alpha/2}+\dfrac{(\mu_0-\mu)\sqrt n}{\sigma}\right)-\Phi\!\left(-z_{\alpha/2}+\dfrac{(\mu_0-\mu)\sqrt n}{\sigma}\right) \end{array}$$

a80d34a0416304e94a25a9710b382860212c0c63: $$\text{unilateral: } n\ge\left[\frac{(z_{\beta_0}+z_\alpha)\,\sigma}{\mu_0-\mu'}\right]^{2}\qquad \text{bilateral: } n\ge\left[\frac{(z_{\beta_0}+z_{\alpha/2})\,\sigma}{\mu_0-\mu'}\right]^{2}$$

ea269180a97c49a33693fefc75029d53f0d5100e: $$RR=\{\bar x\mid\bar x<12-z_{0.02}\tfrac{2}{\sqrt{30}}\}=\{\bar x<11.25\}$$

f4044a9892ff01e455e8542a2e0aae60496d5581: $$\beta(11)=P(\bar X>11.25\mid\mu=11)=P\!\left(Z>0.685\right)=0.2467$$

1521e9d651e91d5e8ce36d7c67b97dc3008efc1e: $$Z=\frac{(\bar X-\mu)\sqrt n}{\sigma}\,\dot\sim\,N(0,1)\quad\text{bajo }H_0$$

a422f7cdb9d44619e834f6a0510cb431b394a289: $$Z=\frac{(\bar X-\mu)\sqrt n}{S_{n-1}}\,\dot\sim\,N(0,1)\quad\text{bajo }H_0$$

38081e5557449282b3e4a3095ef84835dc6e84f6: $$H_0:\mu=5\qquad H_A:\mu\ne5\qquad z_{0.04/2}=z_{0.02}=2.054$$

f9e47fbc025f438f84988de236ed2b7a6a30ce9a: $$RR=\{\bar x>5+2.054\tfrac{0.02}{4}\}\cup\{\bar x<5-2.054\tfrac{0.02}{4}\}=\{\bar x>5.01\}\cup\{\bar x<4.99\}$$

eba2742651f7bce984367624078cf7747b5d01ee: $$1-\beta=1-P(4.99\le\bar X\le5.01\mid\mu=4.98)=1-P(1.2\le Z\le5.9)=1-0.02275=0.97725$$

265b429e21a79d324165c0d05c9b3a4242c13dfe: $$\begin{array}{l|l|l} \textbf{Estadístico} & H_A & p\text{-valor}\\ \hline Z\sim N(0,1) & \text{cola superior} & 1-\Phi(z_{obs})\\ & \text{cola inferior} & \Phi(z_{obs})\\ & \text{bilateral} & 2\,(1-\Phi(|z_{obs}|))\\ \hline T\sim t_{n-1} & \text{cola superior} & P(T>t_{obs})\\ & \text{cola inferior} & P(T<t_{obs})\\ & \text{bilateral} & 2\,P(T>|t_{obs}|)\\ \hline \chi^2\sim\chi^2_{n-1} & \text{cola superior} & P(\chi^2>\chi^2_{obs})\\ & \text{cola inferior} & P(\chi^2<\chi^2_{obs})\\ & \text{bilateral} & 2\min\{P(\chi^2<\chi^2_{obs}),P(\chi^2>\chi^2_{obs})\} \end{array}$$

1aee97ce917d59a8e9ed6bb21bb85b6959dfed68: $$\text{Error estándar}=\frac{38.20}{\sqrt{50}}\approx5.4\qquad z_{obs}=\frac{738.44-750}{5.4}\approx-2.14$$

3024ae3a1e956222938afb22272b2b3b377c4af2: $$\text{Al }5\%:\ z_{0.95}=-1.645,\ \ -2.14<-1.645\Rightarrow\text{se rechaza }H_0$$

3d397003a3c6b4312d09144f2f8417cb842c7ecf: $$\text{Al }1\%:\ z_{0.99}=-2.33,\ \ -2.14>-2.33\Rightarrow\text{no se rechaza }H_0$$

9eff17e6c7ef7a77c8d86e61c2250c74dec24004: $$p\text{-valor}=P(Z<-2.14)\approx0.016$$

24e360437c8159e91a1a5041523180dbc7f91508: $$T=\frac{(\bar X-\mu)\sqrt n}{S_{n-1}}\sim t_{n-1}\quad\text{bajo }H_0$$

0f3285aea020b16da5c1296d4c72a8bf7dcfae99: $$\begin{array}{l|l} H_A & RR_\alpha\\ \hline \mu<\mu_0 & t\le-t_{\alpha,n-1}\\ \mu>\mu_0 & t\ge t_{\alpha,n-1}\\ \mu\ne\mu_0 & |t|\ge t_{\alpha/2,n-1} \end{array}$$

ac37369784ae9224e3d2fa447f33a30e25c60df5: $$t_{obs}=\frac{94.32-95}{1.20/\sqrt{16}}=\frac{-0.68}{0.30}\approx-2.267\qquad t_{0.025,15}\approx2.131$$

17e838ef87ee8033de667dbedd43ac3335bb8d69: $$IC_{95\%}=94.32\pm2.131\times0.30=(93.68,\ 94.96)$$

c6363b52079ba9cdb2d87281da84a2a94c5802f4: $$R_\alpha=\left[\mu_0-z_{\alpha/2}\frac{\sigma}{\sqrt n},\ \mu_0+z_{\alpha/2}\frac{\sigma}{\sqrt n}\right]\quad\text{(si }\bar x_{obs}\in R_\alpha\text{, no se rechaza }H_0\text{ y }\mu_0\text{ es un valor creíble)}$$

35c6a6e8d45249d857285a1d4d0cc2ecdb7cc49b: $$\bar x_{obs}\in R_\alpha\iff|\bar X_n-\mu_0|\le z_{\alpha/2}\frac{\sigma}{\sqrt n}\iff\mu_0\in I_\alpha$$

27da009b3a0706ebc35d65d5d99a7930aadfd23e: $$H_0:\sigma^2=\sigma_0^2\qquad \chi^2=\frac{(n-1)S^2}{\sigma_0^2}\sim\chi^2_{n-1}\quad\text{bajo }H_0$$

f0490cad065eb547be641d5a8c57b3304764a517: $$\begin{array}{l|l} H_A & RR_\alpha\\ \hline \sigma^2>\sigma_0^2 & \chi^2\ge\chi^2_{\alpha,n-1}\\ \sigma^2<\sigma_0^2 & \chi^2\le\chi^2_{1-\alpha,n-1}\\ \sigma^2\ne\sigma_0^2 & \chi^2\le\chi^2_{1-\alpha/2,n-1}\ \text{ó}\ \chi^2\ge\chi^2_{\alpha/2,n-1} \end{array}$$

07d5d17207090d208fa19a8a7704a432f44c5845: $$\chi^2_{obs}=\frac{15\cdot6.1}{4}=22.875\qquad \chi^2_{0.975,15}\approx6.262\qquad\chi^2_{0.025,15}\approx27.488$$

f8ac34333bc50b1739e46add5a74b78b5cd162d6: $$H_0:p=p_0\qquad Z=\frac{(\hat p-p_0)\sqrt n}{\sqrt{p_0(1-p_0)}}\,\dot\sim\,N(0,1)\quad\text{bajo }H_0$$

b3a8fee6f49250738499a9150bc8a03fbb07ec17: $$\begin{array}{l|l|l} H_A & RR_\alpha & \beta(p)\\ \hline p<p_0 & z\le-z_\alpha & 1-\Phi\!\left(-z_\alpha\sqrt{\tfrac{p_0(1-p_0)}{p(1-p)}}+\tfrac{(p_0-p)\sqrt n}{\sqrt{p(1-p)}}\right)\\[2mm] p>p_0 & z\ge z_\alpha & \Phi\!\left(z_\alpha\sqrt{\tfrac{p_0(1-p_0)}{p(1-p)}}+\tfrac{(p_0-p)\sqrt n}{\sqrt{p(1-p)}}\right)\\[2mm] p\ne p_0 & |z|\ge z_{\alpha/2} & \Phi\!\left(z_{\alpha/2}\sqrt{\tfrac{p_0(1-p_0)}{p(1-p)}}+\tfrac{(p_0-p)\sqrt n}{\sqrt{p(1-p)}}\right)-\Phi\!\left(-z_{\alpha/2}\sqrt{\tfrac{p_0(1-p_0)}{p(1-p)}}+\tfrac{(p_0-p)\sqrt n}{\sqrt{p(1-p)}}\right) \end{array}$$

36fcc03d52e38596f5c024235344a8fe3160b9a4: $$n\ge\left[\frac{z_{\beta_0}\sqrt{p'(1-p')}+z_\alpha\sqrt{p_0(1-p_0)}}{p_0-p'}\right]^{2}\quad(\text{unilateral; con }z_{\alpha/2}\text{ en el bilateral})$$

62c9dd5a41113dba73f9ad1066a4300dec0aa764: $$\hat p=\frac{156}{200}=0.78\qquad z_{obs}=\frac{0.78-0.70}{\sqrt{0.70\times0.30/200}}=\frac{0.08}{0.0324}\approx2.47$$

a9dc353f4abe094579ca36c7c12a8f0f0f5f5b05: $$z_{0.02}\approx2.05\qquad2.47>2.05\Rightarrow\text{se rechaza }H_0$$

ee56685b1d0f0087a87a2b8acb617b444c890292: $$H_0:p=p_0\qquad X=\sum_{i=1}^{n}X_i\sim\text{Bin}(n,p_0)\quad\text{bajo }H_0$$

329add0f7f487468e113218ee16d76ddb2f5b05f: $$RR_1=\{x\le7\text{ ó }x\ge18\}\quad RR_2=\{x\le8\}\quad RR_3=\{x\ge18\}$$

0bfc2cc22a34ea4146d483a5afb189a414cc173d: $$\alpha=P(X\ge18\mid p=0.5)=1-P(X\le17)=1-0.9784=0.0216$$

dd4cb8fc905434401fea047223914c1253316066: $$\beta(0.6)=P(X\le17\mid p=0.6)=0.8464\qquad\beta(0.8)=P(X\le17\mid p=0.8)=0.1091$$

515db03ad01a4ea7a65ffd5a5ba0e83be9ab289c: $$H_0:\mu=0\qquad H_A:\mu>0\qquad \bar x=2.5\qquad s=2.89$$

a09c02c97fef4893de5bfb6765b202d120fd59cd: $$t_{obs}=\frac{\bar x-0}{s/\sqrt{20}}=\frac{2.5}{2.89/\sqrt{20}}=3.87\qquad p\text{-valor}=P(T_{19}>3.87)\approx0.000515$$

d25dccea70add9da4735981ad3bb6e93710babe4: $$H_0:\mu_D=\Delta_0\qquad t=\sqrt n\,\frac{\bar d-\Delta_0}{s_d}\sim t_{n-1}\qquad(\text{o }N(0,1)\text{ si }n\text{ es grande})$$

f08109a62c67277198136818a39a836914157f81: $$\begin{array}{l|l} H_A & RR_\alpha\\ \hline \mu_D>\Delta_0 & t\ge t_{\alpha,n-1}\\ \mu_D<\Delta_0 & t\le-t_{\alpha,n-1}\\ \mu_D\ne\Delta_0 & |t|\ge t_{\alpha/2,n-1} \end{array}$$

ecac2995d6b372320db0fc3169a53c898e9a1ff0: $$\bar D\pm t_{\alpha/2,n-1}\frac{S_D}{\sqrt n}$$

81f80dcfe252d2cfef1f783821b938fedf25f64d: $$H_0:\mu_1-\mu_2=\Delta_0\qquad Z=\frac{\bar X-\bar Y-\Delta_0}{\sqrt{\sigma_1^2/n_1+\sigma_2^2/n_2}}\sim N(0,1)\quad\text{bajo }H_0$$

cb305952b48d6a6717e847763608c1551390c5dd: $$\begin{array}{l|l} H_A & RR_\alpha\\ \hline \mu_1-\mu_2>\Delta_0 & z\ge z_\alpha\\ \mu_1-\mu_2<\Delta_0 & z\le-z_\alpha\\ \mu_1-\mu_2\ne\Delta_0 & |z|\ge z_{\alpha/2} \end{array}$$

bc8135ca16316c3e7706df867d4d71e2c10ac745: $$(\bar X-\bar Y)\pm z_{\alpha/2}\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}$$

3123d49857f7c4568b7d1e06f8a3b2104c7a3e27: $$\mu_1-\mu_2=15\qquad V(\bar X_1-\bar X_2)=\frac{28^2}{10}+\frac{35^2}{12}=180.48\qquad \sigma=13.43$$

7e28297b44460c599dc66c5ba8c6dfd3175a75da: $$P\big((\bar X_1-\bar X_2)<0\big)=P\!\left(Z<\frac{0-15}{13.43}\right)=P(Z<-1.12)=0.1314$$

0dc1e7fc8f131c7cae69accfdda6f948f1604a57: $$IC_{99\%}=(186.60-175.50)\pm z_{0.005}\sqrt{\frac{29.15^2}{412}+\frac{31.55^2}{750}}=[6.357,\ 15.842]$$

8a61f69f9a714a329150848c18403705aaa65ce0: $$S_p^2=\frac{(n_1-1)S_1^2+(n_2-1)S_2^2}{n_1+n_2-2}$$

ec6bd4cf960977850e42d7977a766b035be7af9e: $$H_0:\mu_1-\mu_2=\Delta_0\qquad T=\frac{\bar X-\bar Y-\Delta_0}{S_p\sqrt{1/n_1+1/n_2}}\sim t_{n_1+n_2-2}\quad\text{bajo }H_0$$

c907561b1bc5e84d6a7451f4a9ebb6b1e7dde6b7: $$\begin{array}{l|l} H_A & RR_\alpha\\ \hline \mu_1-\mu_2>\Delta_0 & t\ge t_{\alpha,n_1+n_2-2}\\ \mu_1-\mu_2<\Delta_0 & t\le-t_{\alpha,n_1+n_2-2}\\ \mu_1-\mu_2\ne\Delta_0 & |t|\ge t_{\alpha/2,n_1+n_2-2} \end{array}$$

36cc9e2a95cef9fd0c31a906ecb3a68a361c2120: $$(\bar X-\bar Y)\pm t_{\alpha/2,n_1+n_2-2}\,S_p\sqrt{\frac1{n_1}+\frac1{n_2}}$$

69ebab94272e165688c0d68f548c158c4ac7844a: $$s_p^2=\frac{12\times0.02396^2+7\times0.03137^2}{19}=0.000718\quad(s_p\approx0.0268)$$

7cd375b8ecfaeae762ca044eb5ee4681e4216431: $$IC_{95\%}=(145.021-144.979)\pm t_{0.025,19}\,s_p\sqrt{\tfrac1{13}+\tfrac18}\approx(0.015,\ 0.065)$$

85670f39d4423ae7a66ad115304d118f3d35b6bf: $$\text{Con }\alpha=0.01:\quad |t_{obs}|\approx3.33\;>\;t_{0.005,19}\approx2.861\ \Rightarrow\ \text{se rechaza igual}$$

06b7e207524c516efc877c8f271313ec83d351a4: $$T=\frac{\bar X-\bar Y-\Delta_0}{\sqrt{S_1^2/n_1+S_2^2/n_2}}\ \dot\sim\ t_{gl}\qquad gl=\frac{\left(\tfrac{S_1^2}{n_1}+\tfrac{S_2^2}{n_2}\right)^{2}}{\tfrac{1}{n_1-1}\left(\tfrac{S_1^2}{n_1}\right)^{2}+\tfrac{1}{n_2-1}\left(\tfrac{S_2^2}{n_2}\right)^{2}}$$

2248f3feb23a83e5b78cfe363a6acdc5a75deac9: $$H_0:\mu_1=\mu_2\qquad H_A:\mu_1\ne\mu_2$$

ba632ecdd0e990a77b4b09fc8313e02d99b22851: $$t_{obs}\approx2.99\qquad gl\approx5.9\approx6\qquad p\text{-valor}=P(|T_6|\ge2.99)=0.03$$

e2c893370e1179f0efe75d874086ed126f1f1fb8: $$\begin{array}{l|l|l} \textbf{Caso} & \textbf{Supuestos} & \textbf{Estadístico bajo }H_0\\ \hline \text{A} & \text{normal, }\sigma\text{ conocida} & Z=\dfrac{(\bar X-\mu_0)\sqrt n}{\sigma}\sim N(0,1)\\[2mm] \text{B (TCL)} & n\ge30,\ \sigma\text{ conocida} & Z=\dfrac{(\bar X-\mu_0)\sqrt n}{\sigma}\,\dot\sim\,N(0,1)\\[2mm] \text{B (Slutsky)} & n\ge40,\ \sigma\text{ desconocida} & Z=\dfrac{(\bar X-\mu_0)\sqrt n}{S_{n-1}}\,\dot\sim\,N(0,1)\\[2mm] \text{C} & \text{normal, }\sigma\text{ desconocida, }n\text{ chico} & T=\dfrac{(\bar X-\mu_0)\sqrt n}{S_{n-1}}\sim t_{n-1} \end{array}$$

6371e2803a4bceee3b69112b522bb0fb87c585d1: $$\begin{array}{l|l|l} H_A & RR_\alpha & p\text{-valor}\\ \hline \theta<\theta_0\ (\text{cola inf.}) & \text{estad.}\le-z_\alpha\ (\text{o }-t_{\alpha,\nu}) & \Phi(z_{obs})\ \ [\text{o }P(T<t_{obs})]\\ \theta>\theta_0\ (\text{cola sup.}) & \text{estad.}\ge z_\alpha\ (\text{o }t_{\alpha,\nu}) & 1-\Phi(z_{obs})\ \ [\text{o }P(T>t_{obs})]\\ \theta\ne\theta_0\ (\text{bilateral}) & |\text{estad.}|\ge z_{\alpha/2}\ (\text{o }t_{\alpha/2,\nu}) & 2(1-\Phi(|z_{obs}|))\ \ [\text{o }2P(T>|t_{obs}|)] \end{array}$$

c3633f2ef8bff89bce544cde0fff3d4060ad07fb: $$\begin{array}{l|l|l} H_A & RR_\alpha & p\text{-valor}\\ \hline \sigma^2>\sigma_0^2 & \chi^2\ge\chi^2_{\alpha,n-1} & P(\chi^2>\chi^2_{obs})\\ \sigma^2<\sigma_0^2 & \chi^2\le\chi^2_{1-\alpha,n-1} & P(\chi^2<\chi^2_{obs})\\ \sigma^2\ne\sigma_0^2 & \chi^2\le\chi^2_{1-\alpha/2,n-1}\text{ ó }\chi^2\ge\chi^2_{\alpha/2,n-1} & 2\min\{P(\chi^2<\chi^2_{obs}),P(\chi^2>\chi^2_{obs})\} \end{array}$$

b26076927900391fb01ee18274a09bb98c6a49d3: $$\begin{array}{l|l} H_A & \beta(\mu)\ \text{(Caso A, prueba de media)}\\ \hline \mu<\mu_0 & 1-\Phi\!\left(-z_\alpha+\tfrac{(\mu_0-\mu)\sqrt n}{\sigma}\right)\\ \mu>\mu_0 & \Phi\!\left(z_\alpha+\tfrac{(\mu_0-\mu)\sqrt n}{\sigma}\right)\\ \mu\ne\mu_0 & \Phi\!\left(z_{\alpha/2}+\tfrac{(\mu_0-\mu)\sqrt n}{\sigma}\right)-\Phi\!\left(-z_{\alpha/2}+\tfrac{(\mu_0-\mu)\sqrt n}{\sigma}\right) \end{array}$$

67f57f31917e3c0aa9823d0322e50f6df4a4cdc9: $$n\ge\left[\frac{(z_{\beta_0}+z_\alpha)\sigma}{\mu_0-\mu'}\right]^{2}\ (\text{unilat.})\qquad n\ge\left[\frac{(z_{\beta_0}+z_{\alpha/2})\sigma}{\mu_0-\mu'}\right]^{2}\ (\text{bilat.})$$

b198d7d4c9cb4d2e5e7e8600808ef68bc7578973: $$\begin{array}{l|l|l} \textbf{Test} & \textbf{Supuestos} & \textbf{Estadístico bajo }H_0\\ \hline \sigma^2=\sigma_0^2 & \text{normal} & \chi^2=\dfrac{(n-1)S^2}{\sigma_0^2}\sim\chi^2_{n-1}\\[2mm] p=p_0,\ n\text{ grande} & np_0\ge10,\,n(1-p_0)\ge10 & Z=\dfrac{(\hat p-p_0)\sqrt n}{\sqrt{p_0(1-p_0)}}\,\dot\sim\,N(0,1)\\[2mm] p=p_0,\ n\text{ chico} & \text{exacto} & X=\sum X_i\sim\text{Bin}(n,p_0)\ \ (\text{RR a mano}) \end{array}$$

a0327bd53c47fbfda698c32479a40d052941fe5b: $$\begin{array}{l|l|l|l} \textbf{Caso} & \textbf{Supuestos} & \textbf{Estadístico} & \textbf{Distribución}\\ \hline \text{Apareadas} & D_i=X_i-Y_i & t=\sqrt n\dfrac{\bar d-\Delta_0}{s_d} & t_{n-1}\ (\text{o }N(0,1)\text{ si }n\text{ grande})\\[2mm] \text{A} & \sigma_1,\sigma_2\text{ conocidas} & Z=\dfrac{\bar X-\bar Y-\Delta_0}{\sqrt{\sigma_1^2/n_1+\sigma_2^2/n_2}} & N(0,1)\\[2mm] \text{B} & \sigma_1=\sigma_2\text{ desc.} & T=\dfrac{\bar X-\bar Y-\Delta_0}{S_p\sqrt{1/n_1+1/n_2}} & t_{n_1+n_2-2}\\[2mm] \text{C (Welch)} & \sigma_1\ne\sigma_2\text{ desc.} & T=\dfrac{\bar X-\bar Y-\Delta_0}{\sqrt{S_1^2/n_1+S_2^2/n_2}} & \approx t_{gl} \end{array}$$

6a60afe8647951ae74198de696f0ae1314fe235a: $$S_p^2=\frac{(n_1-1)S_1^2+(n_2-1)S_2^2}{n_1+n_2-2}\qquad gl=\frac{\left(\tfrac{S_1^2}{n_1}+\tfrac{S_2^2}{n_2}\right)^2}{\tfrac1{n_1-1}\left(\tfrac{S_1^2}{n_1}\right)^2+\tfrac1{n_2-1}\left(\tfrac{S_2^2}{n_2}\right)^2}$$

c30b3c170f1271d4b2c502ecd8b02cce80d3ba67: $$\begin{array}{l|l|l} \textbf{Caso} & \textbf{Supuestos} & \textbf{IC de nivel }1-\alpha\\ \hline \text{A} & \text{normal, }\sigma\text{ conocida} & \bar X\pm z_{\alpha/2}\dfrac{\sigma}{\sqrt n}\\[2mm] \text{B} & \text{normal, }\sigma\text{ desconocida} & \bar X\pm t_{\alpha/2,n-1}\dfrac{S}{\sqrt n}\\[2mm] \text{D1 (TCL)} & n\ge30,\ \sigma\text{ conocida} & \bar X\pm z_{\alpha/2}\dfrac{\sigma}{\sqrt n}\\[2mm] \text{D2 (Slutsky)} & n\ge40,\ \sigma\text{ desconocida} & \bar X\pm z_{\alpha/2}\dfrac{S_{n-1}}{\sqrt n} \end{array}$$

22aa46436093329469a02c7394db26df1618a388: $$L=2z_{\alpha/2}\frac{\sigma}{\sqrt n}\qquad n\ge\left(\frac{2z_{\alpha/2}\sigma}{L_0}\right)^{2}\ \ \text{(longitud}\le L_0\text{)}$$

d7857ced661bfd46e6fcc807c9c192adcb89609c: $$\sigma^2\in\left[\frac{(n-1)S^2}{\chi^2_{\alpha/2,n-1}},\ \frac{(n-1)S^2}{\chi^2_{1-\alpha/2,n-1}}\right]\qquad\text{(normal, }\mu\text{ desconocida)}$$

983483491c761086e37c0f857f00d48a120dd42e: $$\hat p\pm z_{\alpha/2}\sqrt{\frac{\hat p(1-\hat p)}{n}}\qquad(n\hat p\ge10,\ n(1-\hat p)\ge10)\qquad n\ge\left(\frac{z_{\alpha/2}}{L}\right)^2=\frac{z_{\alpha/2}^2}{4E^2}$$

427f001020d875b773362e67b4a3202a41b4d134: $$\text{Wilson (exacto): }\frac{\hat p+\dfrac{z_{\alpha/2}^2}{2n}\pm z_{\alpha/2}\sqrt{\dfrac{\hat p(1-\hat p)}{n}+\dfrac{z_{\alpha/2}^2}{4n^2}}}{1+\dfrac{z_{\alpha/2}^2}{n}}$$

f9923d929dd51b62dece877aeb761577f7b5f9f9: $$\bar D\pm t_{\alpha/2,n-1}\frac{S_D}{\sqrt n}\qquad\text{(apareadas)}$$

f6aa0f15c60ad9f9b2ada58c196be54d7ef94d7f: $$\begin{array}{l|l} \textbf{Caso} & \textbf{IC de nivel }1-\alpha\text{ para }\mu_1-\mu_2\\ \hline \text{A (}\sigma_1,\sigma_2\text{ conocidas)} & (\bar X-\bar Y)\pm z_{\alpha/2}\sqrt{\sigma_1^2/n_1+\sigma_2^2/n_2}\\[2mm] \text{B (}\sigma_1=\sigma_2\text{ desc.)} & (\bar X-\bar Y)\pm t_{\alpha/2,n_1+n_2-2}\,S_p\sqrt{1/n_1+1/n_2}\\[2mm] \text{C, Welch (}\sigma_1\ne\sigma_2\text{ desc.)} & (\bar X-\bar Y)\pm t_{\alpha/2,gl}\sqrt{S_1^2/n_1+S_2^2/n_2} \end{array}$$

afb47cf884b38d3aa9195d03cbf4578227712916: $$\mu_0\in IC_{1-\alpha}\iff\text{no se rechaza }H_0:\mu=\mu_0\text{ con el test BILATERAL de nivel }\alpha$$

dc2af1ea503278215d801374b62438aa92f07ea7: $$z_{0.10}=1.282\quad z_{0.05}=1.645\quad z_{0.025}=1.96\quad z_{0.01}=2.326\quad z_{0.005}=2.576$$

1208c725e19ffef50e20dffeba854685b6f55936: [[Pasted Image 20261019082240_326.png]]

65a375d7d2abdfce01e8db39a92ce3b68521e990: [[Pasted Image 20261019084111_880.png]]

e2ccfbca1cd0f3ab33ac4c8b16be0b3fc5a4df1a: [[Pasted Image 20261019085232_551.png]]

f29fc33c649b81c16b9ac63d57211f3f3dd86e49: [[Pasted Image 20261021101836_609.png]]

5daffde19ee8546c6dc423aff659e711a1520280: [[Pasted Image 20261023150431_070.png]]

3bd78089984dbefb1d8b9cfc6809ae2b6f8774a8: [[Pasted Image 20261023150454_869.png]]

aae824ba79141a4b9fbf818ad9ee6711fd1a0dec: [[Pasted Image 20261025190915_530.png]]

35bdf71f079c94d06567467f89cae67240b57315: [[Pasted Image 20261025190931_014.png]]

6957a7d7b8ba4163abb9b5f81705d8f7bbe3b851: [[Pasted Image 20261025195345_182.png]]

15e7d9ceb232e3746d5ae0b33010c57445f2f23a: [[Pasted Image 20261031130257_525.png]]

%%
## Drawing
```compressed-json
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

tFchR6V9xWfcaE+TXrwmS7V2ghaFTYmjpV44nH2XtWEJj7V/pkCwP7VgiZB1YKc9lph1QboHRWbJWLs0dWtwErVBNDx1YwAatVosRrVTsCp1VUl6dUBzHrVsKiKwIbVLcDG1SQpedUF1a6V0mXzDCXVNtXl1QfFldWO1bt56umwia7Vy2Xu1c3VASUd1ZXVvtWd1bKA3dWcSCHVMAD91evAg9XPRSWlkcUEGSbhIzk15Tm5YZUw4PgApAC2QAVmE

JSQ5c2lxjkplVphg7A/lfphE/CFHqYoeX4XvMgMe8mfTuBV5lVqRS45+5mxNoeZ7WX4eTFJmiWExg6G5MJEIWhVI+poWu5gbHh8FVfpa4VPmYAmVumvMITpzTGR9Aw1YSBMNTZZUnasNeCMz9kcNbxVyWUOMXjJxElsJcJVYznShQlshAAtAETOUWIGQEtu5gVQNQVYrLnkpSyWjBnRENpm1zHvTgjFHNVIxepF2HlyWeOFUEVqJZ9JkkkX4QAYD

SkfVYEOy1h40YUVz1bDVQ+lm6VtPhTOb1YY2FliP9njRbU6S0SxXGD5FcDrRUTpA8VHZa9lezagQOrZIdrjGRrAr9lELFZY+IC+AGoYwCj+9nduRNja2LY1u2WbpVel+ugmwD3VfgimuS41O3ETqAwQjXEVwOBhUzHFQG0ZucCx9GUg+lic2J8CihU7ZVNl9jXOZSRcLGhVsXPZbjVxgB41quXeNbg5AzF+NZoVUhXvZUE1s3GEHmva9xkbRdA5p

LESWFE19XEYYUvFVqrxNZcMUcBJNbU1u6VoAGk1qBDB1ZWxiVR1cTk1JIB5NaDxBTU0YY5ZeTAmwKU1e8wVNSRcvJU+UIYVdTXQgI41jTUbNc01ECnuNaZEnjWDMT41zTHdNS9lDdXSFf01+XEhNcM14TVaLJE10TX0VboYcTWAYGNFiTWXNUs1CjLpNU/V6zVbca41uTX5NWYV1lnFNf7AxzXlNaMJlwyY1exF2NXpZbjVf9VJ6U6lMOCaABqQC

QAUAKPAvhWhhfi+uZkplSbmh1WwNSVY/2nuBFSeBQo84d35hp7HYfSl2jVV6Q9VSRUKWaWyyQAiyW9+jeneDvlAWxCWkTcBO2K9aMkU1jUD6WQZUgA4fqHkEjUr0QSl1LUpibS1ueowNUo1qfpqpbSlWDGr6cy+unm1ley+GTGGpYD0yQDFyQ3pnZkfuQ0UcxDkZXvlmMr38pei5grYVd5VY2UA1bxFyPHQkMoACQBY3EIA4JSepRq1jwTCHNq19

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=
```
%%