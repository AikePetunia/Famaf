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
    Es agregar informacion cuando I no alcanza. Es definir bien la invariante tambien.
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

“Si el ciclo interno sólo tiene una variable de control, Y
su invariante no depende del índice externo de una forma ‘fuerte’ (no se reinicia per-iteración),
entonces a veces se puede aplanar metiendo la lógica interna en el mismo ciclo que el externo.” ^rPuiYqi7

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
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
```
%%