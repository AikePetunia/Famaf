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

57ab8c1a6517a4fc35c6b2aa67758d6f4f95b297: [[Pasted Image 20251207095825_850.png]]

%%
## Drawing
```compressed-json
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
```
%%