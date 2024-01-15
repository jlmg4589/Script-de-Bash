#!/bin/bash

# Hacer un script que reciba como entrada un PATH y que devuelva un resumen de los archivos que
# hay en el directorio que se esté analizando, indicando la cantidad de cada tipo de archivo y 
# el porcentaje de cada uno (caracter, dispositivo, enlaces simbólicos, archivos regulares, directorios).
# Por otro lado también debe indicar el número de archivos ocultos y visibles con los porcentajes.

contar_archivos(){
    caracter=$(ls -la $1 | grep ^c | wc -l)
    bloque=$(ls -la $1 | grep ^b | wc -l)
    enlace=$(ls -la $1 | grep ^l | wc -l)
    regular=$(ls -la $1 | grep ^- | wc -l)
    directorio=$(ls -la $1 | grep ^d | wc -l)
    total=$(ls -la $1 | wc -l)
    oculto=$(find $1 -maxdepth 1 -name ".*" | wc -l)
    visible=$((total-oculto))
    desconocido=$((total-(caracter+bloque+enlace+regular+directorio+1)))
}

mostrar_pantalla(){
    echo "--------------------------------------------------------------"
    echo "Directorio: \"$1\""
    echo "---------------------- RESUMEN DE DATOS ----------------------"
    echo "El número de carácteres son: $caracter ($por_car [%])"
    echo "El número de dispositivos son: $bloque ($por_blq [%])"
    echo "El número de enlaces simbólicos son: $enlace ($por_enl [%])"
    echo "El número de archivos regulares son: $regular ($por_reg [%])"
    echo "El número de directorios son: $directorio ($por_dir [%])"
    echo "El número de archivos desconocidos: $desconocido ($por_des [%])"
    echo "El número total de archivos son: $total"
    echo "---------------------------------------------------------------"
    echo "Archivos visibles: $visible ($por_vis [%])"
    echo "Archivos ocultos: $oculto ($por_ocu [%])"
}

porcentajes(){
    por_car=$(echo 'print("{:.2f}"'".format($caracter*100/$total))" | python3)
    por_blq=$(echo 'print("{:.2f}"'".format($bloque*100/$total))" | python3)
    por_enl=$(echo 'print("{:.2f}"'".format($enlace*100/$total))" | python3)
    por_reg=$(echo 'print("{:.2f}"'".format($regular*100/$total))" | python3)
    por_dir=$(echo 'print("{:.2f}"'".format($directorio*100/$total))" | python3)
    por_des=$(echo 'print("{:.2f}"'".format($desconocido*100/$total))" | python3)
    por_ocu=$(echo 'print("{:.2f}"'".format($oculto*100/$total))" | python3)
    por_vis=$(echo 'print("{:.2f}"'".format($visible*100/$total))" | python3)
}

until [[ $continuar == [nN] ]]
do
    local path
    read -p "Introduce el path que desea analizar: " path
    contar_archivos $path
    porcentajes
    mostrar_pantalla $path
    read -p "¿Desea comprobar otro path? (S/N): " continuar
done