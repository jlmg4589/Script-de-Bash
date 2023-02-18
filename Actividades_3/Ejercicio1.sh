#!/bin/bash

# Este script calcula la letra del DNI, según el número del mismo.

# Creamos la secuencia de letras.
LetraDNI=(T R W A G M Y F P D X B N J Z S Q V H L C K E)


# Definimos la validación de DNI (0=OK, 1=Error)
validacion(){
    len=${#1}

    if [ $len -eq 8 ]; then
        for i in {1..8}
        do
            if [[ ${1:i-1:1} != [0-9] ]]; then
                return 2
            fi
        done
        return 0
    fi
    return 1
}

validacion_reg(){
    if [[ $1 =~ ^[0-9]{8}$ ]]; then
        return 0
    elif [[ ${#1} -le 7 || ${#1} -ge 9  ]]; then
        return 1
    else
        return 2
    fi
}



# Informamos al usuario.
echo "Este script le va a consultar el número del DNI, para poder determinar su letra."
read -p "Introduzca el número del DNI: " dni


# Obtenemos el resto de 23
resto=$((dni%23))
# Validamos el DNI y almacenamos el valor de la operación para comparar.
validacion $dni
valDNI=$?


# Tratamos el valor devuelto por la función de validación e imprimimos según el resultado
echo ""
echo "***********RESULTADO***************"
echo ""
if [ $valDNI == 0 ]; then
    echo "La letra correspondiente para el DNI introducido es: ${LetraDNI[$resto]}"
    echo "DNI: $dni${LetraDNI[resto]}"
elif [ $valDNI == 1 ]; then
    echo "DNI incorrecto, el número de caracteres es ${#dni} y ha de ser 8."
elif [ $valDNI == 2 ]; then
    echo "DNI incorrecto, el DNI introducido contiene caracteres no numéricos."
fi
