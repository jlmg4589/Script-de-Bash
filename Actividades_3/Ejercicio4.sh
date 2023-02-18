#!/bin/bash

#Escribir un programa que pida al usuario un número entero y muestre por pantalla un
#triángulo rectángulo como el de más abajo.

read -p "Introduce el valor de filas: " filas

if [[ $filas =~ ^[0-9]+$ ]]; then
    numero=1
    until [ $filas -eq 0 ]
    do
        cadena="$numero $cadena"
        echo "$cadena"
        numero=$((numero+2))
        ((filas--))
    done
    exit
fi

echo "Debe introducir únicamente números."