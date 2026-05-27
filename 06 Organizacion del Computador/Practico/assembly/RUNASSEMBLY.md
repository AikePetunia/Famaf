cd ../ejercicio.s

aarch64-linux-gnu-as -o ejercicio.o ejercicio.s // ensambla
aarch64-linux-gnu-gcc -static -o ejercicio ejercicio.o // linkea
qemu-aarch64 ./ejercicio // ejecuta
qemu-aarch64 -g 1234 ./ejercicio

// depuracion / ver procesos:
qemu-aarch64 -g 1234 ./ejercicio
gdb ./ejercicio

target remote localhost:1234 // (Esto conecta GDB a tu emulador).
layout asm
layout regs //(Para ver una interfaz gráfica súper copada con tu código y los registros en vivo).
si // (Para ejecutar la instrucción actual y pasar a la siguiente)
