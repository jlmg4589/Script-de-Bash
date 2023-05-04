#!/bin/bash

# Función que compara caracter a caracter, sólo teniendo en cuenta el índice.

ahorcado1(){
    palabra="HOLA"
    salida=""
    prueba="PRUEBA"
    for ((i=0;i<${#palabra};i++))
    do
        if [[ "${1:$i:1}" == "${palabra:$i:1}" ]]
        then
            salida=$salida"${palabra:$i:1}"
        else
            salida=$salida"_"
        fi
    done

}


# Por cada letra de la palabra a buscar, lo compara con todas las letras de la propuesta.
ahorcado2(){
    palabra="HOLA"
    salida=""
    for ((i=0;i<${#palabra};i++))
    do
        salida=$salida"_"
        for ((j=0;j<${#1};j++))
        do
            if [[ "${1:$j:1}" == "${palabra:$i:1}" ]]
            then
                salida=${salida:0:$((${#salida}-1))}"${palabra:$i:1}"
            fi
        done
    done
}

ahorcado1 $1
echo "$salida"
ahorcado2 $1
echo "$salida"
