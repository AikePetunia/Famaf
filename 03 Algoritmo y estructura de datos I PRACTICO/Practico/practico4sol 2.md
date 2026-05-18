Sea A un arreglo de enteros.
a) Especificar y derivar un programa que determine si todos los elementos de A son mayores a 0.

-Debemos recorrer una posicion del arreglo, con posiciones válidas
-Checkear booleanamente si se cumple la condicion para TODo elemento (A  - Para todo)
Proponemos la siguiente terna:

	Const N: Int;
	Var res: Bool;
	{P: N>= 0}
	S1 <- Programa a encontrar
	{Q: res = <Ai: 0<= i < N: A.i > 0 >}

-Necesitamos un ciclo, para avanzar y checkear lo pedido.
	-> Necesito una invariante
Propongo una invariante, Aplicacion técnica de remplazo de constante por variables

	INV = res = <Ai: 0<= i < pos: A.i > 0  > ^ 0<= pos <= N

Y para una guarda B:
B = pos < N
Sabemos que esto será válido si:
INV ^ -B => Q
Demostremos:


	res = <Ai: 0<= i < pos: A.i > 0  > ^ 0<= pos <= N ^ -(pos < N) 
	=> res = <Ai: 0<= i < N: A.i > 0 >
	={-b, Lógica }
	res = <Ai: 0<= i < pos: A.i > 0  > ^ 0<= pos <= N ^ pos >= N 
	=> res = <Ai: 0<= i < N: A.i > 0 >
	={Logica, sustitucion}
	res = <Ai: 0<= i < N: A.i > 0  > => res = <Ai: 0<= i < N: A.i > 0 >
	={Logica}
	True

Quedandonos una estructura:

	Const N: Int; A: Array [0, n): Int;
	Var res: Bool;
	{P: N >= 0}
	S1 // Inicializacion
	{Inv}
	do pos < N ->
	    {Inv ^ B}
	    S2 // cuerpo del ciclo
	    {Inv}
	od
	{Q: res = <Ai: 0<= i < N: A.i > 0 >}

i) Inicializacion:
Sabemos que 

	{P: N >= 0}
	S1 // Inicializacion
	{INV = res = <Ai: 0<= i < pos: A.i > 0  > ^ 0<= pos <= N}

Las variables que no están inicializadas y declaradas, son res y pos:
Probemos con asignaciones de 

	res,pos := E,F

Hagamos la wp.s1.Inv

	wp.s1.inv
	={wp de asignacion :=}
	E = <Ai: 0<= i < F: A.i > 0  > ^ 0<= F <= N
	={Elijo F = 0, E = True, para forzar rango vacio}
	True = <Ai: 0<= i < 0: A.i > 0  > ^ 0<= 0 <= N
	={Rango vacio, lógica}
	True = True ^ 0
	={Logica, abs}
	True

Entonces, nos queda que inicializa con res,pos:=0,0.

Quedando el programa de momento:

Quedandonos una estructura:

	Const N: Int; A: Array [0, n): Int;
	Var res: Bool;
	{P: N >= 0}
	res,pos:= True,0 
	{Inv}
	do pos < N ->
	    {Inv ^ B}
	    S2 // cuerpo del ciclo
	    {Inv}
	od
	{Q: res = <Ai: 0<= i < N: A.i > 0 >}

ii) Cuerpo del ciclo:
Tenemos que hacer wp.s2.Inv, y elegimos:
res,pos := E,F.
El ciclo lógicamente tiene que avanzar, por lo tanto la posicion debe actualizarse, asi que asumimos:
res,pos := E,pos+1.
Asumimos nuestro INV y B como hipotesis.

	wp.s2.inv
	={wp de :=, elijo }
	E = <Ai: 0<= i < pos+1: A.i > 0  > ^ 0 <= pos+1 <= N
	={lógica, particion de rango}
	E = <Ai: i = pos: A.i > 0  > ^ <Ai: 0<= i < pos: A.i > 0  > 
	^ 0 <= pos+1 <= N
	={Rango unitario}
	E =  <Ai: 0<= i < pos+1: A.i > 0  > ^ A.pos > 0 ^ 0 <= pos+1 <= N
	={Hipotesis}
	E =  res ^ A.pos ^ 0 <= pos+1 <= N
	={Hipotesis, 0<= pos, y pos <= N}
	E = res ^ A.pos
	={Elijo E = res ^ A.pos}
	True

Quedandonos el programa:

	Const N: Int; A: Array [0, n): Int;
	Var res: Bool;
	{P: N >= 0}
	res,pos:=True,0 
	do pos < N ->
	    res,pos:= res ^ A.pos > 0, pos+1
	od
	{Q: res = <Ai: 0<= i < N: A.i > 0 >}


pag 149.
Dado un arreglo A : array[0, N ) of N um con N ≥ 0, contar cuantas veces coinciden dos elementos: 
Const N : Int, A : array [0, N ) of Int; 
Var r : Int; 
{P : N ≥ 0} 
S // Cuerpo del ciclo
{Q : r = ⟨N i, j : 0 ≤ i < j < N : A.i = A.j ⟩}

Tenemos un arreglo, trabajamos con indices.
-> necesitamos un ciclo, por lo tanto también un invariante y una guarda B.
Por técnica de remplazo de constantes por variables, la invariante me queda:

	Inv = r = ⟨N i, j : 0 ≤ i < j < pos : A.i = A.j ⟩ ^ 0<= pos <= N

Y una guarda B, sabemos que avanzará siempre que la pos sea válida

	B = pos < N

quedando un ciclo como:

	Const N : Int, A : array [0, N ) of Int; 
	Var pos, r : Int; 
	{P : N ≥ 0} 
	S1  // Inicializacion
	{Inv}
	do pos < N ->
		{inv ^ B}
		S2; // cuerpo del ciclo
		{inv}
	od
	{Q : r = ⟨N i, j : 0 ≤ i < j < N : A.i = A.j ⟩}

i) Inicializacion.

	{P: N >= 0}
	S1;
	{INV = r = ⟨N i, j : 0 ≤ i < j < pos : A.i = A.j ⟩ ^ 0<= pos <= N}

Sabemos que necesitamso inicializar y delcarar las variables para iniciar el ciclo.
Asumamos r, pos =: E, F

	wp.s1.Inv
	={Wp de asignacion}
	E = ⟨N i, j : 0 ≤ i < j < F : A.i = A.j ⟩ ^ 0 <= F <= N}
	={Elijo que E,F := 0,0}
	0 = ⟨N i, j : 0 ≤ i < j < 0 : A.i = A.j ⟩ ^ 0 <= 0 <= N}
	={Lógica, rango vacío}
	0 = 0 ^ 0}
	={igualdad}
	True

Con la inicializacion ya hecha, el programa queda algo como:

	Const N : Int, A : array [0, N ) of Int; 
	Var pos, r : Int; 
	{P : N ≥ 0} 
	res, pos:= 0, 0  // Inicializacion
	{Inv}
	do pos < N ->
		{inv ^ B}
		S2; // cuerpo del ciclo
		{inv}
	od
	{Q : r = ⟨N i, j : 0 ≤ i < j < N : A.i = A.j ⟩}

ii) Cuerpo del ciclo. Derivar s2.

Supongamos Inv ^ B como hipotesis.
Sabemos que la posicion debe avanzar, asumimos:
res, pos := E, pos+1

	wp.s2.Inv
	={def de wp para :=}
	E = ⟨N i, j : 0 ≤ i < j < pos+1 : A.i = A.j ⟩ ^ 0<= pos+1 <= N
	={Trabajamos en el rango:
		0<=i<j<pos+1, es lo mismo que
		0 <= i < j ^ j < pos+1 e lo mismo que:
		0 <= i < j ^ (j < pos v j = pos), distribuimos:
		(0<= i < j ^ j < n) v (0<=i<j ^ j = n), mismo que:
		(0<= i < j < n) v (0<=i<j ^ j = n)	
	}
	E = ⟨N i, j : 0 ≤ i < j < pos: A.i = A.j ⟩ + 
	⟨N i, j : 0 ≤ i < j ^ j = pos : A.i = A.j ⟩ 
	^ 0<= pos+1 <= N
	={Hipotesis}
	E = res + ⟨N i, j : 0 ≤ i < j ^ j = n : A.i = A.j ⟩ 
	^ 0<= pos+1 <= N
	={Elim de variable}
	E = res + ⟨N i, j : 0 ≤ i < n : A.i = A.n ⟩ 
	^ 0<= pos+1 <= N

Nos trabamos, no hay forma de elegir E programable ya que no está en hipotesis, necesito una nueva hip y un ciclo anidado para calcularla. Replanteo S2 de la siguiente manera:

	res2 = < N i, j : 0 ≤ i < pos2 : A.i = A.pos ⟩

y como no tenemos manera de avanzar, necesitamos otro ciclo (ciclo anidado) para el calculo de S2, que se replantea como S3, siendo:

	{Inv ^ B}
	S3;
	{Inv ^ B  ^ res2}
	res, pos:= res + res2, pos + 1
	{Inv}

Falta derivar el ciclo anidado S3:

	{P2: Inv ^ B}
	S3;
	{S2: Inv ^ B ^ res2=< N i, j : 0 ≤ i < pos2: A.i = A.pos >}

Para s3, n y r son consatnte. Como estamos en un ciclo, aplicamos la tecnica de cambio de constantes por variable, "reemplazando pos, por la variable pos2":

	Inv2 = Inv ^ B ^ res2 =<N i: 0<= i < pos2 : A.i = A.pos> ^ 0<= pos2 <= N
	B = pos2 < pos1

Pensemoslo como un programa nuevo a derivar, con unos "Extras"

	{ P2 } 
	S4 ; // inicializacion del anidado
	{ INV2 } 
		do pos < pos2 → 
			{ INV2 ∧ B2} 
			S5 // cuerpo del ciclo anidado 
			{ INV2 } 
	{ Q2 }

ademas, debemos pensar en que pasa si matchea o no matchea A.pos = A.pos2

	{ P2: Inv ^ B } 
	S4 ; // inicializacion del anidado
	{ INV2 } 
		do pos < pos2 → 
			{ INV2 ∧ B2} 
			if 
				[]A.pos = A.pos2 -> S5;
				[] A.pos != A.pos2 -> S6
			fi
			{ INV2 } 
	{ Q2 }

iii) Derivemos la inicializacion del ciclo anidado:

	{ P2: Inv ^ B } 
	S4 ; // inicializacion del anidado
	{ INV2: Inv ^ B ^ res2= <N i: 0<= i < pos2 : A.i = A.pos> ^ 0<= pos2 <= N}

Sabemos que pos2 no está inicializado, debemos inicializarlo, asumimos:
res2, pos2 := E, F.
Hacemos la wp:

	wp.s4.Inv2
	={Wp de asignacion}
	E = <N i: 0<= i < F : A.i = A.F> ^ 0<= F <= N}
	={Inicializacion de var. asumo F = 0, forzamos rango vacio}
	E = <N i: 0<= i < 0 : A.i = A.0> ^ 0<= 0 <= N}
	={Lógica, rango vacio, Lógica}
	E = 0
	={Elijo E = 0}
	True.

Va quedando:

	{ P2: Inv ^ B } 
	res2, pos2 := 0, 0 ; // inicializacion del anidado
	{ INV2 } 
		do pos < pos2 → 
			{ INV2 ∧ B2} 
			if 
				[]A.pos = A.pos2 -> S5;
				[] A.pos != A.pos2 -> S6;
			fi
			{ INV2 } 
	{ Q2 }

iv) derivacion del cuerpo del ciclo anidado.

Supongamos Inv ^ B ^ Inv2 como hipotesis.
Sabemos que la posicion debe avanzar, asumimos:
res2, pos2 := E, pos2+1

	wp.s5.Inv2
	={Wp de :=}
	E = <N i: 0<= i < pos2+1 : A.i = A.pos> ^ 0 <= pos2+1 <= pos
	={Lógica, part de rango por final}
	E = <N i: i = pos2 : A.i = A.pos> +
	<N i: 0 <= i < pos2 : A.i = A.pos> ^ 0<= pos2+1 <= pos
	={hipotesis}
	E = <N i: i = pos2 : A.i = A.pos> + res2 ^ 0<= pos2+1 <= pos
	= { Rango unitario, y en conteo como tengo 2 pasos t.c -> 1, -t.c -> 0, teniendo dos casos. }
	
		Caso 1. A.pos2 = A.pos
		E = 1 + res2 ^ 0<= pos2+1 <= pos
		={Hipotesis}
		E = 1 + res2
		={Elijo E = 1 + res2}
		True
	
		Caso 2. A.pos2 != A.pos
		E = 0 + res2 ^ 0 <= pos2+1 <= pos
		={Hipotesis, lógica}
		E = res2
		={ elijo e= res2} 
		True

Quedando el programa:

Const N: Int, A: array [0, n) of Int;
Var res, pos, res2, pos2: Int;

	{P: N>= 0}
	res, pos := 0, 0;
	do pos < N ->
		res2, pos2 := 0, 0
		do pos2 < pos 
			if a.pos = a.pos2 -> res2, pos2 := res2 + 1, pos2+1
			 [] a.pos != a.pos2 -> res2, pos2 := res2, pos2+1
			 fi
		od
		res, pos := res + res2, pos +1
	od
	{Q: res = <N i,j: 0<= i < j < N : A.i = A.j} 


Dado un arreglo A : array[0, N ) of N um con N ≥ 0, determinar si hay dos elementos que suman 8: 

	Const N : Int, A : array [0, N ) of Int; 
	Var res : Bool; 
	{P : N ≥ 0} 
	S  // Cuerpo del ciclo
	{Q : res = ⟨ ∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩}

Notemos que es una funcion del tipo, la suma de los elementos en ciertos indices suman 8, siendo algo booleano.
Necesitamos recorrer los arreglos en posiciones iguales.

Quedando un programa de la estructura

	Const N : Int, A : array [0, N ) of Int; 
	Var res : Bool; 
	{P : N ≥ 0} 
	S1;
	{inv}
		do B ->
			{inv ^ b}
			S2;
			{inv}
		od 
	{Q : res = ⟨ ∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩}

Por técnica de remplazo de constante por variablem, propongo un invariante para la derviacion del programa que ocupa un ciclo, y lo reforzamos:
Además, debemos saber que cumpla que Inv ^ -B => Q:

	Inv = res = <Ei,j: 0<= i < j < pos : A.i + A.j = 8> ^ 0<= pos <= N
	B = pos < N 

Demostremos que vale:

	inv ^ -b => Q
	={valores}
	res = <Ei,j: 0<= i < j < pos : A.i + A.j = 8> ^ 0<= pos <= N ^ -(pos<N) => 
	res = ⟨ ∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩
	={lógica, elim de variable con pos = N}
	res = <Ei,j: 0<= i < j < N : A.i + A.j = 8> ^ 0<= pos <= N => 
	res = ⟨ ∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩
	={lógica, igualdad lógica p => p}
	True

siendo una invariante y una guarda válida. Nos queda el ciclo:

	Const N : Int, A : array [0, N ) of Int; 
	Var res : Bool; pos : Int; 
	{P : N ≥ 0} 
	S1; // inicializacion
	{inv}
		do pos < n ->
			{inv ^ b}
			S2; // cuerpo del ciclo
			{inv}
		od 
	{Q : res = ⟨ ∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩}

i) Inicializacion del ciclo

	{N ≥ 0} 
	S1; // inicializacion
	{res = <Ei,j: 0<= i < j < pos : A.i + A.j = 8> ^ 0<= pos <= N}

observando la dif de variables que hay entre la pre y post, sabemos que tenemos que iniciar y declarar pos, res. Propongo:

	res, pos := E,F

y hacemos la wp

	wp.s1.inv
	={wp de :=}
	E = <Ei,j: 0<= i < j < F : A.i + A.j = 8> ^ 0 <= F <= N
	={asumamos F = 0, E = False, para forzar un rango vacío}
	False = False ^ 0<= 0 <= N 
	={HI, lógica}
	True

quedando el programa, con las inicializaciones correspondientes de S1

	Const N : Int, A : array [0, N ) of Int; 
	Var res : Bool; pos : Int; 
	{P : N ≥ 0} 
	res,pos := False, 0; // inicializacion
	{inv}
		do pos < n ->
			{inv ^ b}
			S2; // cuerpo del ciclo
			{inv}
		od 
	{Q : res = ⟨ ∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩}

ii) Cuerpo del ciclo.

sabemos que el ciclo debe avanzar y las posiciones deben actualizarse, hasta enocntrar un true para A.i + A.j = 8.
propongo que: res,pos := E, pos+1
y hacemos la wp.

	wp.s2.inv
	={wp de :=}
	E = <Ei,j: 0<= i < j < pos+1 : A.i + A.j = 8> ^ 0 <= pos+1 <= N
	={lógica en el rango:
	0<=i<j<pos+1 es lo mismo que
	0<=i<j ^ j<pos+1 mismo que 
	0<=i<j ^ j<pos v j=pos, distribuyendo:
	(0<=i<j ^ j<pos) v (0<=i<j ^ j = pos), usando las asignaciones:
	(0<=i<j ^ j<pos) v (0<=i<pos) }
	E = <Ei,j: (0<=i<j ^ j<pos) v  (0 <= i < pos : A.i + A.j = 8>
	^ 0 <= pos+1 <= N
	={part de rango}
	E = <Ei,j: 0<=i<j ^ j<pos : A.i + A.j = 8> v 
	<Ei,j: 0 <= i < j ^ j = pos : A.i + A.j = 8>
	^ 0 <= pos+1 <= N
	={elim de variable j, hipotesis}
	E = res v <Ei,j: 0 <= i < pos : A.i + A.pos = 8> ^ true
	={nos trabamos -->}

Nos trabamos, E no es programable ya que nos encontramos con algo que no está en hipotesis y lo planteamos como una más (Invariante extra), además necesitamos otro ciclo (anidado).

	Inv' = res2 = <Ei: 0 <= i < pos2 : A.i + A.pos = 8> ^ 0 <= pos2 <= pos

Con una guarda B, así Inv' ^ -b => Inv

	B' = pos2 < pos

Como tenemos un ciclo anidado,  y como extra, tenemos que ver si realmente coinicidio que A.i + A.j = 8, o no. Tenemos guardasel ciclo tendrá forma de:

	{P2:}
	S4;
	{Inv'}
		do B' ->
			{Inv' ^ b'}
			if [] B1 -> S5;
				[] B2 -> S6
			{Inv}
		od
	{Q2;}

Demostremos Inv' ^ -b => inv'

	Inv' ^ -b => Inv
	={asignaciones de inv', b, inv}
	res2 = <Ei: 0 <= i < pos2 : A.i + A.pos = 8> ^ 0 <= pos2 <= pos ^ -(pos2 < pos) => res2 = <Ei,j: 0 <= i < pos2 : A.i + A.pos = 8> 
	={-b, lógica}
	res2 = <Ei,j: 0 <= i < pos2 : A.i + A.pos = 8> ^ 0 <= pos2 <= pos ^ pos2 = pos => res2 = <Ei,j: 0 <= i < pos2 : A.i + A.pos = 8> 
	={Elim de variable}
	res2 = <Ei: 0 <= i < pos : A.i + A.pos = 8> ^ 0 <= pos <= pos 
	=> res2 = <Ei,j: 0 <= i < pos2 : A.i + A.pos = 8> 
	={elim de variable, logica}
	res2 = <Ei: 0 <= i < pos : A.i + A.pos = 8> => res2 = <Ei,j: 0 <= i < pos2 : A.i + A.pos = 8> 
	={logica}
	True

iii) Inicializacion del ciclo interno.

Sabemos que se deben iniciar las variables nuevas, asumamos:

	res2,pos2 := E,F

Hagamos la WP:

	wp.s4.Inv'
	={wp de :=}
	E = <Ei: 0 <= i < F : A.i + A.pos = 8> ^ 0 <= F <= pos
	={elijo F = 0, E = False, para forzar un rango vacio}
	False = <Ei: 0 <= i < 0 : A.i + A.pos = 8> ^ 0 <= 0 <= pos
	={lógica, rango vacio}
	False = False ^ True
	={lógica}
	True

Nos queda la inicializacion del ciclo:

	{P2:}
	res2,pos2 := False, 0
	{Inv'}

IV) Cuerpo del ciclo anidado.
Asumamos Inv' ^ B' como hipotesis.
además, anticipemos que habrán 2 guardas. 

1. A.i + A.j != 8
2. A.i + A.j = 8 

pensemos que el ciclo debe avanzar y revisar si la guarda es cierta, si lo fuera, se termina el ciclo. (Podemos agregar terminacion anticipada de ciclos tmb, reforzando poniendo que res = true, pero lo hago más adelante xd)

entonces, usemos: res2,pos2 := E, pos2+1

	wp.s5.inv
	={wp de :=}
	E = <Ei: 0 <= i < pos2+1 : A.i + A.pos = 8> ^ 0 <= pos2+1 <= pos
	={lógica, part de rango por final}
	E = <Ei: 0 <= i < pos2 : A.i + A.pos = 8> v 
	<Ei: i = pos2: A.i + A.pos = 8> ^ 
	0 <= pos2+1 <= pos
	={hipotesis}
	E = res2 v < Ei: i = pos2: A.i + A.pos = 8>
	={Rango unitario, 2. casos:
		I)  A.pos2 + A.pos != 8
		II) A.pos2 + A.pos = 8}
		
	={Caso 1, A.pos2 + A.pos != 8}
	E = res2 v A.pos2 + A.pos != 8
	.
	={Caso 2. A.pos2 + A.pos = 8}
	E = True v A.pos2 + A.pos = 8

en ambos elegimos E, con el coso y queda como true. Quedando el programa como:

	Const N: Int;
	Var res,res2: Bool; pos,pos2: Int; 
	{P: N >= 0}
	res,pos:= False,0
	do pos < N ->
		res2,pos2:= False, 0
			do pos2 < pos 
				if A.pos2 + A.pos != 8 -> res2, pos2 =: res2, pos2+1
					[] A.pos2 + A.pos = 8 -> res2, pos2 =: True, pos2+1
				fi
			od
		pos, res = res v res2, pos+1
	od
	{Q: res = ⟨ ∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩ }

Agregamos terminacion anticipada de ciclos:
sabemos perfectamente que el ciclo se puede cortar inmediatamente si 

	A.pos2 + A.pos = 8

haciendo que res quede como True. Sabemos que hay 2 res, cada uno con su evaluacion booleana

	Var res,res2: Bool;

y cada uno existiendo en su propio ciclo

Para decidir formalmente si se corta antes, sabemos que tenemos que encontrar un C (que sería el de la terminacion anticipada) que haga que cumpla:

	I ^ (-B v C) => Q 

Y esto lo debemos hacer en ambos ciclos.
para el primer ciclo, proponemos:

	res = True

->

	res = <Ei,j: 0<= i < j < pos : A.i + A.j = 8> ^ 0<= pos <= N ^ 
	(-(pos<N) v res = true) => res = ⟨∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩ 
	={Lógica, hipotesis}
	res = <Ei,j: 0<= i < j < pos : A.i + A.j = 8> ^ (pos=N v res = true) =>
	res = ⟨∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩ 
	={elim de variable 2 veces}
	true = <Ei,j: 0<= i < j < N : A.i + A.j = 8>  => true = ⟨∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩ 
	={Lógica}
	True

La primera parte de terminacion anticipada de ciclos está demostrada.

***Veamos la segunda parte (ciclo interno.) (Tengo entendido que esto no sirve demostralo, por que es una tautologia como (P ^ Q) => P)***

	***Inv' ^ (-B v C) => Inv'***

***Sabemos que es lo mismo:***

	***C = pos2 = True***

***->***

	***res2 = <Ei: 0 <= i < pos2 : A.i + A.pos = 8> ^ 0 <= pos2 <= pos ^*** 
	***(-(pos2 < pos) ^ res2 = true) =>*** 
	***res2 = <Ei: 0 <= i < pos2 : A.i + A.pos = 8>*** 
	***={lógica, hipotesis, elim de variable}***
	***true = <Ei: 0 <= i < pos : A.i + A.pos = 8> =>*** 
	***true = <Ei: 0 <= i < pos : A.i + A.pos = 8>*** 
	***={p=>p, logica}***
	***true***

Con la terminacion anticipada, nos queda:

	Const N: Int;
	Var res,res2: Bool; pos,pos2: Int; 
	{P: N >= 0}
	res,pos:= False,0
	do pos < N ^ -res ->
		res2,pos2:= False, 0
			do pos2 < pos ^ -res2
				if A.pos2 + A.pos != 8 -> res2, pos2 =: res2, pos2+1
					[] A.pos2 + A.pos = 8 -> res2, pos2 =: True,  pos2+1
				fi
			od
		pos, res = res v res2, pos+1
	od
	{Q: res = ⟨ ∃ i, j : 0 ≤ i < j < N : A.i + A.j = 8 ⟩ }

*21) not useful*

	*Const M : Int, A : array [0, M ) of Int;* 
	*Var r : Int;* 
	*{P : M ≥ 0}* 
	*S // programa a encontrar*
	*{Q : r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩}*

*cuenta la cantidad de números en el arreglo que en el indice j, que son menores que el indice multiplicado por el numero del arreglo en el indice i*

*debo calcular un programa, que recorra los arreglos, en indices distinto, y con una suma para poder operar el termino correctamente. Ya que debo recorrer un arrreglo, en distintos indices, necesito un ciclo.* 
*Creo un invariante, por tecnica de remplazo de constantes por variables:*

	*Inv =  r = <Ni : 0<= i < pos: <sum j: 0 <= j < i: A.j> <= i * A.i> ^*
	*0 <= pos <= M*

*Con una guarda B correspondiente, para poder iterar en el ciclo correctamente:*

	*B = pos < M*

*Demostramos que esto vale, por:* 

	*inv ^ -b => Q*


### ***// me gustaria revisar la validez de este paso*** 

	*r = <Ni : 0 <= i < pos: <sum j: 0 <= j < i: A.j> <= i * A.i> ^*
	*0 <= pos <= M ^ -(pos < M) =>* 
	*r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩*
	*={Lógica, cambio de variable}*
	*r = <Ni : 0<= i < M: <sum j: 0 <= j < i: A.j> <= i * A.i> ^*
	*0 <= pos <= M  =>* 
	*r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩*
	*={Hipotesis, igualdad lógica P => P}*
	*True*

*con esto planteado, quedara una estrucutra del tipo* 

	*Const M : Int, A : array [0, M ) of Int;* 
	*Var r, pos : Int;* 
	*{P : M ≥ 0}* 
	*S1; // Incializacion*
	*{Inv}*
	*do -> pos < M* 
		*{Inv ^ B}*
		*S2; // Cuerpo del ciclo*
		*{Inv}*
	*od*
	*{Q : r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩}*

*i) Inicializacion del ciclo.*

	*{P : M ≥ 0}* 
	*S1; // Incializacion*
	*{r = <Ni : 0<= i < pos: <sum j: 0 <= j < i: A.j> <= i * A.i> ^*
	*0 <= pos <= M}*

*sabemos que debemos declarar y inicializar las variables que hay entre la P y Inv, propongo:*

	*r,pos := E,F*

*y hago la wp*

	*wp.s1.inv*
	*={wp de :=}*
	*E = <Ni : 0<= i < F: <sum j: 0 <= j < i: A.j> <= i * A.i> ^*
	*0 <= F < M*
	*={elijo E = 0, F = 0, para forzar rango vacio}*
	*0 = <Ni : 0<= i < 0: <sum j: 0 <= j < i: A.j> <= i * A.i> ^*
	*0 <= 0 < M*
	*={Logica en el rango }*
	*0 = <Ni : False : <sum j: 0 <= j < i: A.j> <= i * A.i>*
	*={rango vacio}*
	*0 = 0*
	*={logica}*
	*true*

*entonces, la inicilizacion + resto del programa, va quedando:*

	*Const M : Int, A : array [0, M ) of Int;* 
	*Var r, pos : Int;* 
	*{P : M ≥ 0}* 
	*res,pos := 0,0; // Incializacion*
	*{Inv}*
	*do -> pos < M* 
		*{Inv ^ B}*
		*S2; // Cuerpo del ciclo*
		*{Inv}*
	*od*
	*{Q : r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩}*

*ii) Cuerpo del ciclo.*

*debemos derivar dentro del ciclo, la parte de:*

	*{Inv ^ B}*
	*S2; // Cuerpo del ciclo*
	*{Inv}*

*propongo de hipotesis Inv ^ B,*

*Sabemos que el ciclo debe avanzar entre posiciones, hasta que se de que A.j <= i * A.i, propongo:*

	*r, pos := E, pos+1*

*y hacemos la wp:*

	*wp.s2.Inv*
	*={wp de :=}*
	*E = <Ni : 0<= i < pos+1: <sum j: 0 <= j < i: A.j> <= i * A.i> ^*
	*0 <= pos+1 < M*
	*={logica en el rango}*
	*E = <Ni : i = pos v 0 <= i < pos: <sum j: 0 <= j < i: A.j> <= i * A.i> ^*
	*0 <= pos+1 < M*
	*={part de rango}*
	*E = <Ni : i = pos : <sum j: 0 <= j < i: A.j> <= i * A.i> +* 
	*<Ni :  0 <= i < pos: <sum j: 0 <= j < i: A.j> <= i * A.i> ^*
	*0 <= pos+1 < M*
	*={Hipotesis dos veces}*
	*E = <Ni : i = pos : <sum j: 0 <= j < i: A.j> <= i * A.i> + r ^ True*
	*={Rango unitario, para conteo, son dos casos*
		*I) T.c (A.j <= i A.i) = 1*
		*II) -T.c -(A.j <= i A.i)= 0*
	*}*
		*I) E = 1 + r*
		*={Elijo E = 1+r, con T.c == (A.j <= i A.i) (no programable)}*
		*True*
	
		*II) E = r* 
		*={Elijo E = r, con -T.C == -(S :  A.j <= i A.i) (no programable)}*
		*True* 

*// test*

	*Const M : Int, A : array [0, M ) of Int;* 
	*Var r, pos : Int;* 
	*{P : M ≥ 0}* 
	*res,pos := 0,0; // inicializacion*
	*{Inv}*
	*do -> pos < M* 
		*{Inv ^ B}*
		*pos2 := 0*
		*do -> pos2 <m*
			*if <sum j: 0 <= j < i: A.j> <= i * A.i> -> r, pos := r+1, pos+1*
			*[] -<sum j: 0 <= j < i: A.j> <= i * A.i> -> r, pos := r, pos+1*
		*{Inv}*
	*od*
	*{Q : r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩}*

21)

	Const M : Int, A : array [0, M ) of Int; 
	Var r : Int; 
	{P : M ≥ 0} 
	S // programa a encontrar
	{Q : r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩}

cuenta la cantidad de números en el arreglo que en el indice j, que son menores que el indice multiplicado por el numero del arreglo en el indice i

debo calcular un programa, que recorra los arreglos, en indices distinto, y con una suma para poder operar el termino correctamente. Ya que debo recorrer un arrreglo, en distintos indices, necesito un ciclo. 
Creo un invariante, por tecnica de remplazo de constantes por variables, fortalecimiento para el termino:

	Inv =  r = <Ni : 0<= i < pos: <sum j: 0 <= j < i: A.j> <= i * A.i> ^
	s = <sum j: 0 <= j < i: A.j>
	0 <= pos <= M

Con una guarda B correspondiente, para poder iterar en el ciclo correctamente:

	B = pos < M

Demostramos que esto vale, por: 

	inv ^ -b => Q

-> 

	r = <Ni : 0<= i < pos : <sum j: 0 <= j < i: A.j> <= i * A.i> ^
	s = <sum j: 0 <= j < i: A.j>
	0 <= pos <= M ^ -(pos < m) => 
	r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩
	={Lógica, elim de variable, hipotesis}
	r = <Ni : 0 <= i < pos: <sum j: 0 <= j < i: A.j> <= i * A.i> ^
	s = <sum j: 0 <= j < i: A.j> ^  pos >= m => 
	r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩
	={sustitucion de iguales, elim de var}
	r = <Ni : 0 <= i < pos: <sum j: 0 <= j < i: A.j> <= i * A.i> ^
	=> r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩
	={logica, p=>p}
	True

i)  Inicializacion del ciclo.

Sabemos que debemos demostrar la parte de:

	{P: M >= 0}
	S1;
	{Q: r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩}

Se debe inicializar el programa, declarando varialbes y inciandolas. Propongo:

	r,pos := E, F

->

	wp.s1.inv
	={wp de :=, con: r,pos := E, F}
	E = <Ni : 0<= i < F: <sum j: 0 <= j < i: A.j> <= i * A.i> ^
	s = <sum j: 0 <= j < i: A.j> ^
	0 <= F <= M
	={elijo E,F := 0,0, para forzar rango vacios, logica arit}
	E = <Ni : 0<= i < 0: <sum j: 0 <= j < i: A.j> <= i * A.i> ^
	s = <sum j: 0 <= j < i: A.j>



	Const M : Int, A : array [0, M ) of Int; 
	Var r, pos : Int;
	{P : M ≥ 0} 
	res,pos := 0,0; // Incializacion
	{Inv}
	do -> pos < M
		{Inv ^ B}
		S2; // Cuerpo del ciclo
		{Inv}
	od
	{Q : r = ⟨N i : 0 ≤ i < M : ⟨sum j : 0 ≤ j < i : A.j ⟩ ≤ i ∗ A.i ⟩}


prefiero no hacer el 21 xD
https://famaf.aulavirtual.unc.edu.ar/mod/forum/discuss.php?d=4750