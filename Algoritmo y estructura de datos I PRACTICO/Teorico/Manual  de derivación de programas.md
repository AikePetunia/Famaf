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

me da miedo q me tomen un rango
de la manera
0<=i<=j<#xs ^SmyHJqCT

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

ODwNkiSiA5ItE95qW5IiGcVSItI8ci66Qrg9EiDSJVI8UiBLilIjjDS2WKIOUiFSJCAd4hlSMLIt8jayJfIt0jtSLj7R0iBLnVI28jNSKNI1bJTSKn5CCjgKKtIlUjbSOqZNMimqCdIjgA6yLvIhsivSNFIlsj4KH9Ik3EgyKbwEMicKKWLCMjBT00AS8iMPUwZVBgudHjIq5DBtSTI/KBHF3Qoh1dMyJJAbMiBDQGLBMj/mSrI2UcgKK50DE4yQ

C0Alw9c4AEo0gUgKOzApsjSBQdXT0i0KLdIgij76C0lackc8XO+VFUVUGbA6WssrxqIkJtuCK30TsiQSPLgMEiIL2xIqEjoDQHIoLQje2HI+59TmX9Ih8jR4inInsjgwKxIuciadTxItWMlyKBIIkj6KFXIvDFySM3It29DoN3I/et9yOxSQ8iuyN4AVkiqKJoovrcbyPrIgS5HKMnIgO9nyI1I6sjpKI/IgbsZSO/Iy3R5SLykP8iNDXSowSiLS

Kgo0UiwKLjWPUjIKJAoxsiTSLNI2y1SqNhDa0jUKNkohCiGqMwo7CjCyPkoxsj8KPTIj0j4dWIokFlSKMSokgs9dS40KMjOSIipeij4dUYo89DIZRFYFMigTzaojPAMyPh1LMjtzVzIkwt1C0kosUiOKPh1ESiyyPEohAAdqJrImSiRqIUo1qjlKLbI5zco1y6Imhc1YEeATJpxIGqAQh4NwKXhO5BPkCNHJdEdth14PCZpIiO8AnIyoLUUJXwQe

lKaJ1oXsQBJOIAWbA2BErA9lmB/Rd8ZFyfHd/DDiIRBIYDLf34/JwjBP0FXYT9K+h4AYEdPCLxBAKAWzyX+LClGvxrEXdNW8O9A/H9t/1ucAzUnr0pxVh10mFWAb9cOILHUNOAKKHWZVwDX8DogJQtWsJNbQX0JdQAMfXl4TywIGJ1Q33pNX0MvKF9DQhg9iQh0W5lj1Fsbd416KDkAowBeb37AmkDCwOCgqTA5mDOka2haKHForyhcAFyAXrRIC

BlogNguaF0Nf2APdWyfVw9CXXYMRKR7KF3vFJDmACPUek0mINaYdJghQXIgraDBoND/Q21O7miouxsRUyILfxZvkKbjZ8gLGF/NWFlCs0gORyhos1hZECh8vQSImyhG4k8tIm19LUslHNC6X2PjcOjk21n7Z+M48D/tagYpcWwoaW0j+mbg1x1w7wftUeJetGQMMHRj1F60NYBc8C6QI9QXjTzuIkw0AHswvZlrIIDjePVuGBSwJdQwQzokNR1W6

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

kDAYAAd0H4gIAA==
```
%%