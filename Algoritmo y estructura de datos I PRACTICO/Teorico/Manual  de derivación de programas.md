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
    Puedo elegir que una parte sea el INV y que otra parte sea ¬B. En ese caso tendría garantizado el requisito iii)
Ejemplo:
    Si tengo que Q = <Sum i : 0<= i < N: i> La postcondicion no puede entrar ya que mientras I < N, faltaría el que hacer. Pero, sabemos que puede aumentar por posicion, ->
    I = <Sum i : 0<= i < pos: I> ^ 0<= pos <= N. Podemos decir asi que, I "Es la suma parcial", y Q "La suma completa".
     ^dHasY4ap

Técnica 2 — Mirar el cuerpo del ciclo y encontrar una propiedad que NO cambia (Reemplazo de constantes por variables)
    A veces Q sugiere una propiedad que no depende del índice. Como que "x*y queda constante".
    Normalmente se usa en problemas aritmeticos. Y es la tecnica mas usada.
    Q habla de valores inciales X, Y. Antes del ciclo x = X, y = Y. En el ciclo NO forman parte.
Ejemplo:
    






Sabemos que tomar el MCD(X,Y) = MCD(x,y)
Tomamos ambas guardas, y aparece explicito en Q. Entonces, la inv quedaria como:
I: x > 0 ^ y > 0 ^ mcd(x,y) = mcd(X,Y). 
 ^rrfQwRiC

Técnica 3  — Fortalecimiento del invariante. (Nos hace pasar un problema de 2 ciclos, a uno solo)
    Es agregar informacion cuando I no alcanza. Es definir mejor la invariante tambien.
    Surge de que I ^ B => wp.s2.I no funciona por que I es débil. Nos queda como un subproblema ahí dando vuelta, y debemos agregarlo a la HI.
    Ejemplo:
        Si tengo Q: res = <Ei: 0<=i<N:A[I] = 0>
        entonces, tengo creo un I debil:
        I: res = <Ei: 0<=i<pos:A[I] = 0>
        Cuando quieras hacer I ^ B => Q, pos te puede quedar fuera de rango.
        Entonces, fortalecemos, agregando 
res = <Ei: 0<=i<pos:A[I] = 0> ^ 0 <= pos <= N  ^c1dyRl7M

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
    proponer tales variables. "Normalmente termina en un rango vacio" (A priori puede no verse, habría que forzarlo) Tener en cuenta los problemas de segmentos, tienen paso extras.
2. Si tenemos un ciclo, escribir la estructura del mismo, y proponer un INV con su guarda B. Aplicando alguna técnica de invariante.
        "Necesitamos un ciclo si o si. Aplicamos ${Tecnica de invariante} con el ${Remplazo correspondiente}.
         INV = rest = ${inv} y una guarda B = ${b}", que implique la demostracion de  I ^ -B => Q. 
3. Una vez encontrado un invariante y una guarda B, encontrar y demostrar cada sentencia (Inicializacion, cuerpo del ciclo).
    3.1 {P} S1 {Inv} -> con wp.s1.inv (Lo logico, "Notemos que faltan estas variable, las inicilizamos y propongo r,pos := E, F")
    3.2 {Inv ^ B} S2 {Inv} -> supongo Inv ^ B, con wp.s2.inv (Lo logico, "Ah, el ciclo debe avanzar, y el resultado cambiar parcialmente")
        -> Se asignan variables Iniciales := E, F, con el tiempo te das cuenta que cambiar a otras variable)

Nota: Si replanteo el invariante (Ej, reforzamos), debo de replantear todo el programa de nuevo
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
    iv.a) Si estoy en el ciclo, la cota es ≥ 0. INV ∧ B ⇒ t ≥ 0 
    Equivalentemente, si la cota es < 0, entonces el ciclo termina (version contrarecíprocca). INV ∧ t < 0 ⇒ ¬ B 

    iv.b) La cota se achica en cada ejecución del cuerpo del ciclo. 
    Formalmente, 
                 { INV ∧ B ∧ t = T }       // fijo el valor la cota antes de ejecutar el cuerpo
                         S                 // cuerpo del ciclo 
                 { INV ∧ t < T }           // al terminar, la cota vale menos de lo que valía antes

Si lo logramos demostrar i) y ii), sabremos que el ciclo termina siempre. ¿Porque? No importa cuánto valga la cota, por ii), se va a achicar siempre que se ejecute el cuerpo del ciclo. Luego, sí o sí, en algún momento se va a hacer negativa, y por i), sabemos que si la cota es negativa el ciclo termina.
 ^SLytjfWz

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
    (Ya que decrece para cortar el ciclo). Ej T = pos en este caso
    ●la función de cota es una cosa que inventamos para demostrar que el ciclo es correcto, pero no es parte del programa ni del lenguaje de programación ^j3Vx23CP

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
 
"¿Existe una condición C tal que, si se cumple dentro del ciclo, Q ya es verdadero sin seguir iterando?”

Hay terminación anticipada cuando la postcondición Q puede volverse verdadera antes de que la guarda original B sea falsa.
Esto ocurre cuando Q admite un “caso corto” (existencial, disyunción, caso trivial, propiedad irreversible).

En tal caso, se puede fortalecer la guarda como:
B' = B ∧ C
donde C captura la condición que hace verdadero Q antes de tiempo.

Para decidir formalmente si se puede cortar antes. Tenemos que buscar un C tq:
I ^ (-b v c) => q 

Lease como un "El ciclo termina o por que terminó b, o por que se cumplio C".

También como alternativa y más facil:
1. Demostrar que vale Inv ^ -B => Q termina el ciclo (Vale)
2. Demostrar que vale Inv ^ C => Q termina el ciclo (Vale) (normalmente se empieza a demostrar desde Q)

esto si implicaria:

Inv ^ (-b v c) => Q  ^xWxGItJx


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

usado más en funcional ^sYMP3LPx

usado más en imperativo ^RFsMWTM8

Deducción de cota ^qKMWSpqs

Demostración de cota ^9MdIMx5J

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
 ^fhxUW9Tb

No volvemos a demostrar Inv' ^ B => Q ya que:
Si vale una terna, también vale cuando fortalecemos su precondición. ^8XlfFAmf

ver pagina  14 FL ^VokXMU5l

me da miedo q me tomen un rango
de la manera
0<=i<=j<#xs ^SmyHJqCT

ver clase aike !! ^EdXabUxR

checkiar este paso aike.
Por que se puede hacer por matetica
o por hipotesis su eliminacion) ^BE9iRnO9

Caso particular: ^oaP9bu3I

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

27ae75a647911b5c411c351c47b6d90bc873bc70: [[Pasted Image 20251208074114_299.png]]

04220815d426994c0e8e711b6c23f0de88cde2d5: [[Pasted Image 20251208074131_760.png]]

b0ac36c295386df2453a05627cf523ddbffe76c6: [[Pasted Image 20251208074258_512.png]]

0e220ddaecf04ee770a23bd3d5e6f278b82db846: [[Pasted Image 20251208080652_095.png]]

cbfe4820945c32fafb26323c38d93cf1ca3e9705: [[Pasted Image 20251209072336_713.png]]

4bf92a77c338fcf4a033ad1fb8c4519a8ecb7617: [[Pasted Image 20251211063638_207.png]]

7a17ea35b2d34f20236266d508d111f8f7d6c300: [[Pasted Image 20251211072253_432.png]]

8f2531eefd64cc405b3e752fd0cea39f305f4ed9: [[Pasted Image 20251211073452_624.png]]

9cb55697a09e1d15cd4a4a5eed40724d8b4619d1: [[Pasted Image 20251212101515_833.png]]

afb431a236aebab4bf64a7f840db1de9ea1a3377: [[Pasted Image 20251212111129_452.png]]

%%
## Drawing
```compressed-json
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
```
%%