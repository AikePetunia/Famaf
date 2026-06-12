.global main
main:
    MOV X0, #5       // Cargamos un 5
    ADD X1, X0, X0   // X1 = 5 + 5
    MOV X8, #93      // Código del syscall para "exit" en Linux ARM64
    MOV X0, #0       // Código de salida (0 = sin errores)
    SVC #0           // Llamada al sistema operativogi
    