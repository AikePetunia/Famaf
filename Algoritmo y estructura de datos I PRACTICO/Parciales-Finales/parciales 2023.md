
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



Parcial 1 - 26 de septiembre de 2023

xs naturales >= 0

	f.xs = <Ai : 0<= i < # xs : (-1) ^ xs ! i  >= 0>

Define que si toda potencia de -1,  el valor de la lista en el indice, es >= 0 
(sepamos que sería (-1)^par > 0, si (-1)^impar, < 0) .
O sea: Todos los elementos son pares.

A) Derivar

i) Caso base, xs = []

	f.[]
	={Especificacion}
	<Ai : 0<= i < # [] : (-1) ^ [] ! i  >= 0>
	={Def de length, lógica}
	<Ai : False : (-1) ^ [] ! i  >= 0>
	={Rango vacio}
	True

ii) Hipotesis inductiva
Vale hipotesis tq:

	f.xs = <Ai : 0<= i < #xs : (-1) ^ xs ! i  >= 0>

iii) Caso recursivo, probamos con xs = x:xs 

	f.(x:xs)
	={especificacion}
	<Ai : 0<= i < #x:xs : (-1) ^ x:xs ! i  >= 0>
	={def de #}
	<Ai : 0<= i < #xs + 1  : (-1) ^ x:xs ! i  >= 0>
	={lógica en el rango}
	<Ai : i = 0 v 1<= i < #xs +1   : (-1) ^ x:xs ! i  >= 0>
	={part de rango}
	<Ai : i = 0 : (-1) ^ x:xs ! i  >= 0> ^
	<Ai : 1<= i < #xs +1 : (-1) ^ x:xs ! i  >= 0>
	={Elim de variable, rango unitario, cambio de variable i= i+1, aritmetica}
	(-1) ^ x:xs  >= 0 ^
	<Ai : 0<= i < #xs : (-1) ^ x:xs ! (i+1)  >= 0>
	={Def de ! }
	(-1)^x  >= 0 ^ <Ai : 0<= i < #xs : (-1) ^ xs!i >= 0>
	={Hipotesis}
	(-1)^x  >= 0 ^ f.xs

Quedando el programa:

f.[] = True
f.(x:xs) = (-1) ^x  >= 0 ^ f.xs

B) Dar una lista de al menos 3 elementos que cumpla f.xs = True. Justificar.**

***Ok, el testing se hace con el programa ya hecho xd*** 

Definamos una lista para que se cumpla f.xs = true, xs tq:

	xs = [0,2,4,6], # = 4

Testing:

	f.[0,2,4,6] 
	--> (-1^0) >= 0 ^ f.[2,4,6]
	--> (-1^0) >= 0 ^ (-1^2) >= 0 ^ f.[4,6]
	--> (-1^0) >= 0 ^ (-1^2) >= 0 ^ (-1^4) >= 0 ^ f.[6]
	--> (-1^0) >= 0 ^ (-1^2) >= 0 ^ (-1^4) >= 0 ^  (-1^6) >= 0 ^ f.[]
	--> (-1^0) >= 0 ^ (-1^2) >= 0 ^ (-1^4) >= 0 ^  (-1^6) >= 0 ^ True
	={ aritmetica}
	-->1 >= 0 ^ f.[2,4,6]
	--> 1 >= 0 ^ f.[4,6]
	--> 1 >= 0 ^ 1 >= 0 ^ 1 >= 0 ^ f.[6]
	--> 1 >= 0 ^ 1 >= 0 ^ 1 >= 0 ^  1 >= 0 ^ f.[]
	--> 1 >= 0 ^ 1 >= 0 ^ 1 >= 0 ^  1 >= 0 ^ True
	={lógica}
	True

**C) Dar una lista de al menos 3 elementos que cumpla f.xs = False. Justificar.**

Definamos una lista para que se cumpla f.xs = true, xs tq:

	xs = [1,3,5,7], # = 4

Testing:

	f.[1,3,5,7] --> (-1^1) >= 0 ^ f.[3,5,7]
	--> (-1^1) >= 0 ^ (-1^3) >= 0 ^ f.[5,7]
	--> (-1^1) >= 0 ^ (-1^3) >= 0 ^ (-1^5) >= 0 ^ f.[7]
	--> (-1^1) >= 0 ^ (-1^3) >= 0 ^ (-1^5) >= 0 ^  (-1^7) >= 0 ^ f.[]
	--> (-1^1) >= 0 ^ (-1^3) >= 0 ^ (-1^5) >= 0 ^  (-1^7) >= 0 ^ True
	={aritmetica}
	f.[0,2,4,6] 
	--> -1 >= 0 ^ f.[2,4,6]
	--> -1 >= 0 ^ f.[4,6]
	--> -1 >= 0 ^ -1 >= 0 ^ -1 >= 0 ^ f.[6]
	--> -1 >= 0 ^ -1 >= 0 ^ -1 >= 0 ^  -1 >= 0 ^ f.[]
	--> -1 >= 0 ^ -1 >= 0 ^ -1 >= 0 ^  -1 >= 0 ^ True
	={lógica}
	False

2)

A) derrivar, y prod.as es la funcion que calcula el producto de los elementos de una lista.

	pin8.xs = <E as,bs : xs = as++bs : prod.as = 8>

Sabemos que prod.as no está derivado, propongo:

	prod.as = <Prod i : 0<=i<#as : as!i>

 entonces, el problema de pin8 queda:

	pin8.xs = <E as,bs : xs = as++bs : <Prod i : 0<=i<#as : as!i> = 8>
	

pte 1)
i) caso base, xs = []

	pin8.[]
	<E as,bs : [] = as++bs : <Prod i : 0<=i<#as : as!i> = 8>
	={lógica de listas}
	<E as,bs : as = [] ^ bs = [] : <Prod i : 0<=i<#as : as!i> = 8>
	={elim de variable}
	<E as,bs : as = [] ^ bs = [] : <Prod i : 0<=i<#[] : as!i> = 8>
	={rango unitario}
	 <Prod i : 0<=i<#[] : as!i> = 8
	 ={rango vacio, neutro de prod}
	 1 = 8
	 ={logica}
	 false


ii) Hipotesis inductiva, digo que vale:

	HI = pin8.xs = <E as,bs : xs = as++bs : <Prod i : 0<=i<#as : as!i> = 8>


iii) paso inductivo, para xs = x:xs 

	pin8.(x:xs)
	={Especificacion}
	<E as,bs : x:xs = as++bs : <Prod i : 0<=i<#as : as!i> = 8>
	={tercer excluido}
	<E as,bs : x:xs = as++bs ^ True : <Prod i : 0<=i<#as : as!i> = 8>
	={logiuca de listas}
	<E as,bs : x:xs = as++bs ^ (as = [] v as != []) : 
	<Prod i : 0<=i<#as : as!i> = 8>
	={distributivdad, part de rango}
	<E as,bs : x:xs = as++bs ^ as = [] : 
	<Prod i : 0<=i<#as : as!i> = 8> v 
	<E as,bs : x:xs = as++bs ^  as != [] : 
	<Prod i : 0<=i<#as : as!i> = 8>
	={lógica de listas, elim de variable}
	<E bs : x:xs = []++bs : 
	<Prod i : 0<=i<#[] : []!i> = 8> v 
	<E as,bs : x:xs = as++bs ^  a:as != [] : 
	<Prod i : 0<=i<#as : as!i> = 8>
	={concat, lógica en el rango, elim de variable}
	<E bs : x:xs = bs : <Prod i : 0<=i<0 : []!i> = 8>  <- ???
	v <E as,bs : x:xs = a:as++bs : <Prod i : 0<=i<#a:as : a:as!i> = 8>
	={rango falso, rango unitario}
	1 = 8 v <E as,bs : x:xs = a:as++bs : 
	<Prod i : 0<=i<#a:as : a:as!i> = 8>
	={logica de listas varias veces}
	1 = 8 v <E as,bs : x = a ^ xs = as++bs : 
	<Prod i : 0<=i<#as + 1: a:as!i> = 8>
	={logica, lógica en el rango, cambio de variable}
	False v <E as,bs : xs = as++bs : 
	<Prod i : i = 0 v 1 <= i < #as + 1 : x:as!i> = 8>
	={abs, part de rango}
	False v<E as,bs : xs = as++bs : 
	<Prod i : i = 0 : x:as!i> * 
	<Prod i : 1 <= i < #as + 1 : x:as!i> = 8>
	={elim de variable, cambio de variable, etc}
	False v <E as,bs : xs = as++bs : 
	x * <Prod i : 0 <= i < as : as!i> = 8>
	={hi}
	False v <E as,bs : xs = as++bs : x * prod.as = 8>
	={me trabo, debo generalizar}

pte 2)

i) propongo para generalizar:

	gpin8.n.xs = <E as,bs : xs = as++bs : n * 
	<Prod i : 0 <= i < #as : as!i> = 8>

ii) demuestro que pin8.xs es un caso particular de gpin8.n.xs

	pin8.xs 
	={Especificacion}
	<E as,bs : xs = as++bs : <Prod i : 0 <= i < #as : as!i> = 8>
	={aritemtica}
	<E as,bs : xs = as++bs : 1 * <Prod i : 0 <= i < #as : as!i> = 8>
	={especifcacion, con n = 1, gpin8.n.xs}
	gpin8.1.xs

iii) Caso base para la generalizacion

	gpin8.n.[]
	={Especificacion}
	<E as,bs : [] = as++bs : n * <Prod i : 0 <= i < #as : as!i> = 8>
	={lógica de lsitas}
	<E as,bs : as = [] ^ bs = []: n * <Prod i : 0 <= i < #as : as!i> = 8>
	={elim de variable}
	<E bs : bs = []: n * <Prod i : 0 <= i < #[] : []!i> = 8>
	={rango unitario, rango vacio}
	n * <Prod i : 0<= i < 0 : []!i> = 8>
	={rango vacio, aritmetica}
	n == 8


IV) Planteo de hipotesis inductiva:

	gpin8.E.xs = <E as,bs : xs = as++bs : E * 
	<Prod i : 0 <= i < #as : as!i> = 8>

v) paso inductivo, para xs = x:xs  

	gpin8.n.x:xs 
	={Especificaicon}
	<E as,bs : x:xs = as++bs : n * <Prod i : 0 <= i < #as : as!i> = 8>
	={tercer excluido}
	<E as,bs : x:xs = as++bs ^ True : n * <Prod i : 0 <= i < #as : as!i> = 8>
	={Logica de listas}
	<E as,bs : x:xs = as++bs ^ (as = [] v as != [])  : n * 
	<Prod i : 0 <= i < #as : as!i> = 8>
	={part de rango}
	<E as,bs : x:xs = as++bs ^ as = [] : n * 
	<Prod i : 0 <= i < #as : as!i> = 8>
	v
	<E as,bs : x:xs = as++bs ^  as != [] : n * 
	<Prod i : 0 <= i < #as : as!i> = 8>
	={elim de variable, concat, log de listas}
	<E as,bs : x:xs = bs : n * <Prod i : 0 <= i < #[] : as!i> = 8>
	v
	<E as,bs : x:xs = a:as++bs : n * 
	<Prod i : 0 <= i < #a:as : a:as!i> = 8>
	={rango untiario, def de #}
	n * <Prod i : 0 <= i < 0: as!i> = 8>
	v
	<E as,bs : x:xs = a:as++bs : n * 
	<Prod i : 0 <= i < #as + 1 : a:as!i> = 8>
	={lógica en el rango, aritmetica, logica de listas}
	n == 8 v
	<E as,bs : x = a ^ xs = as++bs : n * 
	<Prod i : i = 0 v 1 <= i < #as + 1 : a:as!i> = 8>
	={elim de variable}
	n == 8 v
	<E as,bs : xs = as++bs : n * 
	<Prod i : i = 0 v 1 <= i < #as + 1 : x:as!i> = 8>
	={ part de rango}
	n == 8 v
	<E as,bs : xs = as++bs : n * 
	<Prod i : i = 0 : x:as!i> * 
	<Prod i : 1 <= i < #as + 1 : x:as!i>* = 8>
	={elim de variable, def de !, cambio de varialbe i = i +
	1, artiemtica }
	n == 8 v <E as,bs : xs = as++bs : n * x * 
	<Prod i : 0 <= i < #as : as!i> = 8>
	={conmutatividad}
	n == 8 v <E as,bs : xs = as++bs : (n * x) * 
	<Prod i : 0 <= i < #as : as!i> = 8>
	={hipotesis}
	gpin8.(n+x).xs


Quedando el programa:

	pin8.xs = gpin.1.xs
	gpin.n.xs = n == 8
	gpin.n.xs = n == 8 v gpin8.(n+x).xs

3) Especificacar funciones para resolver los siguientes problemas. También dar el tipo. No derivar.

a) Calcular la cantidad de divisiores que tiene un numero n > 0 (sin contar 1 ni n mismo)

	cantDivisores :: Int -> Int
	<N i: 1 < i < N ^ n mod i = 0 : True>

B) Dadas dos listas xs e ys, calcular si xs tiene algún segmento cuya suma es mayor que la suma de ys.
Ej: 

	xs = [-1,8,-2,4,-2], ys = [3,6] -> True (por xs = [8,-2,4])

"Algun segmento de xs es mayor que la suma de ys"

	<E as,bs : xs = as ++ cs ++ bs ^ cs != [] : 
	⟨Sum i : 0 ≤ i < #cs : cs!i⟩ > <Sum i: 0<= i <#ys : ys!i>>


1)
Imperativo:

	Const N : Int, A: array [0, N) of Int;
	{P: N >= 0}
	S;
	{Q: r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!>}

i)  Lo que calcula el programa, es si existe un numero en el arreglo en indice j, tal que sea igual al indice i. 
El factorial se calcula dentro del mismo ciclo

(ver pag 144)
Es programa que itera sobre N, necesito un ciclo.

	Const N : Int, A: array [0, N) of Int;
	{P: N >= 0}
	S1; // inicializacion
	do B ->
		S2 ; // cuerpo del ciclo
	od
	{Q: r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!>}

Propongo un invariante y una guarda B.

Para invariante, uso la tecnica de reemplazo de constantes por variable.

	Inv = r = <Ei : 0<=i<=pos : <Sum j : 0<=j<i: A.j> = i!> ^ 0<= pos <= N

Y B

	B = pos < N

ii) Demuestro que vale por: Inv ^ -B => Q

	Inv ^ -b =>Q
	={valores}
	r = <Ei : 0<=i<=pos : <Sum j : 0<=j<i: A.j> = i!> 
	^ 0<= N <= pos ^ -(pos < N) =>
	r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!>
	={Logica aritmetica, elim de variable}
	r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!> 
	^ 0<= N <= N =>
	r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!>
	={lógica}
	r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!> =>
	r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!>
	={logica, p => p}
	True

iii) Inicialiazacion del ciclo. 

	{P: N >= 0}
	S1; // inicializacion
	{r = <Ei : 0<=i<=pos : <Sum j : 0<=j<i: A.j> = i!> ^ 0<= N <= pos}

sabemos que el ciclo debe iniciarse, declarando y iniciando las variables, propongo:

r, pos =: E, F

decimos que inv ^ b son hip

y hacemos la wp

	wp.s1.inv
	={wp :=}
	E = <Ei : 0<=i<=F : <Sum j : 0<=j<i: A.j> = i!> ^ 0<= F <= N
	={Propongo F = 0 para forzar rango unitario}
	E = <Ei : 0<=i<=0 : <Sum j : 0<=j<i: A.j> = i!> ^ 0<= F <= N
	={Lógica, rango vacío}
	E = <Sum j : 0<=j<0: A.j> = 0! ^ 0<= N <= 0
	={lógica, hip, pos < N}
	E = False
	={elijo E = True}
	False 
	
Quedando el programa:

	Const N : Int, A: array [0, N) of Int;
	{P: N >= 0}
	r,pos := False, 0; 
	do pos < N ->
		S2 ; // cuerpo del ciclo
	od
	{Q: r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!>}


iv) Iteracion en el ciclo.

Sabemos que el ciclo debe avanzar entre posiciones para poder calcular lo que debe, propongo:

	r, pos := E, pos+1

Supongo Inv ^ b como hipotesis
y hacemos la wp

	wp.s2.inv
	={wp de :=}
	E = <Ei : 0<=i<=pos+1 : <Sum j : 0<=j<i: A.j> = i!> ^ 0<= N <= pos+1
	={lógica en el rango}
	E = <Ei : i = pos+1  v 0<=i<=pos : <Sum j : 0<=j<i: A.j> = i!> 
	^ 0<= N <= pos+1
	={Hipotesis, 0<= N <= pos y  B con pos < N}
	E = <Ei : i = pos+1  v 0<=i<=pos : <Sum j : 0<=j<i: A.j> = i!> 
	={Part de rango}
	E = <Ei : i = pos+1  : <Sum j : 0<=j<i: A.j> = i!> v
	<Ei : 0<=i<=pos : <Sum j : 0<=j<i: A.j> = i!> 
	={Elim de variable, logica en el rango}
	E = <Sum j : j = pos v 0<=j<pos: A.j> = (pos+1)! v
	<Ei : 0<=i<=pos : <Sum j : 0<=j<i: A.j> = i!> 
	={part de rango}
	E = <Sum j : 0<=j<pos: A.j> + <Sum j : j = pos : A.j> = (pos+1)! v
	<Ei : 0<=i<=pos : <Sum j : 0<=j<i: A.j> = i!> 
	={hip, elim de variable}
	E = <Sum j : 0<=j<pos: A.j> + A.pos = (pos+1)! v r
	={Me trabo, pos no calculabe}

pte 2)

Sabemos que necesitamos un solo ciclo, y factorial lo tenemos que calcuar en el mismo ciclo. Sabemos que el factorial, es de la forma de:

	n * n-1 * n-2... 

Propongo un nuevo invariante por fortalecimiento de invariante

"Acá nos trabamos, porque “pos !” no es programable. Nos hubiera venido bien tener una hipótesis adicional que me diga que hay una variable (llamémosla “fac”) en la que está calculado “pos !”.¡"

	Inv' = r = <Ei : 0<=i<=pos : <Sum j : 0<=j<i: A.j> = i!> ^
	sumPos = <Sum j : 0<=j<pos: A.j> ^ 
	fac = pos! ^ 0<= pos <= N

Proponemos un nuevo programa con las nuevas variables declaradas:

	Const N : Int, A: array [0, N) of Int;
	Var SumPos, fac: Int; r: Bool;
	{P: N >= 0}
	S1; // inicializacion
	do B ->
		S2 ; // cuerpo del ciclo
	od
	{Q: r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!>}

i) Inicializacion del ciclo, iniciamos nuevas variables, propongo:

	r, pos, sumPos, fac := E, F, G, H

y hago la wp

	wp.s1.Inv'
	={wp :=}
	E = <Ei : 0<=i<=F : <Sum j : 0<=j<i: A.j> = i!> ^
	G = <Sum j : 0<=j<F: A.j> ^ 
	H = F! ^ 0<= F <= N
	={Asigno F = 0}
	E = <Ei : 0<=i<=0 : <Sum j : 0<=j<i: A.j> = i!> ^
	G = <Sum j : 0<=j<0: A.j> ^ 
	H = 0! ^ 0<= 0 <= N
	={lógica rango vacios, rango unitario}
	E = <Sum j : 0<=j<0: A.j> = i! ^
	G = 0 ^ 
	H = 1 ^ 0<= 0 <= N
	={Hipotesis, lógica y rango vacío}
	E = 0 = i! ^
	G = 0 ^ 
	H = 1
	={Elijo G = 0, F = 0, H = 1, E = False (es false, lógica)}
	True

Quedando el programa

	Const N : Int, A: array [0, N) of Int;
	Var SumPos, fac: Int; r: Bool;
	{P: N >= 0}
	r, pos, sumPos, fac := False, 0, 0, 1 
	do pos < N  ->
		S2 ; // cuerpo del ciclo
	od
	{Q: r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!>}

ii) Cuerpo del ciclo, el ciclo debe avanzar entre iteraciones. 

Propongo:

	r, pos, sumPos, fac := E, pos+1, G, H

Supongo Inv' ^ b como hipotesis

y hago la wp.

	wp.s2.Inv'
	={Wp de :=}
	E = <Ei : 0<=i<=pos+1 : <Sum j : 0<=j<i: A.j> = i!> ^
	G = <Sum j : 0<=j<pos+1: A.j> ^ 
	H = pos+1! ^ 0<= pos+1 <= N 
	={Lógica en los rangos, hipotesis, 0<=pos<=N ^ pos <n}
	E = <Ei : i=pos+1 v 0<=i<=pos: <Sum j : 0<=j<i: A.j> = i!> ^
	G = <Sum j : j=pos v 0<=j<pos: A.j> ^ 
	H = (pos+1)! 
	={part de rango, arit !}
	E = <Ei : i=pos+1 v 0<=i<=pos: <Sum j : 0<=j<i: A.j> = i!> ^
	G = <Sum j : j = pos v 0<=j<pos: A.j> ^ 
	H = (pos+1) * pos!
	={Hipotesis, particiones de rango}
	E = <Ei : i=pos+1: <Sum j : 0<=j<i: A.j> = i!> v 
	<Ei : 0<=i<=pos: <Sum j : 0<=j<i: A.j> = i!> ^
	G = <Sum j : j = pos : A.j> +
	<Sum j : 0<=j<pos: A.j> ^ 
	H = (pos+1) * fac
	={Elim de variable, rango unitario}
	E = <Sum j : 0<=j<pos+1:: A.j> = (pos+1)! v 
	<Ei : 0<=i<=pos: <Sum j : 0<=j<i: A.j> = i!> ^
	G = A.pos + <Sum j : 0<=j<pos: A.j> ^ 
	H = (pos+1) * fac
	={Arit de pos+1, hipotesis r, hipotesis sumPos}
	E = <Sum j : 0<=j<pos+1: A.j> = (pos+1) * fac v r ^
	G = A.pos + sumPos ^ 
	H = (pos+1) * fac
	={Logica en el rango}
	E = <Sum j : j=pos v 0<=j<pos: A.j> = (pos+1) * fac v r ^
	G = A.pos + sumPos ^ 
	H = (pos+1) * fac
	={part de rango}
	E = <Sum j : j=pos : A.j> + <Sum j :  0<=j<pos: A.j>
	= (pos+1) * fac v r ^
	G = A.pos + sumPos ^ 
	H = (pos+1) * fac
	={elim de variable, Hipotesis sumPos}
	E = A.pos + sumPos = (pos+1) * fac v r ^
	G = A.pos + sumPos ^ 
	H = (pos+1) * fac
	={Elijo los coso}

El programa queda:

	Const N : Int, A: array [0, N) of Int;
	Var SumPos, fac: Int; r: Bool;
	{P: N >= 0}
	r, pos, sumPos, fac := False, 0, 0, 1 
	do pos < N  ->
		r, pos, sumPos, fac :=
			 A.pos + sumPos = (pos+1) * fac v r, pos+1,
			 A.pos + sumPos, (pos+1) * fac
	od
	{Q: r = <Ei : 0<=i<=N : <Sum j : 0<=j<i: A.j> = i!>}


Parcial 2023 acahaval

![[Pasted image 20251207063448.png]]


a) debe ser del tipo "Para todo" (A)
Trabaja sobre una misma lista xs, solo avanza entre elementos y busca el distinto (haciendose en el rango)

F :: [A] -> Bool

b)

	<A i,j : 0<=i<j<#xs : xs!i != xs!j >

c)

	xs = [0,1,2,3]

3)

![[Pasted image 20251207064419.png]]

Hipotesis inductiva: 

	g.xs = <E as, bs, cs: xs = as++bs++cs: prod.bs < #as >

Caso inducitvo, para xs = x:xs 

	g.(x:xs)
	={Especificacion}
	<E as, bs, cs: x:xs = as++bs++cs: prod.bs < #as >
	={Tercer excluido, logica}
	<E as, bs, cs: x:xs = as++bs++cs ^ (as =[] v as !=[]): prod.bs < #as >
	={Distributividad}
	<E as, bs, cs: x:xs = as++bs++cs ^ as =[]: prod.bs < #as >
	v <E as, bs, cs: x:xs = as++bs++cs ^ as !=[]: prod.bs < #as >
	={ELim de variable, logica de listas}
	<E as, bs, cs: x:xs = bs++cs : prod.bs < #as >        <--- MODULARIZACION
	v <E as, bs, cs: x:xs = a:as++bs++cs ^ as !=[]: prod.bs < #as >
	

Notar que si hubieramos partido de bs, hubieramos terminado en una generalizacion y no una modularizacion. 

	concat :: [Num] -> Bool
	concat = <E as, bs, cs: x:xs = bs++cs : prod.bs < #as > 

![[Pasted image 20251207065639.png]]

	Const N: Int; A: Array[0, N) of Int;
	Var r: Int;  //  <---- esta mal escrito en el parcial, es Int, no Bool
	{P:N >= 0}
	S
	{Q:r = <Sum i: 0<=i<N ^ A.i > <sum j : 0<=j<i : A.j> : A.i>}

Entendamos que es una funcion que se fija si hay un elemento mas grande que la suma de todo el arreglo, devolviendo la suma del arreglo o el numero mas grande

1) Es una funcion que itera sobre un arreglo. Necesito un ciclo. Para poder derivar el ciclo necesito un invariante y una guarda B.
Usando tecnica de reemplazo de constantes por variables, propongo el invariatne

	INV = r = <Sum i: 0<=i<pos ^ A.i > <sum j : 0<=j<i : A.j>
	  : A.i> ^ 0<=pos<=N

Y una guarda B

	B = pos < N

Con el invariante y la guarda propuestos, puedo asegurar que el ciclo termina por:

	Inv ^ -b => Q

(Trivial)


Con la guarda y conociendo que tendra un ciclo, el programa tendra la siguiente estructura:

	Const N: Int; A: Array[0, N) of Int;
	Var r,pos: Int;
	{P:N >= 0}
	S1;
	do pos < N ->
		s2;
	od
	{Q:r = <Sum i: 0<=i<N ^ A.i > <sum j : 0<=j<i : A.j> : A.i>}

i) Inicializacion del programa.

Sabemos que el programa debe de inicializarse con sus variables correspondintes.
Por logica, el arreglo debe recorrerse desde 0
Propongo:

	r,pos := E, F

y hago la wp

	wp.s0.inv
	={wp de :=}
	 E = <Sum i: 0<=i<F ^ A.i > <sum j : 0<=j<i : A.j>
	  : A.i> ^ 0<=F<=N
	={Pruebp f = 0, para forzar rango vacio, logica}
	 E = <Sum i: False ^ A.i > <sum j : 0<=j<i : A.j>
	  : A.i> 
	={Abs de false, rango vacio vacio de false}
	E := 0
	={elijo E = 0}

Quedandola Inicializacion:

	Const N: Int; A: Array[0, N) of Int;
	Var r,pos: Int;
	{P:N >= 0}
	r,pos := 0,0
	do pos < N ->
		s2;
	od
	{Q:r = <Sum i: 0<=i<N ^ A.i > <sum j : 0<=j<i : A.j> : A.i>}

ii) Cuerpo del ciclo, supongo Inv ^ B como hipotesis.
El ciclo debe avanzar, se itera sobre las posiciones, propongo:

	r,pos := E, pos+1

y hago la wp, para poder demostrar que el ciclo avanza y obtener un E


	wp.s1.inv
	={wp de :=}
	E = <Sum i: 0<=i<pos+1 ^ A.i > <sum j : 0<=j<i : A.j>
	  : A.i> ^ 0<=pos+1<=N
	={Logica en el rango}
	E = <Sum i: (i=pos v 0<=i<pos) ^ A.i > <sum j : 0<=j<i : A.j>
	  : A.i> ^ 0<=pos+1<=N
	={Distributividad}
	E = <Sum i: i=pos  ^ A.i > <sum j : 0<=j<i : A.j>
	  : A.i> + 
	  <Sum i: 0<=i<pos ^ A.i > <sum j : 0<=j<i : A.j> : A.i>
	  ^ 0<=pos+1<=N
	={Eliminacion de variable, hipoteis}
	E = <Sum i: i=pos  ^ A.i > <sum j : 0<=j<i : A.j>
	  : A.i> + r ^ 0<=pos+1<=N
	={sabemos que la continuacion es correcta, por HI, pos < N y 0<=pos<=N}
		E = <Sum i: i=pos  ^ A.i > <sum j : 0<=j<i : A.j>
	  : A.i> + r
	={ELim de variable}
	E = r + <Sum i: A.pos > <sum j : 0<=j<pos : A.j> : A.i>
	={
		Sabemos que nos trabamos (no tenemos hipotesis)
		-> Refuerzo el invariante
		Es un analisis por casos.
		I) A.pos > sumPos -> A.i
		II) A.pos <= sumPos -> 0
	
	 Nuevo inv
		Inv' = r = <Sum i: 0<=i<pos ^ A.i > 
		<sum j : 0<=j<i : A.j> : A.i> ^
		s = <Sum i: A.pos > <sum j : 0<=j<pos : A.j> : A.pos>	^ 0<=pos<=N
	}
	E = if A.pos > s -> r + A.pos
		  [] A.pos <= s -> r + 0

si esto ya se, no quiero hacer de nuevo el caso base etc, pero supongo que s al inicio vale 0, me quiero concentrar en sacar las guardas de ifs

Nos va quedando el programa una estrucutra como

	Const N: Int; A: Array[0, N) of Int;
	Var r,pos: Int;
	{P:N >= 0}
	r,pos,s := 0,0,0
	do pos < N ->
		if A.pos > S -> r, s := r + s, G
		[] A.pos <= S -> s := G
		pos := pos+1
	od
	{Q:r = <Sum i: 0<=i<N ^ A.i > <sum j : 0<=j<i : A.j> : A.i>}

Nos queda hacer la wp de las guardas para encontrar G, lo que valga S denntro del ciclo.

Sabemos que la wp en los ifs,

	P => Q ^
	(B1 v B2...) ^ 
	wp.s1.Q ^
	wp.s2.Q

No conoces el valor de S, lo asigno como E
Hacemos ambas wp:

	wp.if..fi.Inv
	={wp de if, asigno}
	(A.pos > S v A.pos <= S)
	r = r + s ^
	G = <Sum i: A.pos+1 > <sum j : 0<=j<pos+1 : A.j> : A.pos+1> ^ 0<=pos+1<=N
	^ 
	G = <Sum i: A.pos+1 > <sum j : 0<=j<pos+1 : A.j> : A.pos+1> ^ 0<=pos+1<=N
	
	={
		logica = pasos varios
	}
	r = r +s, g = A.pos + S 

	Const N: Int; A: Array[0, N) of Int;
	Var r,pos: Int;
	{P:N >= 0}
	r,pos,s := 0,0,0
	do pos < N ->
		if A.pos > S -> r, s := r + s, A.pos + s
		[] A.pos <= S -> s := A.pos + s
		pos := pos+1
	od
	{Q:r = <Sum i: 0<=i<N ^ A.i > <sum j : 0<=j<i : A.j> : A.i>}


Preguntero:
Como desago, de las invariantes, los:

	0<= pos <= N 
	0<= pos + 1 <= N

ANSWER:

	E = <Sum i: i=pos  ^ A.i > <sum j : 0<=j<i : A.j>
	  : A.i> + r ^ 0<=pos+1<=N
	={sabemos que la continuacion es correcta, por HI, pos < N y 0<=pos<=N}


Cuando tengo desigualdades, del tipo:

	A.i > <sum j : 0<=j<i : A.j> 

se sabe que quedaria un condicional, y como plantearia que queda como incondicional![[Pasted image 20251207071929.png]]

Notas:
Tener cuidado con los rangos, las particiones pueden ser muy dsitintas y pueyden dar problemas de bordes. 
Muy probablemente un programa jamas termine teniendo en ciclo un 

	A.pos+1