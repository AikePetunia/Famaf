# Guión para Video: Auditoría Forense sobre FAT32-FUSE

**Objetivo:** Guiar la presentación del sistema de auditoría forense sobre fat-fuse: la creación del log al montar, el registro de operaciones críticas en `/.audit/events.bin` y la recuperación de archivos borrados con `restore`.

**Requisitos del PDF para el video:**

1. Demostración del sistema funcionando.
2. Mostrar los logs con `audit_reader`.
3. Demo de **restore exitoso**: borrar un archivo, recuperarlo y verificar que los datos estén intactos.
4. Demo de **restore fallido**: borrar un archivo, crear otro que use el mismo cluster e intentar el restore (debe fallar).
5. Explicación conceptual de por qué `unlink` permite recuperar datos aunque el archivo se haya "borrado".
6. Limitaciones: en qué casos no se puede recuperar, en qué casos falla y qué casos borde se eligió no implementar.
7. **Participan todos los integrantes.**

**Pre-producción:**

1. Imagen limpia para cada demo: `cp resources/fatfs.img disk.img`.
2. Correr las demos antes de grabar y anotar los números de cluster que salgan (pueden variar).
3. Tener `make clean && make` y `cd tools && make audit_reader` hechos.
4. Dos terminales: una con `./fat-fuse -f disk.img mnt` (para que se vean los `DEBUG`) y otra para los comandos.

**Duración total:** 7:00 minutos.

## I. Introducción y Contexto

1. **Presentación:** Presentar el equipo y el laboratorio. Explicar el objetivo (registrar operaciones críticas y recuperar archivos borrados).
2. **Arquitectura:** Explicar los roles: la imagen `.img` es el disco, fat-fuse es el driver en espacio de usuario y FUSE le pasa los pedidos del kernel.
3. **Memoria vs. disco:** Explicar que hay que mantener consistentes el árbol en memoria (lo que consulta FUSE) y la imagen (lo que persiste), y que crear algo requiere los dos pasos.

## II. Parte 1: Creación del Sistema de Logs

1. **Funcionamiento:** Explicar qué hace `audit_init()` al montar: crear o cargar `/.audit/events.bin`.
2. **Decisiones de diseño:** Mencionar y justificar:
   - Por qué se llama después de cargar los hijos de `/`.
   - Por qué no se usan `fat_fuse_mkdir` / `fat_fuse_mknod` (`get_fat_volume()` y el contexto de FUSE).
   - La política de fallos: abortar si no se puede crear el log.
   - La modularización (`create_audit_dir`, `create_events_bin`).
3. **Bugs encontrados:** Comentar brevemente el del segundo montaje (se pisaba `events.bin` porque los hijos de `.audit` no estaban cargados) y el del primer montaje (parámetro pasado por copia).
4. **Demo de persistencia:** Montar, desmontar y volver a montar. Mostrar en los `DEBUG` los mensajes "Created" en el primer montaje y "already exists" en el segundo.

## III. Partes 2 a 4: Estructura del Evento y Logging

1. **Estructura `audit_event_t`:** Explicar el tamaño fijo de 512 bytes, la parte común, el `union` (`write_info` / `unlink_info`) y el `_Static_assert`. Justificar el tamaño frente al tamaño de cluster.
2. **Operaciones registradas:** Mencionar `write`, `unlink`, `mkdir` y `rmdir`, y qué guarda cada una y para qué.
3. **Decisiones:** Justificar:
   - La cadena completa de clusters frente a solo el primero (fragmentación).
   - Por qué el evento de `unlink` se arma **antes** de borrar.
   - El usuario con `uid` en vez de `getlogin()`.
   - La Opción 2 (logueo parcial) para archivos de más de 32 clusters.
4. **Demo de logging:** Crear, borrar, `mkdir` y `rmdir`, y mostrar la salida de `audit_reader -v`. Señalar una cadena fragmentada (por ejemplo `[8, 9, 11]`, con el cluster del medio usado por `events.bin`).

## IV. Parte 5: Restore y Detección de Colisiones

1. **Concepto:** Explicar por qué un archivo borrado se puede recuperar: `unlink` marca la dentry con `0xE5` y libera la FAT, pero no borra los datos.
2. **Invocación:** Explicar cómo se invoca `restore` (ioctl o archivo especial) y por qué se eligió ese mecanismo.
3. **Algoritmo:** Detallar cómo se busca el `unlink`, cómo se detecta si un `write` o `mkdir` posterior usó sus clusters y cómo se reconstruye el archivo.
4. **Demo de restore exitoso:** Borrar, restaurar y verificar el contenido.
5. **Demo de restore fallido:** Borrar, crear otro archivo o directorio que use el mismo cluster, e intentar restaurar.
6. **Puntos estrella (si aplica):** Mostrar `restore -r` o el visualizador web.

## V. Limitaciones y Cierre

1. **Limitaciones:** Mencionar los casos que no se recuperan o no se implementaron (más de 32 clusters, fechas no guardadas, el `'\0'` que escribe `fat_file_unlink` en el primer byte de cada cluster, etc.).
2. **Cierre del equipo.**
