#!/bin/bash

#Escribir un programa que pida al usuario un número entero y muestre por pantalla un
#triángulo rectángulo como el de más abajo, de altura el número introducido.

read -p "Introduce el número de filas a representar: " filas

if [[ $filas =~ ^[0-9]+$ ]]; then
    until [ $filas -eq 0 ]
    do
        asteriscos="$asteriscos *"
        echo "$asteriscos"
        ((filas--))
    done
    exit
fi

echo "Debe introducir solo caracteres numéricos."