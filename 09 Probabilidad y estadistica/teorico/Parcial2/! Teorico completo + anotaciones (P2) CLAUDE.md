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

"Independiente de p" ^ULxn1bpT

TEORÍA ^8TBWxmkR

Caso A, paso a paso: IC para μ (σ conocida) ^csnmUg0I

Sea X_1,...,X_n una m.a. de N(μ, σ²) con σ² conocida ^KBBkj3Dz

1) Pivote: estandarizar X̄ ^AGeYsVtA

2) Buscar a y b en la tabla normal tales que P(a ≤ h ≤ b) = 1 - α ^ya7UqAKe

3) Despejar μ de la desigualdad ^Pz5uBgI0

IC aleatorio de nivel (1 - α) para μ ^8pgUKP0e

Es el intervalo SIMÉTRICO que da este pivote, y el de MENOR longitud (mayor precisión) entre todos
los que se pueden construir con él, para n y α fijos. ^p3W6i7D8

Longitud y tamaño de muestra ^EoJ2oHVS

TEORÍA ^WFAnB5JQ

Caso B, paso a paso: IC para μ (σ desconocida) — de dónde sale la t ^swMCHmdB

Sea X_1,...,X_n una m.a. de N(μ, σ²) con σ² desconocida ^dFn6h0u3

1) Pivote: como no conocemos σ, se reemplaza por S ^OW8er3Cn

2) Buscar a y b en la tabla t de Student (n-1 grados de libertad) ^k1MGcqag

3) Despejar μ ^2fYXEXcs

IC aleatorio de nivel (1 - α) para μ ^MmPtRgxn

Por qué la t y no la z: al estimar σ con S se agrega variabilidad extra; la t tiene colas más pesadas
que la normal para compensarlo. Por eso t_{α/2,n-1} > z_{α/2}  y  el IC con t siempre sale más largo
(con el mismo x̄, s = σ). ^Xt9QphdV

TEORÍA ^zSJiQAWk

Caso C, paso a paso: IC para σ² (μ y σ desconocidos) ^MABdtjqT

1) Pivote ^xAtGNOvS

2) Buscar a y b en la tabla χ²_{n-1} tales que P(a ≤ h ≤ b) = 1 - α ^9gWTD2os

OJO con el orden al despejar: el extremo INFERIOR del IC usa b = χ²_{α/2,n-1} (el valor GRANDE) en el
denominador, y el extremo SUPERIOR usa a = χ²_{1-α/2,n-1} (el valor CHICO). Queda invertido respecto
de z y t porque σ² está en el denominador del pivote. ^w36IVlzY

3) Despejar σ² ^uQFYEZZ6

IC aleatorio de nivel (1 - α) para σ² (y para σ, con la raíz) ^OHXyUViy

Tabla resumen de la diapositiva (X_1,...,X_n ~ N(μ, σ²)) ^0Jqcic1y

TEORÍA ^eCz42WKW

Caso D, paso a paso: IC asintóticos (muestra grande) ^HfhURIEM

D1) σ conocida (n ≥ 30, vale el TCL) ^iuOi4n2I

D2) σ desconocida (n ≥ 40) ^poaaghtn

Por el teorema de Slutsky, como S_{n-1}² converge en probabilidad a σ², se puede reemplazar σ por
S_{n-1} sin cambiar la distribución límite del pivote: ^vOTxmaf8

Diferencia con los casos A y B: acá NO hace falta que la población sea normal (alcanza con n grande), y
se usa z en vez de t, porque S ya es un estimador consistente de σ (no hace falta corregir con colas
más pesadas; con n grande t_{n-1} ya es casi idéntica a la normal). ^D0RZALfq

TEORÍA ^59aqx6XN

IC para p: de la ecuación cuadrática a la fórmula simple ^X7jMKUIf

Partimos de la aproximación normal (TCL para Bernoulli) ^e2DHFDDO

Planteamos el evento con el pivote; al elevarlo al cuadrado queda una ecuación cuadrática en p ^238iwSNC

Las dos raíces son los extremos del IC (de Wilson) ^OEBfz1Ey

Para n suficientemente grande, tres términos se vuelven insignificantes ^cOKrlgwD

Desechando esos términos queda el IC tradicional ^U8wxhQYw

OJO: la diapositiva de la materia tiene una errata y escribe "n p̂ ≤ 10"; la condición correcta (y la
que se cumple en los ejemplos resueltos) es n p̂ ≥ 10, igual que n(1-p̂) ≥ 10. ^cbElSQfF

De dónde sale n ≥ (z_{α/2}/L)² (independiente de p̂) ^jQmYmCtZ

Con L = longitud total del intervalo (L = 2E, E = margen de error): ^iIow4f7f

Por eso no depende de p̂: se usa la cota más conservadora p(1-p) ≤ 1/4, que da el n más grande
necesario para CUALQUIER proporción verdadera (el mismo cálculo que ya tenías en la ficha de arriba,
escrito con el margen E en vez de la longitud L). ^gXtW7sKy

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

c9e70c636f7f36ed34166dd0205f1343f656499e: $$\bar X\sim N\!\left(\mu,\frac{\sigma^{2}}{n}\right)\qquad h(X_1,\dots,X_n;\mu)=\sqrt n\,\frac{\bar X-\mu}{\sigma}\sim N(0,1)$$

2b29f25d691b83c9b010d51b88c757b73f633485: $$P\!\left(a\le\sqrt n\,\frac{\bar X-\mu}{\sigma}\le b\right)=1-\alpha\qquad a=-z_{\alpha/2},\ \ b=z_{\alpha/2}$$

c321be645800cc67be5c3d4e3eee4cef66a5f7e8: $$P\!\left(\bar X-z_{\alpha/2}\frac{\sigma}{\sqrt n}\ \le\ \mu\ \le\ \bar X+z_{\alpha/2}\frac{\sigma}{\sqrt n}\right)=1-\alpha$$

66b126e38e09e22ee7fd934187e83f23c44bf91b: $$\bar X\pm z_{\alpha/2}\frac{\sigma}{\sqrt n}$$

4dfd60e861850e9d6403c5031a9ecd1bb3356ac6: $$L=2z_{\alpha/2}\frac{\sigma}{\sqrt n}\qquad L\le L_0\iff n\ge\left(\frac{2z_{\alpha/2}\,\sigma}{L_0}\right)^{2}$$

472f15595a3936e3b4d84e337e3a479a1e5213ee: $$S^{2}=\frac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^{2}\qquad h(X_1,\dots,X_n;\mu)=\sqrt n\,\frac{\bar X-\mu}{S}\sim t_{n-1}$$

d1ae019e07e0d56a9029cc54c66aef308bdfc599: $$P\!\left(a\le\sqrt n\,\frac{\bar X-\mu}{S}\le b\right)=1-\alpha\qquad a=-t_{\alpha/2,\,n-1},\ \ b=t_{\alpha/2,\,n-1}$$

caac8b0e6d1ecb5dd738d80d149178dcd00b79db: $$P\!\left(\bar X-t_{\alpha/2,n-1}\frac{S}{\sqrt n}\ \le\ \mu\ \le\ \bar X+t_{\alpha/2,n-1}\frac{S}{\sqrt n}\right)=1-\alpha$$

7c905bae372f20ee8fef5bd85c5bec6cc4a12285: $$\bar X\pm t_{\alpha/2,\,n-1}\frac{S}{\sqrt n}$$

46804639c93e4c017b5cd026f1de8eac79eea1bc: $$h(X_1,\dots,X_n;\sigma^{2})=(n-1)\frac{S^{2}}{\sigma^{2}}\sim\chi^{2}_{n-1}$$

246c4ccf2880c34d611b368c8d99a472c0488412: $$P\!\left(a\le(n-1)\frac{S^{2}}{\sigma^{2}}\le b\right)=1-\alpha\qquad a=\chi^{2}_{1-\alpha/2,\,n-1},\ \ b=\chi^{2}_{\alpha/2,\,n-1}$$

7cf5c2a3b894b6a2e339ef7363c32ab47ef2c5a6: $$P\!\left(\frac{(n-1)S^{2}}{\chi^{2}_{\alpha/2,n-1}}\ \le\ \sigma^{2}\ \le\ \frac{(n-1)S^{2}}{\chi^{2}_{1-\alpha/2,n-1}}\right)=1-\alpha$$

a6bff4cab4a88d064bc58a3fb736c6fd454d2935: $$\sigma^{2}\in\left[\frac{(n-1)S^{2}}{\chi^{2}_{\alpha/2,n-1}},\ \frac{(n-1)S^{2}}{\chi^{2}_{1-\alpha/2,n-1}}\right]\qquad \sigma\in\left[\sqrt{\frac{(n-1)S^{2}}{\chi^{2}_{\alpha/2,n-1}}},\ \sqrt{\frac{(n-1)S^{2}}{\chi^{2}_{1-\alpha/2,n-1}}}\right]$$

0d5bebbd2bfbfc55511dc95140c7ec4cc0b802f9: $$\begin{array}{l|c|c} \textbf{Hipótesis} & \textbf{Parámetro} & \textbf{Intervalo de Confianza}\\ \hline \sigma^{2}\text{ conocido} & \mu & \bar X\pm z_{\alpha/2}\dfrac{\sigma}{\sqrt n}\\[2mm] \sigma^{2}\text{ desconocido} & \mu & \bar X\pm t_{\alpha/2,n-1}\dfrac{S}{\sqrt n}\\[2mm] \mu\text{ desconocido} & \sigma^{2} & \left[\dfrac{(n-1)S^{2}}{\chi^{2}_{\alpha/2,n-1}},\ \dfrac{(n-1)S^{2}}{\chi^{2}_{1-\alpha/2,n-1}}\right] \end{array}$$

0df7a636609964e258c06a5bdcd4f16d1ade3726: $$\bar X=\frac1n\sum_{i=1}^{n}X_i\ \approx\ N\!\left(\mu,\frac{\sigma^{2}}{n}\right)\qquad h=\sqrt n\,\frac{\bar X-\mu}{\sigma}\approx N(0,1)$$

f55b2af32dd77e058816804808ff0281a252ab43: $$\bar X\pm z_{\alpha/2}\frac{\sigma}{\sqrt n}\qquad\text{(IC aproximado para μ)}$$

c4e038d99809a88dab1203973753a83b3b30d7d4: $$h=\sqrt n\,\frac{\bar X-\mu}{S_{n-1}}\approx N(0,1)\qquad \bar X\pm z_{\alpha/2}\frac{S_{n-1}}{\sqrt n}\qquad\text{(IC aproximado para μ)}$$

baa2970032bb12d086b15214035d5f8e5c333cf9: $$\hat p=\bar X\qquad \frac{\hat p-p}{\sqrt{p(1-p)/n}}\ \approx\ N(0,1)$$

485d764bee7cda9c0d45be616ccd0c756d336ee7: $$P\!\left(\left|\frac{\hat p-p}{\sqrt{p(1-p)/n}}\right|\le z_{\alpha/2}\right)\simeq1-\alpha\ \ \Longrightarrow\ \ \text{ecuación cuadrática en }p$$

64908de759039ef1eb544ec09106918672d52801: $$\frac{\hat p+\dfrac{z_{\alpha/2}^{2}}{2n}\ \pm\ z_{\alpha/2}\sqrt{\dfrac{\hat p(1-\hat p)}{n}+\dfrac{z_{\alpha/2}^{2}}{4n^{2}}}}{1+\dfrac{z_{\alpha/2}^{2}}{n}}$$

4c01f48175d3154907702611cfac9914072eb604: $$\frac{z_{\alpha/2}^{2}}{2n}\ \text{insignificante frente a }\hat p\qquad \frac{z_{\alpha/2}^{2}}{4n}\ \text{insignificante frente a }\frac{\hat p(1-\hat p)}{n}\qquad \frac{z_{\alpha/2}^{2}}{n}\ \text{insignificante frente a }1$$

405da10975b959f9a4873cc7d777300877acf828: $$\hat p\pm z_{\alpha/2}\sqrt{\frac{\hat p(1-\hat p)}{n}}\qquad\text{válido si } n\hat p\ge10 \text{ y } n(1-\hat p)\ge10$$

71f1705f624c7be969315d1b14a2f6dbe63fa32a: $$L=2z_{\alpha/2}\sqrt{\frac{\hat p(1-\hat p)}{n}}\ \le\ 2z_{\alpha/2}\sqrt{\frac{1}{4n}}=\frac{z_{\alpha/2}}{\sqrt n}\qquad\big(\hat p(1-\hat p)\le\tfrac14,\ \text{máximo en }\hat p=\tfrac12\big)$$

cdc2b2dd78bcbf9e346e943beaa308b4307615c3: $$\frac{z_{\alpha/2}}{\sqrt n}\le L\ \Longrightarrow\ n\ge\left(\frac{z_{\alpha/2}}{L}\right)^{2}\qquad\text{o, con el margen de error }E=\tfrac L2:\ \ n\ge\frac{z_{\alpha/2}^{2}}{4E^{2}}$$

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

1208c725e19ffef50e20dffeba854685b6f55936: [[Pasted Image 20261019082240_326.png]]

65a375d7d2abdfce01e8db39a92ce3b68521e990: [[Pasted Image 20261019084111_880.png]]

e2ccfbca1cd0f3ab33ac4c8b16be0b3fc5a4df1a: [[Pasted Image 20261019085232_551.png]]

29001087851989439c91045d497d8f1448caf48b: [[Pasted Image 20261019092702_575.png]]

9de749aab66701f748728d9464369997bebb6366: [[Pasted Image 20261019100313_699.png]]

f29fc33c649b81c16b9ac63d57211f3f3dd86e49: [[Pasted Image 20261021101836_609.png]]

%%
## Drawing
```compressed-json
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

R8ijwbFKM4THDCNgxvBD0FW9l/UAHIOa1pHlj/aAAcRBJQqYRqAE2AGUxGS2sAljDTLDYwpKBOMPEabjDJTF4wiLleSAEwl3AhMNYwiLkcwE4wzE5JMMOFU4BpMOFMY18XcF6g0b8Qbx8AsGCHnwhgsghT8EwAB7xYGEkAaoAqsyn7EM1j91mgwyw+CHrgmjgIwmW1YYwsNCg3O1cQ0K2jSxCLH3wHbQ9X9yH/FDcTRzjQ+CCDhzsbKgD2CTZIGl

402jn/RAVzyjYMfDD1czebUJCmQJ7Q0xhF0IqOAdCtDCHQtdD60I3Q1tVx0O3QttCPmziw0tC+0KSw5dCUsNXQw1R10I0QTdDjVGywqdDcsObyeLCy0MKwtVgV0OIAYdD0sPKwzLCt0Ou0B99d83YvZfd/+24vbpdeLx8vJ1DtMI7grIxNwDWAVoACNRRQencJlz1vaAxGkEFIWtQ1ERHsXGIaOUYKLjAosDwaQSpAbBfQ7pI3YWihdYAvfAUIZb

500AzASY1IMJxgp/drEP8/IV54MMcjHzC0Nx8xTZB3IyadJq4rgIPg3x8MyypIOvxmAK8gu4C7dy0nOWwENGw0PH5Pg1Q2LpYMwENzGrdUNhkyRIBYqgPtRFIhyGGRG09pAKSg0A4UoJ4wxpBnRDWAGUx7gE+sZCkMcOEw1FYxMIXgQXhjgAJw8Ow1AO+Q04BG4FpMEyxrXApwqn9UoJpXZ7JacIXgeaCKUDUwyWCNMMbHXwCNt38AnhRCAFaIH4

AfKEIAVoBOaw/A+9CsGnPVPHDZ/3hlZkJGZXQcb0xZ3jC7bz9eT1OXDYDmkK0vJe0dLydgmxs1x1UwvwdFgi7IMPg6Bx+/FyCi8iiIUNcosK/rSsVoxg0hTyJDYE7gTA4ZEAXAzHDW4DEwudI8cOiIW7M2QPJqC1gqUBnMe2AUKAvEfkDOkAA6K0pWgE4gFxo9dBpXQqBPcKXgMnDv5RO9QZhjYHUQKjAYLATAyrCLGEDw4cwnQIogeBhbGi0oQ2

17cMACPxBncKyYaeBY8N4whPDr2HV/RhgvsxJAlKhc8LCQEPCU+idAosAI8K2paPCo4Grw4nCccI0QJPDfcNTwr20pzEkIGcws8IdUbOAW8PzwowBC8KYAYvCvdlLwlKhy8IMASvC0AGrwrHDa8NZQevDfcM9AgPD1gCDwk2A28O3A0xhO8K0gSPCe8I4APvD48IHwxPD4gGOAYfCEGDTw3uAM8InwncDs8Onww/C88JvSAvCYjgXwxfprUPYg19

8FEPffIbDeIJyQqcEt4DVTCkAjPnoAFDCvUJA/R6wWQl1gx2ZEhgs1KnwHMMSAkxDG4wEnVzDTf2uwzYCWkO0vJF9bl3dnBNDswCTmFssBxn8pULEeMHrYHRIEvxYA4/lAkKoQ4JCasU9gJdDGsOKwo8BjvUQXfusDkI9KRbFOCIawkxgmsIZRLMoBCN+bcuthCMNgLgixCJ4IiQiMeikIvnwgCJ7nDiCv4I17JRD5UzVfZFAdQE4gdTxsUGgIhA

jJcOQTaXDK3xM/YM5/ZSfVOIgyClEyNQ9nMIQ/BpC7vw0vMxtHX1aQ+vtdLw6QigjkcMCw2lQUIJEqLAQUtlDAezI8c0B/SZMz4LDg8ZCrz0joLD4PQJJA8ECxAAOGfCF32VB9APRML1IAZCgUL3eGQ+JFmDsYAyhH+jQQHb0BUMaIZECqxFMoQAAJIkDAyAI4iOJAjEBzUQ+YcnR94DBAtIj6dAyIrIjzWCFYG2IM0W74QojW1QT6Eoje4DKIwa

BjYEqI6oi8gViI+/U7swSI7IimiJSIkb10iLmEDoiSvlyInoiCiJAQIojO+kGI1ABhiNhRIyAd/yqIucC1CJ93W1DOgIGwh1DKXWGwvoDHwORQSOghADQYfAAY4CIAEADpD3MIp2E5cLNVfqcaaVOAsxDDIJ8/YyDNcOkVAmCiAOjQ8Sdgv2RfF78uBU5wo3Cr2Am0S2dr3nTQisxB1k0DCkIbcNebQjDKgAWHAGtHUj+VKk8sTGdAOlkP5hkydR

ZZ6kCqY6RYlCx1cPMRv25w/qDaQBlg8v9ICP8mUrNNbDngZoBPUMIKOl8XoHScY4NfUJZfZJ8gTVwIHulRygMghD9id2XPdBDTIIt/I3pbHzsQ7zCHHz2gvzCG3UzAdF9lCk9g2+gLMnaGcAwwsIPtJU9w1yt3fxC7h1YI3NCEdxUQmjJYGGJARoAt4CMACgAiwAHg0wjJDXScUP45hUBNGuQ28Af9HG87Vwyfdl8dFCyfXGDLH1tgtwj23xXgzt

8rIK3PJ7DBzyL3RboyXmMSbyM/KT72NEjY101LLMEfEDAQMJBK+lv6UixUh2TI2fpwEHTIxUZMyLFvEBAhqFzIm/p8yNIYcWozny93XrCeD2vAjJDbwOMXL9c/LwGXcAdeQxuANmRegV3PT59OSO+fWoxOljRg9pJB2mB8OFIdgXLYE1Ulh3ZbRSZzHy5fOhsC4M97YU9Y0MewpPF4y3F9Nx81SOvNLXllJxKA0hCR6RUDeTtrgKZg+vdz4OiIxo

pdCMqACgBYGCmbYgBApUHPFRtk4NLYI2dhSWFcPZNM4Pg/R7dzky5fSE15xyjQomDsEJJg8gifVwEeNRVvESrgkr04lBKcbP1ESKiUGR0s2kZgkZDIiLGQr38I4NNInEoEgCKIzcAwphmw1e8DXzfRMzd+yNNfTFM+TUV3Vfs8U1V3KxCIIKII7XCcvRCXHIDvCIAo4Ugk5ne6MekEtw+w7DDqZRUEbYBtAwPIiA8jyMQouNUWmwP/HlMpphMJE0

0BU2/7J99uD0KDO1Clb2PQzN8dCMjg1Z8zwD2ARHNNABpfIc8kBmLfaQ1hSQg3H5dztwqZZkha33gQmzwzYL7/NXdz7woo9wiSCLaQim99cPFLG4Ajh23gxTp88SqiZq4zL398bVNYKNPgw8ioiN4o+LUr/wnuTWBCiLQjKChhbwU3FYh1wLq+Ld8N/3HuPBgAqI2IoKj0WBCo0VgwqI6EYwlnvT8omKiZ+l2Q+KiSmESo9Vph9HCotdRmIKduHr

DJHz6wzy9ziM//E9C5KOQoq7wghFY0Fi5uxyqee8iuMnoWJ8jSoh5CKbR6UHwaJ+53N3tXWeD1+0Q/CNCX92/It/cNz1DI7t9bkRuAS0cIv00VZNpduRfrTE5wBCugzyjuKO8o3yDjAwecGfIkAkf6Iahk022zbaiiyP1gHNN5ZQOolMiAQGOIzi8NCNAI7+DwCOyQ51CYCQpATcBI6E1sAN13OzvQt3ETHzsyJGF+XCwaTaRX7h2CT2Qq1BGMNM

tsCTEZB7oohHZMV1J8nF8EabRktEIGQA81cLWAjXCzKOn2KUiQSJ/ImCDqrzggt19Vaw6KdyM9DlU6Cx0wsPaGSkgKgN+wl0d/sOcPPyDkUBHAEIA79h4dGoB6gDJOZhMoG29HIch1kVNMG7oXcF3aHYl4BCYwj15QnizgLzMiUiodMlI43iQ5I+onVlQALSAq5kodCOBeUjFovN4w3g40BERFNDWEbGs0HVJDfIAHIGoALSAjQAGpWtFZWFVQ0n

QPIEjsNchi/2VXDTZVVzL/Bmt+fw0/RmRWgFgYLSBSAFgYaoBlABvI+0izUl+ogbla4wHI2vZhMk+/Oc8vK0Ro278a/QH/MoU7HzlI3aD14MVIg3Dxlxpvd9h6giaCbDEXNhGMYN8IiK8ohCj1qPPTE7MTwC0gawJH4l7iTQJIMhwCEtDNi0wQA5hAWBAsJwtfdgQzSi893xEYOwBQIGPOGo5DqLuCeujRWHyALxBSACNAOUCAIHzo+IFA4mLo4O

JS6IVRcujHSXlYYlhq6MdwxCEq4i07DWhG6M0AZujuIih7M6iG0XfPTuju6N7okT9+6ILoiEDn4hHokmgy6KiLCujt/yro+nseGDrojejcRlTgJeiJaAVQzKihqHLVeeiDKC7ozWAe6LPA8Sj3LyuomulZH0uIiAj7qLU1ZIBZwXoAakgHIFUo1e8HyIGlX2ix4LInJDxcIgEDYCC8y0Go6DCvyMLg+ci/yNqvWyiupz8Inqci1GbYGbMsMPlfTW

NmkmzQ8mjbgKfnKmiNqNRQXm945xSo961QqM90AqixzRFvJhj6GN3Q/cVlexffaR9f6MUQ26jegKidb98yCHu8fQB9CP4dFe9PaMiJX6jvgTmRK3tTcG5cQxJ7ymxvQyiyoGMokTM3MJyfNBj+2SLgoL9YIMcQ8KtcJhuAT2dKYPYJZ3Aw1Xg1SCjxtHdhZzhXw3CIwFNM6KuDO6CJkLwLSdFFyAjRB2BZaOoATeJ/YmSDQAIE4kICLfx3Il7gQZ

gdSxakViInA0L6AqiiUTsYVoACAFULd4DNABtYWpBBmDU0XuBzp0kABZDNAEunLlFztEYPDFDz4mGPJotDCz8YLw9x4DSYh2BMmNP1MKgm6LAuCCsFkKcDc6ctIENtUCQp0T8YAlIiUm8YsuJfGKECMZ9N/BDgHCQw9FCY/WhwmLaEKJi0i1iY8kBPiwAgRJiogGSYhBhUmIWQjJjzpyyYnmccmIA+FKgDkLYYSI8AS2KYs49smC6IdJjKmJWoGp

i3kDqY86cGmOlovC8QUVcYgVEPGI6Y42IfGMCDPxjemMMCJ11gmIQYIZi3SgFaUZiUqOiY1AAJmPiY6ZikmPkJE2AFmMOY5ZjsmLl0dZiLWE2YqlgSi12Y0piDmIqY5ZiqmMaIE5irDDZ+epiFkKaYi6j5bw6A9/8KqO6A/hjf4Mr/HhRT8E4gYS9wDjkbBv83vGq6Y19zUhwGC3BbQUMjAFRQu27/FYDuSyGo7ed0GLuw6ijsaPIAg3D4b1Qw46

D9BFXhMH4yXksydOj7GNWorOigkLjXdABsyKyoi+BDAk+5aW9IqIkARVjrGmGUYiDVWPpZWN8NWLio5VjAmN1Y3FiD0L7nQliZKO0I/DMaqMxJIIQYAHogNBhxcNC9VOg55xgY9FMKWipJLu04DEf9A7U1GIspVBjXCJ0PDGiwSL0Y0f8y4IoIiJcTGNpUC4pgbCVKXw4zGNVkDyiQ4PgoxxiL4Pi1U4VagB1AdogR4Wp0aH0mgKNRUnQUUAAASd

fAU/BbSJk+YXxH6P1gY8A89B6xD2BJEHpRERhZ0WAwEhVlYHnoKti/EHwfcB8o4DZ/EoFNYAFnEVpGiEGYKoj56EDDc7ReGHJAT2AuIVIgbIAbhS6IbtEv6U+xNejn6NWIofF76PnY7vhO4GgODgB8IRkrXCtW+D8YQJow9lrrAIJ7YEGYEDIoAEmIZWB8gElIVzgeUGgML4R/YBpXDkwIAAbY+OJzABNgQJoJGClmKcwYLBa7QJByKECad8soIE

zY7NiTsyl0Gb182P6IYtjS2PLYhlFK2J2o6tiWyi29M+J62PHgRtiAkF5AIQBW2KLwDtiVaHYfbtilaC0Aj+I+2NxnQdj3mJNgEdi1QDHYz5tJ2MNgadi44EqgAnpB0UkQQZ1EOPbo6+i12JbowdFN2OcQKOBd2JsiPh8uKwNlI9i0+njrBFEwkHPYnJgr2MNAW9iO5XL2E+Un2IGHIDj0OPfYsQBva2/YxmZf2KPw+fpnGCA490kQOKzYnNiION

iQKDiN0Bg4stjT8ArYuC88OJrYlDinYjQ4z1FpdGbY7DjsmHbY9jj8OLAfClhmAB7Y4ji0S1I4gdivdAo41AAqOOqAGjiJ2L8QBjiJGDnYljjx4DY4tuj16JforjjuIh44np9t2IE4nCtR+EVAQ9j0hBrrVCAJOLPYhBgL2Jk4m9inqnk4h9jJ9GfYlTjfRDU4z9jooElALTjCUP/Yhfp9OI4YnO1n3ykfT+DrqK0I4ljT0NJY5TxckmwANRBOIG

jGGlj/mn4GChsGWMk4Eyx2J1t7LUpo0CQYgaiCbzQQxeDEN2Xgp19dGIXIm38lyMeXGm8syGLUFlAu83L3eV92QgvKeS8EyO8tDbNTbnNgSEDnEgGIWUZ0/hu4k0DvEnu4gfpzYX1YvvUnuIk4l7j++jP6U1juGK643hiwCMdQgBiRsJdQ4bBMAFqATiBNgB1SVZN8pxmg1QF3alBnKbiVpCZhJU8oFjSGVXDvSPUYggjyKK1wiyidcNIImnd/yJ

w/NsiXsKuwXf5fDhQ0eZFz+zsY4NMHGJiHNNjS5Wu45sCJONFSDCwpdCzgWyA9wExYGUB30JnLAYcBeNDDGZ0ZRje4jRBgnlUAVQYN0BEoVIjHGgl4/kZ/WWNoFRhfuML4KlhPSiZYWxoJzUqgBXjJxHeAi5CmLE0gA/I3gi67RDNc+HiBOwAb4CjA/eILyyXIPbEBKLZFADjbuPZ4k7ROeO54kwYdZRpXX+ln2KF4wsMReK2GEOAl4Hl4qXjSdB

l4gC8I7W141QYl4BnA17iz+jV4+dF/8MzgIPjTBl14gCB9eIIAQ3iL+hhoZWBgMz3oi3ipYHXA63immFBGXHsb+id442jx9HT0LnjUIF5401CveMF401DfeORGUXiz+nF4zgBJeNMGaXjYqFl4lRgk+KPAKPileNtrWUY4+I14vJpe+LdA5UDy+IN4yrwMISz403iDInLVS3iC+OsYG3jNmE/o5Cd34IB4+RCgeJuokHi7qLB48l9KiFaILeBzyP

wAeq8w3XaHCN1U6Cy6WRjFoNGNLvYnewnInHi/SPcw0+tYMMqvXlibl2J4rBiKCKw3YVicNxTmOXZnfzOAmO8VAww8MmimCL+wyhi7LzBXH1ov7g4TBHI3DBvZCa1EUjegVTxbKh/ARYkbyFBSXoxxYOpI4GCGx0QbJaENV2uIx59kUANSfc07cVzkNWDc+3UoyLC3vBgQvCj3WMBfUhsyGMeONmxGW2w8Kht3yOf4l7c1LnDovSUP+JLghUicaK

VI6Lc3YMZ3D2DJXwjQSnx1+XK9Of8rOFi0bu1yGJDnSmjoBK19M9CTM1qAVkAm+SOsagSmg3AExHjYDEYEgLsBSNt9InduBOhfT8jA2M8wrBCY0MwY3IDbKL+3YCj3YLb7RTovTAbNfQpiaOFWd3w/EOYItX02AONIxkjREU9AFkBsUEwAGABmgBcfNSjIpni+VOhpT2MEll8MU1SbLFN+TRng18iQIPnglbjASLsRKCDI6Pf3ewTaKNJ4mbCCgI

zAQcpsKMsYnNJzKmW+DLplBJX/FmDjyPi1fijo30d3R+DyI3d3HfMFpi/ohT8f6LR5P+iVZwEY0kt+ILIIfQAHIB1APWlQgAfgot9yHjiE2/0dKJswnfCptGaScjgu/zL9Bt8OWK6zJD99qzN/VD91uI8Itqcw2KcQwxiDdxmohOEtA0JfFhN6B3oAtvA362i9OnjlsxlY1NiGhNLlJmgnQIK+VABO0kKOWj8j/BdRO6h6vBeEm9I3hI+Et7EuP3

Z0MmhbXTyBf4T5WF8yIETO2LE/H4TyaGkQkoc2IPUIkAjt+J643fiBhNPIwWAt4HwATNiNIHWlKSMkYIAECyx1omauV9YM0HGrRGEGFRqSLZd6ulZ5HBoq1Ctw3Q529n6SfWDEtHb2WtgvO0qTbGDVgNDo2dMYMOBI8yDQSPu1eUiY6JEEg3DC9yjYsqVjsILoRidgBP9fcYwJSBwEWoSboNlYtgjjM0qAFH5XOWHIQRQcQRQE4nBQUmtjAR5DwH

RBfq9CvyHIJepsVSYwrIR9yAdbBz18hCKEAoRsAE8oN8g7yC2oE91byE3AAqiPROAAI2j9eIvIM2j33XGEbiIoqE4gVpQ9401gTyhaRBIBIJiyqF0kB6AeUi6/AiQev3EkcwD7ANAkFD1MPTgABcQnbH9sLT0MQxQ7c4ktRAz/DEQCRBuADNtVxHDEhYRIxKZ1VYRBUmEiTShIRH5EeMSVRELEmKdjhA5ECkA0xML/avRMxKIOXzMLAKzsfMS2MK

LERMTjRC7EowDSxNeEcsTm23dEIsAvGUgkCsRyiNWoIHoqAUbE7OBpRC6EFD0WxLHE2jZk/1lXVMSvr3SkECQw20qjbMSJTGdsS4QCxJFOYsTJxLuEacSKxLAoeHMewgTE3x4NRBpEXld6xNJ6RsS4xM/EXcTaxH3EkTRLRBYoF090xNPErMScxKHE2yAi9H/E4CS7xNtEbDsDaHtErnD8BO8A3nCtMJIEnTDkUHaIG4ALyJhtZIA7SNMw3soDBM

0onf47oWmAmbIEBFrZAlYdg3sHd6o/N2W4rYTCCPx4oMiNuMFfUNjS4MOEyhYbgFUovbi2nQuKB44iGNKApjp2TDWiC7i7Q0rFAWhUdBJ0YIBVAGgLWvopJPLgGST9yE7TD7iIAEUk0oEJ0lkkw1h/uM64rfjehL4YjESSWOGgxmQtIDdFSog6eFfASohb0KIks/164MdMEdRyJLSdTHNOFnpQccdrZ2upT0h1hI7ZJGjfP2yEv3VdhMsozwi9cL

NHCgjjDxpvYGxJVlVkdOZRa2Taf7VfBMgEzLc1/yvPQMNzu2VtEOAkkJPABSgBmItQrOBfEGjrRogKanwAefCR8ipYVKTGvHSk5DI0HwAgBSgGxIhEWcwLqH0hNfJ5CMrQxQj6wniQS4AfAnP8L1FUAHsLTZBnABJQMqS0pKog/CFuuyeGJcC28SrEDcS8qGvSXABJAAvAfj9e4CsYNcVBmAUoAdi5YBe7CkBs4D9EDSA3mhgALA80QMGk+HRUpK

cLC6hF6OXo4RghP2saK/wPOIaIzRAHhTD0FKgrGHfZGfQDKBnSftiNEA7Aw21ypKG8MJCspI0iJXRcpPyklagipJKkgtco4B+kyqS/pKRjPSIgmIakwSFmpNEI1qSbkH/AdqSeIC6ksCtepI9wAaT3x2Ok4aSoKFGktB9xpM7RZDJxiwdAaaT8qEWoOaSFpOk/WXRlpLbFBBg1pNhAxSFAAi2krOAdpIDEfaSt40Ok3GSIZKkQZWAzpNvoi6TZP1

sCWzjwQOsAB6SxUXx0MEDXpPdDD6Sl4C+kr3ZIZJGk6qT/pJykl7Rs4GBkmGhQZIT48GSOAGVkgmTVZJhkuqTlKDHMRqSl8URkvd8FCJRkxFEOpPUYAQJupK3jPqTqgBxkoaSKpJVk50DiZKojLeMppJyoGaSqZPmkxaSNZJWkxmSyOI2k1mTtpP9EPaSDpMThIaTTpOl0Juj12JsJa6T6AgS4u6SJZJWGR6SLWGekwPQ3pN7SeWSLQN0ksqilPz

rI4+Z+hOMkgX9c9hRQLs8t4BuAegAU1Ej3QhjNKMlJJyTz92Aw9aJdwRCIhbj2WNWg3LRGJPFI1bichMwQ6CCQ2K246yDfvgNqJV0YBHJOB6NzcPlfOGQmCjLkKVj6eIeExninhIrxGj8I+IsoDMp/8iMTX5hbWDn6c6J58wMoTiBUh2xrfkYd5M+bSRN95L0oQ+TTomPkxI94kJcdLeTmsN36Y9Jb0gSom1hb5JiYN2IH5NPkouSayPSQriD6yN

U/eR8+IJuI1dpqUzwKV8BezBeIstgLLEaCcypqdj65DMgWTy3vYiI6OUYIzBMpzwzQGsl4PDysdsliBTPcEvxsBCqiaNoH+Iuw3kSuWPKvAL8rfwew7biJ5M7IovcmFXyKArgtyShsEdQRGxuAlQSoBOSkx4dkUG2Jf+sRyBaMSBwptHdqDEEhVmpIBDRIqnvKOvAoUiYwhyARTFzExTQYJIa/C4QSxPvEmPkSKWUUlT0MQxvE+Vd4JNg5P4l2KH

2Gds5Pm35qYEkywgcgKWiHICPEFwCGqkk1Px4JVzq/AnUb5igkq8SWKDIOT8hgAFsUiiQqR1sYJTZi+Qlg1CSpYPQk2WDAGJiFa1kLdUFAPE9I93sk9MAByCswiR0f0KnPPJlMeNqQvACA2I8wkaivMPyE8ajISJ81XoFCEM4VTV0zcL9g9q4sqQfVZeT7hKnfHijs6PNrI20jCQUrf0BkDxT6ZWAzSEJoTiA+qB1ARWCG2OXEBSgqZjBEN5ig5I

aYIxNrGjMAViIFKFZ+OB8qWDkiMfjuK3U4lKgFKBL+FFCLkJxoKCseK3FgPUUHE0n6RohB8kcAN/Eb8hblFwwfs0h5R7l3EBUYOc4I6yukzOAWWA9gB0ATeI6U3uAulK0gHpTOID6UmGTBlIGY2mTm1U8TXNN7uImUsJAplLn6LZio4DmUtvideOgrJZShQVWUvsx1lIWUhxBaRXUTM2IYaH2U4gsjlMDtdQxTlN+5c5Sb8iuUmQimlLuU1pTHlK

OgZ5TulN6U9Dj+lMn0E2SldB+U5AIP5OOcQIBAVPtgYFSwkFBUohIcRhfk/hBNlItYZZS5N3L4+FSoVNeFAC4dlNRU5fJ0VKQCY5Sg7QezM5T/uS3jJAJ8VLa4iztuhNREgyTgeP/ovfjMJNGwp0AKQGSAFkBAAKgAVoci3znqVOg8nCSUql5qT3IUx4wVhKcwv1ifJL5Eh2ctGMCXDBj8lKQwpvMbgDP4v/jFOnJpQ7itvgxmK+QQfg8gv5c/BP

8bDstAhMrFU4URKF5AirxfcMqaQnouVNmaPxBXDGCAEi96dFlk9oRZqGA4rvho1MeCWNSlmnD49vijwETUvj9RsBTU/ohc5LoYzNSDOOzUwsDdIkGpONSx+OLUqT9a4FTU6fRGdFK8Aqi1+LfgkHMzWP6wvg9KqNko61iNBMqAIRRKCA4uBIBMKPeohLoTVNpY47DzVJ4DbP0aaX6nbyTX1TIoiUjUaIuXIUTg2JFE6OjcEPjQuijqbylElvA00j

BAFIZvH2O4ms0GcCrqOHIT4OTYhnj1T3Xk8+1LYz7IDGQLRL0nZxVLOVzAQFJARy2AMeo0dWNWfKBZxlwEoG91MNpI6WCeJXCU/fi1NRRQLSAdUm1wCySIGI5Iu8jfxmKA1QEGBIWgi6EaCnV6RZFKdnvKGioMllp49ITkGLFIld4YXz4E2cjjqwRfIKT9hM4kgxjuJLDvcQTVyKkE+LwF5MIadesKhIS2OzcdsGqUxVtalLWouVjBGKGE5FAt4E

tMPYA7iOJjPQTrZj8jQwSRuQw091i1Dyxgx/iDGynIngTuX34Ey+9bBNHkgoSbKIoIh+9K4JcE/pNHil72GuMc8UmA3gwE708gimjeFJ/vSKksRPQAAcB/WhZAIN1SFXh47tZ0nFwouTSAuxSbO3AUhKIosv06kMr9UiiNGO2EmxDYu2DInYDXVNJguiiohIikgopLMiwFISSXLVwJSvZY+31IkNTk7wCEgjDgkKaEzuYY32EowSil/XX4ntTN+M

PQi1iQFJ4gzVTBNIgUmJw6eC0gfQBqgAcgOuTaS37zWlitSgSE3SjMoAQFM1CEaQm5ZPd+qOLdfuT1gJRotbjiCMJ4qyiaKJ00uiiSnxOE9wFb2E0SLu152RHTArh9KTuE3jSkvyNIrLT5WOvPWKgcgUB0IGMoXD+EnbSwqFW2PlTyyjUk/4STtIO0sFskRIvAlESeGLVUnfiNVMxE+Sj0AEaAByB2iFaAQ2peR1pLCKVWtM6STzSWXxQ0Nz8ZYg

4o8Wsj7yU0/Zs11MHkgKTRtKool19hBIFY2yiDQyPUiNAzsKWRB4wLh1JPQQVg4KB/FNi15J8o0uVNCUVGZO16AAvABZY0H01gbtIaVMLgerwidICyEnSydJ3iCnT3hNhkt5in5Lp094DQRFJ08nSIxJZ06nSusJYgqsjSqMAUqSij0PK0rJDntJtYyoBvEg2OZQAKQAcgOHjKgCzZS1JLqTtwNyD7cFAPcbidsGdMXtxgsQ0BHgMpz13BOGi4Nj

AEGnMSeB4yOu4Uvg7tG45MlNMoppCgSLMgraDhRJnJUUS91Njo2yixXxm0+Z4SXlpaLUityLVKQdpOFhRgcSS4hw1zY3k9yHWRa6RjEUVsdRYwwFgBbxVi708EcIRNbDOZMS5xyAzZDH80cN9QHH9xRBVOMn9t2wp/dOxKcOp/UcTMQwm3ZxTUxwqg5MQmf3o2VQDqf0vE0HQIuSLEakQ+twTEHPSa9IzEQnCzaMb00Llm9P8U/WjBUk0eadsUJN

CFaPNefzbPPwD/L180V8A6eEIAG4AoADp4AkSWTW5rKZVU6DHIJIZdvgrDJxcfBFazD0jOJwC08WN/iMaQhDch5MCksbTgpPaQybTSeI9fNDETrQuOE+hfX3lEqw8syHjvYxCEpKs0pKSbNKvPWPQmZKGYGxUb0gSOKxgujl76HhhCEXXAQIBGZgGaAXtl2LjsF4ClQK8YfABAgGNgIDJhGBxFeUVD0nAM3QwtaCeeJQJZdFJ0JkDfZIqwqfD3tF

VYUnROIhwM9vooICZAwkCGNyNUKfD69CW9bbQygQ4if/SijhKOYAyDn0QZTAzIDLW2aAzZ+kwhOAz/ggQMpAyWlP/yZgA0DOVQjAyzGiZ0CaoKDJhRKfQCDJGI6hAiDJbQkgzSjhNODsA5DPwM385IHzrCFQyJ0IYMq5jPwGO0lgyVRjYMoAzyjge0QB8uDOkM++BeDNs42AysmlrUlOwCABEMlAyhmAkM97NuDPWI7Wh2AHH8PAyqDObyQgz2sM

/wtQzkjg0Mr3Q/DIUMnQzdIgVUAUCDDLO0JqCu1JkQ6sjJKLOI/tSiWKMkvriTJJ4UAUMmTRF/G4A7fz1feFZpNM0oq/cN9Ic+H9Eraks1VbU6JKnHfrSUzUG05Gj7dNP02HSO43h0sUTEdIoI3t9PX1MPDZchMkqfRLS1Sj6yeywGVBD06acDXVZmQEAH+TBA06JchyIAMmTjYBwPUrUZjPfZOYzSu0SHBYyqxCfkqYyCIH/gWYy3YnmM5cRtjI

AUtIyCWIyMy1jeuOqo4dTX9G7PSQAYeLQQOBTCnDthPkJ+Lj21IMIXWLYVNNAtvjubaGUtwXs/TG9WUFN02EF7e1FMAHxMGhuOD9Q7VNXU4LTmJId0tGit1NGorICsaP0Y6SdGlgw0JOZmcH4ISnwc8RgQwd9xjNJfDEiJADx+RtRzZjBAfq9otEEUDQp0Nl8xEIiqfDx+M9o5xnEwQFJrRIa/aXVGxEnEtMItr27EWs9QJJPE5Ckdr3cnJiloaB

3Ic8SdFPzEnnJJdTZM7sBAgkQkfa9LiUhZJMR6Rx3IEkhaIB/IAIU5TJlMzsQVTPVId8cR9I6VMfS1twn0/nCp9IG4zYAYAFHhKLoDgNXvH3gWqI0KTNoYgPSsfHFJshTSY34g6IcHbHiNhOoU0LSdGPYkseSwyKXI8L8HKMYTNLpQ/gZvZyD5XwG0cgV4v1W024c+dw206LDKxSNotkBlwAtYJMR1WgFRQxBL2PmEe0ADYEWocECsAHTRLMj9mB

NgFMz4gXTMvSI0zyeA8o8T4jzMu6TCzLVaJ+TkzLJAcszvUT8kKszl4BrM3MzmAHzMlC8GzKQhU4zMM1F0srSy5LufCuT7aJ4UKytAKN1nJ4zptTbwCVsqeWWwjMgifBrUDvMXNhJiORjGODrYCS5GOgJWW9haCmV6Ez9Wsm32eL1bdKh0/ySbKU3Up3Tt1Jd03dTfMPFE2yi3vy900Ol65E6MR6ttSIWZBtQVtP3IuCj71OafcNTCJShMOGRIoN

2JWIQUfmQlRDRGTMVRbFVZZDrNR+1sNHtBJfT9iVtPLPSUwksWaXU36jbEowBNNAb0sU4eAHVOMUz3FNUU1nVYJPpHV3R6R3faTERMLOhEbCy1ANws+jYNVRzEejZDJFgk2iz69LzE6CSxTh7EfUzmHTQk8fS2QyzjLVTweMISbABMH0ibVoBFdMthMSZfqJfhPgg/dJME3gg9WxWVQOiqpwP03atfJIBI4bTWjMoo9oyhBM6M8Ni6KKKMr1SEYS

EyNkhMMKf0lyDscRvYULCIBI/01f8v9LjVCkBa4DCQKeB/gAbxI1RvKE8QUUFUAAKEWvUZ9TgAAoQ+UNUXQvoURwxdVrEXUXKONmobwGaPaFDGiDbOJQy3sWzM2szDYCMANrZlCT8eLKgI0SIwACA5AhD42KgE7ElgCOtnLNIPcIA3LPEQuWhPLIIAbyzfLL7rBvVArMhQ4Kzjr07EMKytlMQYSmoorJVGbJg4AFisk3ippL8QJKzuzJe0NKyLtC

jgPUQqzKu7DnQ1QKggKNSW52CAIwzWrGKs3BEyrOYQtSh+wMGtf8AfLL8suqygrNQXJqzXuTsYcKy2rNZqW5AYrO2I+Ky9iMSsrszO4BSs4aywgFGs9szq0Ims3KzprPys2azR4EHMsHNhzIuM8XSqqKHU/riaMmYAOnhZmDWAPUEbJNc01+ZSjJwo7Mg5LOSU0qdWoELUfvYD70wHHuSeRM5YrJTW3z5fViS9hL5Y1Eztz14ULuCk5hlIS6EgBJ

Yok89DEU6MHjS4zKafZL9EzOy0g+Sf5I+iGGgn3RXwiFTVBhxGfIsDKABzXtjRYGbCYxofm2/kgFhToiZssvDWbNMGdmyKck5sk7ZvSxI4nmybIj5swVN6bMFst2JhbJZsrlTxbPnESWzhthNLGWyBn1r1AXT4T1aAxE8bUJ6Ewu1DJKe08cyBcOU8OABiQEjodo1aTULfKdSmWTl6B/CZYhHUAUglzNJYXoxxhyLOOuQ7Jh4DZvY14VvcYugf4W

mySUhtlU7UGiBBcW5EiHSYTNx49dT4TKvMuDDndJIAhxCDhLo09EzKAL3PUOl6KhLZey1da0HqcDUbLNjM8adqbITM23DALKdADBxZrwpQGIRsTCukOBwoHHqAQGtsNiCEJ1I8AG1sB6wHOQUUpRSiLIxDEizpTOhocizFHhVgSizazy8CP5lxTM4s2vS0RBtEIxSyLM1M6Ghw3icUupVY4znOFr9lRB1MlMc3RBos3uz6NhlEfxSk4x4slkc+LK

NMgSyZ71NMsMZsACQaNgA2AHwKH7TIbMdMOmBvfBR4/TBm9geyaMiFoh9Y3G9fiIQ/Joy/JK0smHSdLJ97DiSEdIMs0nj8gJR089AGFjgEpL4mrkMZIuyfzJWovjS1RIAsrbSwUXJob+BVWimYbKhkLh3jVC5CwzG9WBk/6QtLDBzPbRqQWgtcHMgVAhyYGTwZBs9cezuoTBzT+lQtLOBKHKS1ahzcGTgZOhyok3PAo2zgCPu002z1VPLk7IzK5O

aNCkBHjWYATcBWjXZIxGD8k2dstUBeHHxbCloPbMeMAhpwA3l6RLQraXuAWyZS6BJCLw4BKi/MdYFB1gq3JgDPTPtU70ybsKk5JEzMaO000KS6KIOAovdXJRrZQSSLLPlfZ6ttuFp5WyyKGM/0md82YMOZGTI6WTVhMCzn7TgcZYlnM2OkDWxScGdAGKpOoWw2JWwRyCQs4EcULJtbO3MIAGxQQxZrWW2dJYRI6AXgbFBURFg7fr8q5SEABydk1h

p/HrdXr3cnD14Cz3lOOT1dFM1yYyRaKWXs6ERsUAG3IqMnViHslRSqoLr0HkyD7JVoy8T17PLCSx5cR0EgNMcV7ITEZpz8x1wsupyeTOpEUZz9hHGcmpz8xKmcnsR+9KPs0v8BoIZIiJSpwR1AZIBeiFdovzBZzMupcEANl1OhKLAhFUdMJpIwDEaFF2EmpkQAl7wZuI7zDat6ghHTASpJuLZUcYwfKluEojSBqOcIsOiBRMd0pOybzJTsi6sAzI

nkxCDejNleWJEj9nY0iMzSgNu6GWJS1AJMsH92YIYWYepDGWHddRZQUjH4EdRrijhARf4G4BiqXYAtVnR/erdknN3qSpyt7MvE6ENunIlXQqDjRHGcoLknVhA6TU5enI4szGsXry41IUzJaJcAoZzUx2xQISRZnOAAelzWXKpc5Zy6z2pHSlIfWXNYESApaA5/VpV6QwnvK2jVt3q5Y0y7aMtsmjJKiCgAQ4cxLyEAEzCk4JwbYKE4aN7IykkAdI

60pthmBJYE3ZddfzCIr5zzlRzg3mFoXytgn6EKNPhfF1T6FPHkyajbIP00iQTXBI+BVAs+jCiIWeTylMr3O5lMTgs04NTEpPssnxykKJuM9ABgrwoIG4AdQBISSTSDXPsrU3BZNLmEzdQYzMtfEUiGSTtcrmE83Odcwf9NNI9XYFyJqMU5G4BDoLTxECjAfmB+JyidKI404kTCBgVpYf1w3Lss+oSCdIT9GNyIAH8PeJBMAGGtSYTJGIY7cmkZhL

rYDNzq5F1/CeCG5ET3UwTHaQEnTISmJLx4kbSgHJIHHGy07LRMoXZcJKTmLGRYBDayHPFMPHQFSmyS7LPHMuz0SOCQ5+DG4XVYuuFb4NLhC9zDO3vjc9yH4OYgz3cSqI34vSTStO+s0czABWuM/6ycSlPwBABKiBgATYA4U3GXVe82SAW1LSj2tJo4AEEbzDadL9CbVMtfNYTe5PMRcND0bKE7Nt8MgLyEsai3XJBcyajXYOfMxYJxkh/hOX1iaI

gmO6ZD3NVPY9yU73VEzUtOEMGUFMoKixGxMfpZdC+cbVh5YDiaB5h2EMB4WjyqEXo814s8sWv6Zjya6zcYdjzPGEItfLTu3KEQmWBNVkoLRjzTYEE8+XFhPN1YUTzERNYg27STiJNspWc+hLHM4RyJzOU8fQBMAEXBAjko3HmbT8I4hP+0sdybFCJCDZsXwl5dFz9HCIZJfAieBJC0jBCz9Lh0vSy3dIfMigiK4ODM0OkFc3vUR/TSbNKA1Lp82V

JJRFyCIO1SPYgvAjxAWXQnwBms+7RMDnYAH2J6vAmIRhDq4Bi8l6y/tljiPcAOKyNiL3YUvKi80IB4wIy8vrYsvMS83LylVPaXFVT+HM08s2yhHO/cnIzlPG1wQ1IeAAA6LSAB3Nsk4KF6FlTobXSTXOfCTpJ2hWUY0hoRuhXUnUdzzIAc+1Nh5Mw838jItJJ449559PcjbBwJkV9grU0tgiO+HipUbxVE0ZDHhI7c6hjUpPBA/XjmuPiyLMNYUL

2dWxg7pKmkrMNbpPFk32sOKz5k/byoZyu8lC8ngANgKgI+N22UgyF9ZLuk40CJOKzgBShz/AOsn0NrvIeFGZ1UpOeA4Wg7ljCQKxgswyB8lYY8ZOnFDWgZeOfMACBFzEHMOxgN0ArU9FFJCJLAvd9ejgrUmdJvpLukg7yX+iO8n0MTvNZ+M7zwQIu8n0NHvM0CG7y8ZPu8y7y05Ou8v8olyAY3JFSNEyGk8EDvvL1RP7yhmAB88eAYfI4rZEZQfN

uWI5ZIfKhnQXy4fNAMxZ8u+KR8vJciLDR8gPRZZMx85QjsfMQZFFC8fMV7PIE9vJQvInzdONv6Y7yhUNO8uxhKfISsxnzl2Ml8u7zdfIe8pnynvMqgF7y9DOFU/SQOfPp8o0DeAhNA37zu+DYYCXy7fOB84Xyd/3GYCHz7YCh8wHzffNh8vmT4fM9gRHysLGHMeXyhzEV8tNT21N1lLHzVQMIRDXzZZPx8j6y9Ky+sm8DP3MnVUAcf3LIIRAziQB

RQGrIu3hM81NyMyA55SDzDCFSsPAYU5hLUZYS7POhMsNCmSXMc8yisbOo01dzaNPXc/GywgKzsxYJsHBbLB6xdpXjNNOh3sPf0rxzI3KcY7/SbmGGIDxgWADrCFo4r/ECYAjBNDNk3QDM2GDqAufx5/PuYTxh4M1FYIXR36PBdILijWAfTHYy5/LuYPVh700P8+PRj/NVoU/zZ6K38iryLnzu0wHiHtPRE82ydPLVcnEot4EwAZtZw3H7guBTq6n

AmVjpS1BEtNfSe1hFIOIlWKlrfKl5ZgJEqN64XNlYEu1cAiEs/RYlbCICpBYczzNhMxdyJM1oUwQSRT0QwqLTSeNcQyBzTKm/mZpkSENadRoxcbSGQyfyeFO8cmfz+FMqAdWxinCZogBY6WWAskIQbyFlkGTJhSDrwOzksCLhkHKlWTKIkJEM/mXwAL0Qb3XZBYq13RFMU7JheGAsUkqkKjwBoUT0/bA6csHR/xAJ1ZihDFOQpQChWfgvISeyPFK

B6D8QOvyF+WVzWrRCUnnD+LI5HVVyL7KDuXABNwH0ANYAdQFxCCvyWqKLUcGxbnM/WOQ9o2ioC8WtFuPOVRzyrsLwCwByCeLc8kBz9LK4k9EyukPICllMZSG9MSl45/1aSV8zyPMafSjzMtNpsrbSfx14QSBUW5RPAVhyl4zQAEShCULRdO2pe1mSARah5pEOwuc4sD0WnfbTqdNQjbdA8gqS1AoLJznyYPByj4xKC2Kgygunwi3AnXGqCn7wmY3

oQK+M+EFqk78SIRAn3SCd8goAgIoLugq74PoKPmQGC8fAhgrNvOoKt4waC42TJgoPALPzGqxz80uTkyUEjcBTSBNAqIwBougXvTiBfCOKMvi4uvNpY66xvArSvDcEv1lkaLMtSGmWApDyn+NCC+OztLIiC3Syogo88roy6KKTQ+IL/KWjaOtQLhLnk0oDP0IGyQYzEHLvU1eSH1J2889NhExkY/PFJzAUCr+M5kSlFH8RWMOopQMN7ExNQltgDgA

JC9RMUWCzDQ2AnkPIeS0DGiDeQoixntFxChTDqAGopDRBq1FCRCXyXc2yYShcCBEvMLMNSgqIsN+Vq/LWiIYLnjkzAKlhI1JLMulCZzH9gFFAAAEGtpPf4LakR+kGYbxpLkJnMRsD9fN9KSZprbSH4w21UQuUjdEKBfM5CrELV4Q0QRkKscPxCwkKEMgbNUkK1E3JCn0NKQssgakL9pyH0JkIhzAZCzHDeUBZCpeA2Qv7ADkK/cy5C1NAeQqhnfk

KZzHKCnkJhQtLkUULF5VxFLvgN0BR8yfQ5QoVC2oAlQrD0VULtOOHMDUK8yOCQAC9TON1Cr3Z9QtmAqoKjQoDCk0LA5DNC93DTgEtCskLrQpJCq0KKQs7XZ0KOAFj0OkL3Qs10YTDPeGZCi8gfQv0o5IB/QrMU7kKkthDC3oKBQvDCttRIwtuqToxxQoy8+MKBQplC+ULEjxTC1oBlQvm9RZo1QszCxIjSyJzCzC88wre4sR9O5xSM4XSzjLTfYB

S8/LXNIIS4c2ElU/BNgGtsqITV7yzmO0ye1mp8ejpnFy94INV7LW1/FGyY7Nb8zyxUPIDIoNirHK00mbzv+LoolDDmFJrfLlwkvlOhPczlqIRC5BztvPqUy8d+an9gKAA3HWhYSzoxqBQitCLwRNPfS1RkIprFbCL+zSfcnhzZEJK081iP3KOC+8CTgqwkyoBpAWFgQgB/D2UbQdzPOzuC8biCc2fC5JtJeGSJQbzpshb8wSc/wsjQnljk7N1wy/

TbHNJ4gLCB/NvsIKpb3AgDEIdRYgVpbTNhkKQc9bSqPNQczUtUpMmIvxgLDLzrT5SU4CGU9cSTwGQYQh8U7DFoa7lcQFaUlVgQfK/pOIjFlkOWFZZxdDXyYOsd/wf8LgsgdDxk67ieoANlVuZAAimU3o4jaO8ijLjRsBVGQAzIexRQllShmAvADYZUpJ0ge5Se+l3yJ5SZ4G6fPGSSwGy472tzDCa4+rVxONPY+PiT0mk4u7RV6P4Mjuj86wJ8zS

KNZIpqE3YBlL0igZjDIoxA3QyGNzMiriJ7YFsYKyLSotsioPyHIrETLgsLqBcim9I3Ir5kjyK3aD8YbyLoVMKYFFD/IubyQKL/9JCi/KLNvTWkyKKrIpii4lT4otJUxKK8SVu8z7yUopE4hDg8lz/YzKKT2NRRHKKWdNlgGTiCoqf6RLjViNa43CLX8A0iuIjtIoqi6lSdgqV0GqLxlDqi0yKVWgsi5qL/fNai0Xz7ItvyTqLb/274JyK+os+8ga

KDlI3fHyLsGDGikszwYsmi4KL2jlCi17sYZOYAeaL/fMWih5TlovCYH8A1ouSi0/ocuPSi3aK8uNu4wrjcouOimaLbOKKiy6KE326w2W9UjKHM9Izc/MoikxcHwNOCpuwuwBTiYkAd/GTcvi5DXNpYlkhHgqGlBRQa6nt7YWsBBmBfH+yGSV9Ih1z3e0LcvK4qNPP0mjTQHJiCoXYSUBVIuq5mNNswEIjDz2W83WMBcTOwqqJ64IYCuoS6lIE0wY

TqtPQAVi56AE4uOngelK5imK5TPN5irSkOIvRTWKUzBNMcx7BJYor7X0j/wpsEkeSS3NFPEgLj3ghAVWKMTXViz2zTU08/FGEFh3ZCOKtPHMYC6fymeM7cwvzkUDPABG0ZMlPwfvzohJYi1DTm5M2VQMVXTEL9UaU7aRX7fzSSKNtfO3ST9PCCzvz5Yu78xWL07OVikyZ4gsesJS1e9mwxT7IOSA+I+ELcdL/Mmmzy7K201uxF/WcdfuKX+3ulNS

Sh4pLpMSiitP3QsiK+1IZiu8CmYuoi7VTGljE00ahiQGaAIYFmIo2QDatU6DQUp2L0iVijekwuMD21PvMCbQtTN2L7VTg3cuLvbwm81zz/gv9MstyuBVzACmV7LA8Qo7jLhOg1ezIc6FD4MLzqP3jVEQcTYEhEir4jmCcvX3Z/4qO0xogoRKASly9pBwAS0/wmIP/jYqiaYqPCumLzjNnihsi1PybI4Q9V2nz2Ak9J7A8C56xbzF3ill8NERmteB

Z6kj30nAi+qJtcgVlfFwXgi8zhOww82Ui8lOw8++KfNQHAdyMqoi8OZU8hjKbuFIl8im1Tb+LnGLr6XSgnwBSoYDArAnyHFIdPYlQAAAA/Ab9EYw2Cq+M72M38ueVxwo7lPgAWU2qYTWA72KrYAqIHgHvYtYAGww9DT5Va+k9KYRKoIFES/fE9DIKHKRLZEvXfBRKNECUShDM+EFUS+jAO5T4QcvVtEr0S18JyuIMS8eBhEwzZNSTTEpESi1gxEs

QfcwNXzhkSuRLNYHsSpeBHEs2YFRK9EsgEDRK8WC0S6pgvEsSS+gpDEocSvYLyhwOC08LGYsbI5mKaIvp4ZQAYAFpZGQFOyOmg24La9ndqTdp53UoFcbiqTnWAH3g61A0DDxyzVUBaLZcsiQgEA2tUApZw96w/pxvYZnAo6k+C/1jL4sOrQUTrzMAindTU7J78vGyC7xzFSch3amVE/3Sm7lysLoxCBAESwHDQ6Flkak5Luh4qSL01SDEAHmj/QE

BSfqEzuNZOU5LYclZMwChspKCYnsJ6gFFM/QAvzH5MdOxfmVcUmikF4FK4uvwfyEBfTuUylSrHY0LwqF7tZ4RVnMVcls9Y82bHKDSYhXqAMKA4AC0ge/xE4KV08N1q6jxw6vxE9QHGXpLNKNhkbSlYiAG0YY147kEqKWlW8CmVVjpLMQGHWIkwNUnIChTOszMcgSKNhzf48+tCApRMtdz5kvygeqYueR/hD4ywsK1KDG8h30Ni1USEIpNiqAE4VX

WRLMA8fjH4GtB+yEh/EKBcmShyUa8BHj3aadNM9NJc+09bktZ0xsSewmYAdnJwJiWEZgByVXs2Uz0S9FYwjjCRTC4wsvTynJ/IR5KBxNFMDvAfmURZAnUIN1YwT5L8gCSAHXlfkt7tPYAGzwtops9wUqnvDCSqtJZih5wYFPrAJwL6AD9XTOKNkFYixHjN61X0zbUCGilWd2pVD3B0yhSvgtoS8bz6EtsQ8LT7ENLcgpSm832ABijRkiFjZl9AvO

g1OMgyCglILZL7L029UxgFQPBA1LE/yk1gNcU/tkfTQyBGiBblLOBSuPygRahZgWw8Uc5NRWhoaIA1RXwhTYQrDDkoLNT9kKExFC8G0sq8ZtK+tlbS0XReAGzgLtKEgB7S+gpkgH7SgGK8QHUYQdcqIznAMdL5rIecGtL8wP9getKXc1nSk1h50o2LRdKO0pXStdK7qk3S2tLq4B3Sw9c90qSIpGNkjJu03hy3/P0kgRzHtLq8v6yGvIBsrVUxDh

L8kwiOvO5iyvzSWGt5O6pNzLYgIWRAfERXGd5eqPs8kCCaEqyEjNL0PKzStiTV4JscvBDnAT5omEjq0GLUcypphLn/KywrrXlHTuKM6MRC/8zNtM1LJyzCkmiLCRKshzQABShe11DgTQBL5PtgSPpqTE4ywAIPzA9KAgB4KEwQFjKEAHnOdjLVhRuATjLuMpNgXjLgBH4ylKhBMryBRjKRMtoLcJK2MuzXGTK35P/yeTLLzEqyATKjzBySt/8Twv

HDH6zB1JhzJOLRDn9ALSxsADvRYALoPI7wPoweMG32cDz7UgDyfsZSBTgysnBGS1KEvKwYbEPBaZVVpGv7OBCahLPi/iLxks5zBEypktyU4mDgIocEhNDmoHqFXQpOyH+VC9ToNXP9cdZaXirSmATr5hRMP/ZzukhAOFUnNkijeS8b0Ac5UAQhyBvQQ4BrpD+gJjCSKReSv5ly9g0UlLNd2mAEfpyIelfEkkhQZ02AfpzHFOYSNqA+svJVevAfUo

Vctz1raPWc22iUGxEcwK56IAhAW8U9gBA8jeKDsHti/5p18FHWHwLB1DZZLGYLjkcwpICBJ3QyhdyfgsrihhLs0qjo2ZLa4t785DR7KPBcsMFjEl3JHRVVkviXdlRpT08Qzby8dKRCxCKNs0aAb88z4kyHE2BCgswYLoKx4B/aTTKu9UxFREB6gpB8erwfsvASf7K5gqBy/IKJMoOFCHLlAChywPs8gVhyv7KxMoRyzoKkcrBy1YVUcvRyhJzFPn

EfQ8LX3OLk2sj8krniwpKF4uEsiQAyYXogRoA3aO1wD2iZHOjuTMhI2n2AFDRAVHZsBkg8rF1/EroHsi6WWGz7jDvueZF32FJwdDRXUiC7B/YR0xtXZxzxYpAg/zcMMpaMn29/nPf44SKdoIuy6IK64t4ULAp6pgmtMLF7QXFYrbg/KTDc7hSjYv406jyfq1XabKl1yTwAKBsLigu6c1tYhHpo1zMPjDUWWepOjAtPG5KwKEU9IwLd7LNS7YB2XJ

JDcGhu9OgpFnCgwFDy7qlfhD7MWkwWcI5MM69AKBWY95CXyEHMFihBTIlMb5CScP7DMFLxsqVc1s8z7Mn05siaMlwklFB3nzyoD58qkpiuLfYiYi/WP3ws2nGrEpS+CFY0o8z5Dz5cSXgaCOpCG44xBVAmZxdvDjDqHjAW4BwCuOzodMvMiq8mUq1ygVtc0rdU1WtkgA3HYyzJs0HAEdNjb1LS28pz51c2TijfzNoynuLT3I1E2vB4BH7IPchG1B

vQEpwQYEPAaiV5rR2JfMBaKGhMKBwswDvZElzQR1SqekQ7GC9zJ1YpTAMS9UzN7Ir07ezjRG8kBFlSbj5Me1KoACycTSQv8sDPaQAk4xFMeJYFCBjytN4HoFgK15K5AsAoEBJwqDJXDjRy9jGAH8h9UupMeoBKDkBfCJ5sxNfuXG1aXITEfAqSxICoHHDLAq5/awKwNLCUjZzoUv/1bFBPgCLAZQAoHDwSt7xdwSbJNgwxyLwaJ2odwRK4Fss3dS

/C1NKQQEOygeS6EqwysLScMpDI5hK80vny+Oj4gtHscypeHF2lBYdFshr3CNd0tO8g1SL6MqK7dSSokEz+MPC9hAvjOWgDzCSIqxLJEs2Cj7UTYg9DHjIyBCGYYBcW9gnlFHy8kWMKnlonQLMKj+N+iHhAUPQxMvnOK+MafBWnJeBHCqrgR0KkxiHsN0LBzBXze25MYpvSHwq9lNJ0fwr2dECK5SA50nUS4RNwioLkqIq3CqIsYzL8WNMy7GMrWM

syoDKcSg0AfkMKQB1AbFA6O0ds0YE68s9MKywL5H4ufnLbqlwxR9D88VM1b8DlDhQ0a80gTKu3KBy7oQDkBAchwHXaPiKVcqOy8fLNhwJsZlK8Mv3UnD9kgBwYySKpX3cgyGloXOPPUoDqfAbNJuSlIrgilSKsgt7ihH5KgDRmAR4Rcu1sY6Q7gFiEVUAkfmnIenlZ6jpohFJ27Ke6WRkVUpfyiAB2aEoOcIqnkuNSpkLacL+ZXQKIegCoDiQF4G

+Km1LKdiSgUAq/mTyKxqknqlpMMEqSCvpMVIBRsr6g5kNNMMg0oSyYCR+AGAAxDigAN7TdXORSi/i3N1+nVQRVOhlErjJBBhQI4VZ1wS8/bAVRqxSAW9wZl1OhfeCtgXycT+4ssC32SOyJip+c/kT7v0mSgFzpktvMnXLAQrAcwOLjGPw82EjwFgkuc9S34oD0iZFwzRyy8HVDmXVIRoVktBHYXmjHXFtjA9p/KiCEInwm7IhSTAQRSCfykEc3mW

xSen5KDhTHNMd6lRA6IAqtAVHjRqkB1DpIFvSrBRtKklI7Spkw4AAOcOopfvSvkrPcRNwfyEl4AcAB9LKcjlzUJDrE+0A3hCeqRTCiqCSAQY1vUpmpIGDR9J5/U+y7Aumy3TyaMirtNmQ4ZG8SdeKIMrtiqDLxkRayHQElJRb/F7wmYUY6ABYV5yCC6hKL4rG8tXLr4raM4By74sUKht0n0SIy1HS0Zhc4GOLuEqclN64cMLf0nQqI3Pbcr7KDXX

rAVyJCKw71MTKsD22MjIq9zlogUIrVhQzXR0Ly9nyKocwpWnHK0sC7sXMDacqlDKCKgi55yuETP58i4mXK9tQtEoKK3xkNyqxoLcqyEB3KvYi9yrnK2mcDhSXK7NdVytiKl/zkRPU81VS/0s/8gDKyipmyqlwUUGSANY4bfAJK8ioUUscytfAp3IZgB+y3sn9lJUoe1EzmNAt0iSEyWoJ2DChpFNJBio+UXtYjnNGKlGAdKJG8iLK6yoriifKCAu

nyhDCISLny1srI2IlKwvwlRyaSagKeEqavDQoW3MtywVL8dJHKokyLyXxVPLpfoLv2Rox4QFQ0YIhmTkEUBzkZMlvJVUBINiYwo8qnkpXMKEqCdRXKqgrZSDpXaSqBxIZ5ZUiUStA0tErGCqmyyb9/yvI7NoB0KBefavKkNP1ckuRYn3uMBRE3WIC7LDSDKVAMJLwvrCWw89VS+1qcS2DpYqdUl1zCAubKyiq1xykpIqUDNMxfVNBJLUs4GUqoQu

g1LowR6lYqRUrE4vKK89DJAB4AVgr8SttiiICWqLS6G/iqaRt9cWRnKtSlIxsvYsEi7RjXXNd0+8ygQsWKiNLnBO9cwzT1Si24O3BOBLCwus0ohHmXWOKrcpQcgwq7NLERfVdKiGUAdX5DzWwo1iBjVTSq91iC4ttpEv0XPytfVGysmzLioiqr4szS2QrsbI6MkUqlYv1y3/iabxiRXQEluhccms1ZyG6HQjS9iq7i3fKT3MTIwwqx4tf7PlN3+w

Hiq6LDBi/7KmLOhMniketp4vKoiiKacvQSopLF4v4gUIkhAGh45oBbFxtMuEKcKMaCfqrPiPoKXbLsCPrfRBDaUqcHObl6Uu5Y/KrPKvmK93TEsrEEmiqzMlZTarpIQqDc1Zku7SmcbfLlIoCQ/Qrsgs1LBy9TEDQAC0pFizH8T+TcHOASuZhiarN2PYyJrPJqqBK0AyJqlZprmBWMnKiOgt7gG2D4EpIi2mLPrPpiw4LHqrAUi8LmjVu8ZoAbgB

zkbABJo0gYikqtuH+qll8YZDxbO+wwQuydb+yCKskKobT6yumq30zcMviywoTA4qcE0EK/DkSAakJZIpjvahUVvgtyrij4IvYqk2KOfCP8D9jwECCeJBF/ssh9OkgwkEMsNLz8QE4AMeARKCqIqIgZzCZsgXxbapb0OB99wAEYdIq+4EvMe2A3aui8j2qTRS74H2rGGGHMf2q8gV7QZOxHSQdq0OqNMvDq12qjgHdqjuAvatioeOq/arlxQorTiJ

QSvmq0EoFqzZzqTUaASQA1gFKeHc04FNBadDR8ujxeQtp+cvGSHYEDT1FJId87UhkuAHxRGiaSBxc+YzQGBRzw+yQFVpJR8qc8uEz8Atuwsir7sMKqxcjfvn/fQmzYo19s7WKkt0IaYH5Cryiqp9S/kj55BQhYhHCtbH4+yGukCPTooLgcdWxz2kUwBFJSJU0WBKDAQ1NK+3MtTIwpBMQGcHwpI4AE8u0pfKBRdWl1H4qhTElMzP9XyHQsrUzZdV

gYBUz/J20pJPLsxKlMFYBbFkcUilygGoAK5CxTyEgKg+z2ckvKChsECrpBJArLyhGyhMrglKTKk+zlXOLyk0zS8pxKbFBkgG8SEkhWyjG41QFh1GpMODZ+CsHpKAw1YSygYj9AgrEKsGrz4ucHSLKZYs13RhKsPIXqhhTbkQIkhbzjQiWCMpSVvPQ8XQpjuXey7uL9qsu4g11Z5WBygqIKGDIoA30Ldj1iD0NrZ2cKsIr4gDHgK+MSUCZ03nTfat

R81PiHEuzgD8xUh2UayBViGAGEbsB8AE0ahcqdGsdCs9wDGtZCrCx0zJMahOrVWEUSyxqjzCfkmxqPAzUaqwANGrzeLRqCLicK1xr9GtsKoxqvGurEqcwfGvMa2JL/Gvj8kuqNPJufLTyv3MAyvSrlPC0sdohagE0ANhlJLPQAZXS8WDM8BZkdAUpIcS0kAPiufhVmUFHIHwKT6EHsPQQveElWM3TKuFjKo+Rs6BjIK0IRkrGqulLeGr5KjXKp8s

BcyyCFCu8q8UtncnqFHtQD5EVyhtyEXFssPaUsav2KnGrDiv3y44q8srl2JWxWoDQ0foyKHgxyRAEQYDv2DYBINhQcGNAYqmypJjCOAAXgElALSumESShCCuiIP+rMcO0CgVyz3CoKklA6Vx2AGSqVIwBSsCggJHNCyMBhSE4wnowsGu41RErRq3cAhKc8BMIa0JTbAqhSzEq1NWaAV8Bw7niQNR9G6o3BRS1ABHoeWkg43X7sV5RllXsseAs7rG

HKO0r+jJTSRjpapXNTCM0+sgXkh9U362js8QrBmsmqiZKRmq2HMZrtctnygOKCMt4k+IKk0pEySRqdYvmcfvZ7LRRORqq2Ks+y4VLjeXNmCIQYqlHIeJRscgiEOKTfg0XdTz8RyCV/PchzVmua25rRhWQpH4luXMtK8grxVWtSoAq+SF2AU8heOVzAGZzoRGFIUArzWrhZEblrWp9K/IABkmu+K1KuXQSAeMqglNhag0zkyuIa1MrdKvTKnEp7wH

uMhcMjAGMq9nKrYT0Tf1NVXWYqmprYtykdb1Nr5BssTfSR8ARsogYOOUd/DpqJ7DBQZCU9tS+RU1MmWq4awircAuOykirZ6s5amfL/Ytm8gjLwpP1qjBqaKkDcqRrMuD1bB28WKotqg4qAmzUi23KJACZMmtBPBFnGNsgp6jUWJkzwhBr8Nsh9SrownmFgoOuS++rsozjHCQAbmoIK5ClHmt+S55qBxN+KrHCOMONa4AAPmoyVVkwN2uzEtacKUF

F1A1qCwgr0kZzoRF6yt5KD4Ada08g/citSG1rjRBvas1rTMUdaxRQ/FLFcqAAH6jeEcS5oyoycLJwvWvzypkMJsvG/HSqhoNyamjIUUFgYGABSTkOsZ1juCtrUep5dvge6Syx9jiUUPbKKEtQy5BieSsdU6wSclOLcgp8KKp5aoyZkgAfgovcr1IN/bsr1qug1bbhQ+H10iVqtvKtqm3K6rCcLPxrToqfollTLlmSLBSI0K0+YaFgn/JvSPxp1pI

woSSh7okmPQ7sOOr4Ms6KgVJ46+og+OrecL2BBOuUS9VgfhlE64YhxOqtZF0Ct9VsK38xOOurY7jrdsz+EfjqMIznAS+j4krU6vI8NOqJYCTqdOvfKtTzLqK/KmrzBHO08+ryoOpxKTQBx+ycC4gAdQHvzZbKjzSQ68EAUOsWgl6wZGiJ8Ss4Z3IMBKhKTw1rKstrx8o1qgqq7zMXqkRqmFNBCgNyO1Dujedkn1Xe6LgkBUuY6qVrWOpXQIJrULl

aYZuiJYDn6C8QvuSca1td7CpRyhrpdGulFfVUx1zfKy9yH43ZqyBUyuqukyrqQgGq68JrbCu/jQ8qAxQnlE8qS1C0SmPyKtURypLUuutvgHrr4QDwYe8rr4wXKrJwGutG65rrnzHSa5zrMmtq8tzqcmuDasgg2ZFqAIKYEgEaADgAjVPqKwS0y33uy3vY06CeMbgqjQhSALLo+jEHIEtL84oqSWJRu/TEaAH9OJzM8PUqP2CuweSyYuvUsh1T1Lw

/VRlKOWsFKoFya2pAixYqDL0RqwMB6OrZsdeq0Ti+sYBsd6tuDQd1/UHI1BFI+yCygAjUqsoI1GrKkq1RgYMBxHlipWIRWTLXaoqgVuuSAH4rzQtOAMTDd2rmFBIBGqU/qhjAnkorXLMBQCu+Q+oAIGvZ61Sq1hRDAM9rPxIvayM8gSt3a3khuesjaBIA6JEQpatRGgnTEDCQpTIFcyXrb2rAK6XrZer3ah/DouRdam5C6YCWEL/Ka0G9a2VU6Cr

hamwKUysRawNLikrwLTcBFMHoAKABWgDvCkyrDt20fWownTF68/nhQlDAMFass3FxtFXp6fS4Ezl8p6rCCitqUJhlIs7KmEqEa91zFOWSAT1SyqqY06uDfmhUpGioGKqclK2o7o0xmdHrBdxiq5FB6IGgQYSDI6CYgGJ9IDTBCvAZUCPzoPMBngurML0wv8yG8xSKCKo9i1XLiKsS6mGrtaqv0wOLD1Ph61fR5gQWcV+LQqt4JTV1/lH5Swcq23O

NiorqfuFCQe2AaqCQQJDJji3IAKJDJ+ucMCJAZ+qzgBpgq6MBbRfrwkEQQKJBZ+ootAXTKyJfc4rS33PIi1BLQFKuIq3qXquI4OABKiEEAImNM7K7I5DSHSIZIdAQBsutc01zaT3iAfvLjXyw0YzVxyOZalSYLBIr7Gcj3Kq+pVvqJmtI6xsYdnODinhtjoIvkAKoQqrRq6z4h6hPUrPqwUxe0iABT8FgYAt8jAHws/qtneq0fF9EuMl98ego3+o

J3c1Mc3OVykjT+bjU0vhqNNN9i4jqyCJh6wOK9NNaWatycN2NCMVALDx7Ku95xkQ75bQq0tKHKsfqe2taq9ognqPAFA5ApoIC6nqr95C+sMvq5dwIohXc73GIoudygtLHy6QrMbNOyuQqItPAG2tqyOpi00EKWkhS6etyYXLCqymUPplQG5psWhPt4vLTnvXaEuE8f+1f8z8rqvO261zrsmr/K/brkUEG0dF5I6BMAJFKpLIS6KDLffFlMcvrloE

jqUbI9w2TuPrSgeqntP+zNLPVqmQrNavkKqPqcPJj66bSfPNpUWEFT1I6DMLCnsnXJVKwLBoNdByAFYFUAFUYN0EoYWKig4H84pIFkkFXzWSJihuissobZYAqGpAzASWX8Zcs1WLvcqcV6htKG0nRyhuAQSobWhqwQUfMVPKF0inKRdN5q6nKK6vP602Kg0tNyCgBi0EIAXOCjV0IG5/rO1BIGkIbVmUkILsk9BE/szCrKEqVy5BjYhuP0qaqEhq

S64UqiqtFKgjLkdK76kpDDLHtBBAaW2tEdSRYgTPSCyd8u2rDUgwq6rD1AFPpdlImLLMQwkC0Eto1rAGcAEZd8QFQOLMie+jv6dwt/hvtgQEb5YBcAUEbF/LzeMW9IRt+GxwAYRpNgOEbgRsRG8EbNuucG+1CB1NKK8/MrMokACgBCKgQAdogiAD+3cYCsGkGNPkgAn0w0gZIKQnZsVIYsOrGNbkqj9JcI7JShIqrai/TrKLEiwOLPdPSGq9hEvA

PkbAK5/yWEoEySbPy6j7K6MrxqwwrWgAvSafqd+u9ART0l4ECafCFzDHy3NVpAmk1gO4JBmGjqm/J8elIASHsTvU4iIvib8iH8UVp2wSXAllgTVACyGntW8iT+egsbkFHgKOBWqAgyHWAN4CqxDRBAmi1G6Tz861NGwnow9CEYCAySel5mWTcs4FMYcmhVWhVUDdAPGGvAHvJlURpClcCDwD8YD0aTlL2io4R8YG3AxUacpA8JeBF30qfAPyQaiD

GkGBhAmmqxYRh7Im4iQZg5wBEARPiiRgBA5gs5rPq8PMaueOX6lUanYhWFDUaDKH9GxsJdRuDGg0bCvKNG1/wgxrIMjsALRqQCK0bgixtGu4I7RtsgB0bWuydG8JgXRpEgN0aFG0aoHahL0gnhUrsDWhexX0btot48zSBAmiDG/UaEGFDGn9iGZhe8yMboxoNgWMaLCqU8xMaBWE7AxohfEDTG/5jNxsxUsPRtcT8YHMauiDbGwJpZIELGqwxixv

UoUsa0mArGt9iV/Fq7MPQ6xuu5YMbqwObG96y8gTbG5Ua6qD3oNUbva01GoO1tRuPGmgBBxoQYQ0akAmNGscaIjMnG49IAxp0CW0b6+ntGoiFgXiHyZ0a20sshd0bPxu3Gr0a9xswmv0acJoDGk8aDEwMoQZgLxq04q8b0qDuxW8aRWgnQ+Ma9/KfGvIiUxrZA98aMxulUwibVcWTYXMaL0kAmzgBgJr8YUCbsAHAm8saIAErG6Cb1IlrG1Wh4Jo

uGJsbYixbGhzrv0qcG9/zvyp6XIkaZ6xJGjNh7fBvgOABNwGWKyNLUCTe8DbhEhgZG9FNpL0zQWpl7HBVwzhqm3zRsoZqCOp5GyHqRIv5G/DKyOpv0g+kPgSmKfnkXFyey765MZnXaS3dE71H663Ke2q+G1B1iaHDiP4SCpqqGjC1zqsqALMEBhqKmqybSIuP6meLy6rP60HikWpiFSohSQCEAQbROIA8mmkbn+pbLIdNSBvTcGbJ6KlpCG/cVGP

KayervgoS604awBuSGlhL80p6M2/SbJUplJZx3sIWamyw2sn+UJNjdqstqwrq8poK2YdITwA9GrABrGh1Azoir/EwjLOBFRsPLWVFB0kg+bCAQIDUrerVDIDhAKkZ7ONMYFmy7YAQzX5h12P8Y9p8haCjgAZjFYLZkEfo2xp+m8Z8MpK7GyRABaC3/Xlp7RrrCPqh5zkqUAfccmBaEXSJgQOCAPWBlYBrVWib0xsHSeHQoZpv/fCEHVEKCADIP4H

SIDitWxv2mj8adqCOmqeBDixSoE1hzpsums49k0Rumyj47pu6oJgsnppV0JtiesRFsj6b4kq+mlujQZr6YskQEYDhkwGbgZovSYWb0WFVGkCx8ZpIvGGaFxrhmrSAEZojAqtEUZpTsNGbgXmY4xWbjRv+Y3Gao4HlmsJBCZqTA4mbOjkcQMmbD0uu2SmbDppq7WmbawPpm6iN9bWqEC6bB0iumlmbbpo1mufpViC5ml6bvvSdiPmahOsFm7iJpZr

+msWbhlIlm/Wb+13WfGWaIZvHgI2aSrNhm7OB4ZsZq9kD1ZpwgVoQtZoxmrogiZqOERUa8Zv3IAmaDKCJm1BgUjgtmj+hyZpqm7mrs/ImGszKzwuOCwWqoBmxQEfBI6GxQIQAWQAkYvMrkqp6mj1i/JqSfCnZAiHNyo+LPwuVq0ZLIdPi69Qa7YKriyIKvKogG3CZTTCTmJ+y3YW1ZHlK27jToXYqZRvka3GqjisMK7iB2Js70CnoCjzzgcuEdxu

O7DibD5sGEY+a8gT3m3caD5o5AjQI8Rtsmlzr/0t269waf/LIIQIC2ZGJAeiBYGA4AMGzCSqJEnAVyJOZwAmikqx7myklrzXGRC440ZjSdB8I3rk6o5zgjlyjONZEhkjs3UgQ3JRDo9vyN1MnyiHrYsuRM2GrPPIAo5IAgzNuykr0RwB/hSlYchqGHbpJNppoy7aa5Rp3mqAFwhCtcBd1f1PDi32ybisqiFBxeyEDkFWQ1FiFIJjDWqHua6PkJTl

faMsdjFJkoEXR/qEsUjqof6lE0fR5xFtUeTLDyDP+ePxg1mAdUGRaJch/qQDoFFowdfU5TGFkM1RbNGD/wovDIRGhawG95XNRKsDr0SqYK5qbWpQtHMaQbgCEAQUNJap6mkc9HuoFrSUMLoSkdR5lqzDsHOt8PTIaMmYMjhq5GjGyp5s0G2ar3PIuGharkNCfM4UaWd1Y06AKHhuFais4SuGWCb8ydqroW94bP6w2awwq+MXtgAeBovJwik6rt31

HzMJBClt+EvIF8lpNgCpaERKrmpBKearLqyYbGpsq0mYbreogAPYBpVDQYZQBxsLwGruapGLcWtLAPFrFi0S4qMEplETJFLzKTNSzap3Vw/+z4ho0G7DLIloBC6Ja9cuQ0IyyCgK9MeypklsGnL8IaKiZjAobKxVAkPyjKDNAza7EfAGsAfoA85ptm1iba0p36uWgIxqOEPWA7tFaocdIwkB7G+LzsvLCabJg8xpSobyh8IQXgP5inz1TtUnQ9fL

+W8Es8AHRYbnRiizsYEmA5JNJrICB7ppTsdsF8AhjmkphpnzbG44YBIk6OLagqWF5REsAdYBPiaW0a1VUAG/8S5pBLCeAJ8TqIlRgiorb3BFaOZurlWwAp9DgAQahOlCpYTwMmiy2EA2UVlMTgGI5IUV5BHNifgBAUE/BJEStLYfRL/PzGtQxuxF7GnCblxsJoPAJfjxWod/ZDWHOLIRgfYkgmmo8miwQCE5bMIyucH2A44CuWgCAPRqjGp4C7lp

5ma8bHlrLAqmbXlvtgd5bSvPzrZ5bh0l+WiSADKABWtIsgVqmIyfjg6t4gcFaoKChWh4sYVu0kk5bOqAzm3SJkVv/iX6aQ4HRWi9JMVslQnFaEj3xWpgBCVpWswOBoZrJWtotaj0pW6Yj6iJpW9ObEVrrCGABGVs90FlaMQDZWgEtOVr8YblbfAANlFD5TwBOzQVbUPnrAEVaziHFWyURtoqlWr8b6JqB2OVau6xmxDR4wqCVWliJL8TVW/SarZq

OWo/9tVtfTKFw9VsuWnGbDVpuWk1b0JvuW81b2sWeWzcbrVrq4kdKm8XYAL5blYB+Wi1g/lpdWwFaJUROW0FaJIB9WyFbpCwDWlST4VvZm1oQw1tDmyNa1oqjmwD5lACxWlI441saLBNaczI3gZNbC5oVmtNbx4FMLMFFtvQ9W/bMc1unyW9bYjILW404VYGLWjNF4dHZWzaKwYsrW3lbTwH5WutahVsbW0tjm1tY8ixguJoLW7CbkjllW3uB5Vt

7W0WAYaAHWlVbDIGHW/cLWl1GGo/rKcqAUuuaCkqequnKYCR1c+iB65LeeWAd+lvpfIgaRz0FyzxbklhAWEMVvTCLSpvzg0ImKkJbfnJAGiOiBGum8nQamBoIyif8ab0zIa6wNKPXypu46TlVdB9UO2p3y+ha98oOquqwzy1zm2db8IR9mtH4w9DzGsIA89FsaDob1CQb4EzbTZoNW8zbISDhAKzbh0hs2sWA7Nr1Y8TynNuxmqObXNq5mjzaLtF

s2lGTH5t/S5+afytfm4kac+sqAZnKrnnqAJWgJaoC67zs0rAtpCa0RlvHefulW9iBsWvrqysP02Za4hub6qaa56pri3XKrsuSAe/qabymcM61cXwWawXFzHQw8A5b2CNtGs9aLCzD0Qjar4GI2lfwFVqbVOnRTGDEHcIA5+veA8IATYHVUCOs2tu9WjrbBmC62ztaeWlI2x7FRYH628LNbVFa7WXRzomSOERgJtvLrKbalaBm2hBg5tp62xbaPCx

W2yZi8mOG2ii1Sjm222jazRUQSsYbjws4g5jb+aumG1qrsUFbpfEpSAE0Ad8C1k0f6yjoy5FWGs7C5Bsw0n6qpLlGSWS4IwHD7f9F16wIqqwSNGLI0vgpaBv0NOWKZ5oIW4qrA4ogcr1yE+qD9ZuRdIw2Knx9WKIuOFuAqMsyW6ViDNoUaiSTmCv8mDVzWiFKtZgAEPiSq2gTAhqgNYHb5NJfIg4aBqKoGxB4aBtk2/hqI+sEa5LrhGpj6+xzGNM

slCqqOeS7UFuKwsJK6PykOSzkavart5tyW1qrqgC9oUjMmctAQ7OK30V98V8J+pvimZITCKKUGkuKVBomqiebMMoWWmaqu/LmqlZbKtrBchabjcLpOem9yhJMG4YyfeF3Je2ZN5oV29ZqjNsjfQEoWhLUkuwb0MgcGj8qnOvxG6SjzMocmgvy4tokAVnLJmzr5IsA8pyaoyiobdO8myMFghv0fa1IY0FQLLw4QptWE0Gqwpq9MyGqdhMbKldyrdp

S6mPrPXPiWnmBWXizIJpJ0IObYHNoWtq202lCBqEqUHeT3bUtYC25nHWb22DbW9p0y9vbQmE728qaJAG725lbe9rb6fvavmA1xJrUEEsNs2qbGNryS57aphqami/r6crx5CkaEhQvESPdmdt3BVnaknwxtHAkc9ttU5IDVLwmmyebAyIiWy3aolrL2h+LK3Lt2sqUL5CdSFabnduvnBaIq6iamRvbNS1pQtlT2tpvAT+TR9s6Uerwv9q9W/bbf9t

Zq//a5UDyBIA7LpOm20A6Q4CucODbO02IiroTUkIyagkbMjK/89zqPBuOiAfAiY1eac7qo2soqKplTYKygJUopnGYoxKALjgHUCvYuliy6Sml3WOpeOARw+w/YaXKDDi5dTQNCW3noI2COdvqQzkaZNuEnfkrNct5G+erBduj6h+KKYJuG9vYFhyNvPol1HM1dD/be2tEWFBxHOUNWMEBZiWS+cHDINhu6BFJAGzVIaeoQYCXqIDT52r9jLFdsUg

s9ATQoqFM28KgmqAieZiAjwGsOisRowFuccgBNFtACKKgEDtpMcw7UejpW1oQnwFzCm1hkGG8Mw6zSdCKigX5oGWsO8xbOf0TKv1qiGqLywNrIOqwOiQBGgE3AcjqDkHPwUBD16woOoIgDYOiJEek4MrDqYOowdKx4oJbgeqwWpdy/gqbKtHbLhrI6vDzK9sDAUgQCVhJs1abamRJiOAR5DrqsRSSa9QQOhZDcmJ9DSw62xok/bCBWUUg2sY9RYD

BWiwsowOvSHvaSQInLHo7x4BNm7GbYwvAO9HpoHxQ+c/BJ+PO0J8AzQNM2/Jg91qMiizq7DJ2YbIi6oqj4vsyetv62/OaPCueASVEljr8Yc6dZjt1mjgJ+jp4/QY7kZpDWkY7oDpAOvAAJjsnMG47AKyhYrMN5joXGzvp0DKmO+ojBqRRQVY786P14jY6oIC2O5zamrCjmmnsMHM385C9jIpdW+syzjtIgRogLjqqW7BAntFP1Lo67jqhnPo6L0g

GOjRhg1sRW249wJBgOr471wMmO346ZjqhnQE7jRsWOro7wTshO9Y6mLAsMGiagToRO3Y7v4H2OsxAaLyOO3SITjod0TE6GiF7gHE7uHOQO42yturQOy4ysjMwO9+an+GqALSBgwVPwADyt9v422LRsjqaMXI68GlfuYFdxKl2GgrbqBWk23krIpuhqsrbS9qF2h+LvPNIW8XYlLXrYWcgMZnAETZ52Aw928nbFdu92vmpMIs48vCL/TvdJfCKItv

fc0/qKtMl0rtzARvx5VohLdTgUgmjnakMZL3wAqgC8xKAF/jvuZq44BFaDfb99eDlq2IlAiG5Zd9ghyNjK+jMBiRpIdpLohsdXDSzjhrZa6LKBSrwW6xy2+oFGgjKt4MdOxq81ySl6ALymjs5jLu0uFM7atZru2oMKqAFOFRx+fwqc6DLoYkj3YUK/dWwoQFPoUfAQhEgccTAM9Ofyx+qPit3IW0TcOzPIJ0SnRP3dYAB/NqVmqw7mqG9bdigUkQ

POjyB7DvA9YMSTYAvOpKhHDtooZw7jzo2EMHk1Wl3OpmoVGAe5AyguKAwdRTRgxA/GsbdAKBzG186zOg/OiagvzolEG0TswkfO4AALhVmwOsIB9qT+U2jCJDmqIqQcO2QkjSqaSK0qhFriBJX2mAlNAGxQCkBFyFfAbABENIIOhLohkkF6qYd5L3OHbybBiVmHRf4qjFQLULqU3AEIF6NqZUVywgk3Ur5CFpI28BqScab00vrKmYqm2htO8EjGBo

SyohaM4uTQgXgDgWR6loU6WlpeXF8vTuyWxpsDqpy3ZDZ4dWuwM9oCoAZOP0IfeGK4bDQFMAMu1IZRawPaMQKL4EizTQt5NE8O19sHjqOEc867FNsO8kNCqgsu0XVAKEa8TP4yNh/qCy6WXOqjcy6IjrlcmmsMLusW7Sq+fzTKlU7KFicKLNtMQhJyot87MjcW5XohVhyO/9FHN0F4CMI7LC/su1cPgoGa2Ozg+vLalvrhLuWW6/bWErICm4aLMg

s4ObJsuutcN649Nuxqw0ifTsUaysVwIx5mkDaVqAaYdPjb5sVaE5woIH0aTQtwXCCotoR0emB9BphIi3RYUCMUmgsul8aTeOAzTWBCIT8Yc7Q8Aj3ILCNs4BPAASE++kn2uhBFqBhoGa63sQ1oTMbWxVLQI4QTRXN0B0DPEDl0ZlFKGEMoAfiO9qT+Yb16mkNtRq68sWaumGhWrtPm70aOrpecUPoertkgbitDEEL6Aa73AhF8Ya6SmFGu7q6C4A

mureMpru2fI4Q5rq0AE2BwIz8TFa7ZfEz+a9JNrp1FCO07YE9gXa71IH2ukfIm9GOup8BVVDOu56gAWEuu+C7wmBuukJorZvuu16bhZV+Ug3j2rqeWzq6Prt6ugpFfrrX1Qa6AboYLEOBgbvGu2Sbs+KQzaa7UbqhY+a7YbqWuyG7TdjWuwuANrrCoLa6lsS/GufF5xBK2HG6jrrWs066p9HOu4m7aQJh5EwrybsBAT9LVPOsmkPan5pcGl+a3Bt

i2jzqyCB4AUKZsOB1AVohcytDaQBa9DlpGq1xBx2KcKHbNyKYnO/is3EsvSs7PbwimsHqBDtGa6KauWuh6sS7FiriCiQ6+QkFxD+Z05h2+AI55Dp9/AjV1bF0pG9A9bBQcf+tLmph/LLAgoPi9ZqB4QGA0yxbNKqCuwgSA0raWy/qs5H0AKepSniDNC7qySgyO35p8Xk5XRK73bpZfH8UScXHfYo6ZlurO0JaCALrOwQ6g7ura4gLdBsgGkEKJDq

iwT8J82S3JYrou1FvUraalLpjXeq6K7PA2K5l4TGK4UGBzZhCgtUAvcs9kNQVTW053AEcjgHzugK76Cq0q4u6MSpwutTVcgg4AOngjAFJqUCrmXD+27mt3IMB21/qNhoAEa0EWBMIU9axQBCsgP/qS2rh26cjYXyR2iV0Udtviyo6YlrefaAamdyD9BDxnODCy7gbS8mTOuJRXhoNI+My6rsp2uxb/Jgoah/K4AHogNnK9XJd6x+6EtOkNYgbd9s

SEqLqDk0D6lTTLBPQNb2LCOvoGqm0ZppbKnyqJIv+3fyq1SPEaWAx2QmNq9xsHujg0amV5DtaquAAmsTDAH4BxDma0/bkU9tkGvubEhO80xKZFBqwgmmlplo6ZedypCrN28JbFlsv2gq67Tp81EcAcxW5yiOoaOs02+JdLhxipO6kmOtlGwzaF7q20nLTzTVEozobOmxaEp9yg9sc6vFjS6uKKnDMMDr26sK7bChEgUPcrUAT2/wamWRPoQHbeOW

ke01yJLj5MVoN1YQ4a3PapNrAgqYqz9oAihs6gIsU20O7j3g2ATEyhtAfVIVqN6p9UhWk+zv02ue77gJ/incwYaAgS9uJXjrzW3qh86LkTTP5ASmeoMp7AEoqeik7uqGqeqFwJbo36qqhGntgSxRgvZrae2p7B9quqmfa90Nuquqb7qvDOiXSLbIcCsghGwBR3QIDSAGuCzybeACAglPad9rCeiD8pzymBEQq2RsCWn27U902E1R75lvUei3bq4t

tO0Q6dHobim4ar9zUEQ7iMZnZUY+hmKMUugc6PhvlGuqwmZqIjTtJcZuRGZoQ3juuxPqgLtFfW2NbBAApm9tcNEE+emZ0fnrzW/uiB6OwQN9bzEq2oL3Z3nrBer56hPmGOv56YXsBe7FbgXvqWh7bkEvce259TbscmqPaFWPiq9NQKAGISJ4zobKWcdW5PP3xankgqSCZuT3g1XjumYM5hgsHAZAEBeFpggw5DPCdSWypI0CGQ2Ha8OtB61/iA7t

wWojqoesHupTajJizAJ9ZBHGZQLg6Fmq4waUgEDXMereavdqsezZr0AH4GIn5ZFkMEaoxBoQPaMFJmJQMUX0JWUEszc2ZTZlMunIR7RK3O4oQXRJ9bW8h0HL3dR87fWy9m7Z8gJGsOl17HXuQPCe4A2zrEINtAKE4gECg2v1IssxYBJEikUwLOsvVOar8TxKguxns+vyzENcSIRDskWcTVxGDesSQ2xOCkPiRNJEjemeypxIFELu8BxDFECsRu+B

SoC8gtpIg7HUzNkAwdaMSlFreY2UQxxBJIElAa3s/EpKhqdK42eUQTxCSoH4AQKH0A0N7AJMikK0Q83s0Ugv9CxEN0F9swKHje1cSvxP0i5N6ULqQko2hHPXwa31reLPhai3rsLtLu1fbiODq05/hKiG+2yl6C1GN+YxlrPwQcrXaBxndMYUlB2jIeZu7TXJTmISpCrxe6rX9XUkO/Px83anTQczCO7qrOkHq8YN7ZcHrZivyullK5kp8xbDxF5v

n+UdRtqoWar8IPZBIk0naV5O9O9V70Hs1e3hQG7PgEXYkpim1WGTIENDvsTmMeHVIEOcY5xhqAPCYrXrXdRd6HROKEIoRDxB2oZ8g+qD0WicQGHJ2oE8BGgBnbaWitIFo+9igwRIngZj6ILtwAJNZnLsFSP+T2whgOINtJKB0WpCQjzufIIwAnVkdsRqhLxPMkKT6NAuzsIsQkaEQkUVdMoNunV7RLxOzHRMRs3oEkPj6WxKbEYsSD7LgkWcTJKH

kWsT6sLAk+nUzw9Fk+78QrPoU+r2wlPpQ9VT7wzy3sjT7WXK0+pNZmqF0+8UR9PuokeVcjPp4kLt72aHckJxSnJAs+nyyjAADeTnRd7KRoAoQoACi+kvRcLK0CsqhnPqqcrKDjAqL0Dz6dPvZoPT7PxAM+/z7v2vXbOjRHYDU+6T6YRA6cobcCdU8+l2Scvp8+vL6/Ps/IA+z53tw7EDq6a3XewSzz7piFKABsUE4gAM1o3CWy3jaXlBWe/5pnq3

L2RXMzVQgWorgGSjWwbuTR5qyuoV0DnrVqkrbzdsSG7QbGHsmahNDgwHxo1kgcSObalJbbMiG0avx6n2LsijzWAMHO156QSkVs+1hlbLCob9i/GFGuztILLoWQ0CNHVqXxDCxztAE+/myomDvkm77GiDu+rCMEYye+86cXvsEhd77NqAXzf+SFbIFs677GbNu+2piHvqB+rCNXvuQyMH7PvpxehjbxhqaWxfaWlsjOpya38CHIIL00XhKa7Y5AFp

JwLRzPwlkaU+giXxouxyS0u1F4dARRcrKgCMLXjjhI9bzeqILUFzhvgQAePFK+Lqb6q+LBLsnJcV7xmvW+uebKFgPu9srdU2LMDJZtlsU7HoM7LGqu1ZraroQ+0PSOANegNGBpyEu6cko61H6vWHCV7sKKaczjsPSFWYkBFqMOzFdbW2xSQChwLBosMFxFxN8eI1qqvtzE6qMXxEZXGT7WXPFELxT0lWy+pCRNCygKn9qpTlQKsCgpFp1lW37A3k

vaiqDHftAdCiQXfvK+3RSuNg9+jMQwvt0+337/6jYOZd6QNMCuwvLIUo3e1qrc0S9ExoAy2M7m8GymWRZPHqaF5L4IG96oPMEqHQVp3jgQ9IYlHt9u1lr1NNyE+Ta7BKbOuKbGxjagKgjMZjGSb7qjHrveE5UycAyWp56lfvO+neaSaiBegyhYqC624usw62jGgmhztphoOG7FCXU4hpgMRBdRT4CsWGtgJiA0EBTsLPiThQn+vlFNYCpu/2a3pu

FU7JgdqFx6RZB8enuipAJsqD7QB0RnGUYM7VQD/qn+6VaTwBn+0usLtG+YBf6wqCX+qwk4L3zAkdKN/u0obf7zOpWoQ67lUIP+6mhFrqauv7LWrPP+3lo8ektgG/6VGDv+oURH/qtmnVR31oXzV/6vxo/+gOawgG/+vvpf/qd2fQkAAZ3/IAHJTs3+r+Sd/uN4h6B9/qxegyhoAeP+3mb4AeVgC/6/oCv+5AHRWAUoW/6ndgf+wMlbtqR9e7aMfs

e2zQj7JquMrx7pnuE0pEFmZFfAf+bAnsfutaqz3tPU8v68jpssSNpByCHypWqj9swWwvafTLOG7lqh7twmEMB3IzAEgTbdpSZQYH5PTpH6qfzhyutqldA5In+e7JgBrOussJB0wx9JMdCTFoAItMNZ0nOnT56Z9S50JGNkVKgm0h9hOLBilKh3pMACZVgBN1BOwEBadAuGV6S5QN7gZwGBZKusnXYPAdQuJtDvAdErbA4/Er8B94Th0i5RIIG5KB

CB1TjMuLNLctbAAiiBp6TS3uY3OIHHhj4mttT4KCtmpwH86JcB9IHwEEyB8c5sgbnwhPitKCyS/wGigfD0c7RSgY0TUIGhONb4CIGLWBqB7OS6gZRQm46Ege1GdtS9bvo2qeKxnpLk5paIzqmeshqyCHqAMyTAxEPgA96nbr5CNQG2MwyqyrgfiMFe3g7LTv9u9lr/3qEOwO8RDpSGrgUAiCoI4Yw0FrL3WUq1kv55LJ147uN5J8kHiq6hV7oBHi

ftGKpliReKlDRzMj0nSlAENBiEWrd/LuW3P1KmpFPu2xbOvqnBNYAeigSAD2s992OB5/riGjOB5f4viLUUK4Gx5uyu0/bxvIF+qXl+dvwWtv6FivSem7K79ujIJLYCiggo5/anJQ+MXKB94OH+1B7lfomMziqVPCZoulkrpCVsdKweyAs4NLBKJVIlF/Yj9jQ0VjAVMDVK3mFEQZL/ZEHuJSQbCDrG5sZkBYB6wGVTPYAoUyMs28jTKqf6mn6/ck

y21jsQdr2GjDxu9Tb2HyaiHu4OlM0udr6eBHaGkzCW8/aDsEMBkO6daucBNYBpqNYGth7Q4p8jVGF9euJoutAt9noC2wG44vsBm3LWqrQYFFABJjbWZIBMW1+2o0Hu5pp+pzczQcFrIaUFNIoG4jTABue3HnarTudU6abngdmm1Ws1gEXy+PqxdoCq2JRW7kdcNLLvgfiXZhNxkQxqAR70BoQ0IsAcUDJyNHEpBsgNQpx06GBgc0H0U1ketJtUhO

UG8LKVHqW+k4aVvo9ByV60nu9B5QqbhpqSGjliP1DVebTCijaOn3bnHRsGh+UA9pFTWU6+HKNuhU7w9skBt+bpAeOmbWxJAETBlkBI2qL+9SjAhsKcQTastsihdNqTlXaMVkbgarUURDz5vtAgk/b+LuW+457VvpzSz0H2+u9BjyaHHP1PK7o++sQG9UQqLpfhBX7Z7ueenJbfTpGmBp7jtLSBbp7qaof5ep6unrQhqFwwqDD2UmrjnE6ewdKygX

Qh/CGxOMIh/+ARhsP69YH59trmkoqTwbNuhI70ABO6zYATqmyTPB7E9rphfjaic2GWwcGknyilZkqE2g8rchLg6PCylBi/btdBpJ6hfqJ4rwiQIele8UrajpqfKJ7S2nkE5YBYQWYTDcGJ+pwh8BLgTwzI0R9sIZIhp0DqmgMhwVNUId0hrUV4msIYUM6T+oam7YHv/LPBiQAhAB+ANmQAvRLAB2zSLq9o4ARMb0IGKpkC8lL+5hJ60EEIZthySm

HKAYMFmQe6O6MOeVAmMzwMPES0az8FolFjMkHRvNN2gS6/3qEux4HP+Lkh5s7pXqFYtxDyTgs1bh7fHwyWBhZM+vl2+D7R/tyWqAFeSDrwJ9UkUllkC7odwUVsDvAEBPUWLXMe+hVsEchZxgUwQRbmqBwOMONxJAC5WQK0RxSgkql29Pz0zCQoQ2evcMQQuUJw0vS9xCfWuy7knjT+gu6M/ohS9VcOvs3emAlfgFPwCkBPtOxQG8GAFtL2UFp9wQ

6SZ2636x6mzoZFFBejSvqo2n0fcvZAYEbJMrhGpj2Gxko+TC6WMRoH9mkuXn6EnspB9KHBfvoe4X6SwaYe8UsJsNS7UkkGgjMe+B6b6BRqpLx3dojBpqqhUptyn39UBFCqJmMtVgkuDHI2oEBSbDZSJWFJA9pPBEHUZDYeyDczE0r3eUq/Dc6bXrteqmakaBo+y86g23p+Mz7JobTEfkQUoN/ywnDLxOS+9916flE+5mGPqFZh4vSGnLr01KCzaK

5h8D0DWolOPmHVkJQ9NmGaXKL0pnDodFVo3RSxYY6pd0QFYFg5YWH2YcFh3uzkvua+tC6VoaPus3qGCqwuzaHBHuIAPWBWiGNoO26uIdTBkb6xshpCdGCu8ow6060Pwfok8SGLTvw67kbrTsyhq/btHqbzVwKKZXbiha4vgf76rTaSBDDBjeaEYclahhbclso8cyGnQMwhwrwrtt9k9xBh0jRA1UBU+MTbG6buwNVABfqdIYThhrUk4fOiFOGVYD

ThnlBM4Y7EbOH04b1MsyH84dN2QuHM+mLhhKyXQzgAMuGM4cMirOG7GGrh/WyuaoaWmuasfoYhpU6pAd2B3CpNAAhO1yGNLEbqyN0bR34bRZE/VJounfbz8uYTfNk4HrIem29MspagLbgJzztXIUg8WxCImkTN8DygH6HDnuIqqkHwJSWWwD7LsvmS2oMt3NrUI9k9vsGnB3BcbSy68qGinoBwlgKJABQglqAMcncg0GAkTGFINDYWUEg2LEwagH

oqeEBBCHhAWupvyRXO8mGjNj6hhkdtxAieRnUQ3oHs2DbEEaoKxBHE2x3EaZyjxIdEMCTbFj6oSg5JPt8eaz7WXNdEOABRNEQRscIOwmIR4IBpPr6ciUQ4AEA6KhGwKQKESL6rPoy+5n9C+hC+lWAdxFa+w0yA2st6raG1NRxQDscHCjgAFh7upu8m8thGF1CUezJbQeDOHvV65ALyCccU0r/uoV6f3uGoqKbknr9i2cGvQelepar4gv9+Eeodlz

n/BaIyW1Xh2D6alLfhqhjz01PwWZgZYBRQlp7WhEaGqqg6VNbh/xo/cP/yRUbkITCizC9CVsWYBGK8rKDk2vUS8IcRsmLnEYemqCBzrvcRi9IqVu8R7OHejksoO0sBWCCR4rzLtFl0UJGl8PCR3o5IkdciaJHnqFiRzxH9s3tgHxGyYuSRgJHAQDSR7NSMke8YYEsbIfqmrYHJnochkeHMSKibSQBAbPaISQbPIciJP0qzylW1YUgfsJG+utR1sF

iUHypMPEjBYM5VkT8ON7DRyGDlDK706C54VzZN2kZKY+HJwdrOxOy+7p0RoUqjAalejv6EaqUhjJwcCQWwir0l2SiEf4HDmT5CO/YkTFZQaeohyGNbXe0AwkxyYUh4Qee6TqET6B2JUy6ogEL6Ly7ivrFXVz7XfrVovN7/mXZ1ZqgsEffHIkdtCw7ECy70xBg7bH9EEe8AXL7Z7M5MuAAoUcRRgqhfft3EQvpKEZ3EOBrf8rF6gnUI/vIkABqZKF

RRxNsYUej+y8SSUdbEMFH6dQhRokcvPtRR5P7AlJN6qI7V3vN6wRHs/vQGhIBsUAjoNmRogCYiwb6ygnxBvQ5M2kUnOgo5RNNcjKMEn3sw0ZJXYfqMvZ6+5Piek+GpwYAhmcGSOuMBsX69aokOppJReFfvPv7/ZCzaQ8dr3h5B0uy0HpV+ysVL4kKkrh9/kGeofszvZNMYPcBncMggAXxTol1421GqqHtRsvDnhVzM5iACAHSNN1GbUZ74L1GV8J

9R51H/UfR+2iHMfvxerJr8/PU/bx7Y3LgABYA/NDgAK0pG6rWne6sNEUMjaLQRUcrZfBpYDCmzLBTykIGSeDwhcs4wDREh7WZIOXpB2mjdM59rgaK2ms6oss2RwO7tkYlejVG9kZMB4oTQQvEFDDwjnKS+CeCA0wuRmEFzc2Qcf+HQUl+DcTAUfjhAbDRZUqK4cd0fwA1bQ1cUcMSg1VKKVDqjcKdyQVhHFQCwDnXETcQqEYrEaZ8lodF1Mw7CUg

ceFj6JKGgZfdHafzMu1FHLLtPRqOAD4HtAc9HEREvRiy7+Ef9a2I6hEdaqyOgiwG+282G9gH86oVHyknxB++1DsKdSdhYjKTSdKKV2S3Su/fS1keaM/8G3QZOe1Ha6QbhqgCi1gGOEw5HX1nIeF44Zfrmzazcicy0hpBQXro4mlWA/jo8Rscx/nqXgYABhRDRA50SfjqxkijGWPo0QGjGFkPox8eAg/qggMcwNaD+AqCaggEuAd+BAAllQp1HxaE

yQGppJ+IvEWE7ZK3KY87Rb/vcMLGBvrsX6Ak7KlEsDcjHh0jHME6duwP1iCPpArNbhp/7iMf3mjq61MdnMKjHQZFoxsWAPIAYx+wsmMdMx1jHzp3YxgiEILHAubjH8OOzicoH+MbVEedsNmNCQkTG/UcjgAIUQVowsSTHJrJkxm/J4HzX8RTGQLEWBsjGJyyYxzTG0QO0x7fpdMdZm8hESMf5aJ91YsfUx5jHqMfMxhzGn3WsxrLHbMeFEezHLMY

4xpzGnwBcx81g3MZq4unQBMbFgITGfMd9RyCARu0Cxk7RgsbkCIk65MaNYBTGgqKixhA7VMcyx2cx4sdLiHTHS4aEB6mLZ9urm/YL6IY8e38qmIYTRiABYGEKayQAH0QPgRnaYhPLYfEGGOQSu/U6krpB2nNqToFvVEmzYdsdByUJnQbe3ULSQHoqO1DHCFpw/NYBJRKx2qsG1SMqMO+xmhm77DkIR7WQe3QrVBL4UusxWqpHhc2GtIGXVUSDkwY

IejbGkb39xD9Edsbdu9QHswcoeqF8K+3/utDzpweLB84bCrv9hvlrHseD7Cqr3jIgWcZJVbkhMvgxWwal0iQA0NhzMBRttQcj3cyqABFlIRu7dsYr+1a59dvkekar6/q+hTft9AZc84vbrl19h857/YfraiQ6GMDlIEFcwsLsySUlMyCIxuN8Xdyd3B3c7Htd3Bx7ZceFTcEp9wZ/SsM67IeaR5U7HIfQADXARfzXELuyEy3EaIgaxkkF4BICYcc

WghBT7rDc2d0ys3C/B78KfwbT3X6GjnqQxwCHzst2RucHpXoo60ELhViuwbeHaOrVKOMhi/D77V+HEIeUujV7DCt+OpAIOPvOYTxAAghEoSYZzrs4x+rxw8fJqcfMo8dmff8BY8Z74BPG8gSTxgWoU8aNgaPHRQQzx+PHysY9TIqje4dxexpaY0Z26wl7I9vNuvQi+z3dRVoAA3Uj3CHGiPzpx03HFo3W+PJxe0bXhDyS5vttxiSHG/qAem+Lrsd

Se/RGO/rS6m4bVZCVKPQRfgTlbJOEJcabsBhCT/o9Wm468jmXxzNaGgdtuDfGQNu1WhA6GkfGetXHfrNPB1pHbCh1AQ1hbIAbkiX9KKi87PjkayWY5Y34RUYgWgNy6zWUEJpra9lrUZS0OFksRmmkzvnZsAl5dDjrR5KHS2rUGv6HRXoeB/u7yKtEu8fGTAbh6w5HzPH98Tq4tyTxedQoVmoQhkf6XnsYW8PThQaEyduzswAGhHHq8fkMEQaFrmW

GhWIQYqiRMT9hiPrtE0j7bXoo+7d1wKG8OmBgQKA9G58g4aEAodw6gxP/IOQCZobAkqC6m0JUWvwyQKBU+hjQCdA5SX86J3vY+zLDDFqEJ/kRRV0Y0YABxCe5oSQnJFpLxkCguVyHs+Qm2EfZSewAPIAKEUG6uCYmEV8B5AJ7E3c6BCfX82QnnyAE0V8BxNB0J5igJCZjEgxbIEAoMkChrCcA6H8QlCdYoFQngAE4x9QnrCdE0OL67Cb0J387A2w

mETWGZoeFhsd7exMcJkjaLCcBAVwn1NEFhsz7CcM8Jn8hvCeyB5wnVFoSJ4WHRPpSJ3QmHCaioXwmkaG8kE+IdyHKERImmcNyJ7WHFCfyJ6gBPDpSg5Inqic8JvWhULtI+99GYjqz+02H0BswATQBtcE58eoAt4ANBgLrZf2kR81UdlXpxuDKUy1q6UDCKHmbkM07O7u/e/0i8qqLB/K7Z5s1RxpYgPwl+mypGcFC1edlCinJOY77qMrJ2mxG1BI

3kh3jb/2nQ0MC92PtgLORoFHaB4fQujsofQJopTEvMazGsZJJQ9VbnHRrop4DLieomioHEj0FWwBR7iYaBsH1nibWFRjH3idMsT4mh9uK7WtLfibnGwTjcK1uJoEmmVseJoR8wSZdqt4n4S0aQaEmrqoNskZ6uGI2BqnLsfvshjXHT8YvJJWgUUGuUbdwW8cNxpoJHeybuuDK28Cc+dcFAILZY/vH/+oW+0o7fgunm0B6bsfR270HO+sORuk5h8A

5IB+GP1m9grXNfEKjhgrqY4eQhge4C8f/AWZoln2Lx6374w0VJotT0mhVJ56gs8ZhJsuUNSf2ITOBtSZ+oEvGD8c2Bkkn1ceHhzBLRKQrczABWiE2ATABJEZruzLgxg3mJEc9g7ITastg+YrqMDGpCigCqYM46nh3+MtkE2ldOmlr+SBRImAw/v3gxuZbT4f+h6kGtBvc1S+GKtuvhhjTFwe79eM0ioZcgh6tQ6gQ8IdG3BAw0ErcUunNmSzkRyF

UFKplUVxHpNRY39nDQXJkkTFeKmBGcozXOs6gdSZLx42aMLBAkgOwKxE4BH8hrDpwOIONzPuQdNvigaHL0lmgIngvazN4yVxeamP6JTNzencTPXmDK8FrOXOsu+cb8eloKtlHj7LXezlGuiZJxpVJ5w2OkFFAbgDeooDG2hlpGwZMBY0ZJqSZJeFYu/cNVLOjJ4rbVUadx9VHoCfkhjv6WBrbO8s0SuC/WEOHoIbahClofBJlJix6KdotR4JDpxU

Rmw2BAJsCAC8ANAjCaYDJPNta7UYYqTqTUwibXRslAAwlYvOhi/XiJ9D62AIHAAEgiGpGbLqjmp8BoTpcabCnh0n7lESgMuNzmyRBjDHeLE66NmM1gK5xcIdiBo2i3IvQ4pcCYaAJYRoBo3E4gE/AtICC9MBQ5QM9gMCnva24rKCm84Bgpk9I4KYCO5QZEKb4/L3Rv2LQpmcLxdA54s7QnhmXEXCn8KdzmwimoIGIpqOBSKb7lLvhKKec26innLJ

Vu+im8IdIh/lSWKdh7X0R2Kbh+5aguKYcgHimAOn4pikBWgaEpiMCIKYQAMSnwgAkpwoG96P7M2SndCXkp485FKbjC5SmXeNUpv7YNKajUnk78em0p9Y6SKfUpsinDKewrKimMwNMp7EDzKcYpyynmKehi1inbKd+CeymqGEcp5ym+KYcgASmzSeJJweHPHpPx60m0MFmABIBRGOkBeM6cWvxB/BpzyYmJ2/iLgYnsb277QcK2ru6+DruB3u6W0Z

khge720bdxjv79BtHu/i4mph+I1aa67gXk4cA8yeRQZFJgLOuwMk4uwBFIQFJAGwNsBDQeyG1sZLRhyDegO4BwhGhMQ+6kQYLy+aF6SI1BqurREVzfCgAjurefQiT8HoIG1vl+p0Sgf3xrajyO+M07MLt7Q8Ehkc/euQgC3NOTR1ybYOWJjyrVibAe1Zb4TEgeyQTE+sc4EC0RgxSC8mkOVGSC1V7Pdsqhg6rWqq4YNYAMGFgYeiBifq+fS1IsUq

12qYNCQfRTLNyKEsU0zknuYXehfNz84N52ugapvNb+sfGXyZMB64a/QfKq6sHzKld29GnoYf9g/yk7N0j9DGmKocwJpXb0BtgYEGUrUHdREHHbwYo5DGDVAQDxUzEGcfHclhJ65CYHaeCxwaBptnGXQZyuyaaUcahp/kmqjo7+oUb3yY+BJX9N1TO3VabFT3pvICETvoyCs77xaflJwWBr3MrhF+C2uofc8hE3afvgwrTu1KjRsQHuuIkBoeG6qa

EY5FAiFUwAX+bHxWJ+nrlToQW1YFU4gNVptoxHqlSGCLrTU3lRyrgbcdppkIK/wYfJ6SHAYdkhkKT2/pMBhKaNFRw3cdZVXTf61aaZcJaSRfG64Uk8+hCmdHOW/VbZ1oOmz8bkjnwirx0YGADOxpQG6ZEQ0rxp1pCAVumaYY7p/06u6fQi6+a+6YYQ5umZ1qjmtumGPr72giLvHSIizmrlcZsmyLbjbui2mvH40c1xslBnIbzAV8BLYp+00mnPqf

pUCmmknydqQHxNuhEh0aacOvX7HOm+fvtfQ2mfYa0e3nGywfmmxKb2CUxmRbouzvZB9m0hkiauFZKHabeG4PH57sQ+wwqfgGnpwemiVsNgNCasYHXxpunoGeYQ2BmOxrqobfHEGYuWoem+ELgZlemOhPxJzhjk3yJJpjaaqbmxol668cqAUX0iwHaILFAtLB+0s7dT6YzaW2EByLQGQ5Kx7sQJuvrWccuw3Omn6bVR1HHXcZgJsX68P3NpmyV18E

6McUnzgN8EHe0Z7qyW0BninsES1KTAmm4gbULDYBEIVc5DAEjgRppL0lJASC8t/ygga14iwLjgVVhBJpJ6IKKWhoYBfE6kXr3OFuU7uKpm0F77C37pPmSMkVNubEBYPgIRfmaS1Pbw4MaJbNUa4kYDYFKRNABLGdUamxmhFpZ0icskgEcZsuVwSzyaIEZkZrn8USJNGBHS+cRJYDCaMcxOMasixRmFbuSPTRhaMQVgTRhT0oH4lJmx0MEJ3W7/fM

CaRoA8SQVgQpmMid8M3W6I/KK8wzGnlqt0fibVwqE8nVgSpJNgTcAtIFPwRWCtIFeWtazRQWTkzOBGmd3W3Gb6vAUZ7ty2iLcB1RnmgHUZsJotGeVW9pRSdH0Z43ZOhBysttLLxuG27itHAHMZlXRAmdUZ4JnNxrsZ+jA8ZKcZrE6JiwMJWuj4kphA0/Dz/A1snxmdRhJGQJoAmbdmlnTE8PHgF7jbGdCZ3RKImb6EXJpM4BiZzqg4masCVShEmc

WQPx5GmlSZkvH0me7czJmJu2yZ+ppcmdUofJnNbqqZ5Ra4iYGI8eBxmfKZreBKmYhZrwHMib8MuHz6mfpuiRMCJofohTy2mYT4jpmumZ6ZvpmVCwGZm5Tf00tW6U77HsB4cZmlGb8O6ZnZmc0ZyjbFmb0Zn8ADGdWZrFT8aCEmzZmzGfxACxmXmaIjfZmPmZCZ7tJ7Gb2nT7zTmclO1xnDImUS65mcQNuZpnQB4F8Z64Ynmf1m0F63mYOZsMSvmf

CZpVnImb+ZgZ87gkBZ4IB4mZBZiKywWcKZtJnSmZhZ0tBEWdO9UgB3WeRZzZo8WfMJyIySmcxZ72tsWdxZ2cxqmYoMolm6brPm/lommbTCsVbcNpH4zOBOme6ZrpS6Wa8s/8BBmaZZh1bVgZoh0Z66IYHh2bGYtrIZ5iGeQBRicbBGgHcChMsVlTpJl6wmGbfzdDq8rDGrK3GFUf6p3eEH6YdxxDH86ZZplJ6RfvWJoXY1gBIWpkG3k2kUZOZ6wd

Dh+JdWoHXaHgq66YmZ8Fwq1vkkjhDzEtTAOdnUsdnZ3laqqeIZgtnt6YwSsOmYIUjoDqq/ygvIuhnTydNTc+nEhOHAZ0z5HORsgylOGaoUjnGO/Iv2056ecZeBnR64luEZxYJYBDSpVkgMZnW1Zb5e/tNRzIKsadDxqjdcYpFkh+j9ePCMofEBgChLQJp2OowsL/KO1uO2ntaltoKk+MDtGao2h+jyuulQmZBlKBFqU9KMiK6IQyMHYCA4qOB6US

LW/bMlOLTSGWhTZu9k87Rwkz4QZk7CgkACWjnpRVWAeMMQOYzZqfRwOfNmuOAa7We0GDm3vpO0eDmtRsQ5hVaKNrQ5o4QVQuiR7rqwkFv8Jp7gfTD4gjm450kAYjmOAFI5h4nyOcNgF4mEgCo5pOaUqGY5r/KZPhLmpjnhRStmzaKBH0ZZzjmMLAg5t9AoOb4584n9eKE5mVaGJvCYE7aOAX7W8TnYfSk52bqZOZw5jmohMXw53uBCOeU519iSOY

0adTmSQIo56kgdOYPOvTmERXo54ubqOeM58JNWOcjR3Nno0ae2khnC2drx4tn6gFPwdo1MMB4AcDL5aZiWE+nbgCdwU9nTXMc+CzVYZFDqQ/b9svCyttmVUZ4Zx8m+GeAhnKGO/vWW0ELGWpc4fmnfcevnV44w6hL8admCLpX4vj9drubAFC152YXyCcaUGF0JcbmCaDItVSTxPJG5ovi5ucUmnxpJufXZhfbMua3Z56qt3pM2LeAYAHqAegASMy

PZ/EGnTFrZ+TTGF2BgI/Za/qKOxVHb2ckh5HHeGaNptmn2uZMBlTbQQsBM2GR8dvSygPSMBXHjeCGZGYwJpCGgOZBKZ6goADu5N2Jr4lio7Wyu1pGQB9blYCgULSAUUCC9PfIbAhNgITc5yyxkzZANhh3MIAzhhSrENABpRHh0Up60IarEtPH8KFPS7Div/qPmq/FOtuwrVWgr/v0xj7gIeah51uIS6PTKa/xpbPh592AXmJKYZHnUeYBzWgJMeY

U3bHnnZLx556gCedJkonnQLDyoUnn44Y3fCnmfvOp5rFDgAj4CBnnnOKSZn2A6H3vjHcxIeau2mHnuebO2YMpw1rBmpHnz8CF59HnL/Cx5nqSJeZmdfHnBIUWMtCsSec4YRXnW5mV5vVFVedp5y+b6edm2xnntecAI1LnCSbzZqvHXBrjR7dmhNMqANmRDaln0ziBEhWPpw3HZBsu5gLtBKh3BfghdtRr8d7CxIZ1p9yw2/LvZliSH2ZQxt7ni6b

F+6ravucjQeJQUAr65y61jQ0zQINTWKtlJyx7wGdM6MenUIuXpjCKgyXb57ungzrb5wiKtuZmxgl6I+b25mAkOAASAVnK1gFgYVlAzuekR2ZEU+cSE5LoukitwjMnRIZ/zO8nG0eHxrnHi4Nfp59n/Ycx2rDG2VB7pZnAUtkaFQHwG+f7OkHmQ8Zb5ldAfpNOY25bF1ry49voRmZaiuIjkUNn4aiwgLD2dc7RsmE4xqKLrIqOEbKT1YBN2Xa6rtA

EfUW6nwCZUmoh2VJOks2BPItmuwAJQI2fxWIGbjqsi0/A2LnfGsgznVssDMKhegZKkpXRTGGcBlKyFkOk+7nQ+ZLM572sRGH8KsaQpTsHSfVnO0VVY4H13lpXJy2BKYoc2yoBb+fKspagsYH1YZSbvlpRe1AAboqhuiVD3+dbJ1n5v+eVgX/mX+YAFtqzgBfW5mFEwBb8TCAXgXigFuOTYBcGiqFiUqEQF+YHUScqUVAX0BeCTE04sBZBk6Qm+gd

MWm9JCBY1k86cSBZxi1KLAmkoFiFxDEEVGugWlRVguyfQmBbiplgXX2KVk87s7+YXW7gWxOKIkPgWpBdmu4QXzrqt+z/mxBbu0SQWvoriIwAWdIpAFuIizEy5OyAXoBf5kyIswYvO0TQWkBfqBlAX/fLQF2TmTloPW7AXCpJMFvAWnQIsFqxgrBcX0MgWQObsFq/EHBZoF5wXTYAYFtwWIACMp2ibWBcVxu7bJsb7h6bH82aH588K7qdz2PYBsi3

ogTABWgHHndbG0nHxBtgwwMZtByDGLQdAmQKHLQlaDelB6YCyq8vt8wc0lPWnaHoYbJ8mv+MmpkwGRdqxx1vsKqtYMQZHq+YNRm+hiPxLUbk8g8cv5sBngKYwe0RFtcHoADqrsAG1wVgqpheFR6RH5f03weYXuWWL7cgaNha5hXKqtEe9hyAmFYuTJ4D7bdvMcbHa/915ykRlvyceGstgAfC1+2hbjidkZ9+G/sfQGjgBT+MkAAi6Qpm6qyA0cWq

pQORGIMcBFgv1F+0Li4aq0hJbZ0RUJwYQxvOmfYq7Z3RGJqYEZjYmK9rfZkUapcvmkcRmY7w/YeSlgwdFpk4nfsdLlI6rZ/U7mCUWF/WHiv2nyctEBvF6Muc3Z4fm2NrU1WG8EAHnEQioneuPJmyqlaa87ccLyRYlR3b41fxc4HQ4s+abZzOm89t7/YtxVaqZF5rnO2Zb+7tngYY2+9DHb9s/puboKHnfYQHqrhaiUUYwb2FVdadmCap12Alg2mG

3/cJKKavAQEMX4gwKHWINbdjCQKMWwxZjF67T9brn29LnxAcGwkOn5sd3p7ABYGHbI/QAn4B+24rmfheGRwKo5hfkRhYW6SuAmT7VDGSi/SM4OSZLa20WYyeZFuh7WRYYGg4WORb7Z8Q6sMaVevBtR2eghx4xWKh0te4XeQcA56/mGIkFAq/ELbS7AZ5nDWeb1O6oUWBe4uVm/jqv1ckJ9tPCTTf5bCr4QYRMVxcOwWSIJxZngKcXdmalZ+fV10o

XFw2AlxYnLFcWtChhk9cWq4DGCurql4B3FtRU1JK7ec0hJxY4LGcXXmbnF8kI7uIvF78Xrxcky75C7xdWnB8Xvxd3F4PnCGdD5pUWBhYbmoYXmjSKSTsBWcrZkEi77buOhzvl65CZKVGFJkekRj9hltTruL+4/bKHB/b5BOU1I97pNIOIFFthJFjS6RDwnf3X57u78YPuBjKHIRaeBtHG/YbLBmo7uRZbwZhMN1hkugUXT1Pp5TXTgGZQes1G+Qc

JMxe6LyVIlAcBr7Q/JSzdSJQdjBzkBQhEIF+1XySnqOmBIHFq3N4rVzqMAEqknxa9EU8WUGsOFTYAzAqgAHHC6TEBgWxZ2CbAodw6F4DmQnUyXkvCeUyxvJEFMgaketvtgQ8B7uVF0eoR2ic3Jz9GuUZ3J3hRPRWQl+gBblFoa4h7bdWdMZm4KRaGQqDyhlpOw2DVauZQyviLGxfvJ+0WWRcdFtkXnyfe5sX6HTsHZ03BRKjAQtKb/ZF3JArhWM2

HFkSXRxaeFmjyrhnB+k+T5zgJARwB+jgModOGW5RmZhQAeuznSKHL7iChY8JNp5XHgPZmW5UXFw5mWdIVZ8uFqpYE+qjm3aEalnOGWpfUZtcWVoFsKrqX9OedMScx+pd/FoaX5WfowchExpY4+0+SJpYaluo5ppbUZtqW5pfUSq+NFpYRFXqWDWa/F1RnBpZNZjaWEJQgljrioJfTFi4jSGey5hbGtIC7PTYAQiWAURuqUrtZIZ26H1WFFvUXrQn

s2G442oXnMhec/n2B+W299jntmJdT7NgWZe9R6UC24DkaG0fol397wCaYl1tGgYdYlt+mG3VQaHMUYiCbkZEX9vs5cQHxwwE7wFanNRJ1ErEw/BAhsUHDxyGeHaExzW2UwHMBvRzwAYaFqsvVsJjDCEZ/IIwBAOjK+m5DaTGbgMAw7gB0eax4yV2A6GyQjTvFlxBrX6qoKzZBvmrwIUXVxAqCJjjRe7W8kEMqw8orEdoWgTrXJghrojp8lzonz7P

JJqoBYGFaATW9x53a81CWnfHfmeZVs6GXqLZdTyejdRRQmYzn+L3gF5ypQT7VMb2PpPciKEsEqD+KL5CxkDywIMPURm4HPYZFexiWAYdbFttHMpdL5jYmJLq+51khPkX/+AWmtggO+ODZLjTKlgDnnadDxn38nM3VIEz9b7WUwH8A4TExyTe6gTJvINGAQhBCgRXQ0AS+Rnj6aIDvRxSRRNB71E4AL0eIAdmgNZcsutT7tcDM+gVysnCTy1nUlZc

BZHpy5kKSeEx8HJYf2G9qA/vYoUm6rAE/qgchvJY5R3yXtya7cmABOIHqACkBfBmYAD1NXFukRr3JOlgBFsP4bMM6SPBsMeJ2et2Hc+Z0UZKWN+aZp5v6aQdZpntmO0bF+4q7hScGNaqVV6g7da3kVR3P5wp6sRdsRhpT2iE6k0mhx8x2oX/n212HSRadUqDmlm5Cocu/jJaX+wFp00BWapcSPRzHrfpTXaBWsGH0AOBXnTAQVneMkFdkZNSSQFa

bSNBWIFZLxrBXVp1gVm8XpRVOl7eNNYCIVgfn+hdjRwYWqdtERGAAUfkN7TcBRpEbqutgIkz/2NyjvRc+p9AdnTG94dZFhLUURiddaRO6SQPJeqNAMKKT+XBwxqMy6JaGpqOWRqbFegunxqfjl+kHvQfDu+Amlf2rqBpL05fplenk2oWBlo4m4PtFFhyzcsvQADVq4VXPZek5jzLzAZDRpyBK6HwQ79k2QDEFH9hdhaMcGycXa2fMtIHua8QLRND

WAdENPNyZ650xWeoXgDghlggpVVWHAKHVh5ClxAsA6eXqVBBcusCgF5chELOA0lfk0MkcJwjjwylAV5eNh9r7TZfqpxvgTojaATHYXqZthgZbpEbChArgT5emAzbhcNKLzVQ01Efz2llrUoY7ZtKWn5adFvGXd+bLBke6sMYpE2IhDHoWamXopnBJCadma6LAM2wzDYCQM4lSNaByVvFsAIFiV0CQ3prIQctVhZLjw0zwqZMwOHhgP2OVgQJoslc

aYE8B0+O1ELwWviZnogYAwxoWVlpSHlOWV+XrfzBPAdZW7GE2V/Z9E5Jbo3ZWTgH2V5vE0dAMJE5WJbrOVg3jLlatm2ZWHdG8M+5XYopCAJ5XVldeVtYV3lbz0LZWvle4iH5Wl9WvxAFXsmCBVkwqtOouVzoXScoPCr9LUxcDptETg6dqprMWzZdM2SOhNAFwKAhVQpbJpjiiCBAhMiVGYgLZQDNqf1nm41fnr5Ye5m0W4utAJx3GHRb6VjKX2xf

ZpsX6wIviCq3CCBnrgpo7Q3LJI6dn6IHM6sBWF8z2oT8WiI0I526WjmcMjKHLMtAXKh3AWQlyKu2FkbXt4xVXBOofk1VWrpfVVuOdNVeGl8prf6TGCx8qwiqAENpJGusqCZG01JNNVg3YOPotVwJmNVfPF9aWsZO1VzcXHVflhSN0RuuAXI1XmFbD5k26VRc1BzdwXEK3gHgByWKPJ22XmsnL+1LZvgX0EFBT4FOSgT2RRYkKJCdmraQLaUvw5dh

tSJf55JUUUWrn5LwyWboxVFduB9RXm0c0V2OXcZf4ZsVWNiZYetxClSimKO0HFXrysIdoRaaEl77HrNKjcj+G8eVpPUWIHOUg2OkJ2KJUwR7pVQHNbKPSx+GEqbpJoEbJhxsntJb+ZfVWBwGcAQyN8KSNV4yXgABHAOldRZb0OY9GA7BiVnchBzEoOPqgxJGAAAWW/xAYsJPKkazAoEubM+UvEjjRL1evV3jVUwnvV0UxEgBLCXWWEudhmg2WV3o

3J1eWTZZLy8pX/TR1APC7cACzKuBTPlA5UGGRMTnwGfEGB7Eplq+QINTlLQlL7PzPKVyVV4Qy7ZBbYyAGyHnERz0Vy+tHBqfrVnu7G1YgJnGXg7r0RttWhdjhkIUlcMJZPfkX3GzoC8kIodwAptV6Kpf5B8SWVPDegf0BYhBx+b6FwwnQgMVAYsCXqbWwx6jUFNUBJ6gEef4N/FZMOpVI3DsqUEVcGNBPVuc4IGrTSLWXFyYrEIzmy3qTywcx2qA

ZRMt6QOhM18C73RDtG8WhhmLM1xxAnUTNOdC7j7qCuk2GylZ3Zg156IC4ueuSO5u+Fy1IPqY1dS6l5+ff636mgX34hvmM/lWUNYtrOlfdiqvsjG22Fi7HOce+UfYXsoYTlpjXat0rB7HGAqt6DDE5JUYWpjZFj6GJxrtz4+YX046pYFOwbMHGSuaIGgIQKGyTp7bAXYsyqzJ84tfh2sEWoapWJl+m1idflxpZjgDhpn1zFpseZavw+iUHISlppGc

xFh4W5GejcvH7blEaARnKtP2a0zWDolEIGCrn84upFoarxpW1p3lXxqvZxp7ndhYhFujXxtP5Yk2ncJhN+qKsvajCUA757Zhtp2yo06KB5sbWRxbzlscWLqrOqkpapVEuquXG86We1iCpA9rXpw26N6aPB+uaqIrjV5TweUbWASQBSAB1Xa0yAutY6eOmAhCq6OrWR7A6o+6xDav5NBTSs6YbF/lX9acSe3pWEyZdxtrm0td4UcfBqBzJE1o75BO

9TKXp9Uf/Zp2nQece180k/4veYf5BvSjyPFjzKIbe5KUXJZXjFuBAGda1FZnXpjPnud7WJZWkHOpgude5vEmredbYRafby8YVFyvHoJdYV2CX2Fdz2HkRm1kIAUeFrYcUB1vlSudMqQPJltdxWYCZDfuv3fLbQputFiQqMdYpBwVXsdaWWzrXDhcoWQ4AcxSYVfN0cno/WIyloo1G1qxXAFdOJ6hjeQwuAUWAH5LeYTOqAgdiS+jmGFYXK6DH1Es

dCvNrGFbi56a7TSecdT3XRmDQV33XrEv8pgPWCFdAlkPWC5PD17qXpRT4QXUnWWb/kMQA49Z91tuBE9f9139iU9eD1rl1Q9c7XV1hM9YM5jBWgLCjVmXXq8djVuCWoBm9Ad7TWiEkAQsWjoetmSkk46QeSMQVW8Gf68koOCDS6fuA0Zg02yv6kgDZ3UzwYqXZ3Q8Ez3BcVVKwXYRHpJKHvwcmKprmm0ZwW2jWxqagJ0VWspe61iMj4gud1Eel27p

r5u95+bEGQtAngefu16nXKpYUOiABR7D4CsK1nYzPaZ0Ay1CNzGoAsZkxcknBDbGBrJTW11YCV6ABBVQr15wBwwAfa/kgFACapUWWJSHkwrfDTJcYXCTCY+Ti+goQJqVHKEDpnJfdEZpTaJsPO5aGfWvT+lzXM/o2h9zWo+dWfUSMhAGDBdNlKXq4cZV0ecSpbRjoh9YTaWjp1+V7OwrXHNnhsp6Cktm5ZVpkFQ28h/F5+BmW+APJV9YHxjRGliY

ZSrGWY5fSlnZG8dd0VoyYZHi2JqcxfrkWrKCGURfSFUcjPnKsRtbS3dbFF6mjKFmhMJZFPF0kWYjRYcjgcWFXR8BiEQ8A1QFNmW5sbY2JcgA2VNabJ3ihYqA8gcMBP1Y9am8xfmv9xKXrNkC+S+A0azDcNhoIFyYfRw+olaCtSpPLdTgkW6C6nu2R7flTKGCc1g2HLqdA6wg2+cPsCs2WjAHuYNmRqgGgQAb6ixZJp6rX3wkssborZgUXZNQRs9t

vppKWTde4Zpv7JvMkNhh7nRdF+7rWgKIMG5NotFVRqlQ2HkhliD45huZDqxlhsmEdgNHonav8IJ/zNYECZv58zxc+Z7tIBzlGNiPW6OaEI4PYejfaU2xo0iszq5lDN/OGN48Wu9VZQm1WJjcXKvhAkFZJywJLujZ6ivo2yagGNllMhjctVp8qxjaXFyY25LOmNrPWG9ZelwkbGIaLZhbGlYMZNaFNNgEXymvKnbKowWyZzKhJzK3Ch9dZeAo3FiU

Nq/ip47h5CYYxujEZKH+EDsbLK8KEgiGU6WNpukjRlyjXI5eo1rfXsZZ314Q6BldLBht0l3XkNh5I/9j5CbDEud2K6amXP4eFIMfgt2nrspEwzmqbsknwlbAwEFH5QYFNbeBxHMxHwVdWknPeKzAq/n3ysXAqIGvr26wDfBXECq/U4iFPICIAgSrEwz+qDatgNj3CmqUYXQQh9NcwNvWXVyeKVzC7Slcg1jzWEcWxQU3UiwApASog/BtKa8N1L5G

wJd7phY1FrOl7m7l/uWLQxLljaCbQwoYg3G44giDbuTDxxMm8hqVZlmvDVTK7hDYjl4V6MTdIql+mkyfmq1ZbIVhew+ZU8nB+1QHx22opN9ABlLRvQL4dqyaYlXYQrcPuK6epsVSw0UdrMHENzP3L2KBEoZw3jNcoOPk3XkugawnMmcC+Sv591yQN6wZJDsAH0pWhRjfVN1zXNTdIa8pXcAEt1NgBlwsqICXCdRcHtbyaGYHGBUmmaOB/BSnYjnK

ZKMo2m4whqnbWIaaLcrRW+Rom0/fWmNd9BziWI0FHUBeTQoZFxsk8wBOnZjnTTjaZm7yKfQrWlk1nvIoHOCeVauo8MwfDgBDuNr/LadIxGTOq9zebyA82bVePN9UQy9fEMi82i4j2Nr3YdzbDq+83WQsPNtjLm8hPN182Hzd0Sj824uYeNoOmMxYpVl43d6eYAQ8mdQAhO4F4qDdAeEskq6g0KZ+5olDgNSJ7sBAKKIbmswbLfckIbudfhPYbtgR

JCelQnXD7K9Q2KNcWJl/iAzcra5iWsoaLpmQ3GxgSACsHQQuusB/TU+rveLtXNuhqqkUWtDZsVpUqYNBEIO/YQLW2VKcgyt1HqOVr4tzhAX9S72HBrfMBdhFZM0aH1ryTyoArYyuiVpmFZ3gyVk86glYwK+WHSz28Eb3Cb2qSoJJXphFlhkkgk8OVNwUFVTYL6ZRKtsVAgDQIxQSB6EUw/LqsCo2GNTa3J4g2zYoa8NBgtIE3ACkBmACVoRPmh9a

/uU2CczvUcBRENuGS3OrnsOvKNnhqh8Yfl6o3hVbbF1LXmLeO1hcGD+fWeUtHWjbJlq6pXgsfUAp6arpv1q/m79ZgPBuHz+nOs8mSfzZeZp90mwywsG1WMsc9De1Xd9TcSgeAaiHQoTZgrzedMOoCWddvK6q27zdqtjMMGrf9Vk1mmrYzO9HLi9WMRVAAOrbUAEDMkFZCKNSTdjIyoqq37YBqt1TH6rf/NmLHmrcmtlwMc6tmtrq2a9Z6tx6WJKM

VFx430DrelnemzZfvAesAWQDg6sDpZzIUUOyUINRWVRXLEoCWRlAjR43DALOhSyt/Y3u1x/O6MTZ49hqgMJZE+CsycE+ghDdpp9fX1kc31wM2GLZEuvfX8denqMCH4gsHICh4I+xMVuL4+jBlPWM2SQAEeTWxxMCnqRWxfrjx+YKp0ASOAWHI1SGK3BHJeaIu6Ww3uTdXO+kcIGqZwWxYN1fkqlvYr9UDkKgq77i8N2IA1QDpXSpk0sFZt93DZMO

w8ay2wKAeOvd0Qs11OSyX2KGsl75D8wEbNpI2S7taqmGCWQHqAIwA2ZE6qkK2+zeHNsART1UM/a6wOVBGmjpWjdZwHCo3H6aqNkfGS9qfZvE21xyCGQmz9pUIaPDGo+weMRGFzaoAV8bXsReqAiq2sDxoMsOqD/FkStcQAhXvHTsQ1jY2t1YUrjaGl8a29EqKxnOGOMN6tsXXKrfH46wrWMu6ISJLg7Y+ZPhAw7auluq3I7a2tmO2+EDjt9OGE7f

KrFmrM+iKBV6LM6sDtvlF7QCztthB6ECZmvO36CgLtv476CjaenLH47bKkE63v6PlOsPaAdfnioHWaMhu8TAA8KlsgWrdvjcfuj9EKTj7cJZx3HCH1tqFllUKcalKRGTSdR6p5L2+Be+gVEXdNgUIkNbUgxra61fRNhiWNFe312c2cTdbVhc2CdbyhoxGfwRWVTMmTuKpbNiiPbeKt8qWHtbv1qAEyTkT1FH51ujVIAj7VpEf2L5FlMFssbxVPuk

dwBFIMTNN+mQCUwhPRsD1VTJva2w64DnoKPJWr9WYTZIAdNcvKcUxuPu7DTwMbJfvR4IAa0E7l0B4HJaO+WnqOQQlyHy6/nwcl+28lbfWh5I3Qrt3pxoATwmLAEaNuzZyNkHx6GYS2UzwWQmMxOzdeQkdSN4L5ia/e7kmTso0ex9md+btt8UsEbUxM6rpHXHFazG2ABHg8O6MKdZ41zGm37f41rbTEscdCzEUS7dnMZgWaBchmrSAhWgAZKrHKWG

hewvU4jK1gUwWfAYZRVgAo6ziNQ6bYkDbtvRKCBfzop5aN0B9gJKjmHy8R+fxV+Pq8TR2i9Xjt3R2PBf0d+ObDHYIZEx3vfLzorSBzHdwF/oHFPV3Yy2tsgACZz8aZvScdvhAXHZUCfogPHftGafx2QPT44vi9Sf8dx9IsLB0dscw9Hf1mgx2jHZ4x1tVInZY+mJ3ShbiduxgEnbsd5J3qZscdict27fMF1x2Hxuydg59hKfydgHEn/x+11x7UDv

7tljbK6vl1+CXK7T3NEjoalYOhB+7Ipm2BIgR1yLu5lPbsHHYVZ1IsOpo4MRS/qaGNOE3U0Dl2bBMyXhXnc7C/7tOxjGWxDejl9MAUtaYttDGcPwSAXbjRdqy1tUi56geSeanbigX+R3XpLggWAHac5eiRfvlkuh15d3XmpX8l+Ch6IGwAegBWgGoIYvrn+vIeKfXJUfy4CkJ5sLW1BYC6+r4ixvr22ebF7RHsTfK2kM2rsoSAUqr4gtY6WMhgfg

O5K1TaumnZ36NSLQgRCi1NAkxoaeIQY0dtLhDaXb0JC8QGXehjVGg47Rpdjh9FCUvECsjnHoNukZ2+7bF0ge3acqHtpVMblBu6ErNIddBxt6nphe8mw7iB1ARdzdQBxmZIXiKroRD9cLX6RbBNc52ZZEAepK3mkxud0SKkbYSAQxGThYxfNUjotH8y9jWrDwjATJxBkaK1vH7nwMd6+gBRqB4216n1YJWGhV3UYW4dnRtgRfMEoPrqHu4E3bX2tf

ht8R2QYYTQz/RetZxx71NMdS4t/2R1KRRWK/W7tdft2/X1HfRB/yZx+1aAKAB8gmcC4kXYXaKTCfB5BqZx818WcdLi7bXErcLB7nNnccj6uo3e2YJ17VHDkZWFqnx77ZrNIvwlLUIaadmbHs3BvUndwaVxm6qQ+bTFyC3Xpay5q63ylZRQHwA6SGM+IVii30CG2eHfXcHpDG0Ggg55PVsLRYQQuJ7fwcttzfnl3O5x8N2XRfudrtGJDovlgjTSZa

S3eSlScCH+lR2xabTdsSWttKtR8uBeXdrA1fqW1Unot2IW+FS1HWgSaFSHe926XZGgQ4tn3ZI2zLDzonfd2rVHwGf8vUmf3dZd2FXy4AA984YRtrz4D92HSnA9oZ7JdYDps63h3aeNzMWYLbNlyQASOgpAfsgKQBP9ALqjZ31O2XDccQtpRjpiENS6B0FDddDQu3HFvrtFq22t+c246Gn8Xcwx5c3+7FKEqtR2A0Ve8AQLbxmVoQBwynn4x93mrC

+JwT2TdniBET2xPOe9aI4hPb3oqT2ILbJVqC3Lrcj5ny32iD3e6oBUcTYhxDqRvrWiMNXjMVwGO44EzUmWjJS9AanN8EXQ3f21uc3DtZiWhIAHsfgJtlQsZmYo1abPgRkWTkg/nZYI81H03cMK+HyEMzkYVxpmjxGgbKgGck1gbFBR5l5aJ20N4BiQOChZZLwCS3ivGBKBTW1cQFqIZBASSCyAUxA2EATncuBLAgdmvwIezUyNMxAwVIbSHs1wH0

whVn8/ONaGqCakDOGEenm4Ux2oQFg0ACLAXBdtnRn1ML3CAEEp9xnuWHvoxZYo8GC9pcRQvfC9/VoULWi95oHbmfi9zRBqhrUoYWAoBeLgUmAMvfjnL4VsveJoXL2803y9j61CvY5U9G71bW84sr2VsTh5yr3ygeq99Tje4Dq9ii1Gvea9vuYuUTa99ynOvew5484evaC97OAQveIkQb30UGG9uZgK1Li9qWAEvcm90ERpvdS9ub3kMyy9uDplvf

LgIQI1vd8NDb3GIi29ll247HK9/b3w4iq9/0Aava6IU72Gvc6QC73q5iu9pcRs2ZEBtD3pdfOtxU7oLfel3emRozugNkARcwZVxKBsPA/RIt3+g3oKIIg/fFgxuK3j9vtxjfXt3fKOm2293fqNpjXMcawxwvIWfpdtmptY3VrUZN3Xda9toBW80OeoLOAmvYgZJr2vOI55w+jkwM6QWdIuZjfEam7qnZlUNvRQPa/dwyHs4Fl9o2J5fcN5znnlfa

LAVX3fRHV9lfHNfb4Q3Gg0tTA9p+SdzBl91mhDfe3iB6ITfcWoM33aZkt9utjPOJt9xD3ZWmQ9r7WiVZTFqbHcksH52XXAdZb12cNyOpr/BZ7ifrKaxwrd/l4MQYlaCIVd680a1E6GQnEdEVZ5PRDq2TpeI/ZBSFAmGzdEBGXqGk8vfEPt/03j7Zo1rE2z7ZYli+2TXf5xrK2qTltBXK3Bp3GMNp0Ljlxt+oI/BDJMocBYV3ygNxW9FBWAAu8Ufg

MnLdoGMDslXqG9WrE+osAxJAikRRb3RExA0DnwqHfHWxY+3oa/IiQiwFIkPm9B3rfEYyWR3v6/Uwn/mvYoPrZUdA8gJr3ut1K5JfE0HyBJNy3TeqNl8DWiDa1Nkg2LIhYuZoAxcL1gKeG1kVtBRYdtl1pG6z8roXoqd2pV4Xc95ysM2nDqJoJjERfCALypLkLobNGB7XUhgV7gCehtxj2/nJPtmv3m1fo19kXGNYJ1j3GI7uXnQKplDbyt5yV6YD

uG3G2YhG0cg9ocfiMGh+hAUmWALYkIQZvIVDY0ZkAELYkCNStbBm3YEbXO+1tNzuph1gnn0aE+sImZ/bM++f25PpIR+z6o7FL0tYQnJCLAUT7RA9s+iVdnAAkDq2ApA4eajmgiwBC+tSQClXE+nyz4vrs+nWGlPsQklr7nNY8tps2vLef9ny3lAHnBbW8PgGkcth20tpLOGPdATR/RdAR5ojIS8c2zPcrdr2HLPZxds57BlfxNyfHDkeBsKkgFtP

kEs1ZvoJd16xGBLZHV+LV6USMi53mAIGt0f32wPZsd6/294xIQJXyk/LyR4H17/v7EedcJ4ljerFCWPy50TWBYUOuUreN/YCmkk8Akg5198uBd2LSDhYQMg8T8pnRsg8n0XIOC0y7AAoPBvzlQ4oOI9FKDoVCrZriDyfQqg7992oOncPn47rsmg9G9yp6OZroodAHZvCpOwoPFpPx0PoOJTHV0XH2ehYrx/uHo1a3p5vXJnagGRJx1FgMANmQu9b

V1xbAiBtl2dBNccR7WV8HGyTlRyTbWfYY9psXUpZbFmo2YpvnNk124CY49q6oi/HWwoX3PsLFB20FbtfF9kq3Hhe89r4awEoTA5IPCaAK+Q7SVqEVUaEOmnt82570YEtt9z92kQ8U9j/zyVZU9kfm1NTqVSQA+qC1t7I3u9cl/eaRZ3lsmDNB//YWcB/CrP0zQQGAQFh+8eDxWsk/uHybTvnycAt1mcGUEKlpPA+6V/n64yfPhzR7gzet2+ZKEgD

j6ol35LzUEX7mGwbONKZV/jVgi9AnQQ4m10dWYCk8EUZI4THfCBaJoTHoqGKpQkWoDyEBfR0XGe6xVPDECo4QNA83a5QOe9LFhlU43xBayxUzAJHCoThHPqHYoP7YxqQ2oGCQ7/fXJtZzwOpCuoNqFsbWAHomTJYu6Rqizg+RghV3JtFesT9RMwfk0pMYBtErKyIbTPfEhkQ3aLZDd6t2jXdim9K3rdaFJ74OPcFiUf34HdfOA+3BKZf4G7Ka7Aa

EGz4bMwUNY7Vj213V9peBO0kaoA/wuUTrD7FAPlOCRkdLS/m44qCBf6XMMNEOFtp/22k6nltqYFsnrfqvgQvD8pMMZ+HRl8PqBooWdwMRDzpApnVa9/4nS1INlSUB7ZKx0SHtDBd4gOfoPRuFksVFmuwNlJE74AmiooWhQL0rDtxBqw5vEWsP6w5n1JsOWw4y8tsPKdA7DvPAvxp7DpP4xjpvAflpBw5NJ4cOEAFHDltTOhAnDoGb+VOnDhEPag7

nDpeAGw+IkRcOS0RHybBAOJvXD6k62zJphncOMmCiNkgB9w/W2w8Pr/xNFQsidYC1Ys8P3hJrDgiOII5vDylSp9AopqiNhZKfALsOg7RfDlzm+w9Ixz8OLqE4xkcOYjjHD/8Oo4EnDlFDgI/XQWcOLw/Ttq72oI6IAGCPVw71geCOD1rCQbcP12N3D9bt0I6MizCOJ7g2DgknIJaHdpT2R3d251UWuvu1wVohcQlaIZIAvquI9i4PYBAjDp8H86C

EZSSDw6laSblXm2dh2j2HK/enNuTaUrdqN3E2I3YAohIBUyfgJmrBDBDZBzYroNQ5CUcjIg80NiX3gXYaUhGdO+F5dqbnNliZYOohwo4n3Ob1oo8xoRA6hnYHd5SPSVaxD5T3R3dU92YbwVj4dLSAWgBc02pXLuthdnfbNXRMj7bBI0CrRr+25Q1Ntuj2UA+eDpj2d3e35y3WOxYJ1t8ncpeG5PQQhVhtdlyCWoD6yDNBp2aUZqeAGAVxnIap4IG

E693yJONmaL73NmGqVOhF44ksLAEDgVcGYbEAho6rA0r3WrO5s8IAMHyggQaOjhAFnEaORfCs61niAgkmjnPhvvZ7MlfwMgFH6bosKehMKpaPyABWj7L21o+FUjaO/bXE8gaPOqAEfBVCcKAOjvSHbuJOj+L3zo7wROaPro6uu8Jg7o9XIZBmWXfWjir3EfcxDuyb0o/Uj8V2rvG1wZ2jatOaAaK78Bs9djbHNdup9ogQF3f8m0HatIK4cd6xyQg

/mGKkQRbd7de7EtfvZ90HWuYY1y+3p6mmprmn4RenZPQQmmRveq7XOo/dqR13iXogAVwLCAGxQVrl6wG1Fj12aBI2xmCrA1WSgOn3nYp6pqNKKY9OTVrWi9oajlj3jads9tIaq3P9BhGneAHJpT6wqaYWaoBtFqeBDqIOgo+0Nu41yGYkAZoBNgFDSupUB/kj3f7VcY/oSaWOTBMGq4v11taN28cHVBsx1tR6Wude5l+Wrde61zmnsw4KKGXor9y

IDpLd+HeitwMW3telxp7XZRc/7T7WuhcTfZKOnpZUjtKO1I72D54Xc9k4gEuBWiB4AeJw5nddxMi6zn1xjw8zlXaq0KR0Favfs2K2Qavityc2vA6kh83XNHqajnAP0zYYonYA1hf+DrMm9PaygHHTr9dTd0q3wQ4F13gdH3eKWtgWTAz8QEePpPYflIMXf3bZd0ePE44fcYZ3e1MPxppHj8cpV8pX+elqAXalDMLGA4Ymir109jmx8Y9GHMZbFhL

LV1Q1BHbDlC23MXZeD7F3a/b8DiR3I3dLp2ZklBBsHVxVu+xaMQ7jJUcp1zz3RJco3ZJhPgDxoVeNHSTt4BGAoBdONzEVaI6Poj5lRWHOuqMMrDEoYRu31jfw+LY227bqAwBOgyXtgEBOdJtJoRPWIE8RD7KgHOUr4Kqg4E78YBBPw7a/Fka3xjdQTsu30E/GoTBPBoGwT8BOsLEgTmD3CE574EhOgmEQT2cXKE7/F5G0kDuTj062CfYw9i62Mo9

xDmIUiSFaIFFBtcDYAU/AFAeNNi/jPTC2kEdNPww6SQSXiHr09+kxNuBUpBGiBquAwtckO81c3fZ3eOWx0oaadgFiICv3NEfN/av2JDccjltXpDbud495BFHcjKOKbjnjdjVkUiStqb0Xv4/8EvjXb3aQ+l6tLTx8EOvAb8rEABFJ6HjlB2c6tJSZl0rKpFn/1zgPGyfvEYgAzUoA6/VLjX1c4dUyRTGn93U4oABKpKlBEKQSfA9X64DpXRlshbZ

j5WW2ZKGsl6wnodC5VUTRGWz2AByXNuFbucW3nQ/MMWjFIRBod/1Kz7uERmIVlADN1N04KAA+FyPcJY4SCzIkh8otnbZVFoJSdfe9LcYeDg7Kr4/Z9g13mPb9M1j2RQ6EZtqPFtenefvZFtMxvOc9vE9DUm92/46iOC8Rh8VGjlhzMGCrgVC45zh5IB2A18KngZCgCvfQVxj7NYGL4XGhNeI4Afvg2uoeeP/xx7hF8M5P8mAuTl85rk5WGF3Cm6w

eThenoAZeTqJmCQA+T3PWjk++TojiLGGQuAFOx4CuTptgbk5BT4+IwU92oZ5PXk7S1GFOg/bo2nNnB3dSj+GP047YVzOPmjVV+DscEgCO504P5E4dutNAmblRS88pcw9hdzjAGSoWiTGYE2hklNALP2EkWVvZqpTUPXjkO3YWHcRW2nQsT0Q2rE8xNmxOcdZz3IUP0cdVrYid5De8QnEilYT/p/fZ7QQ5sbCi9k4y03xOkXKUFFxWnsipNvmCbum

HIcMIhCC2ANRY22AxyN6B3rGw2dbUmMP8zanJOIDVyRoAlxHual8giJCSTr/KR2lwKxqhvU/Z5Uh3GdRyTprLLnL2AAyXosGSAA9WaIGUqp6oKVUZ1cpPOoPU1iBqmY1dESeXWoA9Dw2X2UZKV8wOWze1NiABagBjgowAxUD6Wth25Fdhd8Pt6TDQTcZPe/rtSCNoS6ARw71iAlp5V7V2G/t5Dm+O9td8D222XI/ud19n1k9GSHfT/0Vbdly1MyE

xvLgbLFeNjxUPvbbOJs8thOec5wmhiYtdtB5PcU8GgensfiY+bbtCM4eeAZCFwufqI+wW2lD54lFgsSdNQw21Z06c5+HnJOIQYPxByvEh9mrVbGmsANdP8mJ3/dsQsLG3TnQWSQP3TqIBD04hJ+EsGUBqXN/7utvnT1iJgQIh96I0oU4fTkXsuounQl9OGECxYd9O90/qFg9P87ePTmldFI4IZlOOSU6i27EPRE40jqcFDQWTANmQWQAntvePhk8

+BStkd9NJjnYNa05bUEblW9nLJtd3TEJVq+ZOYbY593knR8b9j5qPp6k65mans6CNCMOO0Tl3BK094pKvd6xWYg9LleiA1/J5aCNFgIH/0v5Pe4GRTgqJ5zgzh6wBIKBTrCb329r+9lL36vAkz8F0pM/xAGTOVRjkz0lhbGqUzrCwVM8aD5BBMGeX8TTOoBa92HTO5ByT+aTOy4EMzpFOTM9swTRBVM+mQKzOkvf+9uGOsM4RjjOOM3dERVeKK3I

cgNYAWQAziye2NsZMsF2FCiRMxeDVqfbhkQW2x1BHqRgoF50M/P5UIYZN+PYbQDAZKZtghMniUWtkJU+TDzGWrnYFDsR35U7Yl/E3Puanx3MVjQnzDqPtpic/CZ+3FfqnTyX2w9OfU1th39hZlwQgjbBnkoUg8AEQ0UPhr7WQ0QORp6hdyknLNJa4Dp1PKwhBELW0UvZJHKKgrM7pw04BN1jIEGsxrOBToOvwn1A0BUGAOsv0WJJOZsiPQH8gck4

tpIUhbCY7C04AuVTpMZNoOk5ton0P4joWx7WdE4AQTW7wqcf/96owBhxA3MmPqM5M8ZKAOFmQlMdML46gw8z22tdTDumPsA4ZjhIBy+Z1RrDUJSE7j+V8CnDrNbCX+LZNjwS2ziYpAGmTESf/YnlaDZUk5q+AauyeeXI09rpK2RIrJM8cz/TPnM6RDiOssc/+Jr6652djZgnPIjOJzrG7Sc9MYM0BdM4pz0Ssqc9gSwYPac7CB+nPUNvxzo6aic8

QoEnO5IDJzznPwmCcz//SCvjQz9rjBE+2DxvXw+fJToLOtt1gYbFAsUCEAUe2hk4uD3Q4vs8oz0JE4MpNgz9Q8GywI2ZPwsrvli52wc5nNzAODtdxsnzEEgH35oOPyThIOis6fRbeMdAQvWNPenVO9Ct/j8LzVn07w5P5XSnfS4m7hiCMzhTPNgEW60OoatTt9kmh3YA9DFth09ZH1nFOoU+yAfFOY44HuIPPs/hDz2C8rWXDz1zPpuujz0GBY8/

RD6JBE8/KiZPOhjFTzy1n3k8v/bPOxYFzz//J5YALz85POuuLziOr8E4Tz60Kq87vYyFPa84zzwlXCU7x9tLnMM83p7DPEY6j9nhR8ABZAI7r2ynfAVqnKFSPoIjd4yDtB6n3fOzliGioObA+sekT3TDfuayx4yAKgRl5XCqlWMpkQiP6a3030ZbUVui3LHKs98+37E9uxxxPjhawx4pxMzrXylz2P5lzFIq3Ws/7jsEO/E/v1zqErpG8ENsgcwG

8EJBxn7T7AdHJEdSxVXYRVxmOkc7o9TyYwkNPXFPKiB9qR9ejT0GABbYoKEDpGdRUed0QYJEoONhGUDcay8bdLUswN8p3C+hAkwt6bkNeSqakQNfwN0wPlba6T1qrT8C/0TiAkczUQvzW4bGp9/uAj475Iik9sNKilF+ExYpOxvMHr49ht09Zw+tlTgXbnI/3dxxPYRdBpJ7HQ4sLzVWQuo9cc7VMGVBNRkTPog+YCnEX/JdfAaa5Q92GkEWOCo/

ldkb6yXiUTyMOvFucreZVaOjgczyNRpq9Im+Xi3AxdhZOq3dtzt4PC6eNdjMPuta5F9ZPa0EHWethda14MI6QjY8CjtrPgo4jTKl2uXZIQDh8Xo/7XUCOPDCOYQP3M89WfTl3IvdiL0r34i7aYWcOki919jl2mXbo8uIuYY8S9nIvEi50MZIv9+oFdklX0PdUjzD3ifbHd/NOuLi0gZgAJDjxpLgvqccLOckpXrFfuoadXoY0Dd6H4cfzc/V33C9

litMOPg58LpjW3RcUL553Q4tjIQlYOORRhbb41YRJ233OfsfRzs2Pi2buASISpE/efLguSPe/2V+4O4vf68h65Y4Ddqh7EcZoe+yO+dukLhTaOM5bjhIAuxY1j7mm1SJFywQ2Ec42q2tgyXjf6tYvh1d0L9QS8fqVoIsA8ac4gVogM2SwoyA00AJ6L4t2fNIN2hR61FBvZ4txGRbqj1jOi+b5JkvnJi4J1jiX1k5gMeyxvI4J2yMzm5Hp5Umnfi6

YChOLqGO7dmXH43351qkupcaHziHgl47uq80mducCz7pOpwQpAeFLyIFx2YMPC48o6QIbv9hi0Y4uoPP7pNeaxGlURqIbW0/2e4R2GyuVj5ZPVY9DNnKX3RbyKRpI2DB+qhZrmcA+sHSjSS/jix9Sc6K+E6oQwROC95SB+0k1gQAAmIGUgcVopvHSoOJoEfZKBM+T9S9BEhhzCUmNLs0uLS6tL7EAbS5551oan5NE/b4T7tAwc50uHoBNL1ABzS4

egS0uWXZejgXThnvQzxXO+hZ2DifPWS9aqowBNgFCE+QGEgGpGgyPn+uqMI4vei/iWIXh1IYG0adzgc6VRzd3xC9RL0R3i+fuLqHPWzvWT3sX/fBFDVabZGk7USdpp2e+G8iDGwR76FEaQgD8z8fOAs9VztkuBJWqAQgAiwEmbGAAUtuPJtLaWRuhLwekE7hGMyL0g0Pu5yUuuGa3dxZPZS61qjEuHE+cBBIAk5YjuzBptx34z2S7LgK3h4bnEVL

Qhc/VO0kL1WIH0URpmLlFTS467URDHo529+H2vS/DibdjGtmcAU0uVhU7Sc8vC9WRdDMDCUl7SD8uVhTkoftI0rKFaH0Q5KHFaNKzxWhmdd56fy40QQAAU4AvSJf2OOdxkj0pTy7Cob8vrw8vL+oHry9nSW8v7y7LRbb3rS73ol6O3y4AroCuwXvgrv8v9nUArz8vPpNAr7sRwK6RjKCvuxBgr5EY4K+wrxCvkK/tA1CvdedZFdXiZN17gLCvGw5

wrpxGZ8hvLkMvCK74Qjh9ny7DiEoFyK77SSivaw+or0j5aK+UrpGNGK44AZivIK+gr2CupWfgrpeAkK/B+5cQ+K/lz5VSUDuFdkczxnde27lG2AE4gegBc4/qAQDHU1Y+o1KlYtC+RT5FPSbvoCNpOFVKEwCCSbKg8nkIfeDMTh7JSBAEqRhmdgjLkSOpOjGKzzRj+DrKzk6tbi8bOjcvH863L9+Xsw5cVUAR94/kdgqIObFUTgKOqbNzlg5Per2

VK1lAYLJ4A9NA+yDx+FBxJ7GaO1yTzuhUwGIRsVSVsOJPUcNXRgCkeA6phx0SXW3WEMoQnXp9EyF7uqB9EtZ9zAhGEemGhA8De5XnpkATekSQ5aMwkPTXF/aCYgKRnyBQRzN6w3tyVbf3iUc5MoHpaJA+oAyRWPS8kNMR2JDMkZ8h+TJ4kGcTTxDAoRoBpq+QQWauJJAWAFnUWJArEdt6kaHX99avk/yIkMKR5/dfEHSQqJGMkRiQAa44kcyQhNB

+0RiRrJFskB8TU3rAofihnQJmr3auQOklh56uZ3v8kXt6M3qTEs0RNq60Dnf2c3uBRmKQFgGOr+KREpEJrlKQ7RELekvQspChrq6v2KCLAVpQ4a7urh6B0JGskJcSlDJWr1AA1q4xrjsTylS2rjSQqCvxrkmvDJGJr/avhdVSkY8Tug6MD/WG8DdWhgg3aHZVtyWnsQkwAGBS2ADqK48mSPfxeIdMB1dlqy6kjtUDQ5NLiy5Mo+uPnuZ9jjrWVk8

dz/RXsw6cucOpOFl1rQsO/vEpdnr1GdPFgJ1GNGHNV1VgWpNDgcQj7YDykXNEMmJ91jjcHa4JFBLyovb0M8fM9qDmCpGSPa8UIr2v8pF9rjj6fgCfkgwtudNaxZ2uwktDrt2uI66IAKOvSzJjr+PWe4cZLohntueVF/svWqvZ+SDYMdh4AG2WSQ5kpPFtcvyxkMDUrTdDqHvlPgShcpplWeS4qIVYXqnvKRDwfevWsdNqWftS6FaMMbc21rpWBVd

jJ8Q34yYvh02uk8QSAYZWLa/noDmwull+BdcFrP0Kro9yqdYHj//OoARsyrEwHOSFB67BeYNNmOEB4THHIDDQ0sEI+rNpz2lZQd/YmMJikOAAr232EJMR+JFx/PavAqGjbCGvn69YkfwVwa85oSGuY+WeAXwVoz3HEl+uGfiJ1LT6ha64sqnVCvvz04e9udTKjP/K/mX5rr+vtAr/ZIU51rw11OBvAG4TEcBuQG4xDFBuOJGP9mSgiVIeUuI2pa8

Nhh/2c07Xl7y3Zhrp4esBSangoE2EqffpwFG9K+vkNbzKUnQmBEZIm08Slx4PpS7yuk2v5S/xdiVWrnrWwLPEjzwJL0oCWSD4z2xiJ0/CL3/OlQ/i1KGbmDyM534ab1rde+ZCDKFfANMiHtDBE1IdFG9PoyW2oRq0kmYPWhHUb0CwtG9z6HFaV81UAJRvEuZUbiDa1G+74TRvOvQsbwQA864ET3u3Q9pFdmyvl9oHL23E2gEZ0A1cJ/yiz5Ogiyo

nwEs5p7rf6xKA+U7sLh95sHBz91+4l5Obi92XaCkLoZ3AGFmpCOCGw5Zi1lKHR675D8evys8iCyrP8ZfttjtXPcYhaD9gDy6j7F4LmQ9xtitLmyRsHcR5qkgJ+MCYLuhHIYjDjDbhML9YtgGoJ3gOeq8o+/gn6PsHgJVgtxJIBBhzGgAAgLvjbGD9eq86EJHDengARA+0D8L7iEbVENz7FNDEDtURlA+jsd90nJEckZCQ5A8WbpGhaEYQAehHWXL

EDuhHNm9k0P16dm7mbzQPwpAOb58giC44RmL6Hm70D8QOdYcubvWHSPtF1a0AcR2/rmWW2PpkoJj7qEdgzgFu7yBIb1lGs07A1ihuINbzTl/3iiH0ARD51IEvCHT2lac26Otg84vTcTpJyn3nWVF39a7TSlcvRi5uLi3Wp69++QORUuwWcABZlAf1jqnwosB9xjQ2iq/Xrv/PDk4b4aLGimfRZtTR5kLRA17QrYkmOmQmVGF5QyFCt+jYYScxmI4

E0AoRtcECstEDtCatifQmAPjMpi1hNG/vW/nmQ4GaixPH+sfHgP1m5DN5QrluhW95bgln+W/BQvlDdW5Fb1smxW4lb7sDpW/sAWVugEiyphVudAhRWsauSmFVb7PH1W7Zb/1m/GG1b8PQeW8nMPluPW8NbwVvvW7Kx4cOzW8lbiL6hW+tb+/JbW+VgRVuV/DN5kWbLIp7L/7XvG9aW1qrKiBuAU/BDe10jgJ777pTB2gT7Y8RqbovSpediup5eqM

p8XtYaUuybgsH4duAGwluPtwhznRXNy6Mma09nk01j6u4Id3voalrCpaRI0eNPoZ5j82P7NLgANY5bbt8ALgv2jazL7bhpy7Z2/13xId1djl8VNJTDjwvbE68L9MPG28bGVtho3ey1s81a6j7FlEXZRPGSPC3Uc4iL02OQXa7czBsjAE3APfdOIFV13kumdshL/35J2680s190mw21pcuX3E9j03WeldeDpdv7c9ZSnzEhwExMsl5Z9eHT28oKBW

5ytRP6W7Xrn+O9U4DzgrStwb928Ty+3YZL9xuqvMPBsZ2Xtp8b1qq3Tih48mEWQGzbxll1KLIy8wu1XgfbwHS6nmVdKioe8vhL63GrRZqj2yPLE6Vjzn3d3ebjhmPcqUJN+44mphLOMP0OlkIGVsvIQ/eE+CuXpPbUj5g7qGLMrc4BO9zk4TvyaCbMvjuRK/eE8x2JO/9LtsJqIZHz4lPai7Tj+oucQ9wzzN2Lpk0ASOgez0rrsCqFE9WwkLDdTW

vNLMuFaTAMNrJMNe/l1JYLLAVpMYqyQh1WUho36zwGVLo8nCvkGvw4q+c8yUjrE4nrwUOSW9uRIMBF5p2Jkz9T3a+d6bRFujCLhluoO7UdzevjeS7AN/Zt9mpIJiUYZCRSPAAhwD3IUYw1FmftbKkHOUQcH3gem+6r50SGCYGrr17fRIwp9snAxImrkMT3RCDepGgFTkxr8pVxREIs6cmp7PF6+Wj9FLmrtU5QG9Dehavuu/wbi6vHxPYoJj76u6

zepru6eveb3vS/m9/r6gBb6/a7tsTfTx67jrvOcg11Ws95REur7t6QKAa7rmuvq+a7wcTWu6vEtjDKa+BR2CTEG4gbnnVTu85ofru1u5DEDbuoqCLALbuxu927qcn6LPm760OCa6Qbyr62xOwb1buWiYXevIQ7s8myh7OkY8RiDXPu/BfGIj3jybHb7yb0NCuhNfLEXfs/K4c6XkvZ7Pndntfb8KbDa4XbhyPkq/6V+v3MS9iEQ/WJDsnae6xnPf

VT8+QdKWlPFrOFQ7kb6dPqGMgZpnRQBbIjisH3uQYQxnu8rPQZvFFaiJesxNu0O6X2lNv0Bv7PHgBmgBRibIw4lNpG+3BQHnh7z3xMc3UhhZwYrdGm6qdkA6TD+KvvA/Bz32O63a61oXZktHcjNOhNAyAZs/Xg+GrMS0JUrw89nxPYu+Zb0Cowua74FP5Hw88ax5gkK/CPGx3gnctV0vULy72dWTu3e6Mr7OGkToip0nRGI7r1/cw1eOXEITdgkZ

m9DvR1wNnMLCuJyzd7g8PNQstgScxTURrFBTcVw73G851+O6xki8vyg+CRm3uUuM7DvZ1e4Ad72cxbLZoF9tdXe/MdgygPe6b1Qvufe8n4/3vJBdC5lkDRWFD7i+aowMj7oVpo+7Er7+BqPgX6BPvOmiE3FPvW+7HMLCv7C0z7mQime+S4q/E8+9Z+Avvs4bHMYvuXe7Be8vv0+9Er7ivEe3W233vRaFVJoCwg+8b7mDaRKDD72oQI+6H79vu5O4

fLWXRswuV9mtFd+9k+ESO0++H7uTvzK8q8yyvPG+sr9Dv+e/8l0eF2iAcgByBiQF7gxuSiBtNTN1Kpe++UOp5uXTLUQcgAxdo9/G9lUZYz1cvGO8ajgLvFOSZwclvdAUHjPoksNkWyYTOBBpym5qqLvqiOBhCpgYNlWZpsAaYB9QyJ4AQZ9VoqgeIH+F6VVbIHxfK1JPp7yge0I6f5sxpGAb5ROgeee68bt/vcft5j2rI/BE3lhGAxe+f61SlJSG

AH6gooDEHqRKsgc4TD5wuxksx764vmac8Ln9ugPqTxOmBpHfjIJS1W/bROHi2LjgxFkEOae/az0crD0mtAWVoaAlmj4TicuNDR5oG9Ic1YOZnvVdexfCFy+g/YhimhmCFadsFC9XiBKwlyegY3ZDnDSZNgFu2TwB/aftjsc4ystSJTmP+xPG684GqVUyuCOPOYfoRtYBvo+Qzva/NIXOvNYA0MCznZGGoxZwIGZLIfWhhsiLpGVYiE+ilaYweGCw

0YIGOLB5EpzrtrB6eFOwe064+UxweR+GcHnQI3B6GYDweMI30JbwexaF8H2ZoAh94AehBridCH6sarDAiHtazwgGiHveitOoTiBIe1RiSHnOu/a7SH5lgMh+5YLIfn/ByH0La7pJyI7oiih98ZEofTB9uZy6OD2MqHlIsZ9BsHzwW0Fb2oeoekUUaHsQAXB+YAFofmADaHp2bT+mWVvQBuh/SaXoegh/PLPh89KaGH9rE68TfiFQsxh5bS2IfJ4m

mHoOTkh9jr8fN464WHy6SmlMyHjwAvGDWHrzbNwq6I2uJdbs4H1/u+e54H/tv1JKk0abDAvSdJqHuYPqib96wGLE2yjNptDldheoI5dvrFytvB8fbT+qP4B5Vj1KuBSabbxkGlS5bwYswZYlPe1aaa/CdwE3LTe/2TjeuLe9WfXIvMosIh5jLblZGQK0kmI3jDMUfRdbK1WgspR7KQGBVZR+hjeUfE4clH8AzpR41JGCM3G/9p0fO1O9JTjTucM5

B7yhYfgAGTvpEgZFapiyxJVnXaWw1uY+8mstQ2QsGR5GA2Lp8C+mBllWyruuRbunSGSplhhwlzdjBhvtkHkeuvY7Sh/Jukq8nrgRv5kr2AJc31k77cMCZbrF1rDFYEx6+xwQbcpqHOvq9IhDXGRFIs73NmS1OEUjS7+KkmaNw/NUhTTGqhZ+1WTJV1BezeEe8kFrvXu5O7+WXaxGrH0Br5dSW7gVz6R1V1GUz1dUp1Abu55Zkoc66loeQAOnVH3U

5oSg4UEY7H4ey6dQREFXUKdXa76XUh7P2vdF14pCBrjFGePWhoF+r9hELiL0R9YiF1P5v6C+lrxgvZa+YL9Abhf02AF2jkgGTZf/vhB8JauQ747h71GnZEFvTpi3OQx68+Usu3C9V7xduce5FVtK3V29wmCa5CbKcywUXKm+F9hZlxGndz7Uuowd2mz9JPSUTFlog24HAViNQsYp3gRZgYPc7SDjRq9bkoEUw7xawKuxhvEjHgUihmMvQngpkkY2

Gy9eAMJ4/HF+lfA3gnxTvEjyQnwiFUJ+yoYifMJ+wn8ifc4ecSAieY6toLYifeUFInjaIkCpEIJ+Sgxeon6sBaJ5NZ7EAGJ9WGJieMJ9/pLCeD/gEn98cOJ57iIiesCvGCsieBJ+k1Hu2UO7+13nucfp2B8pXiAFfGHaFXwHmAa/Hp1IssIv1hKjEuXF8om5JwNYUygLhSLE5km0xzZ7qeLrbwLg6l1kDlzDwJg0MxXrn0e7kHhke0A987gpv/gq

Kb/wO1x0Wyhbzlgk8bXaVySn60VYvtC7RzsTOdDeJMucYbyC7AUVOAnNmJKGxD7Ww2IQK68APaXdoxAAQ0E0O2RH4kRSRJJBjetT6YoUopAArNgBRZKP7d2szAFFkmDjXJdX8D7JckVlcUnVzAWxZPDvDWcqezFk5oUsd5qnkJh9XBJ8FN+ipAe+9DlVz6HbNlucNRGK9FMSkuC67UO9uLaSLbgLtK+rVdgGm2QtOdytvXC9I0hLXGR54ccYubPd

WWzpaN27VIx4wYiXmasnvsrC/BXKxIbMgnssP5Rtaq00wcSt7+UKZlp7sNIjvEhnWns9nZY8Y4eWOcqua1huOv2+/H1K3bnbSrptvFIeeLlmPvVO2VY7DSaYWp+lpodd7jlN3iq+FHwft0BvpNCgAt4HBATQBS09MLlPAmrnHby6k/p5OLl2Pl+3dhOkWCKuRLlKWjp7RL9jONe/9jrXvr7YkO4QgxkjrUHPFyFtwt1evTvpi7kquf4ulFweLo49

aE++NhZ4nig0fVO6ETuouRE8nz/YPCnmQaQSDiAHicWktPO5h74jvyZ5swoRkIhqvljm5a4/H5eQeLPbV7/huWR6O1yhY9gGoql/PhKgesdQ2Fmq8yu6M0x5wHpGHoJ+8DW3YE4AYcosAqaAmbphg4J6yHCMWPZ4wcr2f2B5PALvjoxZSHWMXCasU7w2Bg5/Gb0OffZ5vScMXkxbWBw0eZZ/U7uWfEy/QGlkA4ADpINmQc584hkMPOQG+npWnsy5

I79/qvfEd7EgR3wZfH4evwasNnwKe4B7Yzrn3mO6RtvYBHnaue0k9amWtp26e3jH8OeBaZlfHzWmu9vhblCSedRUYn7OBdExqCY+RGuotwXkg8J8NgQjnZYAsoJwAkgSCCbRqa5F1VyIqxgxjCxYLzys+TweevalUZ0eeUJ6knieftGqnn3+ktHYdh+ee7VZyYZefvM7Xn4/U1p0vniRdTYK3MUMLWuthTw7EF8yHnoZIgMGQngVgYPcnnt1KX58

fSa+e7uMXnxkB759KL3RMN59AXg5235/zqmIqMR4eqrEf9J/zTl2jIuiNpMgAnjPaMcv6plXP9HVYiBscmPFsJtHstPQ4IrfMsWYF9jgvKVu5lfwEqAto/DhtSPykNqxzB75y/Tfo7gU8Ix8C/diSwp4fjgCiqg3qFGUgrUn9l1abNXRN0ixWIO/5ns3vBZ98ctVYvBELyfnkqybegWxUKUDYD3MP+yC3aXZqeyDQ2Qc8ps8bJ9sQL57/EOBe9u+

zyhTDqUd3a2ee1gGsWIZJKvoFc5SNgwGsWXdXWTDNNp5LnjkpQL5Li1YLAX5LQZ0pQY3qWrXv97NPPLcobiwPZhohWFFBCAAoAGDSMY51FtOYYe5X+YSoQaN/RYmJ4w9pHs23yQcqN8svkMfRLqsvW57NdrDHizlge4Du5aQX+Vzc+Z8dpgWfMZ6FnjLyc+8n7s43xMf2zR2BGQFDrGBhHe662xSt/4DCoO/wO9UAfYSmml4m7R4I7eKt2Gpf2w9

z7+pf4kfCQZpfHgjaXgDOOl6dm9dALKF+ivxA+l/6EFpfoWEwBkZeHw7GX5lCGl5JA/pe1l6loIvvZl9ngTpe9lMWX//Jll4jA/ZfBl8f7xwbftdVx1eOLMvXj/NOBY95RgA1kgGJDwufr2AOLuWrEl6GlCnZbujRme4Pqo62jK3Pr86x7olum48QHrgU9gAORl3OHjEKcKGGDe50KTQrO7IHnlVXbUav+pvvMZottP/SPHYsYbSuCLgMwZxr4ll

gMAuSbkMGRm+f/CoL1wfUNECrgXRNBKkpIclfI2geSVIcnXr5RTFfzluxXg8X1YDxXh7QkxFH1YleGV9iV79hGuopX5YAqV/z173XaV6XgelftGsZX/XqxV5ZXu4An5PZXm6uQkCxXnqLogF5X0tT+V8JXvc4hV/lXkVfjyoulyle7uOpX6Vem9TlXgi4FV7vYtbrWV5QXiZ614+w98pXAgPoAfAB8/pRAXBeZ1mtcXRzg7I9sw/OWskl2H7mfqr

tSB8JQ+AgeOMgIFgYX3jInJiHaUk8WtMTDjhfJU5oU+i2787r9h/PWR7Xbxt2g48qidyCLGJ7nqqEuyWLOXG2sYaxVccd8oEPAJmiQgB7pcHJdgEszXBSNzNZOZAfIHdQs2kBtJH42FXquV2YAYBuvRD2ACLke18/rsU4lgE/qzbhTPFdEHteGRxoLwsNbFknX9rvZnIWAOvQCKThR2ONTUpeJxuA5TYZ667PX7lHwKaebFtuphWffNEjoVoB9VL

p4R0AzJ6Ce5ipptAesTmNhFcRqbpI+CHXJB57UumDOXFsf4R809dYR8FmKaAwqWyeyCdXE19fHnJuwx7HrxKueF/i7Phee0+PePYBD3f590ARX1jOfG2mrOHH+Knu+44xnplvSq7VWZqACbcxmMzNDsEtPMdfTU0XGWWQ3oGTGMycRSFzN1yhegpRYS9XCKR/IKUxKUCeSklD0KR/pNYVP7Do3ss2bgDrNh1L6zaEwjlJNx47CylADJc9kYUxbqQ

uz6nDnRG3X1vLFt3iNlUGrqc6TtEHfG9z2OABlw0ibIsBWgDlpomei58nLi+RoDFM1AN8AxToztJ86/q876eqRHeyXpmfZC5593hR89g5SxbJRwa7bt9Rq40jBNGf9B7Q3+RvS5XV4rSmDFvpZytEKi6gT5tLYueS5+c5r0+XTzHm8eiSogno7/ECAXbFQR7kgDb2haJ4jvtBw+8aZnwsFrsnXkC3vkIfoRhhfmBcKwAQlOsuZ3EYn0cWV9GK3sW

Ep0ryCegZm8zrXlsFzwvgDE1oYE4ftAFSHTzfnNt/wnzeC2NgSu/6TWEC3ljngt9Az4MXwt4HRPNNV1Bi3qYe4t/h0BLe0dCS3w/uUt9mLYRhtJAy3w4Ust4iYXLfqtXemoTq2Nl5aGFXvbW8d4TuEvIq3i5S9AGq3pdnFyCnSDxNrB8a38utne+83tNn2t4K+TrfiIOVgJBXbSRC39b2Odc1X0foht+i3htJ4h7G3kbs5Iht0ZLeJE1m3oZh5t6

xFJbect+5CvLfA5uUSjbfit7ii0reIwPK35WBKt8O3xOfjt9q38RNzt/1H+UX8faVzwn3jwaw9kn2zZY4AUgBLZ7868HXaS2Ln4h7T6He67oqfvGXnVJfdActz5jPUA8bnxmfm5+hXnzVmAw5S9QorinxLv7nr5w/DM1ZI4ewH0sOMx7wH7+fJ/sa9osBNG+yYe6OYPYHgbIB4EWyAQ4sXuIHgZNV/gC4T9Pvaw8L1F7ic9bHjgv4oR+l32XflYH

l37KhFd7381xpVd8NgdXesTs138hOsK513u7j9d6nue+N2V9hrimETd8IrWbZs4At35XeovfQCG3fi1Xt3hfund7136PWZTuQ75/vUO64HtBeWkfKVvMATuaEARoAuGG9X8YF6zSJzIEz7ZkSgAqAWsgYWYtpCGkY60YcpzxtBIdpn4pTuSpkqjG5ZLorWKl2n9JegN4/bvJvQN7oU3Jf8e5hgm5tPeGzILQeWhXrkZOYda0FH3VPze4w3gepEHF

NbAOQHulQ+kQhBoRJeOcYhyFgMTRIbJnO6UqfS4kerv3IVOz9Tx6uC2hJQaW2M3iOEXceF4HAmUcA/U+gpL8wRwFsWf+uR9dwR/sRlsHFMHJO2MGhAEwPyG+CXmFuUjfKV42p+Q0jobABhYEp3ycuOVC3vKwukljgygNyvs7ckmK3uG55D3JuO058Du+Pu07kL5wE9gEb9l3P7QTaFZMfvgSv3f+WX7bc32nvz01+OpeAxW9fAUNv797X75WAB4G

eAC6W+wrHMOdOL08XTsgz1RhN2bx070/GadJokQHsiIZfO5lwPtTQChAIP7sCiD8ACUg+BkDoVig+EOaAzy9OH6LxGeg+1KzTzvwe3C1YPq2aOD/wPwg+8W2IP1RqyD56loQ+qD+K1Q6LaD5OGUVgGD5XTlctWB5YP2lhbl+D2oV2X+9QXvSf49/zToi6TPl3pTiB7+sNByrXiZ86LqKHQHjToVhuByPIz6bI2FWNCIGf4dsOnrJersY536Me/27

wD5mOlC61j1aRkYHL97UjAqiFjEkvEp6PbjYuT27x+zcBOICYqYgAKABndzGOxY5eUKnetdtU6N1L3D7UOH6mAZ7M1Pw+uX0VjgwH628RttvfAg9hniI+CznMdeDf+d+lDw3uPjjfrQMUnp/F3nebWqpxJBABT8Cbx4gAUJc0369hpBvamYCZScCGNdQHKZ6Li6meX29pn99vMl7Z3isucl+ZnzjOxNMQlRLQiczsuQtfVmUW6Klqo44Tj1ptTqr

jjvUmJZ7xJ6ovQ/ZMy5XOY1eLr9AaYhG6+wgBmgGzEtWefqqib7ZV/9+mPhz5a9jteMRl3ekZlCUumM4Sthufa28fl8GenI7x7v8eLZ7FDqfHdDjzDsLuWhTDVM81ji+6P3Aex/qHjuMWvSX+TiMWawxxP+mqsT+3/JFPlO82DqXW8d+ETon3NO7NH0Sl2iAS5VoA0GFtsyne1a4xWL4+PD6GlYUgq0bba9Tbq47R74E+649BPz8fse+JbkI/VB6

zD/wvRyAdwD4u6OqrUDjMMD5/zrA/DB4jU8c4Y5x2l+c4lw8H8B67hqAG6rCwTwHnKkCuUcqBjJvUqOUnMIbrN1lQAQABmIAQyVqAVpYMr5wBPe85RS8wXuO/Lu0/C9XsLQeUnt4LVf8dxpbxX5ShOvQxABBWdT55QIGNS9SycQ0+DhWLC5bqGLE1gS0+Yw2tPvqXbT/tPtfInT/7SF0+sZPdP4UUqK1znVU+nhjTxrRv/T+1PgCA9T5DPz/qWK/

DPk0+PQ0l76M+rT6X1F3vUz8fFx0/DYGdPt3u3T7At5LnHV6Pxp5eXV/zT/wYADS3gK1AupudJoueG7U1TyGk3elpG8qVwbD0EVpIbB2DOaAQ72CygbdvSaZuhSnl7sr2lBAQK2/r3kAngN6b39AOZU6jHs2eYlr2AdyOLa/EXnclu96qb3mx5HKdnsXf0T6qhiHU1ySRSfD69g1HwKhYoHDH4L4NFzs2Qd/ZwEaOcuQ2TbHiTwA22bex/SXvRZY

zT5wBbp2eEbm3XrD2FaoA9JbWRGC/j1bST61LGdX/qs1KxTFIL0Mr3RFfViyWxJFGnpl4Gk90BPdfgrpmn30Pd6eYgWBgEUlt8Bw+odfyP2yemYU77eQ1ei6S2YDDgfh3+Mc2QV9g3EE/ID4Zn1Y+LN6hPqGe129ajjkeVzf4IDpISdptp2FJx41GnRI+DB8iL7gcp5XIV+c5wLGYPLW1OpODPgi5ycFLPvc5yMALPvJdQJfaNwx8LT4IuKnxmSB

Wl9aX4K46dz0+l0u9P5S/9G9Uv9Rh1L73OTS/IK5tXlq3ARWR8/S/5fwnlGM/6MAfCVdK+pfMvrivLL5cvEHLFL7QAWy/HSXsvkZB9T6cv8YKJ9R0vt8cPL+cary+qz6sZvy+zL7uliy+IcHbPx5eI9saLuFuEdGjGDgAOG33lwc/r2CJCKiVEtEKt+K8hcCKTYsxcrDJePi2GyWUjSnxYkTrQLUppsnT3luodEQJbVE2aLZV7htXpU787irPOd6

bzPYAmY6Dj7MuLvmKX57Lbb3oWFzfJ09kv49uLYxM5BWxcwHVILoxoiErAMK1O8E1WUMBMNBHwYjRbmQgbPwQmMKAvznI9EI4wzkzPgWOr1UAjJBJQY6uuVU4wsfA25cfV5pOZKGwvspOdNapPIi+3NdCX9pa4AEDEDgBt5ew2Jk+AB9mF93pnJKo5X3wZvqsj6Lr/J/Ntri/tz6gPk2ew3Zbntvf1Y5xL+SlrLDULoLyTUwLoQMX8tXOHhGat0k

JWzpAEFcfHJth9L+fYgCA7YXDVp5DbkN1P5bUbT9L7us+l0pe4ict1Es/NweKib9dromrSb9Gj4Oev40pvyl5nGppvk8A6b/T1qyBCz+Zv+M/Wb/tPgaXDYE5v7q3E5hCv1NBib/5vnShBb4pvws+i4l0TcW/SWFo6KW/Gb5ETeoAWb/47tm/Fb7+Orm/wLa0n6PedJ9j3yw+ySag12BgfBvRjt41vV/fmcdYqWxktVM7AwEw8NYUg3yAD3Yq7Um

2BRyZBuY8BHuub1W72TLPhKnmVZV0TN5D6s+HIx/87kU/SW8DjnEvbYXgD3G+wqvEGQj9am++6O8ld2jQ0NHIEUkw0LgDINizmCUgKZcwEd/YNESYwyde6THoqZC/VNGQLn09n2MrgWjpbJGAAOdfgUfokGNPeTEvkW/fMcJpwiiQ6THHXjC+dZfdEYvvLMeY2KdfflGk30huEjba+3NPX9/zTzYAyEmlUCkBG1rBv4QelnAoKaYDlBHBsJ1JZiY

zphc85k6RvxveUb6/H4U+Dz7Ons2nM7/7V54pkCcyzo75Cb4XlXOu0AGeABWAhhD8QPnwxZuQQWQyRJmWVr+MtxY9DdKxy9UiKsLEb54E/A3Y3x1Al2AKC5O5T69I5WaFaEfutWja67ssCmDjr+c5v79/vz2B/75AfbAzgH7gfjS/QJYgf3IroH7u42B/sqHgfvVW7NyQfh6wUH8Cv9B/Mz+nOHB+v78ca/B+pnz1Woh+gH8GO2h+yH4XKih/XVa

ofl7iaH/gnA8qHCoYfmeemH8WoVB+M+4wfvEnUPdTn8k/ZZ8pP00ep8+U8OG0fBtxEkRQ09+UNOzdxlrGMPe+opR2wSvZ77VZeEY1GF2jaHZUxGnMsihKiQhssWFIT3vtwOveao+V77zvsFrht9NfGLe8L6E+l4qfjpVk1BES8aJcwflneT5EkKpkb6LuZF6qXuRe3BGBrZDRINkcVGAFEUkAbK9kHOQQ0LFzl652DRTBAiCYw/+umYVeSl0822G

FNv5kIH53VuzdFZbCxW6+wle5T26+KJBFl21L407LCJQOR7+oANtgRZYrXSErJ79jyl9XqOdnvoqh57/ZK36/mzbXvuFvVH2SAbMSzPkOhr5fGhQAH5oZ2FSkmX+51KWBXvFvjdcvv5Y+wT+StiE/3g9Onq7LKx8JN19ZejHmRBajpTwWid++8WDQV+mgPZ6+2vIPioHgoZ4A7AHggTWB6C2NZWgsr4wmMdURDL60dxlAb5/whN5+5xUEfxacq4D

ZMKW/aUXkfwK+V+85vqy+amA4+m5/7tDuf9CgHn67gAEBna9ef+cQgX/gnL5+GkiQfv5+7uIBfzF/FmA+f1adQX7Vdxrre7WYfzK+gr53QGkvNdjHgOF/B5/nOCNFawGRf3Qwnn/RfjYt3n+BfgqI+EFxfmef8X5e4wl/uX/gnGzZxzHBfql/S+5pfnl8ko6lnlKOjR/8zslO5dYpTqAYsgE9KesBlAHR3Ax/fb64wZ7oG65FrAgQNA2it1plnwh

rkXC2AQQO+MJ6MAIDFYtp5y+UOcb7a54b3rZ/hqeCnlO+Rr7TvwLu1k+Ev+u7NAznqXiX3G2U6Wl4CpcHV9Mfbz5Uu43kZ6inIBjBgC5ejJTBVPDiIMK1ZZFWkN/Z7yhHIeJz+rzOv2FkUgAfVhIBu76BKqNPDgA5XNLAFABDALAv71HFMbkxTJbgsd6/gAE+vhNPvr/oox/egl7MDkJfYW58t6oB2ZFfAFNRsAEFR0WPS9khLvGOSo61diD872C

2ntgTV6m8hjc+ao9nbo+3Ss93P652aj9/HgS//x4HZuEXGj4DXWKNYlEhs1aaSYjsIzXa0T5dnlqr0BqKSRcgAMZF/GF3vJr75A+/2kiQHDhLBiWfHtF2Kj+Rvni/zN+CPu++Dn77T71+WCHmyMfAZr7veCdn78bTl6J/IO9if9Def4oFoVJB0kGLRQwWwWfhy04hsmFooQendG+wQSD/haHhRRUDJYDg/3og7tEQ/zBmn5Ig/4OA0P+g/jD+wT3

MDbohsP4Q/mdA8P/5d/OvnpYpPgneGi8yj9pbSYXj59Uho3A6LyA1nkWXhaYDgfk/67DTtwX2OJ1wBxj2xmduxC5ITc7GX36CPpjvRr9VrEQ0Lp9DiyzJOd3fzvY+vag+sGU/rz8jB56fej/QG0bUiSDU34ip9i6IGvD7r36zB9nbRC8Ddy4vg3YUH8E/b79b3gJ+te5qz8I/Zi8iP8eMFugfVZMfO8G6SeUPUN8Zb9zfoqpxH1oAbgE6q18ACmt

3j48nxj/VKey0TP6HBp9v7N7tXUarbcbpn++Xtn+tt6T+PX6QHmHOgg8plZM7ET6j7GIgyXi7dqwbmhIVxsWe3d0cej3crj96FsP2WFab1+4//JZuAa2K8fkKSQmevl402xKBSBCC7GID1uhm1YKbRptPiwDf6Pd4b0rbTZ7s/5d+LZ+dz/tPXA7Oh7vtcrE/ZsX3Fr4VPuS+DXV3de/zNj1+GFkYvhPVoQhFsDPRDgXxXglW/1iICUU2/hrD3Gl

qD9I19v5hmtb+jv4+YSwzEGR2/wZ6CU5zSFR/pZ7Uf9OeNH/lnlV/GZDbTNmQFdNgYbXA77vw7vjbn+v72blx2AyHNt1LEPB6MSjvTi9wI92GYB9Z3lL+lk/XL0b+s1//H5/Psw/4bI0JPTFinjij5HJQ39GffP+wPhpTd3T2/krxzv7J/u2+5TvMPp1fOz6J38pWYAFPwPMA6eENpJMHXK4GKIkIGSnYwSpqv2cvfxoU1kUZwSmW4Ms0SYelVKQ

/zdv9XUgqSNKlRceijQGnHX63Pq++JC9vzrtOiAshz1ueFC+fjqV8PO85jXL//Xy8joWMuEuA/6RehR7A/+J/kUFijWS3zunuRqeoxeC1E0BHx8DcV7wRMsDMN3DUQYCYwtr34Dkj+t+onftvrJcQ36gCeeJ5gnn690XV/f5DeEyRL/fdEYBJspCdEadtqEbLCJLMEHRPgLgAm36hb5/en/bbf2YbwhIJF7UHCJxRb4h66WJZCX63k5iq6B7JVeh

5PltPqLaG/5+m0b5k/ht09gD8Lr9+jkfZCDbgc79vKdOVnXA0/xGGWOtdnoRN3U/3o8xoauy3xD8On0yUx8eA2vcZq3uITWiaYCxhr4g2GUCNS9Xkr/oA/tBB+peBUKwD3rk7F0GyAP7R9za1FNFF+aj1C3v+6UiOmwf/FWh7QneANhjH/vv/J/86oCDIlfdn/+f/tAMX/8eBl/+sYUSsVd6V0J8AN//P6cGLaUh+GXf+xqCtmn9s4/9Z/BeBCP/

u+HE/+w/9z/4H/yfiLgiFfi0/8TfZ3/w0QAv/fYiSP0NECr/we0B//LYgm/9x4Db/z8aH//dEelP8DwYO30xHk7fK0m+adcxYJAHYKvgAcREjDdcnCE4gL/vSJChs4Qd6qrM+xz5nL/eke3F8sl41uxkLvxfVH+Fs9pi4a/x5gLtqLOgXkZSdZ/TnIeNqnGS+i39lr6XjiNdNd/I6yDWEXpIsjD+zFwWW4sFfRbv6Ohk9gKkgO/wSndB4qyAObRD

d/Smoe75FAFHZgJ6NGNTF+aZF1AHYPnuVg4Ae/wKRdSv5vZj0ARt/AwBW39sqBGliezKYA2ImBRYujgaAOsAUwEHQBke85X4YZwVfr2XJV+kftD17KeDuKqQAbDQ4u4/pa0dG02p0YYQB41ZPshRSnDqAS8ID+prlmmRWYXsqsx0IgYwNt8CrPGS55FonRO+5bVk75gb213BBvOA+Tbcni44lwDckqUOGUuVcj1RTFEKJF37TmWdJBQUhePmWACE

ITMAqocxjDOgEARpcUd8kGSwUHBVjxZSN7/EqkLORwhL0bAmAXFOQn88cYf2zq5HACNXKNXI94ga5RNiF3bPMAslchY4f6qjAMj+q+6GAAM48dgHPiBA6OIFbYBF1AYABLiHpXIcAjSQb9QSoxHAJ/bKM/Ve+s09ylaI5n7+EZ8LSAdgcq67s/3ToGQhVKwdzZmOjA/2e6CusIFQqbQ4l471lmBPQRfF4Lxx57aHgiTGF2oAFQYAYLMjvYQr/gXz

BOyQ18Qp7AOQqAVZvTqUqXYUNCENHedj5HBPUO2Vh2h6DwW/oT/RU+AmssNBgCBndCcAO/Y/qAMNDFcAlSssAdUgo9RCvz4/ApQL5CG+u298oRxLAMIAAcAs4Bo8x2cgs5DKSotnKqMoDoK7Q4iEmAacA6dsC8BtUrntgJ1JXadtsv4gi1jJ/y9DvuvYHuWj8aMhDcX9QGB0L0SNAD1SjXFGdqLCkEo+ICwP0RqmlBNm6ZGueCN83x5s+1gHoj/N

cuSQ11j4txwAxoblJLw0igDf4e50qEhKHESoMys2ABzHllsv4gAla8EBP5IwXTe9nzrVIuQwo/QEDPmNgIGAjeAwYCweREQVB5JGAvPg0+Bv1rBUWaFkN7MMB9JdhAakn1x3nGXW4+uwc6v5duUaAGNne1isKAL16REmtqLV0ZhMmP9ji7tfyxmBt8E6C5mRv9hbYVjKuQtL3whjI/J7Ln1DFIsSRZEKro2F48HSvzlRrKv2aIC3X6FNxr/hFPGs

uDf8HkhzKh2wG4neZwNn5DMS421/UhEIbFU5sxe8qowhqADRAFquSmAlsCM0RJwIJmVGAvMt2ciISBVONvfV8QwABhQGE/krtFpAZEQkKZaTCkAH9+mWEUgA4wCJQEnkD5rhKAuKcQoC3wFvq1FAUcAheAoTQ8a44iGFAQoAaYB6YgHgGtv3Gfj5bXuCm4BtcDNAE9KC4tVLatI0vrBSmCXBmocXouJbJnZg76V9fh4HJNeg4DZ37GzxvvlCvdL+

MK8dy4jK13ImZZDt00p4hMjb3ikXhUvUD+fn9qGJaQBAtonDG/8h0d8uLZRUgjqAAy7ESAR4jgsuDg5NixZvI505nhCG2iYgYgAiq2E5xufIHRU4gQP/G8AigRf1oiTH4gY0xQSBn8orZqiQICLOXbBWabECiYomwGxQEznLfEckCADJ8QMeEAJAhZCwkCcr4Wk2dXnT/fNOPAAYBykwlgYPoAT1SB8sRvogB1jNGFrQeaPx9RQrsYFeCri3KAev

9l4f4olxWPq+/NL+778Yx4ZV3WTgq8TPaf781ugiWi6WN5/An+lS8Tf5XnlGrgExViBhDIBZRlTRe1qKPVFaqUDZxTEvynjuRGZKBEa1NIFpQO5fuZAlkuhYC8fqNAG1wEzlRoAZI0Va5s/zNSFdCH9YMJsECYke0wEF+YOuCuXR/fCLQV3hoOUIrgvO8+yijBmaSlbhNkg4fZZqwQH2ffkFPEcBZQCybyYgPrdrEIc2u4UCtWTD+RDXKjPO0GB7

8u/6ZjwNTldIFReRYdpFLXSCbspCASBwEWhD2iUSky7uDkJQ6xpUAL72G2ajEcA+QC7p4XPrwN3XOkcAsLkaaxGNSgQMxRqLqYBqh9Rvf5IXSOARKbA9WH0DuxJjvQxDHIFbH8LgAf2iygLFOOT+CImBls1AIQwIPHmQ3Zt+TBcFN7K7VMgGyAILQ4JdMy6XvxiIJZYXKwxoC62YPZHuOADRDOg4B84f7vj1tAYKfSFeYjt0b72f2s3rPXHEumGI

f1g8jxU/niwXb8+R1Wy6ZEwe/uGA688XMCHbh6kyzBGd/AgBKuNbIa5X2eNlZAuFuiXBkgBGAEcADqAVh2nwDWTRUckiluROYugxiF2v62EQIEMZSYgQTmw8jrCEEJzC9WLPEsUYhoEUhHWwmdhARkuEC0TZ2R0udvO/dEBXPs5oGa92s3kI3LDGzHQdsBD1Q9AYGABZkoZlv87U9ykAckfFa+CT8QgClCWw8Da8O3kGOQCNQ84jg2BGOIK0ftRB

FB37DqmK2vDquKYRAKBG0RYoN7/e5qtwCHq4TdwO7mXoPRSxohASqAQJoxjMAn8BgFBBx69k24+qJILJO6/tvoHlwK5yJKbAuBmAAi4EmExBgdlICI2xfBzDAZgKg/uHAGvg4LcAl6eh1VBtNPEhqkEDZhoLAH8lKQACQ4OklywGXdXChFhLLTM9IRgf4hnGMSIZYeL4em84DDACAxOF6YF/q6QDPJ4NJDU/lUyFpk8x8LYH9Xy8fqiAnx+yv97Y

Esz2s3qU3K560R8ks4QfVZgRAIK2og+sB95+52g7vdBQ5kapBFMC35WI0MhsEIQ8GwLWx1mlbslsSR/YYFl0oxSLF1EhwHdquPJt3RApwLyqNigAoQsIZI+TpwJlMjAAHPkWcCkvoIwIHXvOveXIK6829IIIJFAeIFQscWkhC4HpiGLgf8SNOSGWpiaB9dXRrNigJBBZwDUEHmhwMDjN3HziwKMWLJNjzJyDggh+ueCCFgGEIKBgeBAl/eTwD807

a4DKSkYAUKA4YRc/5a7XtduX9ScgrsIheA+BQKKGtOLFYKOt3gp9X0r/i9zEb+joCGY7xQVO1oWcVgwoSgQJ5WHjpePy4O9ggYsZOpcdXq1JQg9Fgp6Uw/J1hE7BL4AEhUpNYzOgy+HZgNrNFdiiF4j1ycQAOVvWKZnyDvlGiIHDHcBnc6EjmM3NbeKFHF1ROweRemxvMH/7TIEmDsggFKgfjRZ0SYM2x6Jw+H8OhkA6JqkVkgYORWEqyNgC2wjw

6DPLFKPTYiv4020oPjUGgH+UA58wogiopsH0ZqKYgwzq5iDYPiWIK1AvdJTOSw2weVr2ILbSI4g8gG1oAXEH10QW6pIgDxB/yt4gTeINt4h8BPxB9sB8fKBING5tPAEWgFB5x9qelyQAcggaJBGoE4kHCogSQYB8JJBQjBUkFuFmfLA9NYVofgD2VK5IO1Hvkg69KyRVto7PeVKQa4gtEer0dnvSnClukhQg2pBp2905I3eU7yM0gh+ibeonEEdI

KeWl0gyPYPSDPEETDzt8iz5eJKSREehruhnh0CtzWbmISDoP5TIM7pi9HG+MFmcFkE/DHiQX/EFZBb4s1kH8qVUrBuVXSA2gDdkEP+H2Qf0RQ5BRSCTkGAPjKQdfRQZ2eDNnv7yvzTnsaPDOeFUDeY5LAB6JpbAJYqo7cJJSXvwG5B+9GR6bCpYtD95WmVJ9qX/qT78pYpUx0k/idPB3OSeJtgDyfy1jnPUQFQb2UHN6reWucuOscpeIDMkp7/F3

8/sWzGAAr4Bk97CAXddlNIBZ2enhftLOQNHUNF/DaeZR8aaYltX2ntQNKo+SWsmR5ylxCgT5iVjAIqDkILFtFGMA6/d2BSMAj6AkFDiga5vMkBS38NQEVFU0AK0QGAAm4BFyBBN2GJn1KJlBCuEwf7puFmPrSLBY+wBMkv7W5wY7k3PYKBKP9zZ6NLHK/PIbYEyp0J9EHYYSpPLbSaUakgD3UHSAO4HKLPe3iFx86X6va2OPk49Wj+qccKUHvf0z

nv5LWQA9EBlADIaEZAJLuP4yOqDHqgsoKlRvFcU7C02goAx9fzR1pW3MFeQ4DrP47P1s/hogpG2uwBCEK9R17NpKg058APM35iE31gniweVD+gAQHM6zbApqi5ZFD+hH8l0GCDnygeLPKieJVlBaD9MUyBFugkk+SkcggHkoMVfiaPD7+audmjRrAFutm8LMeG+s5A0GkZxB/nqg2WqwrggiADjG2PnaDVgBVoDuGr8nw4AYFArgBdxcR0H49ziI

IblUpS9lodf6/fnhkKtVBa+sjdfYHJT2oYgmGAGcmAYKZwoYICATjvVR+eYD8d6iu1Y2tSfdAA7RBI6CvgAWANigJWgcicSfpNBiiwA/hXHaa0RVxa8/x4yB8cYQun1hJiZCyF5ZLptaAKDhEkui7ki4wASsDKaxQDpir8h1HAaFPccB4pYFCAMUWd1OgOFv+Wm1yFqE4kVyhtAnaaW0CYNCcLH2vgs4Hv2hgh/UCmmHZUFfuY5q45B7QQr5RvtE

xhJEMkYA+AAGYCPQKtnagA4ShZ5ZlhBSVKKYJYQ3vglhCgziWEJG6JYQnfIlhD90gA6t1PVzBgvA+EFp/yHge0tT7ShAAFgCiVmo7PGdaz84UJv5g7BlozMD/D9QzpgwBKy7QcfkObH9Eh8MOMy1xh0ojwbKI+o8YOEo+myhtp4/UzeofUF7Qt72AwXTAjHIR/ZG4r++A6WP6/AxBxz9wJ642whBrZMWkBnwIHkj+oHPaNmAV3K/V5SvywFxY5H4

IRDQy+8kQzOLhwKtMIIiQKSpxgTVkEZ/B+AunCr9x+sEW+xoxieQdnCcQB195FUC/AayYXeGxiRvMF0O1IvqkbFYA7q9hLxDEyh7tqgpWmW3xhsF6byrFrEQWNoROJLQF8n3rnv+gu0B5qDkf6FYLG/kmgxo2i4M5Xii8EgwdhhenkJbRrhw5oISgQxA89MKSJDEB4kgSEFjQDwqCkCAcFAQGRDg/KP7B8YEd/Bg4LKgUXXZV+V6CoBj6YURzOPC

aoArP8FYEEd2SgALwVe6r6wqfBRYNWRF3aTV03phcALx3A5Pgh4QgQLmxjESf3RAeJE9PKwxiIZRL9gJS9MmvErO1sDXX4zQMTJsJghNCoYBnE4Q2BfhHOA1by1JUzsId/2jhs3zd+24elRGhbjF9qM6AOFUsOplMDHQODgdlSHgK/oAgrQ07BGAT9AsUBJVIf0SUykapBNg3kwgpB+15nXgzgc1QA/eYBg1QAPqz1waAVPrBfPVNuCnAOPAFbg2

C+LyV9cHUABGACqA/uBaoCSL6PZ13po2oRcg0RwtqSS7j2wXn/MUMmSwYpQOwwDctG6Ev06z9Eb5/oMmgQBggVBv7chUHsjzLpop0McgHIRLQg7t2IDoQ0G1IHIQou4gf2N/j9ghpSb50K1ozwGhwRFRTKBDzgzOjnK2LwalRaeO5eCi8EJCEKorK/DDBL38sMH0fxwwRM7T7+UgIeABYwDISHJ/SeBWqDleg1YCgWOl0X2oAICl3anqQ7zD32VD

qdnxfahiMgWHFHuGEBW95h2iowlhkPUAtgBOWCk74CYLZwTsODnBAFFNgBxjynAYFUddoT905/yixHg8MO5Z+B6xcEMEY9ShMDVuAjUxlJPBBTaD+gIv8G7orsZ7kYzkBDAFNeR/YWXROQEkUjjwoAIWde99dLRBngKVAZ/VAUIWssP8gQNRQ0FHnAhG7OQWcLNvQ7CFnAZ8BUeU9TIu4Lk3vdnd3BeGCXvSaAEGRB8IVoAny8b24xCX9wVrtBhY

289TNT7xW0jDWSS+WzfkJzaXYOjwddguNBCA9iIE+ak+NpiZZjo+XR9UYNbSLSjoCTmBoEcs4B7G2tgJWFagALPUEMgmfizInzA8JgvBDI9ZbtVbgEIQmMMIhDCyI8EL4IVIQ1bO3YVrzByEOFgevTB5eFkDaf75X3bfvUAFFAOBQlfjx+3DdNhjSoKu2opdwjzX2wbZhVToXrFWOjvYSg8n3VazMJfgTIxU4IsgD2sOMEPiEv7jaugmgQr/KaBp

8CYD4q/wbbvdgoXYmwBMrYY/ywEM8UKKBEqwgx5JeDlPj7A3NBfsC1WwwaENqmuMI5K218ZyAF5CmcJqsMdQrIR4HDLEm/gWT8BOB7xUwgDP1G9/rVSfOBrOogYE6a3H+Gv7CkMfJgwQBCb3H+LSYA0KpDtlADKAEqZPsAGt+WBsgTr6WzGAbgbCFuoGtVQHEX0HgQIguFuxAAjAA+gwIktfdELByvRdChMVCplDpRdr+8HgWQikkgnwFvFTvGip

tV3Ze8B2wFHfKMU3kN2TCqJ0GNEgHNfWa+CSgEb4IKwZZveaBVsdEJQsXXv9L4caU8rWRpL6i700/j0fO8+hzIMsCVgFNmFdINsg2wA3niJaCHIIudbDYKwAUdRxkGEAqRKNDQBKpIEGM22egZnAw1ql7VTMSRoCWEIwuRnAKzkUCGJG2PHqjA9AauAAiwDYAAChEoMMjBPXImjBGfwwgW9Yb4+VNJsCRe8C4/gftMmBA39+0H4QJtzkKfIiBlqC

hUEwzyxvsoIWAQfOCqoR20gBUA6guTBcpMweay4kaIJgAVdEa05UIy9wCFIatOdYA0wVBSHCkMlIeoQ+5eosCtCF5XyY/pf1PWc9WlwgCNAEEdGVfMtk4ZMmphIrECqMD/Qq8yFgFnCx6kMes+EXeG+4Jm4LBEBJ2hxdTNog9RMnAzvCPht4Q51+g18/CF25131ku/XgBSaC2Z5BBxaZKnTDkh9xg1ohv3FgwTE/XPBRP9EiGejibZC0lQq8gGlM

6Bh/gjqF4qFH48KouwB8ASugZCQrgOsuoUEHAAB95BrLCpMtixYEEFCDWnOKIUXqeI5ZgSunQ9SstqfXBxY5bFhhe1xEIZAPWAdVQeXL5AA3BMfIX5Kr9whwAokJk3pbRVAhQPd0CGeoLIIK0QOngwUAdQA0QGovrK7LGOXJFhB79DjbQQb8ehI7KDrqT08l+nFrmGRBDeUhi4ogJnqmH1WPBKg9fvibACtng0fZz+BZw80gBuTkaLVVAcgAv8+2

7Fsw0AHlzbXAUdAEIHHkxcPnuGKRBJLthP5yIOm1LXGQxkXck4b5lOHRdiDPWghVMDFB7ft2s9oKg7ch7c9+fapaG5yumg+V8F8tc0jZ4KN/oPvWReV54PSQMsF7FFrKSCM2fxioAIgCIAFVQYfwEaNMH6MIiQRFLKN4I26A0KFj8GaAJhQi6g2FCPUyjxTwocQiTWU0sptZRQQGIoRhQ/oQiGZrEA0fyj3lT/GPexADSSakALhboO3YkAHiDeSD

jlz7fqUYe8hztksNBPkNkQQORQmOGWh/ZR9lEAZufOe2mcv9jUHc7QCPoFAqT+DBCmSHbkMJdua7VUiCn98ugEKX9IS94FaMgDNZUHCS3gwQqgzYuC2N5vwEh16JtQzQz+z/VAYCgzgerMuQ6RuIWsDUEM4LUlD+Q6F8pqCaY5BQI0oQmgmJamwB8l57kNOFgFVCMECzZXsEMDjm0vr+GChdEDQyHkgPbwX/+ca45pBmADUpnzdt5NB4wKtNpEHy

RVcoStrEaUa2ti4rxf0RLltrPWmPhCY8GLv0hnp6Q4IhcK8cS7weAmyLL/R1BZbByQhGDXm/nBg+Ihl+D88EFoLn9McfUeKos8y0HsUMIAZoQ8qB8ODFN7NGgcgNIcVzsSW1ukZsO11FsQ9R6Gj5ChP6SUJ4DH7kKIQw+sB+Qk2RrjtQQ3aMZZdyqHq9wuIQ7AjHIOa8cS5LCVGrEWjRqhg5Q36wk4FiIT5/b7BYZDMqxcsCgjABAXhA3CFmlJ4I

ngRM0FbByj1DAh6NIBeoTAiOhE71DNcQPUPHlE9Qn6hjdM0qY7vjgRNkAY9BMZcPG6cUIsPtxQ0OmcLd4CScbTEvPRAB9BqtciBrqQycodlQ58hi0ES0Z/KE/QQxnWH+NJCWd4BQLoIezveNBd2CqqG8KE2ADBvOeuyo5CrbBF0z3ht5Q9uS18EiH3UOHQFBGSBUXjJNAC/ZQDmjT2MzoTohYZxtzB1VqBLUZGCtIPqHnykYjDaSNAAvNC4coC0O

dKELQ6kwItDNxZi0LXgQ3AKUhLQVpaHKn1loXzQ0/6yDBBaGDiGFoaMFECWC5VxaEa0LlIWYfOGhNP8lSFiJynBBTCUgA9QA6eDFoBldg1A3pGXSRRyAvWwQHNnvFjSWlICBj5V0fQmFDK6EkuZMlh+4lRlDZuFLotFQzXoxH0PgdKXUoB5xCeAGJoOCIex7HEu3OUsZCEYzCwus8MhSj08vsH0QLuoar9FTw/RVzWyKYDQ0JvgZDQTdAjQgI5E2

ptRhIBB8GglWptVxXRlAgs8QdjA7kpvMR7CObQusezyUQCpNj2EwgSGPN6pktXWqE5lbgAGVBsB9QB/F5UkQYLk/vFt+/CD1sHlKyMAPoALs8xIAOAA/ADpTuRgp3wJZ1ZEFnmimKPHTRZEW0hbKiSQXLZPHcLSkOcpjESbcFRhHvWZv873R+HadDHcfn8RPCBVsCpU6ukKUHu6QyqhSdCaaH2e2zDlnQfhslIsp0FK9CZQDS8VqhIZC4KFxP22S

hhwQWC7h8woLe5WOao/gxWwapAYsDpRhk1uYbcHIDxgKN4+ExboRqlCEQkYk8CqHCmJwJQcDuhWcC8QpBUGhEDz1Oce/dCmiHq0M7oS8TJKAXyVRkYmqRHoQ7eYDqqJCV74QQJGIT5bEGA190OACSACJFgmWEj2dqCKChMVBcoYojcS4pXRxS6+QJ8XKTQ+menADNyFXwytQXz7C2uT9kNngSPV/oaZUUZIoo1gyE54OAYYlAuNUuQVtaEop0sDN

Otd5iF4BmIB4AEp0tgrWUgbl9lnq/0h8vhiseBeeDYx4DF8GDZvXDJYsfXVB8728R0YSEQJLUyQB9GEXLUMYcYwkZAJetzGHo5WnntYwjZcuRU6niT8EcYWHsIIseDBB85LWzvHNBGWc43jCJc7wMCMYTeAUxh+5Vi9TBFWCYSMKaeekRVwmEOMIqZk4w6JhQtBB878J0CAbGXar+8Zc+y4jUNaqmwAXswhABKiCJOBa/vSnUvY5nlLVQOZFWCJj

QuvKGgZizDRYB5xFbSduS3I8FGHzwxyvEonDAQ3RhwfhUWyV7kzgga+N+d8sFzFUYIU3mTYAiB9/C5ZQFLZJFQms0guJnKIBeV5ISLg7z20xJoUhS4Mown8GLQqJKBYqjjkEw0J1Cf1ADxVTkrDtD8VnYbc36cCNp/Y0HHMYQ4dZigPZNDmbs0GA6PPQVm2FIYNlx/iHnoPhSElAhSc4ZDHq1MxCDAAhGQSt+ZZSfWrfr0/RgEgoJX1bS22Gfql0

VbBctd/JYxwSCAIdYRU0eoDYiCAtAEGPP8ZZ2em9r5ArrH4DJsiDi+4jDNn4Etz/ITZ/RkhAVDVlqbADCPplXY34NxwMlq8jxu6i1AfH+bqDbqEJUM1LO4wqCcMc40axHTS/HJBAec4YC4HoAKAHmnCMKEt+oM4pRTizl/MKR8TcAhjQUZxozkhYoTOe6cHKIu9QRhCqXCs0TOcMwUHxzZwEFYWBOOrsorCYZw2AElYYCKaVhj69mZx0wD/Loqw5

Vh3M4MZxvTlFnFtOUmcxOBtWF14h2Mnqwm0kBrDOiBCsPAnCKwtAAYrCzWHAzlVAJawyGcO04bWEKsKVYVzOdGcws41WEusMlnG6wgpcOrDYcEwSzCAYlQsMYxYB7vDXMjwIYD/c4ODlDh1CDJCXnEsiWhUQ4MKdjxfCvVL6/akhcv9aSEP0NjQRTQ/yhVNC36EY5HqPjiXH6iOdB6tqswIUjAWXdIBuzCgKaDxwFIVrQ+8cqFwO0qlBT/Yk/kIm

qnAsGASW8VYiPvAWhC+jcZeJRA25AjpTOshn51JQoxFV1YZzQ1oKI7CALAZhVH6JE0SdhK1lp2EFIjclkIhMJAi7D85LOFQg5m8gtdh/RAUfKesK3YVjhNoKu7CmuITsIvxBcTUgAM7CwkBzsO07OewrviS7CyB43sPCplKFVHyqbCI/aD2z7IYj8ByAA7U3oDo0LYdrwwj+YRbDAYAlsMOJre9HfCJdA1sDWZjmJmIwtDKEjDkv7UsKHQbSwpth

gVCvg41AKm0OuSJRhDQDLig76SUgufgv4u5Jdz0x8sKq1CE1BxqmfQJgqzvQPAPOcI2iS8xhorsiiMaispPTq2cB5gpjwByDG11Jjh+EYWOFhNUaCo9FPIG3HCapK/nD44YGfNvEKTUjM4qNVE4V/PYwyj7Dh2G833salJw7YKHHCBgbhUxZ0llJBThpMkfQpKcPZFPkuYThimcwOG1fxqYZiQ5yuJ+BYGDPYR4YZjQ2L07n4CWEKRjSdJdSQKoG

NRIWjnYOAJrWwzheZqD6CHMjzpYVdlTYAsJ9DkaYzA+OK8oGXYH7BpvquoNJAdywj1BwSFxOGXJ1IBmy7Slg9MwPQwPq3DqMSvHtexAAQLYQbghALOYESgGzEtdDJfQJCv6nZFSETBnqDvPUIjsarXvcXrDZziZcOg9mwwHLh8+pXSbS7BB3kVwlwqkqwyuGxUAq4aXoBvQ+IhquHEAFq4Uc+C6gDXC+I7uq3E8ulw1rhhuw/3bTxHnOMQAXLh3X

CCuH+p2K4d3qQbhQmNKuFFiHG4ZNwnvgM3DZhS2cJVzvZw/yWkdAtIDJaG6+qfgdVBXy9vOwxXnfmPiw6jhpbCvNLQIULzLZ5ALhxxCZmHHwJ5Jg2wsLhxHD6WFinynAVZYf34R9B+kJuwhHqNOze8AHwAcoEyyk4QCqASeU5OhHaoxGn+Ujx8EpBqlBTEyaMAUTB3KZuAf7CO5Qc6yqoL8BdHex4dlcRw8OKgaUCchy08AxEzUUNyrEYmDHhBlA

seEJGlUoLjw07QLcp7YCBMAjqmFvYnhC4oEYC+AEL4FbNWHhnrNKeEI8LzgEjwohE9PDJEyM8OyZizwgAo9CAeEAE8OgnE1FZ6gJPD+eEnbyQvGdwu4+F3Cu3K5ixLNFAAcfsRptiaSaoNuAAtrXQe1tQcaFLUOdisSDDLQb9lUZhauwIqiDTeLWl0gnXJqUOkYdCLIVBx58RaStt0B+HEoTLAVahfgRppFDqCLvEsOzxCw36h41aqtICKAA9QBW

iD6AG1thVrOV2twAIcaOUIWoS5QuRBVNNgTSTSid4dW3Rmm5NDeL5vv3C4fMlZcMNqDxdjweCLFJ2wgkBctJBwBuP2uofFAvOhPLDRqFz1hmbKaYEjBhI8y05m9gyoRGAVPhOVC5EHjwVDlprTbDh7scBv7RoPBXoOg1L+jbD9qEXwIxyBNfHEuFUQsNgIkVZgfwKFZUZ1C+2Fee3/zsXCH2m18EY9ab8I9phpw12m0Ch3aa3uUe/knHcphsNCiA

Hw0MtJojQny24h4Nc4AgF23H7g096iUB5qHiUMWoRGEekSQa9F/hzH0H4fF/XtBm59GuaUwNBnrfHN0hUIs8XZF8MxvlOA23UGJxLtaswKfsrEQLCCq/D/c4/xVeeExQqqg3mdeGBuNDF8jUNCnIigUTYD4A1R0M0QRgAeRx0KGkUOYoWgIgw+gcAjhBYCMyZmEgPARYPsfYCECNx7MQIsih6mdemAYCMoEcK0agRmCdB6z4CPoEfXgjoS0ZcFc5

n8KGoXDg9NhCODQ3CVEBZANgACkAPwAAYL642D0hlQnyo3fDcaH4UTfrFMUE++ROII8EWIRQ8qDneth+fDKaGT8M4zp8jNju4ZxbajKf0r4fEuWtAfyoWaEhv2dnptAiXeFrpc0x7UWIvMdRfnwltDl47MlxEERBw8IBNGRhpBFgH0AAg0d1EQydaRodjCUEVbwjaeLGDi6DIyho9tezPjBWOswZ7DoIMES3HIcgmT0e6R6PnkEuAGLkG07NAACF

pJPwYDaWcQ6iCBokSDoHXdhAdRBKUQ18GRGDkIj7kgcAFpK0H2mGI7NKNEc6IZnQ5CL6xMvMAbE52J4dA5CMQtIraR7YtzomhEAFForLOYMs8J2ZuMa6ljf8JEPKZiWFgxzDRgB9Wt0WeCsrPxFKyLc35UiJWYOqHpYjSwOlh9LEa0FnmEgAchHF8DyETaAAoRWqJqg7FCPxAKUIrtE5Qjx4CVCMJFDUIk041Ix6hElfEaERUIxJoejQ2hE5Yg6E

TswQI0PQjoXSPCMIoAMIscwQwjZzAb5jKLGOYNayEwjZzDTCK6LJCWPZ0Cwif1pLCNQrBiiCponpZ1hHkyU2EVbNHYRewj8AAHCOhREcIm7EJwjAAj6NHOEagAS4RlwprhE14juEfCgyyEjwiWhGZYkHxK8IqOAnQiPhFQunAjnc6b4R7RBfhGFFkxYiMIp4ss5gQRFaTXw+FMI8wsEJZFRRQiKIrExuFFCywjLpKrCPHuEiI0fggQYTD4uPXcEd

VTTwRYrtIOHxbTQYJgASQAe+5+gS0kwcoTVgUIRb/DnJ4bfAm0FgIeYEQ4s0l50e3/4Qj/Ajh4/DAeGJCM0QUE/d7UQ6gGCigBwaARcadsB3sCbqH18NS4VtpRVixZFippr0W3QayKH0RYCAteEFgJ14Xj9Zwo7RBYGBsXBZAL2/UY+IxMRvoAqEZbM5Qnvhnh9un5nlE4wAbrM0Rd9DLYHBcN8oYBg5+WQPCIuEf00Twd7pcjgG3B2CGL8KBUFs

uT7BTxDO/7yYPsEdsIyfgrdD1xI9PnOETsI1a2CAA2xFrByL0N3wL7QZehq9CEiIXAt6jGH2fwFs4AAAELH+jlb2niPasA6yOQi4d5YM3aUitFI8ggwhWLxtdR2Ec2I+qSrYiLhGT8A7EV2Ik7yNjB9uGG6EHEdQZTrsI4ianbjiMnEVutS8QM4jtxHziIOuoHaTGKcaI4QCoiKbEQDJFAITHwuxHF8F3EduI/cRJegq9AXkGPEaZwm32rmMYPYT

iJAQFOI0IAN4jBxF3iIxioTQZcRz4iQxEJlypQTiPTV89aDMAD1ABZANXdIkeyfDOcov8LT4RSSX7wpdAa0b1JD2GnfTYIK2gijZ70kOpgZWXQsRRfCvX4liPYJDsffbUyjDaOBNyBDll27OBAhkMAxGdNk4kW4Ipkuioi02FeCIzYUHcCgA7RBsUBkwiYcEEIhyhW3w9RG5UL1gjSuDKMbJBZzy3kydIVSwwARnad/CG0wKCITTQ1d+DEi5ugoQ

VIEHbPVmBG3Ba6j8NmyEaBYU1aP41V1rvKW3EedoAyg8ugY1o3pDaulGzLHQkiBmhFMExTsClQAIGrPw9MZuSOYxu47DRgIYC1WhvCOMMNStTjiIwixeJjmBq3iUwGta9a1hVqlsT8kfSiKigG3ZQIzhXziIuznbgRREJHvowqRhkqz8LZi9XgchGVUH8Fo/zayRfki7JFZ6BblI5I0xgzkjXrp6wD8kUNXVoQXkiL0ileFZmtuI/56AUjRWBBSM

0gCFIkkCNK0IpEt8SikaTwkOAsUjMNoirUSkcuIZKR2TBUpHyC0SKplIwAI2UiBOGsqXykXkCQqRlkjeBa7rU3GmVI7vgDkjYXpcFhqkRxNeqRHkjvZLeSJakSBYHIR7UjSdC9Oy6ketFHIRoUi/GB9SOE4rVvQaR6vDat4jSIbWmNI7cRSUiGJpYRjSkUStAess/0spE9XUWkXs6ZaR6GDiVbXHyKKvmApCRYYjeY51AAi6AROZoAvMJjVLJ8KK

ZHhIlMRY8Fp4YvRjhSD5ArMR1mILRFk0KtEUj/B0BtojR0Gfvz0kVewOgKWdAePbGSPQHIgHLOEudD4qFeiM1LPRATKRcHRINjWl20zqzIq1k3nE7M5cyPlgDzIviRBddw/Z2cNEEY3wgK8zABLAAMn00APgdN2h4sdplRdlTY0qy8DC2bKZiQpv3CNCBABDZUNm5lghjp2t5HUZIPwbJUjnLPdGw1BxgWIRYBNm94LMM0obciTYA3GcsMaFEhOV

HrHYyRA2ROhiLVlxtuCDEKo1JsvZQtQ0EIOXLTqE0lxHyTWvEpQOa2XQ69zDroGPMO4Dv2JeserLlVFKTj3UUnoFWn8Ecj9u7oILgbgK5CcSUb0fwEEowFcuNDfH8cMD2LIVfWfam3pavS+eku9JKwwlMsn9G3BcNBI5EVfSwQWmsX+qw9kwGowclRYSePfyWm1JcADYoFYKm3SRfOg44dsKnuDxaie4ZYIhah+AzxaW24BSSd+YvpNCGjNDBLSp

5PCOhTYD3HCdkD1bKbI8Me5siAPrb4Jw/JsARz+YRDXA7FtA7dMyNFkgnLDkuGeiLzQQXQ/0AKRIgUi+YmHIHXBd+0jEprsCdQjdhBasWVw5W5Js7KazDkWzbSceopts3r5fXlgPv7dU4wad+N5krnDeppIOuB+n1RdQqWx7oTnpKGB09kpYa1nhQvr/Iqce3gAI3rAo0QRpzqaoA0zlG5EYkP8loQATjaRgBtcCtrDC/rLIvTwUCwwsHCL0KPn3

I4LqaVIaOQQYzpbuD/QW2DOBcoAwLQMOMa+a80WeJkujEeVjoWuQ9XKNsDBMEYgJXkce8TYAmX8g44d5lVLmmhGmRV71xkS18K5YQfI9mhBdCAxyQgAvZF+pfS6lokH6CnqX6vLI0WHCHeA3YyICGXOg8wlJyV7pWyYNOUEgJrRPGsgoI+KDIACuJBLkML67khH0bx6EVhlSjCWWpXJne5Ho0wNkRTdsml4lUFEHr2EkWQQfq0ygB6CwDE30jmOQ

3I+HDh4vAfWFkkT4FaOhoJlQHj28OSWEXvNgBM7862FcL0SrlIXBIRidDAqETfzXfvuQ8XYRNkQ5Zp4KS3EIQFLoL1RzyFWUPtYo0OTAokWcyr7Lwic2NWnbaQ5CVWIB1GClMHDRDyuoSJ1DZQeSZIB/dFwh5MtheSCdjKoXnwl82FsjC+FWoPR/m2w2YmotYT5B99U06O7UF3kQuCm+ZU+Dhol0YbOYDHDQHCp/3JuK1CDgKWxI6WS+Qns3P2AV

cYihBYnLSkFLlvZabwQVzILqaybwVVHEdDAh3Z4FCANAH1qPGdeZEtQRw+zV1E5Vp6TSvY3vgqSBH0DFQHBlWNoKkYWAHikBDFIYif7qYxUycDtKIUZJ0owmRkjoE6GZr2bYZsAdX+SrJHmTjGDpbk/YfeCDA4xsi8OBfXnRwqiIMKilkaa1wsofIYBZR47BYVSAwE6bsNOH8AElVn9ivKFCTtCue442KpjpD3lCXRjC1Seh2acTlEqiJnGHsARd

UAUAoeImeVvMP4FZHWe7RZ5zMhAuKP4+RV2v1tmbjEhFvcG06ezIX6D3cDZ+gIqovUCIQbCU2FEyl3UcKCo+mOo6D6/7kyKJwBKSJ6CJ8hnRG+PgwEBXsYxWhv84qH6Bnecp0sK+QLtN0ADZMAaYIjzEUQzOlynokihCQGsvMfoEvYZmgIUwniFYPN4SOFoULSLND3AM/4WNuCdh2rBlwGQAPV4M1RIvgLVG1Li8QNaokXw/QA7VHi9me7ATnGSm

zqiqh6uqOpdmLoT1RjzBdAg+qP6sLeAcWo6QCU55N4MqYVDIvIEgaieI7ZQKR5laopEO4aiEACRqKp7LwwJ1RDIwXVG+ZDdUSraD1RzgRvVGKQnTUf6oqC2qzg28Er7WvRGpqG8gdPAKQAwwSM3AmWeO8970xjBn9lNDGGaWuMVmElyFWpCSzng0LbURodOrirOxyvMVQuTAUqi6yaqIKQxgko1O+lsjFOQ3hUXmisEb3guqjuCTjp1YolF+K4oe

8i2qHH8mhsEAHM6hIo9TVGD7ncMh3uUfccGY5qDZIFpClmtY9Iw+hJ1o0qWaZs4YfwqUcAQM63e3KQXdodOAV20bNpSMDuki0eWpArPx00ypMOAsPfNWpAxsAo4Dc8SsMHBNSxA9bEA1EPqPfkk+o+fcCvFX1GfAXiIvURFYg36jHoq/qIfEYdFAre+8QiUEgaKkoOdEcDRCE1zJq7gGg0Q2EEyIcGjNzAIaMdJCho+6RJk10NGVzSa1FmoolOZK

DXv6VoPsAYDwCDaM+5U0wFpk73P+mUwY+GjJTqEaM/UactDBhVgRVDD+FTrAoKdM5BOPkBZK0aNOiPRosyapnELJrrFlg0fsgdjRoJ5ONFuGG40fWNM/wPOhj5gdqNsruSybtRMQpMMBWVlAULN+eM6YgonqiB5ChsN9bK02tWA4gLna2N3A3IG9+sStFuiFHXV6IeZNvApgia/AV7ABUfGKIFR6kjjqxbqPdfjuorgU5TwV6qi8GZ9k/YPjIMd4

JmFtQi4Orswsoo3LITXJzKPg4NioguhjnJ/9jwmG1Kp1AQywIQg9fxT1FCRH2QKcg53Q4aIRCHpZMqDLshxyiv0aS02VQhSNbAAlygnjJiXHfQiU4LNotXR0gHnOXYzNbyTaqZucTQGGfj/2NOfbDUOxCWNLkSSpII0YBAmU79dkQdKOdIUbXGLsSWixwGLMNVrOePeoUTn57jit+y/XuBaC+QgPMztwFaLsyGEoHyoDfCytECgw24EOQUzw6pB1

FibElpomDWc9k93QHSEwriEKoOeDrRvqVFQT0qO8ERUVCgBI/ZxsAA/zKang2Mzwam1kOFwGgwtj7BbEK+RRD7RCKhwGAooWd4w+BcmQvVE1URQlO+gv04yQ4HyDtHrFo4CU8WidtGSFwVUar/EDBipcVVE9uHIUVrmHJ6xxdiGIclRZPLFQuVBfO4E2hEDFsfg9o6ehrIZWoQY6kmvFG/H8AMxJtLqY5AEeE3ZYnAYgA/BC5QB3aOlgQ5RnWiV6

Ag6PcUbcRByAmABir5VZEqSgF1aVYTNwhYyuSX+SMo5IXgYLQ56hjAm75E1mJDw6A5zyjEDF5PsgHOjuKa9qj57UKSUfSwycBtOjfER1VTb5A5KcS+QXkMZDFmHpkbWI4XBnOj/7jMUTvUR8VXmBtpd/QGRUDKRM46QJoWYIw9G62VyRHkCaPRJRdw9Hx6LBkSH7Kr+Nx9sMHJt2xHtnsRzRU4JDMIZgCMAAXsSdSPSMKOR/7EfXgPg1AsSpQFtR

waHmglE9FjkvRduQ6PHCEVCN5LbRakjydEbkJ6UbRIq1BpECLa7pYE94E/tDNI335g+DpWFnIBlGb8MnOjTJE6URK0VCQR7RAmtvBDfqXqwcOQAxQb+wBHhv7Ce6FA4bASJ+UHeThhAJhnj8drR7ltyG5K6LEETwoRHMW8BtcCpMmIAI5Asq+YWJbqTqFGL8J1g5vK20h8cSl+EEGPjjZf4I2Q+sg50CSztKQXqilbIifBUnhxzPfQSG2XDVW9E7

UK6UXtooTBB2iG3Q5khewl7jUvwuVtvRZRULYMG+9QBhGjDQ5zCQyc2MnRJmR0Lc+dHswUycB0kF44eKUM0DhCHpvMhsVkI5zJX1LiLFQ+vLooHRXWi/JZduQcgO8aLGA2CjfFHCUN6NPzlFf4YjRnJIUNmmyAWoPowd25f7p0jxiUa9CEYuwKj7YIO6LBUYFQxaBqSjQqHsPXyKDv8UJESXxMzpqCAmURY9BNoJ+CeJwN8JYLlvAaI4Z+AHIC/8

UcPonwryaa2V1kTa9T9dmX6DyhaBoxP6kaSRxhCvf8huz9l24TFyKwQ6TEvhq5Iq9Hr4HPPv6+emAJul934MyINUVUyMoo9cFp9EYEM2AF2/MSM/giPIZsOwi/inMFrI2WjH24KDVLdjTPKNBSx829F2GJpYTTA7hRzgJzTKLzUgeHXcLJRinYf1hgfVUMd3FdQxgRj1BDBGMrFJSXWaYJX9/drlfzwZpV/LYOzeD1H4MfypPgyo9AA2AAgrb6AA

ZdI9cSXcBZUgVBmGIXUrr+KVYpngq+bNp31njw3WVRfDdq/5QGLXHJsAK+BWGNmjZGhFcoTbTODU+gh3RF18NLFKUY2KS5RjdS4NKXZXpTQNLyjzAilo9BQ4hJ75HCQbK9wFYvpgXzMxiafo/wlu0hnGKCYqqvS4xhxj9WBbUBOMWpCB4xbOloaGCCO0nsIIwSRyojQdHMXGwKM0AWuSRYA2+GjHyNnOxgd0wcRjAdKrImNtphwosuOHDDhr+QMk

YbtQ9RBJMj8e59gCFJI3aZlsZl4qKjlXRRUYCuAIx2xiG+FC2hT6PcxX2I3cQ1+raACBYACNO98G75lD68cLeYuhXRYg6EhOmLI7xF8PoAGkxY8BYRr0mPHmD5FUzhjYlLt6smMjAOyY+lSXJjaTG8mMRjPyYpZSgpipgqCyLo/s0Y1vB9mjitZoMAQANuaIKYWEj4OEUlW6MAMY5ysafN1gS5MlrFvs7MiRjRkUTH4cIS0ajfXx+sB8sQHkbyOf

tfIDQMDj8JlbANn7gOPo4kxUH1STEroFAkF6JFKivT1syh/ZjZEEbKNrq3piCqJ+mIjKAGYhc40xY7GA+mNmoGGYmfwHAQVZTH8ImxiegiphGeiW8FZ6PQXnC3fwRs4wFGxYvF7wZF4HYE99gT2goy2r0dSHeGQsbQFhyEEKoUe+hGn2HR9Scw88hi0MocIEyYo5m9HTMPvobmI7x+aa8z4GZGKMmMTgGZqVtR2SoacjfMll0N0xvNMPTHYGKYWh

EIFHIs5B+yBL1CndJhiR/YNQAyCik21zAFsSaRQK4xl97KAX6/A9AtL6SaxXoF0/A41KdeEqCjOp2mJgOnlohA6Hxi+7Z4/yviX3MQBJZMSKf4Gvq0Al4JieJVxR6oDATHIoBbKGJpC8iZ689QHwMT5MD4FVtQ0BhMB5y7C1prjIgoUtujmcFUSPsMYkoyQxqy1d16EmzFHA90YxC1dNUujNGCppjdoscxmhjsDF1WGJRK0xLogy10VCL1gWiRqh

aQZgAmhymJLMQIhJCxVVQ9XhcLFuMSmYgRYpyKsqEkkKzMRBYmCxZFilFjVmJy6C92LRY25iCTFCLExISfACxY3QkZFjFmKZMSosYhI6phosjWqqYADWAJrOVogsNpuwYl6OToOOFGsWqsDECb85RsHAk+beh9N4Oki38ViVrabLXM+gh2AxjGlmHBDYWN0jZJJF7IgJ0EXEojhRm+C5U49mMbGINoDlKfq8fKQSjRSGI53EkBl6j9ORbGPHMYfI

gUGTsZ1FgnADQ0EaVSHCTNFlghDWl2JNCYNqAsQhT65sqFAwYUQ1c65Lk/8pKaAjeMO9UDkBI5Gu4HiXUUlLRTQAPTkqu6M6hA9GV9eiyYFJNAALwEdDq+Y3sh75jPwDjEOT3soAQKAv5iWoAklR+PrDKAvMoxicIEDf3YAb+Qy0xhECMjEzGPFLOGAHMUJOASYiSYKclDS8Tq4Jj9CTFlWB8sVhYvyxwSF4WLa2iOEFTpbf8oIh+maHgHq8PNYr

20fjAlrEf4UqsutZXdQakkNrGp2m2sR5ZVaxu6gymGN4KE0U0Yt7+LRjNH5VWPIqPOJO/wyQAJ3Z8KzksmzuO6wLwUar6ZoDZMG87SXKvRgwoYFtBRgMisDjk21UboQDqFeUDUooxEvf0rLGUSNTXkr/fwh58DOM7LAFletWrMCYuJlO54IkMmsRWQaaxQRjdjHhkKhMPRUCPSE1o1QA4w0RSGIBQAuNzCb2TVZXHIKRqWWQ/NE1PrBSEdDgxqW8

Saci1hCpWLWoKzYpxSnqc4RCUoyjkbnAg8xBikWbGFfRZcopoCqxwxDZ6Hr3zgAFmSOngLuR8o5fLxI9lsueowlC8UZicmkWRHrXJExS3FzTExoPt0eiYx3RV2VXf6EmwmtHocBzcYWF7MgtMguhpjY0Dg2NidjHIhQaUiJQUdIbZMTtDtiBn1OqoLc4cId7bFHaAwsE7YnJidjA0IRi3lioO7YjfuOYZnbE+2MwrhJY0IBQkjj9HKeGLAL28e1i

v74XrFw0Q/UNdYIEya+dHUD6wT0EFZYOskjP1olBsmEZ9lwtAQYp3wW2ChImlPIQIVRhF+dssG/cNywfHQzvRGJiisF31W0QTsAErgSo5QsSXFEywaOYjQxONibbF42MqADbyNmwL9pd2gRCFQEN28ZgOKiJHcCyyAw0G2wF4qN5AjSqbmJe7rzYlignXdPfppWMRgcvfARGLDDxbG8UMPJgkAca4xGZxEEekAFCA6kZpWvBBozYQDzazIuXaGxA

p9urEMkN6sSlonzUYYBnLEIgN3cmEHCOo60C/DHoGPdMTNYyRREakTvS3SWqKjBxV5Sgq0w9BqgXNuJWpR/+EHN9GAcnTH4u+yEm6/vFOFyzNHW9lHAJCmzH5SHwPbyw4rJHGa2XiBZ+IngHO0MBmCpBHiRW6LLsV/sSWxf+xK4U5o45MBsiAVRFweDXYIHGi2XwoNHxFXikexpD7wOLxFh4zCoGKDiDIBoOJqIBg4sKgE1lsHFIZguQdPHb+xac

lCHGvgGIcYA4zxM5DiUqKUOIe7NQ4rlSUDjNbox8VV4ow4yH2CDiWHHIOPuEWIlNXEysBOHEvpjisgBAXhxvLA5RGCuwVERuzf4xuGC2jF71DYAGzIHgAHZt2iAGd3wIfmw7yae5kD7GlRCELmOsKlsFoDyWHK5QgsbMwtIxhHDr7G9KKTxJM2BiiVTJw+zQCPMEf39cf4lewMVEYWPbsdbYjiqIFMaHERMCu+hRaWSIiTib5LffQZstiAET8aTi

v5IZOKVsulQMOxF6Dq0FduW3lsoAOngtQA3tLNMLXoZL+TlOLmZB1hX7mf6gthd9C6hROsEVo2X+G61KGwhlhpXxGJzPcMMYUdQh3FcmTAGLpHicQ/jB3C9KdGBEOpodrYPfBLuiMyDPQ0GyB26Qeo9SQByp+6MmUe/Yjux8TiD8r2aXNeHDIWWQ2dBaaJBCBZID2QYWMOPwowjfdFX0RTbWQR/580yGNk0UUm4pbOBfNiixIC2KXsbYsaxSEq42

fh2KSseF1lJxSmDd9hB3OIbHvH9HxSL4g0Gqp/SXvkco5hhM9CPcFmy2YAGi8bXALIBmgA/AEWeoYY8chJ0Aqaa9VU4MTCYimeVXRQJhwmNJBmvrYQxPBRRDGX2IEEhIYxVRmJi2LY6ULVipEfC8oQvBjyEsSKMSHBvJ9UbdiyjFaGPQGrxaHv4zQAeABsyBMLvM7XNuMQk7cD85VMMVwY0z+07cOrH4uIAGkH1Xxx1oiLUEBON++PUAUIh3vCXi

5zF05en0YO+B4Tj99jrmIWiBeooBhb9jMLHrOJNiq1VFkA9EAmlCNAFqDCMfVr+SwQBXEW4CFcTF/BIxz7ch+Fy/xH4QOggiBV9iaJE12O0kdrYFG2Nw06Xi3sBLZGH6daaO4ImXEkmOwsT27UvBQPAajEIdzqMfYNctBY+ck27cD0zMT5bZgAUS8tqQ7uFjEa1/B/YlrjuXAYuNEuFoCfeG22pj4pAnxt0ZrY0fhzrjqJFrHzdcZM4+oALJCG/7

r8nZMHlrVmBRultpDcaxWcWoYtZxcTiHAZRHFDrlcYo4xbxiu+AfGPY4ecY1AAgAAUAjz4ErAOB8zlla0okOSYBl2414xtxiZO7yUGU0VpQIdxI7jyZKlqRlQs6WFVW07ibjGoMDuMfO4/nSS7iW+CjuOEYOO4p4C3xiLK4cUPP4TbQ8WBOhDZhrEADz6mnmaoAmGBJdz8uO4KhE9a1xZqoz1RspjsyPcHTQRXJNJjHDf2mMTfYpvM9QBvSHZhyt

wqefHPEIiB/0TqMNgoTq42JxnpiYyjkmLZMQ8xbeI1JjJTGYjT5Mes6WUxC7j2y6mlBFMV4xZDxHJjaGDcmLpMdKYzDxvKlcsQGcPBweRGT0oeHixTGoeJ5Meh40jxjJiKPE4SEKcZSgmGROI9/NBtkAWej8AD4B5rjxtH92F1MW+4lu65bD5kRMFF6/p445ExFMDLRFEuOgsURw8txzbDv9BUEXhkBFofXujVDILRAwBfsc24koxrbj4PHXMU3Q

KGYw6y94d90pacTkoMEPRAGXAM1RQUdVVRNGYwzxrVljPFiAFM8eZ4y/65y0AshIBAfgmpJEMxvpijPFvpR/YmZ45pSSAMrPFseKrQchI4tm25chuIoxEtgPGdNOCYjJ71Q76SRvBF3C1Ug9Uj5CbYUHpIkMH6iWMxG5BOT30jHfcU5yZr0wJgT3VUkWAYl1+00DxnG1H1rsSBQoOOmJxFnieGOf0q8uCDUxRjd8pW2Ib4VACZ7oePwdwQY6mt5L

PUVxWuwBZ6h3AFnqAe0OmAQmsR1B/QRvrgAQ308cDdeciJZn5yCrkEn8zgpHwGqaFPMXLRBWil5ikJBOLD/EqFyDKxXNcLRBdiSbgdzkUWxR+ixZHkdgWACigNBgOYtogBPuIE8Y8UZhIUCxFoJ1PEebFhAgyikniNbHSeIJkbJ49IxrrjdbHzJXqANpQ52BYgph1BnUMbLiJUGlx6xjxFGbGN08cG41/APFj3GJ8WMYsdOhQtCs6Fi0I4/lRLMl

hG2SqQ5ofH0WIIhPxYgtC9/4u0I7xEtkhWhSOuaPjuLE3MRh8UCxOHxG6cZ0IAjHx8ZeYd2umddifEKmIrQeeg9jxUlj0BrJKnaAFAAePaBcdqnGUVD7KLUFa80sAhvrYaWKdqK6Akl4QVQs7GqdH1gX2UQYknyJf9HuLy9FrkyNp00WtNz61R1RMQlXWyxZXiPSGKeOCobVQi8oZchljHGSKtSE5lU6EgbjfLGf2IE1prYSDYugJd2jP2gDHOnp

JlAgKQzcz0ShvQIOQG144YQ77EJWK4DklYxNYKVinFJzk1vMe2JJSQO3iGnIEQjysSXI7jQMfJCrEWh1M9Ml9EqxC8Bo/EjiSL/J2Q2gx4LifMGsMNmGovUbFA/kJWiAdGMu8RSVQGAfJgmL7KRki9N5o0lhYqjy/6FuNe8Wr4sQxoXDpXFd6MCcTVQqcBC/xDSrIWJpkfWgY3RpviP7EdUIjTIdYxax61idmILWK2sV7sXvxQ/jGfExuN0ngjQ5

5ecLdCAA/AHEFFpqXBR6OC+XE74WHUC3UViowpIsGiuKljDKbeFAxi0EO8DvoVq6LYRSmRoEwqDq2TFM8DMjfVG59irsEleKfoQBQ+/OpLja7FHUKnAZy9SmUuxV9Y6rUKyJFq4tAxTPhmvETmON5HgAeEAOxJpHia2HRyMhsYMcM7pSJR3sCzxJA4EK0sQgghCpkMboYlY+mxYb0E/Gl6RVOLaHDmx0gchAAYBIGwdzYlAJcDc0AlxyOZcmbRA7

x3Wj/JYooH0AOP2LSAygA1dF5+MacU5lZZUStjFlQq2LzXt9wgfG3ji/uFmb3zEbj3WCxeti6aFY31YqKqVCrB2GFA341JBD4ZZpG8+fyIIfGzWO9Ef7Yznmc/R9eJe2NbQq7Y5x0dti5AkO2L97kihEOxjRBO0h+2PpSPIEz2xmgTlAmp6OzUZdY3NRmei43FWHzhbin6fPYnpwPTjReOX8dumBdktlhaRqhKHToKjCK/czyISdrVBAppMaEVzY

agZDwTbflRloFUeteaXQF5Egbw18dXYr7xPmJcuZPrGHaBjUX+mariJVgU/QfVNB4/VRsHjmXG/+MuRuEIEFIld9IqheCFlkB9opk2UiwtRIDQie6G9AFd2M9iGEH3OMT8doFAgJaciSAn0GLx+rbdal8rGhL9FPuJvenvY3FssZBZz5rTlWfukpfSMKiC/3FV/2tMdz7eaB9QAP6G1UKYKO90B2RiQSoKI2pF0OKgYmDx3/ipAnm+JyCnFHAGKh

kUpsRGAAyPLekIaKEclKBZBwB3SpJApUm2o9XloXUGFkqOI6sCw21p4gAaKvTgJYr9RJQsMjhDQAlZkL5BGcpVk/xH9iIvIBOWE7ypHxs+4wsWX9qu4u6SM6URuyxA018gXJRWSzjpQo6ReXzApsEm9I2wSuTo21hhkilQLaSBwSKBEQgRNAlKPM4JmsoW6KXBIBAtcE0IAtwTt/xJIW1kj0cZ4JzqIx4BvBIXzH2I0bhXwTuxGrIV+CZsvHf8HH

NAQlnpT9zGNUAIUoISM/KXsMdChCEvUmUIS6iBPpVhCaYweEJoE1q6yt0N9EAhWQ4Jv0cMQmnBIBihcE88RVwSTpqEhMHAqCBEkJTwSsPgAgApCX9dakJusNvglG+QZCdb3f4JzITnLKshL/KCCE+oGYITGuq8hOUftG44IBsbi497O33zTrHAtmQ+nk4ABkYOJph9qaIx6LjC/5DaP2dvPQV0mghiVfFiuN4EojtN3hFVD/H7uuOpfK4Y8s0RPh

wzgNZ39fFGgMh4smDX7HLBN1cW246MG6A0m+QLAD7Pnn1HkuxvDeXFXWHewr1VQVxWbj03Bw43OLgjjfMGthix+FEyLW+vX42VxKzCZDEWuzmLqUJV5QpiM6XGBEEjNJ34vVxGYT/JYp+g7pDyGOFxtJYkaQvuKtcaWEvXasJdmcZJGO/Bo64ukhugi/KE2iKiCYE4xlhx1DW7hTH3jCb4+ZMYDjgkuFeWPB8WmEvTxkuMo3y5aXg7rYNSNx32sB

qEiwMaRoqQq9xypCt3qo8w1ISFcSAUtJZ9SGjhMzcb9bBs0bLIbyaoyl/4bR3ItxTrioLEfeLLcUuE2VxrbCpwGlCXHuhio/WOGMg4DBBoNZoWeOH/x0gTNSzu703cYcY94xuEMEYw1SQXcf4A0NxyESXjFbuLQiZZTDCJ/0kf1F2AIYHlCPFCJxxje3HoRJ44VhEuwBZeNbQlnoJCAUU40LxC2NEcyTwigUPQAOxxebCMcwUlVfceOE6dY4w50s

B64OkHmBYrxxf4S5wna2IA8TK425EPfwqCJDWMzICNYs40GUYs2haF208U14lYJ3fiNsxeeNmoBqtGMxJeDi0ESAG0ifpEheOgulBNGnoOE0cz4kLxHHji2b+Hk7wXmAGoqTxkeKj8kCIEMLwVfxpZi7Sq4Ei7dAIQEBY63wsaHWajHUJPI93A24IF5KncT/2N8CW+hThEK7Hr4LGcZEEngJ33iouFz1w+MLPbO56UypoAqpBPZ0dTZBCJqwSkPo

Z0E1dC8jUfAN7JJyAUYSXMbiqY2AdsZRHjtkG+6Fyba5xgBslvEJ/0VoiFmen48mgc9IINwmhoeYwvSc0Mk/GguIV0avYiFxGBD6gBkdFfAPDmeeOSz0JQb85XGNMIQO7xwdRWgz0VGo9htQ63Ra+t2Am5YKmMSMErSRFbiQeEzOOiUK3sfrQQLs6XE7gnmRAfAmwREgTBVBZRM0iQa6DHxvIiGLFQZxqwlETC8gQliw9AiWPBYhxYx1hXFjnHQX

RPwsVj4inxpjA9dBKfXuiaRYy9IoliIWKcWOosXkCd6JsPjronfRNr0L9EkixCDBHonsWJWYi9EkGJxgSzImpmMhkeYEh0JPFCfLbZGCfgNcyB54jkScGhDaD4MORbAcgGljDvwF5Hi+OZkOdRNm4MKrXyH4GNe8UGx9Jhi/BSX1EqMYhS/xXVi5mGGjliiff4yMJXvDq3G5siECQwOAXKc0F0olmUP+dvuEzIJSRD8oDr6OxVGNkS4q4lVvuh13

CgcFCAJuyz3RciHjnRCKPovQA23vjnVi++JaifKAtqJZ7YBu5eBFysULY/KxZYQQPSREwpHEl9JvS5ehmNilWMtidbE3vSXUT+iG0qJT/rzotbBkLjylYUAHsiZSNRdUw4TwO69VRCIht8Bn0sZpf5bsX14imEErF2GkjgBG4u2FDtEEoS+m0SGYCSNyEUbMErYIdI1zKiUcL1URlE+CJGkTMVENKU4jlPoVf+XJ0/vabWIAyLcrLAydLh6IAAdG

AUPnRTvi8hlEmJLwEr0J8E4pGJIE/Lbv8E7wr4jOnQ91lnUbB10yImQPcuJTOh4PjuTVeUmsdTPQl8BjdCJGRpCS3E+oiW1I+KCn4C3MNUQGigSnlSFCVHDIcseNcmSHRxoaDQgUZkjx1OPo5SN/EbwQBQMvlRFKiJeFAI6xAyLiWLoYpiZcTAjqVxOriWsdOuJmegG4lu4RG4brDXZe9RE24lbx3rAJ3EoIA3cSUkaLMCkcQTnWwyvohI6DDxJr

ifIZceJteh69CvxImXrPEwVaC8TpMbLxNAgKvE8Sa68Tg/LLb1bAjvEpYYSSMD4m9xLOIJ2pJfCZ8T6gYXxMWaFfE0msN8TagBVxJHibXE4JGj8SNEBNxKniW/ElRgH8SO4kzRV/iZUjPuJEHMB4kGUCHiXfE/OiY8S6EmQJMnidAkj9RfjBYEnzxLHgIvEpXQC/kkEkJcxQSeyEtBJOW8MEkmwG8ivCMbBJPcSh9xsMSrUmP4u0JE/jL+FT+J8t

kIAS3UmUR0dwFz3scTxE/nKA2hg4kxSkmtMzgLpY2EDnvEDaXEibEokLhAPC6/EKeJiWvUAGfh++D/RYUPEUif7ISkgznAXODdhPTCd3/WwoA/jNrEbvn78UUxQfxkSS8gQj+NiScjElTupgS0zFKmIzMZYEny2mgB6ID2kxYuDqAGWRi/irrA4NH8pCTgLw4HZ06An+yhFJJjeftWjASyGiDjm6aveoZ9CvBjbtyTtDxanMqSOJGyNSvFcxKp0b

XY8ARm0SIwD2WknILFPIiRJ9ILbG9gFOiXnEruxn8NsVRSLGypH4IdNAOp5ENBRCBvQKxUHsg2YAfwB/BjhBsfXOmxj0CfnHJ8jWWB3pGEQHMNebHJfTTsGzY6ds2ATW9IP10LkdnI4uRScideqmxPD8ebRZPxY2U0SHybzcUZHYgYCiNoYADkJEIAEVzUY+Y0THHFGJFX+Om0SUgXZJ2rFsAKWiSH1FaJyv81omKeIzvqDw1KwSWcpQ5js3/fio

IcZI4YM1IkGbTGSRUY4JCqgTD6L6BMdsYYE3bSot0cgQagXMMqJ3AOxtfdCUnoRJypr3AfzxVg9ADLSdz0CeoE0WgVKTCIk0pKRjKSkto4iRxsd7gyPT0WjE9MxFgTHQlwt3H7A3Atkgt5C8FEGWEO/Pm1fggFAokgH6ngZKqMYRoUXag2VZO1FrZBSsIeojOAhyKUS0ftmnQnKwbSTFf7zMOXkX1YhNCj3RC0q9o0MEDniDFYEYAspriBLD4ZIE

8WJiET79ZYmCYDqE5JJ+0RAagBIgnDCE5yeVqYYRsciNQ3O6CkE1ky57VGyFV6T2SUXI6omtyTFeprCHBgWGk65J1RMI8rHJP70sL1RN6sJCCUb92RjSbj+cNJCsNqgnN6WdKo2PDNJKYgs0kR2AeSZ8E2s8xY4Ggnryzx+pp7WBg/TAOGzDhKLCTbgDNoHxxuUHL/FvMLoCbowt3Mvwg/uMG/kMEtRBUkT6wkyRPtEXZaT7IdLV3QE7vxcVB5YV

9EMTiMgmOpMo8KEhBj8zYAJzgA72m3hYwCkxitFIkrHvjbmDlhXiB2AjNIGJbzXAgOHNdJ3cRbEoYeNButVhHdJnAjlrHt6BXSU97JDxlJjt4gnpKY8TyktPRjRizAkCpIxiVfwsJemwANoRaQHaIHZlfGJkv9bYSUymqMgGvEgQsMoi8gDrEEFFnY0tQDJU4gmj6yCLgYcYLqMVJE9ShPwn3vqk3whXZj4bEOWNwmBEIBiiFDwI6SquPEbklpYn

ug6hFglpBNTCXB4iWJ0VJwch7kHNbJ4ILAScDgkwmQgHCEAgOY6Q/1YIQbwbGFJGosQrutBNChDYAB3OgwTCec2/U6qA+iQqEK2EH0SQYjn+hpC2cYNM3BmGHGoNqD6RDKoIlQPsSbIhZ7FVyOW7vzY7xSgtjO3oZtgNaoKCH9RSmSpKAqZLfdFUEyNJp3d0AmBfQzbIL8fTJpGi4xIcan5EASjNsSWcjoYE5yNSgpGkvNJTmSrkkuZJuSUckvvS

37UwxD2ejaJkww3qJafj17E+W1yAAOAFcMoRiuC4sZg4MVRgYTx5c9ddanfAURCTEVchpyYa241+N59CS4rpJkYT6JGUGjhnvM8fJ65JwEglEZNvKIYIVPa6FiUwmZeCxSbjYk0iXblsjC1AFqAM8laPhMWTmjCWuOhMYX/GH+5R8KwkQmiuLiW4uTx/jiB0mKcgGidGEj4EYdIP7x+JN0EBoiAXk6htp0lBuMdSa1VX4AOoIeAAsgBapkOor8Mo

4TYjE+hNi/n5pIqh5btSqHbaMlcbWEoCG3MSK3FkyIEASPYQrOkaANmF0dSVekCQkWJQ6tUVG5xOxSdY9Ir+x4Tw3GnhJK/v1Q0/hvxiFSHDUNZ8f5LVoAxIBJABXcOQ+BmXY8mYjJeIlTngSycNkGlcZQEEZ7nx22bDR3aAeVfiLTHt6KAEc/QkARccTAnE2yNA8UyeZecrcUT3o7BmCSQeE5LEP88KIk9uLtsaMeA3YTcM7yqTuPJvnhE1CJXf

BcHyuANOiCcZehy5OTGcmURKpyaw+VnJbsR2ckS6wYiRZEpiJLPiI7FHeOU8IQAIQAEXQNVTiXiHUW1kl9xhnh+Ik8OCWdinMI+Q7gcHElmmNRyVrYlxJegiJ+HARJkievI1ZhhAxiuCGUOQGAHBPw4JOTIfFiblAkBuI5SgLoYbQK/0mBkqToTcS8YYbclviJuWA7k70oIACoIAu5OhjG7kgZi9uSPcBe5Ifor7kxJJOYDMMFvpNSSYKkzGJsw0

OAARLw0gM+BTUhSliUZi/3AnwN7jPtw5as6Gq6mI5ILfcXDCvRcFojKGkAdq5KRko5EtzdJ33GWarWgDywWMh0MnDNQiCUakwDxqtYYbTSO1aDJ8CKU+rf8XgrJwktyY6knLcuwhR6ifzCs1FdIFZU8DhqbFWcgu6Hj8AB2tFAbQSbmJ9WHHGDdGAWYVcilthfIIdeN08SASKPRqKUPMU1+HNYtixJADXmPSsRv7e8xWVjDPoFvTFrmKICtJVDd2

lox8JZAK0QCgAVWQ4OH5JJTyVV0bRIOT81UkaWLYVF5uU/x4JtVmz94LVST+zOjMBdiq0Z4tX9+PbgJFeP6D5f6HZLnfqzgzXxr9CPEkpKM2iT5NZm4Jf0zEbsmG6SJVkjFJSX4asmd2I6zt6EUnq2VIl6gOcif2Lu0bb4q0htlTXdHNmMU4f1AQCNkNCLPU1iTdAs8SkEl7nHz2LegczY55x0pwWfh22PmDhowNCERfIXYmHjynoSjAt5J4uSaM

hoIFNmOZAPjxZiTFlQa60SasF1QdoLaSbC5kkl9lu90Y+KGuTglpOJI7MWUdWvxt2D3ElwWP6UU/43OySCxJsnZWFD+OoYs58c2SzfFnRMrFPDmdBh1OkPcmxyXjDMSiftxcMlA8mDSUv/PYU7DxNhTnCnaJMYifaEkgBn6T2lrpqHoyPLATDQ084OHYAwGZQA/hNkgJZVgzh8kAaCGyTImhZDQa8ldKK4CT+PaApcFjIVHvakQUtRyWrxLkFTUz

NuTkdlnE0WJV6jnsm1ZMmMpmUApGI8ACiwcyWjkodZFg4pnDowBqiC6shceUUEtKS9tJfD1wrC54n2AHAReAabNFU5rdE8CQRQIrxErWQtUfgAVJhstlj4mxmJZmKUUkJA5RTWIiVFMDEKaMQeJt0TailMAHqKd4eLKKTRSN3zmeLCBu0UvWaXRTQmg9FO5yH0Uj5aVgBBinKt2FoCMUs0sYxT+gBtqL5CZMUxRAOrAz/xRyTmKdUUxYpECA6ikr

lkJiiaBZopmxShOLbFM6KTvkEjmvRSNt7lbxOKUWo0OA5xS8Em+mOC8TdYy9BghTPOpEJBMngdYLUx9+TFlQKKAf2KDbF6MYAYLEmVsk8rtV0dQop70+vLy9VusFFgEtQWRIYoZVo04zFyfD9gCRTr/GYZJjiX4/FdukYTlVEXZNWwIv8ejqG4SXIK5MgwEN42UwpXfjxklYFKIlFdIJBYysT1tQhCExyISolCUfyoswBdANBBkycZrRTGEd8lRv

UT/HuJA/JQEkWDhUFxPyQ4BeORqmTN2qM2PlAbdEizJf7Q2Cn+2I4KbofTCu3BTe4GQt0GIX9fdP+7S0Owb4TiC9MSAVehNup4zR0BKEZLWrZye2UAmFSuSlPvmoeLLB4ct2zF26J1yQuEtxJ+uThsn8AOCfvOsM4cB3I5siUHTEUfvIvcJlGTZ0kroF+ZnHnIiEnbFBm6MfVkQNgAFCgmEIzSC4CIuVnWBaAIVEEvNpJIW3GoseJ3m2xkGKZ6U1

qRhrJbJgDIp4xYzUBdoggwLaSyHEzUToom4hOFFCsyeZSlcCbYkJFGg4v4CUcBFQmXiEWoJNJBKyphM7OK9gUO2FHEH+IYeFRHyG2hTKeiHQOahpdHk4crxngNmU3MpamilwCGID1AshaEpgJZTqpJllNv6KOUu8qVZShWDyGSsYHWUr4UDZTTQLNlInKbWidspdYIgVJM6XI0T2UsfoyopNHGagUHKXiEk6aI5TCeZjlN6Ka2UyTuU5Sx4jRWSd

AnOUy/8s4c1t7LlPBTlmUnMpcdhuylblOC4qtdKGS+5SDQL/HiIhB2I+hAUSozymZ6AvKZ8KI0UUABGymDMBbKaSzE1gD5SjjxPlK7KZuUgspIYC4Vok8KTgF+U7UCw5SKyn/lIOKYBU/0uwFSZylgVNofIY4mouXhTdEmWQOvce0tNRAupsx4ajUFayQFrWzAuAx3SnusTfXn1TKS4UqxW8pZNyDCdYY6gaGWT3vHAPXd4aAI6IJ1QCmwm6UJc/

vZUB6wqHCFmoP2J7yl3k7KJsJTz0KotklAGDrJEpPLinD4SFKIGlqUbp+1SSdsBmf2QDsGEqtuGlSpXGaFNDKVwKR3Eo2S5YTKCBl0S7IlIKgeIAfCNeMxSUUUzApGBCYcgtDjcjsXoth2eDZIDRalAQFK5U4cGvmlDdp7ZON2hW7C+x6OTo4mY5NjiQqnBt0zldUuzWhBWCFXTRfhHphInHmVPMKdlpN7Jtj1qS6u7zK/l9kir+QuSrrEiaOVMR

h3dAaub4rYrE3Dw7jbqMYyjjiagoyVIbJBG0NvAXI8zsHfhORyX5ArXJxbiAIl+OM+8XFE6IJzujmSmlyCuoRBqeNi7tR9dG1VL5KQa6f4ScABJZgwZCPdP0xSKyJ1lvCpzSIKsmLHe3iB1SjqmGJhOqQIOdqy51TZpEAyJI/lXg8iMt1SJzjguigoILUDqyp+EQ6yvVKuqXwIoocAgiz3GDUL+yUqIsxxd1jTVGyTnU3hTCbnxzpTJCmNKxcqcp

BOPCLpklkSqHm7SZ1YsnRR2T7QF1hK0KXrYnvRqdDT/Guex/lnAJQeou1SXsm8sLTPMrQRMM8YEOCkyzQPKZ6IGGgRxlN2FywEdDPTUgQGhskDQLM1LCoKzUqUh7NS6akv4i5qYzUnmpeVAVqD81M8KcLk7wpk/iuz5wtyvydrgCRGkGxXaHIlKbqBG0Dme9KhaXj+Q0ccVVzOwcridIbLbO1WREfIa/cbUJhVgkrAHkYtkOg2p0J/ZZsxJxqRAU

jpJ9eTpInDZLCgQ3/LIkLRhWj7IpP8SbAYVOmoPj4yn+GIdSRZUj+2Vht28AXlCDkQ5yLDYoKRFnDaJBg2G2QKRYtahsVSaKNDkdooqceDbYzrzfQLQRhgjUKyorkl8mFvR/IC+Y4LJH6M+onmOJHPJEvPh0XxstdHy5JG+rSQeaCdoMw15aOTNWNSPT5RFfjFomqFMDKXmIrSp2OTZXHSGLgKbSECxkkRColD+/HrrmRk7OJYsTEykWVJgPNAzL

TibaRevTeyU0Sf0AKmSh6R0ZovBK5Ot4AkLG9KlvqlEBDOqdFZLqyLMxJ6mEIkPSDPU/lSGal56kIhKXqc6iFep6gC16mjKQeqfIAv6pzR4J9x71JO9MC8MXOyAsCqIL1JYCKRQO4IIiVL6lyBGvqRC6U6pT1Tt6nuIChKV1U9/uXblW5HPdGUAKYDfMxKJTplQRB0TuN5XCKGeLYM+pumEplhapTNovo8FshBaLZPL2sbG8p6lM0HUlJdIbSUwq

p9JSnDGRhIZgU/4/5I/6I/J5A+LadPl0YepBRTvLHRVI2cTlEuIgwikUHDdvGOpo90SSWWol+eQ7UzYyUcAacgeYBu3hbJN3MSmOHx46dTmVrEjhRRlnUstJEGAfHheBF1KSVBH1RcToHkmDk1QdCOTKKgG9St/Bb1M6ssrADyATyAC6kdE1CyZ7E/NOp+B6wCNAGJAAakesAvySvl44tScqWVwTzRICwRsjkEKaMO+DLGpEKTcrr/uNWidhkrh4

TsCg460vES6B7U6CGFu4Bf7XaKqyU9kgOpdVSttLQ+3exIRWC8ALeh4gR+IC4SSnADLyoYtUABlmU4AGfJYr2CytijiJNJuVlCrfogMvEva4tmSyaXmBGH2CRx8mkIIkKaXXE9JpmTTkRpS1I6qZZE6EpxTi8fqtciO5g7iKb4wAVfqY9czS6N8CBxpoT1E6IDaA8yg58VEpvwNI7JG2yW0aZUcCYNqRhSR3NlUpJYYhYmcdCziGdJImcYp4+YxG

P99TzEuzoIoHOa3klNTiikCg1yGpjkBTA0+M5Wq6HWuKGPwI5UgBNT1KANnyKKyZSRp1FljRCOh2sWPhZNOw2Yl+Za72Te7jXIrUyi48tTKj2UeaQmIZ5pSfJGLIZrGYsgC0/YQQLSuLJgQKMacbLExpGBDsACn4Dp4OSiZQANpFp5xI1JY5NDRapJBUBR1jZnQB8F+sathoBTsangFP6yYBEvi+y1Sk8ScQGNVp7jF6Mp2p+6kZyx0pGuSTyx2r

iKMkzpPHqUwZE3irnM44ATxGXErWKVwGiQ96AD/UOyYMsweiOJQJRSFbxk5af0AblpShlrYDjUD5aTMPAVpkNDPsRvhxd2DbAKUhHLSkOaAkilaXsRGVpKEVOgbS6AVafQiVRgIrTVWmNNMjyddY0Bp2eiFsZX3RG4lvAY7mkPcJUkolJayE/ZKIQYWI+gxV1M+MLUEfK89R1rMLpuHblvccGnk0Wjj85soA24ITiPw43otbanEtMfocQ02/xGa9

TsnNsM4gBlrUEKAakbjjslMRzpnLR6wbOjGGkJlNZadE0nKJ8Dg+yAdqEmvNXtfzK/cAtwGKokMSAEIRDQ09RkFae+ISToSjXeyLzT1TjgsmACDSdBJBHOc/4geUGVMmnUp5pDbTgWlNtKioMK01tpf8R22miwE7aagjY68FFlTrxgwJ7aQwU/68mgFlWlttKVQPTzU2iZ+T/r6X9WzJMJKSQAlRBeUZotKcqTGQfHE1STMZCjcligVakU0RTO8O

rGeNINpn2knxpxqSAKLpHy3cmnQLKkGLiJlamUjtNvs0mKpFhSxtomqBN2KVZGsUerTnrJd8BcZkgiVihzjoDCxJgR/aRg5OVpa9TgkZAdPdUZf+L9ptkAIOm9in/aQgkmDp7hY4OmmtJSSea0tJJQqSfLYkoEaADNcTcAPwB7Wmq1PqqhtlIVYEdI9lqNOO94LXIVQ0osQ6DpMTg8iTgBd3o89Apml4sEF4JScPVsY54on6EtJGcReZKuxjtShs

lcCiuClPJUPgmMgIKE1mkr6kT4dQqIyT7Ulj1NzaffrI0IXYA9e4o/AaCGosNH8jrwn9idXGGHPCATDQVA5a2mAGy7aZXI2P67XdJGm/NMXsgqZYxYUVB6AArD0dkrb9WuRqpksLAbUBPAJBIczpI9k7JZ9EItKQMQ13BQxDDvGtVRiEI2AA02381gikuBMFIKNkXou95Ragje8DfmDjIvpKhDT8qnQHzpKTaY+aBTuR8aLtOnN3L8CPtwcAh4YZ

oFI+rBgUlhphhV7cKaimXSZyBY/oVrJ9VBPAXXYqMpI2g8Spv4DA7w1GrPqUyBTGwIABHb2IPAeg3Viot0fYDKhKbYtrzd4pyTT2dYMfjIkG2ESfQ7iA+6zVwwCotiBWbaibYOUTVw1PiVL2GcOU29SukTnHlgBV07EJ3ERquny72u2vV0toWjXShIHNdNa6aJ8drpstBOunaiHXFMx+JnmmH83GbI8N4HIN0ieEw3SjvSNdPG6ZEPTra03Su4b3

sQISfN0hEOi3T+WiV0RtUGt08gGTpRVyBbdJ70FhNXbpPKBeJr60MO6TqxY7pfiYuulndK15rB/K7pCyA4xa3dM2YGxCUbpOcNf6Qq3Sm6R2IGbp73TMOn8pKjyR+k/RJsw0LdT6AFu8KI9blx4hSm6hI1PqceF0slqzmx9BCDIzISgS0myOrdTILHzhKSKRDPCMJkziNPBbuTC1IgpdOYmo5R1HvtIK6cBzI2Ah7i8V7i6G7AgoTdXQCgB8qC1Y

Q2jmfGeWybXUSwAS9JXcc5ZZWAaIFZelF6Hl6QXARXpSejdbIq9L34T9GeOIkvTAQla9KVYEKhPXpBvTY9HK9OfSSYE8yJTTSRclWRIByV25dP0YNBh6gDVOn7CEUptgD9x6ekLqW72FKsInMq7tWAnl2IDKRz0ySJN7SG8kNuk4gIT3Jt25jou1Z0tKqhCv49LAmbTHslEmKiaXtUysUThYTsyB8UScZpAWZi/RBbpJC0TnSNJ8U8AivFSwrmKT

GoNLQQ7sefT41KFqRZAkX0ySay7FS+mPpHL6fWASvpZiklAo19OuKSb084m9fSx+KF9LF0FUgu4IbfTeAAd9K76TgInTKtfSCeluPTzUeHYgExyuiLlBfAAChHvucExhndAFqozFNgl9YH8EBZ1lZGykAaSP+iK2orSQ7CHjvFkNO85DxcugJQ7KD2DZQCZqPOyRXiPx5ENLhsUl0gIh5Xj3XGcQBKwQLjVzY3tD344lqDpOKZQjPpU1jmGnStUu

Ri+pA74jsZliSk2MbLGCkb7oVW5F6jAIOukBhoWHIVzUDOn2G1ucbqU9NJ3zTB7I1j07EJZ06YQbNi/nFz2NM6St3YAAGqo6VwT2V3sgaUt2wrjx57J8gPc6XLDBdex2dBUhCiOyYCxQF90xrURCBhvFXaTaUy/qubBlN5wADZkHsAPMJ0OiUKrDGKv3NGZVYaA0pPZB9uEPVBi3SR00RT3akJQ3H+Gx0o7OJuTK9iaJGUBhG01Ix9tSb/EOGO0V

u/03npj2DhSaWcAgWMZSMH4oyZpqyi9NAGWqsY6Bm1MRyA7EmNbBEIdfkOv0/BAhAB3GLzRI9ovJAQoD3NJnafRZCzJXgRXnFY1jb4gYon/Kdv0noE72QYKaeQfeyUDdhoZq0EAkBqBAPQQKUe+kqMEDWJuPNn4prJmNjwNXrabO04Fp9YAcxA8DN8wZf1ZQAtt1LFyA2VsadT0+qqUgy7O667TowBNoC1UfldDLFdpN9YvF03GpN2DiZF+VJ81F

vLF0BoYQS0qQfQfBrocOMpu4T/anydOz6Wlwv66bZlHSy82RempnoU/6hiAUR4v0UaIHtZUyBkBsYR6MohBWud5JQy/HE5Pj/PBWoJ0UIL01klkPj50RYgZ8KXIGSqhVmjNBxdRNRiLOIZGjkOISMCYQP3WO0ocY0r8RPiJk0B6AQgs6EYNfJApU76ZeUo0UpjAx+L5UENtJSEnp8/iAphly2RmGbLoOYZeQ9OiKLDO8YCiOFYZE8pU8JGNyxRCh

eKsQ2wyWPi7DJhoPsM8BixNwAOgKj3RYHedc4ZniMK1LZlO29LcMk1aHAAHhlORSeGbOw14ZjWJHdCfDKdZN8M+kUV5SDmAAjP4rldsYEZ8HEeeZG9IhGU6BDY80IyViJbDzhGVteBEZawyprJbxlN8nsRdEZw21MRlhUGxGYcMvEZJwyL8ROHQuGdMHUkZNwyw9B3DOyAFSMous5gBnhkzwDpGTM0HwsjIykhlV9J+GfhUic47IzeKkQyPn6ejE

nwpJPT2lp5c1JqFJoUHWg2jyCgLyW/2AD1d3OvVUs8QbfCG0AcuB7Iu/iKSAlS0duvTEmqIC+tNXSxWxb0YCoyNp84SIDFcKNvaTh+dguOYp/cTpCk12k/YUReknT0HA0+zU8TE4x1wKcwedH8FM2cRAAIIQH5J9SrT1FyZE1o3vYPggh/aBVEHmrRkuRYS2AaDHPJMV0aQErty2ABJHIBtAmjKwY0jpN24A5A2HkkvoY9NM6dahHuoucGXwQs4R

zcbHTVkbajlAMU/0hLpNj4oCk89PjaZ64w5GZOBEAqxLluKCzA6DUo1YIQp5jMSPkUQb/xyxdPshT6IOacY0xZRMrUpNYhQBnIM1AQ5qvZAp6hN2XXGODkVQQuPVZuSLuiRMBmyQHRrYzBoKeQHAABTAP1AaUgqQBVoAxSNAAB5+UUAIyiUAQYANRQMz4FfYXaR1bmu5DkAEm4mQAqQAj8jXUTKoooA8EylUBITP0AOUzKlhmEzRoDYTKfPOCLfC

ZiEzJWkoTPsRGevViAGABtR6NAH+AAbIEiZObsyJm6oE0JCwWWwgHhJo0TKoAYmdhM8iZNIMuJmStIxbCsGPiZmQBT8CcrCEmQi3Q/qYkzFVYdCTTlmJM+yAJLoxJlATJEgGqmOkExUA1rE7sDEmdKoYgAykywaCqTORQBB0IYAYkztJlPwEIKEWgAyZPGiCJmStIkzq5gDFsQoAm8C1vE+AOSAPHwaABm4Cmrii/JwmItoINh7Jn/AHwALigZyZ

yW4KGxrDTpOGt5cYAEABCgi12n+6AwARIs1UBvAoSkBVwGJMgSZrSxU8QGTJxrMQAMnKXpASABUgFZYMr4dKZKs8ufDSqD1LOCYHKZD2BBsC0TMGtEWwetBPH0mKiawCqmbfQcvUSDsiQAC0A1ROVMuEAHzIupYWcGqmV1LeqZcUzzJlg8F1QCJM0CAdIxseBnGB0gA6AQqsHtAIpkq7zn8DzAP5YicAnYBT1g3gFkAKeswgADfQKQCnrPsMb4AX

UpXMBrTPxABtM/KZU0zMEhxTLz4oRgHc0G8AWeB5TI3gPtMpJQfqBoGCMAD4LP8AMyYDLIwgC2swGmebCe9kr4BDcDyDD+WGaAAwAnpRnplIyA7UVSBXkMdugEAB3TOCyBLgOKZa/gCpnOMwGAGiga0AF3BeFAMBEqgDKMUD2UUBJpnBAHomVjAYO2KoI9pnozIx5FjUCJeo0gnuxkQFOmevGZQAOMzcYCq1HrME4UDIA0DBOABS+B9aNQocqQaJ

BfkhZFA8gCAADyAQAA==
```
%%