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