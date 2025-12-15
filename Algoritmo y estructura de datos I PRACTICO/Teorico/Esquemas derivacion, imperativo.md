Pasos mas formales:
1)
i) Notemos que la postcondicion Q, cuantifica sobre indices de arreglos, por lo tanto la derivacion necesita un ciclo. Para derivar algo con un ciclo, necesitamos un invariante y una guarda si o si.

Para el invariante, uso la tecnica {Nombre de tecnica}: 

	Inv = ...

Y para la guarda B: ...

	B = ...

Luego, granatizado: (FUTURO: Y si llegamos a reforzar el Inv, es logico que Inv' ^ -B => Q)
(“el invariante garantiza la postcondición al terminar el ciclo”)

	INV ^ ¬B ⇒ Q (Demostracion trivial)

Y escribir como quedaria el programa:

	Const N: Int, A: array [0, N) of Int;
	Var res: Bool; pos: Int;
	{P}
	S1;
	do pos < N ->
		S2;
	od
	{Q}

ii) Inicializacion del ciclo. {P} S {Inv}
notemos que necesitamos inicializar variables para demostrar la terna, para el caso, propongo variables:

	r,pos := E, F 

Supongo P como hipotesis, y hago la wp de la inicializacion:

	wp.s1.Inv

iii) Cuerpo del ciclo {Inv ^ B} S {Inv}. 
Sabemos que si maneja indices y la postcondcion opera con los mismos, se debe de iterar en el ciclo. Como debe de avanzar las posiciones y por intuicion del mismo, propongo:

	res, pos := E, pos+1

Suponemos Inv ^ B como hipotesis, y hacemos la wp.

	wp.s2.inv...
	={pasos varios}
	...
	={me trabo, la hipotesis que tengo no es suficiente para la derivacion y debo de fortalecer.}

2)
i)Debo de fortalecer el invariante, y por lo tanto re-derivar las partes del programa. Propongo para el invariante:

	Inv' = Inv ^ ...

O tambien:

	Inv' = {valor de invariante}

Como se menciono antes, en consecuencia:

	Inv' => Inv

y por lo tanto:

	Inv' ^ -B => Q 

Se mantiene.

iii) Inicializacion del ciclo. {P} S {Inv'}
notemos que necesitamos inicializar variables para demostrar la terna, para el caso, propongo variables:

	r,pos, aux, ... := E, F, G

Supongo P como hipotesis, y hago la wp de la inicializacion:

	wp.s1.Inv'

iii) Cuerpo del ciclo {Inv' ^ B} S {Inv'}. 
Sabemos que si maneja indices y la postcondcion opera con los mismos, se debe de iterar en el ciclo. Como debe de avanzar las posiciones y por intuicion del mismo, propongo:

	res, pos := E, pos+1

Suponemos Inv' ^ B como hipotesis, y hacemos la wp.

	wp.s2.inv...
	={pasos varios}
	True

Quedando el programa finalmente:

	Const N: Int, A: array [0, N) of Int;
	Var res: Bool;
	{P}
	S1; // valor de s1
	do pos < N ->
		S2; // valor de s2
	od
	{Q}

Funcion de cota:

Sabemos que todo ciclo itera cierta cantidad de veces, con funcion de cota lo que hacemos es que corroborar que realmente si termina el ciclo, por mas que sea algo trivial. 
Ademas, sabemos que el valor de cota, comunmente se saca de ver el invariante o la guarda B, propongo:

	t = {valor de cota (normalmente algo como N - pos)}

Debemos de demostrar:

	iv.a) Inv ^ B => t >= 0 (No negatividad)

supongo Inv ^ b como hipotesis, y demuestro:

	t >= 0
	={def de t}
	N - pos >= 0
	={arit}
	N >= pos

Y demostrar que decrece en cada iteracion, suponiendo como hipotesis Inv ^ b ^ t = T

(aca s seria lo q tenemos en el cuerpo del ciclo, pero escribire la variable que se usa en t, que seria pos)

	iv.b) { Inv ^ B ^ t = T} s { t < T }

y hacemos la wp:

	wp.s2.(t<T)
	={def de wp}
	(pos := pos+1).(t<T)
	={valor de t, wp de :=}
	N - (pos+1) < T
	={Hipotesis T, aritmetica}
	N -pos -1 < N - pos
	={Aritmetica}
	-1 < 0

Demostrando que efectivamente se decrece en cada iteracion.
Por ultimo, como aclaracion la funcion de cota no forma parte del programa. 

Terminacion anticipada de ciclos.
*(UNICAMENTE APLICABLE SI, R ES ALGO TIPO BOOL.)*
Sabemos que el programa podria terminar antes si r se vuelve False, y salir del ciclo antes y no seguir iterando demas para que el programa sea mas eficiente. 
Refuerzo la guarda B de la manera:

	B' = pos < N ^ r

Suponemos dos hipotesis como verdaderas para demostrar la terminacion anticipada:

	Hip 1: Inv...
	Hip 2: -r

Y demostramos que si sale, Inv ^ -r => Q:

	Q
	={def de q. Lo que se hara es buscar la hipotesis y 
	algun rango raro del refuerzo del inv}

![[Pasted image 20251213091606.png]]

Y queda el programa finalmente con:

	Const N: Int, A: array [0, N) of Int;
	Var res: Bool;
	{P}
	S1; // valor de s1
	do pos < N ^ r ->
		S2; // valor de s2
	od
	{Q}

Sacarse en las derivaciones el rango:

0<= pos <= N, cuando pos = 0, o 1, es por aritmetica + logica.

0<=pos+1<=N, cuando pos := pos+1, es por hipotesis Inv ^ B

Recordemos que cuando tenemos algo como un factorial o potencia, este se **reexpresa de forma inductiva**, porque eso es lo que permite el mantenimiento del invariante.

Ej:
En la hipotesis, factorial aparece como:

	fac := pos!

Cuando derivamos y finalmente tenemos un programa, queda como:

	fac := (pos+1) * pos!

Que quedaria bien si usamos la hipotesis, o sea:

	fac := (pos+1) * fac

Para una potencia:

![[Pasted image 20251215102722.png]]

![[Pasted image 20251215102753.png]]

![[Pasted Image 20251211072253_432.png]]
Tampoco está mal poner un -inf. Fijarse que pide el enunciado. 
Quizá, te puede convenir más un rango unitario antes que un rango vacio (fijarse)
![[Pasted Image 20251123114735_029.png]]![[Pasted Image 20251123114601_400.png]]
![[Pasted Image 20251123114646_803.png]]![[Pasted Image 20251206151840_945.png]]En funcional el testing SIEMPRE se hace expandiendo la definición del programa, 
porque el programa es recursivo y se analiza estructuralmente.![[Pasted Image 20251206152052_229.png]]
El testing imperativo NO usa el programa ni el cuerpo del ciclo. Solo se evalúa Q con los valores concretos, enumerando el rango
![[Pasted Image 20251212101515_833.png]]

![[Pasted Image 20251130113151_175.png]]![[Pasted Image 20251201075132_939.png]]![[Pasted Image 20251201104402_563.png]]
![[Pasted image 20251215111407.png]]![[Pasted Image 20251209072336_713.png]]![[Pasted Image 20251206145826_606.png]]![[Pasted Image 20251206145751_915.png]]![[Pasted Image 20251206145909_939.png]]![[Pasted Image 20251212111129_452.png]]
![[Pasted image 20251215095948.png]]![[Pasted image 20251215095955.png]]