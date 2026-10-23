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

1208c725e19ffef50e20dffeba854685b6f55936: [[Pasted Image 20261019082240_326.png]]

65a375d7d2abdfce01e8db39a92ce3b68521e990: [[Pasted Image 20261019084111_880.png]]

e2ccfbca1cd0f3ab33ac4c8b16be0b3fc5a4df1a: [[Pasted Image 20261019085232_551.png]]

f29fc33c649b81c16b9ac63d57211f3f3dd86e49: [[Pasted Image 20261021101836_609.png]]

5daffde19ee8546c6dc423aff659e711a1520280: [[Pasted Image 20261023150431_070.png]]

3bd78089984dbefb1d8b9cfc6809ae2b6f8774a8: [[Pasted Image 20261023150454_869.png]]

%%
## Drawing
```compressed-json
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
```
%%