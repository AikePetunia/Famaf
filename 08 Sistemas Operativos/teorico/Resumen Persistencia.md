---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
Práctica: fórmulas y mapa de ejercicios ^ayRNtlUw

Las cuentas que se repiten en práctico 4, parciales 2 y finales, con un ejemplo resuelto de cada tipo. Los resultados numéricos están verificados
contra las respuestas oficiales de los parciales; las respuestas a preguntas teóricas y V/F del práctico 4 que aparecen en las otras columnas son
PROPUESTAS (no hay clave oficial) ^yYGY5aM9

1. Disco: tiempo y tasa de I/O (cap. 37) ^5gJ2yKS7

T_rot (una vuelta)  = 60000 / RPM            [ms]
T_I/O               = T_seek + T_rot/2 + size / T_max
R_I/O               = size / T_I/O
MiB por pista       = T_max * T_rot    (leer una pista entera = una vuelta, sin seek) ^Tjr3Sxi7

Práctico 4 ej. 1 (Seagate Exos 7E8: 7200 RPM, 4.16 ms, 215 MiB/s) ^88OaYgxB

(a) T_rot = 60000 / 7200 = 8.333 ms por vuelta.
(b) Lectura al azar de 4 KiB: T_I/O = 4.16 + 4.167 + 4 KiB / (215·1024 KiB/s) = 4.16 + 4.167 + 0.018 = 8.345 ms → R_I/O = 4 KiB / 8.345 ms ≈ 479.34 KiB/s.
Moraleja (Tabla 37.2): al azar el disco rinde ~0.2% de su tasa máxima; secuencial, casi el 100%. ^CFtHTF9a

Final feb-2021 ej. 5 (Pepito: 4500 RPM, 6.5 ms, 80 MiB/s) ^1hYRrUGc

T_rot = 13.333 ms. Al azar con bloques de 8 MiB: T = 6.5 + 6.667 + 100 ms = 113.17 ms → ≈ 70.7 MiB/s (con bloques grandes se amortiza el posicionamiento).
MiB por pista = 80 MiB/s · 13.333 ms ≈ 1.067 MiB. ^6nvU4YN0

Aparece en (práctico / parciales / finales) ^aiwzom3n

Práctico 4 ej. 1. Parcial 2 2020 preg. 14–15 (comparar dos discos, secuencial vs. al azar); Parcial 2 2021 preg. 8 (tres discos al azar con 128 KiB); Parcial 2 2022 ej.
4 (MiB por pista: Exos ≈ 2.15 MiB); Parcial 2 2023 ej. 4 (R_I/O y relación precio: 380.28 / 315.33 / 474.20 KiB/s); Parcial 2 2025 ej. 6 (ordenar discos por R_I/O).
Finales feb-2021, jul-2021, dic-07-2021, feb-2022, feb-2024 (siempre el mismo ejercicio de disco con otros números). ^F6ohBss6

Unidades ^3dYBmw02

Cuidá KiB vs KB y MiB vs MB: en Parcial 2 2025 el diskette da 17.39 o 17.53 KiB/s según cómo se lean las unidades. Pasá todo a ms y KiB antes de dividir.
T_rot/2 es la latencia rotacional PROMEDIO (media vuelta). ^a85jqrdJ

2. Tamaño máximo de archivo con inodo multinivel (cap. 40) ^xSI1mo4O

P = punteros por bloque = tamaño de bloque / tamaño del puntero
max = (D + I*P + DI*P˄2 + TI*P˄3) * bloque
overhead (archivo de tamaño máximo) = bloques de punteros * bloque
     = (I + DI*(1 + P) + TI*(1 + P + P˄2)) * bloque
D, I, DI, TI = cantidad de punteros directos, indirectos, doble y triple indirectos ^uBX9f9wc

Parcial 2 2020 preg. 16–17: 12 directos + 12 indirectos, 4 KiB, 32 bits ^kzvqlITp

P = 4096 / 4 = 1024. max = (12 + 12·1024) · 4 KiB = 12300 · 4 KiB = 49200 KiB. Overhead = 12 bloques de punteros · 4 KiB = 48 KiB. ^NhubJvOM

Parcial 2 2021 preg. 13–14: 4 directos + 2 indirectos + 2 doble indirectos, 4 KiB, 32 bits ^aMmKmOHk

max = (4 + 2·1024 + 2·1024²) · 4 KiB = 8200 MiB + 24 KiB ≈ 8200 MiB. Overhead = (2 + 2·(1 + 1024)) · 4 KiB = 2052 · 4 KiB = 8208 KiB. La clave del quiz dice
8200 = 2050 bloques: deja afuera 2 bloques de punteros (cuenta sólo los 2·1024 bloques de segundo nivel más 2). En tu intento pusiste 8208 y lo tomó como
correcto (tiene tolerancia); la cuenta completa es 8208. ^PoONRHUF

Parcial 2 2022 ej. 5 / 2023 ej. 5: bloques de 1 KiB y punteros de 24 bits (8 directos, 8 indirectos, 8 doble indirectos) ^EAU76923

P = floor(1024 / 3) = 341 (sobran bytes). Los directos cubren 8 KiB; los indirectos llegan hasta 8 + 8·341 = 2736 KiB; los doble indirectos hasta 2736 +
8·341² = 932984 KiB. Esos son los "puntos de transición" que piden. ^JSfRWeQL

xv6 (Práctico 4 ej. 3, 4 y 6): bloque 512 B, 12 directos + 1 indirecto, 32 bits ^IqtSN0oX

P = 128. max = (12 + 128) · 512 = 71680 B; overhead = 1 bloque indirecto (512 B).
Byte b → índice lógico k = floor(b / 512): si k < 12 es el directo k; si no, la entrada k − 12 del bloque indirecto. Byte 451 → directo 0; byte 6200 → k = 12
→ indirecto, entrada 0; byte 71000 → k = 138 → indirecto, entrada 126.
Ej. 6: 6000 B ocupan ceil(6000/512) = 12 bloques → sólo directos; al agregar 1000 B (7000 B → 14 bloques) hay que crear el bloque indirecto y 2 bloques de
datos. ^HqxqUVVj

Práctico 4 ej. 5 (16 TiB, 4 KiB, 32 bits, 8 directos + simple, doble y triple) ^RNAOxxb5

P = 1024. max = (8 + 1024 + 1024² + 1024³) · 4 KiB ≈ 4 TiB + 4 GiB + 4 MiB + 32 KiB. Es menor que el disco (16 TiB) y los números de bloque de 32 bits
alcanzan (2³² · 4 KiB = 16 TiB), así que el límite lo pone el inodo. ^wgZeWNz9

Final feb-2021 ej. 6 (262144 inodos, 512 MiB de datos, 4 KiB, inodo de 128 B) ^2qHJYmJE

(a) i-bitmap = 262144 bits = 32 KiB; d-bitmap = 512 MiB / 4 KiB = 131072 bits = 16 KiB.
(b) Tabla de inodos = 262144 · 128 B = 32 MiB.
(c) Sí: creando 262144 archivos vacíos se agotan los inodos sin escribir un byte de datos (mismo concepto que Práctico 4 ej. 16e).
(d) 12 directos + 1 indirecto cubren (12 + 1024) · 4 KiB = 4144 KiB: a partir de ahí se usan los doble indirectos. ^kJPJ8hU7

Aparece en (práctico / parciales / finales) ^WhA2dISr

Práctico 4 ej. 3–6. Parcial 2 2020 preg. 16–17; 2021 preg. 13–14; 2022 ej. 5; 2023 ej. 5. Finales feb-2021 ej. 6, jul-2021, dic-07-2021, feb-2022, dic-2023 ej. 6,
feb-2024. ^Fnhebj69

3. Recorrido de paths: cuántos bloques se leen (cap. 40 §40.6) ^OkLeyiW3

Con caché vacío, superbloque ya en memoria y cada inodo / directorio / archivo en un bloque: por cada componente del path se lee su INODO y sus DATOS,
empezando por el inodo de la raíz. Total = 2 · (cantidad de componentes, contando la raíz). ^yK6uvLEr

Path                                 │ Lecturas                                      │ Dónde
─────────────────────────────────────┼───────────────────────────────────────────────┼────────────────────────
/initrd.img                          │ 4 (inodo /, datos /, inodo initrd.img, datos) │ Práctico 4 ej. 9a
/usr/games/moon-buggy                │ 8                                             │ Práctico 4 ej. 9b
/etc/X11/xorg.conf                   │ 8                                             │ Parcial 2 2020 preg. 10
/lib/modules/.../crypto/ (6 niveles) │ 12                                            │ Parcial 2 2021 preg. 9 ^YvPWhnja

Crear /foo/bar y escribir (Tabla 40.4; final dic-2023 ej. 5) ^AydHiZKC

create: leer inodo /, datos /, inodo foo, datos foo; leer y escribir i-bitmap; escribir datos de foo (la nueva entrada); leer y escribir inodo de bar
(inicializarlo); escribir inodo de foo (tiempos, tamaño) → 10 I/O.
Cada write() que asigna un bloque: leer inodo bar, leer y escribir d-bitmap, escribir el bloque, escribir inodo bar → 5 I/O. ^aSRnJJyM

4. Consistencia: bitmaps vs inodos (cap. 42 §42.2) ^aP2WcbFt

Práctico 4 ej. 8: tabla "en uso" vs "libre" ^j3Tsf4kI

Los 4 casos por bloque: (1,0) usado y no libre → OK; (0,1) → OK; (0,0) ni usado ni libre → bloque PERDIDO (space leak): poco grave, se marca libre; (1,1)
usado y libre a la vez → GRAVE: se podría asignar a otro archivo y dos archivos compartirían el bloque; se corrige marcándolo ocupado.
En la tabla: los bloques 1 y 6 están perdidos (0,0) y el bloque 5 está usado y libre (1,1). ^TMKS5N2Q

Parcial 2 2025 ej. 5: reconstruir el d-bitmap desde los inodos ^Zh3OtLLU

Se recorren los inodos ASIGNADOS (en el ejercicio: 0, 2, 4 y 7) y se marcan sus bloques; cada archivo usa ceil(size / 512) bloques. Resultado:
00001111111111111110111111110000. Es lo mismo que hace fsck y lo que pide Práctico 4 ej. 7: el bitmap se reconstruye recorriendo todos los inodos y sus
bloques indirectos. ^Gu1fTeKh

Aparece en (práctico / parciales / finales) ^QrZicOMk

Práctico 4 ej. 7, 8, 11, 12, 17. Parcial 2 2020 preg. 11–13 y 2021 preg. 10–12 (inconsistencias en el tamaño: inodos 1 y 3; en el i-bitmap: 4 y 5; en nlink: inodo 0);
Parcial 2 2025 ej. 5. Finales sin fecha 1 ej. 7–9 (FAT corrupta, reconstruir bitmaps), dic-22-2021 (archivos inmediatos). ^rztUSBZo

Mapa: tipo de ejercicio → capítulo ^jpTsdQLb

Tipo                                                                    │ Capítulo
────────────────────────────────────────────────────────────────────────┼──────────────────────────
Disco: T_I/O, R_I/O, MiB por pista, comparar discos                     │ 37 §37.4
Tamaño máximo / overhead / bloque de un byte                            │ 40 §40.3
Tamaño de bitmaps y tabla de inodos                                     │ 40 §40.2, §40.5
Lecturas al recorrer un path; crear archivo                             │ 40 §40.6
Tamaño de la FAT                                                        │ 40 (aside) + recuadro FAT
fsck, inconsistencias, recuperar bitmaps                                │ 42 §42.1–42.2
Journaling vs log-structured                                            │ 42 §42.3 y 43
Hard links, link count, directorios                                     │ 39 §39.13 y 40
Capas del FS; polling, interrupciones, DMA                              │ 36
RAID (no apareció en los parciales recientes, pero está en el programa) │ 38
Extents, archivos inmediatos, bitmap de inodos                          │ 40 (asides) y 41 ^PX6DJOf7

Cap. 36 — Dispositivos de I/O ^hny9CnCE

OSTEP cap. 36 "I/O Devices" — cómo habla el SO con el hardware ^F25FZ9aG

Introducción y crux ^sKQmDYRU

Un programa sin entrada (produce siempre lo mismo) ni salida (¿para qué corre?) no tiene mucho sentido: la entrada/salida es fundamental. La pregunta
es cómo integrarla en los sistemas. ^ebVVEZWV

Crux: ¿cómo integrar los dispositivos de I/O? ^vWd3jl0m

¿Cómo integrar la I/O en los sistemas? ¿Cuáles son los mecanismos generales? ¿Cómo hacerlo de manera eficiente? ^BXfXkP24

§36.1 — Arquitectura del sistema ^F4cymDv7

La CPU y la memoria se conectan por el BUS DE MEMORIA (el más rápido); algunos dispositivos (ej.: placa de video) van por un bus de I/O de propósito
general (PCI); los más lentos (discos, mouse, teclado) por un BUS PERIFÉRICO (SCSI, SATA, USB). ¿Por qué una jerarquía? Por FÍSICA y COSTO: cuanto más
rápido es un bus, más corto tiene que ser, y un bus de memoria de alto rendimiento no tiene lugar para enchufar muchos dispositivos; los componentes
de alto rendimiento van cerca de la CPU y los de menor rendimiento más lejos. ^GzhhuhlV

§36.2 — Un dispositivo canónico ^ISVcIzuE

Tiene dos partes. (1) La INTERFAZ de hardware que presenta al resto del sistema, para que el software lo controle. (2) La ESTRUCTURA INTERNA,
específica de cada implementación: un dispositivo simple tiene unos pocos chips; uno complejo tiene una CPU simple, memoria y FIRMWARE (software
dentro del dispositivo; ej.: una controladora RAID tiene cientos de miles de líneas de firmware). La interfaz canónica tiene tres REGISTROS: STATUS
(estado actual del dispositivo), COMMAND (qué tarea hacer) y DATA (para pasar datos desde/hacia el dispositivo). ^4FBTtUZw

§36.3 — El protocolo canónico ^GSdDxOkV

While (STATUS == BUSY)
    ;   // esperar a que el dispositivo no esté ocupado (polling)
Write data to DATA register
Write command to COMMAND register
    (arranca el dispositivo, que ejecuta el comando)
While (STATUS == BUSY)
    ;   // esperar a que termine con el pedido ^TH1J1lXS

Cuatro pasos: (1) el SO espera a que el dispositivo esté listo leyendo repetidamente el status (POLLING, "sondear"); (2) manda datos al registro data
(si la CPU mueve los datos es PROGRAMMED I/O, PIO); (3) escribe un comando, lo que implícitamente le avisa al dispositivo que hay datos y comando; (4)
espera, otra vez con polling, a que termine (y ve si hubo error). Es simple y anda, pero es INEFICIENTE: el polling desperdicia tiempo de CPU que
podría usar otro proceso. ^PO2uquKp

§36.4 — Menos overhead de CPU con interrupciones ^Dfuxm8KT

En vez de sondear, el SO emite el pedido, pone a DORMIR al proceso que lo pidió y hace un context switch a otro. Cuando el dispositivo termina,
levanta una INTERRUPCIÓN de hardware: la CPU salta a una rutina del SO (INTERRUPT SERVICE ROUTINE, ISR, o interrupt handler) que termina el pedido
(ej.: lee los datos y un código de error) y despierta al proceso que esperaba. Así se SOLAPAN cómputo e I/O. ^0Mvzhw2x

Tip: las interrupciones no siempre son mejores que el PIO ^0WuCvykH

Si el dispositivo es RÁPIDO, conviene hacer polling: la primera consulta probablemente ya lo encuentra listo, y una interrupción cuesta un context switch y
el manejo. Si no se sabe, un enfoque HÍBRIDO: sondear un rato y, si no terminó, usar interrupciones (two-phased). En redes, si llegan muchos paquetes las
interrupciones pueden producir LIVELOCK (el SO sólo atiende interrupciones y nunca deja correr procesos de usuario): conviene polling a veces. Otra
optimización: COALESCING, el dispositivo espera un poco antes de interrumpir para juntar varias finalizaciones en una sola interrupción (a costa de
latencia). ^zD4HGMeE

§36.5 — Movimiento de datos eficiente con DMA ^cws6wyQt

Con PIO, para transferir un bloque grande la CPU pierde mucho tiempo copiando palabra por palabra al dispositivo. Solución: DMA (Direct Memory
Access), un dispositivo del sistema que orquesta transferencias entre dispositivos y memoria SIN intervención de la CPU. El SO programa el DMA
diciéndole dónde están los datos en memoria, cuántos copiar y a qué dispositivo; luego la CPU queda libre. Cuando el DMA termina, levanta una
interrupción. ^yOGlhbza

Práctico 4 ej. 16a (V/F): "la I/O por interrupciones y el DMA liberan a la CPU de hacer polling" ^kYaijOyU

Respuesta propuesta: VERDADERO: con interrupciones la CPU no sondea el status (se entera por la interrupción) y con DMA además no copia los datos. Ojo: el enunciado dice
"programada (por interrupciones)"; PIO estricto (polling + copia por CPU) no libera a la CPU. ^xp14D6ve

§36.6 — Métodos de interacción con el dispositivo ^tk9GyvYL

• INSTRUCCIONES DE I/O explícitas (ej.: in y out en x86): se especifica un PUERTO de I/O que nombra al dispositivo. Son instrucciones PRIVILEGIADAS:
  sólo el SO puede comunicarse directamente con los dispositivos.
• I/O MAPEADA A MEMORIA (memory-mapped I/O): el hardware hace que los registros del dispositivo aparezcan como direcciones de memoria; el SO usa load
  y store comunes y el hardware los rutea al dispositivo en vez de a la memoria.
• Ninguno tiene una gran ventaja sobre el otro; ambos se siguen usando. ^YyFikeU1

Aparece en (práctico / parciales / finales) ^ZKbJ1KYJ

Práctico 4 ej. 16d (V/F): "los dispositivos de I/O se dividen en I/O mapped y memory mapped" → respuesta propuesta: FALSO: son dos MÉTODOS de interacción (cómo el SO
accede a los registros), no una clasificación de los dispositivos. ^8Rxfokdl

§36.7 — Encajar en el SO: el device driver ^gNrrxtam

¿Cómo mantener el SO independiente de cada dispositivo (un FS que funcione sobre SCSI, IDE, USB...)? Con ABSTRACCIÓN: en el nivel más bajo, una pieza
de software del SO, el DEVICE DRIVER, conoce en detalle cómo funciona el dispositivo; todo lo demás queda encapsulado ahí. El FS no sabe qué disco
usa: emite pedidos de lectura y escritura de BLOQUES a la capa genérica de bloques, que los rutea al driver adecuado. ^LbRx6nIQ

Aplicación (proceso de usuario) ^VdJUfwUV

API POSIX: open, read, write, close, ... ^UYMWxgmO

Sistema de archivos (ext4, FAT, ...) — modo kernel ^5Zy5Mt31

Interfaz genérica de bloques (block read/write) ^ZUWnqqbh

Capa genérica de bloques (scheduling de I/O) ^Jj6gVVO2

Device driver (SCSI, ATA, IDE, ...) ^IjCLjb46

Dispositivo (disco) ^S4Zyouew

modo usuario ^JYXzhBuu

modo kernel ^NXDY5hdU

acceso "raw" (fsck, bases
de datos) entra acá ^jCVo4tAC

Figura 36.3 (simplificada): el stack del sistema de archivos ^od7a0hhu

Desventaja: si un dispositivo tiene capacidades especiales, pero debe presentar una interfaz genérica, esas capacidades quedan sin usar (ej.: reporte
de errores rico de SCSI que ATA/IDE no tiene). Como hace falta un driver para cada dispositivo que se enchufe, los drivers son una parte enorme del
kernel (más del 70% del código de Linux) y son la fuente principal de bugs y caídas. ^GA9ixXFN

Aparece en (práctico / parciales / finales) ^cv37URMO

Práctico 4 ej. 15 y final sin fecha 2 ej. 10 ("tres capas del FS"), respuesta propuesta: (1) la API / interfaz de llamadas al sistema (open, read, write, nombres y
directorios), (2) el sistema de archivos propiamente dicho (organización en disco: inodos, bitmaps, directorios), (3) la capa de bloques + driver (lee y escribe bloques
del dispositivo concreto). Ejemplos de conveniencia: el mismo FS anda sobre cualquier disco cambiando el driver; la misma API sirve para FS distintos (ext4, FAT, NFS)
gracias a la capa de abstracción del FS virtual. ^kZxhGjfv

§36.8 — Caso de estudio: driver IDE simple (xv6) ^l4z2YZET

El disco IDE tiene registros de control, de command block (cantidad de sectores, LBA del sector, comando: 0x20 leer, 0x30 escribir), de status (BUSY,
READY, ERROR...) y de error. Protocolo: esperar a que esté listo (leer status hasta READY y no BUSY); escribir parámetros (cantidad de sectores, LBA,
número de drive); arrancar la I/O escribiendo el comando; transferir datos (en escrituras, esperar a que el status sea READY y DRQ y escribir los
datos); manejar la interrupción (en el caso simple, una por sector; en lotes, una al final); chequear el registro de error. En xv6: ide_rw() encola el
pedido (o lo lanza con ide_start_request()) y duerme al proceso; ide_intr() se llama cuando llega la interrupción, lee los datos si era lectura,
despierta al proceso y lanza el siguiente pedido de la cola; ide_wait_ready() hace polling hasta que el disco está listo. ^54F4BNC8

§36.10 — Resumen ^2zw6bOdX

Dos técnicas para eficiencia: las INTERRUPCIONES y el DMA. Dos formas de acceder a los registros: instrucciones de I/O explícitas y I/O mapeada a
memoria. El DEVICE DRIVER encapsula los detalles de bajo nivel para que el resto del SO sea independiente del dispositivo. ^rd2cp8y6

Cap. 37 — Discos duros ^53TWCBB1

OSTEP cap. 37 "Hard Disk Drives" — modelo del disco, cálculo de tiempos y scheduling ^xJ6QBTJy

Introducción y crux ^Vps3gdkh

Los discos fueron la forma principal de almacenamiento persistente durante décadas, y buena parte del diseño de los FS se basa en su comportamiento. ^yjuVPrMM

Crux: ¿cómo guardar y acceder a datos en disco? ^7hFwXhOT

¿Cómo guardan los datos los discos modernos? ¿Cuál es la interfaz? ¿Cómo se disponen y acceden los datos? ¿Cómo mejora el rendimiento el scheduling de disco? ^jma7IDnK

§37.1 — La interfaz ^CqjYErXN

El disco tiene un gran número de SECTORES (bloques de 512 bytes) que se pueden leer o escribir, numerados de 0 a n − 1: se puede ver como un ARREGLO
de sectores, y 0..n−1 es su espacio de direcciones. Las operaciones multisector son posibles (muchos FS leen y escriben de a 4 KB), pero el fabricante
sólo garantiza que la escritura de UN sector (512 B) es ATÓMICA: si se corta la luz, una escritura más grande puede quedar a medias (TORN WRITE).
Supuestos "no escritos" que hacen los clientes: acceder a dos bloques cercanos es más rápido que a dos lejanos, y acceder a bloques contiguos
(secuencial) es lo más rápido, mucho más que al azar. ^GQrpE2m1

§37.2 — Geometría básica ^VscafP3k

• PLATO (platter): superficie circular donde se guardan los datos de forma persistente induciendo cambios magnéticos. Cada plato tiene 2 SUPERFICIES;
  un disco puede tener varios platos.
• Los platos van unidos a un EJE (spindle) que los hace girar a velocidad constante, medida en RPM (rotaciones por minuto): valores típicos de 7200 a
  15000 RPM. Ej.: 10000 RPM → una vuelta tarda 6 ms.
• Los datos se codifican en círculos concéntricos de sectores llamados PISTAS (tracks); una superficie tiene miles de pistas, muy juntas.
• Para leer y escribir hay una CABEZA de disco (disk head) por superficie, montada en un BRAZO (disk arm) que la mueve sobre la superficie para
  posicionarla sobre la pista deseada. ^bs7NQK7A

§37.3 — Un disco simple ^fy6MzenJ

• LATENCIA ROTACIONAL: con una sola pista, para leer un sector hay que esperar a que pase bajo la cabeza. Si la vuelta completa es R, en promedio se
  espera R/2.
• SEEK (búsqueda): con varias pistas, primero el brazo se mueve a la pista correcta. Tiene fases: aceleración, desplazamiento (coasting),
  desaceleración y ASENTAMIENTO (settling, 0.5 a 2 ms, porque la cabeza tiene que posicionarse con precisión). Junto con la rotación, es de las
  operaciones más costosas.
• TRANSFERENCIA: cuando el sector pasa bajo la cabeza, se lee o escribe. Ciclo completo: seek, espera de rotación, transferencia.
• TRACK SKEW: los sectores de pistas consecutivas se desplazan para que, al cruzar el límite de una pista, la lectura secuencial no pierda una vuelta
  mientras la cabeza se reposiciona.
• MULTI-ZONE: las pistas exteriores tienen más sectores que las interiores (hay más espacio); el disco se organiza en zonas con el mismo número de
  sectores por pista.
• CACHÉ (track buffer): 8 a 16 MB de memoria en el disco para guardar datos leídos (ej.: toda la pista) o escritos. En escritura: WRITE-BACK (avisa
  que terminó apenas el dato está en su caché: más rápido, pero peligroso si importa el orden de escritura, por ejemplo para journaling) vs
  WRITE-THROUGH (avisa cuando el dato está realmente en el plato). ^TSzONliz

§37.4 — Tiempo de I/O: la cuenta ^VwSiM3WK

T_I/O = T_seek + T_rotation + T_transfer      (37.1)
R_I/O = Size_transfer / T_I/O                  (37.2) ^7yrR0eME

                   │ Cheetah 15K.5 │ Barracuda
───────────────────┼───────────────┼──────────
Capacidad          │ 300 GB        │ 1 TB
RPM                │ 15000         │ 7200
Seek promedio      │ 4 ms          │ 9 ms
Transferencia máx. │ 125 MB/s      │ 105 MB/s
Interfaz           │ SCSI          │ SATA ^PKMlBVMZ

Tabla 37.1: un disco de "alto rendimiento" (Cheetah) y uno de "capacidad" (Barracuda). ^gf2JI9Xs

Carga ALEATORIA (lecturas de 4 KB en lugares al azar, típica de bases de datos), en el Cheetah: T_seek = 4 ms; 15000 RPM = 250 RPS → una vuelta = 4 ms
→ T_rotation promedio = 2 ms; T_transfer = 4 KB / 125 MB/s ≈ 30 µs. T_I/O ≈ 6 ms → R_I/O ≈ 0.66 MB/s. En el Barracuda: T_I/O ≈ 13.2 ms → 0.31 MB/s.
Carga SECUENCIAL (100 MB contiguos: un seek y una rotación y después transferencia larga): T_I/O ≈ 800 ms (Cheetah) y 950 ms (Barracuda) → casi la
tasa máxima. ^CGrtlRD9

R_I/O      │ Cheetah   │ Barracuda
───────────┼───────────┼──────────
Al azar    │ 0.66 MB/s │ 0.31 MB/s
Secuencial │ 125 MB/s  │ 105 MB/s ^Ra0OWnQm

Tabla 37.2: ~200 veces de diferencia entre aleatorio y secuencial en el Cheetah, ~300 en el Barracuda. ^Bqevwe8Z

Tip: usá los discos secuencialmente ^teFM57P4

Siempre que se pueda, transferí datos de forma secuencial; si no se puede, al menos en pedazos grandes: cuanto más grandes, mejor. Con I/O chiquita y al azar
el rendimiento sufre muchísimo. (Este tip es la motivación de FFS, cap. 41, y de LFS, cap. 43.) ^lc9Yjw5n

Aside: ¿por qué el seek promedio es 1/3 del seek completo? ^ILGT6cJ5

La distancia promedio entre dos pistas al azar x, y en [0, N] es la integral doble de |x − y| dividida por N², que da N/3. Por eso muchos textos dicen que el
seek promedio es un tercio del seek completo. ^pmy4pPuY

Aparece en (práctico / parciales / finales) ^kaj3RDgb

Ver la columna de fórmulas: Práctico 4 ej. 1, Parcial 2 2020 preg. 14–15, 2021 preg. 8, 2022 ej. 4, 2023 ej. 4, 2025 ej. 6 y todos los finales 2021–2024. Práctico 4 ej.
18 (extents) se apoya en "secuencial >> aleatorio". ^11xoQiX5

§37.5 — Scheduling de disco ^m8ua61U7

Como el costo de cada pedido se puede ESTIMAR (seek + rotación), el scheduler del disco puede aproximar SJF (shortest job first) eligiendo el pedido
que tardaría menos. ^LNNIN4wL

• SSTF (shortest seek time first, o shortest seek first): atiende primero el pedido en la pista más CERCANA. Problemas: el SO no conoce la geometría
  (ve un arreglo de bloques; se arregla con NBF, nearest block first) y causa STARVATION: si llegan pedidos constantes a la pista actual, los de
  pistas lejanas no se atienden nunca.
• ELEVADOR (SCAN): el brazo recorre las pistas de un extremo al otro atendiendo pedidos en orden; un recorrido completo es un SWEEP. Si llega un
  pedido para una pista ya visitada en este sweep, espera al siguiente. Variantes: F-SCAN (congela la cola durante un sweep, evita starvation de
  pedidos lejanos) y C-SCAN (circular: sólo barre de afuera hacia adentro y vuelve al principio, más justo con las pistas extremas y del medio).
  Ignora la rotación.
• SPTF (shortest positioning time first, o SATF): considera seek Y rotación: si el seek es mucho más rápido que la rotación, conviene ir a una pista
  lejana cuyo sector está por pasar. Depende de detalles internos, así que se implementa DENTRO del disco. ^RJ25VWCY

Otras cuestiones: los discos modernos aceptan varios pedidos y el SO elige unos cuantos y el disco los ordena internamente con SPTF. MERGE de pedidos
(I/O merging): pedidos a bloques contiguos (33 y 34) se unen en uno. Y la pregunta de cuánto ESPERAR antes de emitir: work-conserving (emitir apenas
hay un pedido) vs non-work-conserving / anticipatory (esperar un poco por si llega un pedido "mejor"). ^bTMQvvvR

§37.6 — Resumen ^G4ngav9z

Modelo del disco: seek + rotación + transferencia. Diferencia enorme entre acceso secuencial y aleatorio. Schedulers: SSTF, SCAN y variantes, SPTF. ^wOUnxoR4

Cap. 38 — RAID ^qKNC8SBq

OSTEP cap. 38 "Redundant Arrays of Inexpensive Disks" — varios discos que se ven como uno ^0F5TS7RH

Introducción y crux ^G52fBfpz

Queremos un disco más RÁPIDO, más GRANDE y más CONFIABLE. RAID (Patterson, Gibson y Katz, Berkeley, fines de los 80) usa varios discos en conjunto.
Por fuera se ve como UN disco: un arreglo de bloques que se leen y escriben. Por dentro es un sistema complejo con varios discos, memoria (volátil y
no volátil) y uno o más procesadores. Ventajas: RENDIMIENTO (paralelismo), CAPACIDAD y CONFIABILIDAD (redundancia), y todo de forma TRANSPARENTE: se
puede reemplazar un disco por un RAID sin cambiar una línea del software. ^Ig7wc6jh

Crux: ¿cómo hacer un disco grande, rápido y confiable? ^tDwdqyVg

¿Cómo construir un sistema de almacenamiento grande, rápido y confiable? ¿Cuáles son las técnicas clave? ¿Cuáles son los trade-offs entre enfoques? ^Y0UWmQbO

§38.1–38.3 — Interfaz, modelo de fallas y evaluación ^65AzRShi

El FS emite una I/O lógica y el RAID calcula a qué disco(s) acceder y emite una o más I/O físicas. Modelo de fallas: FAIL-STOP: un disco está
funcionando o falló del todo, y la falla se detecta fácilmente (no hay corrupción silenciosa; eso se ve en el cap. 44). Se evalúa con tres ejes:
CAPACIDAD útil (con N discos de B bloques), CONFIABILIDAD (cuántas fallas de disco tolera) y RENDIMIENTO (depende de la carga). Para el rendimiento se
usan dos cargas: secuencial (cada disco transfiere a S MB/s) y aleatoria (cada disco a R MB/s, con S mucho mayor que R). ^tGpybCho

§38.4 — RAID 0: striping ^ai0Rxrhi

Disco 0 │ Disco 1 │ Disco 2 │ Disco 3
────────┼─────────┼─────────┼────────
0       │ 1       │ 2       │ 3
4       │ 5       │ 6       │ 7
8       │ 9       │ 10      │ 11
12      │ 13      │ 14      │ 15 ^OkraKPnh

Tabla 38.1: cada fila es un STRIPE. Sin redundancia: los bloques se reparten en round-robin. ^tffmBqA1

Disco  = A % cantidad_de_discos
Offset = A / cantidad_de_discos      (en unidades de chunk) ^uziOAqwa

CHUNK SIZE: cuántos bloques seguidos van en un disco antes de pasar al siguiente (Tabla 38.2 usa 2 bloques de 4 KB = 8 KB). Chunk chico: un archivo se
reparte en muchos discos (más paralelismo dentro de un archivo, pero el tiempo de posicionamiento es el máximo entre los discos). Chunk grande: menos
paralelismo intra-archivo, menos tiempo de posicionamiento. Análisis: capacidad N · B (perfecta), confiabilidad: cualquier falla pierde datos;
rendimiento: secuencial N · S, aleatorio N · R; latencia de un pedido igual a la de un disco. ^AismQk9v

§38.5 — RAID 1: mirroring ^ASslxKS5

Se guardan dos copias de cada bloque, en discos distintos. Con RAID-10 (striping de pares espejados) en 4 discos: los discos 0 y 1 tienen 0, 2, 4, 6 y
los discos 2 y 3 tienen 1, 3, 5, 7. Para leer se puede elegir cualquier copia; para escribir hay que actualizar AMBAS (en paralelo). Capacidad N · B /
2. Confiabilidad: tolera 1 falla seguro, hasta N/2 si hay suerte (que no fallen los dos de un mismo par). Rendimiento: lectura secuencial (N/2) · S
(cada disco salta los bloques que lee el otro), escritura secuencial (N/2) · S, lectura aleatoria N · R (lo mejor), escritura aleatoria (N/2) · R.
Latencia de escritura: un poco peor que un disco (la peor de dos escrituras). ^f4TuJqrB

Aside: el problema de la actualización consistente ^wYxZrnb2

Si se corta la luz después de escribir una copia y antes de la otra, las copias quedan inconsistentes. Solución típica: un WRITE-AHEAD LOG en memoria no
volátil (con batería) dentro del RAID, que registra qué se va a hacer; al recuperarse, se rehace lo pendiente. Es la misma idea que el journaling del cap.
42. ^UhUY4dX2

§38.6 — RAID 4: paridad ^IjrFZ9KR

Usa menos espacio que el espejo a cambio de rendimiento. Se agrega UN disco de PARIDAD por stripe: P = XOR de los bloques de datos del stripe (el XOR
da 0 si la cantidad de unos es par y 1 si es impar). Si falla un disco, su bloque se reconstruye haciendo XOR de los demás bloques del stripe y la
paridad. ^FvoNO8Or

• Capacidad (N − 1) · B. Tolera exactamente 1 falla.
• Lectura secuencial y escritura secuencial (N − 1) · S. En escritura secuencial se usa FULL-STRIPE WRITE: se calcula la paridad nueva de los bloques
  del stripe y se escriben todos a la vez.
• Lectura aleatoria (N − 1) · R.
• Escritura aleatoria de UN bloque: hay que actualizar la paridad. Método aditivo (leer los demás bloques del stripe) o SUSTRACTIVO: leer el dato
  viejo y la paridad vieja, P_nueva = (C_vieja XOR C_nueva) XOR P_vieja, y escribir dato y paridad: 4 I/O (2 lecturas y 2 escrituras).
• PROBLEMA DE LAS ESCRITURAS CHICAS (small-write problem): todas las escrituras tocan el disco de paridad, que se vuelve un CUELLO DE BOTELLA y
  serializa los pedidos: escritura aleatoria (R/2) MB/s, sin importar cuántos discos haya. Latencia de escritura 2D (dos lecturas en paralelo y luego
  dos escrituras en paralelo). ^lmuoZWmE

§38.7 — RAID 5: paridad rotada ^rnLojVyo

Disco 0 │ Disco 1 │ Disco 2 │ Disco 3 │ Disco 4
────────┼─────────┼─────────┼─────────┼────────
0       │ 1       │ 2       │ 3       │ P0
5       │ 6       │ 7       │ P1      │ 4
10      │ 11      │ P2      │ 8       │ 9
15      │ P3      │ 12      │ 13      │ 14
P4      │ 16      │ 17      │ 18      │ 19 ^Qzg8uDat

Tabla 38.6: la paridad rota entre los discos para eliminar el cuello de botella. ^3ArcgeNf

Igual que RAID 4 salvo en dos casos: la lectura aleatoria mejora a N · R (se usan todos los discos) y la escritura aleatoria mejora mucho porque
escrituras a stripes distintos pueden ir en PARALELO: (N/4) · R (cada escritura sigue generando 4 I/O). Por eso RAID 5 reemplazó casi por completo a
RAID 4 (que sólo sobrevive donde todas las escrituras son grandes). ^c6cF3UsC

§38.8 — Comparación (Tabla 38.7) ^eWbyceHM

                     │ RAID-0 │ RAID-1                   │ RAID-4  │ RAID-5
─────────────────────┼────────┼──────────────────────────┼─────────┼────────
Capacidad            │ N      │ N/2                      │ N − 1   │ N − 1
Confiabilidad        │ 0      │ 1 (hasta N/2 con suerte) │ 1       │ 1
Lectura secuencial   │ N·S    │ (N/2)·S                  │ (N−1)·S │ (N−1)·S
Escritura secuencial │ N·S    │ (N/2)·S                  │ (N−1)·S │ (N−1)·S
Lectura aleatoria    │ N·R    │ N·R                      │ (N−1)·R │ N·R
Escritura aleatoria  │ N·R    │ (N/2)·R                  │ R/2     │ (N/4)·R
Latencia lectura     │ D      │ D                        │ D       │ D
Latencia escritura   │ D      │ D                        │ 2D      │ 2D ^9VJFtVUn

Conclusión del libro: sólo rendimiento sin importar confiabilidad → striping (RAID 0). Rendimiento aleatorio + confiabilidad → mirroring (RAID 1),
pagando capacidad. Capacidad + confiabilidad → RAID 5, pagando en escrituras chicas. Siempre secuencial y máxima capacidad → RAID 5. ^gULTYPu3

§38.9–38.10 — Otros temas y resumen ^3go2oriB

Otros niveles: 2 y 3 (taxonomía original) y 6 (tolera 2 fallas). HOT SPARE: un disco de repuesto listo para reemplazar al que falla; rendimiento
durante la falla y la reconstrucción; modelos de fallas más realistas (errores latentes de sector, corrupción: cap. 44); RAID por software (más
barato, con el problema de la actualización consistente). Elegir un nivel de RAID y sus parámetros (chunk size, cantidad de discos) depende mucho de
la carga. ^YSA65E7j

Aparece en (práctico / parciales / finales) ^bP1Msm1b

No apareció en los parciales 2 ni en los finales recientes que tenés (2020–2025), ni en el práctico 4. Está en el libro y en el programa: si cae, son preguntas de la
Tabla 38.7 o el cálculo de la paridad con XOR. ^1MApzPrt

Cap. 39 — Archivos y directorios ^ZfIIWWSA

OSTEP cap. 39 "Interlude: Files and Directories" — la API del sistema de archivos ^FiO6i34Q

Introducción y crux ^VfBjxdWi

Hasta acá: CPU virtualizada (proceso) y memoria virtualizada (espacio de direcciones). La tercera pieza es el almacenamiento persistente: guarda datos
aunque se corte la luz. ^YvGCHRFS

Crux: ¿cómo manejar un dispositivo persistente? ^jcgsiZtO

¿Cómo debería el SO manejar un dispositivo persistente? ¿Cuáles son las APIs? ¿Cuáles son los aspectos importantes de la implementación? ^AXk42749

§39.1 — Archivos y directorios ^sipYl3nV

• ARCHIVO: un arreglo lineal de bytes que se pueden leer o escribir. Tiene un nombre de bajo nivel, el NÚMERO DE INODO (i-number). El SO no sabe nada
  de la estructura del contenido (si es una imagen, texto o código C): sólo lo guarda y lo devuelve tal cual.
• DIRECTORIO: también tiene un número de inodo, pero su contenido es una lista de pares (nombre legible, número de inodo). Cada entrada apunta a un
  archivo o a otro directorio: así se forma el ÁRBOL de directorios (jerarquía) que empieza en la raíz /, con nombres absolutos como /foo/bar.txt. El
  SEPARADOR es /; los nombres pueden repetirse en distintos lugares del árbol.
• La extensión (.c, .jpg) es una convención, no algo que el FS imponga.
• Los nombres son importantes: en UNIX casi todo (archivos, dispositivos, pipes, procesos en /proc) se nombra en el FS, lo que da una forma unificada
  de acceder a todo. ^J9bU530P

§39.3–39.4 — Crear, leer y escribir ^nwCyfXiY

int fd = open("foo", O_CREAT | O_WRONLY | O_TRUNC, S_IRUSR | S_IWUSR);
// O_CREAT: crearlo si no existe; O_WRONLY: sólo escritura;
// O_TRUNC: si existe, truncarlo a 0 bytes; permisos: lectura y escritura del dueño
prompt> strace cat foo
open("foo", O_RDONLY|O_LARGEFILE)       = 3
read(3, "hello\n", 4096)                = 6
write(1, "hello\n", 6)                  = 6
read(3, "", 4096)                       = 0     // fin de archivo
close(3)                                = 0 ^3aiwwtbb

open() devuelve un DESCRIPTOR DE ARCHIVO (file descriptor): un entero, privado de cada proceso, que funciona como una CAPACIDAD (un handle opaco que
da permiso para hacer operaciones). Cada proceso arranca con 0 (entrada estándar), 1 (salida estándar) y 2 (error estándar) abiertos; por eso el
primer open devuelve 3. read() devuelve cuántos bytes leyó y 0 al llegar al final. ^sYseYSCQ

§39.5 — Acceso no secuencial: lseek() ^9armxAUj

off_t lseek(int fildes, off_t offset, int whence);
// SEEK_SET: offset = offset   SEEK_CUR: offset actual + offset   SEEK_END: tamaño + offset ^Z0sPfktL

Para cada archivo abierto, el SO lleva un OFFSET ACTUAL que determina dónde será la próxima lectura o escritura: se actualiza implícitamente al
leer/escribir N bytes (se suma N) o explícitamente con lseek(). lseek() NO hace un seek de disco: sólo cambia una variable en memoria del kernel. ^LDqM7nri

§39.6 — Escribir de inmediato: fsync() ^JdrHZQyZ

write() normalmente sólo deja los datos en memoria (buffer) y el FS los escribe al disco más tarde (5 o 30 segundos): BUFFERING. Para aplicaciones que
necesitan garantías (ej.: un DBMS con su log de recuperación), fsync(fd) fuerza a escribir a disco todos los datos sucios de ese archivo y vuelve
cuando terminaron. Detalle: si el archivo es nuevo, también hay que hacer fsync() del DIRECTORIO que lo contiene, para asegurar que la entrada del
directorio llegó al disco. ^YgXkkH3x

§39.7 — Renombrar: rename() ^0Fdefrox

mv usa rename(old, new), que es ATÓMICO respecto de caídas: si el sistema se cae en el medio, el archivo queda con el nombre viejo o con el nuevo,
nunca en un estado intermedio. Patrón típico de editores para actualizar un archivo de forma atómica: escribir la versión nueva en foo.txt.tmp,
fsync(), y rename("foo.txt.tmp", "foo.txt"). ^olEPL6TM

§39.8 — Información de archivos: stat() ^RujUiWnj

stat() y fstat() devuelven los METADATOS del archivo (struct stat): dispositivo, número de inodo, permisos (st_mode), cantidad de hard links
(st_nlink), dueño y grupo, tamaño en bytes (st_size), tamaño de bloque, cantidad de bloques asignados, y los tiempos de último acceso, modificación y
cambio de estado. Todo eso vive en el INODO, estructura persistente del FS. ^bNQnlt5w

§39.9 — Borrar archivos: unlink() ^TrOqyaiE

rm llama a unlink(), no a "delete" o "remove". ¿Por qué ese nombre? Se entiende al ver los hard links (§39.13). ^6wC9REky

§39.10–39.12 — Directorios ^D8z8SZuq

mkdir() crea un directorio con dos entradas: "." (él mismo) y ".." (su padre); un directorio "vacío" tiene esas dos. No se puede escribir un
directorio directamente: su formato es metadato del FS, y sólo se actualiza indirectamente (creando archivos, directorios, etc.). Para leer:
opendir(), readdir() (devuelve struct dirent con nombre, número de inodo, offset, largo del registro y tipo) y closedir(). rmdir() sólo borra
directorios VACÍOS (que tienen únicamente . y ..), para no perder muchos datos de un comando. ^aiLMJz6H

§39.13 — Hard links ^fgNe144X

prompt> echo hello > file
prompt> ln file file2
prompt> ls -i file file2
67158084 file
67158084 file2       // mismo número de inodo: son el MISMO archivo
prompt> rm file
prompt> cat file2
hello ^WoXD3hhc

link(old, new) crea OTRO NOMBRE en un directorio que apunta al MISMO número de inodo; el archivo no se copia. Al crear un archivo pasan dos cosas: (1)
se crea una estructura (el inodo) con toda su información, y (2) se LINKEA un nombre legible a ese inodo y se lo pone en un directorio. unlink() saca
una entrada de directorio y DECREMENTA el LINK COUNT (reference count) del inodo; recién cuando el link count llega a 0 (y nadie lo tiene abierto) el
FS libera el inodo y sus bloques. stat muestra el link count (Links: 2). ^CwUuYbXn

Aparece en (práctico / parciales / finales) ^HW2mUclk

Respuestas propuestas. Práctico 4 ej. 11 (¿por qué guardar el link count si se puede calcular recorriendo el árbol? Porque unlink tendría que recorrer TODO el FS para
saber si fue el último nombre: el contador lo hace O(1); además, fsck lo usa para detectar inconsistencias). Práctico 4 ej. 13 (hard links a directorios: se podrían
formar CICLOS en el árbol, y con un directorio que se autorreferencia el link count nunca llega a 0, entonces nunca se liberaría; además rompe el ".." único y el
recorrido del árbol). Práctico 4 ej. 16c (hard links entre particiones: FALSO, el número de inodo sólo tiene sentido dentro de un FS). Parcial 2 2020 preg. 13 y 2021
preg. 12 (inconsistencia en nlink). ^OvZNu9rb

§39.14 — Links simbólicos (soft links) ^OfSM5n8x

ln -s file file2. Un link simbólico es un archivo de un TERCER TIPO (además de archivo regular y directorio): su contenido es el PATH del archivo al
que apunta. Por eso su tamaño es el largo del path. Sirven entre particiones y para directorios (los hard links no). Problema: DANGLING REFERENCE: si
se borra el archivo original, el link simbólico apunta a un path que no existe. ^vxJBseAa

§39.15 — Crear y montar un sistema de archivos ^bu0bPLCL

mkfs crea un FS vacío (con un directorio raíz) en una partición (ej.: mkfs -t ext3 /dev/sda1). mount(dispositivo, punto de montaje) pega ese FS en el
árbol unificado en un punto de montaje: ej. mount -t ext3 /dev/sda1 /home/users hace que la raíz del nuevo FS se vea en /home/users. Así, en vez de
tener muchos FS separados, todos quedan en un solo árbol. ^7kO5fnMZ

§39.16 — Resumen ^ZhwmpslX

La interfaz es simple: archivos (arreglos de bytes con número de inodo), directorios (listas de pares nombre/inodo), descriptores de archivo, fsync,
rename atómico, hard y soft links, mount. Para entenderla de verdad hay que ver cómo se implementa (cap. 40). ^prTV15Bx

Cap. 40 — Implementación del sistema de archivos ^od07Sx1z

OSTEP cap. 40 "File System Implementation" — vsfs (very simple file system), un UNIX simplificado. Es EL capítulo de las cuentas ^jnCBWIi9

Introducción y crux ^zlCya0tG

Se construye vsfs, una versión simplificada de un FS típico de UNIX. El FS es SOFTWARE puro (a diferencia de CPU y memoria, no hay hardware especial
que lo ayude), así que hay mucha libertad de diseño: AFS, ZFS, etc. ^yom7QwGC

Crux: ¿cómo implementar un sistema de archivos simple? ^hCZs6uhr

¿Cómo construir un FS simple? ¿Qué estructuras se necesitan en el disco? ¿Qué necesitan registrar? ¿Cómo se acceden? ^xsAPFhIA

§40.1 — La forma de pensar ^RcC2GJph

Dos aspectos: (1) las ESTRUCTURAS DE DATOS en disco (cómo se organizan los datos y metadatos: arreglos de bloques, árboles...), y (2) los MÉTODOS DE
ACCESO (cómo se mapean las llamadas open, read, write a esas estructuras: qué se lee y se escribe en cada una). Un buen modelo mental de esas dos
cosas es la clave para entender cualquier FS. ^YYjsBfbc

§40.2 — Organización general ^Adjq7gUe

El disco se divide en BLOQUES de 4 KB. Ejemplo: un disco chiquito de 64 bloques. La mayor parte es la REGIÓN DE DATOS (56 bloques). Para cada archivo
hay que guardar metadatos (qué bloques lo forman, tamaño, dueño, permisos, tiempos) en un INODO; los inodos van en la TABLA DE INODOS (5 bloques; con
inodos de 256 B entran 16 por bloque → 80 inodos como máximo, que es la cantidad máxima de archivos). Para saber qué está libre se usan dos BITMAPS
(un bit por objeto: 0 libre, 1 en uso): uno para inodos y otro para datos (un bloque entero cada uno, aunque sobra). El SUPERBLOQUE (bloque 0) tiene
información del FS: cuántos inodos y bloques de datos hay, dónde empieza la tabla de inodos, un número mágico que identifica el tipo de FS. Al montar,
el SO lee primero el superbloque. ^WrKmiehf

S ^c80pk3QX

i ^ZBAS41Az

d ^RjZWLRXi

I ^IiH59XqZ

I ^yRw3wqcO

I ^35QMOD1I

I ^MKXQcaMk

I ^i2IlT8JX

D ^X73Rtev1

D ^Md78lWDF

D ^YGcp0b0G

D ^E0SeaS3i

D ^72fk4KGJ

D ^hJi7T4GS

D ^9NYM3Ifw

D ^Gp1UTlvv

0 ^xtfQfIwF

8 ^VxgNm3lZ

15 ... 63 ^OxeGN7Mw

S = superbloque · i = bitmap de inodos · d = bitmap de datos · I = tabla de inodos (bloques 3–7) · D = región de datos (bloques 8–63) ^GHXoPM18

§40.3 — Organización de archivos: el inodo ^QpNtO8iX

INODO = index node (nombre histórico: en UNIX se guardaban en un arreglo y se indexaban con el número de inodo). Cada inodo se identifica con su
i-number, y con él se calcula DÓNDE está en el disco: ^seWwP6Bj

blk    = (inumber * sizeof(inode_t)) / blockSize
sector = ((blk * blockSize) + inodeStartAddr) / sectorSize
Ej.: inodo 32, inodos de 256 B, tabla desde 12 KB:
     offset = 32 * 256 = 8 KB  →  dirección 12 KB + 8 KB = 20 KB  →  sector 40 ^jPUWsOO3

Dentro del inodo están todos los METADATOS (Tabla 40.1, el inodo de ext2): mode (tipo y permisos), uid, size, tiempos (atime, ctime, mtime, dtime),
gid, links_count, blocks (cantidad de bloques asignados), flags, y block (hasta 15 punteros a bloques). ^J5QvGhKC

El índice multinivel ^Zyt6OsPc

Con punteros DIRECTOS solamente (cada uno es una dirección de disco de un bloque del archivo), un archivo no podría ser más grande que (cantidad de
punteros) × (tamaño de bloque). Solución: un PUNTERO INDIRECTO apunta a un bloque que contiene más punteros. Con 12 directos + 1 indirecto, bloques de
4 KB y direcciones de 4 bytes: (12 + 1024) × 4 KB = 4144 KB. Para más, DOBLE INDIRECTO (un bloque de punteros a bloques indirectos: 1024² bloques más,
~4 GB) y TRIPLE INDIRECTO. Este árbol desbalanceado es el ÍNDICE MULTINIVEL (multi-level index); lo usan ext2, ext3 y UFS. ^ZLx2soCr

inodo ^0pdLIWxJ

tipo, permisos, size, ^vyJm0pRH

nlink, tiempos... ^8Zf5SfLJ

directo 0 ^NPGl1V26

... ^ESyQOcHh

directo 11 ^Hp9VeVO9

indirecto ^rGIPUpsx

doble indirecto ^9FTfTHAp

triple indirecto ^PB2g2E19

bloques de datos ^eNITZfnL

bloque de punteros ^QmqDVxoV

datos ^S6s0Udiv

punteros ^DAr4R8B9

punteros ^UlwWQ605

datos ^pMUVExuT

triple: punteros → punteros → punteros → datos ^X9Kyb6wm

¿Por qué un árbol desbalanceado? Porque la mayoría de los archivos son CHICOS (Tabla 40.2): con unos pocos punteros directos (12 → 48 KB) se cubren
casi todos, y sólo los grandes pagan indirecciones. ^z33H9TX6

Medición                                         │ Resultado
─────────────────────────────────────────────────┼────────────────────────────────────────────────────────────
La mayoría de los archivos son chicos            │ ~2 KB es el tamaño más común
El tamaño promedio crece                         │ ~200 KB de promedio
La mayoría de los bytes está en archivos grandes │ unos pocos archivos grandes usan la mayor parte del espacio
Los FS tienen muchos archivos                    │ ~100 mil en promedio
Los FS están más o menos a la mitad              │ aunque los discos crezcan, ~50% lleno
Los directorios suelen ser chicos                │ la mayoría tiene 20 entradas o menos ^AcszoIjz

Aside: enfoques basados en EXTENTS ^tgXXn19h

En vez de un puntero por bloque, un EXTENT es un puntero de disco + una LONGITUD (en bloques): describe una zona contigua. Un archivo es una lista de
extents. Es menos flexible que los punteros (requiere espacio contiguo) pero mucho más compacto cuando los archivos están contiguos. Lo usan ext4, XFS, NTFS. ^JyeIQ3jJ

Aparece en (práctico / parciales / finales) ^AJThQyC7

Respuestas propuestas. Práctico 4 ej. 18 (mejorar la estructura de FAT/UFS aprovechando que los bloques suelen ser crecientes y contiguos: EXTENTS, la idea de NTFS y
ext4). Práctico 4 ej. 10 y final dic-22-2021 (guardar el comienzo del archivo en el inodo mismo, "archivos inmediatos": buena idea porque la mayoría de los archivos son
chicos (Tabla 40.2): se ahorra un bloque y un acceso a disco; costo: inodos más grandes o menos espacio para punteros. ext4 lo hace con inline data). ^ocwtMtty

Aside: asignación basada en listas enlazadas (FAT) ^zMC143fp

Otra forma: el inodo tiene un solo puntero al PRIMER bloque, y cada bloque apunta al siguiente. Lento para acceso aleatorio (leer el último bloque obliga a
recorrer toda la cadena). Arreglo: guardar los "siguiente" en una TABLA en memoria, indexada por número de bloque: eso es la FILE ALLOCATION TABLE, el FS FAT
de Windows antes de NTFS. FAT no tiene inodos: las ENTRADAS DE DIRECTORIO guardan los metadatos y apuntan al primer bloque, por eso no se pueden hacer hard
links. ^QkEdTbVM

FAT en la práctica (no está en el texto principal de OSTEP; sale del práctico) ^rJML05c5

Tamaño de la FAT = (cantidad de clusters) × (bits por entrada). Cluster = bloque en terminología Microsoft. FAT12/16/32 = 12/16/32 bits por entrada (FAT32
usa 28 bits efectivos).
Práctico 4 ej. 2:
(a) diskette 360 KiB, FAT12, cluster de 512 B → 720 clusters × 12 bits = 8640 bits = 1080 B.
(b) 4 GiB, FAT16, cluster de 4 KiB → 1 Mi clusters × 2 B = 2 MiB. Pero FAT16 sólo direcciona 2¹⁶ = 65536 clusters: con 4 KiB llega a 256 MiB, no puede cubrir
el disco entero (habría que usar clusters más grandes o particionar).
(c) 32 GiB, FAT32, cluster de 16 KiB → 2 Mi clusters × 4 B = 8 MiB.
Consistencia en FAT (Práctico 4 ej. 12a, final sin fecha 1 ej. 7–9): que dos cadenas no compartan un cluster, que no haya ciclos, que el tamaño en la entrada
de directorio coincida con el largo de la cadena, clusters marcados en uso que ninguna cadena alcanza (perdidos), y que la copia de respaldo de la FAT
coincida. ^XfsAiV38

§40.4 — Organización de directorios ^V9XKh6Z5

inum | reclen | strlen | name
5      12       2        .
2      12       3        ..
12     12       4        foo
13     12       4        bar
24     36       28       foobar_is_a_pretty_longname ^mDXO4K7Z

Un directorio es una lista de entradas (nombre, número de inodo); se guardan además el largo del registro (reclen, espacio total, incluyendo el que
sobra) y el largo del nombre (strlen). Al borrar un archivo (unlink) se puede marcar la entrada con inodo 0 (reservado) y el reclen sirve para
reutilizar ese espacio. El directorio es un ARCHIVO más, de tipo "directorio" en su inodo, con sus bloques de datos en la región de datos. Otros FS
usan árboles B (XFS) para que buscar, crear y borrar sea más rápido en directorios grandes. ^wfVwYnNl

Aparece en (práctico / parciales / finales) ^fryJpm1c

Respuestas propuestas. Práctico 4 ej. 16b (V/F: "los FS tipo UNIX tienen soporte especial para que un directorio que crece pida más bloques" → FALSO: el directorio es un
archivo más y crece como cualquier archivo, asignando bloques con el mismo mecanismo). Ej. 16j (ext4 y ZFS no tienen problemas de escalabilidad en la cantidad de
entradas: usan árboles/hashes, ej. HTree en ext4). ^5QRZZMZ0

§40.5 — Manejo del espacio libre ^u6z2gps4

vsfs usa dos bitmaps. Al crear un archivo se busca un inodo libre en el i-bitmap, se marca usado (1) y se actualiza el disco; lo mismo con los bloques
de datos. Otras alternativas: FREE LISTS (el superbloque apunta al primer bloque libre, que apunta al siguiente...) o árboles B (XFS). Política de
PRE-ASIGNACIÓN (ext2/ext3): al asignar bloques de datos, buscar una secuencia de bloques libres contiguos (ej.: 8) para que parte del archivo quede
contigua en el disco y mejorar el rendimiento. ^y3Ekgx2g

Aparece en (práctico / parciales / finales) ^Wcu7g7Cx

Respuestas propuestas. Práctico 4 ej. 17 (¿por qué un bitmap de inodos libres en vez de un bit en cada inodo? Porque el bitmap es CHICO y se puede tener en memoria:
buscar un inodo libre no obliga a leer toda la tabla de inodos del disco). Práctico 4 ej. 16e (un disco UFS puede no estar lleno y no poder guardar más archivos:
VERDADERO, si se acaban los INODOS). Final feb-2021 ej. 6 (tamaños de bitmaps). ^cYvp4ZSK

§40.6 — Caminos de acceso: leer y escribir ^y8iimh2s

Suponemos el FS montado: el superbloque ya está en memoria; todo lo demás (inodos, directorios) en disco. ^uNCBUiL3

• open("/foo/bar", O_RDONLY): hay que encontrar el inodo de bar recorriendo el path (traversal). Se empieza por la RAÍZ, cuyo número de inodo es "bien
  conocido" (en la mayoría de los UNIX es 2). Se lee el inodo de /, luego sus bloques de datos buscando la entrada foo (que da su número de inodo,
  digamos 44), se lee el inodo de foo, sus datos, y finalmente el inodo de bar. Se chequean permisos, se asigna un descriptor en la tabla de archivos
  abiertos del proceso y se lo devuelve.
• read(): consulta el inodo para ubicar el bloque, lo lee, y actualiza el tiempo de último acceso en el inodo (una ESCRITURA). Actualiza el offset en
  la tabla de archivos abiertos.
• close(): sólo libera el descriptor; no hace I/O.
• Lo que cuesta el open es PROPORCIONAL AL LARGO DEL PATH: por cada directorio se lee su inodo y sus datos (y más si el directorio es grande). ^zCdFadB3

Aside: las lecturas NO acceden a las estructuras de asignación ^Tli1HjsT

Error común: pensar que al leer un archivo se consulta el bitmap. NO: los bitmaps sólo se acceden cuando hay que ASIGNAR. Los inodos, directorios y bloques
indirectos tienen toda la información para leer. ^BNkXK7ja

Operación                │ I/O en disco (Tablas 40.3 y 40.4)
─────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
open(/foo/bar) para leer │ leer inodo /, datos /, inodo foo, datos foo, inodo bar (5 lecturas)
cada read()              │ leer inodo bar, leer el bloque, escribir inodo bar (atime)
create(/foo/bar)         │ leer inodo /, datos /, inodo foo, datos foo; leer y escribir i-bitmap; escribir datos foo; leer y escribir inodo bar; escribir inodo foo (10 I/O)
cada write() que asigna  │ leer inodo bar; leer y escribir d-bitmap; escribir el bloque; escribir inodo bar (5 I/O) ^aabTRgjW

Escribir puede asignar bloques: cada escritura genera lógicamente 5 I/O (leer y escribir el d-bitmap, escribir el bloque, leer y escribir el inodo).
Crear un archivo es todavía peor: asignar un inodo, poner la entrada en el directorio, actualizar el inodo del directorio (y si el directorio necesita
crecer, más I/O para su d-bitmap y su nuevo bloque). ^Eayd3og2

Crux: ¿cómo reducir el costo de I/O del FS? ^UlC6J0vZ

Hasta abrir, leer o escribir un archivo genera muchas I/O dispersas por el disco. ¿Qué puede hacer un FS para reducir el alto costo de hacer tantas I/O? ^8SnIUbf8

§40.7 — Caché y buffering ^Af9jv7Qb

• LECTURAS: se cachean bloques populares en memoria (DRAM). Antes, un caché de tamaño fijo (~10% de la memoria): estático y potencialmente
  desperdiciado. Hoy, PARTICIÓN DINÁMICA: un PAGE CACHE UNIFICADO que integra páginas de memoria virtual y páginas del FS. Con caché, el primer open
  de un archivo genera mucho tráfico (inodos y datos de directorios), pero los siguientes opens del mismo archivo (o de archivos en el mismo
  directorio) pegan en caché.
• ESCRITURAS: el WRITE BUFFERING tiene ventajas: el FS puede juntar (BATCH) varias actualizaciones en menos I/O (ej.: el i-bitmap se actualiza al
  crear un archivo y otra vez al crear otro: se escribe una vez); puede PLANIFICAR las I/O; y puede EVITAR escrituras (si se crea y borra un archivo
  antes de escribirlo, no hace falta escribir nada).
• Trade-off DURABILIDAD vs RENDIMIENTO: si el sistema se cae antes de escribir los buffers, las actualizaciones se pierden. Por eso los FS bufferean
  entre 5 y 30 segundos; aplicaciones como bases de datos usan fsync(), DIRECT I/O o la interfaz RAW del disco para evitar el buffering. ^bPprxAV7

§40.8 — Resumen ^gHGwCJHZ

Hay que guardar información de cada archivo (inodo), los directorios son archivos especiales con pares nombre → número de inodo, y hacen falta
estructuras (bitmaps) para saber qué está libre. El espacio de diseño es enorme: cada FS toma decisiones distintas en cada uno de estos aspectos. ^L96nFMOC

Aparece en (práctico / parciales / finales) ^WpFmgIkn

Respuestas propuestas. Práctico 4 ej. 16f (el tamaño en bytes NO se puede deducir de los bloques ocupados: el último bloque puede estar parcialmente lleno → FALSO), 16g
(el uso de disco es ≥ que la longitud: en general sí por bloques parciales y metadatos, pero hay excepciones: archivos con agujeros (sparse) o datos inline → FALSO como
"siempre"), 16h (un archivo borrado se puede recuperar mientras sus bloques no se reutilicen: unlink sólo marca libres inodo y bloques → FALSO), 16i (FAT y UFS no sufren
fragmentación EXTERNA porque asignan de a bloques: cualquier bloque libre sirve, no queda espacio inutilizable; sí interna en el último bloque → VERDADERO. Que los
bloques de un archivo queden dispersos (lo que arregla el defragmentador, ej. 18 y §41.1) es un problema de RENDIMIENTO, no de espacio perdido), 16k (truncate recorta (o
extiende) el archivo a un tamaño → VERDADERO). ^QKtNexgg

Cap. 41 — Localidad y Fast File System ^WaG0B0tT

OSTEP cap. 41 "Locality and The Fast File System" — hacer el FS consciente del disco ^lvXDW7tw

§41.1 — El problema: rendimiento pobre ^ipHLT5xA

El primer FS de UNIX (Ken Thompson) era simple: superbloque, región de inodos y región de datos. Problema: rendimiento TERRIBLE, que empeoraba con el
tiempo hasta dar el 2% del ancho de banda del disco. Causa: trataba al disco como si fuera memoria de acceso aleatorio; los datos quedaban dispersos
sin importar el costo de posicionar la cabeza: los bloques de datos de un archivo lejos de su inodo (un seek caro al leer el inodo y después los
datos). Además el espacio libre se FRAGMENTABA: con una free list, un archivo nuevo tomaba bloques dispersos por todo el disco (ej.: borrar B y D de A
B C D deja huecos; un archivo E de 4 bloques queda partido). Por eso aparecieron los DEFRAGMENTADORES. Y el bloque era chico (512 B): bueno contra la
fragmentación interna, malo para transferir (cada bloque costaba un posicionamiento). ^D6Egje8D

Crux: ¿cómo organizar los datos en disco para mejorar el rendimiento? ^QL9SadUx

¿Cómo organizar las estructuras del FS para mejorar el rendimiento? ¿Qué políticas de asignación hacen falta? ¿Cómo hacer el FS "consciente del disco" (disk
aware)? ^txWEXS8c

§41.2–41.3 — FFS y los grupos de cilindros ^8l0jrVXU

Un grupo de Berkeley construyó el FAST FILE SYSTEM (FFS): la idea es diseñar estructuras y políticas de asignación conscientes del disco, manteniendo
la MISMA interfaz (open, read, write...). FFS divide el disco en GRUPOS DE CILINDROS (cylinder groups). Un CILINDRO es el conjunto de pistas a la
misma distancia del centro en todas las superficies; un grupo es un conjunto de N cilindros consecutivos. (Los discos modernos no exponen su
geometría, así que los FS actuales como ext2/3/4 usan BLOCK GROUPS: rangos consecutivos del espacio de direcciones del disco.) Clave: si dos archivos
están en el mismo grupo, acceder a uno después del otro no tiene seeks largos. ^OxChT1kz

Cada grupo tiene TODAS las estructuras de un FS: una copia del superbloque (por confiabilidad: si se corrompe uno, se usa otra copia), su i-bitmap y
d-bitmap, su región de inodos y su región de datos. Los bitmaps son una forma excelente de manejar el espacio libre: es fácil encontrar zonas grandes
libres y evitar la fragmentación. ^DNMQJNKg

| S | ib | db |  Inodes  |          Data          |     (un grupo) ^0qebeEja

§41.4 — Políticas: dónde ubicar archivos y directorios ^3r2wHAKo

Mantra: MANTENER CERCA LO RELACIONADO y lejos lo no relacionado. ^1SZ05Hd0

• DIRECTORIOS: buscar un grupo con POCOS directorios asignados (para balancear los directorios entre grupos) y MUCHOS inodos libres (para poder crear
  muchos archivos ahí), y poner ahí los datos del directorio y su inodo.
• ARCHIVOS: (1) asignar los bloques de datos en el MISMO GRUPO que su inodo (evita seeks largos entre inodo y datos); (2) poner todos los archivos de
  un mismo directorio en el grupo del directorio. Ej.: /a/b, /a/c, /a/d y /b/f: los de /a quedan juntos en un grupo y /b/f en otro.
• Estas heurísticas se basan en el sentido común (los archivos de un mismo directorio suelen accederse juntos), no en un estudio de tráfico. ^uLtwQtKc

§41.5 — Midiendo la localidad ^OTRGzlQq

Con trazas SEER se mide la "distancia en el árbol" entre accesos consecutivos: 0 si es el mismo archivo, 1 si están en el mismo directorio, 2 si
comparten el abuelo... Resultado (Figura 41.1): ~7% de los accesos son al mismo archivo y casi 40% a un archivo del mismo directorio (distancia 0 o
1): la suposición de FFS tiene sentido. Además ~25% están a distancia 2 (ej.: proyectos con subdirectorios src/ y obj/), y FFS no captura esa
localidad. ^qYuZGejA

§41.6 — La excepción de los archivos grandes ^x7wYVNi1

Sin una regla especial, un archivo grande llenaría todo el grupo de su inodo, y los archivos relacionados que vengan después no entrarían en él (se
pierde localidad). FFS, después de un cierto número de bloques en un grupo (los 12 directos), pone los siguientes "pedazos" (CHUNKS) del archivo en
OTROS grupos (cada bloque indirecto y todo lo que apunta, en un grupo distinto: con bloques de 4 KB y direcciones de 32 bits, cada 1024 bloques = 4 MB
van en un grupo distinto). Esto agrega seeks entre chunks, pero si el chunk es grande la mayor parte del tiempo se va en transferencia: AMORTIZACIÓN. ^VboyHwgV

Cuánto tiene que medir un chunk (ecuación 41.1) ^zSQnPKUA

Posicionamiento promedio 10 ms, transferencia 40 MB/s. Para pasar la mitad del tiempo posicionando y la otra mitad transfiriendo (50% del pico), en 10 ms hay
que transferir: 40 MB/s · 1024 KB/MB · 1 s/1000 ms · 10 ms = 409.6 KB por chunk. Para el 90% del pico hacen falta ~3.69 MB, y para el 99% ~40.6 MB (Figura
41.2): cuanto más cerca del pico, más grande el chunk. Es la misma cuenta T_I/O de la columna del cap. 37. ^Ism9mJyy

§41.7 — Otras cosas de FFS ^C2K7XPRo

• SUB-BLOQUES: bloques de 4 KB son buenos para transferir, pero desperdician espacio con archivos chicos (fragmentación interna). FFS introdujo
  sub-bloques de 512 B: un archivo chico usa sub-bloques hasta llegar a 4 KB, y ahí se copian a un bloque entero. Para evitar ese costo, la librería
  bufferea escrituras y manda de a 4 KB.
• LAYOUT PARAMETRIZADO: al leer bloques consecutivos, cuando llegaba el pedido del siguiente bloque éste ya había pasado bajo la cabeza (hacía falta
  una vuelta entera). FFS dejaba un bloque de por medio (Figura 41.3: bloques 0 a 11 en posiciones alternadas) según los parámetros del disco. Hoy los
  discos tienen TRACK BUFFER: leen toda la pista en su caché y el problema desaparece.
• USABILIDAD: nombres de archivo largos, LINKS SIMBÓLICOS (introducidos por FFS) y rename() atómico. ^1dI6Ub1y

§41.8 — Resumen ^KnAGAQSy

FFS fue el primer FS en tratar el problema del manejo de archivos como el más interesante del SO, y mostró cómo tratar al disco COMO UN DISCO. Casi
todos los FS modernos (ext2, ext3...) toman sus lecciones: los grupos de bloques y la ubicación cerca de lo relacionado. ^ERpo000b

Aparece en (práctico / parciales / finales) ^uDq67TnS

Pocas preguntas directas. Práctico 4 ej. 18 (contigüidad/defragmentación, relacionado con la fragmentación de §41.1 y los extents del cap. 40) y ej. 3 ("à la
Fast-Filesystem": xv6 usa el inodo de FFS). Práctico 4 ej. 16i (fragmentación). ^ePKDINx0

Cap. 42 — Consistencia ante caídas: fsck y journaling ^yWUTmY5d

OSTEP cap. 42 "Crash Consistency: FSCK and Journaling" — no lo pediste en la lista, pero lo toman MUCHO (inconsistencias, fsck, journaling), así que
va completo ^BDpmMVaN

Introducción y crux ^t40jDwTs

Las estructuras del FS tienen que PERSISTIR y sobrevivir a cortes de luz y caídas. El problema: entre dos escrituras puede pasar una caída, y las
estructuras en disco quedan en un estado inconsistente. ^FwnvHUJT

Crux: ¿cómo actualizar el disco a pesar de las caídas? ^XIf1pcsU

El sistema puede caerse o perder la energía entre dos escrituras cualquiera, por lo que el estado en disco puede quedar actualizado sólo en parte. Después de
la caída, al bootear y montar el FS, ¿cómo nos aseguramos de que la imagen en disco quede en un estado razonable? ^CR4BWeHF

§42.1 — Un ejemplo detallado ^crRbPQHx

Carga de trabajo: AGREGAR (append) un bloque de datos a un archivo existente. Para eso hay que escribir TRES bloques: el inodo (I[v2], con el nuevo
puntero al bloque 5 y el tamaño nuevo), el bitmap de datos (B[v2], con el bloque 5 en uso) y el bloque de datos (Db). Esas escrituras quedan un tiempo
en el page cache y el FS las manda al disco después (5 o 30 segundos): una caída puede interrumpirlas. ^uD2ddLqr

Llega a disco │ Resultado
──────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Sólo Db       │ No hay problema de consistencia: nada apunta al bloque ni lo marca usado; es como si la escritura no hubiera ocurrido (el usuario pierde datos)
Sólo I[v2]    │ El inodo apunta al bloque 5 que tiene BASURA (contenido viejo), y además INCONSISTENCIA: el bitmap dice que 5 está libre y el inodo que está usado
Sólo B[v2]    │ INCONSISTENCIA: el bitmap dice usado y ningún inodo apunta → SPACE LEAK (el bloque 5 no se usaría nunca)
I[v2] y B[v2] │ Metadatos consistentes, pero el bloque 5 tiene basura
I[v2] y Db    │ El inodo apunta a datos correctos, pero INCONSISTENCIA con el bitmap viejo
B[v2] y Db    │ INCONSISTENCIA entre inodo y bitmap; el bloque está escrito y marcado, pero no se sabe de qué archivo es ^2cXjL3jx

El PROBLEMA DE LA CONSISTENCIA ANTE CAÍDAS (crash-consistency o consistent-update problem): queremos pasar el FS de un estado consistente a otro de
forma ATÓMICA, pero el disco hace una escritura a la vez y la caída puede pasar entre medio. ^wSIh6Wi3

Aparece en (práctico / parciales / finales) ^bcEhj4kU

Parcial 2 2020 preg. 11–13 y Parcial 2 2021 preg. 10–12 (con una tabla de inodos y bitmaps: inconsistencias de TAMAÑO — size que no coincide con la cantidad de bloques
—, del i-bitmap — inodos en uso marcados libres o al revés — y de NLINK — el link count no coincide con las entradas de directorio). Práctico 4 ej. 12b (pruebas de
consistencia en UNIX: estas tres más las de fsck de §42.2). ^cX1Xu6A4

§42.2 — Solución 1: el file system checker (fsck) ^T89cZ6Av

Enfoque "perezoso": dejar que ocurran las inconsistencias y arreglarlas después, al reiniciar, con fsck. No puede arreglar todo (ej.: metadatos
consistentes pero inodo apuntando a basura): su único objetivo es que los METADATOS sean internamente consistentes. Corre ANTES de montar el FS. Fases
(McKusick y Kowalski): ^29K1tRS1

• SUPERBLOQUE: chequeos de cordura (ej.: que el tamaño del FS sea mayor que la cantidad de bloques asignados). Si parece corrupto, se usa una copia
  alternativa.
• BLOQUES LIBRES: recorre los inodos y los bloques indirectos (simples, dobles...) para saber qué bloques están asignados, y con eso produce una
  versión correcta de los bitmaps: ante una inconsistencia entre bitmaps e inodos, SE CONFÍA EN LOS INODOS. Lo mismo con los inodos: los que parecen
  en uso se marcan en el i-bitmap.
• ESTADO DE LOS INODOS: chequea que cada inodo asignado tenga un tipo válido (archivo, directorio, link simbólico...). Si hay problemas difíciles de
  arreglar, el inodo se considera sospechoso y se borra (y se actualiza el i-bitmap).
• LINKS DE LOS INODOS: verifica el link count de cada inodo asignado recorriendo TODO el árbol de directorios desde la raíz y contando sus propias
  referencias; si no coincide, corrige el contador del inodo. Si un inodo asignado no es referenciado por ningún directorio, se mueve a lost+found.
• DUPLICADOS: dos inodos distintos que apuntan al mismo bloque. Si uno es obviamente malo, se borra; si no, se copia el bloque para que cada uno tenga
  su copia.
• BLOQUES MALOS: punteros que apuntan fuera del rango válido (ej.: a un bloque mayor que el tamaño de la partición): se borra el puntero.
• DIRECTORIOS: fsck no entiende el contenido de los archivos, pero los directorios tienen un formato conocido: chequea que "." y ".." sean las
  primeras entradas, que cada inodo referido esté asignado, y que ningún directorio esté linkeado más de una vez en la jerarquía. ^GY0jpAMs

Problema fundamental: es LENTO. Con un disco grande (o un RAID), recorrer todo el disco y el árbol de directorios puede tardar minutos u horas. Y es
irracional: para arreglar una actualización de 3 bloques se escanea el disco entero (como buscar las llaves que se te cayeron en el dormitorio
revisando toda la casa). ^JJcVOQuO

Aparece en (práctico / parciales / finales) ^dFSsCTBR

Práctico 4 ej. 7 (se borró el bitmap de bloques: recorrer todos los inodos en uso y sus indirectos, marcando cada bloque que aparece; fase "bloques libres"), ej. 8
(tabla en uso vs libre: ver la columna de fórmulas), ej. 11 (link count), ej. 12. Parcial 2 2025 ej. 5 (reconstruir el d-bitmap). Final sin fecha 1 ej. 8–9 (reconstruir
bitmaps). ^rytZYclc

§42.3 — Solución 2: journaling (write-ahead logging) ^AzsvAPHF

Idea tomada de las bases de datos: antes de actualizar las estructuras en su lugar, se escribe una NOTA (en un lugar bien conocido del disco, el
JOURNAL o log) describiendo lo que se va a hacer. Si hay una caída en el medio de la actualización, al volver se mira la nota y se reintenta: se sabe
exactamente QUÉ arreglar, sin escanear el disco. Se agrega un poco de trabajo en cada actualización para que la recuperación sea mucho más rápida.
Ej.: ext3 = ext2 + journal (el journal ocupa una zona de la partición o va en otro dispositivo). ^naNgMhmQ

Journal
super ^0aJjPXbo

TxB ^T6Qnkj9x

I[v2] ^7Qyyp1Dn

B[v2] ^qPf98RjX

Db ^Y6E8gdBZ

TxE ^YNlWlzoW

TxB ... ^8IhItjw0

└───── una transacción (TxB y TxE llevan el TID) ─────┘ ^iF2zNVsH

El journal es una zona fija de la partición (log circular); las escrituras de una transacción van ahí ANTES que a su lugar final. ^JeXiYW36

Data journaling ^shIoUiCL

Para el append: se escribe en el journal TxB (transaction begin: el TID y las direcciones finales de los bloques), los bloques mismos (journaling
FÍSICO: el contenido exacto; el LÓGICO guarda una descripción compacta, como "agregar el bloque Db al archivo X") y TxE (transaction end, con el TID).
Cuando la transacción está segura en disco, se hace CHECKPOINT: se escriben I[v2], B[v2] y Db en sus lugares finales. ^19wqqjwn

¿Por qué no mandar los 5 bloques de una? El disco puede reordenarlos (scheduling interno) y escribir TxB, I[v2], B[v2] y TxE antes que Db: si hay una
caída, la transacción parece válida pero tiene basura en Db. Solución: escribir TxE recién cuando el resto llegó al disco, y que la escritura de TxE
sea ATÓMICA (el disco garantiza 512 B: TxE se hace de un sector). ^fOY5e2OQ

1. Journal write:   escribir TxB, metadatos y datos en el journal; esperar
2. Journal commit:  escribir TxE (512 B, atómico); esperar → transacción COMMITTED
3. Checkpoint:      escribir metadatos y datos en sus ubicaciones finales
4. Free:            más tarde, marcar la transacción libre en el superbloque del journal ^yCysyyBx

Recuperación ^dv28F03g

Si la caída es ANTES del commit: la transacción pendiente se SALTEA (se pierde esa actualización, pero el FS queda consistente). Si es DESPUÉS del
commit y antes de terminar el checkpoint: se REPRODUCE (REDO LOGGING): se leen las transacciones committed del journal y se escriben los bloques en su
lugar. Si la caída fue en el checkpoint, algunos bloques se escriben dos veces: no pasa nada (la operación es idempotente). ^P3MBaRkA

Batching y journal finito ^LM7uldwb

• BATCHING: crear dos archivos en el mismo directorio actualiza los mismos bloques (i-bitmap, inodo y datos del directorio) varias veces; ext3 junta
  todas las actualizaciones en una TRANSACCIÓN GLOBAL en memoria y la escribe de una vez cada cierto tiempo (5 s), evitando tráfico excesivo.
• JOURNAL FINITO: si se llena, la recuperación tarda más y no se pueden committear transacciones nuevas. Se usa como LOG CIRCULAR: una vez que una
  transacción hizo checkpoint, su espacio se libera, registrando en el SUPERBLOQUE DEL JOURNAL cuáles son las transacciones más vieja y más nueva que
  todavía no hicieron checkpoint (paso 4 "free"). ^Qo1hjowo

Metadata journaling (ordered journaling) ^3x5EJTa5

Data journaling escribe cada bloque de datos DOS veces (journal y lugar final): duplica el tráfico de escritura y obliga a seeks entre el journal y el
lugar final. ORDERED (o METADATA) JOURNALING: los DATOS no se escriben en el journal; sólo los metadatos (I[v2], B[v2]). Pero el bloque de datos tiene
que escribirse en su lugar ANTES que los metadatos lleguen al journal: si no, un inodo podría apuntar a basura después de la recuperación. ^jFsEmHfE

1. Data write:            escribir los datos en su ubicación final; esperar
2. Journal metadata write: escribir TxB y los metadatos en el journal; esperar
   (los pasos 1 y 2 pueden ir en paralelo, pero ambos antes del 3)
3. Journal commit:         escribir TxE; esperar
4. Checkpoint metadata:    escribir los metadatos en su lugar final
5. Free:                   más tarde, liberar la transacción en el superbloque del journal ^bD57gYi4

Regla general de los FS que dan consistencia: "escribir primero el objeto apuntado y después el que apunta a él". La mayoría de los sistemas usa
metadata journaling (ext3 en modo ordered, NTFS, XFS); ext3 también tiene modo data. Hay un modo "unordered" (writeback) donde los datos pueden
escribirse en cualquier momento: más rápido, menos seguro. ^apgwL00Y

El caso raro: reutilización de bloques y revoke ^e4lKyFFq

Ejemplo de Stephen Tweedie: se crea un directorio foo (su bloque 1000 se registra en el journal, porque los directorios son metadatos), se lo borra y
el bloque 1000 se reutiliza para un archivo cuyo contenido NO va al journal. Si hay una caída y se hace replay, se escribe el contenido viejo del
directorio sobre el bloque 1000 y se pisan los datos del archivo. Solución de ext3: registros REVOKE en el journal; al recuperar, primero se buscan
los revoke y los bloques revocados no se reproducen. ^Toez1rim

Práctico 4 ej. 14: diferencia entre log-structured FS y journaling FS ^GT4KqZug

Respuesta propuesta. Un JOURNALING FS (ext3/ext4, cap. 42) mantiene el FS tradicional (inodos y datos en lugares fijos) y usa un journal APARTE, sólo como nota temporal
para recuperarse: los bloques se escriben dos veces (journal y lugar definitivo). Un LOG-STRUCTURED FS (LFS, cap. 43) no tiene "lugar definitivo": TODO el disco es el
log; cada actualización (datos e inodos) se escribe secuencialmente al final del log en un segmento grande, nunca se sobrescribe en el lugar, y se necesita un mapa de
inodos y un limpiador (garbage collector) de segmentos viejos. ^h2I8xCVW

§42.4 — Solución 3: otros enfoques ^COhGR7zD

• SOFT UPDATES (Ganger y Patt): ordena cuidadosamente TODAS las escrituras para que el disco nunca quede inconsistente (ej.: escribir un bloque de
  datos antes que el inodo que lo apunta). Requiere conocer en detalle cada estructura del FS: es complejo.
• COPY-ON-WRITE (COW), como ZFS: nunca sobrescribe en el lugar; escribe las actualizaciones en lugares sin usar y, cuando terminaron, cambia la raíz
  del FS para que apunte a las nuevas estructuras. LFS (cap. 43) es un ejemplo temprano.
• BACKPOINTER-BASED CONSISTENCY (BBC): cada bloque tiene un puntero de vuelta a su inodo; se verifica que el puntero y el backpointer coincidan, sin
  imponer orden de escrituras.
• OPTIMISTIC CRASH CONSISTENCY: manda tantas escrituras como puede y usa checksums de transacción para detectar inconsistencias. ^RaTqajza

§42.5 — Resumen ^fX5QNnnl

fsck funciona pero es demasiado lento en sistemas modernos. El journaling reduce la recuperación de O(tamaño del disco) a O(tamaño del log),
acelerando mucho el reinicio. La forma más común es el journaling ordenado (metadata journaling), que reduce el tráfico al journal y da garantías
razonables para metadatos y datos de usuario. ^EaYDId7N

Caps. 43 y 44 — LFS e integridad de datos (breve) ^vd5VliuS

El 44 lo marcaste con "¿?": no aparece en el práctico ni en los parciales que tenés; va lo esencial por si lo preguntan conceptualmente. El 43 sólo
por el Práctico 4 ej. 14. (Esta edición de OSTEP no tiene capítulo de SSD.) ^XH9vMll8

Cap. 43 — Log-structured File System (lo mínimo) ^ymM5k6GT

Motivación (Rosenblum y Ousterhout): la memoria crece, así que las lecturas pegan cada vez más en caché y el tráfico a disco es casi todo ESCRITURAS;
la brecha secuencial/aleatorio crece; los FS existentes hacen muchas escrituras chicas (crear un archivo de un bloque toca inodo, bitmaps,
directorio...). Idea: bufferear todas las actualizaciones (datos Y metadatos) en un SEGMENTO en memoria y escribirlo de una vez, SECUENCIALMENTE, en
una parte libre del disco. Nunca se sobrescribe en el lugar. ^TT6L64Jw

• Como los inodos se mueven, hace falta un MAPA DE INODOS (imap: número de inodo → dirección del inodo más reciente), que también se escribe en el
  log; una CHECKPOINT REGION en un lugar fijo apunta a los pedazos más nuevos del imap.
• Las versiones viejas quedan como basura: un LIMPIADOR (cleaner) compacta segmentos viejos, con un SEGMENT SUMMARY BLOCK que dice a qué archivo y
  offset pertenece cada bloque para saber si sigue vivo.
• Ante caídas: la checkpoint region se escribe alternando dos copias con timestamps; al recuperar se usa la última consistente y se hace ROLL FORWARD
  del log. ^VKr8eL7g

Cap. 44 — Integridad y protección de datos ^eiUQbIX0

Crux: ¿cómo asegurar la integridad de los datos? ^scV7iT5M

¿Cómo deberían asegurar los sistemas que los datos escritos al almacenamiento estén protegidos? ¿Qué técnicas hacen falta? ¿Cómo hacerlas eficientes, con
bajo costo de espacio y tiempo? ^hXJWKsgT

• Más allá del modelo FAIL-STOP de RAID: el modelo FAIL-PARTIAL. El disco parece funcionar pero uno o más bloques fallan: LATENT SECTOR ERRORS (LSE:
  un sector dañado, ej. por un head crash o rayos cósmicos; el código de corrección del disco lo detecta y la lectura devuelve error) y CORRUPCIÓN de
  bloques (el disco devuelve datos equivocados SIN avisar: corrupción silenciosa, por firmware con bugs o transferencias malas).
• Tabla 44.1 (Bairavasundaram et al.): en discos baratos ~9.40% tuvo al menos un LSE y ~0.50% corrupción; en discos caros, 1.40% y 0.05%. Son raros
  pero existen.
• LSE: fáciles de detectar; se recupera con la REDUNDANCIA (copia en RAID 1, reconstrucción con paridad en RAID 4/5). Problema: un LSE durante la
  reconstrucción de RAID → por eso RAID-DP con dos discos de paridad.
• CORRUPCIÓN: se detecta con CHECKSUMS: una función que resume un bloque en un valor chico (8 bytes). Opciones: XOR, suma (rápidas, débiles),
  FLETCHER, CRC (más robustas). No existe el checksum perfecto: puede haber COLISIONES. El checksum se guarda junto a cada bloque (o agrupados en un
  sector), se recalcula al leer y se compara: si no coincide, hay corrupción y se usa otra copia (si hay) o se devuelve error.
• ESCRITURAS DESVIADAS (misdirected writes): el dato correcto escrito en la dirección EQUIVOCADA. Se detecta agregando un IDENTIFICADOR FÍSICO (número
  de disco y de bloque) al checksum.
• ESCRITURAS PERDIDAS (lost writes): el disco dice que escribió pero no lo hizo. Se detectan con una verificación de lectura después de escribir
  (lenta) o con un checksum guardado en otro lugar (ej.: ZFS guarda el checksum de cada bloque en el inodo/puntero que lo apunta).
• SCRUBBING: recorrer periódicamente todos los bloques verificando los checksums, para no depender de que se lean (datos que nunca se leen se podrían
  corromper sin enterarnos).
• COSTO: en espacio, pequeño (ej.: 8 bytes por bloque de 4 KB ≈ 0.19%); en tiempo, calcular el checksum al leer y escribir (se puede combinar con la
  copia de datos). Scrubbing en horarios de poca carga. ^KWktH9Qy

Aparece en (práctico / parciales / finales) ^z7OYjqWM

Ningún ejercicio del práctico 4, parciales 2 o finales que tenés lo pide. Sirve como contexto para RAID (cap. 38: fail-stop vs fail-partial) y para "un archivo
borrado/corrupto, ¿se puede recuperar?". ^46OhwY47

Persistencia (OSTEP caps.
36–44) ^WWIYL9R0

Anotado del libro orientado a práctico 4, parciales 2 y finales.
Izquierda: fórmulas y mapa de ejercicios, dispositivos, discos y RAID.
Derecha: archivos, implementación del FS (+ FAT), FFS, consistencia
(fsck y journaling), LFS e integridad. ^IxAfh8Vq

Índice (click para ir): ^3ELUWNU1

→ Fórmulas y ejemplos resueltos ^GqDaX2aR

→ Cap. 36 — Dispositivos de I/O ^vre8RmsF

→ Cap. 37 — Discos ^pWzlhQek

→ Cap. 38 — RAID ^ZFUnQaUC

→ Cap. 39 — Archivos y directorios ^8D8V5b8k

→ Cap. 40 — Implementación del FS ^s5SWMh6k

→ Cap. 41 — FFS ^JmBplefN

→ Cap. 42 — fsck ^Scn1EiPJ

→ Cap. 42 — journaling ^JBypIAWB

→ Caps. 43–44 — LFS e integridad ^cWpgSbkh

## Element Links
GqDaX2aR: [[Resumen Persistencia#^5gJ2yKS7]]
vre8RmsF: [[Resumen Persistencia#^sKQmDYRU]]
pWzlhQek: [[Resumen Persistencia#^Vps3gdkh]]
ZFUnQaUC: [[Resumen Persistencia#^G52fBfpz]]
8D8V5b8k: [[Resumen Persistencia#^VfBjxdWi]]
s5SWMh6k: [[Resumen Persistencia#^zlCya0tG]]
JmBplefN: [[Resumen Persistencia#^ipHLT5xA]]
Scn1EiPJ: [[Resumen Persistencia#^T89cZ6Av]]
JBypIAWB: [[Resumen Persistencia#^AzsvAPHF]]
cWpgSbkh: [[Resumen Persistencia#^ymM5k6GT]]

%%
## Drawing
```compressed-json
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

ngQR1fqZwX6ahueYRcbkZtfFBZW3xZUVAb7FoZDJ5ZW4la1q0Glp1emAkcDRiVnVTZW51b2p/GakbDHsVwapLNuF2UzXbGPViBXOeQJQrgLT1Yas3nmBhXju10l56bdJo0Woah0AP/yNmhQUbQCeKM0AqMC5FUyZbOX4QkUCr8xswOBFpQIAYCQxlOBpedmh1QJQRXmh2mbFlfO2VRWt1Y1ZyEXiWe4ZOcBcYBrwFVBLlW0ww0QVec3xKGWERdTl

JVGNmsiAp7jugB0A0eoZlS2FrXkfJKihZ9WnmPYhKaHoOqhwo479ed+pFgVDeYsV98XLFbl5e0VNWVBlPJB0FB04ADUwWI6kIiU1dsT56AUxQKsc0/nCbkCgngDl+QoI9DWYADdlQILhBSwAbDXRIBw1JUCWAM4x3DXRfLw1jAAKFHtQVzjhBeAgEjWiBjwgPDVUEPCCldYFucokh/K60NUiEIAm3N8ZfDWV+ZSV0jVDBew1om4U+Sw1MABiNdP5

VTR0NaJuPUwGIHQFzDX6NZY10CBcNUJoPDU6NQI1nkBCNSY1JjViNbI1cpDyNdF8MjUa8HI1XjWKNZgQyjUt5RCoajXsIBo1WjXGJK41om56Nf41BjX8NUY1NfkuNSakdAXj9A411jWc5pyJdjWJNQ41nDWeNWk1BTWCNcI1zjWiNQE10Wa+NSY1lTWSNX41ngBbCUo1jwxqFRE1CgrqNU8kMTUzaHE1utU1NUk1lfnGNWk15jXpKb8JWFGQsUjZ

wOXF7DZsHQA10fPBuwBjSvUu8gABqNGh8JV7VNqAYMB16cug/2RFxhtu1DGx5QsVd8VTlTYFIuV5pTiVBi6JIpDSqFW/oEzwOwKOFHhFIDVHFbTe1xX2ZbhlCBDEVU5GmJ6q5HTINfzGYZilwqCludDQ0TVkHom5EKgGciLkBs5bUglwp6xZZZ8lA3wZiV/AJB44fECusNU1pgIVUCDHMRCorzVgoOPWVtB1gFrlsNbJ3twEXcC7QucYg9hIJNm5

CzlgwsXEIznrDD2ElKI/NdbZ18BvAK8VfxwYAP+0HyKepY25MU4hQCQ8B3kOyNjW59DEtUriVdyGJsNMK/72TgPkVCC2pSC1tfT5JeLWfBnGrCoAVCA+hTNC3lqTdCGxIxykvA9FzmiDBZImCCQqXJxEFuTmaccMTuVbKCgyTXDpLIq1AH46IJYaWGzIaZKVt7BdZThl5IB4Zci17zXVYJ81+OKG3PS1pFV/NZs5ALUdNUC1KjXStX/lXmHgtVoy

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
```
%%