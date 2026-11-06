## Parte 1: crear o cargar `/.audit/events.bin`

Para la parte 1 de logging, necesitábamos **preparar el lugar donde se iba a guardar el log de lo que sucedía dentro de FUSE** (el archivo `/.audit/events.bin`), para **más tarde (parte 5)** restaurar los archivos. **Esta función no guarda eventos: crea o carga `events.bin`. Los eventos los guarda después `audit_log_write`**

**Creamos una función llamada `audit_init()` que se llama en `fat_fuse_init()`, después de cargar los hijos de `/` (la raíz del FS),** porque tienen que estar cargados para **saber si `.audit` ya existía**. Si no, podía empezar a crear `.audit` nuevos y pisar la información anterior, sin cumplir con la persistencia entre montajes.

No usamos `fat_fuse_mkdir`/`fat_fuse_mknod`, ya que dependen del contexto de FUSE, y en este punto ese contexto todavía no se creó.

Por diseño, si `audit_init` no puede crear el log, el programa sale con un `exit(1)`: se pide implementar un sistema de archivos forense, y un filesystem forense sin auditoría no tiene sentido. Por eso `audit_init` es de tipo `void`: si falla, aborta adentro, y no hay nada que devolverle a quien la llama. Abortar ahí es seguro, porque todavía no se llamó a `fuse_main`, así que no hay ningún punto de montaje que desmontar.

Encontramos un bug, no voy a detallarlo tan técnicamente por cuestión de tiempo: en el primer montaje con imagen limpia, el `ls mnt/.audit` salía vacío, pero en el segundo andaba bien. Fallaba porque la función que crea `.audit` recibía el nodo como parámetro y lo asignaba adentro, pero en C los parámetros son copias: afuera el nodo seguía vacío, y `events.bin` quedaba sin padre en el árbol. En el segundo montaje andaba porque todo se leía del disco, donde sí estaba bien escrito. Lo arreglamos haciendo que la función devuelva el nodo.

Finalmente, para mantener el código limpio, modularizamos: la creación de `.audit` y de `events.bin` están en funciones separadas para facilitar la lectura del código, y las dos se llaman desde `audit_init`.

**Demo (~20 s):** montar, desmontar, volver a montar. Mostrar en la terminal "Created…" la primera vez y "already exists" la segunda.

```bash
# terminal 1: primer montaje; imagen limpia 
cp resources/fatfs.img disk.img
./fat-fuse -f disk.img mnt 2>&1 | grep -E "audit|events" 
# → "Created events bin /.audit/events.bin file.
# terminal 2
ls -la mnt/.audit 
fusermount -u mnt 

--- 

# terminal 1: segundo montaje, MISMA imagen (sin el cp)
./fat-fuse -f disk.img mnt 2>&1 | grep -E "audit|events"
# → "/.audit already exists, loaded from disk."
# → "/.audit/events.bin already exists, loaded from disk."
# terminal 2
ls -la mnt/.audit 
fusermount -u mnt

```
## Parte 4: logging de `unlink`, `mkdir` y `rmdir`

Bueno, ahora que se habló de cómo estructurar los logs (o sea, la información que se guarda), **tenemos que guardar TODOS los eventos según el tipo y la acción, en el `.bin` que creamos en la parte 1**, **con la estructura hecha en la parte 2.**

**Las operaciones ya existían en el código base de FUSE**; la diferencia era agregarles un log. Cada una arma un evento de 512 bytes con la esctructura de la parte 2 y lo **agrega al final de `events.bin` con `audit_log_write`**, la misma función que usa el `write`. 

// esta tabla estaria buena mostrarla en el mismo video. Tipo, "bueno segun el tipo de operacion, ahora mismo deberia de aparecer una tabla en pantalla".

| Operación | Guarda                             | Para qué                                            |
| --------- | ---------------------------------- | --------------------------------------------------- |
| write     | clusters del archivo               | detectar si alguien pisó los clusters de un borrado |
| unlink    | **cadena completa**, tamaño, padre | reconstruir el archivo                              |
| rmdir     | lo mismo que `unlink`              | saber qué directorio era y dónde estaba             |
| mkdir     | su cluster y el padre              | `mkdir` también reutiliza clusters → colisión       |
#### Respecto a decisiones de la parte 4.

- **La primera decisión** fue loguear la cadena completa y no solo el primer cluster, porque los archivos se fragmentan. Ejemplo real: `b.txt` quedó en `[8, 9, 11]` porque el 10 lo usó `events.bin`. Con solo el primero, el restore habría supuesto `[8, 9, 10]`.

- **La segunda** es que el evento del `unlink` se arma ANTES de borrar. Después, la FAT ya está en 0 y la cadena no existe.

- **La tercera decisión** fue usar el `union` para los eventos a loguear, pues un evento es de write **o** de unlink, así que comparten el espacio. Gracias a eso la cadena entra en los 512 bytes, y un `_Static_assert` no deja compilar si se pasa.

- **Por último**, si un archivo tiene más de 32 clusters, se loguea la cadena parcial. Comparando con el tamaño, el restore detecta que está incompleta y se niega a recuperarlo (eso lo cuento en la parte 5).

- **No se guardan las fechas**: no hacen falta para recuperar el contenido.

**Demo (~30 s), en terminal**, porque el PDF pide mostrar los logs con `audit_reader`:

```bash

yes B | head -c 3000 > mnt/b.txt
rm mnt/b.txt
mkdir mnt/d
rmdir mnt/d
sleep 1                                
./audit_reader -v mnt/.audit/events.bin

```

Ahora, todo esto de guardar los eventos nos va a permitir restaurar información, lo que nos lleva a la parte 5, el restore:

---
## Parte 5: restore

Ya que tenemos todo listo, ahora vamos a tener que restaurar un archivo a través de todo los eventos guardado

- **¿Por qué se puede recuperar un archivo borrado? Porque en FAT, borrar no destruye los datos: solo hace que el sistema se olvide de dónde estaban. Cuando hacemos rm, pasan dos cosas: la entrada del directorio se marca como borrada (0xE5), y en la FAT los clusters del archivo se marcan como libres. Pero nadie pasa por esos clusters a borrar el contenido: los bytes siguen ahí, hasta que otro archivo use esos clusters y los pise.

- **Lo que sí se pierde es el mapa: en qué clusters estaba el archivo y en qué orden**. Y como los archivos pueden estar fragmentados, no se puede adivinar. Por eso el unlink guarda la cadena completa en el log antes de borrar: con esa cadena, podemos volver a armar el archivo, siempre que nadie haya pisado sus clusters.

Tabla q aparecera:

|                 | Antes del `rm`     | después del `rm`               |
| --------------- | ------------------ | ------------------------------ |
| dentry b.txt    | B.txt -> cluster 8 | ?.txt (0xE5) -> "borrado"      |
| FAT[8]          | 9                  | 0 (libre)                      |
| FAT[9]          | 11                 | 0 (libre)                      |
| FAT[11]         | fin                | 0 (libre)                      |
| clusters 8,9,11 | "BBB.."            | "BBB..." (los datos aun estan) |
| log             | -                  | UNLINK /B.txt [8,9,11] <- Mapa |

Codigo:
- **Cómo se invoca:** usamos `ioctl()`, una syscall que hace de puente entre el `user-space` y el `kernel-space`, para la operacion custom que creamos para la restauracion de archivos.

- En cuanto al código, lo dividimos en 5 etapas distintas (modularizamos), pues era una parte **muy, muy pesada**, como se puede apreciar en el código. Además de poder programarlo con más facilidad, permite más abstracción y, en consecuencia, una mejor lectura del código.

**El algoritmo, en 5 etapas (sin código):**

1. Buscar el último `UNLINK` de ese path en el log.
2. Chequeos rápidos: ¿ya existe? ¿El padre sigue existiendo? ¿La cadena está completa?
3. Colisiones: ¿algún `WRITE` o `MKDIR` posterior usó sus clusters? ¿Están ocupados ahora en la FAT?
4. Reconstruir: volver a encadenar la FAT, rearmar la dentry en el padre y meterlo en el árbol.
5. Cierre: devolver si quedó en su lugar (0) o en la raíz (1), y `restore` se lo muestra al usuario.

**Decisiones:**
- El programa NO FALLA en silencio: cada caso que no se puede resolver devuelve un error específico.
- Si la cadena está incompleta, se niega: si falta aunque sea un cluster, no se recupera nada. Mejor no recuperar que devolver un archivo roto.
- Si el padre ya no existe, se restaura en `/` y se avisa.
- Por algo del código base: al borrar, se escribía un `'\0'` (un byte nulo en `C`) en el primer byte de cada cluster, para que si un directorio nuevo reutilizaba ese cluster no leyera basura vieja como si fueran entradas. Lo movimos a **cuando se crea un directorio**. Si no, ningún archivo volvía "intacto".

**Explicación de las limitaciones de su sistema**: en qué casos no puede recuperar la información, en qué casos falla y qué casos borde eligieron no implementar.

- Más de 32 clusters: no se recupera.

- Solo archivos, no directorios.

- Se pierden las fechas originales.

- El log crece sin límite.
#### Web (punto estrella)
Para esta parte, por una cuestión de hacerlo más interactivo y mostrar el punto estrella de la web, voy a mostrarlo desde la web. En el directorio `web/` está el código y un `README.md` que cuenta un poco cómo se hizo.

**Qué contar :**

- Timeline de eventos, filtros por operación, qué borrados se pueden recuperar, botón de restore, y la terminal de fat-fuse en vivo.
- **Arquitectura en una oración:** el server en Node ejecuta los mismos programas en C (`audit_reader --json` convierte el log a JSON, y `restore` hace la recuperación). La web no reimplementa nada.
- "**Parece** recuperable" es una estimación, porque la web solo ve el log, no la FAT. La decisión final siempre es de fat-fuse
  
**Hallazgos que valen la pena contar** (elegí uno si no hay tiempo):
- **El log puede pisar archivos borrados:** `events.bin` crece y toma clusters libres sin generar eventos. La web dice "parece recuperable", pero `restore` lo rechaza gracias al chequeo de la FAT.
- **Caché del kernel:** justo después de una operación, el kernel todavía cree que `events.bin` mide lo de antes, durante 1 segundo.
### Demo 1: restore exitoso (en la web)

```bash
fusermount -u mnt 2>/dev/null          
cp resources/fatfs.img disk.img        
cd web && npm start                    

# terminal 2 (desde la raíz del repo)
# --- demo 1: restore exitoso ---
yes C | head -c 3000 > mnt/c.txt
md5sum mnt/c.txt
rm mnt/c.txt
#   → en la web: Restaurar c.txt
md5sum mnt/c.txt                       # mismo hash

# --- demo 2: restore fallido (recién ahora) ---
echo hola > mnt/b.txt
rm mnt/b.txt
mkdir mnt/dir                          # justo después del rm
./restore mnt /b.txt                   # → Device or resource busy
```

y mostrá en el panel "Terminal de fat-fuse" de la web la línea de la colisión. Queda claro que quien decide es fat-fuse, no la página.  

