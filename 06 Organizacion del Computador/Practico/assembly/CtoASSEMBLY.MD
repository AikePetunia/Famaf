// C -> Assembly

cd ../programa.c
aarch64-linux-gnu-gcc -S -O0 programa.c // no optimizado
aarch64-linux-gnu-gcc -S -O2 programa.c // optimizado

// mediante consola:
echo "int sumar(int a, int b) { return a + b; }" | aarch64-linux-gnu-gcc -S -O2 -xc -o- -

// alternativa: (usar compilardor armv8-a)
https://godbolt.org/
