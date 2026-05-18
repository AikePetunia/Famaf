f.[1,2,0,4,8] )
f(x:xs) = < ∑ i : 0 ≤ i < #(x►xs) : (#(x►xs) - i) * (x►xs)!i >
- Es una sumatoria que multiplica el (largo del arreglo - indice) multiplicado por el número en el arreglo del del indice i


i) caso base, xs = []

	f.[]
	={Especificacion}
	<sum i: 0<=i<#[] : (#[] - i) * []!i>
	={def de # en []}
	<sum i: 0<=i<0 : (#[] - i) * []!i>
	={rango vacio}
	0

ii) Planteo de hipotesis inductiva.

	HI = f(xs) = <sum i: 0<=i<#xs : (#xs-i) * xs!i> 

iii) Paso inductivo, digo que vale para toda lista x:xs y demuestro

	f.(x:xs)
	={Especificacion}
	<sum i: 0<=i<#(x:xs) : (#(x:xs)-i) * (x:xs)!i>
	={def de # }
	 <sum i: 0<=i<#xs + 1 : (#(x:xs)-i) * (x:xs)!i>
	={lógica en el rango}
	<sum i: i = 0 v 1 <= i < #xs + 1: (#(x:xs)-i) * (x:xs)!i>
	={part de rango, rango unitario}
	(#(x:xs)-0) * (x:xs)!0 + 
	<sum i:  1 <= i < #xs+1  : (#(x:xs)-i) * (x:xs)!i>
	={aritmetica, def de #, !}
	#xs + 1 * x + <sum i:  1 <= i < #xs+1: (#(x:xs)-i) * (x:xs)!i>
	={camb de variable i = i + 1, aritmetica}
	#xs + 1 * x + <sum i:  0 <= i < #xs : (#(x:xs)-(i+1)) * (x:xs)!(i+1)>
	={def de !, #}
	#xs + 1 * x + <sum i:  0 <= i < #xs : (#xs + 1 -(i+1)) * xs!i>
	={aritmetica}
	#xs + 1 * x + <sum i:  0 <= i < #xs : (#xs-i)) * xs!i>
	={hipotesis}
	#xs + 1 * x + f.xs

Programa:

f,[] = 0
f.x:xs = xs + 1 * x + f.xs

1b)

	f.[1,2,0,4,8] = xs=[1,2,0,4,8] (#5)
	
					=#[1,2,0,4,8] + 1 * 1 +  f.[1,2,0,4,8]
					= 5 + 1 * 1 + f[2,0,4,8]
					= 5 + 1 * 1 + (4+1*2) + f[0,4,8]
					= 5 + 1 * 1 + (4+1*2) + (3+1*0) + f[4,8]
					= 5 + 1 * 1 + (4+1*2) + (3+1*0) + (2+1*4) + f[8]
					= 5 + 1 * 1 + (4+1*2) + (3+1*0) + (2+1*4) + (1+1*8) 
					= 5 + 1 * 1 + (4+1*2) + (3+1*0) + (2+1*4) + (1+1*8) 

2)
Hago inducción en xs. Espero encontrar una definición de la forma: 
P.[] ≐ ???
P.(x►xs) ≐ ???

< ∃ as, b, bs : xs = as ++ (b►bs) : sum.as ≤ b ∧ sum.bs ≤ b >

Expresion booleana que evalua si la suma de la lista as y bc, son menores o iguales que el elemento b

pte1) 
i) caso base, xs = []

	p.[]
	={Especificacion}
	< ∃ as, b, bs : [] = as ++ (b►bs) : sum.as ≤ b ∧ sum.bs ≤ b >
	={lógica}
	< ∃ as, b, bs : as = [] ^ b:bs = [] : sum.as ≤ b ∧ sum.bs ≤ b >
	={lógica, elim de variable, abs}
	< ∃ as, b, bs : false : sum.[] ≤ b ∧ sum.bs ≤ b >
	={rango vacio}
	False

ii)

Empiezo con el caso inductivo por las dudas haya que generalizar. 
con  

	HI = p.xs = < ∃ as, b, bs : xs = as ++ (b►bs) : sum.as ≤ b ∧ sum.bs ≤ b >

	P.(x►xs) 
	= { especificación } 
	< ∃ as, b, bs : x►xs = as ++ (b►bs) : sum.as ≤ b ∧ sum.bs ≤ b >
	={lógica de listas}
	< ∃ as, b, bs : x►xs = as ++ (b►bs) ^ true : sum.as ≤ b ∧ sum.bs ≤ b >
	={lógica de listas}
	< ∃ as, b, bs : x►xs = as ++ (b►bs) ^ (as = [] v as != []) 
	: sum.a:as ≤ b ∧ sum.bs ≤ b >
	={distributividad, part de rango}
	<∃ as, b, bs : (as = [] ^ x►xs = as ++ (b►bs)) 
	: sum.as ≤ b ∧ sum.bs ≤ b > v 
	<∃ as, b, bs : x►xs = as ++ (b►bs) ^ (as != []) 
	: sum.a:as ≤ b ∧ sum.bs ≤ b >
	={lógica de listas, elim de variable}
	<∃ as, b, bs : x►xs = [] ++ (b►bs) : sum.[] ≤ b ∧ sum.bs ≤ b > v 
	<∃ as, b, bs : x►xs = as ++ (b►bs) ^ (a:as != []) 
	: sum.a:as ≤ b ∧ sum.bs ≤ b >
	={def de sum, elim de var}
	<∃ as, b, bs : x►xs = [] ++ (b►bs) : sum.[] ≤ b ∧ sum.bs ≤ b > v 
	<∃ as, b, bs : x►xs = a:as ++ (b►bs) : sum.a:as ≤ b ∧ sum.bs ≤ b >
	={concat, lógica de listas}
	<∃ as, b, bs : x►xs = (b►bs) : sum.[] ≤ b ∧ sum.bs ≤ b > v 
	<∃ as, b, bs : xs = as ++ bs : sum.x:as ≤ b ∧ sum.bs ≤ b >
	={elim de variable, logica de listas}
	={def de sum}
	<∃ as, b, bs : x = b ^ xs = bs : sum.[] ≤ b ∧ sum.bs ≤ b > v 
	<∃ as, b, bs : xs = as ++ bs : x + sum.as ≤ b ∧ sum.bs ≤ b >
	={elim de variable}
	sum.[] ≤ x ∧ sum.xs ≤ x v 
	<∃ as, b, bs : xs = as ++ bs : x + sum.as ≤ b ∧ sum.bs ≤ b >
	={def de sum, me trabo}
	0 ≤ x ∧ sum.xs ≤ x v 
	<∃ as, b, bs : xs = as ++ bs : x + sum.as ≤ b ∧ sum.bs ≤ b >

Me trabo, no llego a hipotesis, noto el termino extra que tengo de "x", debo generalizar.
Descargo la definicion por induccion que hicimos para la funcion original.

pte2) 
i)
Planteo la generalizacion, y demuestro el pasaje, y que p.x:xs es un caso particular de la generalizacion.

Planteo la transicion:

	 gp.n.xs = <∃ as, b, bs : xs = as ++ b:bs: n + sum.as ≤ b ∧ sum.bs ≤ b >

ii) Relacionamos el caso particular con el caso base de la generalizacion (n=0)
p.xs es un caso particular de gp.n.xs cuando n = 0. Definimos:

	p.xs = gp.n.xs

gpsum generaliza a psum 

nueva derivacion de psum:

	p.xs
	={espeficacion}
	<∃ as, b, bs : xs = as ++ b:bs: 0 + sum.as ≤ b ∧ sum.bs ≤ b >
	={aritmetica}
	<∃ as, b, bs : xs = as ++ b:bs: 0 + sum.as ≤ b ∧ sum.bs ≤ b >
	={especificacion de gp.xs}
	gp.n.xs

iii) caso base de la generalizacion, xs = []

	gp.[]
	={especificacion}
	<∃ as, b, bs : [] = as ++ b:bs: n + sum.as ≤ b ∧ sum.bs ≤ b >
	={prop listas}
	<∃ as, b, bs : [] = as ^ b:bs = [] n + sum.as ≤ b ∧ sum.bs ≤ b >
	={lógica}
	<∃ as, b, bs : [] = as ^ false n + sum.as ≤ b ∧ sum.bs ≤ b >
	={abs, rango vacio}
	false

iv) Planteo de hipotesis inductiva. Planteo

	HI= gp.E.xs = <∃ as, b, bs : xs = as ++ b:bs: E + sum.as ≤ b ∧ sum.bs ≤ b >

V) Caso inductivo. xs = x:xs 

	gp.n.x:xs
	={especificacion}
	<∃ as, b, bs : x:xs = as ++ b:bs: n + sum.as ≤ b ∧ sum.bs ≤ b >
	={lógica (neutro de ^)}
	<∃ as, b, bs : x:xs = as ++ b:bs ^ true: n + sum.as ≤ b ∧ sum.bs ≤ b >
	={lógica de listas, 3ro excluido}
	<∃ as, b, bs : x:xs = as ++ b:bs ^ (as = [] v as !=[]) 
	: n + sum.as ≤ b ∧ sum.bs ≤ b >
	={distributividad}
	<∃ as, b, bs : x:xs = as ++ b:bs ^ as = []) 
	: n + sum.as ≤ b ∧ sum.bs ≤ b > v 
	<∃ as, b, bs : x:xs = as ++ b:bs ^ as !=[] :
	n + sum.as ≤ b ∧ sum.bs ≤ b >
	={lógica de listas, elim de var}
	<∃ as, b, bs : x:xs = [] ++ b:bs) 
	: n + sum.[] ≤ b ∧ sum.bs ≤ b > v 
	<∃ as, b, bs : x:xs = as ++ b:bs ^ a:as !=[] :
	n + sum.as ≤ b ∧ sum.bs ≤ b >
	={lógica de listas}
	<∃ as, b, bs : x = b ^ xs = bs) : n + 0 ≤ b ∧ sum.bs ≤ b > v 
	<∃ as, b, bs : x:xs = a:as ++ b:bs : n + sum.a:as ≤ b ∧ sum.bs ≤ b >
	={lógica de listas, elim de variable}
	n + 0 ≤ x ∧ sum.xs ≤ x v 
	<∃ as, b, bs : a = x ^ xs = as ++ b:bs : n + sum.a:as ≤ b ∧ sum.bs ≤ b >
	={elim de variable, arit}
	n ≤ x ∧ sum.xs ≤ x v 
	<∃ as, b, bs :xs = as ++ b:bs : n + sum.x:as ≤ b ∧ sum.bs ≤ b >
	={def de sum, conmutatividad}
	n ≤ x ∧ sum.xs ≤ x v 
	<∃ as, b, bs :xs = as ++ b:bs : (n+x) + sum.as ≤ b ∧ sum.bs ≤ b >
	={hipotesis}
	n ≤ x ∧ sum.xs ≤ x v gp.(n+x).xs

queda el programa como:

	p.xs = gp.0.xs
	gp.n.xs = false
	gp.n.(x:xs) = n ≤ x ∧ sum.xs ≤ x v gp.(n+x).xs

#### para el lado que usa la lista vacia de as = [], no existe en la solucion del profe, y no se si se esté salteando. Por que digamos, ambos casos parten de la generalizacion que usa n+ en el termino, por que no lo tendría la parte de la lista vacia ? en ningun momento se declara algo como n = 0 para que no se use. Dejo la sol del profe:

Caso inductivo: 

gP.(x►xs) 
= { mismos pasos que con P pero todo con el "n +" } 
... ∨ 〈 ∃ as, b, bs : xs = as ++ (b►bs) : n + x + sum.as ≤ b ∧ sum.bs ≤ b 〉 
= { H.I. } 
... ∨ gP.(n+x).xs 
= { retomo 1er cuantificador pero con el "n +" } 
〈 ∃ as, b, bs : x►xs = as ++ (b►bs) ∧ as = [] : sum.as ≤ b ∧ sum.bs ≤ b 〉 ∨ gP.(n+x).xs
= { elim. variable as } 
〈 ∃ b, bs : x►xs = [] ++ (b►bs) : sum.[] ≤ b ∧ sum.bs ≤ b 〉 ∨ gP.(n+x).xs
={ prop. listas } 
〈 ∃ b, bs : x = b ∧ xs = bs : sum.[] ≤ b ∧ sum.bs ≤ b 〉 ∨ gP.(n+x).xs
= { rango unitario }
(sum.[] ≤ x ∧ sum.xs ≤ x) ∨ gP.(n+x).xs 
= { def. sum } (0 ≤ x ∧ sum.xs ≤ x) ∨ gP.(n+x).xs 

Resultado final: 
P.xs ≐ gP.0.xs 
gP.[] ≐ False 
gP.(x►xs) ≐ (0 ≤ x ∧ sum.xs ≤ x) ∨ gP.(n+x).xs

#### aparte hace mencion de n+x en el lado de la induccion, pero el programa no tiene un n ?¿¿? 

chatgpt me dio la razon a mi B)


### parcial turno tarde 2024 (imperativo)

	Const N : Int, A : array [0, N) of Int; 
	Var res : Bool; 
	{P: N ≥ 0 } 
	S 
	{ Q: res = ⟨ ∀ i : 0 ≤ i ≤ N : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ }

A) Calcular el resultado para A =[-2,5,7,3] usando la especificacion. Justificar, enumerando todos los elementos del rango.

Sabemos que el rango es para A = [-2,5,7,3], entonces i E {0,1,2,3,4}  y N = 4

-> ⟨ ∑ j : 0 ≤ j < 0: A.j ⟩ < 2^0
^ ⟨ ∑ j : 0 ≤ j < 1: A.j ⟩ < 2^1
^ ⟨ ∑ j : 0 ≤ j < 2: A.j ⟩ < 2^2
^ ⟨ ∑ j : 0 ≤ j < 3: A.j ⟩ < 2^3
^ ⟨ ∑ j : 0 ≤ j < 4: A.j ⟩ < 2^4

= { aritmetica }
^ 0< 1
^ A.0 < 2
^ A.0 + A.1 < 4
^ A.0 + A.1 + A.2 < 8
^ A.0 + A.1 + A.2 + A.3 < 16

={ vemos los valores en indices}
^ 0< 1
^ -2  < 2
^ -2 + 5< 4
^ -2 + 5 + 7 < 8
^ -2 + 5 + 7 + 3 < 16
={resuelvo ^ }
True ∧ True ∧ True ∧ False ∧ True 
≡ { resuelvo ∧ } 
False

B) Derivacion.

	Const N : Int, A : array [0, N) of Int; 
	Var res : Bool; 
	{P: N ≥ 0 } 
	S; // cuerpo del programa
	{ Q: res = ⟨ ∀ i : 0 ≤ i ≤ N : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ }


Tenemos un arreglo, el cual debo de recorrer con un ciclo. Necesito una invariante y una guarda que cumplir, uso tecnica de reemplazo por variable:

	INV = res = ⟨ ∀ i : 0 ≤ i ≤ pos : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^
	0 <= pos <= N

	B = pos < N

Y demuestro Inv ^ -b => Q


	inv ^ -b => Q
	={asignaciones}
	res = ⟨ ∀ i : 0 ≤ i ≤ pos : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^
	0 <= pos <= N ^ -(pos < N)=> 
	res = ⟨ ∀ i : 0 ≤ i ≤ N : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩
	={logica aritmetica, elim de var}
	res = ⟨ ∀ i : 0 ≤ i ≤ N : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ =>
	res = ⟨ ∀ i : 0 ≤ i ≤ N : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩
	={p => p}
	true

sabemos q El programa, tendrá la siguiente estrucutra:

	Const N : Int, A : array [0, N) of Int; 
	Var res : Bool; 
	{P: N ≥ 0 } 
	S1; // inicializacion del programa
	{inv}
	do pos < n ->
		{inv ^ b}
		S2; // cuerpo del ciclo
		{inv}
	od
	{ Q: res = ⟨ ∀ i : 0 ≤ i ≤ N : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ }

i) Inicializacion del ciclo:

	{P: N ≥ 0 } 
	S1; // cuerpo del programa
	{res = ⟨ ∀ i : 0 ≤ i ≤ pos : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^
	0 <= pos <= N}

El programa se debe iniciar, inicializando variables, como pos y res, propongo.

	res,pos := E, F

y hago wp

	wp.s1.inv
	={wp de :=}
	E = ⟨ ∀ i : 0 ≤ i ≤ F : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^
	0 <= F <= N}
	={propongo E, F := True, 0, para forzar un rango vacio}
	True = ⟨ ∀ i : 0 ≤ i ≤ 0 : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^
	0 <= 0 <= N}
	={Rango vacio para el para todo}
	True = True
	={ logica}
	true

entonces, la inicializacion del ciclo va quedando:

	Const N : Int, A : array [0, N) of Int; 
	Var res : Bool; 
	{P: N ≥ 0 } 
	res,pos := E, F; 
	{inv}
	do pos < n ->
		{inv ^ b}
		S2; // cuerpo del ciclo
		{inv}
	od
	{ Q: res = ⟨ ∀ i : 0 ≤ i ≤ N : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ }

ii) cuerpo del ciclo.

El ciclo debe avanzar, tenemos que hacer wp.s2.inv, y como el ciclo debe avanzar, asumimos que res, pos := E, pos+1. Asumimos Inv ^ B como hipotesis

Identifiquemos que, el rango, es:
0 ≤ i ≤ pos con <=, no con <.

	wp.s1.inv
	={wp de :=,  res, pos := E, pos+1}
	E = ⟨ ∀ i : 0 ≤ i ≤ pos+1 : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^
	0 <= pos+1 <= N
	={lógica en el rango, por inicio, teniendo en cuenta que es <=}
	E = ⟨ ∀ i : i = pos+1 v 0 <= i <= pos : 
	⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^ 0 <= pos+1 <= N
	={hipotesis, 0<=i<=N y B (pos<n), particion de rango}
	E = ⟨ ∀ i : i = pos+1 ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^ 
	⟨ ∀ i : 0 <= i <= pos ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩
	={rango unitario}
	E = ⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ < 2^pos+1 ^ 
	⟨ ∀ i : 0 <= i <= pos ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩
	={hipotesis, aritmetica}
	E = res ^ ⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ < 2^pos *2
	={logica, part de rango, rango unitario}
	E = res ^ ⟨ ∑ j : 0 ≤ j < pos : A.j ⟩ + A.pos < 2^pos *2
	={me trabo} 

**fortalecimiento de invariante.** uso el mismo invariante + lo que me falta en la hipotesis.: 

	Inv' = res = ⟨ ∀ i : 0 ≤ i ≤ pos : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^
	sum = ⟨ ∑ j : 0 ≤ j < pos : A.j ⟩ ^ pow = 2 * pos ^ 0 <= pos <= N

Sabemos que 

	inv' => Inv

y en consecuencia:

	inv' ^ -b => Q

iii) Cuerpo del ciclo con invariante reforzado:

Ahora, S1, será de la forma:
Sabemos que el ciclo debe avanzar:

	res, sum, pow, pos := E, F, G, pos +1

->

	wp.(res, sum, pow, pos := E, F, G, pos +1).Inv'
	={wp de asignacion}
	E = ⟨ ∀ i : 0 ≤ i ≤ pos+1 : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^
	0 <= pos+1 <= N ^ F =⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ ^ G = 2^pos+1
	={Lógica en el rango, mismos pasos que hicimos antes, hipotesis}
	E = ⟨ ∀ i : i = pos+1 v 0<=i<=pos : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^ 
	F =⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ ^ G = 2 * pos+1
	={part de rango, rango unitario}
	E = ⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ < 2^pos+1  ^
	⟨ ∀ i :  0<=i<=pos : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^ 
	F =⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ ^ G = 2^pos+1
	={HI}
	E = ⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ < 2^pos+1 ^ res ^ 
	F =⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ ^ G = 2^pos+1
	={Aritmetica, part de rango, rango unitario}
	E = ⟨ ∑ j : 0 ≤ j < pos : A.j ⟩ A.pos < 2^pos *2 ^ res ^ 
	F =⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ ^ G = 2^pos+1
	={Hipotesis, sum, pow}
	E = res ^ sum + A.pos < pow * 2 ^ 
	F =⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ ^ G = 2^pos+1
	={Elijo: E = sum + A.pos < pow * 2 ^ res, abs}
	True ^ F =⟨ ∑ j : 0 ≤ j < pos+1 : A.j ⟩ ^ G = 2^pos+1
	={misma part de rango, rango unitario, arti}
	F =⟨ ∑ j : 0 ≤ j < pos : A.j ⟩ A.pos ^ G = 2^pos * 2
	={Hipotesis nuevas}
	F = Sum + A.pos ^ G = pow * 2
	={elijo}
	True

iv) Inicializacion

por la hipotesis nuevas, las variables deben ser introducidas y iniciadas. 
Supongo P como hipotesis.

	res,sum,pow,pos := E, F, G, H

->

	wp.s0.Inv'
	={Wp de :=}
	E = ⟨ ∀ i : 0 ≤ i ≤ H : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ ^
	0 <= 0 <= N ^ F = ⟨ ∑ j : 0 ≤ j < 0 : A.j ⟩ ^ G = 2^0
	={Forzamos rangos vacios, H = 0, logica arit}
	E = True ^
	0 <= 0 <= N ^ F = ⟨ ∑ j : 0 ≤ j < 0  : A.j ⟩ ^ G = 1
	={Hipotesis, elijo E=true, G = 1}
	0 <= 0 <= N ^ F = 0 ^ G = 2^0
	={Hipotesis, elijo F=0}
	 True

Quedando:

	Const N : Int, A : array [0, N) of Int; 
	Var res : Bool, pos, sum, pow : Int; 
	{ P } 
	res, sum, pow, pos := True, 0, 1, 0; 
	do pos < N → 
		res, sum, pow, pos := res ∧ 
								(sum + A.pos < pow * 2), sum + A.pos, pow * 2, pos + 1 
		od 
	{ Q }


Para funcion de cota:

A)la cota es t = N - pos, el invariante es pos <= N
ya que Inv ^ B => t >= 0

B)Decrece con cada iteraciopn por que pos se incrementa en 1, y N tiene tamaño constante.
{Inv ^ b ^ t = T} // la cota vale un tamaño
s // hace las ejecuciones
{inv ^ t < T} // la cota decreció


para nuestro caso, pos se incrementaria por cada iteracion, quedandose más cerca de N, para terminar el ciclo. 


C) Para el fortalecimiento de la guarda, para la terminacion anticipada, tendríamos que:

B' = pos < N ^ res 

Demostremos que Inv'  ^ -res => Q
Sabemos que nuestro res, ya es true. Si lo negamos es false.

->

	res = inv'
	={ valor de inv }
	res = false ^ sum = ⟨ ∑ j : 0 ≤ j < pos¡ : A.j ⟩ ^ pow = 2 * pos
	={abs de false}
	res = false 
	={valor de -res}
	false = false