#!/bin/bash

# EJERCICIO 1: Modelo del procesador
cat /proc/cpuinfo | grep "name" | head -n 1

# EJERCICIO 2: Número de unidades de ejecución (cores)
cat /proc/cpuinfo | grep "name" | wc -l

# EJERCICIO 3: Lista de nombres de usuarios para red social de superhéroes
curl -s https://raw.githubusercontent.com/dariomalchiodi/superhero-datascience/master/content/data/heroes.csv | cut -d ';' -f2 | tr 'A-Z' 'a-z' | sed -e 's/ /_/g' -e '1d' -e '/^$/d' > superheroes_usuarios.txt

# EJERCICIO 4A: Día de máxima temperatura en Córdoba
sort -k 5nr datos/weather_cordoba.in | head -n 1 | awk '{print $1,$2,$3}'

# EJERCICIO 4B: Día de mínima temperatura en Córdoba
sort -k 6n datos/weather_cordoba.in | head -n 1 | awk '{print $1, $2, $3}'

# EJERCICIO 5: Ordenar jugadores de tenis por ranking
sort -n -k 3 datos/wtaplayers.in

# EJERCICIO 6: Ordenar tabla de la Liga Profesional por puntos y diferencia de goles
awk '{print $0, $7-$8}' datos/lpf.in | sort -k2,2nr -k9,9nr

# EJERCICIO 7: MAC address de la interfaz de red del equipo
ip link show | grep -oE "([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}" | grep -v "00:00:00:00:00:00"

# EJERCICIO 8A: Crear la carpeta serie_prueba con los 10 archivos de subtítulos
mkdir serie_prueba
touch serie_prueba/fma_S01e{01..10}_es.srt

# EJERCICIO 8B: Renombrar los archivos sacando el sufijo _es
for i in {01..10}; do mv serie_prueba/fma_S01e${i}_es.srt serie_prueba/fma_S01e${i}.srt; done

# EJERCICIO 9A: Recortar video con ffmpeg
ffmpeg -i onepiece-skypea.mp4 -ss 00:00:05 -to 00:00:30 -c copy onepiece-skypea-cut.mp4

# EJERCICIO 9B: Mezclar audio con ffmpeg
ffmpeg -i luffy.mp3 -i sake-binks.mp3 -filter_complex amix=inputs=2:duration=first one-piece-weird.mp3