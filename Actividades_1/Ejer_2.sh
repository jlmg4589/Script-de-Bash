#!/bin/bash

# Calcula la imagen del polinomio de segundo grado.

# Límpia la pantalla.
clear

echo "El siguiente programa calcula el valor la imagen del siguiente polinomio."
echo "-------------------------------------------------------------------------"
echo " 			 	   y=ax²+bx+c			      	       "
echo "-------------------------------------------------------------------------"

read -p "Introduce el valor de a: " a
read -p "Introduce el valor de b: " b
read -p "Introduce el valor de c: " c
read -p "Introduce el valor de x: " x

y=$(echo "print(($a*pow($x,2))+($b*$x)+$c)" | python3)

echo "El resultado del polinomio es: $y"
