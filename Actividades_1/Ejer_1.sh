#!/bin/bash

#Script que calcula el área de un triángulo, pasándole como argumento la base y la altura.

echo "Introduzca la altura (a) y la base (b) del triángulo en el (SI)"

read -p "Introduzca el valor de a:" a
read -p "Introduzca el valor de b:" b

area=$(echo "print($a*$b/2)" | python3)

echo "El área es:$area [m2]"
