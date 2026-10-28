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

Regresión lineal simple (no viene de diapositivas) ^BS8bq4c7

TEORÍA ^zGn0yk27

Regresión lineal simple (sin diapositivas propias en el material) ^jLqKuo7C

EJEMPLO ^HEDsnUJt

Ejemplo con cuentas ^6vpp5q9k

x = 1,2,...,8;  y = 2.3, 4.1, 5.8, 8.4, 9.7, 12.5, 13.4, 16.2. Recta ajustada: ŷ ≈ -0.300 + 1.967x. ^pEGYdBd2

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

9217d7ef24ca1c6ebf9514ee29db2cf2b6bf9db8: $$Y_i=\beta_0+\beta_1x_i+\varepsilon_i,\quad \varepsilon_i\text{ iid }N(0,\sigma^2)$$

da078fd2858d18bf956cf3e752c37f1c6b56fd07: $$\hat\beta_1=\frac{S_{xy}}{S_{xx}}\qquad \hat\beta_0=\bar y-\hat\beta_1\bar x\qquad SSE=S_{yy}-\hat\beta_1S_{xy}\qquad s^2=\frac{SSE}{n-2}$$

23309dc2f1eb410a6e98e524ff263966b5134f36: $$R^2=1-\frac{SSE}{S_{yy}}=r^2\qquad \hat\beta_1\sim N\!\left(\beta_1,\frac{\sigma^2}{S_{xx}}\right)\qquad \frac{\hat\beta_1-\beta_1}{s/\sqrt{S_{xx}}}\sim t_{n-2}$$

c7ddcd120db5e57662ee40848d6f5b7973855c8e: $$\text{IC de }\beta_1:\ \hat\beta_1\pm t_{\alpha/2,n-2}\frac{s}{\sqrt{S_{xx}}}\qquad \text{test }H_0:\beta_1=0:\ T=\frac{\hat\beta_1}{s/\sqrt{S_{xx}}}\sim t_{n-2}$$

a8c86d3558551ba8a7fed4bfa24a3b3296676543: $$\text{IC de }E(Y|x^*):\hat y^*\pm t_{\alpha/2,n-2}s\sqrt{\tfrac1n+\tfrac{(x^*-\bar x)^2}{S_{xx}}}\qquad\text{predicción: }\hat y^*\pm t_{\alpha/2,n-2}s\sqrt{1+\tfrac1n+\tfrac{(x^*-\bar x)^2}{S_{xx}}}$$

864928c68d0e189778f663c6211fdacd48240d57: $$SSE\approx0.8735\qquad s^2\approx0.1456\qquad R^2\approx0.9940$$

cc7bbf96da6a838d4773322565e548adb01abf57: $$T=\frac{1.967}{0.0621}\approx31.64\gg t_{0.025,6}\approx2.447\Rightarrow\text{se rechaza }\beta_1=0$$

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

%%
## Drawing
```compressed-json
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

eneSsSUo/rWlczicVSg6ooVf/nMWYXlt6V5cANS96GJZckwKGFToR/8Qkov/Fhm6MS7OsMMs1yKIOuVk6Hxqgr57fG6pXuVSnnkIEU0x5WPoUV5Z5VG5TB5oFnKxf1FEjGUFUW5T8qEABbywRw4fn8JozjSAWfQmxGxBvmUQQw30CJRwBAGWaNoNpCylGBVxl7cpcGGyxo4ZCVRr9BvBlyhH+gNjBtFPzlX+dH5VLLSYR05JmnufnglnmX+iT5li

fLQVYzAcdSXLrQIRVLe5UoVDpURZU6VUWU+GugIzYA3lN3M7hAjWh2AwFBPglToujhKgEtkvYB0YJo0hyxiACIRwx4t+WyG7NL+rkRQga7BromuVFCsQNpFngjEBdqIDWmxrlRQguKxlbLQg/kkXKFQma54uIPl3YjD5eQAMa7JUH4mUyHlSKZVqBV5ZZWldrRERkKIzlCGVV6SqZVWVeAVH+Wy0H5sHdLpaUlQuYACebQmLyGTCCPSbdDSVfmVj

JEVAa1+pHHMOYzc0ZTCenhwaYrNMTWVzqVj6ryBJIULZeiiw/B3NP9MDB6cOrDJMIlNOU5lm0W9la5l/ZWkWYOV5FlctDOJPeHfBlkUcenjCYzK5y4seS/lWJDvEIQADfiU2HSAWyCsIAiAWxKbVC1VbVW9Ot8AsPrXAY6UHfF9VWVFg1VbMN1Vj5WKxSalenlQKRNZmTmbJUOlx6QGYLxpJIAwAJ5QEkl1gUwV4pU5mOxqqVXqhVhan0xD4JPow

Ay4WjBOLnlEKW55pjFjMW05O2XIiXtl+0XshUhe2eLyPN/utaYhnkCl05BgvGJI8Ln55SoVUDGaBQxks6j/wNRAGoCZmrwmjAAs5Ufk26goBAnAYYDlxRdQxRGKwB4MisAF+HBo+RUEBRwmSkRnFX4S7OxOwNOoUcDwsRcVqkSlFTlxpj4lzpcx8JUGJXgVdkSnRKVlsNj8ymTVapn4aRl5RID+wL0A5LAuFXuAQyUPDCcVZiXoACDVGsBg1RDVV

iZQ1drlMNUXKQVQCNW2JaMiIOgufBx+6NUtwJjVj8kWPoQAICDsGYUVL0B7GYTVgtHUlZcVdJVkLKjOsxnU1WkltNX0xPTV0faM1ZQmVxUs1QLAbNWSJpzV6py1erzVQCz81TklQtWtwODVhNBi1bDlktVw1U7AMtVzxcPAyNUK1WjVAfgY1cNc2LimJjjV0QWCxjrVRNX61aTVVxXSEsbVVNX06VMl5tWmwKSVauJW1a0lzNXUmfbVsoCO1axI3

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
```
%%