#!/bin/bash

# Realizar un programa que calcule muestre por pantalla el triángulo de Tartaglia hasta
#la posición deseada.

asterisco="*"
espacio=" "

read -p "Introduce el número de filas a representar: " filas

if [[ $filas =~ ^[0-9]+$ ]]; then
    f=$filas
    until [ $f -eq 0 ]
    do
        cadena=""
        num_espacios=$filas
        num_asteriscos=$((filas-f+1))
        while [ $num_espacios -gt 0 ]
        do
            if [[ $num_asteriscos -gt 0 ]]; then
                cadena="$asterisco$cadena"
                ((num_asteriscos--))
            fi
            cadena="$espacio$cadena"
            ((num_espacios--))
        done
        ((f--))
        echo "$cadena"
    done
    f=$filas
    until [ $f -eq 0 ]
    do
        cadena=""
        num_espacios=$filas
        num_asteriscos=$((f-1))
        while [ $num_espacios -gt 0 ]
        do
            if [[ $num_asteriscos -gt 0 ]]; then
                cadena="$asterisco$cadena"
                ((num_asteriscos--))
            fi
            cadena="$espacio$cadena"
            ((num_espacios--))
        done
        ((f--))
        echo "$cadena"
    done
fi