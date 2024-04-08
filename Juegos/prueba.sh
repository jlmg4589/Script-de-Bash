#!/bin/bash

piedra=()
piedra[0]="        _______     "
piedra[1]="    ---'   ____)    "
piedra[2]="        (_____)     "
piedra[3]="        (_____)     "
piedra[4]="        (____)      "
piedra[5]="    ---.__(___)     "

papel=()
papel[0]="        _______      "
papel[1]="    ---'    ____)____"
papel[2]="            ______)  "
papel[3]="            _______) "
papel[4]="            _______) "
papel[5]="    ---.__________)  "

tijera=()
tijera[0]="        ______      "
tijera[1]="    ---'   ____)____"
tijera[2]="            ______) "
tijera[3]="        __________) "
tijera[4]="        (____)      "
tijera[5]="    ---.__(___)     "

filas=6

imprimir_filas(){
    elementos=("$@")
    for ((i = 0; i < $filas; i++)); do
        j=0
        while [[ j -lt ${#elementos[@]} ]]
        do
            printf "${elementos[((i+j))]}"
            j=$((j+filas))
        done
        echo
    done
}

columnas=3

formar_filas(){
    local i=0
    vector=()
    while [[ i -lt columnas ]]; do
        if [[ i -eq $1 ]]; then
            vector=("${vector[@]}" "${piedra[@]}")
        else
            vector=("${vector[@]}" "${papel[@]}")
        fi
        ((i++))
    done
}

read -p "¿Dónde quieres poner la piedra?: " posicion
formar_filas $((posicion-1))

imprimir_filas "${vector[@]}"