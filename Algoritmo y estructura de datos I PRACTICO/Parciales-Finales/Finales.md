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
	={elim de variable, cambio de variable, i = i+1, aritmetica}
	false v <E as,bs: xs = as ++ bs:
	<Prod i: i=0 : (x:as.0)^2> * <Prod i: 0<=i<#as: (x:as.i+1)^2>< #as + 1>
	={Def de .}
	false v <E as,bs: xs = as ++ bs: x^2 * <Prod i: 0<=i<#as: (as.i)^2> 
	< #as + 1>
	={me trabo, debo generalizar}


pte 2) Generalizacion. Nueva especificacion de f.xs:
i)

	gf.n.m.xs=<E as,bs: xs = as ++ bs:n^2* <Prod i: 0<= i < #as: (as.i)^2> < #as +m>

Y demuestro que f.xs es un caso particular de la nueva especificacion.

	f.xs
	={especificacion}
	<E as,bs: xs = as ++ bs: <Prod i: 0<= i < #as: (as.i)^2> < #as>
	={aritmetica}
	<E as,bs: xs = as ++ bs: 1 * <Prod i: 0<= i < #as: (as.i)^2> < #as + 0>
	={esp}
	gf.1.0.xs


ii) Caso base, xs = []

	gf.[]
	={especificacion}
	<E as,bs: [] = as ++ bs: n * <Prod i: 0<= i < #as: (as.i)^2> < #as+m>
	={aritmetica}
	<E as,bs: [] = as ^ bs = []: n * <Prod i: 0<= i < #as: (as.i)^2> < #as +m>
	={elim de variable}
	<E bs: bs = []: n * <Prod i: 0<= i < #[]: ([].i)^2> < #[] +m>
	={rango unitario, def de #, logica}
	n * <Prod i: 0<= i < 0 ([].i)^2> < 0 +m
	={rangovacio}
	n * 1 < 0 + m
	={arit}
	n < m

iii) hipotesis inductiva

	gf.E.xs=<E as,bs: xs = as ++ bs:E * <Prod i: 0<= i < #as: (as.i)^2> < #as + m>

iv) Paso inductivo, para xs = x:xs

	gf.n.(x:xs)
	={Especifcacion}
	<E as,bs: x:xs = as ++ bs:n* <Prod i: 0<= i < #as: (as.i)^2> < #as + m>
	={Logica de listas}
	<E as,bs: x:xs = as ++ bs ^ (as = [] v as != []): 
	n* <Prod i: 0<= i < #as: (as.i)^2> < #as + m>
	={Distributividad y part de rango}
	<E as,bs: x:xs = as ++ bs ^ as = [] : 
	n* <Prod i: 0<= i < #as: (as.i)^2> < #as + m> v 
	<E as,bs: x:xs = as ++ bs ^  as != []: 
	n* <Prod i: 0<= i < #as: (as.i)^2> < #as + m>
	={elim de variable, logica de listas}
	<E bs: x:xs = [] ++ bs : n* <Prod i: 0<= i < #[]: ([].i)^2> < #[] + m> v 
	<E as,bs: x:xs = as ++ bs ^  a:as != []: 
	n* <Prod i: 0<= i < #as: (as.i)^2> < #as + m>
	={elim de varialbe, funcion concat}
	<E bs: x:xs = bs : n * <Prod i: 0<= i < #[]: ([].i)^2> < #[] + m> v 
	<E as,bs: x:xs = a:as ++ bs : n* <Prod i: 0<= i < #a:as: (a:as.i)^2> < #a:as + m>
	={def de #, logica de listas varias veces, rango unitario *del otro paso por q as = []}
	 n * <Prod i: 0<= i < 0: ([].i)^2> < 0 + m> v 
	<E as,bs:x = a ^ xs = as ++ bs : n *
	 <Prod i: 0<= i < #as + 1: (a:as.i)^2> < #as + 1 + m>
	 ={logica, aritmetica, elim de variable. }
	n < m v <E as,bs: xs = as ++ bs : n *
	<Prod i: 0<= i < #as + 1: (x:as.i)^2> < #as + 1 + m>
	={logica en el rango, part d rango. n^2 siempre es positivo}
	n < m  v <E as,bs: xs = as ++ bs : n *
	<Prod i: i = 0: (x:as.i)^2> *
	 <Prod i: 1<= i < #as + 1: (x:as.i)^2>  < #as + 1 + m>
	={Elim de variable, def de ., cambio de var i = i+1, aritmetica. Abs }	
	n < m  v <E as,bs: xs = as ++ bs : n * x^2 * 
	<Prod i: 0<= i < #as: as.i^2>  < #as + 1 + m>
	={constante, conmutatividad. No se si a gen debe abarcar el +1 de # }
	n < m  v <E as,bs: xs = as ++ bs :( n^2 * x^2) * 
	<Prod i: 0<= i < #as: as.i^2> < #as + (1 + m)>
	={hipotesis}
	n^2 < m  v gf.(n * x^2).(m+1).xs


g.p.m.xs =
  ⟨∃ as,bs : xs = as ++ bs :
      p * ⟨Prod i : 0 ≤ i < #as : (as.i)²⟩ < #as + m ⟩

f.xs = g.1.0.xs

g.p.m.[]     = (p < m)
g.p.m.(x:xs) = (p < m) ∨ g.(p * x²).(m + 1).xs

Que problema del orto !

# final 5 de diciembre de 2023


	p.xs = <A as, b, bs: xs = as ++ (b:bs) : b = sum.as + sum.bs>

i) Caso base, xs = []

	p.[]
	={Especificacion}
	<A as, b, bs: [] = as ++ (b:bs) : b = sum.as + sum.bs>
	={logica de listas}
	<A as, b, bs: as = [] ^ b:bs = [] : b = sum.as + sum.bs>
	={logica, rango falso}
	True

ii) Planteo de hipotesis inductiva 

	p.xs = <A as, b, bs: xs = as ++ (b:bs) : b = sum.as + sum.bs>

iii) paso inductivo, xs = x:xs

	p.(x:xs)
	={especificacion}
	<A as, b, bs: x:xs = as ++ (b:bs) : b = sum.as + sum.bs>
	={Logica de listas, tercer excluido}
	<A as, b, bs: x:xs = as ++ (b:bs) ^ (as = [] v as != []): b = sum.as + sum.bs>
	={distributividad, part de rango}
	<A as, b, bs: x:xs = as ++ (b:bs) ^ as = [] : b = sum.as + sum.bs> ^ <A as, b, bs: x:xs = as ++ (b:bs) ^ as != []: b = sum.as + sum.bs>
	={elim de variable}
	<A b, bs: x:xs = [] ++ (b:bs) : b = sum.[] + sum.bs> ^
	 <A as, b, bs: x:xs = a:as ++ (b:bs): b = sum.a:as + sum.bs>
	 ={concat, logica de listas, funcion sum en caso base }
	 <A b, bs: x:xs = (b:bs) : b = 0 + sum.bs> ^
	 <A as, b, bs: x = a ^ xs = as ++ (b:bs) : b = sum.a:as + sum.bs>
	 ={funcion sum, logica de listas, aritmetica}
	 	 <A b, bs: x = b ^ xs = bs: b = sum.bs> ^
	 <A as, b, bs: xs = as ++ (b:bs) : b = sum.x:as + sum.bs>
	 ={elim de variable, funcion sum }
	 	 	 x = sum.xs ^
	 <A as, b, bs: xs = as ++ (b:bs) : b = x + sum.as + sum.bs>
	={me trabo, necesito generalizar}

Pte 2) Nueva especificacion
i)

	gp.n.xs = <A as, b, bs: xs = as ++ (b:bs) : b = n + sum.as + sum.bs>

Y demuestro que p.xs es un caso particular de gp.n.xs

	p.xs
	={especificacion}
	<A as, b, bs: xs = as ++ (b:bs) : b = sum.as + sum.bs>
	={Aritmetica}
	<A as, b, bs: xs = as ++ (b:bs) : b = 0 + sum.as + sum.bs>
	={esp}
	gp.0.xs

Entonces, queda que:

	p.xs = gp.0.xs

ii) Caso base, para xs = []

	gp.n.[]
	={Especificacion}
	<A as, b, bs: [] = as ++ (b:bs) : b = n + sum.as + sum.bs>
	={Logica de listas}
	<A as, b, bs: as = [] ¨^ b:bs = [] : b = n + sum.as + sum.bs>
	={ logica de listas}
	<A as, b, bs: as = [] ¨^ False : b = n + sum.as + sum.bs>
	={Abs de false, rango vacio}
	True

iii) Planteo de hipotesis inductiva

	HIP = gp.E.xs = 
	<A as, b, bs: xs = as ++ (b:bs) : b = E + sum.as + sum.bs>


iv) Paso inductivo, para xs = x:xs

	gp.n.(x:xs)
	={Especificacion}
	<A as, b, bs: x:xs = as ++ (b:bs) : b = n + sum.as + sum.bs>
	={tercer excluido, logica de listas}
	<A as, b, bs: x:xs = as ++ (b:bs) ^ (as = [] v as != []) :
	 b = n + sum.as + sum.bs>
	={Distributividad, part de rango}
	<A as, b, bs: x:xs = as ++ (b:bs) ^ as =: []
	 b = n + sum.as + sum.bs> ^ 
	 <A as, b, bs: x:xs = as ++ (b:bs) ^  as != []:
	 b = n + sum.as + sum.bs>
	 ={Elim de varialbe, logica de listas}
	<A b, bs: x:xs = [] ++ (b:bs): b = n + sum.[] + sum.bs> ^ 
	 <A as, b, bs: x:xs = as ++ (b:bs) ^  a:as != []:
	 b = n + sum.as + sum.bs>
	 ={concat, elim de variable, funcion sum en []}
	<A b, bs: x:xs = b:bs : b = n + 0 + sum.bs> ^ 
	 <A as, b, bs: x:xs = (a:as) ++ (b:bs): b = n + sum.(a:as) + sum.bs>
	 ={Logica de listas varias veces, aritmetica}
	 <A b, bs: x = b ^ xs = bs : b = n + sum.bs> ^ 
	 <A as, b, bs: x = a ^ xs = (as) ++ (b:bs): b = n + sum.(a:as) + sum.bs>
	={Rango unitario, elim de variable}
	x = n + sum.xs> ^ 
	 <A as, b, bs: xs = (as) ++ (b:bs): b = n + sum.(x:as) + sum.bs>
	={Funcion sum}
	x = n + sum.xs> ^ 
	 <A as, b, bs: xs = as ++ (b:bs): b = n + x + sum.as + sum.bs>
	={conmutatividad}
	x = n + sum.xs ^  
	<A as, b, bs: xs = as ++ (b:bs): b = (n + x) + sum.as + sum.bs>
	={Hipotesis}
	x = n + sum.xs ^ gp.(n+x).xs

Quedando el programa:

	p.xs = gp.0.xs

	gp.n.[] = True
	gp.n.(x:xs) = x == n + sum.xs ^ gp.(n+x).xs

b)

	p.[3,3,1], # = 3
	={Expansion}
	3 == 3 + (3+1) ^ gp.(3+3).[3,1]
	3 == 3 + (3+1) ^ 3 == 3 + (1) ^ gp.(3+1).[1]
	3 == 3 + (3+1) ^ 3 == 3 + (1) ^ 3 == 1 + 0 ^ gp.0.[]
	3 == 3 + (3+1) ^ 3 == 3 + (1) ^ 3 == 1 + 0 ^ True
	={Aritmetica}
	3 == 7 ^ 3 == 4 ^ 3 == 1 ^ True
	={abs, bool}
	False

	p.[3.3], # = 3
	={Expansion}
	3 == 3 + 0 ^ gp.(3+0).[3]
	3 == 3 + 0 ^ 3 == 0 + 0 ^ gp.(3+0).[]
	3 == 3 + 0 ^ 3 == 0 + 0 ^ 0 == 0 ^ True
	={arit}
	3 == 3 + 0 ^ 3 = 0 + 0 ^ 0 == 0 ^ True
	={logica, abs}
	False

	p.[0,0]
	={Expansion}
	0 == 0 + 0 ^ gp.(0+0).[0]
	0 == 0 + 0 ^ 0 == 0 + 0 ^ gp.(0+0).[]
	0 == 0 + 0 ^ 0 == 0 + 0 ^ True
	={Arit, bool}
	True

2.

	Const N: Int, A: array[0, N) of Int;
	Var r : Int;
	{P: N >= 0}
	S
	{Q: r = <Max i,j: 0<= i < j <N : |A.i - A.j|>}

Calcular el resultado con A=[3, -2, 1, 0, -2] 

Tenemos:

	A = [3, -2, 1, 0, -2], N = 5. 
	i, j  e {(0,1), (0,2), (0,3), (0,4)
				(1,2), (1,3), (1,4) 
						, (2,3), (2,4)
								   , (3, 4)}
								   
	={Expansion en el termino, para cada i}
	|A.0 - A.1| 
	|A.0 - A.1| max |A.0 - A.2| 
	|A.0 - A.1| max |A.0 - A.2| max |A.0 - A.3|
	|A.0 - A.1| max |A.0 - A.2| max |A.0 - A.3| max |A.0 - A.4|max 
	|A.1 - A.2| max 
	|A.1 - A.2| max |A.1 - A.3|max 
	|A.1 - A.2| max |A.1 - A.3| max |A.1 - A.4|max 
	|A.2 - A.3| max 
	|A.2 - A.3| max |A.2 - A.4|max 
	|A.3 - A.4| max 
	={arit, max de todos, evaluado uno a uno}
	5

b)

	Const N: Int, A: array[0, N) of Int;
	Var r : Int;
	{P: N >= 0}
	S1; 
	{Q: r = <Max i,j: 0<= i < j <N : |A.i - A.j|>}

i) Notemos que necesita recorrer un arreglo, para eso necesitamos un ciclo. Para poder demostrar un ciclo, necesito un invariante y una guarda b

Para el invariante, usamos la tecnica de reemplazo de constante por variable:

	Inv = r = <Max i,j: 0<= i < j < pos : |A.i - A.j|> ^ 0 <= pos <= N

Y para la guarda b:

	B = pos < N

Quedando 

	Inv ^ -b => Q Trivial

Entonces, el programa tendría una estructura:

	Const N: Int, A: array[0, N) of Int;
	Var r, pos : Int;
	{P: N >= 0}
	S1; 
	do pos < N ->
		S2;
	od
	{Q: r = <Max i,j: 0<= i < j <N : |A.i - A.j|>}

Notemos que es un programa que eligiria indices del tipo:

	i, j e {(0,1), (0,2), (0,3). (1,2), (1,3), (2,3)}

ii) Inicilalizacion del ciclo. Sabemos que tenemos que {p} s {inv} y hacer la wp, inicializando las variables. Propongo:

	r, pos := E, F

Y hago la wp

	wp.s1.inv
	={wp de :=}
	E = <Max i,j: 0<= i < j < F: |A.i - A.j|> ^ 0 <= F <= N
	={elijo f = 1.}
	E = <Max i,j: 0<= i < j < 1: |A.i - A.j|> ^ 0 <= 1 <= N
	={Logica}
	E = <Max i,j: 0<= i < j < 1: |A.i - A.j|> ^ 0 <= 1 ^ 1 <= N
	={Logica, abs. Logica en el rango}
	E = <Max i,j: 0<= i < j < 1: |A.i - A.j|>
	={logica en el rango vacio. El maximo toma el neutro xq es abs}
	E = 0

Quedando el programa con las inicializaciones:

	Const N: Int, A: array[0, N) of Int;
	Var r, pos : Int;
	{P: N >= 0}
	r, pos := 0, 1
	do pos < N ->
		S2;
	od
	{Q: r = <Max i,j: 0<= i < j <N : |A.i - A.j|>}

iii) cuerpo del ciclo. Asumo Inv ^ B como hipotesis, sabemos que el ciclo debe avanzar, propongo:

	r, pos := E, pos +1 

y hago la wp

	wp.s2.Inv 
	={wp de :=}
	E = <Max i,j: 0<= i < j < pos+1 : |A.i - A.j|> ^ 0 <= pos+1 <= N
	={logica, hip varias}
	E = <Max i,j: 0<=i<j<pos v (0<=i<j<pos ^ j = pos) :|A.i - A.j|> 
	={part de rango}
	E = <Max i,j: 0<=i<j<pos :|A.i - A.j|> max
	 <Max i,j: (0<=i<j<pos ^ j = pos) :|A.i - A.j|> 
	={elim de variable, hipotesis}
	E = r max <Max i,j: 0<=i<pos<pos :|A.i - A.pos|> 
	={logica}
	E = r max <Max i,j: 0<=i<pos :|A.i - A.pos|> 
	<- ojo: no fortalecer! hay problema de borde. // HOW
	= { USO AYUDA A: | Z | = Z max (-Z) }
	E = r max <Max i : 0 ≤ i < pos : (A.i - A.pos) max (- (A.i - A.pos))>
	={Regla del termino} 
	E = r max <Max i : 0 ≤ i < pos : (A.i - A.pos)> 
	max <Max i : 0 ≤ i < pos : (- (A.i - A.pos)>
	={aritmetica}
	E = r max <Max i : 0 ≤ i < pos : +A.i - A.pos)> 
	max <Max i : 0 ≤ i < pos : -A.i + A.pos)>
	={Lógica}
	E = r max <Max i : 0 ≤ i < pos : +A.i> 
	max <Max i : 0 ≤ i < pos : -A.i>

Fortalecimiento de invariante:

	Inv' = r = <Max i,j: 0<= i < j < pos : |A.i - A.j|> 
	^ max1 = <Max i : 0 ≤ i < pos : +A.i> ^ max2 = <Max i : 0 ≤ i < pos : -A.i>
	^ 0 <= pos <= N

pte 2)

i) inicializacion, sabemos que ciclo debe inicializarse con las nuevas variables para que se cumpla en {p} s {inv}, propongo:

	r,pos,max1,max2 := E, F, G, H

y hago la wp

	wp.s1.inv'
	={Wp de :=}
	E = <Max i,j: 0<= i < j < F : |A.i - A.j|> 
	^ G = <Max i : 0 ≤ i < F : +A.i> ^ H = <Max i : 0 ≤ i < F : -A.i> 
	^ 0 <= F <= N
	={Elijo F = 0, para forzar rango vacio}
	E = <Max i,j: 0<= i < j < 0 : |A.i - A.j|>  ^ 
	G = <Max i : 0 ≤ i < 0 : +A.i> ^ H = <Max i : 0 ≤ i < 0 : -A.i> ^ 
	0 <= 0 <= N
	={hipotesis varias, rango vacio. Sabemos que el neutro de max en este caso es 0}
	E = 0 ^ 
	G = 0 ^ H = 0 ^ 
	True
	={elijo coso}
	True

Quedando el programa con la inicializacion:

	Const N: Int, A: array[0, N) of Int;
	Var r, pos, max1,max2: Int;
	{P: N >= 0}
	r,pos, max1,max2 := 0, 0, 0, 0
	do pos < N ->
		S2;
	od
	{Q: r = <Max i,j: 0<= i < j <N : |A.i - A.j|>}

ii) Cuerpo del ciclo. El ciclo debe de avanzar. Supongo Inv' ^ B como hipotesis, y hago la wp.
Propongo las variables:

	r,pos,max1,max2 := E, pos+1, G, H

y hago la wp.

	wp.s2.inv'
	={wp de :=}
	E = <Max i,j: 0<= i < j < pos+1 : |A.i - A.j|> 
	^ G = <Max i : 0 ≤ i < pos+1 : +A.i> ^ 
	H = <Max i : 0 ≤ i < pos+1 : -A.i>
	^ 0 <= pos+1 <= N
	={Logica en los rangos, hip varias}
	E = <Max i,j: (0<=i<j<pos) v (j = pos ^ 0<=i<pos) : |A.i - A.j|> 
	^ G = <Max i : i = pos v 0 ≤ i < pos : +A.i> ^ 
	H = <Max i : i = pos v 0 ≤ i < pos : -A.i>
	={Part de rango varias veces}
	E = <Max i,j: 0<=i<j<pos : |A.i - A.j|> max
	<Max i,j: (j = pos ^ 0<=i<pos) : |A.i - A.j|> ^ 
	G = <Max i : i = pos : +A.i> max 
	<Max i : 0 ≤ i < pos : +A.i> ^ 
	H = <Max i : i = pos v 0 ≤ i < pos : -A.i> max 
	<Max i : 0 ≤ i < pos : -A.i>
	={Elim de variable}
	E = <Max i,j: 0<=i<j<pos : |A.i - A.j|> max 
	<Max i,j: 0<=i<pos : |A.i - A.pos|> ^ 
	G = A.pos max <Max i : 0 ≤ i < pos : +A.i> ^ 
	H = -A.pos max <Max i : 0 ≤ i < pos : -A.i>
	={Hipotesis}
	E = r max <Max i: 0<=i<pos : |A.i - A.pos|> ^ 
	G = A.pos max max1 ^ 
	H = -A.pos max max2
	={ayuda a}
	E = r max <Max i: 0<=i<pos : (A.i - A.pos) max (-(A.i - A.pos))> ^ 
	G = A.pos max max1 ^ 
	H = -A.pos max max2
	={aritmetica}
	E = r max <Max i: 0<=i<pos : (A.i - A.pos) max (-A.i + A.pos))> ^ 
	G = A.pos max max1 ^ 
	H = -A.pos max max2
	={Rango del termino}
	E = r max <Max i: 0<=i<pos : (A.i - A.pos)> max <max: 0<=i<pos :
	 (-A.i + A.pos))>
	G = A.pos max max1 ^ 
	H = -A.pos max max2
	={Hipotesis}
	E = r max max1 - A.pos max max2 A.pos
	G = A.pos max max1 ^ 
	H = -A.pos max max2

Quedando:

	Const N: Int, A: array[0, N) of Int;
	Var r, pos, max1,max2: Int;
	r, max1, max2, pos := 0, 0, 0, 0 ;
	do pos < N → 
	r, max1, max2, pos := 
	r  max  ( max1 +  (-A.pos)  )   max  ( max2 + A.pos  ), 
	max1  max A.pos, 
	max2  max (- A.pos), 
	pos+1
	od

(No tiene terminacion anticiapada, pues es max)

![[Pasted image 20251212123016.png]]


	Const N: Int, A: array [0, N) of Int;
	Var res: Bool;
	{P: N >= 1}
	S1;
	{Q: res = <Ei: 0<= i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>}

Se fija si existe en los segmentos inicales del arreglo +1 * El numero en su posicion da igual a uno

A) A = [-4, 2,4,-3] , N = 3, i e {0,1,2,3}, j e {0,1,2} (j llega hasta casi i)

	i = 0
		0 + 1 * A.0 v
	i = 1
		0 + 1 * A.0 + 1 + 1 * A.1 v
	i = 2
		0 + 1 * A.0 + 1 + 1 * A.1 + 2 + 1 * A.2 v
	i = 3
		0 + 1 * A.0 + 1 + 1 * A.1 + 2 + 1 * A.2 + 3 + 1 * A.3 
	={Posiciones de arreglo, aritmetica}
	i = 0
		0 v
	i = 1
		1 * -4  + 2 * 2 v
	i = 2
		1 * -4  + 2 * 2 + 3 * 4 v
	i = 3
		1 * -4  + 2 * 2 + 3 * 4 + 4 * -3 v
	={Aritmetica}
	i = 0
		0 = 1 v
	i = 1
		0 v
	i = 2
		12 v
	i = 3
		0 v
	={exp bool}
		False 


b)

	Const N: Int, A: array [0, N) of Int;
	Var res: Bool;
	{P: N >= 1}
	S1;
	{Q: r = <Ei: 0<= i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>}

i) Es un programa que itera entre posiciones de arreglo, necesito un ciclo. 
para derivar un ciclo, necesito un invariante y una guarda, 

para el invariante, uso la tecnica de cambio de constantes por variables:

	Inv = r = <Ei: 0<= i <= pos: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	^ 0 <= pos <= N

Para la guarda B:

	B = pos < N

Quedando Inv ^ -b => Q Trivial

ii) Inicializacion del ciclo, tengo que hacer la terna de {p} s {inv}, tenemos que inicializar las variables que se encuentran en el invariante, propongo como incognitas:

	r, pos := E, F 

y hago la wp:

	wp.s1.inv
	={wp de :=}
	E = <Ei: 0<= i <= F: <sum j: 0<=j<i : (j+1) * A.j> = 1> ^ 0 <= F <= N
	={elijo F = 0}
	E = <Ei: 0<= i <= 0: <sum j: 0<=j<i : (j+1) * A.j> = 1> ^ 0 <= 0 <= N
	={logica}
	E = <Ei: i = 0: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	={rango unitario}
	E = <sum j: 0<=j<0 : (j+1) * A.j> = 1
	={logica en el rango, rango vacio}
	E = (0 = 1)
	={logica}
	E = False

Quedando el programa con las variables, la guarda, etc:

	Const N: Int, A: array [0, N) of Int;
	Var res: Bool;
	{P: N >= 1}
	r, pos := false, 0;
	do pos < N ->
		s2; // cuerpo del ciclo
	od
	{Q: r = <Ei: 0<= i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>}

iii)
Cuerpo del ciclo. Supongo Inv ^ B como hipotesis. Sabemos que el ciclo debe avanzar, propongo:

	r, pos := E, pos+1

y hago la wp

	wp.s2.inv
	={wp de :=}
	E = <Ei: 0<= i <= pos+1: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	^ 0 <= pos+1 <= N
	={Hip varias, logica en el rango}
	E = <Ei: i = pos+1 v 0<=i<=pos: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	={part de rango}
	E = <Ei: i = pos+1 : <sum j: 0<=j<i : (j+1) * A.j> = 1>  v 
	<Ei: 0<=i<=pos: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	={hipotesis, rango unitario}
	E = r v <sum j: 0<=j<pos+1 : (j+1) * A.j> = 1
	={logica en el rango}
	E = r v <sum j: j = pos v 0<=j<pos : (j+1) * A.j> = 1
	={part de rango, rango unitario}
	E = r v (pos+1) * A.pos + <sum j: 0<=j<pos : (j+1) * A.j> = 1= 1
	={me trabo, refuerzo el inv, no puedo llegar a la HI}

pte 2) 

Fortalecimiento de invariante, proponogo:

	inv' = inv ^ sum = <sum j: 0<=j<pos : (j+1) * A.j> ^ 0 <= pos <= N 

O sea: 

	Inv` = r = <Ei: 0<= i <= pos: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	^ sum = <sum j: 0<=j<pos : (j+1) * A.j> ^ 0 <= pos <= N 

Quedando trivial que:

	Inv' => Inv 

Y tmb:

	inv' ^ -b => Q

i) Inicializacion del ciclo con el nuevo invariante. Para hacer {p} s {inv} se deben inicializar las variables. Propongo 

	r, pos, sum := E, F, G

Y hago la wp:

	wp.s1.inv'
	={wp de :=}
	E = <Ei: 0<= i <= F: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	^ G = <sum j: 0<=j<F : (j+1) * A.j> ^ 0 <= F <= N 
	={elijo f = 0}
	E = <Ei: 0<= i <= 0: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	^ G = <sum j: 0<=j<0 : (j+1) * A.j> ^ 0 <= 0 <= N 
	={logica varias veces, rango falso}
	E = <Ei: i = 0: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	^ G = 0 
	={rango unitario, 0 = 1 == False}
	E = False ^ 
	G = 0

Quedando la inicializacion:

	Const N: Int, A: array [0, N) of Int;
	Var res: Bool;
	{P: N >= 1}
	r, pos, sum := false, 0, 0;
	do pos < N ->
		s2; // cuerpo del ciclo
	od
	{Q: r = <Ei: 0<= i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>}


ii) Cuerpo del ciclo, el ciclo debe avanzar. Supongo Inv' ^ b. Supongo:

	r,pos, sum := E, pos+1, G

y haog la wp.

	wp.s2.inv'
	={wp de :=}
	E = <Ei: 0<= i <= pos+1: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	^ G = <sum j: 0<=j<pos+1 : (j+1) * A.j> ^ 0 <= pos+1 <= N 
	={logica en los rangos, rangos}
	E = <Ei: i=pos+1 v 0<=i<=pos: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	^ G = <sum j: j=pos v 0<=j<pos : (j+1) * A.j> ^ 0<= pos+1 ^ pos+1 <= N 
	={part de rango}
	E = <Ei: i=pos+1: <sum j: 0<=j<i : (j+1) * A.j> = 1> v 
	<Ei: 0<=i<=pos: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	^ G = <sum j: j=pos  : (j+1) * A.j> + <sum j: 0<=j<pos : (j+1) * A.j>
	={rango unitario, lohipotesis}
	E = r v <sum j: 0<=j<pos+1 : (j+1) * A.j> = 1 v 
	^ G = sum + <sum j: j=pos  : (j+1) * A.j>
	={elim de variable, logica en el rango}
	E = r v <sum j: j = pos v 0<=j<pos : (j+1) * A.j> = 1 v 
	^ G = sum + (pos+1) * A.pos
	={part de rango}
	E = r v  (pos+1) * A.pos + 
	<sum j: 0<=j<pos : (j+1) * A.j> = 1 
	^ G = sum + (pos+1) * A.pos
	={hip}
	E = r v (pos+1) * A.pos + sum = 1 
	^ G = sum + (pos+1) * A.pos
	={elijoo coso programa re piola}

	Const N: Int, A: array [0, N) of Int;
	Var res: Bool;
	{P: N >= 1}
	r, pos, sum := false, 0, 0;
	do pos < N ->
		r, pos, sum := r v ((pos+1) * A.pos + sum) = 1, pos+1, 
		sum + (pos+1) * A.pos
	od
	{Q: r = <Ei: 0<= i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>}

Funcion de cota.  
Sabemos que el ciclo puede etirar cierta cantidad de veces, la funcion de cota lo que nos permite es saber si realmente un programa termina. Para obtener la cota, con ver la guarda y el invariante basta. Propongo la cota:

	t = N - pos

Y, supongo Inv ^ B como hipotesis, ahora demostramos la no negatividad:

	iv.a) Inv ^ B => t >= 0

	t >+ 0 
	={Def de t}
	N - pos >= 0
	={Aritmetica}
	N >= pos
	={Logica}
	True

Y que decrece por cada iteracion de ciclo:

	iv.b) {Inv ^ B ^ t = T} S {t < T}
->

	wp.s.(t < T)
	={wp con s (con lo que nos importa)}
	(pos := pos+1).(t<T)
	={hip t}
	(pos := pos+1).(N - pos<T)
	={Wp de :=}
	(N - (pos+1)<T)
	={Aritmetica}
	N -pos -1
	={Hip de T}
	N - pos -1 < N - pos
	={Aritmetica}
	-1 < 0
	={Logica}
	True

Demostrado que decrece en cada iteracion

Ahora, este programa perfectamente podria terminar si r en algun momento de la iteracion se hace true, logicamente: r = -r (Hipotesis2)
Reforzamos la guarda B con:

	B' = pos < N ^ r

Y hacemos la wp, suponiendo Inv' ^ Q como hipotesis1. 

	Q
	={Def de q}
	-r = <Ei: 0<= i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	={Def de -r}
	false = <Ei: 0<= i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	={Hip varias, logica}
	false = <Ei: 0<= i <= N v pos <=i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	={Part de rango}
	false = <Ei: 0<= i <= N : <sum j: 0<=j<i : (j+1) * A.j> = 1> 
	v <Ei: pos <=i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	={Hipotesis}
	false = r v <Ei: pos <=i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	={Logica}
	false = -r v <Ei: pos <=i <= N: <sum j: 0<=j<i : (j+1) * A.j> = 1>
	={Logica, abs}
	False = False
	={Logica}
	True


Final 2022-12-05

f.xs.ys = <max as, bs, cs: xs = as ++ bs ^ ys = as ++ cs: prod.as>

ES un programa que encuentra el maximo producto de un segmento inicial. 

i) Caso base, para xs = []

	f.[].ys
	={espeficacion}
	<max as, bs, cs: [] = as ++ bs ^ ys = as ++ cs: prod.as>
	={Logica de listas}
	<max as, bs, cs: [] = as ^ [] = bs ^ ys = as ++ cs: prod.as>
	={Elim de variable}
	<max as, bs, cs: ys = [] ++ cs: prod.[]>
	={Rango unitario, prod en cao base}
	1


ii) Planteo de hipotesis inductiva:

	Hip = f.xs.ys = <max as, bs, cs: xs = as ++ bs ^ ys = as ++ cs: prod.as>

iii) Paso inductivo, xs = x:xs 

	f.(x:xs).ys
	={Especificacion}
	<max as, bs, cs: x:xs = as ++ bs ^ ys = as ++ cs: prod.as>
	={Tercer excluido, Logica de listas}
	<max as, bs, cs: (x:xs = as ++ bs ^ ys = as ++ cs) ^ (as =[] v as != []) 
	: prod.as>
	={Distributividad, part de rango}
	<max as, bs, cs: x:xs = as ++ bs ^ ys = as ++ cs ^ as =[] : prod.as> max 
	<max as, bs, cs: x:xs = as ++ bs ^ ys = as ++ cs ^ as !=[] : prod.as>
	={Logica de listas, elim de variable}
	<max as, bs, cs: x:xs = [] ++ bs ^ ys = [] ++ cs : prod.[]> max 
	<max as, bs, cs: x:xs = a:as ++ bs ^ ys = a:as ++ cs : prod.a:as>
	={Funcion concat, prod en caso base, logica de listas varias veces}
	<max as, bs, cs: x:xs = bs ^ ys = cs : 1> max 
	<max as, bs, cs: x:xs = a:as ++ bs ^ ys = a:as ++ cs : prod.a:as> 
	={Termino de constante}
	1 max <max as, bs, cs: x:xs = a:as ++ bs ^ ys = a:as ++ cs : prod.a:as> 
	={Logica de listas, varios casos. ys puede ser una lista vacia o no.
	Tengo que hacer sub induccion en ys.}
	
		1. p.(x:xs).(y:ys) Paso inductivo de ambos
		1 max <max as, bs, cs: x:xs = a:as ++ bs ^ 
		y:ys = a:as ++ cs : prod.a:as>
		={Logica de listas varias veces} 
		1 max <max as, bs, cs: x = a ^ xs = as ++ bs ^ y = a ^ 
		ys = as ++ cs : prod.a:as>
		={Elim de variable}
		1 max <max as, bs, cs: xs = as ++ bs ^ y = a ^ 
		ys = as ++ cs : prod.x:as>
		={Funcion prod}
		1 max <max as, bs, cs: xs = as ++ bs ^ y = a ^ 
		ys = as ++ cs : x * prod.as>
		={Varios casos:
			1. y = a 
			2. y != a}

			3. y = a 
			1 max <max as, bs, cs: xs = as ++ bs ^ y = a ^ 
			ys = as ++ cs : x * prod.as>
			={Logica, y = a }
			1 max <max as, bs, cs: xs = as ++ bs ^ True ^ 
			ys = as ++ cs : x * prod.as>
			={Abs}
			1 max <max as, bs, cs: xs = as ++ bs ^ ys = as ++ cs : x * prod.as>
			={Me trabo, debo de generalizar. }

			4. 
			1 max <max as, bs, cs: xs = as ++ bs ^ y != a ^ 
			ys = as ++ cs : x * prod.as>
			={Logica, y != a}
			1 max <max as, bs, cs: xs = as ++ bs ^ False ^ 
			ys = as ++ cs : x * prod.as>
			={Absorbente}
			1 max <max as, bs, cs: False : x * prod.as>
			={Rango vacio}
			1 max -inf
			={Funcion max}
			1

		2.  p.(x:xs).[] Paso inductivo de ambos
		1 max <max as, bs, cs: x:xs = a:as ++ bs ^ 
		[] = a:as ++ cs : prod.a:as>
		={Logica de listas varias veces} 
		1 max <max as, bs, cs: x = a ^ xs = as ++ bs ^ False : prod.a:as>
		={Abs}
		1 max -inf
		={funcion max}
		1

	Const M: Int;
	Var A: Array [0, M) of Int, r: Int;
	{M > 0}
	S
	{r = <max i: 0 <= i <= M: <sum j: 0<=j<k: A.j> - i!>}

Notas:
"Descubrir" una descripcion mas adecuada para un final:

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
	={def de q. Lo que se hara es buscar la hipotesis y algun rango raro del refuerzo del inv}

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

Como es el sacarse los rangos reforzados de invariante, no se si es por hipotesis. (0<=pos<=N)

Notas mas generales: 

Tener cuidado con los parentesis !

Tener cuidado con los rangos, las particiones pueden ser muy dsitintas y pueden dar problemas de bordes. (Si terminamos con i que no esta cuantificado, un pos+1 en una asignacion que no sea de pos, probablemente sea problema de borde) 

Muy probablemente un programa jamas termine teniendo en ciclo un 

	A.pos+1