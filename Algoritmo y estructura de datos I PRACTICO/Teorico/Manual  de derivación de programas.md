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

Var x, y : Int            <------ Declaracion de variables. Componen el estado: “x” e “y” de tipo Int.

Secuenciación: Usamos “;” para secuenciar una sentencia atrás de otra.

Asignación: Un tipo de sentencia que modifica determinados valores del estado. ^TjHarc2z

Arreglo:

Coleccion de datos del mismo tipo. Coleccion de valores ordenada y de largo fijo.
Sintaxis: Array[N, M) of <tipoX>
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

Anotaciones / Comentarios: // esto es un comentario   ^cAD17DTC

DEFINICIÓN: Llamamos precondición a la anotación de programa que usamos para describir el estado inicial, o sea la que ubicamos en el punto inicial del programa. ^GuNwouQx

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
Un predicado que siempre es verdadero antes, durante y justo después del ciclo.
que el ciclo mantiene una propiedad estable (preservación)
que cuando el ciclo termina esa propiedad + la condición de salida implican la postcondición Q ^ux1ABEum

el invariante conecta P con Q aunque haya un ciclo en el medio ^6xTAVMxL

El ciclo no usa el invariante, nosotros lo usamos para demostrar el ciclo ^IPo8QRij

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

Técnica 3  — Fortalecimiento del invariante.
    Es agregar unformacion cuando I no alcanza. Es definir bien la invariante tambien.
    Surge de que I ^ B => wp.s2.I no funciona por que I es débil. -B expresa lo que falta para llegar a Q, I lo que se garantiza en el ciclo.
    Ejemplo:
        Si tengo Q: res = <Ei: 0<=i<N:A[I] = 0>
        entonces, tengo creo un I debil:
        I: res = <Ei: 0<=i<pos:A[I] = 0>
        Cuando quieras hacer I ^ B => Q, pos te puede quedar fuera de rango.
        Entonces, fortalecemos, agregando res = <Ei: 0<=i<pos:A[I] = 0> ^ 0 <= pos <= N  ^c1dyRl7M

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
    proponer tales variables. "Normalmente termina en un rango vacio (A priori puede no verse, habría que forzarlo)
2. Si tenemos un ciclo, escribir la estructura del mismo, y proponer un invariante (Suponemos que es HIP). Aplicando alguna técnica de invariante.
        "Necesitamos un ciclo si o si. APlicamos ${Tecnica de invariante} con el ${Remplazo correspondiente}.
            INV = rest = {inv} y B = {res de b}"
            (El invariante es la "version parcial" de Q que puede valer antes de cortar.)
    2.1 Una vez encontrado, busco un B para que quede verdadera la demostracion de  I ^ -B => Q. 
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
Si tenemos Res = <A,E> -> Res es tipo Bool ^viA3Ty1B

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

Wp, Demostracion, derivacion ^aoG3g4T1

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

%%
## Drawing
```compressed-json
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=
```
%%