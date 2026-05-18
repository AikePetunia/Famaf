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
Semántica de arreglos: 
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

El do en demostraciones y Invariantes: ^CttWw2Ph

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

Técnica 2 — Mirar el cuerpo del ciclo y encontrar una propiedad que NO cambia (Reemplazo de constantes por variables) - el más usado
    A veces Q sugiere una propiedad que no depende del índice. Como que "x*y queda constante".
    Normalmente se usa en problemas aritmeticos. Y es la tecnica mas usada.
    Q habla de valores inciales X, Y. Antes del ciclo x = X, y = Y. En el ciclo NO forman parte.
Ejemplo:
    






Sabemos que tomar el MCD(X,Y) = MCD(x,y)
Tomamos ambas guardas, y aparece explicito en Q. Entonces, la inv quedaria como:
I: x > 0 ^ y > 0 ^ mcd(x,y) = mcd(X,Y). 
 ^rrfQwRiC

Técnica 3  — Fortalecimiento del invariante. (Nos hace pasar un problema de 2 ciclos, a uno solo)
    Es definir mejor la invariante tambien.
    Surge de que I ^ B => wp.s2.I no funciona por que I es débil. Nos queda como un subproblema ahí dando vuelta, y debemos agregarlo a la HI.
    Ejemplo:
        Si tengo Q: res = <Ei: 0<=i<N:A[I] = 0>, entonces, creo un I debil:
        I: res = <Ei: 0<=i<pos:A[I] = 0>, Cuando quieras hacer I ^ B => Q, 
        pos te puede quedar fuera de rango. Entonces, fortalecemos, agregando 
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

Pasos generales para una derivacion: (MEJOR VER ESQUEMA DE DERIVACION IMPERATIVA.MD )
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
    iv.a) Si estoy en el ciclo, la cota es ≥ 0. INV ∧ B ⇒ t ≥ 0 (No negatividad)
    Equivalentemente, si la cota es < 0, entonces el ciclo termina (version contrarecíprocca). INV ∧ t < 0 ⇒ ¬ B 

    iv.b) { Inv ^ B ^ t = T} s2 {t < T} - (La cota decrece)
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

Es bastante intuitivo con la practica, te das cuenta que tendrás un problema de borde cuando estas terminando una derivacion, y ves que tenes en el rango que llega hasta pos + 1, y no hasta pos. ESO es un problema de borde.
Siempre te pasara cuando estes en el cuerpo del ciclo, trabajando con rangos.
 ^5jUZCu4o

Sintaxis, sentencias, expresiones, funcionamiento ^mJUNLxiE

Wp, Demostracion Y derivacion ^aoG3g4T1

Es un fortalecimiento de guarda. B’ ≡ B. Sigue haciendo la misma demostracion del cuerpo de un ciclo.
El fortalecimiento solo existe si r es tipo Bool. Para cosas como max, min no existe (necesita iterar todo el arreglo para encontrar el max, min)
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
    Si tengo un inv que va de 0 <= pos <= N -> N es valido, N + 1, no. 
    Si fortalezco ∑ j : 0 ≤ j < pos + 1, seria que j = pos -> a[pos] es valido si pos < n
    Ya que si pos <= n es valido, pero pos+1 <= n, no lo es -> problema de borde.
Ejemplo 2: El invariante no cierra con el paso del ciclo (I ^ B => wp(S2)(I))
    Wp exige una propiedad que no se puede demostrar con el invariante inicial -> se definio mal la definicion del rango.
    (pasa con pos+1, N+1, pos-1, j+1)
Ejemplo 3: Q presenta extremos distintos de I
    res = sum A[0...pos] (bien, pos validas)
    res = sum A[0...pos+1] (mal, pos invalida)
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

(inv débil) ^GkBPv5OZ

(inv fortalecido)  ^2NtWchx5

Notar que el término está con una igualdad.
y aparece el inv original.
Te das cuenta que necesitar fortalecer si hay una 
especificacion dentro de una especificacion ^1JPxppsI

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

Caso particular: ^oaP9bu3I

Ejemplo, si tenemos un rango que sea de la forma:
<...: xs = as ++ bs ^ ys = as ++ cs:...>
la derivacion cambia, ya que sería el programa como:

p.[].ys
p.(x:xs).[]
p.(x:xs).(y:ys) ^mjYJH01G

Programa final: ^4V4i3pkB

Programa final: ^zLogRHPQ

El término se expande recursivamente. ^V6bVhxtI

obsidian://open?vault=Famaf&file=Algoritmo%20y%20estructura%20de%20datos%20I%20PRACTICO%2FTeorico%2FEsquemas%20derivacion%2C%20imperativo ^5INVygqh

(MEJOR VER ESQUEMA DE DERIVACION IMPERATIVA.MD ) ^V6rlev9Q

Recordar, arreglos llegan hasta N) , no N] ^W6YVcf7B

Pensarlo como una caja de herramientas.
Vos defini que necesitas "x" herramientas, y es lo que 
usaras a la hora de derivar. No podes ni deberias tener
herramientas demás, solo lo justo y necesario. ^okAh0rEn

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

7a17ea35b2d34f20236266d508d111f8f7d6c300: [[Pasted Image 20251211072253_432.png]]

9cb55697a09e1d15cd4a4a5eed40724d8b4619d1: [[Pasted Image 20251212101515_833.png]]

afb431a236aebab4bf64a7f840db1de9ea1a3377: [[Pasted Image 20251212111129_452.png]]

b8be549c81f157413d910fd23caba507ace7e4e5: [[Pasted Image 20251215095516_026.png]]

2e7f33c2cb673fd3bf01f19d93c451ffd34e4b94: [[Pasted Image 20251215095723_089.png]]

490852be7fb9e85e8874eee0cd2eee93378b0676: [[Pasted image 20251215095948.png]]

43687f5a63c5679dd1bbccb2dbf1cb3ff97dd0a7: [[Pasted Image 20251215100008_343.png]]

714d4b6493340273dbf15ed625598bd8eb98b390: [[Pasted Image 20251215111403_297.png]]

%%
## Drawing
```compressed-json
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
```
%%