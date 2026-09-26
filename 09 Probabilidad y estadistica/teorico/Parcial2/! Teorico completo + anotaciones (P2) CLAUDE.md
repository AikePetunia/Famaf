---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
Probabilidad y Estadística: Parcial 2 ^d0N9BkHh

Apunte completo: estimación puntual, intervalos de confianza, tests de hipótesis, dos poblaciones y regresión lineal
Fuentes: clases de octubre (Flesia), guías 5-8, parciales 2021-2025, cronograma 2026 y Devore.  Colores: azul = teoría, naranja = anotaciones, violeta = ejemplos. ^4I0vc3Th

Mapa del Parcial 2 ^Melavg0Y

TEORÍA ^jtnzdZ2h

Qué entra (clases XV a XXI del programa 2026) ^yNvbk7kM

Prácticos que cubren esto: Guía 5 (estimación puntual), 6 (IC), 7 (tests de una muestra), 8 (dos muestras).
Tipos de ejercicio que se repiten en los parciales viejos: estimador insesgado / de momentos / de MV,
IC de la media (z o t) y de la varianza, problema inverso a partir de un IC, tests con potencia y tamaño de muestra. ^er1wwUO7

TEORÍA ^frThGSRv

Flujo de decisión: ¿qué IC o test uso? ^K0kMffpM

ANOTACIONES ^hACNlGTa

Anotaciones: notación de valores críticos ^bVT6eDPP

En la materia (cola derecha = α) ^NPJuF7wF

Para un IC bilateral de nivel 1-α se usa α/2 en cada cola:  z_{α/2},  t_{α/2,n-1},  χ²_{α/2,n-1} y χ²_{1-α/2,n-1}.
A veces las diapositivas escriben z_{(1-α)} para el percentil 1-α: es el mismo número que z_α. ^WOWCVO98

Valores que hay que saber de memoria ^Xxv6L9HR

Nivel 90 % → 1.645;  95 % → 1.96;  99 % → 2.576 (IC bilaterales).  Test unilateral al 5 % → 1.645;  al 1 % → 2.326. ^t4fDalPF

Simetrías ^F96UL0j6

Estimación puntual: conceptos y propiedades ^GFaM84Pq

TEORÍA ^tehmdCsO

Población, modelo paramétrico, muestra, estimador ^8ayKA5kH

Modelo de una población ^vCYmmcVG

Una población queda definida por una o varias variables aleatorias y su distribución conjunta.
X = atributo medido sobre un individuo elegido al azar → X es una variable aleatoria con densidad p(x). ^ys2uTwKK

Modelo paramétrico ^DsIlorzo

La forma de p(x) se supone conocida; lo único desconocido son los parámetros. ^qMXUKLdg

Muestra y muestra aleatoria ^v3YEMC7f

Muestra: x_1, ..., x_n (números observados, minúsculas).
Muestra aleatoria: X_1, ..., X_n variables aleatorias independientes e idénticamente distribuidas (iid), mayúsculas. ^whfCKnAB

Estimador vs estimación ^nLZGoUVe

Ej.: tapitas de gaseosa: el estimador de μ es X̄₁₀ (aleatorio); la estimación es x̄ = 2.98 (un número). ^QhG3z1Dq

Media y varianza muestral ^CKTxJwk9

S² divide por n-1 (insesgado); Σ² divide por n (sesgado, pero es el estimador de MV). ^sPaJA4P0

TEORÍA ^W3CUwYTr

Sesgo, varianza, ECM, eficiencia, error estándar ^137ZzTeO

Sesgo ^yaom2P9l

Error cuadrático medio (ECM) ^1n176RJh

Si es insesgado: ECM = V(θ̂).  Entre estimadores se prefiere el de menor ECM;
entre insesgados, el de menor varianza (el "mejor" insesgado). ^kzMvT5tL

Eficiencia relativa de θ̂₁ respecto de θ̂₂ ^xI2skhZ8

Error estándar ^aEdbhXgW

Se reporta  θ̂_obs ± error estándar.  Da idea de la precisión, pero NO da confianza (para eso: intervalo de confianza). ^krT4FLOt

Exactitud y precisión ^s84Dv6x3

Exactitud ↔ sesgo (¿el reloj está en hora?).   Precisión ↔ varianza (¿marca los segundos o solo minutos?).
Buen estimador: sesgo nulo, consistente y varianza mínima dentro de los insesgados. ^0ZnJk6FF

TEORÍA ^GVt3dTGD

Propiedades de X̄ y S²: demostraciones ^ksWWmTC0

Proposición (X_i con E(X_i)=μ y V(X_i)=σ²) ^F0Qaalf0

Por qué Σ² es sesgado (n en lugar de n-1) ^oFT4p58i

Herramientas usadas: E(X²)=μ²+σ²,  E(X̄²)=μ²+σ²/n,  E(X_iX_j)=μ² si i≠j (independencia). ^HhAQdZzx

Ejemplos de estimadores insesgados (aplicando la proposición) ^PLnQLaKc

Cuidado: la raíz y el cuadrado rompen el insesgamiento ^GtQjDY7n

En general E[g(θ̂)] ≠ g(E[θ̂]).  Ej. de la guía 5 (ej. 4): X̄² − k S² es insesgado para μ² con k = 1/n. ^sjShPj5f

TEORÍA ^i7CjMW2L

Consistencia ^foxUIt1g

Definición ^VhIW20TX

Criterio (Chebyshev) ^XDF0pj8q

ECM → 0  ⇔  (sesgo → 0  y  varianza → 0).  Es una condición SUFICIENTE, no necesaria. ^Lee7rFQh

La media muestral es consistente ^YjYhVwB4

Consistencia y continuidad ^LyVMQzhl

S² y Σ² son consistentes para σ² ^KWQcGdNU

Insesgado ≠ consistente y sesgado ≠ inconsistente ^5z4w6RyD

X_1 (primer dato) es insesgado para μ pero NO consistente (su varianza no baja con n).
X̄/(1+1/n) es sesgado pero consistente. ^kx7jcYVj

ANOTACIONES ^TpbCTJun

Anotaciones: cómo se resuelven los ejercicios de estimación ^ELbRltGw

Receta para "¿es insesgado?" ^sJRXTSVR

1) Calcular E(θ̂) usando linealidad (o la densidad del estimador si es un máximo o un mínimo).
2) Compararlo con θ.  3) Si no da θ, el sesgo es E(θ̂) - θ.
4) Buscar una constante que corrija:  θ̂* = θ̂ / (factor). ^ekQOz0I3

Receta para "¿cuál es mejor?" ^px20jm4G

Calcular ECM = Var + sesgo² de cada uno y comparar (o la eficiencia relativa).  Si los dos son insesgados,
basta comparar varianzas. ^EL4qVGYB

Para probar consistencia ^3aneWwJb

Calcular sesgo y varianza, ver que ambos → 0 con n → ∞ (ECM → 0), o aplicar LGN + continuidad. ^p95w9rl0

Varianzas útiles que aparecen siempre ^k09VJ93l

Ejemplo de la guía 5 (ej. 1): tres estimadores de λ en Poisson ^g0IaRajW

EJEMPLO ^qL00fCPw

Ejemplo: X_1..X_n iid U[0, θ] (dos estimadores de θ) ^FOodJign

Estimador 1: 2X̄ ^0BJGukMU

Estimador 2: el máximo M = max(X_i) ^2F3fJy1a

Corrección: multiplicar por (n+1)/n ^DMlvTd5Y

Comparación por ECM ^LMnRROGh

Con n = 10:  ECM(2X̄) = θ²/30 = 0.0333θ²;  ECM(M) = 0.0152θ²;  ECM(θ̂*) = θ²/120 = 0.0083θ².
El máximo corregido gana por mucho: la varianza baja como 1/n² en vez de 1/n. ^XTeC8uvA

Los tres estimadores son consistentes (ECM → 0), aunque M es sesgado. ^W4JGZihY

EJEMPLO ^n2sRb7rN

Ejemplos tipo parcial: estimador insesgado a partir de X̄ ^9uTzCieJ

Densidad f(y) = (δy + 1)/2 en [-1, 1],  δ ∈ [-1, 1]  (Parcial 2024, ej. 2; Guía 5, ej. 5) ^tT781Bp7

Ejemplo: X̄ contra una sola observación (eficiencia relativa) ^G4naNz0y

Guía 5, ej. 3: diferencia de proporciones ^2ZhVzjsW

Con n₁ = n₂ = 200, x₁ = 127, x₂ = 176:  p̂₁ - p̂₂ = -0.245;  error estándar estimado = 0.0411. ^zHLJbjQF

Métodos de estimación: momentos y máxima verosimilitud ^h3D7ieCm

TEORÍA ^zXBQvNQT

Método de los momentos ^dLdbDKuA

Momentos poblacionales y muestrales ^fYsSkuEM

Método ^PXld51AJ

Si hay k parámetros: igualar los primeros k momentos poblacionales a los muestrales y despejar los parámetros. ^9kIo6HX0

Lo típico ^10fSN6Hd

Un parámetro → 1 ecuación:  E(X) = X̄.    Dos parámetros → E(X) = X̄  y  E(X²) = (1/n) Σ X_i²  (o V(X) = Σ²). ^l597q1hV

Estimadores de momentos conocidos ^ivUghgrp

Ventaja: fácil de calcular.  Desventaja: a veces no es el mejor (ej.: U(0,θ): 2X̄ es peor que el máximo). ^s8wALFRx

EJEMPLO ^wzSibuiI

Ejemplos de momentos ^93TwXSG8

Ejemplo de la clase: p(x; θ) = (θ+1) x^θ en [0, 1]  (Guía 5, ej. 6) ^lQXPun7P

Datos de la guía (n = 10):  x̄ = 0.799  →  θ̂ = (1 - 2·0.799) / (0.799 - 1) = 2.975. ^fQAcYKmX

Pareto con parámetro β  (Parcial 2024, ej. 3):  μ = β/(β - 1) ^SyQDW8Yz

Dos parámetros: N(μ, σ²) ^oQGFun1H

Guía 5, ej. 7 (espesor de pintura, n = 16, normal) ^WJlrPVR1

x̄ = 1.3481 es la estimación de μ por momentos (y por MV).  Error estándar estimado = s/√n = 0.0846. ^wefDnJFC

TEORÍA ^STgJwBUN

Estimación de máxima verosimilitud (MV) ^AovZAruj

Función de verosimilitud (datos fijos, parámetro variable) ^zN0dLtwr

El estimador de MV es el valor que maximiza L (o ℓ) ^BMgmEkOP

Receta (caso derivable) ^n3TChp6h

1) Escribir L(θ) = producto de las densidades (o funciones de probabilidad) evaluadas en la muestra.
2) Tomar logaritmo: ℓ(θ) = suma de ln p.   3) Derivar respecto de θ e igualar a 0:  ℓ'(θ) = 0.
4) Despejar θ̂.   5) Verificar máximo:  ℓ''(θ̂) < 0.   Con varios parámetros: gradiente = 0. ^wA37rRLs

Caso NO derivable: el dominio depende de θ ^qK7g9flc

Ej.: U(0,θ): L(θ) = 1/θⁿ si θ > max(X_i), 0 si no.  L decrece en θ → el máximo se alcanza en el
borde: θ̂ = max(X_i).  No se puede derivar; se razona con el gráfico de L. ^7diiKg37

Principio de invarianza ^1KGqwloF

Sirve para estimar probabilidades, percentiles, medianas, etc., "enchufando" θ̂ en la fórmula. ^LsXIP2U7

TEORÍA ^WZT7Ts6W

Tabla de estimadores de MV ^9AjahFN6

Observaciones ^kDLoXvWa

Con Bernoulli, Poisson y exponencial, el de MV coincide con el de momentos.  Con la normal, σ̂²_MV = Σ² es sesgado
(pero asintóticamente insesgado); el insesgado es S².  Con U(0,θ) coinciden NO: MV = máximo, momentos = 2X̄. ^Sp602MrW

EJEMPLO ^RzuxPtnY

Ejemplos de MV (con cuentas) ^TFYBsHlh

Bernoulli (clase) ^rX9Eu8hL

Exponencial: Parcial 2025, ej. 1 y Guía 5, ej. 8 (n = 10) ^arwpMsaY

Datos: Σx = 55.80, x̄ = 5.580  →  λ̂ = 0.1792.
Por invarianza:  P(X ≤ 5) = 1 - e^(-5λ) se estima con  1 - e^(-5·0.1792) = 0.5918. ^vmOOPiNf

Poisson: Guía 5, ej. 1 (150 piezas, número de imperfecciones) ^vdUE2uNw

Σ x_i = 0·18 + 1·37 + 2·42 + ... = 317;  λ̂ = x̄ = 317/150 = 2.1133.  Error estándar estimado = √(λ̂/n) = 0.1187. ^wYBHihf1

Normal: Guía 5, ej. 7 y 9 (invarianza) ^SXW7SdEL

Espesores (n = 16): μ̂ = 1.3481, σ̂_MV = 0.3278 (divide por n).  Percentil 90 estimado = 1.768;  P(X<1.5) estimada = 0.6784. ^BzILhM0f

Densidad (θ+1)x^θ (comparar con el método de momentos) ^9rRLtGpp

TEORÍA ^JMRkzOOi

Propiedades del estimador de máxima verosimilitud ^VqtrYTxF

Propiedades asintóticas (condiciones de regularidad, n → ∞) ^agBleS0X

1) Consistente:  θ̂_MV → θ en probabilidad.
2) Asintóticamente insesgado:  E(θ̂_MV) → θ.
3) Asintóticamente normal.
4) Asintóticamente eficiente: alcanza la mínima varianza posible (cota de Cramér-Rao). ^LiaYkou2

I(θ) = información de Fisher de una observación.  Más información → menor varianza asintótica. ^fvpT2HK6

Ejemplos ^UGvILF2I

Invarianza y método delta ^VjyNq79G

Además de los asintóticos, con muestras chicas el MV puede ser sesgado (ej.: Σ² en la normal). ^jNGF96JI

Distribuciones muestrales bajo normalidad (base de los IC y tests) ^KDGBRYZ0

TEORÍA ^Kc1mMHIm

Resultados para X_1..X_n iid N(μ, σ²) ^PX7W6WWR

Los cuatro resultados que se usan siempre ^tv4NJn5V

Definición de la t de Student ^ZcgBRZG4

Propiedades ^0Alo0bZu

La t es simétrica y centrada en 0, con colas más pesadas que la normal (más variabilidad porque se estima σ).
Para ν ≥ 30 es casi igual a la normal.  Con ν chico, el valor crítico t es bastante mayor que z.
La χ² solo toma valores positivos y es asimétrica a la derecha;  E(χ²_ν) = ν,  V(χ²_ν) = 2ν. ^OYTT9xR4

Relación con Gamma ^TfN0qssq

ANOTACIONES ^3jnWzYGO

Anotaciones: cómo leer las tablas ^kgJbixjD

Tabla normal (Φ) ^97GF9Mod

Da Φ(z) = P(Z ≤ z).  Para z_{α/2} se busca 1 - α/2 en el cuerpo de la tabla y se lee el z.
Ej.: nivel 95 % → 1 - 0.025 = 0.975 → z = 1.96.   Nivel 99.7 % → 1 - 0.0015 = 0.9985 → z = 2.97. ^baGA20Nd

Tabla t de Student (fila = grados de libertad, columna = cola derecha α) ^a07h31Dn

Tabla χ² (fila = grados de libertad, columna = cola derecha α) ^OxVGqh0P

OJO con los nombres: χ²_{0.025,15} = 27.488 es el valor con 2.5 % de área a la DERECHA;
χ²_{0.975,15} = 6.262 es el que deja 97.5 % a la derecha (2.5 % a la izquierda). ^iXCgmiH7

Si los grados de libertad no están en la tabla ^jArSjYvy

Usar el valor más cercano (mejor el menor, más conservador) o interpolar.  Para ν grande, t ≈ z. ^IAKAYjAy

Intervalos de confianza (IC) ^qfBjzwDO

TEORÍA ^6polPGDN

Definición, interpretación y método del pivote ^DEs7xAbQ

Estimador por intervalo ^v9dphKQY

L y R son variables aleatorias (funciones de la muestra).  Con los datos observados se obtiene el intervalo observado [l, r]. ^HqRrq0g6

Método del pivote ^4x7v16LQ

1) Buscar h(X_1,...,X_n; θ) con distribución conocida que NO dependa de θ (pivote).
2) Hallar a y b tales que  P(a ≤ h ≤ b) = 1 - α  (con tablas).
3) Despejar θ en  a ≤ h ≤ b  para obtener  L ≤ θ ≤ R. ^cVmIAN6I

Interpretación correcta ^OAUGBeNS

El NIVEL 1-α es propiedad del MÉTODO, no de un intervalo ya calculado.  Si se construyen 100 intervalos con muestras
independientes, se espera que ≈ 100·α de ellos NO contengan a θ.  Un intervalo observado contiene a θ o no:
no se puede decir "la probabilidad de que μ esté en [7.69, 10.31] es 0.95".  Se dice "tenemos 95 % de confianza". ^g9dyFGH7

Confiabilidad vs precisión ^oGcnjAOJ

Confiabilidad = nivel 1-α (habitual: 0.90, 0.95, 0.99).   Precisión = longitud del IC (menor longitud = mayor precisión).
Se quiere longitud chica y nivel alto, pero para n fijo son objetivos opuestos. ^uxNA8Qhp

TEORÍA ^ssWYxykZ

IC para la media μ: los cuatro casos ^mLIqLasS

Reglas para elegir ^V3qA9k4O

· Población normal y σ conocida → z (vale para cualquier n).
· Población normal y σ desconocida → t con n-1 grados de libertad (obligatorio si n < 30-40).
· Población no normal: solo con n grande (TCL); ahí se usa z aunque σ se estime con S (Slutsky, n ≥ 40).
· Con t se obtiene siempre un intervalo más ancho que con z (mismo x̄, s = σ). ^RW4QKTQU

Longitud, error de estimación y tamaño de muestra (caso A) ^Mfvj3vBl

Siempre se redondea n hacia ARRIBA.  Si σ es desconocida se usa una estimación previa de σ (o de s).
La longitud crece con σ y con el nivel; decrece como 1/√n (para dividir L por 2 hay que multiplicar n por 4). ^axjQylV2

El IC simétrico es el de menor longitud entre los que salen del mismo pivote. ^aS4W0Ktx

TEORÍA ^44RxWV5e

IC para σ², σ y p ^GKRm0L3v

Varianza y desvío (normal, μ desconocida) ^BLVHSXNr

Para σ se saca la raíz cuadrada de los dos extremos.  El intervalo NO es simétrico alrededor de s².
El extremo inferior usa el χ² grande (cola derecha α/2) y el superior el χ² chico (cola derecha 1-α/2). ^WTKi3tK5

Proporción p (muestra Bernoulli grande) ^mXQTIQ3i

IC de Wilson (no descarta términos; más exacto) ^o8yLbjUm

Sale de resolver la desigualdad  |p̂ - p| ≤ z √(p(1-p)/n)  como cuadrática en p.  Para n grande los términos z²/n se
descartan y queda el IC simple. ^ncAds6Hp

Tamaño de muestra para p con longitud a lo sumo L (independiente de p̂) ^sKjo5w6U

Casos especiales (guía 6, ej. 9): U[0, θ] ^NcMvooXe

ANOTACIONES ^Asblx1AS

Anotaciones: efecto de cada cosa y problemas inversos ^OeQy8UND

Qué le pasa al IC si cambio... ^mxYVJrbI

· más nivel de confianza  →  z_{α/2} (o t) más grande  →  intervalo más ancho.
· más n  →  intervalo más angosto (como 1/√n).
· más variabilidad (σ o s)  →  más ancho.   · t en lugar de z  →  más ancho.
· Los dos IC (90 % y 99 %) del mismo estimador están centrados en el mismo x̄. ^Z1D2ERRS

Problema inverso (dado un IC, recuperar datos) ^lrfMOZLe

Parcial 2025, ej. 2 y guía 6, ej. 7: IC 95 % = (229.764; 233.504), n = 5, σ desconocida ^VaPm5I3k

x̄ = 231.634;  margen = 1.870 = t_{0.025,4}·s/√5 = 2.776·s/√5  →  s = 1.506.
Para el 99 %:  t_{0.005,4} = 4.604  →  margen = 3.101  →  IC 99 % = (228.533; 234.735).
El IC del 99 % es MÁS ANCHO que el del 95 % (más confianza, menos precisión). ^SzUANGA3

Errores típicos ^DwxO8pfZ

· Usar z cuando σ es desconocida y n es chico (corresponde t).   · Usar n en lugar de n-1 en la t o en la χ².
· Confundir σ² con σ (en el IC de σ² no se saca raíz; en el de σ sí).   · Redondear n hacia abajo.
· Decir "hay 95 % de probabilidad de que μ esté en el intervalo observado". ^KWpuiAsB

EJEMPLO ^Es6H4aOu

Ejemplos de IC para la media ^b7Urrfkt

Señal con ruido (clase): X ~ N(μ, 4), n = 9, datos 5, 8.5, 12, 15, 7, 9, 7.5, 6.5, 10.5:  x̄ = 9 ^87ODU349

El de la t es más largo, aun si s fuera 2 ([7.46; 10.54]): la t paga por no conocer σ. ^ETNEaPvJ

Salmones (clase): σ = 0.3 lb, error de ±0.1 lb con 95 % ^sNzGtfMy

Báscula (clase y guía 6, ej. 2): σ = 0.20 kg, n = 25 ^MF41CS7D

Resistencia a la fractura del acero (clase): n = 22, x̄ = 76.88, s = 3.784, 99 % ^RYroDgc8

Eco de radar (clase, n grande): n = 110, x̄ = 0.81, s = 0.34, 99 % ^S3J60vst

EJEMPLO ^sJhMQgzh

Ejemplos: varianza, proporción y guía 6 ^lFPuA8kL

Matrices de silicio (clase): 201 de 356 pasaron. IC ≈ 98 % para p ^Ymk3NlcH

Guía 6, ej. 6 (triatlón): x̄ = 188, s = 7.2. n = 40 (normal, 98 %) y n = 9 (95 %) ^Y4vsgeao

Con n = 9 el intervalo de σ² es enorme: con pocos datos la varianza se estima muy mal. ^Mqy24bQn

Guía 6, ej. 8 (tiempo de reacción): n = 16, x̄ = 0.214, s = 0.036, 90 % ^bPtaPdIs

Tests de hipótesis (una muestra) ^FnzcLUam

TEORÍA ^VPUYPlyr

Lógica del test, ingredientes y receta ^94ObUzs2

Idea (paradigma de Neyman-Pearson) ^pewdEi0c

H₀ (hipótesis nula) = "no hay efecto", lo que pasa por azar; es el supuesto por defecto y solo se rechaza con evidencia fuerte.
H_A (alternativa) = "hay efecto"; es lo que queremos demostrar (la sospecha del investigador).
Para validar H_A hay que probar falsa a H₀ ("convencer al escéptico").  Se supone que ocurre lo más probable. ^wExeVliM

Ingredientes ^YKKjepPE

H₀ y H_A expresadas con un parámetro (H₀: θ = θ₀).  Estadístico de prueba: se calcula con los datos y tiene distribución
conocida BAJO H₀ (distribución nula).  Región de rechazo (RR): valores del estadístico que llevan a rechazar H₀.
Región de no rechazo: el complemento. ^Qfiu94AE

Alternativas posibles ^Y09UYuWI

Receta de 6 pasos ^n2Bpt3uX

1) Definir el parámetro y plantear H₀ y H_A (la tesis a demostrar va en H_A; la de "no cambio" en H₀ con signo =).
2) Fijar el nivel de significación α.   3) Elegir el estadístico y su distribución bajo H₀ (según el caso).
4) Determinar la región de rechazo.   5) Calcular el valor observado del estadístico (y/o el p-valor).
6) Decidir y concluir EN EL CONTEXTO del problema ("hay/no hay evidencia suficiente para afirmar que..."). ^7EnGgP5g

No rechazar H₀ no prueba que H₀ sea cierta ^uPFvBebh

Solo significa que no hay evidencia suficiente contra ella (con esa muestra y ese α). ^B0by9niH

TEORÍA ^0ropmQFB

Nivel, p-valor, errores y potencia ^Z69ALMDf

Nivel de significación y p-valor ^0eV8urea

Regla:  p-valor ≤ α  →  rechazar H₀ (resultado estadísticamente significativo);  p-valor > α  →  no rechazar.
El p-valor es el MENOR nivel α al que se rechazaría H₀ con esos datos.  Más chico = más evidencia contra H₀. ^BP4SlyOR

Errores ^30R0VOQy

β se calcula para una alternativa puntual θ' concreta (por eso es una función β(θ')).
Para n fijo, bajar α sube β (y baja la potencia); para bajar los dos hay que aumentar n.
A igual α, el test de mayor potencia es el mejor. ^bxSoih75

TEORÍA ^pnb99CtQ

Test para la media: estadístico, RR y potencia ^3rtqthnf

H₀: μ = μ₀.   Estadístico y RR según el caso ^ElNX0Ar3

Tamaño de muestra para tener β(μ') ≤ β₀ con nivel α (caso A) ^tYADKILD

En el caso C no hay fórmula sencilla para β (aparece una t no central), tampoco para n.
En el caso B, β se calcula como en A reemplazando σ por s (aproximado). ^lcPiBODI

La RR en términos de x̄ (ej. cola izquierda):  x̄ ≤ μ₀ - z_α σ/√n.  Se puede decidir con x̄, con z o con el p-valor: es lo mismo. ^j64b5oTU

TEORÍA ^f2D0Y1nb

Test para σ² y para la proporción p ^kb9h4oWv

Test para la varianza (normal) ^6B8JhT36

Test para la proporción, muestra grande (n p₀ ≥ 10 y n(1-p₀) ≥ 10) ^pdvaXayt

Ojo: en el estadístico del test se usa p₀ (el valor de H₀) en el denominador; en el IC se usa p̂. ^0YwpV0pz

Muestra chica: test exacto con la binomial ^6YwwJagB

Alternativa p > p₀ → RR = {x ≥ c};  p < p₀ → RR = {x ≤ c};  bilateral → dos colas.  Se elige c con tabla binomial
(el nivel real queda ≤ α por ser discreta).  p-valor: p > p₀ → P(X ≥ x_obs | p₀). ^UDbqdv7s

TEORÍA ^ddaNnH1E

p-valor por caso y dualidad IC ↔ test bilateral ^jtIQBi2d

Cómo calcular el p-valor ^I2Hn3HU5

Con la tabla t solo se puede ACOTAR el p-valor (ej.: "0.01 < p < 0.025"). ^xbZMo9ji

Dualidad entre IC y test bilateral ^fniMJuhm

Los valores "creíbles" de μ₀ son exactamente los que pertenecen al IC de nivel 1-α: si μ₀ ∉ IC se rechaza H₀ al nivel α;
si μ₀ ∈ IC no se rechaza.  Vale igual con t, y para σ² con el IC de χ².  Solo para tests BILATERALES. ^pyQ0cM3W

ANOTACIONES ^q9uhnn3F

Anotaciones: cómo plantear H₀ y H_A y errores típicos ^iGxqnjpp

Cómo plantear las hipótesis ^yuC36Tvj

· "Al menos 12 km/l" (afirmación del fabricante) y queremos desacreditarla: H₀: μ = 12  vs  H_A: μ < 12.
· "¿Contradicen los datos que sea a lo sumo 6 minutos?": H₀: μ = 6  vs  H_A: μ > 6.
· "Difiere de lo establecido / no cumple" → bilateral.   · "Aumentó / mejoró / es mayor" → cola superior.   · "Bajó" → cola inferior.
· La alternativa es lo que el problema quiere PROBAR; la igualdad siempre va en H₀. ^1VDVg00j

Al concluir ^sfCj5B3k

Decir siempre el nivel y el contexto:  "Con nivel 0.05 hay evidencia suficiente para afirmar que el tiempo de vida medio es menor a 750 h".
Si el p-valor es 0.016: rechazo con α = 0.05, no rechazo con α = 0.01. ^XUQggoqA

Supuestos que hay que mencionar ^9OmJu32y

Test t: muestra aleatoria, independencia, distribución NORMAL (sobre todo si n < 30).   Test z con n grande: TCL.
Test para σ²: normalidad (es muy sensible a que no se cumpla). ^AQjy9v8m

Errores típicos ^JSXKiAuv

· Poner la tesis a probar en H₀.   · Usar α/2 en test unilateral (o α en bilateral).   · Usar σ cuando hay que usar s (y al revés).
· Confundir α con β, o con el p-valor.   · Olvidar el signo: para cola izquierda la RR es z ≤ -z_α.
· Decir "se acepta H₀": lo correcto es "no se rechaza". ^n6Z65q27

EJEMPLO ^nlVhSudT

Ejemplos de tests (de la clase) ^q7eumExZ

Leche aguada: H₀: μ = -0.545 vs H_A: μ > -0.545, σ = 0.008, n = 5, x̄ = -0.538 ^cqJ3mwTq

Autos (caso A): rendimiento ≥ 12 km/l, σ = 2, n = 30, α = 0.02;  H₀: μ = 12 vs H_A: μ < 12 ^bZiJQvF7

Vigas (caso A bilateral): μ₀ = 5 m, σ = 0.02, n = 16, α = 0.04 ^yA9S0Zsl

Con los extremos redondeados (4.99 y 5.01) la clase obtiene 0.97725; ambos dicen "potencia muy alta". ^FMukHLnO

Focos (caso B): H₀: μ = 750 vs H_A: μ < 750, n = 50, x̄ = 738.44, s = 38.20 ^QdUbvKr5

EJEMPLO ^F7BWlFoz

Ejemplos de tests: t, varianza y proporción ^6Y5hrBzm

Aceite (caso C, clase): μ₀ = 95, n = 16, x̄ = 94.32, s = 1.20, α = 0.05, bilateral ^sqsriLbt

Silicio en hierro (clase): 15 datos, H₀: μ = 0.85 vs H_A: μ ≠ 0.85, α = 0.05 ^znvJ0nzD

Varianza (clase): H₀: σ² = 4 vs H_A: σ² ≠ 4, n = 16, s² = 6.1, α = 0.05 ^aQFoHOQ7

Proporción, n grande (clase): H₀: p = 0.70 vs H_A: p > 0.70, n = 200, 156 éxitos, α = 0.02 ^PGRPSsni

Proporción, n chico (clase): X ~ Bin(25, p), H₀: p = 0.5 vs H_A: p > 0.5, RR = {x ≥ 18} ^7QW9zJgz

x_obs = 20 ≥ 18 → se rechaza H₀.  RR₁ (dos colas) y RR₂ (cola izquierda) no sirven: H_A es p > 0.5, la RR va del lado de los valores altos. ^BqMsDoQ7

Dos poblaciones: muestras apareadas ^moFcvHk7

TEORÍA ^PtHtIlPm

Muestras apareadas (una sola muestra de diferencias) ^Mpl01YhG

Cuándo son apareadas ^hhXSf7S8

Los datos vienen en pares (X_i, Y_i) relacionados: mismo sujeto antes y después, gemelos, piezas medidas con dos métodos.
Las dos muestras NO son independientes.  Se reduce a UNA muestra: D_i = X_i - Y_i. ^VQb0Jb8J

Test (D_1..D_n muestra aleatoria; D̄ y S_D calculados con las diferencias) ^oQeIWi1p

Si n es grande y las diferencias no son normales: el mismo estadístico es aproximadamente N(0,1) y se usan z_α, z_{α/2}. ^gjcY2trn

IC para la diferencia media ^Pq9fomJq

Interpretación: μ_D = μ_X - μ_Y.  Si el IC no contiene al 0, hay diferencia significativa (test bilateral equivalente).
OJO con el signo: la diferencia D = X - Y puede salir negativa; el signo de H_A tiene que coincidir con esa definición. ^5xbt5d4Y

Por qué aparear ^tZX3kX4L

Al restar se elimina la variabilidad entre sujetos; suele dar más potencia que tratar las muestras como independientes. ^yuSNRBke

EJEMPLO ^k8EatfKf

Ejemplos apareados ^AguX2M8O

Profesores de francés (clase): 20 diferencias (2do test - 1er test), H₀: μ = 0 vs H_A: μ > 0 ^krNDRqh4

Creatinina (guía 8, ej. 4): 11 hombres, métodos A y B, ¿difieren? ^gLJjSwcZ

No hay evidencia de que los métodos difieran.  Con la tabla t (10 gl) el p-valor se acota: 0.5 < p < 0.9. ^NK4z674g

Frecuencia cardíaca (guía 8, ej. 6): 10 animales, antes y después ^yDonNJW1

Sí se puede concluir que el experimento aumenta la frecuencia cardíaca media. ^UEclFCYm

DDE y cáncer de mama (guía 8, ej. 8): n = 171 diferencias, d̄ = 2.7, s = 15.9, ¿difieren? ^2qYg0uxl

Dos poblaciones: muestras independientes (diferencia de medias) ^TW2qtbGZ

TEORÍA ^niD5GAX9

Los cuatro casos (X: n₁, Ȳ: n₂, muestras independientes) ^SpRSiKcY

Idea ^z8WYTU6M

Se compara μ₁ - μ₂ con el estimador X̄ - Ȳ.  Como las muestras son independientes:
E(X̄-Ȳ) = μ₁ - μ₂   y   V(X̄-Ȳ) = σ₁²/n₁ + σ₂²/n₂.   H₀: μ₁ - μ₂ = Δ₀ (casi siempre 0). ^q0iD9AyH

Desvío combinado (caso B) y grados de libertad de Welch (caso C) ^qqBxTNoa

Regiones de rechazo (para el estadístico Z o T de cada caso) ^KEErmoCT

p-valor:  cola superior P(Z ≥ z_obs);  inferior P(Z ≤ z_obs);  bilateral P(|Z| ≥ |z_obs|)  (igual con T y su distribución t). ^lmFIauLd

TEORÍA ^Z0zPgBAt

IC para μ₁ - μ₂ (mismos casos) ^jSNAlDWf

Cómo usar el IC ^wqYUn5j8

Si el IC contiene al 0 (o a Δ₀) → no se rechaza H₀: μ₁ = μ₂ (o μ₁ - μ₂ = Δ₀) con ese nivel (test bilateral).
Si todo el IC es positivo → μ₁ > μ₂ con esa confianza;  si es todo negativo → μ₁ < μ₂. ^HK2kfCm2

Cómo decidir entre el caso B y el C ^LbVLLfWz

El enunciado suele decir "con la misma varianza" (caso B).  Si no lo dice, y s₁ y s₂ son parecidos (cociente entre 0.5 y 2), se puede
suponer varianzas iguales; si son muy distintos se usa Welch (caso C), que siempre es válido aunque sea más conservador. ^Zd3byAnc

Diferencia de proporciones (extra, guía 5 ej. 3) ^RlpMNwAz

Ejemplo de la clase, caso A: trabajadoras (μ=120, σ=28, n=10) vs. varones (μ=105, σ=35, n=12) ^uI8rq4t4

EJEMPLO ^Qvwj74bg

Ejemplos: casos D, B y C (de la clase) ^XvTi5dM8

Caso D: 412 trabajadoras (x̄ = 186.60, s = 29.15) vs 750 estudiantes (x̄ = 175.50, s = 31.55). IC 99 % ^Wp01Jp06

El IC contiene al 15 (el valor histórico) → no hay razón para dudar de los valores históricos. ^u6MiwMR5

Caso B: templado en agua salada (n₁ = 13, x̄ = 145.021, s = 0.02396) vs aceite (n₂ = 8, x̄ = 144.979, s = 0.03137) ^iYYwRN4D

Se rechaza la igualdad de medias (aun con α = 0.01): los métodos de templado dan durezas distintas.
(La diapositiva escribe s_p² = 0.007178 y t = 3.33: con los datos sin redondear los valores cambian un poco; la conclusión es la misma.) ^p8Ys6DHF

Caso C: DDT en ratas (6 envenenadas vs 6 control), H₀: μ₁ = μ₂ vs bilateral ^nr7HIsrB

p-valor = P(|T| ≥ 2.99) con 6 gl = 0.024 → hay evidencia de que el segundo pico difiere entre grupos. ^ZeKmUcpu

EJEMPLO ^aReOHUdQ

Ejemplos de la guía 8 ^cbtYikpm

Ej. 1 (caso A): salida de calor, n = 10 y 10, σ₁ = 0.2, σ₂ = 0.4;  x̄ = 0.64, ȳ = 2.05;  H₀: μ₁-μ₂ = -1 vs μ₁-μ₂ < -1, α = 0.01 ^JVdmHGUm

Ej. 2 (caso A): uniones de espiga, σ₁ = 155, σ₂ = 140, n = 10 y 9, x̄ = 1376.4, ȳ = 1215.6;  H_A: μ₁ - μ₂ > 0 ^miqa7Twk

Ej. 3 (caso B): vitamina D, n = 11 y 11, x̄ = 10.95 y 8.24, s = 1.25 y 1.39;  H₀: μ₁-μ₂ = 2 vs > 2, α = 0.05 ^pkyn9S6c

Ej. 5 (caso C): glóbulos blancos, infectados (n = 15, x̄ = 4767, s = 3204) vs sanos (n = 10, x̄ = 7360, s = 2415); H_A: μ₁ < μ₂ ^8oUEnSEX

Ej. 7 (caso D): carboxihemoglobina, fumadores (n = 65, 4.4, s = 2.0) vs no fumadores (n = 58, 1.6, s = 1.3); H_A: μ₁ - μ₂ > 2 ^DN4pmwBv

Regresión lineal simple (clase XXI en adelante) ^mZus7sIQ

TEORÍA ^H3gzTVN4

Modelo, recta de mínimos cuadrados e inferencia ^3KIf1lmg

Modelo ^LtJLpqZP

x_i: variable explicativa (fija).   Y_i: variable respuesta (aleatoria).   β₁ = pendiente,  β₀ = ordenada al origen,  σ² = varianza del error. ^xyhS1Es5

Estimadores de mínimos cuadrados (minimizan la suma de cuadrados de los residuos) ^qJ6DglJR

Coeficiente de determinación y correlación ^cna2RiPi

R² = proporción de la variabilidad de Y explicada por la recta (0 ≤ R² ≤ 1). ^WzPZkSeX

Distribución de los estimadores ^2lhUWqmV

Inferencia ^0HeWiVO9

El intervalo de predicción es más ancho (incluye el error de una nueva observación).  Ambos son más angostos cerca de x̄.
Supuestos: linealidad, errores independientes, normales, con varianza constante (se chequea con el gráfico de residuos).
No extrapolar fuera del rango de los x observados. ^Zyyz3Tc5

EJEMPLO ^hbXyPusj

Ejemplo de regresión con cuentas ^tpFgb4st

Datos ^5EWvQbMw

Recta ajustada ^z61vlUGi

Error y ajuste ^07usCuCH

Inferencia (α = 0.05, t_{0.025,6} = 2.447) ^Vbz0mmHD

Para x* = 5.5 ^aDcEoxaU

Ejercicios tipo parcial y checklist final ^huOmZwUX

EJEMPLO ^Gi7chs1k

Parciales 2024 y 2025: cómo se resuelven ^LY7Mr9nr

Parcial 2024, ej. 1: báscula con error N(0, 0.1²), n = 5, x̄ = 3.1502 ^VJFvF2Fw

Parcial 2024, ej. 4: planta química, μ₀ = 1100, n = 260, ȳ = 1060, s = 340. ¿Bajó la producción? ^97KznhdT

Parcial 2025, ej. 1 (MV exponencial): λ̂ = n/Σx = 10/55.80 = 0.179  y  P̂(X ≤ 5) = 1 - e^(-5λ̂) = 0.592 (invarianza) ^K4elQn1J

Parcial 2025, ej. 2 (IC 95 % dado): ver la tarjeta de anotaciones de IC (x̄, s y el nuevo IC del 99 %) ^NsDcV7cD

Parcial 2025, ej. 3 (triatlón, σ desconocida): IC de μ y σ² con n = 40 y con n = 9 (guía 6, ej. 6) ^dL17da1w

Parcial 2025, ej. 4 (apareadas): d̄ = -1.5833, s_d² = 3.041 → IC con t_{α/2,n-1}·s_d/√n y test H₀: μ_D = 0 ^a9sTEq30

Patrón de los parciales: 1 ejercicio de estimación (sesgo / momentos / MV), 1-2 de IC, 1 de test con conclusión. ^UR77tYOh

ANOTACIONES ^hhF4fYnz

Checklist antes de entregar y resumen de fórmulas clave ^koqYloRd

Estimación ^bQWcSCc6

□ ¿Calculé E(θ̂) y lo comparé con θ?   □ Corregí el sesgo con una constante.   □ ECM = Var + sesgo².
□ Momentos: E(X) = X̄.   □ MV: L → ln L → derivar → igualar a 0 → verificar máximo (o razonar con el borde si el dominio depende de θ). ^bGDmkzn3

Intervalos ^BGxhgBBb

□ ¿σ conocida o no?  □ ¿n grande?  □ z_{α/2} o t_{α/2,n-1}  □ χ² con las dos colas (¡intercambiadas!)  □ redondear n hacia arriba. ^SOVqlvWB

Tests ^mMgbx9WA

□ Tesis a probar en H_A.  □ α o α/2 según la alternativa.  □ Estadístico con μ₀ (o p₀).  □ RR del lado correcto.
□ Valor observado → decisión → conclusión EN CONTEXTO.  □ Si piden β: usar la fórmula con μ' y con σ (o s). ^VwVYWlR1

Fórmulas maestras ^0NOiZskc

## Element Links

## Embedded Files
8eea53014313c1f75308cd79206a5017d3c6363f: $$\begin{array}{ll} \textbf{Clase} & \textbf{Tema}\\ \hline \text{XV} & \text{Estimación puntual: momentos, máxima verosimilitud (MV), invarianza, propiedades asintóticas}\\ \text{XVI} & \text{IC: nivel, IC para } \mu \text{ (σ conocida / desconocida), tamaño de muestra, t de Student}\\ \text{XVII} & \text{IC para } \sigma^{2}\text{, IC para } p\text{, IC para } \mu \text{ con muestras grandes (TCL)}\\ \text{XVIII} & \text{Test de hipótesis: } H_0,H_A\text{, estadístico, RR, p-valor, errores I y II, potencia; tests para } \mu \text{ (casos A y B)}\\ \text{XIX} & \text{Test para } \mu \text{ (casos C y D), test para } \sigma^{2}\text{, test bilateral} \leftrightarrow \text{IC, test para } p\\ \text{XX} & \text{Dos poblaciones: apareadas; diferencia de medias (casos A, B, C, D); IC para } \mu_1-\mu_2\\ \text{XXI} & \text{Regresión lineal (comienzo): recta de mínimos cuadrados e inferencia} \end{array}$$

e1fd20e2883bab407699d2a873f5c9ea33993cb7: $$\begin{array}{l|l|l} \textbf{Parámetro / situación} & \textbf{Estadístico (pivote)} & \textbf{Distribución}\\ \hline \mu,\ \text{normal},\ \sigma\ \text{conocida} & \dfrac{\bar X-\mu}{\sigma/\sqrt n} & N(0,1)\\[2mm] \mu,\ \text{normal},\ \sigma\ \text{desconocida} & \dfrac{\bar X-\mu}{S/\sqrt n} & t_{n-1}\\[2mm] \mu,\ n\ \text{grande},\ \sigma\ \text{conocida} & \dfrac{\bar X-\mu}{\sigma/\sqrt n} & \approx N(0,1)\ (\text{TCL})\\[2mm] \mu,\ n\ge 40,\ \sigma\ \text{desconocida} & \dfrac{\bar X-\mu}{S/\sqrt n} & \approx N(0,1)\ (\text{TCL + Slutsky})\\[2mm] \sigma^{2},\ \text{normal} & \dfrac{(n-1)S^{2}}{\sigma^{2}} & \chi^{2}_{n-1}\\[2mm] p,\ n\ \text{grande} & \dfrac{\hat p-p}{\sqrt{p(1-p)/n}} & \approx N(0,1)\\[2mm] p,\ n\ \text{chico} & X=\sum X_i & \text{Bin}(n,p_0)\ \text{bajo } H_0\\[2mm] \text{apareadas: } \mu_D & \dfrac{\bar D-\Delta_0}{S_D/\sqrt n} & t_{n-1}\ (\text{o } N(0,1) \text{ si } n\ \text{grande})\\[2mm] \mu_1-\mu_2,\ \sigma_1,\sigma_2\ \text{conocidas} & \dfrac{\bar X-\bar Y-\Delta_0}{\sqrt{\sigma_1^2/n_1+\sigma_2^2/n_2}} & N(0,1)\\[2mm] \mu_1-\mu_2,\ \sigma_1=\sigma_2\ \text{desconocida} & \dfrac{\bar X-\bar Y-\Delta_0}{S_p\sqrt{1/n_1+1/n_2}} & t_{n_1+n_2-2}\\[2mm] \mu_1-\mu_2,\ \sigma_1\ne\sigma_2\ \text{desconocidas} & \dfrac{\bar X-\bar Y-\Delta_0}{\sqrt{S_1^2/n_1+S_2^2/n_2}} & \approx t_{gl}\ (\text{Welch}) \end{array}$$

a9039f2e8b4026d693f820e6d6e251d0adebad87: $$\Phi(z_{\alpha})=1-\alpha\qquad P(T_{\nu}>t_{\alpha,\nu})=\alpha\qquad P(\chi^{2}_{\nu}>\chi^{2}_{\alpha,\nu})=\alpha$$

c7dc2b5adb7e44cdfa84a1da525a6a49c9e4eed7: $$z_{0.10}=1.282\quad z_{0.05}=1.645\quad z_{0.025}=1.96\quad z_{0.01}=2.326\quad z_{0.005}=2.576$$

f877dbd9ca5212353e1d16b90561d1814b924f59: $$z_{1-\alpha}=-z_{\alpha}\qquad t_{1-\alpha,\nu}=-t_{\alpha,\nu}\qquad \chi^{2}_{1-\alpha,\nu}\ \text{NO es simétrico de}\ \chi^{2}_{\alpha,\nu}$$

fe09e41875d6fe81790c142936c5927ecdcfe8da: $$\{p(x;\theta):\ \theta\in\Theta\}\qquad \theta=\text{parámetro (o vector de parámetros)}\ \ \text{ej.: } X\sim N(\mu,\sigma^{2}),\ \theta=(\mu,\sigma^{2})$$

013ccc2ab05b15dca1035e67db7099338a7b07dc: $$\hat\theta=h(X_1,\dots,X_n)\ \ \text{(estimador = variable aleatoria)}\qquad \hat\theta_{obs}=h(x_1,\dots,x_n)\ \ \text{(estimación = número)}$$

d507669def5f59a3141c69ba7f70c67decb8d36f: $$\bar X=\frac1n\sum_{i=1}^{n}X_i\qquad S_{n-1}^{2}=\frac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^{2}\qquad \Sigma_n^{2}=\frac1n\sum_{i=1}^{n}(X_i-\bar X)^{2}$$

f6350d8b7774364531c0ac687f7dc72ffbefb837: $$\text{Sesgo}(\hat\theta)=E(\hat\theta)-\theta\qquad \hat\theta\ \text{insesgado}\iff E(\hat\theta)=\theta\qquad \text{asint. insesgado}\iff \lim_{n\to\infty}E(\hat\theta)=\theta$$

85024f747a2b548d66b6ee388624b2f327b5434b: $$ECM(\hat\theta)=E\big[(\hat\theta-\theta)^{2}\big]=V(\hat\theta)+\big[\text{Sesgo}(\hat\theta)\big]^{2}$$

8c173e172ce21e03213a4f3076e9517788f523a6: $$ER=\frac{ECM(\hat\theta_1)}{ECM(\hat\theta_2)}\qquad ER<1\Rightarrow \hat\theta_1\ \text{es más eficiente}$$

c4d4a0308f4303ba839c47208bf3f0561c4fe1b5: $$\sigma_{\hat\theta}=\sqrt{V(\hat\theta)}\qquad \hat\sigma_{\hat\theta}=\text{error estándar estimado (se reemplazan los parámetros desconocidos por estimaciones)}$$

924caff385c787380b635b08aecb30ce98f9f898: $$E(\bar X)=\mu\qquad V(\bar X)=\frac{\sigma^{2}}{n}\qquad E(S_{n-1}^{2})=\sigma^{2}$$

cd8dfec93f12997e54f301f7c981aaad392cf471: $$E\!\left(\Sigma_n^{2}\right)=\frac1n\sum_{i}E(X_i^{2})-E(\bar X^{2})=(\mu^{2}+\sigma^{2})-\left(\mu^{2}+\frac{\sigma^{2}}{n}\right)=\frac{n-1}{n}\sigma^{2}$$

4791ae523d5fe660b44f9d5d2fdd2166c5086c6f: $$\text{Sesgo}(\Sigma_n^{2})=-\frac{\sigma^{2}}{n}\to 0\ \ (\text{asint. insesgado})\qquad S_{n-1}^{2}=\frac{n}{n-1}\Sigma_n^{2}\ \Rightarrow\ E(S_{n-1}^{2})=\sigma^{2}$$

b4bcd246d77a05c83af70c6d6449c899813a23e3: $$\text{Ber}(p):\ \hat p=\bar X\qquad \text{Poisson}(\lambda):\ \hat\lambda=\bar X\qquad N(\mu,\sigma^{2}):\ \hat\mu=\bar X,\ \hat\sigma^{2}=S_{n-1}^{2}$$

24b251413537574c35e210fe01e30d56b2b1376d: $$E(\bar X^{2})=\mu^{2}+\frac{\sigma^{2}}{n}\ne\mu^{2}\qquad E\!\left(\bar X^{2}-\frac{S_{n-1}^{2}}{n}\right)=\mu^{2}\ \ (\text{corrigiendo el sesgo})$$

b9f71bdbe962b3a010f5a6c7988b991189da0e67: $$\hat\theta_n\ \text{consistente para }\theta\iff \hat\theta_n\xrightarrow{\ P\ }\theta\iff \lim_{n\to\infty}P\big(|\hat\theta_n-\theta|\ge\varepsilon\big)=0\ \ \forall\varepsilon>0$$

04b4c97ff9400dfdf56b4fabdfd259796cc3cc71: $$P\big(|\hat\theta_n-\theta|\ge\varepsilon\big)\le\frac{ECM(\hat\theta_n)}{\varepsilon^{2}}\ \Rightarrow\ \big[ECM(\hat\theta_n)\to0\Rightarrow\hat\theta_n\ \text{consistente}\big]$$

d9f85b5ebadd842dd1ba95f13b0a358eb23a78f0: $$ECM(\bar X)=\frac{\sigma^{2}}{n}\to0\ \ \text{(o LGN: }\bar X\xrightarrow{P}\mu\text{)}$$

14ac3e805f21d8d15165680eb87bea0ba415f714: $$\hat\theta\ \text{consistente y } g\ \text{continua}\ \Rightarrow\ g(\hat\theta)\ \text{consistente para}\ g(\theta)$$

3716e3f480564b728695fd12efb5777480c93a74: $$\Sigma^{2}=\frac1n\sum X_i^{2}-\bar X^{2}\ \xrightarrow{P}\ E(X^{2})-\mu^{2}=\sigma^{2}\quad(\text{LGN para }X_i^{2}\text{ y continuidad con }g(x)=x^{2})$$

dfc0caf854250532e4ca311457704d3fef6f8b88: $$V(\bar X)=\frac{\sigma^{2}}{n}\quad V\!\Big(\sum a_iX_i\Big)=\sum a_i^{2}\sigma^{2}\ \ (\text{independientes})\quad V(aX)=a^{2}V(X)$$

f8cdf20b04d65dd0befa1ce22ef7fb644e745efc: $$\hat\lambda_1=\bar X,\ \ \hat\lambda_2=\tfrac{X_1+X_n}{2},\ \ \hat\lambda_3=\tfrac{X_1+2X_2+X_n}{3}:\quad E=\lambda,\ \lambda,\ \tfrac{4}{3}\lambda\ \Rightarrow\ \hat\lambda_3\ \text{sesgado}$$

0497d1f1c6c96c14c6498243432ba144e892a774: $$V(\hat\lambda_1)=\frac{\lambda}{n}\qquad V(\hat\lambda_2)=\frac{2\lambda}{4}=\frac{\lambda}{2}\ \ \Rightarrow\ \hat\lambda_1\ \text{es el mejor insesgado (}n>2\text{)}$$

d5794e91d9d8f3feb57c30b63259b679828eb525: $$E(2\bar X)=2\cdot\frac{\theta}{2}=\theta\ \Rightarrow\ \text{insesgado}\qquad V(2\bar X)=\frac{4}{n}\cdot\frac{\theta^{2}}{12}=\frac{\theta^{2}}{3n}$$

5639d8422326a16576f9bf506ffedd43e7fe4c1b: $$F_M(m)=\left(\frac m\theta\right)^{n}\qquad f_M(m)=\frac{n\,m^{n-1}}{\theta^{n}}\ \ (0\le m\le\theta)$$

dbea987ebb8bdc70eb919cc2db8a3a52e0bf303d: $$E(M)=\int_0^{\theta}m\,\frac{n\,m^{n-1}}{\theta^{n}}dm=\frac{n}{n+1}\theta\ \Rightarrow\ \text{Sesgo}(M)=-\frac{\theta}{n+1}\ \ (\text{sesgado})$$

a8f37845efed71b9366b42cc2bb3f38ec1269844: $$\hat\theta^{*}=\frac{n+1}{n}M\ \Rightarrow\ E(\hat\theta^{*})=\theta\qquad V(M)=\frac{n\,\theta^{2}}{(n+1)^{2}(n+2)}\qquad V(\hat\theta^{*})=\frac{\theta^{2}}{n(n+2)}$$

2b61a9bc7fc0011b2a64393874a7c8aabcd4977a: $$ECM(M)=\frac{2\theta^{2}}{(n+1)(n+2)}\qquad ECM(2\bar X)=\frac{\theta^{2}}{3n}\qquad ECM(\hat\theta^{*})=\frac{\theta^{2}}{n(n+2)}$$

cacaec76d9c2a1f2d30998829ff8f83530b73da6: $$E(Y)=\int_{-1}^{1}y\,\frac{\delta y+1}{2}dy=\frac{\delta}{3}\ \Rightarrow\ E(\bar Y)=\frac{\delta}{3}\ne\delta\ \ (\bar Y\ \text{sesgado; sesgo}=-\tfrac{2\delta}{3})$$

57f84f1a21b8c22337b153b0645d7cff6f13b4dd: $$\hat\delta=3\bar Y\ \Rightarrow\ E(\hat\delta)=\delta\qquad V(Y)=\frac13-\frac{\delta^{2}}{9}\ \Rightarrow\ V(\hat\delta)=\frac{9}{n}V(Y)=\frac{3-\delta^{2}}{n}$$

d66690451673e4c3c0a85a2c6b5f783dd33ad813: $$ECM(\bar X)=\frac{\sigma^{2}}{n},\quad ECM(X_1)=\sigma^{2}\ \Rightarrow\ ER=\frac{ECM(\bar X)}{ECM(X_1)}=\frac1n<1\ (n\ge2)$$

5c7f8b370ceb48c8e10ea73e57e1f07235a38101: $$E\!\left(\frac{X_1}{n_1}-\frac{X_2}{n_2}\right)=p_1-p_2\qquad \sigma=\sqrt{\frac{p_1q_1}{n_1}+\frac{p_2q_2}{n_2}}\qquad \hat\sigma=\sqrt{\frac{\hat p_1\hat q_1}{n_1}+\frac{\hat p_2\hat q_2}{n_2}}$$

3c9271ae31ef4d0000fbd2643be1591bf6d27da6: $$M_j=E(X^{j})=g_j(\theta_1,\dots,\theta_k)\qquad \overline{M}_j=\frac1n\sum_{i=1}^{n}X_i^{j}$$

34e355a5be87c0224992bcbd7e3824a900ba8431: $$\overline{M}_j=g_j(\hat\theta_1,\dots,\hat\theta_k),\ \ j=1,\dots,k\ \ \Longrightarrow\ \ (\hat\theta_1,\dots,\hat\theta_k)=g^{-1}(\overline{M}_1,\dots,\overline{M}_k)$$

5de40e9853bea8c5ae36ed88d800f6305976d869: $$\begin{array}{lll} \textbf{Modelo} & \textbf{Ecuación} & \textbf{Estimador}\\ \hline \text{Ber}(p) & E(X)=p & \hat p=\bar X\\ \text{Poisson}(\lambda) & E(X)=\lambda & \hat\lambda=\bar X\\ \mathcal{E}(\lambda) & E(X)=1/\lambda & \hat\lambda=1/\bar X\\ U(0,\theta) & E(X)=\theta/2 & \hat\theta=2\bar X\\ N(\mu,\sigma^{2}) & E(X)=\mu,\ E(X^2)=\mu^2+\sigma^2 & \hat\mu=\bar X,\ \hat\sigma^{2}=\overline{M}_2-\bar X^{2}=\Sigma_n^{2}\\ \Gamma(\alpha,\lambda) & E=\alpha/\lambda,\ V=\alpha/\lambda^2 & \hat\lambda=\bar X/\Sigma_n^2,\ \hat\alpha=\bar X^2/\Sigma_n^2 \end{array}$$

0a3ac1db55eb7b60719946a0b36d444dc6fcf47e: $$E(X)=(\theta+1)\int_0^{1}x^{\theta+1}dx=\frac{\theta+1}{\theta+2}\ \Rightarrow\ \bar X=\frac{\hat\theta+1}{\hat\theta+2}\ \Rightarrow\ \hat\theta=\frac{1-2\bar X}{\bar X-1}$$

e724c43994d418d5f9e1797738e51be3f76cb410: $$\bar X=\frac{\hat\beta}{\hat\beta-1}\ \Rightarrow\ \bar X\hat\beta-\bar X=\hat\beta\ \Rightarrow\ \hat\beta=\frac{\bar X}{\bar X-1}$$

93d7fdf78ea93af62b29d307a360f9b78f41004a: $$\hat\mu=\bar X\qquad \hat\sigma^{2}=\frac1n\sum X_i^{2}-\bar X^{2}=\frac1n\sum(X_i-\bar X)^{2}$$

163c4868d404c692570d25d9750bf2dba482176a: $$L(\theta)=\prod_{i=1}^{n}p(x_i;\theta)\qquad \ell(\theta)=\ln L(\theta)=\sum_{i=1}^{n}\ln p(x_i;\theta)$$

d4174d6e240f00627cc7af74adac454ca921a91c: $$\hat\theta_{MV}=\arg\max_{\theta}L(\theta)=\arg\max_{\theta}\ell(\theta)$$

decd7ec3aa52e7d1f09720da452b105c931ab346: $$\hat\theta_{MV}\ \text{estimador de MV de }\theta\ \Longrightarrow\ h(\hat\theta_{MV})\ \text{es el estimador de MV de }h(\theta)$$

57aa682d4ec6f51534d3e00e9cbf59da8fbb366f: $$\begin{array}{lll} \textbf{Modelo} & \ell(\theta) & \textbf{Estimador de MV}\\ \hline \text{Ber}(p) & \sum X_i\ln p+(n-\sum X_i)\ln(1-p) & \hat p=\bar X\\[1mm] \text{Poisson}(\lambda) & -n\lambda+\sum X_i\ln\lambda-\sum\ln X_i! & \hat\lambda=\bar X\\[1mm] \mathcal{E}(\lambda) & n\ln\lambda-\lambda\sum X_i & \hat\lambda=1/\bar X\\[1mm] N(\mu,\sigma^{2}) & -\frac n2\ln(2\pi\sigma^{2})-\frac{1}{2\sigma^{2}}\sum(X_i-\mu)^{2} & \hat\mu=\bar X,\ \ \hat\sigma^{2}=\Sigma_n^{2}=\frac1n\sum(X_i-\bar X)^{2}\\[1mm] U(0,\theta) & \text{no derivable} & \hat\theta=\max_i X_i\\[1mm] (\theta+1)x^{\theta},\ [0,1] & n\ln(\theta+1)+\theta\sum\ln X_i & \hat\theta=-\dfrac{n}{\sum\ln X_i}-1 \end{array}$$

ccceaed224283092797b1106f3f70aaa5017af31: $$\ell_n(p)=\sum_i X_i\ln p+(1-X_i)\ln(1-p)\qquad \ell_n'(p)=n\left[\frac{\bar X}{p}-\frac{1-\bar X}{1-p}\right]=0\Rightarrow\hat p=\bar X$$

62dbb1fadbe61a0d564f70d73ebbca0dff1dbcb8: $$\ell_n''(p)=-n\left[\frac{\bar X}{p^{2}}+\frac{1-\bar X}{(1-p)^{2}}\right]<0\ \Rightarrow\ \text{máximo}$$

5739d2d6a351aa3a22de67394fb196c8f38b1987: $$\ell(\lambda)=n\ln\lambda-\lambda\sum x_i\ \Rightarrow\ \frac{n}{\lambda}-\sum x_i=0\ \Rightarrow\ \hat\lambda=\frac{n}{\sum x_i}=\frac1{\bar x}$$

decb52c318b6fcad3a2b60905581053c28040b20: $$\widehat{\text{mediana}}=\hat\mu=\bar x\qquad \widehat{x_{0.90}}=\hat\mu+z_{0.10}\hat\sigma=\bar x+1.282\,\hat\sigma\qquad \widehat{P(X<a)}=\Phi\!\left(\frac{a-\hat\mu}{\hat\sigma}\right)$$

0f14efe649c0058ed4e7227bce78661a14adb0b1: $$\ell(\theta)=n\ln(\theta+1)+\theta\sum\ln x_i\ \Rightarrow\ \frac{n}{\theta+1}+\sum\ln x_i=0\ \Rightarrow\ \hat\theta=-\frac{n}{\sum\ln x_i}-1$$

223b6a3cb0145023a4c04035e29519caae664171: $$\hat\theta_{MV}\ \approx\ N\!\left(\theta,\ \frac{1}{n\,I(\theta)}\right)\qquad I(\theta)=E\!\left[\left(\frac{\partial\ln p(X;\theta)}{\partial\theta}\right)^{2}\right]=-E\!\left[\frac{\partial^{2}\ln p(X;\theta)}{\partial\theta^{2}}\right]$$

e9ca6f86f45d51359da8adef3d75d875425034e2: $$\text{Ber}(p):\ I(p)=\frac{1}{p(1-p)}\Rightarrow V(\hat p)\approx\frac{p(1-p)}{n}\qquad \mathcal{E}(\lambda):\ I(\lambda)=\frac{1}{\lambda^{2}}\Rightarrow V(\hat\lambda)\approx\frac{\lambda^{2}}{n}$$

19d27d3ffb1f999d8711b45b59b21c0b214122c1: $$\widehat{h(\theta)}=h(\hat\theta)\qquad V\big(h(\hat\theta)\big)\approx\big[h'(\theta)\big]^{2}\frac{1}{nI(\theta)}$$

4bbdc609dfdf376c7464f82a2c5f0d6450b1b983: $$\bar X\sim N\!\left(\mu,\frac{\sigma^{2}}{n}\right)\ \Rightarrow\ Z=\sqrt n\,\frac{\bar X-\mu}{\sigma}\sim N(0,1)$$

859a90962aee6fb5b01af24825a7a3d3ad25a487: $$\frac{(n-1)S^{2}}{\sigma^{2}}=\frac{\sum(X_i-\bar X)^{2}}{\sigma^{2}}\sim\chi^{2}_{n-1}\qquad \bar X\ \text{y}\ S^{2}\ \text{son independientes}$$

3b99e4e4b62fee85da4049d98c1ff057364576a8: $$T=\sqrt n\,\frac{\bar X-\mu}{S}=\frac{Z}{\sqrt{\chi^{2}_{n-1}/(n-1)}}\sim t_{n-1}$$

66ef4b461f247110927e3779c3e348e5c2aa2c24: $$Z\sim N(0,1),\ X\sim\chi^{2}_{\nu}\ \text{independientes}\ \Rightarrow\ T=\frac{Z}{\sqrt{X/\nu}}\sim t_{\nu}\qquad t_\nu\to N(0,1)\ (\nu\to\infty)$$

e859226fbb8f11956f123a4fd920de5d720e5a80: $$\chi^{2}_{\nu}=\Gamma\!\left(\tfrac{\nu}{2},\ \lambda=\tfrac12\right)\qquad f(x)=\frac{(1/2)^{\nu/2}}{\Gamma(\nu/2)}x^{\nu/2-1}e^{-x/2}$$

b40c8013401beb5c5350e24a7c1ba275337060e6: $$t_{0.025,\,8}=2.306\qquad t_{0.025,\,14}=2.145\qquad t_{0.025,\,15}=2.131\qquad t_{0.025,\,24}=2.064\qquad t_{0.005,\,21}=2.831$$

ff20ef1d44fd53783c7a0b1fd4a26b831577b8c3: $$\chi^{2}_{0.025,15}=27.488\ \ \chi^{2}_{0.975,15}=6.262\ \ \chi^{2}_{0.005,21}=41.401\ \ \chi^{2}_{0.995,21}=8.034$$

50eabc10fd09b2978ef8dbb8c6234ff431e08b48: $$P\big(L(X_1,\dots,X_n)\le\theta\le R(X_1,\dots,X_n)\big)=1-\alpha\ \Longrightarrow\ [L,R]\ \text{es un IC de nivel }1-\alpha$$

5be0bcd6ea747ba92b1d7fb3ad2efe9c5f8cf3cf: $$\begin{array}{l|l|c} \textbf{Caso} & \textbf{Pivote} & \textbf{IC de nivel } 1-\alpha\\ \hline \text{A: normal, } \sigma\ \text{conocida} & \sqrt n\dfrac{\bar X-\mu}{\sigma}\sim N(0,1) & \bar X\pm z_{\alpha/2}\dfrac{\sigma}{\sqrt n}\\[3mm] \text{B: normal, } \sigma\ \text{desconocida} & \sqrt n\dfrac{\bar X-\mu}{S}\sim t_{n-1} & \bar X\pm t_{\alpha/2,\,n-1}\dfrac{S}{\sqrt n}\\[3mm] \text{D1: } n\ \text{grande, } \sigma\ \text{conocida (TCL)} & \sqrt n\dfrac{\bar X-\mu}{\sigma}\approx N(0,1) & \bar X\pm z_{\alpha/2}\dfrac{\sigma}{\sqrt n}\\[3mm] \text{D2: } n\ge40,\ \sigma\ \text{desconocida} & \sqrt n\dfrac{\bar X-\mu}{S}\approx N(0,1) & \bar X\pm z_{\alpha/2}\dfrac{S}{\sqrt n} \end{array}$$

6f8fb0d7675dc399847fb528216f272f943a5e67: $$L=2z_{\alpha/2}\frac{\sigma}{\sqrt n}\qquad E=z_{\alpha/2}\frac{\sigma}{\sqrt n}\ \ (\text{margen de error})\qquad L\le L_0\iff n\ge\left(\frac{2z_{\alpha/2}\,\sigma}{L_0}\right)^{2}$$

be623e6156db9f99c3e73d21cd2c9d1d9d0336a9: $$(n-1)\frac{S^{2}}{\sigma^{2}}\sim\chi^{2}_{n-1}\ \Rightarrow\ \left[\frac{(n-1)S^{2}}{\chi^{2}_{\alpha/2,\,n-1}},\ \frac{(n-1)S^{2}}{\chi^{2}_{1-\alpha/2,\,n-1}}\right]\ \text{para }\sigma^{2}$$

f107f067e96646e403d21b0f898215f18f5ec2cc: $$\frac{\hat p-p}{\sqrt{p(1-p)/n}}\approx N(0,1)\ \ \Rightarrow\ \ \hat p\pm z_{\alpha/2}\sqrt{\frac{\hat p(1-\hat p)}{n}}\qquad(n\hat p\ge10,\ n(1-\hat p)\ge10)$$

c60d92b88b75b0422e8f5faccfe8290bcb0e8905: $$\frac{\hat p+\dfrac{z^{2}_{\alpha/2}}{2n}\pm z_{\alpha/2}\sqrt{\dfrac{\hat p(1-\hat p)}{n}+\dfrac{z^{2}_{\alpha/2}}{4n^{2}}}}{1+\dfrac{z^{2}_{\alpha/2}}{n}}$$

a24334e34cb6a44efcc89aa56c9d098cab94152d: $$L=2z_{\alpha/2}\sqrt{\frac{\hat p(1-\hat p)}{n}}\le \frac{z_{\alpha/2}}{\sqrt n}\ \ (\hat p(1-\hat p)\le\tfrac14)\ \Rightarrow\ n\ge\left(\frac{z_{\alpha/2}}{L}\right)^{2}$$

4a1a799b757efc4ca480ce1d686a0fb3d6cbdd75: $$Y=\max X_i,\ U=Y/\theta\sim f(u)=nu^{n-1}\ \Rightarrow\ P\!\left((\alpha/2)^{1/n}\le\tfrac{Y}{\theta}\le(1-\alpha/2)^{1/n}\right)=1-\alpha\ \Rightarrow\ \theta\in\left[\tfrac{Y}{(1-\alpha/2)^{1/n}},\tfrac{Y}{(\alpha/2)^{1/n}}\right]$$

28564f7295e409fb1ec521544ba91302fb84c937: $$P\!\left(\alpha^{1/n}\le\tfrac{Y}{\theta}\le1\right)=1-\alpha\ \Rightarrow\ \theta\in\left[Y,\ \tfrac{Y}{\alpha^{1/n}}\right]\ \text{(el más corto)}$$

3e2819b5011a60da8bfe84a39a519c8203160a77: $$\bar x=\frac{l+r}{2}\qquad \text{margen de error}=\frac{r-l}{2}=t_{\alpha/2,n-1}\frac{s}{\sqrt n}\ \ \text{(o } z_{\alpha/2}\sigma/\sqrt n\text{)}$$

ee874c4a03177591ecee08edccb3c03292bedca3: $$\text{σ conocida: }9\pm1.96\cdot\frac{2}{3}=[7.69,\ 10.31]\ \ (\text{margen }1.31)$$

57f62353f1ec17f7a909c3670def559db30321ab: $$\text{σ desconocida: }s^{2}=9.5,\ s=3.082,\ t_{0.025,8}=2.306\ \Rightarrow\ 9\pm2.306\cdot\frac{3.082}{3}=[6.63,\ 11.37]$$

2cdf8134d1d57f82524c926ef2d5658cef65e6ee: $$E=1.96\frac{0.3}{\sqrt n}\le0.1\ \Rightarrow\ \sqrt n\ge5.88\ \Rightarrow\ n\ge34.57\ \Rightarrow\ n=35$$

82a082caef8647d4bbb7bc176a3867f9e3735aae: $$\text{a) } z_{\alpha/2}=2.81\Rightarrow 1-\alpha/2=0.9975\Rightarrow\text{nivel}=0.995\qquad \text{b) 99.7 \%}\Rightarrow z_{0.0015}=2.97$$

a48f7be07ef12597ad6e9e60548b68adec7c853b: $$\text{c) }L\le0.05:\ n\ge\left(\frac{2\cdot1.96\cdot0.20}{0.05}\right)^{2}=245.86\Rightarrow n=246\qquad \text{d) }\bar x=10.30,\ s=0.19:\ 10.30\pm2.0639\tfrac{0.19}{\sqrt{25}}$$

908b35379b90c37b710d9fd3190e3eaba7cabc44: $$\mu:\ 76.88\pm t_{0.005,21}\frac{s}{\sqrt{22}}=76.88\pm2.8314\cdot\frac{3.784}{4.69}=76.88\pm2.284$$

e127677e7f8b4997f78a4b779d4349aa1087391b: $$\sigma^{2}:\ \left[\frac{21\cdot14.324}{41.401},\ \frac{21\cdot14.324}{8.034}\right]=[7.266,\ 37.44]\ \Rightarrow\ \sigma\in[2.695,\ 6.119]$$

f4dd7694c13bc211ac26d312d566e2d4a4d610ae: $$0.81\pm2.576\cdot\frac{0.34}{\sqrt{110}}=0.81\pm0.0835$$

0587686b7d261ba1fe6be6e5dfc3ef527fa70d98: $$\hat p=\tfrac{201}{356}=0.5646\qquad \hat p\pm z_{0.01}\sqrt{\tfrac{\hat p\hat q}{n}}=0.565\pm0.061\qquad n\ge\left(\tfrac{2.326}{0.05}\right)^{2}=2164.8\Rightarrow n=2165$$

2c175bd05d60603632b81d897bc51ae4b895fb2a: $$n=40:\ \ \mu:\ 188\pm z_{0.01}\tfrac{7.2}{\sqrt{40}}=188\pm2.648\ \ (\text{o }t_{0.01,39}=2.426\Rightarrow\pm2.762)$$

f09efb7925856f9e8335cf4d862216d7454be2cf: $$n=40:\ \ \sigma^{2}\in\left[\tfrac{39\cdot51.84}{62.43},\tfrac{39\cdot51.84}{21.43}\right]=[32.39,\ 94.36]$$

5ec17d2e58e6bf95ecc99148e9aaa27590cb8fa3: $$n=9:\ \ \mu:\ 188\pm t_{0.025,8}\tfrac{7.2}{3}=188\pm5.534\qquad \sigma^{2}\in\left[\tfrac{8\cdot51.84}{17.535},\tfrac{8\cdot51.84}{2.180}\right]=[23.65,\ 190.26]$$

5a2dd3a71f3770a8ce0a65e714765855b9997db7: $$\mu:\ 0.214\pm t_{0.05,15}\tfrac{0.036}{4}=0.214\pm1.753\cdot0.009=0.214\pm0.0158\qquad \sigma\in\left[\sqrt{\tfrac{15\cdot0.036^2}{24.996}},\sqrt{\tfrac{15\cdot0.036^2}{7.261}}\right]=[0.0279,\ 0.0517]$$

c9234976d18a7032394210d72654bc170e85f963: $$H_A:\ \theta\ne\theta_0\ (\text{bilateral})\qquad \theta>\theta_0\ (\text{cola superior / derecha})\qquad \theta<\theta_0\ (\text{cola inferior / izquierda})$$

94bdb8f7c67c0c4013fd5aef4a7d521eb697f3e5: $$\alpha=P(\text{rechazar }H_0\mid H_0\ \text{verdadera})\qquad p\text{-valor}=P(\text{estadístico al menos tan extremo como el observado}\mid H_0)$$

912a9ace88418754a9781c5f3ed968493a8dcc29: $$\begin{array}{l|c|c} & \text{No rechazo }H_0 & \text{Rechazo }H_0\\ \hline H_0\ \text{verdadera} & \text{correcto} & \text{Error tipo I}\ (\alpha)\\ H_0\ \text{falsa} & \text{Error tipo II}\ (\beta) & \text{correcto (potencia }1-\beta) \end{array}$$

05d8c81c8f687e01e412539730ee7e7e320268a4: $$\beta(\theta')=P(\text{no rechazar }H_0\mid\theta=\theta')\qquad \text{Potencia}(\theta')=1-\beta(\theta')$$

84458e80b748650ce5a415d0f80f09e2704cf0aa: $$\begin{array}{l|l|l} \textbf{Caso} & \textbf{Estadístico bajo }H_0 & \textbf{Condición}\\ \hline \text{A} & Z=\dfrac{\bar X-\mu_0}{\sigma/\sqrt n}\sim N(0,1) & \text{normal, }\sigma\ \text{conocida}\\[2mm] \text{B} & Z=\dfrac{\bar X-\mu_0}{\sigma/\sqrt n}\approx N(0,1)\ \text{ o con } S & n\ge30\ (\sigma\ \text{conocida}),\ n\ge40\ (\sigma\ \text{desconocida})\\[2mm] \text{C} & T=\dfrac{\bar X-\mu_0}{S/\sqrt n}\sim t_{n-1} & \text{normal, }\sigma\ \text{desconocida} \end{array}$$

bfcc48b888763f14af259730610f8185e5ed0b01: $$\begin{array}{l|l|l|l} H_A & RR\ (\text{casos A y B}) & RR\ (\text{caso C}) & \beta(\mu')\ \text{(caso A)}\\ \hline \mu<\mu_0 & z\le-z_\alpha & t\le-t_{\alpha,n-1} & 1-\Phi\!\left(-z_\alpha+\frac{(\mu_0-\mu')\sqrt n}{\sigma}\right)\\[2mm] \mu>\mu_0 & z\ge z_\alpha & t\ge t_{\alpha,n-1} & \Phi\!\left(z_\alpha+\frac{(\mu_0-\mu')\sqrt n}{\sigma}\right)\\[2mm] \mu\ne\mu_0 & |z|\ge z_{\alpha/2} & |t|\ge t_{\alpha/2,n-1} & \Phi\!\left(z_{\alpha/2}+\frac{(\mu_0-\mu')\sqrt n}{\sigma}\right)-\Phi\!\left(-z_{\alpha/2}+\frac{(\mu_0-\mu')\sqrt n}{\sigma}\right) \end{array}$$

a80d34a0416304e94a25a9710b382860212c0c63: $$\text{unilateral: } n\ge\left[\frac{(z_{\beta_0}+z_\alpha)\,\sigma}{\mu_0-\mu'}\right]^{2}\qquad \text{bilateral: } n\ge\left[\frac{(z_{\beta_0}+z_{\alpha/2})\,\sigma}{\mu_0-\mu'}\right]^{2}$$

15a5935b0e8d4559db06c6a9f417deaca5d7e5e7: $$H_0:\sigma^{2}=\sigma_0^{2}\qquad \chi^{2}=\frac{(n-1)S^{2}}{\sigma_0^{2}}\sim\chi^{2}_{n-1}\ \text{bajo }H_0$$

322ac6504c93683b857cc6c0d802a4d24925d3ca: $$\begin{array}{l|l} H_A & RR\\ \hline \sigma^{2}>\sigma_0^{2} & \chi^{2}\ge\chi^{2}_{\alpha,n-1}\\ \sigma^{2}<\sigma_0^{2} & \chi^{2}\le\chi^{2}_{1-\alpha,n-1}\\ \sigma^{2}\ne\sigma_0^{2} & \chi^{2}\le\chi^{2}_{1-\alpha/2,n-1}\ \ \text{ó}\ \ \chi^{2}\ge\chi^{2}_{\alpha/2,n-1} \end{array}$$

787950b863071e439dd52aea6d0321ac45ac752c: $$H_0:p=p_0\qquad Z=\frac{\hat p-p_0}{\sqrt{p_0(1-p_0)/n}}\approx N(0,1)\qquad RR:\ z\ge z_\alpha\ (p>p_0),\ \ z\le-z_\alpha\ (p<p_0),\ \ |z|\ge z_{\alpha/2}\ (p\ne p_0)$$

713bce427b68ccbf5978d6f8d39cb14723d7868b: $$\beta(p')=\Phi\!\left(z_\alpha\sqrt{\tfrac{p_0(1-p_0)}{p'(1-p')}}+\tfrac{(p_0-p')\sqrt n}{\sqrt{p'(1-p')}}\right)\ (p>p_0)\qquad n\ge\left[\frac{z_{\beta_0}\sqrt{p'(1-p')}+z_{\alpha}\sqrt{p_0(1-p_0)}}{p_0-p'}\right]^{2}$$

3ca924f4e43b1cf4c25bba0ec361698c5ab7aa0f: $$X=\sum X_i\sim\text{Bin}(n,p_0)\ \text{bajo }H_0\qquad \alpha=P(X\in RR\mid p_0)\qquad \beta(p')=P(X\notin RR\mid p')$$

b1a4397cab32c6ca71f1748ce57c1c0b7fbe4726: $$\begin{array}{l|l|l} \textbf{Estadístico} & H_A & p\text{-valor}\\ \hline Z\sim N(0,1) & \text{cola superior} & 1-\Phi(z_{obs})\\ & \text{cola inferior} & \Phi(z_{obs})\\ & \text{bilateral} & 2\,(1-\Phi(|z_{obs}|))\\ \hline T\sim t_{n-1} & \text{cola superior} & P(T>t_{obs})\\ & \text{cola inferior} & P(T<t_{obs})\\ & \text{bilateral} & 2P(T>|t_{obs}|)\\ \hline \chi^{2}\sim\chi^{2}_{n-1} & \text{cola superior} & P(\chi^{2}>\chi^{2}_{obs})\\ & \text{cola inferior} & P(\chi^{2}<\chi^{2}_{obs})\\ & \text{bilateral} & 2\min\{P(\chi^{2}<\chi^{2}_{obs}),P(\chi^{2}>\chi^{2}_{obs})\} \end{array}$$

3f4e7772f0b8bd7a9b4140b2092f93aeed670e44: $$\text{Test bilateral de nivel }\alpha\ \text{para}\ H_0:\mu=\mu_0\ \ \Longleftrightarrow\ \ \mu_0\in\big[\bar x\pm z_{\alpha/2}\sigma/\sqrt n\big]\ \Rightarrow\ \text{no se rechaza}$$

f0d44a5be7480950d3af2d16212e387fb6b79dc1: $$z=\frac{-0.538+0.545}{0.008/\sqrt5}=1.957\qquad p\text{-valor}=P(Z\ge1.96)=0.0252\Rightarrow\ \text{evidencia de adulteración}$$

5cd6a63b147f1d6accec7bb5f24dbbca1c0ef63e: $$RR:\ z<-z_{0.02}=-2.0537\iff \bar x<12-2.0537\tfrac{2}{\sqrt{30}}=11.25\qquad \bar x_{obs}=11.32\ \Rightarrow\ \text{no se rechaza}$$

3dbae144787c5fabb58d00f275bf80a8c3cadeb8: $$\beta(11)=P(\bar X>11.25\mid\mu=11)=P\!\left(Z>\tfrac{0.25\sqrt{30}}{2}\right)=P(Z>0.685)=0.2468\qquad \text{potencia}=0.753$$

d7457fffe0fe248636b4d354228bc30fb56d8368: $$RR:\ \bar x>5+2.054\tfrac{0.02}{4}=5.0103\ \ \text{ó}\ \ \bar x<4.9897\qquad \text{potencia}(4.98)=1-\beta=0.9742$$

012834222dae93288978ff9c10bbe61ec335733c: $$z=\frac{738.44-750}{38.20/\sqrt{50}}=-2.140\qquad \alpha=5\%:\ RR=\{z<-1.645\}\ \text{rechazo}\qquad \alpha=1\%:\ RR=\{z<-2.326\}\ \text{no rechazo}$$

8a1edb7a9f4ec5dad67429f3b9a2bbc700d66b3e: $$p\text{-valor}=\Phi(-2.14)=0.0162\ \Rightarrow\ \text{rechazo con }5\%\text{, no con }1\%\ (\text{se recomienda no comprar})$$

620e84fbd29d8fa0716af7d0575b1e26624f7d1e: $$t=\frac{94.32-95}{1.20/4}=-2.267\qquad t_{0.025,15}=2.131\qquad |t|>2.131\Rightarrow\text{ se rechaza }H_0$$

bc72220449385d8a3fcead93cbad00aa2670fdf7: $$\text{IC }95\%:\ 94.32\pm2.131\cdot0.30=[93.681,\ 94.959]\ \not\ni\ 95\ \ (\text{coincide con el test})$$

739ec2c4efe4ae49a586bd8685b71da8c0f2d09c: $$\bar x=0.876,\ s=0.1225\qquad t=\frac{\bar x-0.85}{s/\sqrt{15}}=0.8222\qquad t_{0.025,14}=2.145\Rightarrow\text{ no se rechaza}$$

5690efb113aeaa0df983190eb6cf820f9530bc7a: $$\text{IC }95\%:\ 0.876\pm0.0678=[0.8082,\ 0.9438]\ni0.85$$

12bc90580487d7bc7a9ef2555ba18a149da468df: $$\chi^{2}=\frac{15\cdot6.1}{4}=22.875\qquad \text{RR: }\chi^{2}\le27.488\ \text{ó}\ \chi^{2}\ge6.262\Rightarrow\text{ no se rechaza (datos compatibles con }\sigma=2)$$

fb3d1c26bdb3117f131c87b56a31eed4c68b4d47: $$\hat p=0.78\qquad z=\frac{0.78-0.70}{\sqrt{0.7\cdot0.3/200}}=2.469\qquad z_{0.02}=2.054\Rightarrow\text{ rechazo};\ \ p\text{-valor}=0.0068$$

b28935b6961e5ed1686d1605f67773dc4f87a73f: $$\alpha=P(X\ge18\mid p=0.5)=1-0.9784=0.0216\quad \beta(0.6)=P(X\le17\mid0.6)=0.8464\quad \beta(0.8)=0.1091$$

0893bf0673fca46d35d9461b455b1aa2c2145855: $$H_0:\mu_D=\Delta_0\ (\text{casi siempre }0)\qquad T=\frac{\bar D-\Delta_0}{S_D/\sqrt n}\sim t_{n-1}\ \ (\text{si las }D_i\ \text{son normales})$$

cb9929a4a97723717cc96f64ccbffd90833f60af: $$\begin{array}{l|l} H_A & RR\\ \hline \mu_D>\Delta_0 & t\ge t_{\alpha,n-1}\\ \mu_D<\Delta_0 & t\le-t_{\alpha,n-1}\\ \mu_D\ne\Delta_0 & |t|\ge t_{\alpha/2,n-1} \end{array}$$

cd2203b5284648c7321fb604a971dfada384948a: $$\bar D\pm t_{\alpha/2,\,n-1}\frac{S_D}{\sqrt n}\qquad(\text{o }z_{\alpha/2}\text{ si }n\text{ grande})$$

9288e6628a58b6cea7863d68d960ff6ac24c95ce: $$\bar d=2.5,\ s=2.89,\ n=20:\ \ t=\frac{2.5}{2.89/\sqrt{20}}=3.869\qquad p\text{-valor}=P(T_{19}>3.87)=0.000517\Rightarrow\text{ hay mejora}$$

236b64939e0dbf4cdc557018f923b8a11336c809: $$d_i=A_i-B_i:\ \ \bar d=0.0527,\ s_d=0.2524\qquad t=\frac{0.0527}{0.2524/\sqrt{11}}=0.693\qquad p\text{-valor}=0.504\ (>0.05)$$

9172afc7b45f59251663ca2e292a5bb470b6d4b5: $$d_i=\text{después}-\text{antes}=45,64,88,81,53,78,69,73,82,71\ \Rightarrow\ \bar d=70.4,\ t=16.63>t_{0.05,9}=1.833$$

3d4ee28e24e2fa27e90ecb10ed7cdfe300c4dcb0: $$t=\frac{2.7}{15.9/\sqrt{171}}=2.221\qquad n\ \text{grande}:\ |z|>1.96\Rightarrow\text{ se rechaza (p}\approx0.026\text{)}$$

e27cfe4b48941ff14b349779445574dffcbcfbde: $$\begin{array}{l|l|l} \textbf{Caso} & \textbf{Estadístico} & \textbf{Distribución}\\ \hline \text{A: normales, }\sigma_1,\sigma_2\ \text{conocidas} & Z=\dfrac{\bar X-\bar Y-\Delta_0}{\sqrt{\sigma_1^{2}/n_1+\sigma_2^{2}/n_2}} & N(0,1)\\[3mm] \text{B: normales, }\sigma_1=\sigma_2\ \text{desconocida} & T=\dfrac{\bar X-\bar Y-\Delta_0}{S_p\sqrt{1/n_1+1/n_2}} & t_{\,n_1+n_2-2}\\[3mm] \text{C: normales, }\sigma_1\ne\sigma_2\ \text{desconocidas} & T=\dfrac{\bar X-\bar Y-\Delta_0}{\sqrt{S_1^{2}/n_1+S_2^{2}/n_2}} & \approx t_{gl}\\[3mm] \text{D: no normales, } n_1,n_2\ \text{grandes} & Z=\dfrac{\bar X-\bar Y-\Delta_0}{\sqrt{S_1^{2}/n_1+S_2^{2}/n_2}} & \approx N(0,1) \end{array}$$

ed0a62d9b11ca60aaba5a6a3f69d0b676f5227af: $$S_p^{2}=\frac{(n_1-1)S_1^{2}+(n_2-1)S_2^{2}}{n_1+n_2-2}\qquad gl=\frac{\left(\frac{S_1^{2}}{n_1}+\frac{S_2^{2}}{n_2}\right)^{2}}{\frac{1}{n_1-1}\left(\frac{S_1^{2}}{n_1}\right)^{2}+\frac{1}{n_2-1}\left(\frac{S_2^{2}}{n_2}\right)^{2}}\ \ (\text{se redondea})$$

20524664857b99389b0a689d4d7b40a3fb559318: $$\begin{array}{l|l|l} H_A & \text{casos A y D (z)} & \text{casos B y C (t)}\\ \hline \mu_1-\mu_2>\Delta_0 & z\ge z_\alpha & t\ge t_{\alpha,\nu}\\ \mu_1-\mu_2<\Delta_0 & z\le-z_\alpha & t\le-t_{\alpha,\nu}\\ \mu_1-\mu_2\ne\Delta_0 & |z|\ge z_{\alpha/2} & |t|\ge t_{\alpha/2,\nu} \end{array}\qquad \nu=n_1+n_2-2\ (\text{B}),\ gl\ (\text{C})$$

da3a61016aa0638b0ca73be576f97e2a2d86f253: $$\begin{array}{l|c} \textbf{Caso} & \textbf{IC de nivel }1-\alpha\\ \hline \text{A} & (\bar X-\bar Y)\pm z_{\alpha/2}\sqrt{\dfrac{\sigma_1^{2}}{n_1}+\dfrac{\sigma_2^{2}}{n_2}}\\[3mm] \text{B} & (\bar X-\bar Y)\pm t_{\alpha/2,\,n_1+n_2-2}\,S_p\sqrt{\dfrac{1}{n_1}+\dfrac{1}{n_2}}\\[3mm] \text{C} & (\bar X-\bar Y)\pm t_{\alpha/2,\,gl}\sqrt{\dfrac{S_1^{2}}{n_1}+\dfrac{S_2^{2}}{n_2}}\\[3mm] \text{D} & (\bar X-\bar Y)\pm z_{\alpha/2}\sqrt{\dfrac{S_1^{2}}{n_1}+\dfrac{S_2^{2}}{n_2}} \end{array}$$

eea308c7b3fff018fa7b0cf1c9bb2f1e4f26617e: $$\hat p_1-\hat p_2\pm z_{\alpha/2}\sqrt{\tfrac{\hat p_1\hat q_1}{n_1}+\tfrac{\hat p_2\hat q_2}{n_2}}\qquad \text{test }H_0:p_1=p_2:\ Z=\tfrac{\hat p_1-\hat p_2}{\sqrt{\hat p(1-\hat p)(1/n_1+1/n_2)}},\ \hat p=\tfrac{x_1+x_2}{n_1+n_2}$$

f5ebfda24581a7c0c90271676c19c8a5a4e0cef2: $$\bar X_1-\bar X_2\sim N\!\left(15,\ \tfrac{28^{2}}{10}+\tfrac{35^{2}}{12}=180.48\right),\ \sigma=13.43\qquad P(\bar X_1-\bar X_2<0)=\Phi(-1.12)=0.1321$$

c20e6414616f93a1aec34f601594f72c05d3cdd6: $$(186.60-175.50)\pm z_{0.005}\sqrt{\tfrac{29.15^{2}}{412}+\tfrac{31.55^{2}}{750}}=11.10\pm4.742=[6.358,\ 15.842]$$

b85d7c511746ad9bea694d58404c439745382b78: $$s_p^{2}=\tfrac{12\,s_1^{2}+7\,s_2^{2}}{19}=0.000725\ (s_p=0.0269)\qquad s_p\sqrt{\tfrac1{13}+\tfrac18}=0.0121\qquad t_{0.025,19}=2.093$$

c49d1c365c4838e660007703a38e8a17352fb191: $$\text{IC 95 \%}:\ 0.042\pm0.0253=[0.0167,\ 0.0673]\not\ni0\qquad t_{obs}=\tfrac{0.042}{0.0121}=3.47>t_{0.005,19}=2.861$$

886fda812783948b12ce52715e8c02157782094d: $$\bar x_1=17.600,\ s_1=6.340;\ \ \bar x_2=9.500,\ s_2=1.950\qquad gl=5.9\approx6,\quad t=2.99$$

5180b05e5966593b06c8ec44ddcc30afac474067: $$z=\frac{(0.64-2.05)-(-1)}{\sqrt{0.04/10+0.16/10}}=-2.899\qquad z_{0.01}=2.326\Rightarrow\text{rechazo}\qquad p=\Phi(-2.90)=0.0019$$

d77d43e155788fafbd613fec89f809d80b6b9e3b: $$z=\frac{160.8}{\sqrt{155^{2}/10+140^{2}/9}}=2.376>1.645\Rightarrow\text{rechazo}\qquad p=0.0088$$

21b65de0d67dea7f866eae3792673599873af867: $$s_p=1.3219\quad t=\frac{10.95-8.24-2}{s_p\sqrt{2/11}}=1.260\quad t_{0.05,20}=1.725\Rightarrow\text{no se rechaza};\ \ p=0.111$$

7d1b4ae2a14ac7bd523e72df2ec570954607f999: $$gl=22.6\approx23\qquad t=\frac{4767-7360}{\sqrt{3204^{2}/15+2415^{2}/10}}=-2.303\qquad -t_{0.05,23}=-1.714\Rightarrow\text{rechazo};\ p=0.0153$$

6ee7d214e28981f58a85fbde81683a943d7d75e9: $$z=\frac{4.4-1.6-2}{\sqrt{4/65+1.69/58}}=2.657\quad z_{0.05}=1.645\Rightarrow\text{rechazo}\qquad p=0.0039$$

418ba14d8cc6b3755bed0364d35e230393c73e97: $$Y_i=\beta_0+\beta_1x_i+\varepsilon_i,\qquad \varepsilon_i\ \text{iid}\ N(0,\sigma^{2}),\quad i=1,\dots,n$$

0ca101b1821996a835d22692a0dd572244e9804b: $$\hat\beta_1=\frac{S_{xy}}{S_{xx}}=\frac{\sum(x_i-\bar x)(y_i-\bar y)}{\sum(x_i-\bar x)^{2}}\qquad \hat\beta_0=\bar y-\hat\beta_1\bar x\qquad \hat y_i=\hat\beta_0+\hat\beta_1x_i$$

8205638d825bca23f973f1e96e17ac5f13b34d13: $$SSE=\sum(y_i-\hat y_i)^{2}=S_{yy}-\hat\beta_1S_{xy}\qquad \hat\sigma^{2}=s^{2}=\frac{SSE}{n-2}$$

18a9ecff05264247d011cfbf566d092669059658: $$R^{2}=1-\frac{SSE}{S_{yy}}=\frac{SSR}{SST}=r^{2}\qquad r=\frac{S_{xy}}{\sqrt{S_{xx}S_{yy}}}\qquad \hat\beta_1=r\sqrt{S_{yy}/S_{xx}}$$

234ea1a9564f27e69a1ddc2364f3f04be5d54bdb: $$\hat\beta_1\sim N\!\left(\beta_1,\frac{\sigma^{2}}{S_{xx}}\right)\qquad \frac{\hat\beta_1-\beta_1}{s/\sqrt{S_{xx}}}\sim t_{n-2}\qquad \frac{(n-2)s^{2}}{\sigma^{2}}\sim\chi^{2}_{n-2}$$

7ea83154bdf2ccb80a244660ff11ef35416ebc03: $$\text{IC de }\beta_1:\ \hat\beta_1\pm t_{\alpha/2,n-2}\frac{s}{\sqrt{S_{xx}}}\qquad \text{test }H_0:\beta_1=0:\ T=\frac{\hat\beta_1}{s/\sqrt{S_{xx}}}\sim t_{n-2}\ (\text{¿hay relación lineal?})$$

1e7f68ad85da80bb362909d0f66db75cb45c6eaf: $$\text{IC de }E(Y|x^{*}):\ \hat y^{*}\pm t_{\alpha/2,n-2}\,s\sqrt{\tfrac1n+\tfrac{(x^{*}-\bar x)^{2}}{S_{xx}}}\qquad \text{intervalo de predicción de }Y:\ \hat y^{*}\pm t_{\alpha/2,n-2}\,s\sqrt{1+\tfrac1n+\tfrac{(x^{*}-\bar x)^{2}}{S_{xx}}}$$

45589f7453bf748a24f42927297b6a8904374be8: $$x=1,2,3,4,5,6,7,8\qquad y=2.3,\ 4.1,\ 5.8,\ 8.4,\ 9.7,\ 12.5,\ 13.4,\ 16.2$$

4cc992bca155137a2f5232bbbe9b1bdfe0723b2e: $$\bar x=4.50,\ \bar y=9.0500,\ S_{xx}=42.00,\ S_{xy}=82.600,\ S_{yy}=163.420$$

b0132ba6323a057fceb5fdc254b2aa8bed1ef039: $$\hat\beta_1=\frac{82.600}{42.00}=1.9667\qquad \hat\beta_0=9.0500-1.9667\cdot4.50=0.2000\qquad \hat y=0.200+1.967\,x$$

c0b10a587d2399ee913f407a8cc3c658d876d541: $$SSE=0.9733\qquad s^{2}=\frac{SSE}{n-2}=0.1622\ (s=0.4028)\qquad R^{2}=0.9940\ \ (r=0.9970)$$

26208c1ecfaf3c6886661fec5984497c04cd85f0: $$se(\hat\beta_1)=\frac{s}{\sqrt{S_{xx}}}=0.0621\qquad T=\frac{1.9667}{0.0621}=31.64\gg2.447\Rightarrow\text{ se rechaza }\beta_1=0$$

03faaa4e8e81eb0978cdcc6c6157e6419c30dd6d: $$\beta_1\in\left[1.8146,\ 2.1187\right]$$

68474253374346e8144d9830530b75bf84daf24b: $$\hat y^{*}=11.017\qquad E(Y|5.5)\in\left[10.636,\ 11.397\right]\qquad Y_{nueva}\in\left[9.960,\ 12.073\right]$$

84352bb7fd6500b4e1e405c6b2de24f6639f6f9e: $$\text{a) σ conocida: }3.1502\pm1.96\tfrac{0.1}{\sqrt5}=[3.0625,\ 3.2379]$$

f90d8699f12e3797bee9db1e29cb4b9acbad5958: $$\text{b) σ desconocida, }s=0.0092:\ 3.1502\pm t_{0.025,4}\tfrac{0.0092}{\sqrt5}=3.1502\pm0.0114=[3.1388,\ 3.1616]$$

d7dba05c5347e280440b836af83da2e3eedc9428: $$H_0:\mu=1100\ \text{vs}\ H_A:\mu<1100\qquad z=\frac{1060-1100}{340/\sqrt{260}}=-1.897\qquad RR:\ z\le-1.645\Rightarrow\text{ rechazo};\ p=0.0289$$

fb4c0aec2353606c45b583d107efafab42bb1eb8: $$\bar X\pm z_{\alpha/2}\tfrac{\sigma}{\sqrt n}\qquad \bar X\pm t_{\alpha/2,n-1}\tfrac{S}{\sqrt n}\qquad \left[\tfrac{(n-1)S^{2}}{\chi^{2}_{\alpha/2}},\tfrac{(n-1)S^{2}}{\chi^{2}_{1-\alpha/2}}\right]\qquad \hat p\pm z_{\alpha/2}\sqrt{\tfrac{\hat p\hat q}{n}}$$

ed318c2ab0fcd195800b7da1c3d257f477f5ce75: $$z=\tfrac{\bar x-\mu_0}{\sigma/\sqrt n}\qquad t=\tfrac{\bar x-\mu_0}{s/\sqrt n}\qquad \chi^{2}=\tfrac{(n-1)s^{2}}{\sigma_0^{2}}\qquad z=\tfrac{\hat p-p_0}{\sqrt{p_0q_0/n}}$$

0d51dedd43c0eef3c717672e95054a206a369069: $$\text{Bilateral }\leftrightarrow\text{ IC:}\quad \mu_0\notin IC_{1-\alpha}\iff\text{se rechaza }H_0\text{ al nivel }\alpha$$

dc80428680ffc0786fa24f4bf439482430b46529: [[P2 c2 notacion z alfa.png]]

e5e79da385c199e308c638a60ba65a308fc56780: [[P2 c2 tiradores.png]]

682e6d3d647db6c31b3c6ce5a1c007a340ea4f34: [[P2 c1 consistencia.png]]

ca33480d955267f04556e9e18a7c66ada7daa0f8: [[P2 c1 verosimilitud uniforme.png]]

1e87fb096d526496935634c6564c5b9e2ef86271: [[P2 c1 verosimilitud.png]]

0f6665c1bd43332b92ecf576c3634f9c13ee52c6: [[P2 c2 t densidades.png]]

2cb5763f113133a60db98f9490d2fbaccc2787a2: [[P2 c2 chi2 densidades.png]]

245c3a880737088a6a01a9464a9fe34360c15901: [[P2 c2 z 90 95 99.png]]

c5388308c6abee4c4587ba18a911ab532bfb1698: [[P2 c2 IC repetidos.png]]

91f1448cfd6a2d3b8b43ccf3118a2bf0781a46e5: [[P2 c3 tabla IC normal.png]]

30a3e95043efd184bfb0fb2e6f345fbb921349ac: [[P2 c4 potencia H0 H1.png]]

47b575a97371f0f1100f9e012bc7da830387af56: [[P2 c4 p-valor y alfa.png]]

a1ce3ed64bf3b3bd7fb4cc44402513d6a42f2cb1: [[P2 c4 RR cola izquierda.png]]

89b1a4ebd4763c23069f040d05c355d682ff77ec: [[P2 c4 RR dos colas.png]]

07d60d1cb2da91ccd52b92f23cb977cda137c9c7: [[P2 c5 dualidad.png]]

%%
## Drawing
```compressed-json
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
```
%%