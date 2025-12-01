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

Técnica 3  — Fortalecimiento del invariante. (Nos saca los ciclos anidados)
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

En funcional, usas mas la forma uno.
En imperativo, usas mas la forma dos. ^CZRltABy

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

%%
## Drawing
```compressed-json
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

AA==
```
%%