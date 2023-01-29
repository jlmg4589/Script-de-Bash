#!/bin/bash

# Este programa convierte un número de segundos en formato HH:MM:SS

echo "Introduzca el número de segundos que desea convertir en el formato: HH:MM:SS"

read -p "Introduzca el número de segundos: " segundos

horas_calc=$((segundos/60**2))
minutos_calc=$(((segundos%60**2)/60))
segundos_calc=$(((segundos%60**2)%60))

echo "$segundos [segundos] = $horas_calc:$minutos_calc:$segundos_calc"
