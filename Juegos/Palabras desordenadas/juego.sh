#!/bin/bash

palabras=$(wc -l facil.txt | cut -d ' ' -f 1) #Escogemos el primer elemento de su respuesta, ya que el segundo es el nombre del archivo.
palabra=""

elegir_palabra(){
    if [[ $palabras -gt ${#lista_elementos[@]} ]]
    then
        lock=0
        while [[ $lock -eq 0 ]]
        do
            elemento="$(($RANDOM%$palabras +1))"
            indice=0
            lock=1
            while [[ $indice -lt ${#lista_elementos[@]} ]]
            do
                if [[ "${lista_elementos[$indice]}" == "$elemento" ]]
                then
                    lock=0
                fi
                indice=$(($indice+1))
            done
        done
        
        lista_elementos[${#lista_elementos[@]}]=$elemento    # Añade el elemento a la lista para no repetirlo
        palabra=$(head -$elemento facil.txt | tail -1)
        return 1
    else
        return 0
    fi

}

palabra_desordenada=""
desordenar_palabra(){
    lista_caraceteres=""
    until [[ ${#palabra_desordenada} -ge ${#palabra} ]]
    do
        lock=0
        while [[ $lock -eq 0 ]]
        do
            caracter="$(($RANDOM%${#palabra}))"
            indice=0
            lock=1
            while [[ $indice -lt ${#lista_caraceteres[@]} ]]
            do
                if [[ "${lista_caraceteres[$indice]}" == "$caracter" ]]
                then
                    if [[ ${#palabra_desordenada} -lt ${#palabra} ]]; then
                        lock=0
                    fi
                fi
                indice=$(($indice+1))
            done
        done
        lista_caraceteres[${#lista_caraceteres[@]}]=$caracter
        palabra_desordenada="$palabra_desordenada${palabra:$caracter:1}"
    done
    unset lista_caraceteres
}

menu(){
    
    echo "Bienvenido al Juego de las PALABRAS DESORDENADAS"
    echo "A continación se mostrará una palabra desordenada y tiene tres intentos para acertarla."
    salir="S"
    while [[ $salir =~ ^[Ss]{1}$ ]]
    do
        elegir_palabra
        if [[ $? -eq 1 ]]
        then
            palabra_desordenada=""
            desordenar_palabra
            echo "La palabra desordenada es: $palabra_desordenada"
            read -p "Indique la palabra: " respuesta
            if [[ "$respuesta" == "$palabra" ]]
            then
                echo "Enhorabuena, ha acertado"
            else
                echo "Ha fallado, le quedan 2 intentos."
                read -p "Indique la palabra: " respuesta
                if [[ "$respuesta" == "$palabra" ]]
                then
                    echo "Enhorabuena, ha acertado"
                else
                    echo "Ha fallado, le quedan 1 intentos."
                    read -p "Indique la palabra: " respuesta
                    if [[ "$respuesta" == "$palabra" ]]
                    then
                        echo "Enhorabuena, ha acertado"
                    else
                        echo "Ha fallado, el juego ha terminado."
                        echo "La palabra desordenada era: $palabra"
                    fi
                fi
            fi

            read -p "¿Desea seguir jugando? (S/N): " salir
        else
        echo "**********************************************"
        echo "*HAS ACERTADO TODAS LAS PALABRAS, ENHORABUENA*"
        echo "*              FIN DEL JUEGO                 *"
        echo "**********************************************"
        salir="N"
        fi
    done
}

menu