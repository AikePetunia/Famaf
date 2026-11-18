# Probabilidad y Estadística — Parcial II (práctica G, CLAUDE ejercicios)

> **Práctica integral de Inferencia Estadística y Pruebas de Hipótesis:**
> Incluye los 4 casos fundamentales de **una muestra** y los 3 casos clásicos de **dos poblaciones**.
>
> **Pautas del examen:**
> - Los títulos no revelan qué distribución ni qué caso corresponde utilizar; es parte de cada ejercicio identificar el diseño, justificar el estadístico y enunciar los supuestos teóricos.
> - No se brindan las hipótesis formuladas: en cada caso debe plantear formalmente $H_0$ y $H_a$ a partir de la situación descrita.
> - Se ejercitan de punta a punta: regiones de rechazo, **P-valor**, cálculo de **Error de Tipo II ($\beta$)**, **intervalos de confianza** y conclusiones por **dualidad**.
>
> **Convención:** Coma decimal ($,$), valores de tablas con 4 decimales (o 3 según tabla habitual) y resultados finales con 4 decimales.

| 1a | 1b | 1c | 1d | 2a | 2b | 2c | 2d | 3a | 3b | 3c | 3d | 4a | 4b | 4c | 4d | 5a | 5b | 5c | 5d | 6a | 6b | 6c | 6d | 7a | 7b | 7c | 7d |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |

---

## ▶ 1. (1,5 puntos)

La resistencia a la rotura de un tipo de cable de acero sigue una distribución normal con media poblacional $\mu$ y desviación estándar conocida $\sigma = 20\text{ kg}$. El fabricante afirma que la resistencia media alcanza los $500\text{ kg}$. Una empresa compradora sospecha que la resistencia media real es menor a lo declarado y toma una muestra aleatoria de $n = 25$ cables para poner a prueba la afirmación con un nivel de significación $\alpha = 0{,}05$.

**a)** Identifique el caso que corresponde y plantee las hipótesis nula y alternativa adecuadas para contrastar la sospecha del comprador. Escriba el estadístico de prueba y determine el valor crítico en la escala de la media muestral, $\bar{x}_c$, de modo que la regla de decisión quede formulada como: *"Rechazar $H_0$ si $\bar{X} \le \bar{x}_c$"*.

**b)** Si la verdadera resistencia media de la partida de cables fuera $\mu' = 490\text{ kg}$:
- Calcule la probabilidad de cometer el **Error de Tipo II**, $\beta(490)$.
- Calcule la **potencia de la prueba** frente a dicha alternativa ($1 - \beta(490)$).
- Explique en palabras qué implicaría cometer un Error de Tipo II en este contexto comercial.


---

## ▶ 2. (1,5 puntos)

Un taller automotriz evalúa un dispositivo diseñado para reducir el consumo de combustible en ruta. Se instala el dispositivo en una muestra aleatoria de $n = 9$ vehículos idénticos, registrándose su consumo (en litros cada 100 km). Los estadísticos muestrales obtenidos fueron:
$$\bar{x} = 7{,}20\text{ L/100 km} \qquad \text{y} \qquad s = 0{,}60\text{ L/100 km}$$
Se asume que el consumo se distribuye normalmente con media $\mu$ y varianza desconocida. El consumo medio histórico de estos vehículos sin el dispositivo es de $7{,}60\text{ L/100 km}$. Se desea determinar al nivel $\alpha = 0{,}05$ si existe evidencia de que el dispositivo reduce significativamente el consumo medio.

**a)** Identifique el caso correspondiente y formule las hipótesis nula y alternativa. Defina el estadístico de prueba y justifique qué distribución teórica tiene bajo $H_0$, indicando claramente sus parámetros o grados de libertad.

**b)** Establezca la región de rechazo de la prueba con el valor crítico de la tabla correspondiente. Calcule el valor observado del estadístico y tome una decisión formal en el contexto del problema.

**c)** A partir de los valores tabulados de la distribución correspondiente, acote entre qué dos valores se encuentra el **P-valor** de la prueba y verifique que la decisión adoptada sea consistente con dicha cota.

**d)** Construya un intervalo de confianza bilateral del 95 % para el consumo medio poblacional $\mu$. Verifique si el valor histórico $7{,}60$ queda o no contenido dentro del intervalo y explique la conclusión por dualidad.

---

## ▶ 3. (1,5 puntos)

En una planta farmacéutica, el proceso de llenado de cápsulas exige que la variabilidad en el peso del principio activo se mantenga en el estándar histórico de referencia de $4\text{ mg}^2$. Se toma una muestra aleatoria de $n = 11$ cápsulas y se obtiene una varianza muestral de:
$$s^2 = 8{,}0\text{ mg}^2$$
Se asume que el peso del principio activo sigue una distribución normal con media $\mu$ y varianza $\sigma^2$. El control de calidad desea evaluar si la varianza del proceso difiere significativamente del estándar de $4\text{ mg}^2$ utilizando un nivel de significación $\alpha = 0{,}05$.

**a)** Identifique el caso correspondiente y enuncie las hipótesis nula y alternativa. Escriba el estadístico de prueba y justifique qué distribución sigue bajo la hipótesis nula, señalando sus grados de libertad.

**b)** Determine los valores críticos en la tabla correspondiente para el ensayo bilateral, defina la región de rechazo, calcule el estadístico observado y tome una decisión sobre la hipótesis nula.

**c)** Construya un intervalo de confianza del 95 % para la varianza poblacional $\sigma^2$, y a partir de él obtenga el intervalo de confianza del 95 % para la desviación estándar poblacional $\sigma$.

**d)** Aplique el principio de dualidad: verifique si el valor propuesto en la hipótesis nula pertenece al intervalo de confianza hallado en **c)** y explique por qué la decisión del test y la del intervalo son equivalentes.

---

## ▶ 4. (1,5 puntos)

Una empresa de software afirma en su publicidad que a lo sumo el 10 % de los usuarios que instalan su nueva versión experimenta inconvenientes técnicos. Una consultora auditora sospecha que el porcentaje real de usuarios afectados es superior a lo declarado. Para comprobarlo, encuesta a una muestra aleatoria de $n = 100$ usuarios independientes y observa que $16$ de ellos manifestaron haber tenido problemas técnicos.

Se fija un nivel de significación $\alpha = 0{,}05$.

**a)** Identifique el caso correspondiente y plantee las hipótesis nula y alternativa. Defina el estadístico de prueba y determine el valor crítico en la escala de proporciones, $p_c$, de modo que la regla de decisión sea: *"Rechazar $H_0$ si $\hat{p} \ge p_c$"*.

**b)** Calcule el valor observado del estadístico y obtenga el **P-valor** exacto. Tome una decisión respecto de la afirmación de la empresa de software.

**c)** Construya un intervalo de confianza bilateral del 95 % para la proporción poblacional verdadera $p$.

**d)** Si la verdadera proporción de usuarios afectados fuera en realidad $p' = 0{,}18$:
- Calcule la probabilidad de cometer el **Error de Tipo II**, $\beta(0{,}18)$, aplicando la regla de decisión obtenida en **a)**.
- Calcule la **potencia de la prueba** ($1 - \beta(0{,}18)$) frente a dicha alternativa.

---

## ▶ 5. (1,5 puntos)

Para evaluar si un programa de capacitación intensivo reduce el tiempo de resolución de reclamos en un centro de atención telefónica, se toma una muestra de $n = 10$ operadores y se registra el tiempo promedio (en minutos) que tarda cada uno en resolver reclamos similares **antes** ($X$) y **después** ($Y$) de completar la capacitación.

Para cada operador $i$ se calcula la diferencia $d_i = x_i - y_i$ (tiempo antes menos tiempo después), obteniéndose los siguientes estadísticos muestrales:
$$\bar{d} = 3{,}20\text{ minutos} \qquad \text{y} \qquad s_d = 2{,}00\text{ minutos}$$
Se asume que las diferencias se distribuyen de forma aproximadamente normal. Se desea probar al nivel $\alpha = 0{,}05$ si la capacitación reduce significativamente el tiempo medio de atención.

**a)** Identifique el tipo de diseño muestral (explique por qué corresponde a este esquema y no a dos muestras independientes) y plantee las hipótesis nula y alternativa pertinentes para el parámetro adecuado.

**b)** Defina el estadístico de prueba, justifique su distribución teórica bajo la hipótesis nula indicando sus grados de libertad, calcule el valor observado y determine la región de rechazo para tomar una decisión.

**c)** A partir de los valores tabulados de la distribución teórica, acote entre qué dos valores se encuentra el **P-valor** de la prueba.

**d)** Construya un intervalo de confianza del 95 % para la diferencia media poblacional $\mu_d$. Utilice el intervalo para concluir si el programa resulta efectivo según si el valor $0$ pertenece o no al mismo.

---

## ▶ 6. (1,5 puntos)

Un laboratorio de materiales analiza dos métodos de secado de madera: el **Método 1** (horno convencional) y el **Método 2** (cámara de vacío acelerada). Se mide el porcentaje final de humedad en tablas de pino tratadas con cada método. Se asume que ambas poblaciones siguen distribuciones normales y que poseen **la misma varianza poblacional** ($\sigma_1^2 = \sigma_2^2$).

Se obtuvieron los siguientes resultados a partir de dos muestras independientes:
- **Método 1:** $n_1 = 12$ tablas, $\bar{x}_1 = 9{,}50 \%$, $s_1 = 1{,}20 \%$
- **Método 2:** $n_2 = 10$ tablas, $\bar{x}_2 = 8{,}30 \%$, $s_2 = 1{,}00 \%$

Se desea contrastar al nivel $\alpha = 0{,}05$ si existe una diferencia estadísticamente significativa entre el contenido medio de humedad que dejan ambos métodos de secado.

**a)** Identifique el caso de inferencia que corresponde y formule las hipótesis nula y alternativa adecuadas para $\mu_1 - \mu_2$.

**b)** Calcule la estimación de la varianza muestral agrupada (ponderada) $s_p^2$ y halle el error estándar estimado de la diferencia de medias muestrales ($SE = s_p \sqrt{1/n_1 + 1/n_2}$).

**c)** Defina el estadístico de prueba, justifique su distribución teórica bajo $H_0$ con sus grados de libertad, calcule el valor observado $t_{obs}$, determine la región de rechazo y concluya en el contexto del problema.

**d)** Acote el **P-valor** de la prueba bilateral y construya un intervalo de confianza del 95 % para la diferencia media verdadera $\mu_1 - \mu_2$, verificando si el intervalo avala la decisión tomada en **c)**.

---

## ▶ 7. (1 punto)

Un ensayo clínico compara la efectividad de dos analgésicos distintos, el **Fármaco A** y el **Fármaco B**, para aliviar episodios de migraña aguda dentro de la primera hora posterior a su administración. Se administró cada fármaco a dos grupos de pacientes seleccionados de forma completamente independiente:
- **Fármaco A:** de $n_1 = 100$ pacientes tratados, $x_1 = 70$ reportaron alivio completo dentro de la hora.
- **Fármaco B:** de $n_2 = 100$ pacientes tratados, $x_2 = 52$ reportaron alivio completo dentro de la hora.

Se desea comprobar al nivel $\alpha = 0{,}05$ si la proporción poblacional de pacientes aliviados con el Fármaco A es significativamente mayor que con el Fármaco B.

**a)** Identifique el caso de inferencia y plantee las hipótesis nula y alternativa para $p_1 - p_2$.

**b)** Calcule la proporción muestral combinada (agrupada) $\hat{p}$ y determine el error estándar del estadístico bajo la hipótesis nula ($SE_0 = \sqrt{\hat{p}(1-\hat{p})(1/n_1 + 1/n_2)}$).

**c)** Defina el estadístico de prueba, calcule el valor observado del estadístico, obtenga el **P-valor** exacto y concluya respecto a si existe evidencia suficiente para afirmar que el Fármaco A es más efectivo.

**d)** Construya un intervalo de confianza bilateral del 95 % para la diferencia de proporciones $p_1 - p_2$ (utilizando los errores estándar de cada muestra) y verifique si el intervalo confirma la superioridad del Fármaco A.
