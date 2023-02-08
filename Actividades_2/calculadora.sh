#!/bin/bash

valor_A=0
valor_B=0
resultado=0
num_menu=7

suma(){

    resultado=$(echo "print($valor_A+$valor_B)" | python3)

}

resta(){

    resultado=$(echo "print($valor_A-$valor_B)" | python3)

}

multiplicacion(){

    resultado=$(echo "print($valor_A*$valor_B)" | python3)

}

division(){

    if [ $valor_B -eq 0 ]; then
        resultado="Infinito"
    else
        resultado=$(echo "print(round($valor_A/$valor_B,2))" | python3)
    fi

}

raiz(){

signal=""

    if [ $valor_A -lt 0 ]; then
        signal="i"
    fi
    resultado="$(echo "import math; print(round(math.sqrt(abs($valor_A)),2))" | python3)$signal"

}

logaritmo(){

    if [ $valor_A -eq 0 ]; then
        resultado="Inválido"
    else
        resultado=$(echo "import numpy; print(round(numpy.log10($valor_A),2))" | python3)
    fi

}

imprimir_resultado(){

    echo "El resultado es: $resultado"

}


menu(){
    
echo "+------------------------+"
echo "| Calculadora IES Doñana |"
echo "+------------------------+"

echo "+------------------------+"
echo "|     Menú utilidades    |"
echo "|------------------------|"
echo "|Pulse uno de los numeros|"
echo "|                        |"
echo "|1- Sumar                |"
echo "|2- Restar               |"
echo "|3- Multiplicar          |"
echo "|4- Dividir              |"
echo "|5- Raíz Cuadrada        |"
echo "|6- Logarítmos           |"
echo "|7- Salir                |"
echo "+------------------------+"

read -p "Introduzca la operación a realizar: " num_menu 

}

introducir_valor(){

    if [[ $num_menu -ge 1 ]] && [[ $num_menu -le 4 ]] 
    then
        read -p "Introduzca el primer valor: " valor_A
        read -p "Introduzca el segundo valor: " valor_B
    elif [ $num_menu -lt 7 ]
    then
        read -p "Introduzca el valor: " valor_A
    fi

}

comprobar_operacion(){


if [ $num_menu -eq 1 ]; then
    suma
elif [ $num_menu -eq 2 ]; then
    resta
elif [ $num_menu -eq 3 ]; then
    multiplicacion
elif [ $num_menu -eq 4 ]; then
    division
elif [ $num_menu -eq 5 ]; then
    raiz
elif [ $num_menu -eq 6 ]; then
    logaritmo
elif [ $num_menu -eq 7 ]; then
    salir
else
    menu
fi

}

salir(){
    echo ""
    echo "--------------------------------------------"
    echo ""
    read -p "Desea salir de la aplicación (S/N): " eleccion
    echo ""
    
    if [ ${eleccion^} == "S" ]
    then
        echo "--------------------------------------------"
        echo ""
        echo "Encantado de haberte ayudado, hasta pronto!!"
        echo ""
        echo "--------------------------------------------"
        echo ""
        exit 0
    else
        echo ""
        echo "--------------------------------------------"
        echo ""
        main
    fi
}

main(){
    # Llamada al menú
    menu
    # Llamada a la función de validar entrada de datos
    introducir_valor
    # Llamada introducir valor
    comprobar_operacion
    # Llamada a la función de mostrar resultado
    imprimir_resultado
    # Comprobar si quiere continuar
    salir
}

main