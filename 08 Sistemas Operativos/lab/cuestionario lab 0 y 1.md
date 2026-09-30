# Examen Oral Intensivo: Laboratorios 0 y 1 (Sistemas Operativos)

---

## Bloque 1: Fundamentos de Shell y Sistemas Operativos

### Pregunta 1: Arquitectura, Espacios de Memoria y Syscalls
- ¿Cuál es la diferencia conceptual y funcional entre el **Shell** y el **Kernel**?
- Explicá la diferencia entre **espacio de usuario** (*user space*) y **espacio de kernel** (*kernel space*). ¿Qué ocurre a nivel de hardware/CPU cuando la shell realiza una llamada al sistema como `fork()` o `open()`?

### Pregunta 2: El Ciclo REPL
- ¿Qué significan las siglas **REPL** (Read-Evaluate-Print Loop) y cuál es la tarea fundamental de cada fase en la arquitectura del laboratorio?
- ¿Qué módulo de *MyBash* se encarga de orquestar el ciclo principal REPL?

### Pregunta 3: Comandos Internos (Builtins) vs. Comandos Externos
- ¿Cuál es la diferencia conceptual y de ejecución entre un comando interno (*builtin*) y uno externo?
- Explicá la razón de ser de comandos internos como `cd`, `exit` y `export`. ¿Por qué es técnicamente imposible que `cd` funcione correctamente si se ejecutara como un programa externo en un proceso hijo?

---

## Bloque 2: Gestión de Procesos

### Pregunta 4: La Mecánica de `fork()` y `execvp()`
- Explicá en detalle qué hace `fork()` a nivel de memoria virtual, tabla de descriptores y copia de contexto. ¿Cuáles son sus posibles valores de retorno y qué significan en el padre y en el hijo?
- ¿Qué hace exactamente `execvp()` con la imagen del proceso que lo invoca?
- ¿Por qué la combinación `fork()` + `execvp()` es el patrón estándar para ejecutar comandos externos en Unix?

### Pregunta 5: Sincronización y Ciclo de Vida (Zombies y Huérfanos)
- ¿Qué son `wait()` y `waitpid()` y por qué son necesarios para la sincronización entre procesos padre e hijo?
- **Procesos Zombie:** ¿Qué es un proceso zombie, por qué se produce en el Kernel y cómo se evita su acumulación en la tabla de procesos?
- **Foreground vs. Background (`&`):** ¿En qué se diferencia el flujo de ejecución del shell cuando corre un comando en primer plano versus uno en segundo plano con `&`? ¿Qué hace el shell con `wait()` en cada caso?

---

## Bloque 3: Comunicación Entre Procesos (IPC) y Redirección de E/S

### Pregunta 6: Descriptores de Archivo y Redirección de Entrada/Salida
- ¿Qué es un Descriptor de Archivo (*File Descriptor*)? ¿Cuáles son los tres descriptores estándar por defecto (0, 1, 2) y a qué corresponden?
- Explicá el funcionamiento de las syscalls involucradas en la redirección (`open()`, `close()`, `dup()`, `dup2()`). ¿Por qué es indispensable llamar a `close()` sobre el descriptor original inmediatamente después de invocar `dup2()`?

### Pregunta 7: Tuberías / Pipes (`|`)
- ¿Qué es una tubería (*pipe*) a nivel conceptual y cómo conecta la salida de un proceso con la entrada de otro?
- ¿Qué hace la syscall `pipe(fd)` y qué representan los elementos `fd[0]` y `fd[1]` del arreglo devuelto?
- ¿Qué condición exacta requiere el Kernel para enviar un fin de archivo (`EOF`) al proceso lector del pipe? ¿Qué sucede si el proceso padre olvida cerrar su extremo de escritura `fd[1]`?

---

## Bloque 4: Análisis de Comandos y Secuencias de Syscalls (Práctico Oral)

*Instrucciones del Bloque:* Para cada uno de los siguientes 5 casos, detallá la **secuencia cronológica exacta** de llamadas al sistema (`fork`, `execvp`, `open`, `dup2`, `close`, `pipe`, `wait`/`waitpid`) especificando **qué proceso (Padre o Hijo/s)** ejecuta cada syscall y en qué orden estricto.

### Caso 1: Comando simple
`gzip Lab1G04.tar`
- *Syscalls esperadas:* `fork`, `execvp`, `wait`.

### Caso 2: Con redirección de salida
`ls -l > out.txt`
- *Syscalls esperadas:* `fork`, `open`, `dup2`, `close`, `execvp`, `wait`.

### Caso 3: En Background
`xeyes &`
- *Syscalls esperadas:* `fork`, `execvp` (aclarar qué ocurre con `wait`).

### Caso 4: Con Pipe
`ls -l | wc -l`
- *Syscalls esperadas:* `pipe`, dos `fork`, `dup2`, `close`, `execvp` en cada hijo, dos `wait`.

### Caso 5: Combinado Complejo
`cat file.txt | grep 'a' > out.txt &`
- *Syscalls esperadas:* Requiere combinar `pipe`, `fork`, `open`, `dup2`, `close`, `execvp` y gestión de ejecución en background sin `wait` inmediato.

---

## Bloque 5: Programación en C y Herramientas del Laboratorio

### Pregunta 8: Manejo de Strings, Punteros y Seguridad
- ¿Cómo se representa internamente una cadena de texto (*string*) en C? ¿Qué rol juega el carácter nulo (`\0`)?
- Explicá la función y valor devuelto de: `strlen()`, `strcpy()`, `strcat()` y `strcmp()` de `<string.h>`.
- **Buffer Overflow:** ¿Qué es un desbordamiento de búfer, por qué ocurre con funciones inseguras como `strcpy()` o `strcat()`, y qué consecuencias puede tener en la ejecución del programa?
- **`strmerge()`:** ¿Cuál es el propósito de la función `strmerge()` desarrollada en el laboratorio, cómo gestiona la memoria dinámica en el Heap y en qué se diferencia de `strcat()`?

### Pregunta 9: Manejo de Memoria Dinámica y Librerías de Estructuras
- ¿Por qué se sugiere el uso de la librería **GLib** (ej. `GList`) para la gestión de secuencias y listas en los TADs del laboratorio?
- En C, ¿quién es responsable de liberar la memoria asignada dinámicamente (`malloc`/`calloc`) en una estructura cuando los punteros se transfieren entre módulos?

---

## Bloque 6: Arquitectura Específica del Laboratorio MyBash

### Pregunta 10: Responsabilidad de Módulos en MyBash
Explicá el rol y la responsabilidad de cada uno de los módulos que componen la arquitectura de *MyBash*:
- `mybash.c`: Ciclo principal.
- `command.c`: Implementación de los TADs.
- `parsing.c`: Orquestación del parsing.
- `execute.c`: Ejecución de pipelines y llamadas al sistema.
- `builtin.c`: Identificación y ejecución de comandos internos.

### Pregunta 11: Tipos Abstractos de Datos (TADs) y Módulo Parser
- **TAD `scommand`:** ¿Qué abstrae y qué información contiene (comando, argumentos, redirecciones de entrada/salida)?
- **TAD `pipeline`:** ¿Qué abstrae y cómo representa una secuencia de `scommand` conectados por pipes, junto con el modificador de background (`&`)?
- **Relación Parser vs. Parsing:** Explicá la interacción entre el módulo `parsing.c` y los módulos precompilados `parser.o` y `lexer.o` provistos por la cátedra. ¿Cómo colaboran para transformar una cadena ingresada por el usuario en un TAD `pipeline`?