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

%%
## Drawing
```compressed-json
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

E3QfiAgAA===
```
%%