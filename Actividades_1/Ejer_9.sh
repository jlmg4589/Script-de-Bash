#!/bin/bash

# Calcula el valor de coordenadas polaras, introduciendo las coordenadas cartesianas.

read -p "Introduce el valor de X: " x
read -p "Introduce el valor de Y: " y

echo "El valor del módulo R: $(echo "import math; print(math.sqrt(pow($x,2)+pow($y,2)))" | python3)"
echo "El valor del ángulo Theta: $(echo "import math; print(math.atan2($y,$x)*180/math.pi)" | python3)"
