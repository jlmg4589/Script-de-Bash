#!/bin/bash

#Realiza un script que calcule el factorial de un número introducido por el usuario. Se
#debe comprobar que lo que introduce es un número y no contiene letras y otros
#caracteres que no sean los diez dígitos del sistema decimal.

echo "Este programa calcula el factorial de un número introducido por teclado."
read -p "Introduce el número del factorial: " factorial

i=${#factorial}

if [[ $factorial =~ ^[[:digit:]]+$ ]]; then
    
    i=$((factorial-1))
    factorial=$((factorial*1))

    until [ $i -eq 0 ]
    do
        factorial=$((factorial*i))
        ((i--))
    done

    echo "El factorial es: $factorial"

else

    echo "Datos no numéricos introducidos, debe introducir solo números"

fi


