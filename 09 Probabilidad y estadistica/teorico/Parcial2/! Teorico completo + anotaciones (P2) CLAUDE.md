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
2) Compararlo con θ.  
3) Si no da θ, el sesgo es E(θ̂) - θ.
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

en una distribución Normal, la mediana teórica coincide exactamente con la media poblacional debido a su simetría: ^e7zY4INA

el estimador de máxima verosimilitud encuentra el valor del parámetro desconocido que hace que los datos observados en tu muestra sean lo más probables (o verosímiles) posibles de haber ocurrido. ^bfKS7Quc

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

69b5f61ad13013004e3064a6cb8645fa191e2b57: [[Pasted Image 20261016103504_906.png]]

5957b556102ab10a7a0235cea18b901cf0c9430f: [[Pasted Image 20261017155733_649.png]]

db83a25aa4bbac356a840366b6041f7d4d7709ea: [[Pasted Image 20261017171402_033.png]]

%%
## Drawing
```compressed-json
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

R8ijwbFKM4THDCNgxvBD0FW9l/UAHIOa1pHlj/aAAcRBJQqYRqAE2AGUxGS2sAljDTLDYwpKBOMPEabjDJTF4wiLleSAEwl3AhMNYwiLkcwE4wzE5JMMOFU4BpMOFMY18XcF6g0b8Qbx8AsGCHnwhgsghT8EwAB7xYGEkAaoAqsyn7EM1j91mgwyw+CHrgmjgIwmW1YYwsNCg3O1cQ0K2jSxCLH3wHbQ9X9yH/FDcTRzjQ+CCDhzsbKgD2CTZIGl

402jn/RAVzyjYMfDD1czebUJCmQJ7Q0xhF0IqOAdCtDCHQtdD60I3Q1tVx0O3QttCPmziw0tC+0KSw5dCUsNXQw1R10I0QTdDjVGywqdDcsObyeLCy0MKwtVgV0OIAYdD0sPKwzLCt0Ou0B99d83YvZfd/+24vbpdeLx8vJ1DtMI7grIxNwDWAVoACNRRQencJlz1vaAxGkEFIWtQ1ERHsXGIaOUYKLjAosDwaQSpAbBfQ7pI3YWihdYAvfAUIZb

500AzASY1IMJxgp/drEP8/IV54MMcjHzC0Nx8xTZB3IyadJq4rgIPg3x8MyypIOvxmAK8gu4C7dy0nOWwENGw0PH5Pg1Q2LpYMwENzGrdUNhkyRIBYqgPtRFIhyGGRG09pAKSg0A4UoJ4wxpBnRDWAGUx7gE+sZCkMcOEw1FYxMIXgQXhjgAJw8Ow1AO+Q04BG4FpMEyxrXApwqn9UoJpXZ7JacIXgeaCKUDUwyWCNMMbHXwCNt38AnhRCAFaIH4

AfKEIAVoBOaw/A+9CsGnPVPHDZ/3hlZkJGZXQcb0xZ3jC7bz9eT1OXDYDmkK0vJe0dLydgmxs1x1UwvwdFgi7IMPg6Bx+/FyCi8iiIUNcosK/rSsVoxg0hTyJDYE7gTA4ZEAXAzHDW4DEwudI8cOiIW7M2QPJqC1gqUBnMe2AUKAvEfkDOkAA6K0pWgE4gFxo9dBpXQqBPcKXgMnDv5RO9QZhjYHUQKjAYLATAyrCLGEDw4cwnQIogeBhbGi0oQ2

17cMACPxBncKyYaeBY8N4whPDr2HV/RhgvsxJAlKhc8LCQEPCU+idAosAI8K2paPCo4Grw4nCccI0QJPDfcNTwr20pzEkIGcws8IdUbOAW8PzwowBC8KYAYvCvdlLwlKhy8IMASvC0AGrwrHDa8NZQevDfcM9AgPD1gCDwk2A28O3A0xhO8K0gSPCe8I4APvD48IHwxPD4gGOAYfCEGDTw3uAM8InwncDs8Onww/C88JvSAvCYjgXwxfprUPYg19

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
```
%%