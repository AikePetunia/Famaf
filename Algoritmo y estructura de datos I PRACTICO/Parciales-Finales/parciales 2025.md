
	p.xs = <E as,b,bs : xs = as ++ (b:bs): b = sum.as + sum.bs>

a) dar una lista xs con #xs >= 3 tal que valga p.xs 

b) dar una lista xs con #xs >= tal que no valga p.xs

c) derivar y dar un programa.

La especificacion es una expresion booleana que pide un numero que iguale a la suma de dos partes de la lista xs.
algo del estilo:

4 = 2 + 2

sabemos que xs, se puede partir de maneras diferentes, definamos un arreglo de tamaño 4

a)
b tiene que ser igual a la suma de todos los otros elementos de la lista.

as ++ (b : bs)
       ↑
       acá vive b, separadito

-> la funcion de sum sobre una lista suma el primer elemento que tiene. 
elijamos, partamos: 

xs = [10, 5 5]
as = [], b = 10, bs = [5,5]
10 = sum.[] + sum[5, 5]
10 = 10

b) 
por ejemplo p.xs=[-12, 1, 0,323]
as = [], b = -12, bs=[1,0,323]
sum.as + sum.bs = 324 != -12

pte 1) 

Especificacion:

	p.xs = <E as,b,bs : xs = as ++ (b:bs): b = sum.as + sum.bs>

i) Caso base, xs = []

	p.[]
	={especificacion}
	<E as,b,bs : [] = as ++ (b:bs): b = sum.as + sum.bs>
	={logica de listas}
	<E as,b,bs : as = [] ^  (b:bs) = []: b = sum.as + sum.bs>
	={logica de listas, abs}
	<E as,b,bs : False : b = sum.as + sum.bs>
	={rango vacio}
	False


ii) Planteo de hipotesis inductiva:

	p.xs = <E as,b,bs : xs = as ++ (b:bs): b = sum.as + sum.bs>


iii) caso inductiva, x:xs=[]

	p.(x:xs)
	={especificacion}
	<E as,b,bs : (x:xs) = as ++ (b:bs): b = sum.as + sum.bs>
	={lógica de listas, tercer excluido}
	<E as,b,bs : (x:xs) = as ++ (b:bs) ^ True: b = sum.as + sum.bs>
	={lógica de lsitas}
	<E as,b,bs : (x:xs) = as ++ (b:bs) ^ (as = [] v as !=[]): b = sum.as + sum.bs>
	={log de listas, part de rango}
	<E as,b,bs : (x:xs) = as ++ (b:bs) ^ a:as !=[]: b = sum.as + sum.bs> v <E as,b,bs : (x:xs) = as ++ (b:bs) ^ as = [] : b = sum.as + sum.bs>
	={lógica de listas, elim de variable}
	<E as,b,bs : (x:xs) = a:as ++ (b:bs) : b = sum.a:as + sum.bs> v <E as,b,bs : (x:xs) = [] ++ (b:bs) : b = sum.as + sum.bs>
	={lógica de listas, concat}
	<E as,b,bs : a = x ^ xs = as ++ b:bs : b = sum.(a:as) + sum.bs> v <E as,b,bs : x = b ^ xs = bs : b = sum.as + sum.bs>
	={elim de variable, funcion sum}
	<E as,b,bs :  xs = as ++ b:bs : b = x + sum.as + sum.bs> v <E b,bs :  xs = bs : x =  sum.as + sum.bs>
	={me trabo, no puedo usar HI}

pt2) Generalizacion.

No puedo usar hipotesis, aparece un termino adicional, planteo una nueva especificacion:

	gp.n.xs = <E as,b,bs : xs = as ++ (b:bs): b = n + sum.as + sum.bs>

y demuestro que p.xs es solo un caso particular de gp.0.xs

Nueva derivacion de p.xs

	p.xs
	={especificacion}
	<E as,b,bs : xs = as ++ (b:bs): b =  sum.as + sum.bs>
	={aritmetica}
	<E as,b,bs : xs = as ++ (b:bs): b = 0 +  sum.as + sum.bs>
	={especifcacion de gp.n.xs, con n = 0}
	gp.0.xs

i) caso base para gp.n.[]


	gp.n.[]
	={especificacion}
	<E as,b,bs : [] = as ++ (b:bs): b = n + sum.as + sum.bs>
	={lógica de listas}
	<E as,b,bs : as = [] ^ b:bs = []: b = n + sum.as + sum.bs> 
	={logica, b:bs=[] no es una lista vacia, false, abs}
	False


ii) Planteo de hipotesis inductiva para la especificacion:

	Hip = gp.E.xs = <E as,b,bs : xs = as ++ (b:bs): b = E + sum.as + sum.bs>


iii) paso inductivo, demuestro que vale para xs=x:xs

	gp.n.(x:xs)
	={especificacion}
	<E as,b,bs : x:xs = as ++ (b:bs): b = n + sum.as + sum.bs>
	={tercer excluido, logica de lsitas}
	<E as,b,bs : x:xs = as ++ (b:bs) ^ (as = [] v as != []): b = n + sum.as + sum.bs>
	={lógica de listas, part de rango}
	<E as,b,bs : x:xs = as ++ (b:bs) ^ as = [] : b = n + sum.as + sum.bs> ^
	 <E as,b,bs : x:xs = as ++ (b:bs) ^ as != []: b = n + sum.as + sum.bs>
	 ={lógica de listas, elim de variable}
	<E as,b,bs : x:xs = [] ++ (b:bs) : b = n + sum.[] + sum.bs> ^
	 <E as,b,bs : x:xs = a:as ++ (b:bs) : b = n + sum.a:as + sum.bs>
	  ={concat, lógica de listas varias veces}
	<E as,b,bs : x:xs = (b:bs) : b = n + sum.[] + sum.bs> ^
	 <E as,b,bs : x = a ^ xs = as ++ b:bs : b = n + sum.a:as + sum.bs>
	={lógica de listas, elim de variable}
	<E as,b,bs : x:xs = b:bs : b = n + sum.[] + sum.bs> ^
	 <E as,b,bs : xs = as ++ b:bs : b = n + sum.x:as + sum.bs>
	={fun sum, aritmetica}
	<E b,bs : x:xs = b:bs : b = n + sum.bs> ^
	 <E as,b,bs : xs = as ++ b:bs : b = n + x + sum.as + sum.bs>
	={conmutatividad, hip}
	<E b,bs : x:xs = b:bs : b = n + sum.bs> ^ gp.(n+x).xs
	={logica de listas}
	<E b,bs : x = b ^ xs = bs : b = n + sum.bs> ^ gp.(n+x).xs
	={elim de var}
		<E b,bs :  : x = n + sum.xs> ^ gp.(n+x).xs
		={rango unitario}
		x = n + sum.xs ^ gp.(n+x).xs


Quedando el programa:

p.xs = gp.0.xs 

gp.n.[] = False
gp.n.(x:xs) = x = n + sum.xs ^ gp.(n+x).xs

2)

	const N: Int, A: array [0, N) of Int;
	Var r: Bool;
	{P: N >= 0}
	S
	{Q:r=<Ai : 0<=i<= N : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j>} 


Pte 1)
A) Calcular el resultado para A =[2,5,7,3] usando la especificacion. Justificar, enumerando todos los elementos del rango.
B) Derivar un programa imperativo que resuelva, fortaleciendo y usando un solo ciclo.
C) Optimizar el ciclo fortaleciento la guarda para que el programa termine si se hace falso el resultar r

A) Sabemos que por # de A es N = 4, con A = [2,5,7,3] (44)
Entendamos que el programa compara si los numeros en indices impares son menores o iguales a un numero en un indice par, devolviendo un booleano

A=[2,5,7,3], N = 4. Entonces, i,j e {0,1,2,3,4}

-> <sum j: 0<=j<0 ^ j mod 2 = 1: A.j> <= <sum j: 0 <= j < 0 ^ j mod 2 = 0: A.j> ^  (i=0)
<sum j: 0<=j<1 ^ j mod 2 = 1: A.j> <= <sum j: 0 <= j < 1 ^ j mod 2 = 0: A.j> ^        (i=1)
<sum j: 0<=j<2 ^ j mod 2 = 1: A.j> <= <sum j: 0 <= j < 2 ^ j mod 2 = 0: A.j> ^       (i=2)
<sum j: 0<=j<3 ^ j mod 2 = 1: A.j> <= <sum j: 0 <= j < 3 ^ j mod 2 = 0: A.j> ^       (i=3)
<sum j: 0<=j<4 ^ j mod 2 = 1: A.j> <= <sum j: 0 <= j < 4 ^ j mod 2 = 0: A.j>          (i=4)

-> {terminos}
0<=j<0 ^ 0 mod 2 = 1 <= 0<=j<0 ^ 0 mod 2 = 0 ^ 
0<=j<1 ^ 1 mod 2 = 1 <= 0<=j<1 ^ 1 mod 2 = 0 ^
0<=j<2 ^ 2 mod 2 = 1 <= 0<=j<2 ^ 2 mod 2 = 0 ^
0<=j<3 ^ 3 mod 2 = 1 <= 0<=j<3 ^ 3 mod 2 = 0 ^

={calculo, recordemos que un rango falso en una suma es 0}
0 <= A.0 ^ 
A.1 <= 0 ^
0 <= A.2 ^
A.3 <= 0 ^
0 <= A.4

={Indice}
0 <= 2 ^ 
5 <= 0 ^
0 <= 7 ^ 
3 <= 0 

True ^ false ^ true ^ false = false

1)

	const N: Int, A: array [0, N) of Int;
	Var r: Bool;
	{P: N >= 0}
	S1; // Cuerpo del ciclo
	{Q:r=<Ai : 0<=i<= N : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j>} 

i) Es un programa que avanza y evalua seguin indices de arreglos, con una expresion booleana -> Necesito un ciclo. 

Para la demostracion necesito una Inv y una guarda B.
Para el invariante, uso la tecnica de reemplazo de constante por variables.

	INV = r=<Ai : 0 <= i <= pos : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j> ^ 0 <= pos <= N

Con guarda B:

	B = pos < N

ii) Demuestro que vale 

	Inv ^ -b => Q

	r=<Ai : 0 <= i <= pos : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j> ^ 0 <= pos <= N ^ -(pos<N) =>
	 r=<Ai : 0<=i<= N : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j>
	 ={ lógica aritmetica, elim de variable, }
	 	r=<Ai : 0 <= i <= N : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j>  =>
	 r=<Ai : 0<=i<= N : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j>
	 ={P => p}
	 true

Entonces, el programa tendrá la estructura:

	const N: Int, A: array [0, N) of Int;
	Var r: Bool;
	{P: N >= 0}
	S1; // Inicializacion
	{inv}
		do pos < N ->
			{inv ^ B}
			s2; // cuerpo del ciclo
			{Inv}
		od 
	{Q:r=<Ai : 0<=i<= N : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j>} 

iii) Inicializacion del ciclo

	const N: Int, A: array [0, N) of Int;
	Var r: Bool;
	{P: N >= 0}
	S1; // Inicializacion
	{Q:r=<Ai : 0<=i<= N : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j>} 

Sabemos que el ciclo debe iniciarse, inicializadno variables que usaremos.
Propongo: r, pos = E, F y hago la wp

	wp.s1.inv
	={wp de :=}
	E=<Ai : 0 <= i <= F : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j> ^ 0 <= F <= N
	={asigno E = True, F = 0, para forzar rango vacio}
	True = <Ai : 0 <= i <= 0 : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j> ^ 0 <= 0 <= N
	={Rango vacio, aritmetica}
	True = True
	={asd}
	True

Con las inicializaciones, nos queda que:

	r,pos := True, 0

iv) Cuerpo del ciclo.

El ciclo debe de avanzar en posicion y ir almacenando la rta de interes. 
Supongo Inv ^ B como hipotesis

	r, pos := E, pos+1

y hacemos la wp

	wp.s2.inv
	={wp de asignacion}
	E=<Ai : 0 <= i <= pos+1 : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j> ^ 0 <= pos+1 <= N
	={particion del rango por final. Tengamos en cuenta que es <= <=}
	E=<Ai : i = pos+1 v 0 <= i <= pos : 
	<sum j: 0<=j<i ^ j mod 2 = 1: A.j> <= 
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j> ^ 0 <= pos+1 <= N
	={Part de rango}
	E=<Ai : i = pos+1 : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <= 
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j> ^ 
	<Ai : 0 <= i <= pos : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <= 
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j>
	^ 0 <= pos+1 <= N
	={rango unitario, hipotesis pos <N y 0 <= pos <= N}
	E = <sum j: 0<=j<pos+1 ^ j mod 2 = 1: A.j> <= 
	<sum j: 0<=j<pos+1 ^ j mod 2 = 0: A.j> ^ 
	<Ai : 0 <= i <= pos : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <= 
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j>
	={Lógica en el rango 2 veces}
	E = <sum j: j = pos v 0<=j<pos ^ j mod 2 = 1: A.j> <= 
	<sum j: j = pos v 0<=j<pos ^ j mod 2 = 0: A.j> ^ 
	<Ai : 0 <= i <= pos : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <= 
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j>
	={hipotesis}, part de rango
	E = r ^ <sum j: j = pos  ^ j mod 2 = 1: A.j> + 
	<sum j: 0<=j<pos ^ j mod 2 = 1: A.j> <= 
	<sum j: j = pos  ^ j mod 2 = 0: A.j> + 
	<sum j: 0<=j<pos ^ j mod 2 = 0: A.j> 
	={ elim de variable, rango unitario }
	E = r ^ A.pos + 
	<sum j: 0<=j<pos ^ j mod 2 = 1: A.j> <= 
	A.pos  + 
	<sum j: 0<=j<pos ^ j mod 2 = 0: A.j> 
	={me trabo}

Pte2)
Me trabo, hay cosas que no tengo en la hipotesis. Aplico tecnica de fortalecimiento de invariante. 

	Inv' = r ^ ∧ sumImp = ⟨∑ j : 0 ≤ j < pos ∧ j mod 2 = 1 : A.j⟩
	∧ sumPar = ⟨∑ j : 0 ≤ j < pos ∧ j mod 2 = 0 : A.j⟩
	∧ 0 ≤ pos ≤ N

En consecunecia, sabemos que:

	Inv' = Inv

Y por proponer un invariante nuevo, vuevlo a derivar el programa

i) inicializacion del programa.
El programa debe inicializarse, propongo las variables:

r,pos,sumImp,sumPar := E, F, G, H

y hago la wp.

	wp.s0.inv
	={wp de :=}
	E ^ ∧ G = ⟨∑ j : 0 ≤ j < F ∧ j mod 2 = 1 : A.j⟩
	∧ H = ⟨∑ j : 0 ≤ j < F ∧ j mod 2 = 0 : A.j⟩
	∧ 0 ≤ F ≤ N
	={Fueroz rangos vacio, propongo, E = true, F = 0}
	E ^ ∧ G = ⟨∑ j : 0 ≤ j < 0 ∧ j mod 2 = 1 : A.j⟩
	∧ H = ⟨∑ j : 0 ≤ j < 0 ∧ j mod 2 = 0 : A.j⟩
	∧ 0 ≤ 0 ≤ N
	={Rango vacio}
	E ^ ∧ G = 0 ∧ H = 0 ∧ 0 ≤ 0 ≤ N
	={Elijo E = true, G = 0, H = 0}
	True

Nos queda un programa del estilo:

	const N: Int, A: array [0, N) of Int;
	Var r: Bool;
	{P: N >= 0}
	r,pos,sumImp,sumPar := True, 0, 0, 0; 
	{inv}
		do pos < N ->
			{inv ^ B}
			s2; // cuerpo del ciclo
			{Inv}
		od 
	{Q:r=<Ai : 0<=i<= N : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j>} 


ii) Inv' ^ -b => Q siendo trivial, ya demostramos que el más fuerte lo demuestra

iii) Cuerpo del ciclo
El ciclo debe avanzar en posiciones, propongo:

	r,pos,sumImp,sumPar := E, pos+1, G, H 

Supongo Inv' ^ B como hipotesis.

NOTA: r lo dejo como r, después lo hago como inv 

	wp.s2.inv'
	={wp de :=}
	r ^ G = ⟨∑ j : 0 ≤ j < pos+1 ∧ j mod 2 = 1 : A.j⟩
	∧ H = ⟨∑ j : 0 ≤ j < pos+1 ∧ j mod 2 = 0 : A.j⟩
	∧ 0 ≤ pos+1 ≤ N
	={Logica en el rango}
	r ^ G = ⟨∑ j : j=pos+1 v 0<=j<=pos ∧ j mod 2 = 1 : A.j⟩
	∧ H = ⟨∑ j : j=pos+1 v 0<=j<=pos ∧ j mod 2 = 0 : A.j⟩
	∧ 0 ≤ pos+1 ≤ N
	={Hipotesis (pos < n, 0<=pos+1<=N, part de rango}
	r ^ G = ⟨∑ j : j=pos+1 ∧ j mod 2 = 1 : A.j⟩ + 
	⟨∑ j : 0<=j<=pos ∧ j mod 2 = 1 : A.j⟩ ∧ 
	H = ⟨∑ j : j=pos+1  ∧ j mod 2 = 0 : A.j⟩ + 
	⟨∑ j : 0<=j<=pos ∧ j mod 2 = 0 : A.j⟩
	={ elim de variable }
	r ^ G = A.(pos+1) + ⟨∑ j : 0<=j<=pos ∧ j mod 2 = 1 : A.j⟩ ∧ 
	H = A.(pos+1) + ⟨∑ j : 0<=j<=pos ∧ j mod 2 = 0 : A.j⟩
	={hipotesis}
	r ^ G = A.(pos+1) + sumImp ∧ 
	H = A.(pos+1) + sumPar
	={hipotesis, valor de r (de la nota)}
	E = <Ai : 0 <= i <= pos+1 : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j> ^ 0 <= pos+1 <= N
	^ G = A.(pos+1) + sumImp ∧ H = A.(pos+1) + sumPar
	={hipotesis, lógica en el rango}
	E = <Ai : i=pos+1 v 0<=i<=pos : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j>
	^ G = A.(pos+1) + sumImp ∧ H = A.(pos+1) + sumPar
	={part de rango}
	E = <Ai : i=pos+1 : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j> ^ <Ai : 0<=i<=pos : 
	<sum j: 0<=j<i ^ j mod 2 = 1: A.j> <= <sum j: 0<=j<i ^ j mod 2 = 0: A.j>
	^ G = A.(pos+1) + sumImp ∧ H = A.(pos+1) + sumPar
	={rango unitario}
	E = <sum j: 0<=j<pos+1 ^ j mod 2 = 1: A.j> <=
	<sum j: 0<=j<pos+1 ^ j mod 2 = 0: A.j> ^ 
	<Ai : 0<=i<=pos : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <= 
	<sum j: 0<=j<i ^ j mod 2 = 0: A.j>
	^ G = A.(pos+1) + sumImp ∧ H = A.(pos+1) + sumPar
	={Hipotesis, lógica de rango}
	E = <sum j: j=pos+1 ^ j mod 2 = 1: A.j> +
	<sum j: 0<=j<pos ^ j mod 2 = 1: A.j>
	<= <sum j: j=pos+1 ^ j mod 2 = 0: A.j> +
	<sum j: 0<=j<pos ^ j mod 2 = 0: A.j>
	r ^ G = A.(pos+1) + sumImp ∧ H = A.(pos+1) + sumPar
	={rango unitario}
	E =  A.pos+1  + <sum j: 0<=j<pos ^ j mod 2 = 1: A.j>
	<= A.pos+1 + <sum j: 0<=j<pos ^ j mod 2 = 0: A.j>
	r ^ G = A.(pos+1) + sumImp ∧ H = A.(pos+1) + sumPar
	={Hipotesis}
	E =  A.pos+1  + sumImpar <= A.pos+1 + sumPar ^ r 
	^ G = A.(pos+1) + sumImp ∧ 
	H = A.(pos+1) + sumPar
	={elijo lo k valgan , ME OLVIDE EL FI DE MIERDA}

Quedando el programa:


	const N: Int, A: array [0, N) of Int;
	Var r: Bool;
	{P: N >= 0}
	r,pos,sumImp,sumPar := True, 0, 0, 0; 
		do pos < N ->
			if pos mod 2 = 0 -> A.(pos+1) + sumPar
			 [] pos mod 2 = 1 -> A.(pos+1) + sumImp
			pos := pos+1;
			 r = A.pos+1  + sumImpar <= A.pos+1 + sumPar ^ r 
		od 
	{Q:r=<Ai : 0<=i<= N : <sum j: 0<=j<i ^ j mod 2 = 1: A.j> <=
	 <sum j: 0<=j<i ^ j mod 2 = 0: A.j>} 
