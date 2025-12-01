Const N : Int, A : array [0, N) of Int; 
Var res : Bool; 
{P: N ≥ 0 } 
S 
{ Q: res = ⟨ ∀ i : 0 ≤ i ≤ N : ⟨ ∑ j : 0 ≤ j < i : A.j ⟩ < 2^i ⟩ }

A) Calcular el resultado para A =[-2,5,7,3] usando la especificacion. Justificar, enumerando todos los elementos del rango.

Sabemos que el rango es para A = [-2,5,7,3], entonces i E {0,1,2,3,4} (El arreglo es de tamaño 4)

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
	E = res ^ ⟨ ∑ j : 0 ≤ j < pos¡ : A.j ⟩ + A.pos < 2^pos *2
	={me trabo} 

**fortalecimiento de invariante.** uso el mismo invariante + lo que me falta en la hipotesis.: 

	Inv' = res ^ sum = ⟨ ∑ j : 0 ≤ j < pos¡ : A.j ⟩ ^ pow = 2 * pos

Sabemos que 

	inv' => Inv

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