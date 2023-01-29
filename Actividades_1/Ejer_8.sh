#!/bin/bash

# Calcula el peso de una pieza de hierro de forma cónica

declare densidad=7.86 # [g/cm3]

echo "Introduce los datos para calcular el volumen del tronco del cono"
read -p "Radio a: " a
read -p "Radio b: " b
read -p "Altura h: " h


echo "El peso de la pieza es: $(echo "import math; print($densidad*math.pi*$h*($a*2+$a*$b+$b*2)/3)" | python3)"


