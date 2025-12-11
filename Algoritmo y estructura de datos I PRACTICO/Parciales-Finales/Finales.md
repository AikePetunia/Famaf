FInal que esta en el apunte.

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
		if pos mod 2 = 0  -> r, sum := r v A.pos = sum, sum
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

mi lectura del teorico la deje en la pagina 44 

Final2-2024

	p.xs = <E as,b,bs: xs = as ++(b:bs): b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>

1) derivar

Veamos que es un programa booleano que trabaja con listas,que se fijate si un elemento B de la lista bs, es igual a la suma de los elementos impares

i) Caso base, para xs = []

	p.[]
	={Especificacion}
	<E as,b,bs: [] = as ++(b:bs): b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	={logica de listas}
	<E as,b,bs: [] = as ^ (b:bs) = [] : b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	={logica}
	<E as,b,bs: [] = as ^ False : b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	={Abs de false, rango vacio de E}
	False

ii) Planteo de hipotesis inductiva. Digo que vale:

	HIP = p.xs =<E as,b,bs: xs = as ++(b:bs): b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>

iii) Paso inductivo, demuestor que vvale para xs=x:xs 

	p.(x:xs)
	={especificacion}
	<E as,b,bs: x:xs = as ++(b:bs): b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	={Tercer excluido, logica de listas}
	<E as,b,bs: x:xs = as ++(b:bs) ^ (as = [] v as != []): b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	={Distributividad, particion de rango}
	<E as,b,bs: x:xs = as ++(b:bs) ^ as = []: b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	v
	<E as,b,bs: x:xs = as ++(b:bs) ^ as != []: b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	={logica de listas, elim de variable}
	<E as,b,bs: x:xs = [] ++(b:bs): b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	v
	<E as,b,bs: x:xs = a:as ++ (b:bs) : b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	={logica de listas, concat, elim de variable}
	<E b,bs: x = b ^ xs = bs : b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	v
	<E as,b,bs: x = a ^ xs = as ++ (b:bs) : b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	={elim de variable, rango unitario}
	x = <Sum i: 0<=i<#xs ^ xs!i mod 2 = 1 : xs!i>
	v
	<E as,b,bs: xs = as ++ (b:bs) : b = 
	<Sum i: 0<=i<#bs ^ bs!i mod 2 = 1 : bs!i>>
	={hipotesis}
	x = <Sum i: 0<=i<#xs ^ xs!i mod 2 = 1 : xs!i>
	v p.xs
	={me trabo, debo modularizar}

pte 2)
modularizo como =

	sumImpar = <Sum i: 0<=i<#xs ^ xs!i mod 2 = 1 : xs!i>

i)

ok aca me doy cuenta q ya hice este final xd



### Final 2024-12-03

1)

	p.xs = <A as,b,bs: xs = as ++ b:bs : b = sum.as + sum.bs>

i) caso base, xs = []

	p.[]
	={especificacion}
	<A as,b,bs: [] = as ++ b:bs : b = sum.as + sum.bs>
	={logica de lsitas}
	<A as,b,bs: as= [] ^ b:bs = [] : b = sum.as + sum.bs>
	={logica de listas}
	<A as,b,bs: as= [] ^ false : b = sum.as + sum.bs>
	={abs de false, rango falso}
	True

ii) Hipotesis inductiva:

	HIP = p.xs =<A as,b,bs: xs = as ++ b:bs : b = sum.as + sum.bs>

iii) Paso inductivo, para xs = x:xs

	p.(x:xs)
	={Especifciacion}
	<A as,b,bs: x:xs = as ++ b:bs : b = sum.as + sum.bs>
	={tercer exluido, logica de listas}
	<A as,b,bs: x:xs = as ++ b:bs ^ (as = [] v as != []): b = sum.as + sum.bs>
	={Distributividad, part de rango}
	<A as,b,bs: x:xs = as ++ b:bs ^ as = []: b = sum.as + sum.bs>
	^
	<A as,b,bs: x:xs = as ++ b:bs ^ as != []: b = sum.as + sum.bs>
	={elim de variable, logica de listas}
	<A b,bs: x:xs = [] ++ b:bs: b = sum.[] + sum.bs>
	^
	<A as,b,bs: x:xs = as ++ b:bs ^ a:as != []: b = sum.a:as + sum.bs>
	={concat de listas vacia, sum de lista vacia, logica de listas}
	<A b,bs: x:xs = b:bs: b = 0 + sum.bs>
	^
	<A as,b,bs: x:xs = a:as ++ b:bs: b = sum.a:as + sum.bs>
	={logica de listass, aritmetica, funcion sum}
	<A b,bs: x = b ^ xs = bs: b = sum.bs>
	^
	<A as,b,bs: x = a ^ xs = as ++ b:bs: b = a + sum.as + sum.bs>
	={elim de variabble 3 veces, rango unitario}
	x = sum.xs ^
	<A as,b,bs: xs = as ++ b:bs: b = x + sum.as + sum.bs>
	={me trabo, debo generalizar}

pte2) Nueva especificacion generalizada

	gp.x.xs = <A as,b,bs: xs = as ++ b:bs : b = x + sum.as + sum.bs>

y demuestro que p.xs es un caso particular de gp.n.xs

	p.xs
	={especificacion}
	<A as,b,bs: xs = as ++ b:bs : b = sum.as + sum.bs>
	={aritmetica}
	<A as,b,bs: xs = as ++ b:bs : b = 0 + sum.as + sum.bs>
	={gp.0.xs}
	gp.0.xs

entonces, queda que:

	gp.0.xs = p.xs

ahora, re-derivamos para la nueva especificacion:

pte 3) 

i) caso base, xs = []

	gp.[]
	={especificacion}
	<A as,b,bs: [] = as ++ b:bs : b = x + sum.as + sum.bs>
	={logica de listas}
	<A as,b,bs: [] = as ^  b:bs = [] : b = x + sum.as + sum.bs>
	={logica de listas, abs de false, rango falso}
	True

ii) Planteo hipotesis 

	HIP = gp.x.xs = <A as,b,bs: xs = as ++ b:bs : b = x + sum.as + sum.bs>

iii) Paso inductivo, para xs = x:xs 

	gp.x.x:xs
	={especificacion}
	<A as,b,bs: x:xs = as ++ b:bs : b = x + sum.as + sum.bs>
	={tercer excluido, logica listas}
	<A as,b,bs: x:xs = as ++ b:bs ^ (as = [] v as != [])} :
	 b = x + sum.as + sum.bs>
	 ={distributividad, part de rango }
	 <A as,b,bs: x:xs = as ++ b:bs ^ as = [] :b = x + sum.as + sum.bs> ^ 
	 <A as,b,bs: x:xs = as ++ b:bs ^ as != [] : b = x + sum.as + sum.bs>
	 ={logica de listas, elim de variable, }
	 <A b,bs: x:xs = [] ++ b:bs : b = x + sum.[] + sum.bs> ^ 
	 <A as,b,bs: x:xs = a:as ++ b:bs : b = x + sum.a:as + sum.bs>
	 ={logica de listas varias veces, sum en [], concat de []}
	 <A b,bs: x:xs = b:bs : b = x + 0 + sum.bs> ^ 
	 <A as,b,bs: x = a ^ xs = as ++ b:bs : b = x + sum.a:as + sum.bs>
	 ={logica de listas, elim de vvariable, aritmetica, funcion sum}
	 	<A b,bs: x = b ^ xs = bs : b = x + sum.bs> ^ 
	 <A as,b,bs:  xs = as ++ b:bs : b = a + x sum.as + sum.bs>
	 ={elimincacion de variable, rango unitario, conmutatividad y hipotesis}
	  x = b + sum.xs ^ gp.(x+a).xs

Quedando el programa:

	p.xs = gp.0.xs

	gp.x.[] = True
	gp.x.(x:xs) = x = b + sum.xs ^ gp.(x+a).xs

1) Sabemso que el testing se hace con el programa ya derivado.

->

	xs = [3,3,1], # de 3. 

	p.[3,3,1]
		3 = 3 + sum.[3,1] ^ gp.(3+1).[1,3] 
		3 = 3 + sum.[3,1] ^ 3 = 3 + sum.[1] ^ gp.(0+1).[1]
		3 = 3 + sum.[3,1] ^ 3 = 3 + sum.[1] ^ 1 = 1 + sum.[] ^ gp.(0+0).[]
	={funcion sum}
		3 = 3 + 3 + 1 ^ gp.(3+1).[1,3] 
		3 = 3 + 3 + 1 ^ 3 = 3 + 1 ^ gp.(0+1).[1]
		3 = 3 + 3 + 1 ^ 3 = 3 + 3 + 1 ^ 1 = 1 + 0 ^ True
	={aritmetica}
		3 = 7 ^ gp.(3+1).[1,3] 
		3 = 7 ^ 3 = 4 ^ gp.(0+1).[1]
		3 = 7 ^ 3 = 4 ^ 1 = 1 ^ True
	={logica}
		False ^ False ^ True ^ True
	={logica}
		False



### Paso inductivo: `xs = y:ys` (NO uses `x:xs`).
Las generalizaciones que usan funciones como sum o demas, no suelen trabajar con letras arbitrarias como a, b. Si no con x, y, x:xs, y:ys .

2)

	const N: Int;
	Var A: array [0,N) of Int;
	{N >= 0}
	S;
	{r = <A i: 0<= i <= N : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!>}

i) Identifiquemos que es un programa que recorre indices de arreglos de tamanio N.
Lo que hace, es devolver un tipo Bool si:

	Se fija si la suma de numeros impares es menor o igual al factorial del indice i.

Como recorre arreglos, necesito un ciclo. Para recorrer el ciclo, necesito un invariante y una guarda B. 

Para invariante, uso la tecnica de reemplazo de constantes por variables:

	INV = r = <A i: 0<= i <= pos : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^ 0 <= pos <= N

Y una guarda B:

	B = pos < N 

Luego:

	Inv ^ -B => Q Trivial

El programa queda con una estructura:

	const N: Int;
	Var A: array [0,N) of Int;
	{N >= 0}
	S1;
	do pos < N ->
		S2;
	od
	{r = <A i: 0<= i <= N : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!>}

ii) Inicializacion del programa. Declaro y inicio las variables necesarias entre P y INV.
Propongo:

	r, pos := E, F

y hago la wp de :=

	wp.s1.Inv
	={wp de :=}
	E = <A i: 0<= i <= F : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^ 0 <= F <= N
	={Elijo F = 0}
	E = <A i: 0<= i <= 0 : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^ 0 <= 0 <= N
	={Logica en el rango, fortalecimiento tmb}
	E = <A i: i = 0 : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!>
	={Rango unitario}
	E = <Sum j: 0 <=j<0 ^ A.j mod 2 = 1: A.j> <= 0!
	={Rango falso, factorial}
	E = 0 <= 1
	={Logica}
	E = True 
	={Elijo E = True}
	True

Quedando el programa de momento:

	const N: Int;
	Var A: array [0,N) of Int;
	{N >= 0}
	r, pos := True, 0;
	do pos < N ->
		S2;
	od
	{r = <A i: 0<= i <= N : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!>}

iii) Cuerpo del ciclo. Las posiciones deben actualizarse, igual que r. Propongo

	r, pos := E, pos+1

supongo Inv ^ B como hipotesis

y hago la wp

	wp.s2.Inv
	={wp de :=}
	E = <A i: 0<= i <= pos+1 : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^ 0 <= pos+1 <= N
	={logica en el rango}
	E = <A i: i=pos+1 v 0<=i<=pos : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^ 0 <= pos+1 <= N
	={Por hipotesis, pos < n, 0<=pos<=N, part de rango}
	E = <A i: i=pos+1 : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^ 
	<A i:  0<=i<=pos : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!>
	<= i!>
	={elim de variable, hipotesis}
	E = <Sum j: 0 <=j<pos+1 ^ A.j mod 2 = 1: A.j> 
	<= pos+1! ^ r
	={me trabo, debo reforzar invariante, ademas se que habran 2 casos}

Propongo nuevo invariante:

	Inv' = 
	r = <A i: 0<= i <= pos : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^
	sum = <Sum j: 0 <=j<pos ^ A.j mod 2 = 1: A.j> ^  
	fac = pos! ^ 0 <= pos <= N

	Inv' => inv (Trivial), conservandose Inv' ^ -B => Q

pte 2) Nuevo programa coninvariante fortalecido.

i) Inicializacion de programa,, neccesito inicializar las variables que se usaran, propongo:

	r,pos,sum,fac := E, F, G, H

y hago la wp

	wp.s1.Inv'
	={wp de :=}
	E = <A i: 0<= i <= F : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^
	G = <Sum j: 0 <=j<F ^ A.j mod 2 = 1: A.j> ^  
	H = F! ^ 0 <= F <= N
	={Elijo F = 0, aritmetica, logica de rango}
	E = <A i: i = 0 : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^
	G = <Sum j: Falsd ^ A.j mod 2 = 1: A.j> ^  
	H = 1 ^ 0 <= 0 <= N 
	={Elim de variable, logica, abs,  rango vacio}
	E = <Sum j: 0 <= j< 0  ^ A.j mod 2 = 1: A.j> <= 0!> ^
	G = 0 ^  
	H = 1 
	={rango vacio de nuevo, aritmetica y logica}
	E= True ^ G = 0 ^ H = 0
	={elijo variables.}

Quedando el programa con la inicializacion hecha

	const N: Int;
	Var A: array [0,N) of Int;
	{N >= 0}
	r, pos, sum, fac := True, 0,0,1
	do pos < N ->
		S2;
	od
	{r = <A i: 0<= i <= N : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!>}

ii) Cuerpo del ciclo. Sabemos que el ciclo debe avanzar por posicione.
Suponggo Inv ^ B como hipotesis. 
Asiigno:

	r,pos,sum,fac := E, pos+1, G, H

y hago la wp


	wp.s2.Inv'
	={wp de :=}
	E = <A i: 0<= i <= pos+1 : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!> ^
	G = <Sum j: 0 <=j<pos+1 ^ A.j mod 2 = 1: A.j> ^  
	H = (pos+1)! ^ 0 <= pos+1 <= N
	={logica en el rango, por hipotesis, pos < N, y 0<=pos<=N}
	E = <A i: i=pos+1 v 0<=i<=pos : 
	<Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!> ^
	G = <Sum j: j=pos v 0<=i<pos^ A.j mod 2 = 1: A.j> ^  
	H = (pos+1)!
	={part de rango, aritmetica en factorial} 
	E = <A i: i=pos+1 : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!> ^
	<A i: 0<=i<=pos : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!> ^
	G = <Sum j: j=pos ^ A.j mod 2 = 1: A.j> +
	<Sum j: 0<=i<pos ^ A.j mod 2 = 1: A.j>  ^  
	H = pos+1 * pos!
	={hipotesis fac, sum, rango unitario, elim de variable}
	E = <Sum j: 0 <=j<pos+1 ^ A.j mod 2 = 1: A.j> <= (pos+1)!> ^
	<A i: 0<=i<=pos : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!> ^
	G = <Sum j: A.pos mod 2 = 1: A.pos> + sum ^  
	H = pos+1 * fac
	={Hipotesis r}
	E = <Sum j: 0 <=j<pos+1 ^ A.j mod 2 = 1: A.j> <= (pos+1)!> ^ r ^
	G = <Sum j: A.pos mod 2 = 1: A.pos> + sum ^  
	H = pos+1 * fac
	={logica en el rango}
	E = <Sum j: j=pos v 0<=j<pos ^ A.j mod 2 = 1: A.j> <= (pos+1)! ^ r ^
	G = <Sum j: A.pos mod 2 = 1: A.pos> + sum ^  
	H = pos+1 * fac
	={part de rango, hip de sum}
	E = <Sum j: j=pos ^ A.j mod 2 = 1: A.j> + sum <= (pos+1)! ^ r ^
	G = <Sum j: A.pos mod 2 = 1: A.pos> + sum ^  
	H = pos+1 * fac
	={eliminacion de variable}
	E = <Sum j: A.pos mod 2 = 1: A.pos> + sum <= (pos+1)! ^ r ^
	G = <Sum j: A.pos mod 2 = 1: A.pos> + sum ^  
	H = pos+1 * fac
	={Analisis por casos. para A.pos mod 2}
		1. Caso 1. Vale condicion A.pos mod 2 = 1
		E = <Sum j: A.pos mod 2 = 1: A.pos> + sum <= (pos+1)! ^ r ^
		G = <Sum j: A.pos mod 2 = 1: A.pos> + sum ^  
		H = pos+1 * fac
		={logica por hipotesis de caso}
		E = A.pos + sum <= (pos+1)! ^ r ^
		G = A.pos + sum ^  
		H = pos+1 * fac
		={Aritmetica en fac }
		E = A.pos + sum <= pos+1 * pos! ^ r ^
		G = A.pos + sum ^  
		H = pos+1 * fac
		={Hipotesis fac}
		E = A.pos + sum <= pos+1 * fac ^ r ^
		G = A.pos + sum ^  
		H = pos+1 * fac
		={Elijo lo q vale cu}
		True
		
		2. Caso 2. Vale condicion A.pos mod 2 = 0
		E = <Sum j: A.pos mod 2 = 1: A.pos> + sum <= (pos+1)! ^ r ^
		G = <Sum j: A.pos mod 2 = 1: A.pos> + sum ^  
		H = pos+1 * fac
		={Logica por hipotesis}
		E = 0 + sum <= (pos+1)! ^ r ^
		G = 0 + sum ^  
		H = pos+1 * fac
		={Arit. Sum ,fac}
		E = sum <= pos+1 * pos! ^ r ^
		G = sum ^  
		H = pos+1 * fac
		={Hipotesis fac}
		E = sum <= pos+1 * fac ^ r ^
		G = sum 
		H = pos+1 * fac
		={Elijo lo que vale cu}
		True

Quedando el programa derviado:

	const N: Int;
	Var A: array [0,N) of Int;
	{N >= 0}
	r, pos, sum, fac := True, 0,0,1
	do pos < N ->
			if A.pos mod 2 = 1 ->
				r,sum := A.pos + sum <= pos+1 * fac ^ r,  A.pos + sum
			[] A.pos mod 2 = 0 ->
				r,sum := sum <= pos+1 * fac ^ r, sum
			fi
			pos, fac := pos+1, pos+1 * fac 
	od
	{r = <A i: 0<= i <= N : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!>}

Terminacion temprana de ciclos.

Sabemos que el ciclo podria terminar perfectamente si se da que r se hace false

O sea:

	C = r

Quedando una guarda B reforzada:

	B' = pos < N ^ r

Ya sabemos que trivialmente:

	Inv' => Inv

Y podemos usar el invariante original, haciendose mas simple
Pudiendo quedar demostrado si:

	Inv' ^ -B => Q == Inv' ^ (-b v -c) => Q

ya sabemso que 

	Inv' ^ -b => Q (Trivial)

Ahora, queremos demostrar que

	Inv ^ -res => Q

Supongamos de hipotesis  verdaderas

	INV = r = <A i: 0<= i <= pos : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> 
	<= i!> ^ 0 <= pos <= N

Y

	-r

Y vemso Q

	Q
	={Def de Q}
	False = <A i: 0<=i<=N : <Sum j: 0 <=j<i ^ A.j mod 2 = 1: A.j> <= i!>
	={logica, i va hasta N como hasta pos, por 0<=pos<=N}
	False = <A i: 0<=i<=N v pos<i<=N: <Sum j: 0<=j<i ^ A.j mod 2 = 1: A.j><= i!>
	={Part de rango}
	False = <A i: 0<=i<=N: <Sum j: 0<=j<i ^ A.j mod 2 = 1: A.j><= i!>
	^ <A i: pos<i<=N: <Sum j: 0<=j<i ^ A.j mod 2 = 1: A.j><= i!>
	={Hipotesis inv}
	False = r ^ <A i: pos<i<=N: <Sum j: 0<=j<i ^ A.j mod 2 = 1: A.j><= i!>
	={abs}
	False = False
	={Logica}
	True


Funcion de cota 

Sabemos que el ciclo itera hasta N veces (La guarda es pos < N)

Sabemos que podemos elegir varias cotas validas, para el caso, elijo a la inicializacion del ciclo:

	t = N

Y dentro del ciclo, la cota decrecera de manera:

	t = N - pos

Demostremos formalmente:

	iv.a) INV ^ B => t >= 0 (si estoy en el ciclo, la cota es mayor iguala 0)

Y supongamos inv, b como hipotesis.

entonces:

	t >= 0
	={def de t}
	N - pos >=0
	={aritmetica}
	N >= pos
	={Hipotesis de inv}
	True

Ahora:

	iv.b) { Inv ^ B ^ T = t} if...fi {t < T}

Y hacemos la wp.

	wp.if...fi.(t < T)
	={wp de if}
	(A.pos mod 2 = 1 v A.pos mod 2 = 0) ^ 
	wp.s2.(t < T) ^
	wp.s3.(t < T)
	={logica, abs de True, wp}
	wp.(r,sum,pos, fac := A.pos + sum <= pos+1 * fac ^ r,  
				A.pos + sum, pos+1, pos+1 * fac).(t < T) ^ 
	wp.(r,sum,pos, fac :=  sum <= pos+1 * fac ^ r, sum, 
				pos+1, pos+1 * fac).(t < T)
	={ valor de t}
	wp.(r,sum,pos, fac := A.pos + sum <= pos+1 * fac ^ r,  
				A.pos + sum, pos+1, pos+1 * fac).(N - pos < T) ^ 
	wp.(r,sum,pos, fac :=  sum <= pos+1 * fac ^ r, sum, 
				pos+1, pos+1 * fac).(N - pos < T)
	={wp :=}
	(N - (pos+1) < T) ^ 
	(N - (pos+1) < T)
	={Hipotesis T = t, arit}
	N - pos - 1 < N - pos ^ 
	N - pos - 1 < N - pos 
	={Aritmetica}
	-1 < 0
	={logica}
	True

/// igual me doy cuenta q hacer la wp en condicional es al pedo, por que la vaariable q debo usar es pos y esta fuera de los ifs... A lo mejor no era ni necesario y me enrede al pedo, de igual manera dejo la version sin enredarme al pedo:

	wp.s4.(t < T)
	={wp de if}
	wp.(pos, fac := pos+1, pos+1 * fac).(t < T) 
	={def de t, wp de :=}
	N - (pos+1) < T
	={Aritmetica, hipotesis, T = t}
	N - pos - 1 < N - pos 
	={Aritmetica}
	-1 < 0
	={logica}
	Tue

Final del 3 de julio del 2024.


	Const N: Int;
	Var a: array [0, N) of Int; r: Num;
	{N > 0}
	S1;
	{r = <Max i: 0<=i<N : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)>}

No se puede usar inf, o -inf

El programa devuelve el numero mas grande de un arreglo, en posicion par, elevandolo y dividiendo por el indice +1

i) Sabemos que el programa recorre indices de arreglos, debemos empezar a recorrerlos.
Necesito un ciclo, para derivar con un ciclo, necesito unainvariatne y una guarda B, propongo:

Para el invariante, uso la tecnica de reemplazo de constantes por variables:

	Inv = r = <Max i: 0<=i<pos : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)>
	^ 0 <=pos <= N

Y una guarda B:

	B: pos < N

Y queda que:

	Inv ^ -b => Q Trivial

ii) con las variables declaradas de r, pos debemos inicializarlas, para que cuando comience el ciclo, se cumpla el invariante. Es decir, debemos encontrar un programa S, para que cumpla:

	{P} S {Inv}

Para este caso, debemos proponer o derivar S. Propongo para este caso:

	r, pos := E, F

Suponemos P, y demostramos por wp, wp.s1.inv:

	wp.s1.inv
	={definicion de wp.}
	wp.(r, pos := E, F).(r = <Max i: 0<=i<pos : <sumj: 0<=j<i ^ 
	j mod 2 = 0: A.j>^2 /(i+1)> ^ 0 <= pos <= N)
	={Notemos que no podemos forzar rango vacio, ya que daria inf, -inf, 
	elijo entonces F = 1, wp de :=}
	E = <Max i: 0<=i<1 : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> ^ 
	0 <= 1 <= N)
	={Logica en el rango, en hipotesis}
	E = <Max i: i=0 : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> ^ 
	0<=1 ^ 1 <= N)
	={Reflexividad, logica arit}
	E = <Max i: i=0 : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> ^ 
	True)
	={Abs, rango unitario}
	E =  <sumj: 0<=j<0 ^ j mod 2 = 0: A.j>^2 /(0+1)
	={Aritmetica, logica en rango} 
	E = <sumj: False ^ j mod 2 = 0: A.j>^2
	={Rango falso}
	E = 0
	={Elijo E = 0}
	True


*(Cuando tengo un Max o Min y no puedo usar −∞/+∞, tengo que:

- elegir la inicialización de las variables (p.ej. `pos`) para que el rango nunca sea vacío en los estados alcanzables, y
- inicializar el acumulador (`r`) con el valor de la expresión cuantificada para el primer índice del rango (no con un “número cualquiera muy chico o muy grande”).)*

Quedando el programa de momento, con inicializacion, ciclo y guarda:

	Const N: Int;
	Var a: array [0, N) of Int; r: Num;
	{N > 0}
	r,pos := 0, 1
	do pos < N ->
		S2;
	od
	{r = <Max i: 0<=i<N : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)>}

iii) Cuerpo del ciclo.

Ahora debemos derivar o proponer un cuerpo del ciclo S para que se mantenga el invariante, es decir, el invariante mantenga el invariante. 

Ademas, sabemos que en el cuerpo del ciclo, las posiciones deben avanzar, propongo:

	r,pos := E, pos+1

Para poder demostrar la terna de: 

	{Inv ^ B } S {Inv}

Y Supongo Inv ^ B como hipotesis, para luego hacer la 

	wp.s2.inv
	={def de wp}
	wp.(r,pos := E, F).(r = <Max i: 0<=i<pos : <sumj: 0<=j<i 
	^ j mod 2 = 0: A.j>^2 /(i+1)> ^ 0 <=pos <= N)
	={wp de :=}
	(E = <Max i: 0<=i<pos+1 : <sumj: 0<=j<i 
	^ j mod 2 = 0: A.j>^2 /(i+1)> ^ 0 <=pos+1<= N)
	={logica en el rango, logica en inv}
	(E = <Max i: i=pos v 0<=i<pos : <sumj: 0<=j<i 
	^ j mod 2 = 0: A.j>^2 /(i+1)> ^ 0<=pos+1 ^ pos+1<=N)
	={logica arit, abs de True, part de rango}
	E = <Max i: i=pos : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> Max 
	<Max i: 0<=i<pos : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> 
	={Rango unitario}
	E =  <sumj: 0<=j<pos ^ j mod 2 = 0: A.j>^2 /(pos+1)> Max 
	<Max i: 0<=i<pos : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> 
	={hipotesis}
	E =  <sumj: 0<=j<pos ^ j mod 2 = 0: A.j>^2 /(pos+1)> Max r
	={Me trabo, refuerzo la hipotesis. Ademas pot no es programable}

pte 2)
Debo fortalecer el invariante, propongo un nuevo inv reforzado:

	Inv' = r = <Max i: 0<=i<pos : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> ^
	sum = <sumj: 0<=j<pos ^ j mod 2 = 0: A.j> ^ 0 <=pos <= N

 Y queda trivialmente que:

	Inv' => Inv

	(Entonces, tambien se mantiene Inv ^ -b => Q)

ii) Inicializacion del ciclo con el fortalecimiento de invariante.
Debemos declarar las nuevas inicializaciones en el ciclo. 
Propongo:

	r,pos,sum := E, F, G

Y hago la wp

	wp.s1.inv
	={Wp de :=}
	E = <Max i: 0<=i<F : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> ^
	G = <sumj: 0<=j<F ^ j mod 2 = 0: A.j>^2 ^ 0 <= F <= N
	={Elijo F = 1, (no forzamos rango vacio para no tener max), logica}
	E = <Max i: i = 0 : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> ^
	G = <sumj: 0<=j<1 ^ j mod 2 = 0: A.j>^2 ^ 0 <= 1 <= N
	={Rango unitario, logica, logica}
	E = <sumj: j = 0 ^ j mod 2 = 0: A.j>^2 /(0+1) ^
	G = 0 ^ 1 <= N ^ 1<= N
	={logica, rango vacio, aritmetica. logica, abs. 
	Sabemos j mod 2 = 0 siempre sera true}
	E = 0 ^
	G = A.0

Con la nueva inicializada, el programa queda:

	Const N: Int;
	Var a: array [0, N) of Int; r: Num;
	{N > 0}
	r,pos,sum := 0, 1, A.0
	do pos < N ->
		S2;
	od
	{r = <Max i: 0<=i<N : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)>}

iii)Cuerpo del ciclo.
Sabemos que las posiciones se deben ir actualizando. Propongo:

	r,pos,sum := E, pos+1, G

// checkiar
Suponemos Inv' ^ B como hipotesis y hacemos la wp. 
Para poder demostra la terna de { Inv ^ B } S { Inv }

	wp.s2.Inv'
	={wp de :=}
	E = <Max i: 0<=i<pos+1 : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> ^
	G = <sumj: 0<=j<pos+1 ^ j mod 2 = 0: A.j> ^ 0 <= pos+1 <= N
	={Logica en el rango, logica en el refuerzo}
	E = <Max i: i=pos v 0<=i<pos : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> 
	^ G = <sumj: j=pos v 0<=j<pos ^ j mod 2 = 0: A.j> ^ 0<=pos+1 ^ pos+1 <=N
	={Distributividad, Part de rango 2 veces, logica, abs de true}
	E = <Max i: i=pos : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> max 
	<Max i:  0<=i<pos : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> ^
	G = <sumj: j=pos ^ j mod 2 = 0: A.j> + <sumj: 0<=i<pos ^ j mod 2 = 0: A.j>
	={Rango unitario, elim de variable, hipotesis }
	E = <sumj: 0<=j<pos ^ j mod 2 = 0: A.j>^2 /(pos+1)> max 
	<Max i:  0<=i<pos : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)> ^
	G = <sumj: pos mod 2 = 0: A.pos> + sum
	={Hipotesis de r}
	E = r max <sum j: 0<=j<pos ^ j mod 2 = 0: A.j>^2 /(pos+1) ^
	G = <sumj: pos mod 2 = 0: A.pos> + sum
	={Hipotesis de sum, pero tengo ^ 2 }
	E = r max ((sum*sum) / (pos+1)) ^
	G = <sumj: pos mod 2 = 0: A.pos> + sum
	={Me trabo, dos casos. pos mod 2 = 0, pos mod 2 = 1}
		- Caso 1. pos mod 2 = 0
		E =  r max ((sum*sum) / (pos+1)) ^
		G = <sum j: pos mod 2 = 0: A.pos> + sum
		={Supogno por hipotesis que pos mod 2 = 0. Dando True}
		E =  r max ((sum*sum) / (pos+1)) ^
		G = A.pos + sum
	
		- Caso 2. pos mod 2 = 1
		E =  r max ((sum*sum) / (pos+1)) ^
		G = <sumj: pos mod 2 = 0: A.pos> + sum
		={Supogno por hipotesis que pos mod 2 = 1. Dando Rango vacio}
		E = r max ((sum*sum) / (pos+1)) ^
		G = 0 + sum
		={Arit}
		E = r max ((sum*sum) / (pos+1)) ^
		G = sum // puede ser skip, ya que queda como sum := sum

Quedando el programa finalmente:

	Const N: Int;
	Var a: array [0, N) of Int; r: Num;
	{N > 0}
	r,pos,sum := 0, 1, A.0
	do pos < N ->
		if pos mod 2 = 0 ->
			sum := A.pos + sum
		[] pos mod 2 = 1 ->
			skip
		fi
			r,pos := r max ((sum*sum) / (pos+1)), pos+1
	od
	{r = <Max i: 0<=i<N : <sumj: 0<=j<i ^ j mod 2 = 0: A.j>^2 /(i+1)>}

Terminacion de ciclo (funcion de cota)

Sabemos que todo ciclo terminar. Intuitivamente, podemos declarar que la funcion de cota, mirando la guarda y el invariante, propongo una cota:

	t = N - pos.

Siendo que N decresera por cada vez se itere, finalmente terminando el ciclo

segun el digesto, si estoy en el ciclo, la cota es >= 0, :

	iv.a) Inv ^ B => t >= 0 

suponemos Inv ^ B y vemos:

	t >= 0
	={def de t}
	N - pos >= 0 
	={Arit.}
	N >= pos
	={Hip. del inv}
	True

Demostrando la no negatividad. 

	iv.b) {INV ^ B ^ t = T} S {t < T}

Demostracion: suponemos como hip Inv ^ B ^ t =T, y vemos la wp

	wp.s2.(t < T)
	={Def de wp}
	(r,pos := r max ((sum*sum) / (pos+1)), pos+1).(t < T)
	={def de t}
	(r,pos := r max ((sum*sum) / (pos+1)), pos+1).(N - pos < T)
	={wp de :=}
	N - (pos+1) < T
	={hip de T}
	N - (pos+1) < N - pos
	={arit}
	-1 < 0

Demostrando que la cota decrece por ccada iteracion del ciclo

Terminacion anticipada de ciclos -> no hay una condición local que te garantice que el máximo definitivo ya fue alcanzado. no hay

2)

Especificar con pre y post condicion y declaracion de variables (sin derviar) los siguientes problemas:

a) Dados los arreglos a y b, determinar si todos los elementos en a, son menores a uno y solo un element de b. O sea, da True si cada elemento de a es menor a uno de b una sola vez.

	Var A: array [0, N), B: array [0, N) of Int;
	Const N: Int; res: Bool;
	{P: N >= 0}
	S
	{Q: res = <A i: 0<=i<N : <N j: 0<=j<N : A.i < B.j> = 1>}

b) Dado un arreglo a no vacio, decir si la resta de dos elementos distintos es mayor que al maximo elemento en el arreglo

	Const A: array [0, N) of Int;
	Var r: Bool;
	{P: N > 0}
	S
	{Q: r = <E i,j: 0<=i<j<N ^ i !=j : A.i - A.j > <Max: 0<=k<N : A.k>>}

3.

	f.xs = <E as,bs: xs = as ++ bs: <Prod i: 0<= i < #as: (as.i)^2> < #as>

i) Caso base, xs = []

	f.[]
	={Especificacion}
	<E as,bs: [] = as ++ bs: <Prod i: 0<= i < #as: (as.i)^2> < #as>
	={Logica de listas}
	<E as,bs: [] = as ^ [] = bs: <Prod i: 0<= i < #as: (as.i)^2> < #as>
	={Rango unitario}
	<Prod i: 0<= i < #[]: ([].i)^2> < #[]
	={def de #, logica en el rango, rango vacio}
	1 < 0
	={coso}
	False

ii) Planteo de hipotesis inductiva:

	Hip = f.xs=<E as,bs: xs = as ++ bs: <Prod i: 0<= i < #as: (as.i)^2> < #as>

iii) Paso inductivo, para xs = x:xs

	f.(x:xs)
	={Especificacion}
	<E as,bs: x:xs = as ++ bs: <Prod i: 0<= i < #as: (as.i)^2> < #as>
	={Logica de listas}
	<E as,bs: x:xs = as ++ bs: <Prod i: 0<= i < #as: (as.i)^2> < #as>
	={Tercer excluido, logica de listas}
	<E as,bs: x:xs = as ++ bs ^ (as = [] v as != []) :
	 <Prod i: 0<= i < #as: (as.i)^2> < #as>
	={Distributividad, part de rango}
	<E as,bs: x:xs = as ++ bs ^ as = []:
	<Prod i: 0<= i < #as: (as.i)^2> < #as> v 
	<E as,bs: x:xs = as ++ bs ^ as != [] : 
	<Prod i: 0<= i < #as: (as.i)^2> < #as> 
	={Elim de variable, logica de listas}
	<E as,bs: x:xs = [] ++ bs: <Prod i: 0<= i < #[]: ([].i)^2> < #[]> v 
	<E as,bs: x:xs = a:as ++ bs ^ a:as != [] : 
	<Prod i: 0<= i < #a:as: (a:as.i)^2> < #a:as> 
	={Elim de variable. Concat}
	<E bs: x:xs = bs: <Prod i: 0<= i < #[]: ([].i)^2> < #[]> v 
	<E as,bs: x:xs = a:as ++ bs : 
	<Prod i: 0<= i < #as + 1: (a:as.i)^2> < #as+ 1> 
	={logica de listas, rango unitario, def de #, logica de rango}
	<Prod i: 0<= i < 0: ([].i)^2> < 0 v 
	<E as,bs: x = a ^ xs = as++ bs:
	<Prod i: 0<= i < #as + 1: (a:as.i)^2>< #as + 1> 
	={Rango vacio, elim de variable}
	1 < 0 v 
	<E as,bs: x = a ^ xs = as ++ bs:
	<Prod i: 0<= i < #as + 1: (a:as.i)^2>< #as + 1 > 
	={ elim de variable, logica en el rango. Logica aritmetica}
	false v <E as,bs: xs = as ++ bs:
	<Prod i: i=0 v 1<=i<#as+1: (x:as.i)^2>< #as + 1 > 
	={part de rango}
	false v <E as,bs: xs = as ++ bs:
	<Prod i: i=0 : (x:as.i)^2> * <Prod i: 1<=i<#as+1: (x:as.i)^2>< #as + 1 >
	={elim de variable, cambio de variablee, i = i+1, aritmetica}
	false v <E as,bs: xs = as ++ bs:
	<Prod i: i=0 : (x:as.0)^2> * <Prod i: 0<=i<#as: (x:as.i+1)^2>< #as + 1>
	={Def de .}
	false v <E as,bs: xs = as ++ bs: x^2 * <Prod i: 0<=i<#as: (as.i)^2> 
	< #as + 1>
	={constante, hipotesis}
	false v f.xs 
EHHHHHHHHHHHHH NO SEEEE
f.[] = false
f.(x:xs) = false v f.xs