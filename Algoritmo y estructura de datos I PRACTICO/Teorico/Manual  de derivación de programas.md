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
    La postcondicion Q, puede ser algo como Q = A ^ B ^ C. Pero mientras el ciclo corre, no pueden valera a la vez, por falta de informacion. Entonces, 
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

%%
## Drawing
```compressed-json
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
```
%%