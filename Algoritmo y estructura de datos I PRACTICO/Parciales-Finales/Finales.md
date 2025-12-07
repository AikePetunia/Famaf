p.xs = ⟨ ∃ as, b, bs : xs = as ++ (b:bs) : b = ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩

i) Caso base, para xs=[]

	p.[]
	={Especificacion}
	⟨ ∃ as, b, bs : [] = as ++ (b► bs) : b =
	 ⟨∑ i : 0 ≤ i < #bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	 ={logica}
	 ⟨ ∃ as, b, bs : as = [] ^ (b► bs) = [] : b =
	 ⟨∑ i : 0 ≤ i < #bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	 ={logica}
	 ⟨ ∃ as, b, bs : as = [] ^ False : b =
	 ⟨∑ i : 0 ≤ i < #bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	 ={Abs, rango falso }
	 False

ii) Planteo de hipotesis inductiva:

	Hip = p.xs = ⟨ ∃ as, b, bs : xs = as ++ (b:bs) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩

iii) Paso inductivo, xs=[]

	p.(x:xs)
	={Especificacion}
	⟨ ∃ as, b, bs : x:xs = as ++ (b:bs) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	={Tercer excluido}
	⟨ ∃ as, b, bs : x:xs = as ++ (b:bs) ^ True : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	={Logica de listass}
	⟨ ∃ as, b, bs : x:xs = as ++ (b:bs) ^ (as = [] v as != []) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	={Distributividad y part de rango}
	⟨ ∃ as, b, bs : x:xs = as ++ (b:bs) ^ as = []  : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	v
	⟨ ∃ as, b, bs : x:xs = as ++ (b:bs) ^ as != []) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	 ={Logica, eliminacion de variable}
	⟨ ∃ as, b, bs : x:xs = [] ++ (b:bs) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	v
	⟨ ∃ as, a, b, bs : x:xs = a:as ++ (b:bs) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	 ={func de concat}
	⟨ ∃ as, b, bs : x:xs = (b:bs) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	v
	⟨ ∃ as, a, b, bs : x:xs = a:as ++ (b:bs) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	 ={Logica de listas varias veces}
	 ⟨ ∃ as, b, bs : x = b ^ xs = bs : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	v
	⟨ ∃ as, b, bs : x = a ^ xs = as ++ (b:bs) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	 ={ Elim de variable con x = a }
	 ⟨ ∃ as, b, bs : xs = bs : x =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	v
	⟨ ∃ as, b, bs : xs = as ++ (b:bs) : b =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	={Eliminacion de variable, hipotesis}
	⟨ ∃ as, b, bs : xs = bs : x =
	 ⟨∑ i : 0 ≤ i < # bs ∧ (bs!i) mod 2 = 1 : bs!i ⟩ ⟩
	v p.xs
	={eliminacion de variable con xs = bs, rango unitario}
	 x = ⟨∑ i : 0 ≤ i < # xs ∧ (xs!i) mod 2 = 1 : xs!i ⟩ ⟩
	v p.xs

Me trabo, debo modularizar, propongo>

	sumImpar = ⟨∑ i : 0 ≤ i < # xs ∧ (xs!i) mod 2 = 1 : xs!i ⟩ ⟩

Y Derivo sumImpar:

pte 2)

i) Caso base, xs = []

	sumImpar.[]
	={Especificacion}
	 ⟨∑ i : 0 ≤ i < #[] ∧ ([]!i) mod 2 = 1 : []!i ⟩ ⟩
	={def de #}
	 ⟨∑ i : 0 ≤ i < 0 ∧ ([]!i) mod 2 = 1 : []!i ⟩ ⟩
	={rango vacio}
	0

ii) Hipotesis inductiva:

	HI = sumImpar = ⟨∑ i : 0 ≤ i < # xs ∧ (xs!i) mod 2 = 1 : xs!i ⟩ ⟩

iii) paso inductivo, xs = x:xs

	sumImpar.(x:xs)
	={Especificacion}
	⟨∑ i : 0 ≤ i < #x:xs ∧ (x:xs!i) mod 2 = 1 : xs!i ⟩ ⟩
	={def de #}
	⟨∑ i : 0 ≤ i < #xs+1 ∧ (x:xs!i) mod 2 = 1 : x:xs!i ⟩ ⟩
	={logica en el rango}
	⟨∑ i : i = 0 v 1<=i<#xs+1 ∧ (x:xs!i) mod 2 = 1 : x:xs!i ⟩ ⟩
	={particion de rango, cambio de variable i=i+1, aritmetica}
	⟨∑ i : i = 0 ∧ (x:xs!i) mod 2 = 1 : x:xs!i ⟩ ⟩
	+ ⟨∑ i : 0<=i<#xs ∧ (x:xs!(i+1)) mod 2 = 1 : x:xs!(i+1) ⟩ ⟩
	={elim de variable, def de !, }
	⟨∑ i : (x:xs!0) mod 2 = 1 : x:xs!0 ⟩ ⟩
	+ ⟨∑ i : 0<=i<#xs ∧ (xs!i) mod 2 = 1 : xs!i ⟩ ⟩
	={def de !, hipotesis}
	⟨∑ i : x mod 2 = 1 : x ⟩ ⟩ + sumImp.xs
	={rango unitario, 2 casos. x mod 2 = 1, x mod 2 != 1}
	*Caso 1. x mod 2 = 1 
	={Resuelvo expresion por casos}
	  x  + sumImp.xs
	 ={Elijo el caso}
	 
	 *Caso 2. x mod 2 != 1 
	 ={Resuelvo expresion por casos}
	 sumImp.xs
	 ={Elijo el caso}

...mismospasos....

	x = sumImpar v p.xs

Resultado:

	sumImpar.[] = 0
	sumImpar.(x:xs) = (
						x mod 2 = 1 -> x  + sumImp.xs
						x mod 2 != 1 -> sumImp.xs
	)

	p.[] = false
	p.(x:xs) = sumImpar v p.xs

2)

	Const N : Int, A : array[0, N) of Int; 
	Var r : Int;  // bool?
	{ P : N ≥ 0 } 
	S 
	{Q: r = <∃ i : 0 ≤ i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ }

existe al menos un numero en un indice par, es igual a la suma de los numeros en indices impares.

a) Sabemos que los testing en derivaciones imperativas son con la misma espeficiacion.

Tengamos que:

	A = [7, -3, 0, 5, 2], N = 5. I e {0,2,4}, J e {1,3}

	={Terminos}
	A.0  = A.1 + A.3  v
	A.2  = A.1 + A.3  v
	A.4  = A.1 + A.3  
	={valores del arreglo}
	7 = -3 + 5 v
	0 = -3 + 5 v
	2 = -3 + 5 
	={aritmetica}
	7 = 2 v
	0 = 2 v
	2 = 2 
	={lógica}
	False v False v True 
	={logica}
	True

pte  1)

	Const N : Int, A : array[0, N) of Int; 
	Var r : Int;  // bool?
	{ P : N ≥ 0 } 
	S 
	{Q: r = <∃ i : 0 ≤ i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ }

i) Notemos que es un programa que itera en indices de arreglos, necesitamos un ciclo. para poder derivar el ciclo correctamente, debemos proponer un invariante y una guarda b.

Por tecnica de reemplazo de constantes por variables, propongo:

	INV = r = <∃ i : 0 ≤ i < pos ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 0<= pos <= N

Y una guarda B:

	B = pos < N

Y para saber si termina el ciclo, es trivial que:

	Inv ^ -B => Q 

Y el programa tendrá la estructura de:

	Const N : Int, A : array[0, N) of Int; 
	Var r : Int;  // bool?
	{P : N ≥ 0 } 
	S1;
	do pos < N ->
		S2;
	od
	{Q: r = <∃ i : 0 ≤ i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ }

ii) Sabemos que el ciclo debe iniciarse, propongo:

	r, pos := E, F

y hago la wp

	wp.s1.inv
	={wp :=}
	E = <∃ i : 0 ≤ i < F ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 0<= F <= N
	={elijo F = 0, para forzar rango vacio}
	E = <∃ i : 0 ≤ i < 0 ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 0<= 0 <= N
	={lógica 2 veces}
	E = <∃ i : 0 ≤ i < 0 ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
	={Rango vacio}
	E = False
	={Elijo F = 0, E = False}
	True

El programa con las inicializaciones va quedando:

	Const N : Int, A : array[0, N) of Int; 
	Var r : Int;  // bool?
	{P : N ≥ 0 } 
	r,pos := False, 0
	do pos < N ->
		S2;
	od
	{Q: r = <∃ i : 0 ≤ i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ }

iii) Cuerpo del ciclo, sabemos que el ciclo debe iniciarse, supongo 
Inv ^ B como hipotesis,  asigno: r,pos := E, pos+1 
y hago la wp

	wp.s2.Inv
	={wp :=}
	E = <∃ i : 0 ≤ i < pos+1 ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 0<= pos+1 <= N
	={Lógica en el rango}
	E = <∃ i : i = pos v 0<=i<pos ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 0<= pos+1 <= N
	={Hipotesis, pos < N, y 0<=pos<=N. Distributividad y part de rango}
	E = <∃ i : i = pos ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ v 
		<∃ i : 0 <= i < pos ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩
	={Elim de variable, Hipotesis}
	E = <∃ i : pos mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < pos ∧ j mod 2 = 1 : A.j ⟩ ⟩ v r
	={Division de casos:
			I) pos mod 2 = 0 
			II) pos mod 2 != 0
		}
		-Caso I. pos mod 2 = 0
		={Caso I}
		E = r v <∃ i : pos mod 2 = 0 : A.i = 
				⟨∑ j : 0 ≤ j < pos ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
		={Me trabo, debo fortalecer}
		
		-Caso II. pos mod 2 != 0
		={Caso II}
		E = r v <∃ i : False : A.i = 
				⟨∑ j : 0 ≤ j < pos ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
		={Rango vacio}
		E = r v False
		={elijo E = r}
		True


Debo fortalecer el invariante, propongo:

	INV' = r = <∃ i : 0 ≤ i < pos ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 
			sum = ⟨∑ j : 0 ≤ j < pos ∧ j mod 2 = 1 : A.j ⟩ ^
			0<= pos <= N

y queda Inv' ^ -b => Q trivial


DE NUEVO TODO WOWW
pte 3)
i) Inicilizacion de ciclo. El ciclo debe iniciarse, 
propongo:

	r,pos, sum := E, F, G

y hago la wp

	wp.s1.inv'
	={wp de :=}
	E = <∃ i : 0 ≤ i < F ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 
		G = ⟨∑ j : 0 ≤ j < F ∧ j mod 2 = 1 : A.j ⟩ ^
		0<= F <= N
	={Elijo F = 0, para forzar rango vacios}
	E = <∃ i : 0 ≤ i < 0 ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 
		G = ⟨∑ j : 0 ≤ j < 0 ∧ j mod 2 = 1 : A.j ⟩ ^
		0<= 0 <= N
	={rango vacio, lo q valgan, me harta este loop de mierda}
	E = False ^ 
		G = 0 ^

Quedando el programa de momento:

	Const N : Int, A : array[0, N) of Int; 
	Var r : Bool; pos, sum: Int;  
	{P : N ≥ 0 } 
	r,pos, sum := False, 0, 0
	do pos < N ->
		S2;
	od
	{Q: r = <∃ i : 0 ≤ i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ }

iii) Cuerpo del ciclo, bla bla, hipotesis Inv ^ B como hipotesis
el ciclo avanza, bla:

	r,pos, sum := E, pos+1, G

y hacemos la wp

	wp.s2.inv'
	={wp :=}
	E = <∃ i : 0 ≤ i < pos+1 ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 
		G = ⟨∑ j : 0 ≤ j < pos+1 ∧ j mod 2 = 1 : A.j ⟩ ^
		0<= pos+1 <= N
	={Logica de rango etc}
	E = <∃ i : i = pos v 0<=i<pos ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 
		G = ⟨∑ j : j = pos v 0<=j<pos ∧ j mod 2 = 1 : A.j ⟩ ^
		0<= pos+1 <= N
	={distribucion, part de rango, hip pos < N, 0<=pos<=N}
		E = <∃ i : i = pos ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ v
		<∃ i : 0<=i<pos ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
		^ 
		G = ⟨∑ j : j = pos ∧ j mod 2 = 1 : A.j ⟩ +
		⟨∑ j : 0<=j<pos ∧ j mod 2 = 1 : A.j ⟩ 
	={elim de variable, hipotesis}
	E = r v <∃ i : i = pos ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
		^ 
	G = ⟨∑ j : pos mod 2 = 1 : A.pos ⟩ +
		⟨∑ j : 0<=j<pos ∧ j mod 2 = 1 : A.j ⟩ 
	={Hipotesis}
	E = r v <∃ i : i = pos ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
		^ 
	G = ⟨∑ j : pos mod 2 = 1 : A.pos ⟩ + sum
	={elim de variable}
	E = r v <∃ i : pos mod 2 = 0 : A.pos = 
		⟨∑ j : 0 ≤ j < pos ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
		^ 
	G = ⟨∑ j : pos mod 2 = 1 : A.pos ⟩ + sum
	={Varios casos.
		I) pos mod 2 = 0
		II) pos mod 2 != 0
	}
		-Caso I. pos mod 2 = 0
	E = r v <∃ i : pos mod 2 = 0 : A.pos = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
		^ 
	G = ⟨∑ j : pos mod 2 = 1 : A.pos ⟩ + sum
	={Rango unitario, lógica}
	E = r v A.pos = sum ^ 
	G = ⟨∑ j : False : A.pos ⟩ + sum
	={rango vacio, arit}
	E = r v A.pos = sum ^ 
	G = sum
	
		-Caso II. pos mod 2 != 0
	E = r v <∃ i : pos mod 2 = 0 : A.pos = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
		^ 
	G = ⟨∑ j : pos mod 2 = 1 : A.pos ⟩ + sum
	={lógica, rango falso}
	E = r v False ^
	G = A.pos + sum
	={elijo lo k valgan}

Quendando el programa:

	Const N : Int, A : array[0, N) of Int; 
	Var r : Bool; pos, sum: Int;  
	{P : N ≥ 0 } 
	r,pos, sum := False, 0, 0
	do pos < N ->
		if pos mod 2 = 0 -> r, sum := r v A.pos = sum, sum
		[] pos mod 2 != 0 ->r, sum := r v False, A.pos + sum
		pos := pos+1
	od
	{Q: r = <∃ i : 0 ≤ i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ }

## Terminacion anticipada de ciclos. (Checkear)
Sabemos que lo que cambiará de respuesta, será r, podemos tener la terminacion anticipada por ahí.

	B' = pos < N ^ r 

Teniendo que demostrar:

	Inv' ^ -b' => Q (o inv' ^ C => Q)

Ya sabemos que vale, y que corta el ciclo:

	Inv' ^ -b => Q 

Ahora, supongamos Inv y C como hipotesis, y partamos desde Q

	Inv = r = <∃ i : 0 ≤ i < pos ∧ i mod 2 = 0 : A.i = 
			⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ ^ 0<= pos <= N

	Q
	={def de Q}
	 r = <∃ i : 0 ≤ i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩
	={hipotesis}
	True = <∃ i : 0 ≤ i < pos ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
	={hip de inv,  0<= pos <= N }
	True = <∃ i : 0 ≤ i < pos v pos <= i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
	={part de rango, distributividad}
	True = <∃ i : 0 ≤ i < pos ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ v
	<∃ i : pos <= i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
	={Hipotesis}
	True = r v
	<∃ i : pos <= i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ 
	={hipotesis 2 de nuevo}
	True = r v True
	={coso}
	True

Quedando el programa con refuerzo

	Const N : Int, A : array[0, N) of Int; 
	Var r : Bool; pos, sum: Int;  
	{P : N ≥ 0 } 
	r,pos, sum := False, 0, 0
	do pos < N v r ->
		if pos mod 2 = 0 -> r, sum := r v A.pos = sum, sum
		[] pos mod 2 != 0 ->r, sum := r v False, A.pos + sum
		pos := pos+1
	od
	{Q: r = <∃ i : 0 ≤ i < N ∧ i mod 2 = 0 : A.i = 
		⟨∑ j : 0 ≤ j < i ∧ j mod 2 = 1 : A.j ⟩ ⟩ }

Funcion de cota:

Sabemos que si se está en el ciclo, por funcion de cota:

	Inv ^ B => t>=0

Si cota fuera t < 0, el ciclo terminaria.

Propongo la cota T, su incremento, tal que:

	t = t + pos

(Ya que pos va incrementando en cada iteracion)

La cota se terminaria una vez llegado a N iteraciones.

	t = N

Por cada iteracion en el ciclo, pos se incremetará hasta llegar hasta N. 
Una vez llegado hasta N, (pos = N) el ciclo se corta por que termino de iterar.

(tambine pude haber propuesto, t = N, y por cada iteracion, t = N - pos, hasta que t = 0)

## todo: ver demostracion formal de demostracion de cota.