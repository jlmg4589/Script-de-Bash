#!/bin/bash

# Juego de Piedra, Papel y Tijera.

eleccion_maquina(){
    selec_maquina=$(($RANDOM%3+1))
    echo ""
    echo "VERSUS"
    echo ""
    echo "Elección de la máquina:"
    dibujar $selec_maquina
}

eleccion_usuario(){
    selec_user=0
    until [[ $selec_user =~ ^[123]{1}$ ]]
    do
        if [[ $selec_user -ne 0 ]]
        then
            clear
            echo "+-------------------------------------------------+"
            echo "| Debe introducir un valor dentro del rango [1-3] |"
            echo "+-------------------------------------------------+"
            echo ""
        fi
        echo "+---------------------+"
        echo "| Indique su elección |"
        echo "+---------------------+"
        echo "|1- Piedra            |"
        echo "|2- Papel             |"
        echo "|3- Tijera            |"
        echo "+---------------------+"
        read -p "Introduzca su elección: " selec_user
    done
    echo "Elección del usuairio:"
    dibujar $selec_user
}

dibujar(){
    case $1 in 
        1) 
            piedra
            ;;
        2) 
            papel
            ;;
        3) 
            tijera
            ;;
        *) 
            echo "Error Inesperado."
            exit
            ;;
        esac
}

comprobar_partida(){
    echo ""
    if [[ $selec_maquina -eq $selec_user ]]; then
        echo "¡¡¡ EMPATE !!!"
    elif [[ $selec_maquina -eq 1 ]] && [[ $selec_user -eq 3 ]]; then
        echo "¡¡¡ PERDISTE !!!"
    elif [[ $selec_maquina -eq 2 ]] && [[ $selec_user -eq 1 ]]; then
        echo "¡¡¡ PERDISTE !!!"
    elif [[ $selec_maquina -eq 3 ]] && [[ $selec_user -eq 2 ]]; then
        echo "¡¡¡ PERDISTE !!!"
    else
        echo "¡¡¡ ENHORABIENA, HAS GANADO !!!"
    fi
}

piedra(){
    printf "
        _______
    ---'   ____)
        (_____)
        (_____)
        (____)
    ---.__(___)
    "
}

papel(){
    printf "
        _______
    ---'    ____)____
            ______)
            _______)
            _______)
    ---.__________)
    "
}

tijera(){
    printf "
        _______
    ---'   ____)____
            ______)
        __________)
        (____)
    ---.__(___)
    "
}

main(){
    until [[ $salir == [Ss] ]]
    do
        clear
        eleccion_usuario
        eleccion_maquina
        comprobar_partida
        read -p "¿Desea salir del juego? (S/N) -> " salir
    done
}

main