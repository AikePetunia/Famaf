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

%%
## Drawing
```compressed-json
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=
```
%%