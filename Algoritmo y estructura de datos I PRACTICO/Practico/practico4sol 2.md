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
	⟨N i, j : 0 ≤ i < j ^ j = n : A.i = A.j ⟩ 
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