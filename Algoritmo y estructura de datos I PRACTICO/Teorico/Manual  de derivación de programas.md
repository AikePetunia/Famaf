---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
perdí el archivo original... ^wFaJ6Ex9

Notas:

El caso base, se parte como:
xs = [], y asumimos los segmentos de lista vacios SOLO los del termino. Ej:
<øas,bs,cs: xs = as ++ bs ++cs : t.as>
={caso base, xs = [], prop de listas}
<øas,bs,cs: as = [] ^ bs = [] ^ cs =  [] : t.as>
={eliminacion de variable}
<øas,bs,cs:  bs = [] ^ cs =  [] : t.[]>
={rango unitario}
t.[] ^IJlJctb4

Notas:

El paso inductivo, como xs=(x:xs), es preguntarse "Que parte es vacia, cual no"
(Mucha logica de listas, ej si bs != [] -> b:bs != [], etc)

xs = x:xs, y asumimos los segmentos de lista vacios SOLO los del termino. Ej:
<øas,bs,cs: (x:xs) = as ++ bs ++ cs : t.as>
={Tercer excluido (Sería ^ true) -> ¿as es vacia o no? => logica}
<ø as,bs,cs: (x:xs) = as ++ bs ++ cs ^ (as = [] v as != []): t.as>
={distributividad, particion de rango}
<ø as,bs,cs: (x:xs) = as ++ bs ++ cs ^  as != []: t.as>
ø <ø as,bs,cs: (x:xs) = as ++ bs ++ cs ^ as = []: t.as>  <---- Mismo que caso base
={prop de listas, logica}
<øas,bs,cs: (x:xs) = as ++ bs ++ cs ^ a:as != [] : t.as>
ø < >
={eliminacion de variable}
<øas,bs,cs: (x:xs) = a:as ++ bs ++ cs : t.(a:as)>
ø < >
={logica de listas, es lo mismo que se añada un elemento, antes o
despues de concatenar listas (si el orden no importase) }
<øas,bs,cs: (x:xs) = a (as ++ bs ++ cs) : t.(a:as)>
ø < >
={Logica de listas, x y a serían el mismo elemento, ya que es una igualdad}
<øas,bs,cs: a=x ^ xs = (as ++ bs ++ cs) : t.(a:as)>
ø < >
={Eliminacion de variable}
<øas,bs,cs: xs = as ++ bs ++ cs : t.(x:as)>
ø < >
={pasos, lo q valga t, vale hipotesis o no, dependerá de el termino} ^LULBSct2

Programacion Funcional ^tPneipuv

Programacion Imperativa ^LjRIczkM

Sintaxis:

Var x, y : Int;            <------ Declaracion de variables. Componen el estado: “x” e “y” de tipo Int.

Secuenciación: Usamos “;” para secuenciar una sentencia atrás de otra.

Asignación: Un tipo de sentencia que modifica determinados valores del estado. ^TjHarc2z

Arreglo:

Coleccion de datos del mismo tipo. Coleccion de valores ordenada y de largo fijo.
Sintaxis: Array[N, M) of tipoX
Semántica: Tengo un arreglo de (M - N) elementos de tipo <tipoX>, cuyos índices son N, N+1, N+2, …. , M-1.

Consulta / acceso (expresión): A.E
Semántica: 
1. Calcular el valor entero asociado a la expresión E. Sea n este valor. 
2. “A.E” me devuelve el valor alojado en la n-ésima posición del arreglo A. (este valor devuelto es del tipo <tipoX>)

Asignación para arreglos (sentencia): A.E := F
donde E es una expresión de tipo Nat, y F es una expresión de tipo <tipoX> a donde <tipoX> 
es el tipo de los elementos del arreglo.

Semántica: 
    1. Calcular los valores asociados a E y a F.
    2. Modificar el estado, cambiando el valor asociado a la posición E por el resultado de F. ^epIAvJl1

Sentencias ^1CfBxVEe

Skip: ^SEgaX4ZW

Expresiones ^6tfrw5tm

Condicional (if) ^Kj0UqyEB

Sentencia compuesta. El condicional me permite ejecutar diferentes sentencias dependiendo de una condición booleana ^lx3dVXkK

B1, B2, …, Bn (llamadas guardas, Bool) ^lYoJGSre

S1, S2, …, Sn son sentencias. ^NaVAHdTI

1. Se evalúan todas las guardas B1, …, Bn usando el estado actual. (se obtienen valores booleanos). 

2. Se elige alguna de las guardas que da True. Si ninguna da True, el programa termina con error (“se rompe”). Supongamos que elegimos la k-ésima guarda (Bk = True).
 
3. Ejecutar esa rama del if: Sk. (el estado final es el que resulta de esta ejecución). ^4gUtQgQa

Sentencia compuesta. Me permite repetir la ejecución de una sentencia mientras se cumpla una condición. ^Ekeu0WHA

Repetición, ciclo o bucle (do) ^W54V3m5d

B es una expresión booleana (guarda) ^GdK37UXw

S es una sentencia (cuerpo del ciclo). ^EIQK06SJ

1. Se evalúa la guarda B en el estado actual. 

2. Si da False, termina la ejecución. Si da True, modifica el estado ejecutando S, y luego vuelve al punto 1. ^IUCITPhn

Anotaciones/Comentarios:
S2; // esto es un comentario   ^cAD17DTC

DEFINICIÓN: Llamamos postcondición a la anotación de programa que usamos para describir el estado final, o sea la que ubicamos en el punto final del programa. ^3vusZ4OG

Especificacion ^HAOO6YQk

Terna de Hoare ^V0i2d9NS

{ P } S { True } ^tDGSK31I

-> siempre y cuando S termine (no dé error ni pueda entrar en ciclo infinito). ^MOjux5xY

Vale si: ^EjvCsZMH

{ False } S { Q } ^i8dXv0g2

-> Afirma que siempre que empiece en un estado que satisface False termine en un estado que satisface Q. ^JIeJHy5w

{ P } S { False } ^AFt3FLg9

-> ¿Vale? Depende… si P es False, vale. Si P no es False, debe haber algún estado inicial posible y por lo tanto la terna no vale ^uomCEA35

{ True } S { Q } ^Ppbs5bfS

-> ¿Vale? Depende, debe suceder que para cualquier estado inicial, ejecutar S me deja en un estado final que satisface Q. ^ExuANG15

La especificación funciona como contrato entre la persona que quiere resolver el problema y la persona que lo va a solucionar. ^2daCwZn9

Weakest Precondition (Precondicion más debil) ^lEVOH0LR

El proceso de buscar la precondicion que cumpla la post condicion más rapidamente.
Es preguntarnos cuál es la precondición más general (o abarcativa) ^lDlBcvEi

wp.S.Q ^axwFKxAK

Un predicado debil, tiene menos requisitos para entrar a una sentencia. 
Un predicado fuerte, pide más requisitos para entrar a una sentencia. ^FxK3eE16

Dado un programa S (o sea, una sentencia) y un predicado Q (la postcondición), la weakest precondition (precondición más débil) ^lJrJSqxM

Ejemplo de evaluacion:  ^UxDnd2XF

la setencia de WP para skip es: ^LEasqL1a

Derivación de programas imperativos ^G6W4M7Yc

Derivar = ir de Q hacia atrás, construyendo el programa mientras aplicás la regla del wp. ^39zj0KPW

Imperativa: derivás usando weakest precondition. ^27obBl30

Funcional: derivás usando inducción. ^VpBViWoz

WP de varias condiciones -> ^eXewfz3v

Su secuenciacion, pasa a ser por la tabla imperativa:
wp.s.(wp.t.q) ^fDlYlepk

Demostración de programas imperativos: ^Fnr24xrD

significa probar que la terna: ^W6OrB0XI

{P} S {Q} ^usOr2Ebi

es correcta. ^Mu02iuHS

Se demuestra probando:
P => wp.S.Q (y usamos las reglas de wp) ^RCjajMIA

Escenarios posibles: ^3ERZ4Dqs

A — wp.S.Q = P (perfecto) ^3fL2rZNN

Entonces P ⇒ wp es trivial y la terna está probada. ^cpmgOkTF

B — wp.S.Q es más débil que P ^SvhjVQLY

La precondición del programa podría haber sido más débil, pero igual funciona ^2Fdr201j

(x≥10)⇒(x≥0) ^cH8K9tlO

ej ^0KIlwy4z

C — wp.S.Q es más fuerte que P (no válido) ^NCHSanf1

es falsa → el programa NO garantiza Q bajo P. ^WhUDb7TN

x≥0⇒x≥10 ^WzAWc6ao

ej ^N7Y1jJPn

Demostrar un programa imperativo es calcular su weakest precondition y chequear que la precondición la implica. ^V3oNbpJG

y se concluye asi: ^H9Akovc7

El do en demostraciones y uso de invariante: ^CttWw2Ph

Para demostrar do's, primero sepamos que una invariente (INV, I) es:
Un predicado que siempre es verdadero antes, durante y justo después del ciclo. Solo sirve para demostrar
que el ciclo mantiene una propiedad estable (preservación)
que cuando el ciclo termina esa propiedad + la condición de salida implican la postcondición Q ^ux1ABEum

el invariante conecta P con Q aunque haya un ciclo en el medio ^6xTAVMxL

El invariante no garantiza que la guarda del ciclo (B) se vuelva falsa. ^Jgtmpiaw

El invariante solo garantiza que, si en algún momento ¬B llega a ser verdadera, entonces ya tenés asegurada la postcondición Q. ^yIasaDJl

El invariante vale antes de entrar al ciclo, vale en cada vuelta del ciclo y vale cuando se sale del ciclo. ^UoACUZuT

Al combinarse el invariante con ¬B, se obtiene Q. ^Gp0Yj9CB

El invariante no hace que el ciclo corte. ^AjzCzVur

El invariante no muta, no fuerza nada, no fortalece la guarda. ^XIAt3NP3

Es únicamente una herramienta demostrativa para ciclos, usada para probar corrección parcial: si el ciclo termina, entonces la salida cumple Q. ^oSgdbAYe

La terminación del ciclo no la prueba el invariante sino la función de cota. ^8FZkhnxX

Demostrar un do es crear un invariante, que implique
la conexion con todos los pasos de la terna de Hoare. ^LTctNsEe

El invariante vale al entrar al ciclo, vale en cada vuelta del ciclo, y vale al salir del ciclo. ^r90bU9XR

No hace que el ciclo corte. ^jj7skZ6c

Solo permite demostrar que, si el ciclo corta, entonces la postcondición Q se cumple ^Y4aCvJ35

Técnicas para encontrar invariantes: ^NKG2pSXD

Técnica 1 — Mirar la postcondición y “generalizarla” para que valga dentro del ciclo (Tomar términos de una conjunción)
    La postcondicion Q, puede ser algo como Q = A ^ B ^ C. Pero mientras el ciclo corre, no pueden valer a la vez, por falta de informacion. Entonces, 
    se propone un invariante más debil, I = A ^ B' ^ C'.
    Puedo elegir que una parte sea el INV y que otra parte sea ¬ B. En ese caso tendría garantizado el requisito iii)
Ejemplo:
    Si tengo que Q = <Sum i : 0<= i < N: i> La postcondicion no puede entrar ya que mientras I < N, faltaría el que hacer. Pero, sabemos que puede aumentar por posicion, ->
    I = <Sum i : 0<= i < pos: I> ^ 0<= pos <= N. Podemos decir asi que, I "Es la suma parcial", y Q "La suma completa".
     ^dHasY4ap

Técnica 2 — Mirar el cuerpo del ciclo y encontrar una propiedad que NO cambia (Reemplazo de constantes por variables)
    A veces Q sugiere una propiedad que no depende del índice. COmo que "x*y queda constante".
    Normalmente se usa en problemas aritmeticos. Y es la tecnica mas usada.
    Q habla de valores inciales X, Y. Antes del ciclo x = X, y = Y. En el ciclo NO forman parte.
Ejemplo:
    






Sabemos que tomar el MCD(X,Y) = MCD(x,y)
Tomamos ambas guardas, y aparece explicito en Q. Entonces, la inv quedaria como:
I: x > 0 ^ y > 0 ^ mcd(x,y) = mcd(X,Y). 
 ^rrfQwRiC

Técnica 3  — Fortalecimiento del invariante. (Nos hace pasar un problema de 2 ciclos, a uno solo)
    Es agregar informacion cuando I no alcanza. Es definir bien la invariante tambien.
    Surge de que I ^ B => wp.s2.I no funciona por que I es débil. -B expresa lo que falta para llegar a Q, I lo que se garantiza en el ciclo.
    Ejemplo:
        Si tengo Q: res = <Ei: 0<=i<N:A[I] = 0>
        entonces, tengo creo un I debil:
        I: res = <Ei: 0<=i<pos:A[I] = 0>
        Cuando quieras hacer I ^ B => Q, pos te puede quedar fuera de rango.
        Entonces, fortalecemos, agregando res = <Ei: 0<=i<pos:A[I] = 0> ^ 0 <= pos <= N 
Sale de trabarnos a la hora de querer aplicar HI ^c1dyRl7M

Técnica 4 (opcional) — Debilitamiento (cuando tenés demasiada info)
    Contrario de la tecnica 3. Si I es demasiado fuerte y NO puede valer durante el ciclo -> quito info.
    Incluye partes de Q que no valen en el ciclo.
    Ejemplo:
        Q = Max (A)
        Si uso como invariante:
        Res = Max {A[I]...A[N-1]}
        es muy fuerte, ya que llega hasta N, no garantiza resultados intermedios
        Debilitamiento:
        I : Res = Max {A[i]...A[Pos-1]} ^fFqUfv59

  ^wPD1OEDi

) P => I
3) {I ^ B} S {I} 
(el 3, es lo mismo
 que hacer wp.s.I) ^hyrbPgYq

Pasos generales para una derivacion:
1. Proponer una estructura inicial 
{p} s {q} y decir que S es el programa a encontrar. Con P y Q Correspondientes.
    Notar que hay variables que no hay en la pre, y si en la pos. Además, en algun lado se tiene que guardar la respuesta.
    proponer tales variables. "Normalmente termina en un rango vacio" (A priori puede no verse, habría que forzarlo)
2. Si tenemos un ciclo, escribir la estructura del mismo, y proponer un invariante con su guarda B (Suponemos que es HIP). Aplicando alguna técnica de invariante.
        "Necesitamos un ciclo si o si. Aplicamos ${Tecnica de invariante} con el ${Remplazo correspondiente}.
            INV = rest = {inv} y B = {res de b}"     
    2.1 Una vez encontrado, busco un B para que implique la demostracion de  I ^ -B => Q. 
            B se elige para que Q quede adentro de I ^ -B, ej: Q: Pos = N, B debe ser Pos != N. 
3. Una vez encontrado un invariante y una guarda B, encontrar y demostrar cada sentencia.
    3.1 {P} S1 {Inv} -> con wp.s1.inv (Lo logico, "ah, en me faltan estas variables, las inicio tal y tal")
    3.2 {Inv ^ B} S2 {Inv} -> con wp.s2.inv (Lo logico, "Ah, el ciclo debe avanzar, y el resultado cambiar parcialmente")
        -> Se asignan variables Iniciales := E, F, con el tiempo te das cuenta que cambiar a otras variable)

Nota: Si replanteo el invariante, debo de replantear todo el programa de nuevo
 ^jZRkReV3

Las derivaciones de ciclos deben cumplir
P => I
I ^ B => wp(s2)(i)
I ^ -B => Q ^s8M8SgTN

Terminacion de ciclos (Funcion de cota) ^u4LlP9uf

La guarda "B", sería la parte que falta para llegar a Q en la invariante. Entonces, la encontramos preguntandonos:
"Si para demostrar que I ^ B => Q, ¿Si ya tengo la invariante, que me falta en B para llegar a Q?
La parte de la invariante que “todavía no cumple Q” determina cuál debe ser B, que en parte, "sale del fortalecimiento del invariante" ^Fb8xs6t9

Respecto a la guarda B: ^8ESlGOGY

Ciclos anidados ^qTv07VYn

Implican ejercicios: 
Contar pares (i,j), sum doble, comparacion de arreglos, busqueda de duplicados, productos cartesianos, mcd anidado, algoritmo de division (anidado), max diferencia, dos elementos suman X
Los ciclos tienen invariantes independientes. Con su propia variable de progreso, su propia guarda B, invariante y cota.
    -> El invariante extero no dice nada del invariante interno. El interno no dice nada del externo ^lIu8icq7

Cada iteracion del invariante externo, debe restablecer el invariante inicial del interno.
un ciclo interno nunca depende del resultado final del ciclo externo, solo depende del valor actual de sus variables internas + la parte de Iext que lo afecta.
"O sea, a los ojos del programa S3, pos y res pueden ser vistas como constantes" -> Podemos aplicar tecnica de remplazo de constante por variable ^4q8EdsXG

cuidado con el tipo de Res,que debe
seguir el neutro de la cuantificacion. EJ:
Si tenemos Res = <Sum> -> Res es tipo INT
Si tenemos Res = <A,E> -> Res es tipo Bool
etc ^viA3Ty1B

{P1}
S1 ;  -- inicialización del ciclo externo
{Inv}
Do B →
    {Inv ^ B}
    S2   -- inicialización del ciclo interno
    { INV2 } 
    do B → 
        { INV2 ∧ B2 } 
        S3 ;  -- cuerpo del ciclo interno
        { INV2 } 
    od 
    S4 ; -- actualización del externo
    {Inv}
od 
{ Q2 }
 ^VSXJPoxd

2. Elegir Iext generalizando Q sobre la variable externa. ^OupWuhb6

3. Elegir Bext tal que Iext ∧ ¬Bext ⇒ Q. ^X0IChFLs

4. Encontrar S1 tal que {P} S1 {Iext}. ^52UoH5ya

5. Derivar ciclo interno: ^Xu3Wq0iq

(a) Elegir Iint generalizando Q(o Iext) sobre j. ^YubDbZ70

(b) Elegir Bint tal que Iint ∧ ¬Bint ⇒ Iext. ^grQuLtIh

(c) Encontrar S2 tal que Iext ⇒ Iint. ^AHV0WyiA

(d) Derivar preservación interna: {Iint ∧ Bint} S3 {Iint}. ^4nUoku1O

(e) Demostrar finalización interna: Iint ∧ ¬Bint ⇒ Iext. ^KxghR0jB

6. Encontrar S4 tal que {Iext ∧ Bext} S4 {Iext}. ^ditO72wb

7. Finalización externa: Iext ∧ ¬Bext ⇒ Q. ^1K3Rcxm1

La función de cota es una función que me calcula un número entero a partir de mi estado (o sea a partir del valor de las variables y constantes en un punto determinado de la ejecución). Llamaremos t : Estado → Int a la función de cota. ^31tky6P9

Para poder demostrar que el ciclo termina, vamos a tener que demostrar dos cosas acerca de la función de cota en relación al ciclo: 
    iv.a) Si estoy en el ciclo, la cota es ≥ 0. 
    INV ∧ B ⇒ t ≥ 0 
    Equivalentemente,
    si la cota es < 0, entonces el ciclo termina (version contrarecíprocca). INV ∧ t < 0 ⇒ ¬ B 

    iv.b) La cota se achica en cada ejecución del cuerpo del ciclo. 
    Formalmente, { INV ∧ B ∧ t = T }       // fijo el valor la cota antes de ejecutar el cuerpo
                         S                 // cuerpo del ciclo 
                 { INV ∧ t < T }           // al terminar, la cota vale menos de lo que valía antes

Si lo logramos demostrar i) y ii), sabremos que el ciclo termina siempre. ¿Porque? No importa cuánto valga la cota, por ii), se va a achicar siempre que se ejecute el cuerpo del ciclo. Luego, sí o sí, en algún momento se va a hacer negativa, y por i), sabemos que si la cota es negativa el ciclo termina.
 ^SLytjfWz

Sigue los pasos: ^wC9WUcTd

1) deduccion de cota ^40LCwZnM

2) Demostracion formal de la cota (inv ^ b => t>=0) ^SCU7rlsm

iv.b) La cota decrese (ej):
{ INV ∧ B ∧ t = T } 
res, pos := res + A.pos , pos + 1 
{ INV ∧ t < T } 
Acá, sabemos que pos crece en el cuerpo del ciclo, luego la cota podría ser de la forma: t = “algo” - pos
iv.a) INV ∧ t < 0 ⇒ ¬ B, 
o sea: 
(res = 〈∑ i : 0 ≤ i < pos : A.i 〉 ∧ 0 ≤ pos ≤ N) ∧ t < 0 ⇒ pos ≥ N <- O sea, debo elegir “algo” tal que “algo” + 1 ≤ pos ⇒ pos ≥ N (o sea N ≤ pos
En fin, luego de toda esta deducción, 
la función de cota que me sirve es: 
    t = (N - 1) - pos
 Otra cota que también sirve: 
    t = N - pos (sale a partir de ver 
iv.a como INV ∧ B ⇒ t ≥ 0) ^chzcGGm1

iv.a) INV ∧ B ⇒ t ≥ 0 (No negatividad) ^jSzq77xH

iv.a) {I ∧ B ∧ t = T } S {t < T } (Usa WP, demuestra decrecimiento) ^VzVfqkbR

Observaciones: 
    ● La función de cota no es única y es no negativa
    ● La cota depende SOLO de variables que cambian en el cuerpo del ciclo
    ● Siempre que recorramos un arreglo de izquierda a derecha, la cota va a tener esta misma forma. 
    ● Demostrar los requisitos de la cota formalmente es un poco burocrático para lo obvios que son. 
    ● Muchas veces para la cota admitiremos explicaciones con palabras en lugar de demostraciones formales.
    ● En particular, si tengo una función de cota t correcta, también valen como función de cota todas las funciones t’ = t + C 
    (a donde C > 0 es una constante cualquiera). Porque decrecer y ser no negativa se conserva cuando sumás una constante.
    ● Mirar especialmente la guarda y el cuerpo del ciclo para determinar la cota. (el INV también ayuda) 
    (Ya que decrece para cortar el ciclo). Ej T = n en este caso ^j3Vx23CP

Problemas de bordes ^ulnco4sW

Terminación anticipada de ciclos ^IhBvclz1

Surje de la necesidad de fortalecer el invariante con algo extra, y ese extra, se pasa de posiciones ^JYl7XRPy

INV’ ≡ INV ∧ sum = ⟨∑ j : 0 ≤ j < pos : A.j ⟩ (Bien, llega a A.(n-1) ^5mGZOXE2

INV’ ≡ INV ∧ sum = ⟨∑ j : 0 ≤ j < pos + 1 : A.j ⟩ (MAL, LLEGA A.N) ^hqkOFYhP

No te das cuenta a nivel Derivacion (termina en true), ya que te das cuenta que haces algo mal tras analizarlo (ver la posicion) ^DAjPIxes

el problema puede surgir de trabajar con: ^5jUZCu4o

Segmentos iniciales.
Segmentos Arbitrarios. ^dHj4baom

Sintaxis, sentencias, expresiones, funcionamiento ^mJUNLxiE

Wp, Demostracion Y derivacion ^aoG3g4T1

Es como un fortalecimiento de guarda. B’ ≡ B. Sigue haciendo la misma demostracion del cuerpo de un ciclo.
Es cuando el ciclo no necesita recorrerse completo para garantizar Q, porque Q se vuelve verdadero antes de que B se haga falso.
 
¿Existe una condición C tal que, si se cumple dentro del ciclo, Q ya es verdadero sin seguir iterando?”

Hay terminación anticipada cuando la postcondición Q puede volverse verdadera antes de que la guarda original B sea falsa.
Esto ocurre cuando Q admite un “caso corto” (existencial, disyunción, caso trivial, propiedad irreversible).
En tal caso, se puede fortalecer la guarda como:
B' = B ∧ C
donde C captura la condición que hace verdadero Q antes de tiempo.

Patrones para obviarlo:
    1.Si la post condicion usa un OR, un existencial (∃) o un caso trivial, suele haber terminación anticipada.
        Ejemplo:
            (res = True) ⇔ (existe un j tal que A[j] = 0)
            Si se cumple que A[pos] = 0 entonces si termino, y no hace falta seguir recorriendo. Se puede cortar el ciclo.
            -> B' = pos ≠ N ∧ res = False 

    2.Cuando el invariante “colapsa totalmente” al volverse True/False      
        Ejemplo:
            I ≡ r = ( ∃ k < pos : A[k] = 0 )
            Si pasara que A[pos] = 0, inmediatamente r = True.

    3. Cuando Q depende de una propiedad MONOTÓNICA
            Una vez algo en Q se vuelve verdadero, no puede volverse nunca mas falso
            "Encontrar un elemento que cumple P", "r>=1", "minimo de arreglo"
    
    4. Cuando el cuerpo del ciclo tiene un “punto de no retorno”
            Si una sentencia del ciclo tiene algo como if condicion -> res := True
            claramente res no se vuelve a modificar, garantizando Q, cortar el ciclo es seguro.

    5. Cuando Q es un “FALSE case” trivial
        Si buscas un elemento menor a 0, pero el arreglo está ordenado. Trivialmente falso.
        Si encontras un numero positivo, no hay elementos negativos, se puede terminar anticipadamente.


Para decidir formalmente si se puede cortar antes. Tenemos que buscar un C tq:
(*) I ^ (-b v c) => q 
Con:
I ^ -b => Q (Falso)
I ^ C  => Q (True)
y C es lo que se agrega la terminacion anticipada.
Entonces (*) siempre es se da ya que logramos que la disyuncion siempre se de como True, y impliocaria que Q sea verdadera
 ^xWxGItJx


Requisito 1:
{ INV ∧ B } S1 { INV } (donde S1 es el cuerpo del ciclo) 
¿Vale con B’?: 
{ INV ∧ B’ } S1 { INV } 
Respuesta: Sí, si vale una terna, también vale cuando fortalecemos su precondición.

Requisito 2:
Ya habíamos demostrado: 
INV ∧ ¬B ⇒ Q ¿Vale con B’?: 
INV ∧ ¬B’ ⇒ Q ¡No necesariamente! 
Veamos: 
INV ∧ ¬B’ ⇒ Q ≡ 
INV ∧ ¬(B ∧ res) ⇒ Q ≡ 
INV ∧ (¬B ∨ ¬res) ⇒ Q ≡ 
(INV ∧ ¬B) ∨ (INV ∧ ¬res) ⇒ Q 
≡ (INV ∧ ¬B ⇒ Q) ∧ (INV ∧ ¬res ⇒ Q) 
La primera “INV ∧ ¬B ⇒ Q” ya la habíamos demostrado. 
Falta demostrar la segunda: INV ∧ ¬res ⇒ Q. 
Solamente hace falta demostrar: INV ∧ ¬B’ ⇒ Q. 
Ahora, sabemos que: INV ∧ ¬B’ ⇒ Q ≡ (INV ∧ ¬B ⇒ Q) ∧ (INV ∧ ¬res ⇒ Q)
 ^MkFHOunO

Ejemplo 1: El rango toca una posicion desconocida.
    Si tengo un inv que va de 0 <= pos <= N -> N es valido, N + 1 m no. 
    Si fortalezco ∑ j : 0 ≤ j < pos + 1, seria que j = pos -> a[pos] es valido si pos < n
    Ya que si pos <= n es valido, pero pos+1 <= n, no lo es -> problema de borde.
Ejemplo 2: El invariante no cierra con el paso del ciclo (I ^ B => wp(S2)(I))
    Wp exige una propiedad que no se puede demostrar con el invariante inicial -> se definio mal la definicion del rango.
    (pasa con pos+1, N+1, pos-1, j+1)
Ejemplo 3: Q presenta extremos distintos de I
    res = sum A[0...pos] (bien, pos validas)
    res = sum A[0...pos+1] (mal, pos invalida)
¿plantear ejercicios que llegan hasta el ante penultima posicion x ejemplo? q onda con eso aike fijate !!
 ^Si7J9FCg

Problemas de bordes ocurren cuando el invariante hace referencia a posiciones del arreglo que no están garantizadas por I.
La forma correcta de detectarlo es comparar los extremos del rango del invariante con las restricciones que I impone sobre la variable que controla ese rango. ^wj2uleuM

I: 0 ≤ pos ≤ N ^kPwZZOiC

Correcto:  ∑ j : 0 ≤ j < pos : A[j] ^KPebAIkq

Incorrecto: ∑ j : 0 ≤ j < pos+1 : A[j] ^qGGy1zAK

Incorrecto: A[pos] ^e9EpJaEQ

Incorrecto: A[pos+1] ^OFiQeSst

Pagina
165 De FL ^3aRboVaX

“Si el ciclo interno sólo tiene una variable de control, Y
su invariante no depende del índice externo de una forma ‘fuerte’ (no se reinicia per-iteración),
entonces a veces se puede aplanar metiendo la lógica interna en el mismo ciclo que el externo.” ^rPuiYqi7

En funcional, usas mas la forma uno.
En imperativo, usas mas la forma dos. ^CZRltABy

Testing: ^9hw2Vpwo

Testing: ^jdRtaFmf

Pasos más en limpio. O ejercicio ^tyC1MwIz

modelo PERFECTO ^hgJvfEVK

Manejo de rangos  ^qoBbhoJn

El testing en imperativo, se hace usando la misma especificacion.
Siempre tener en cuenta que tipo usa r o res:
si es bool -> operamos booleanamente. Devuelve un Bool
si es int -> operamos aritmeticamente. Devuelve un Int.
Ejemplo: ^4KiyInjC

 ^PQtmNgvD

<- Notar que no usa el rango, directamente
opera con el término. Usa Q ^E8c478sy

Todo: ^7DYp5HBM

El testing en funcional, se hace usando el PROGRAMA obtenido en la derivacion.
Tener en cuenta que tiene que ser del tipo del cuatificador
si es bool -> operamos booleanamente. Devuelve un Bool
si es int -> operamos aritmeticamente. Devuelve un Int.
Ejemplo: ^Xn9QikUk

En funcional el testing SIEMPRE se hace expandiendo la definición del programa, 
porque el programa es recursivo y se analiza estructuralmente. ^fWrzMxuY

El testing imperativo NO usa el programa ni el cuerpo del ciclo. Solo se evalúa Q con los valores concretos, enumerando el rango ^gAor8uXS

NO utiliza invariantes ^5MIl80U2

(el "E" solo existe en HI. 
Pero la esp. tiene n) ^QSEgxSSe

(checkiar mas los pasos) ^qk3tlYiQ

(inv débil) ^GkBPv5OZ

(inv fortalecido)  ^2NtWchx5

Notar que el término está con una igualdad.
y aparece el inv original ^5hl8lvT-vMFFrySlYyG6r

Notar que el término está con una igualdad.
y aparece el inv original ^1JPxppsI

## Embedded Files
29f3109434c6eb3ffae6efb9b1fd59c271c7d88c: [[Pasted Image 20251123114601_400.png]]

6d555e6deeb6e1273af3d0eb63ff0a839275e2be: [[Pasted Image 20251123114646_803.png]]

e8d207798eb0b1f4a4dac1a1fed0ba93a63183fc: [[Pasted Image 20251123114735_029.png]]

4d676d5a6c824ef4ef11c655651e7c6ce338eb32: [[Pasted Image 20251123131651_122.png]]

c0b198d5af3ed29304b7224e7cd2830a809720c3: [[Pasted Image 20251123131702_589.png]]

d7ea82e2183e42d41197aca91c2d146ecca6e099: [[Pasted Image 20251123132607_375.png]]

a23ddae4a505dbbb15976519c5d9a378ae8c1e8e: [[Pasted Image 20251123132927_768.png]]

26b1fff0bb33694eeeffd935c30e613fb3d68879: [[Pasted Image 20251123133223_925.png]]

d9db9321acb7a9024a9f269c6aef6c47fd08669c: [[Pasted Image 20251123135528_709.png]]

fc6df54737aedde536cb15e0788de0fa0d944c48: [[Pasted Image 20251123135803_325.png]]

3796de6c6c3460b9e53d901986ecd5681b16c341: [[Pasted Image 20251123140445_966.png]]

bb671504529f5df41adbd7c6602df43db33f183e: [[Pasted Image 20251123140920_360.png]]

3c6dbc25be95ff2fac4ac530f086c0ae55a85bf8: [[Pasted Image 20251123141154_589.png]]

d97b08cc6a9c543cdb0cbe6b1477bb3551485057: [[Pasted Image 20251123141249_987.png]]

324cf3b0f7267618e655d38e82b01ceb10568f67: [[Pasted Image 20251123141835_814.png]]

c2968a990852962af4533b6e8f6cf8dd7130a5b8: [[Pasted Image 20251123142438_313.png]]

ed84699ea628d8ae90a05576bcb55b724f0e86b6: [[Pasted Image 20251123143422_744.png]]

7c22af033693966cc2db2614c893e5c80afe41d0: [[Pasted Image 20251123143526_306.png]]

d11e0494bb2274224dce16867321b291a2e31d16: [[Pasted Image 20251123144058_763.png]]

f41568c31cadf886ba81f97f7f4a25fe9c1c020b: [[Pasted Image 20251123145320_761.png]]

95593832ab329e75c2ba8bb801282c6e482a9292: [[Pasted Image 20251123150203_513.png]]

849bdc67a66d623e1481e7dd8ffae9dbf1077780: [[Pasted Image 20251123150447_059.png]]

32edf6e178cf2c54ed5a416d1ea947a23e041633: [[Pasted Image 20251123150856_311.png]]

fcded6d1a24c85a7d2eb80d8bbe490c7f52397f7: [[Pasted Image 20251123150930_952.png]]

a7003a0aba85f280f1702cbf3f62b88c0b20120e: [[Pasted Image 20251123150951_811.png]]

ada389788c55d3c842654d929b9dee136f8d18c7: [[Pasted Image 20251123162835_324.png]]

72c721a48f2228dea517897a4e0032c975316b18: [[Pasted Image 20251123162906_344.png]]

96b2a4afc22a6841545168d57b763a517474a604: [[Pasted Image 20251124130348_422.png]]

0262b457feb81d2769a7e66d9cb07990e01eeb26: [[Pasted Image 20251124130429_575.png]]

be1f3ada10c7a2f9e90abf961bf95bef49122207: [[Pasted Image 20251124140745_030.png]]

35a0ad6684464da682e0e39aef147c3c895ad467: [[Pasted Image 20251124145607_237.png]]

e5609764a457a34b5f3daa72b428087f3373b106: [[Pasted Image 20251125170505_070.png]]

9dd2d94049b3373d40a55d4385b3f58126e3f54e: [[Pasted Image 20251126083601_191.png]]

b2fccf8721f76adf0051af721b0c62b12368c032: [[Pasted Image 20251126090946_929.png]]

cfe2f094b5f38a32bfead7f2d4ac0f5da63272a7: [[Pasted Image 20251126090958_815.png]]

047fcff8ab7fe50c2f9182527cb5c8eafa36e169: [[Pasted Image 20251126091003_201.png]]

c7a9aef6b206102788ce269ade175824cb789001: [[Pasted Image 20251126092039_794.png]]

d864d6813114dceebf3a46010c6b702125a8f275: [[Pasted Image 20251126105130_749.png]]

6a3853a87e334dec970081f1bb6b880c2a15dd44: [[Pasted Image 20251126105814_980.png]]

6fc295fdd6a4c65533b2fd000760d4eb635fb087: [[Pasted Image 20251126105859_832.png]]

7f7fd359ca7c1c23182669cbe761a8da960c0e77: [[Pasted Image 20251126110051_460.png]]

f5f8ff9d630fce1fca3ad440abf6f1a3e401a0d9: [[Pasted Image 20251126110351_805.png]]

cadcfb0caa59517489d521a88c1e4c958afeb19d: [[Pasted Image 20251126113840_629.png]]

dce32f8b497ee7352b33e69db47f6ae8c587ffcf: [[Pasted Image 20251126114505_588.png]]

b40868ae91e7540e24a1ca10f4a069281c55f55b: [[Pasted Image 20251126114524_317.png]]

36e0de2165e7cfc2c8ac4dbdef84ded833e730f4: [[Pasted Image 20251130113151_175.png]]

ba47e22bcdf492a3e91f2381d0ad1e364bc1bf7b: [[Pasted Image 20251201075132_939.png]]

4dc3d87ad19c7d2b26971d86c59a6b578bc3f613: [[Pasted Image 20251201104402_563.png]]

4585d153eeab2811b17a9f25cd3cd482f3536c66: [[Pasted Image 20251201110011_664.png]]

35f9e820a439c2f2a82805401a7a84bba96fd565: [[Pasted Image 20251206145751_915.png]]

5c503877d9da6d159d164b8868ff0df9a7d549fc: [[Pasted Image 20251206145826_606.png]]

fd16b885ea1ae17a3244c66547304ef989343fb4: [[Pasted Image 20251206145909_939.png]]

342331f0bc68f82155eaf19bc1960479eb3b15bd: [[Pasted Image 20251206150452_844.png]]

b66a488d8abb7ec2738b6b08775165200bbbb7ab: [[Pasted Image 20251206151614_072.png]]

ad7dcb69b25afe905b8bce9f805aec6eb223dcda: [[Pasted Image 20251206151840_945.png]]

1afdcd0f5bd7f64651986df74c338079ae9a6d93: [[Pasted Image 20251206151954_523.png]]

f3d6fcd5388d3e41e71e0213a936eb32a4245637: [[Pasted Image 20251206152052_229.png]]

c8306fab9d6ac7701df99a57c25aaec4c48e42d6: [[Pasted Image 20251206154433_807.png]]

e278559d0f64c727030d9ebb4d7f1c3cfc5ee20d: [[Pasted Image 20251206154525_226.png]]

3f835f3dd6fc7a39c4bbc73178239e8ace8f094b: [[Pasted Image 20251206154628_923.png]]

%%
## Drawing
```compressed-json
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
```
%%