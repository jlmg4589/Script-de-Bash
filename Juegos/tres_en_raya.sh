#!/bin/bash

turno=1
tablero=("" "" "" "" "" "" "" "" "")
indice=0

menu(){
	echo ""
	echo ""
	echo "Bienvenido al TRES EN RAYA."
	printf "***************************\n"
	printf "Jugador 1: fichas X\n"
	printf "Jugador 2: fichas 0\n"
	printf "***************************\n"
}

select_turno(){
	read -p "Jugador $turno, introduce la celda donde desea poner la ficha: " n_celda
	if [[ $turno -eq 1 ]]
	then
		validar_dato $n_celda
		if [[ $? -eq 0 ]]; then
			tablero[$((n_celda-1))]="X"
			comprobar_partida "X" $turno
			if [[ $? -eq 1 ]]
			then
				indice=8
			fi
			indice=$(($indice+1))
			turno=2
		fi
	else
		validar_dato $n_celda
		if [[ $? -eq 0 ]]; then
			tablero[$((n_celda-1))]="O"
			comprobar_partida "O" $turno
			if [[ $? -eq 1 ]]
			then
				indice=8
			fi
			turno=1
			indice=$(($indice+1))
		fi
	fi
}

comprobar_partida(){

	if [[ ${tablero[0]} == $1 ]] && [[ ${tablero[1]} == $1 ]] && [[ ${tablero[2]} == $1 ]]
	then
		echo ""
		echo "El jugador $2 ha ganado. Enhorabuena!!!"
		return 1
	elif [[ ${tablero[3]} == $1 ]] && [[ ${tablero[4]} == $1 ]] && [[ ${tablero[5]} == $1 ]]
	then
		echo ""
		echo "El jugador $2 ha ganado. Enhorabuena!!!"
		return 1
	elif [[ ${tablero[6]} == $1 ]] && [[ ${tablero[7]} == $1 ]] && [[ ${tablero[8]} == $1 ]]
	then
		echo ""
		echo "El jugador $2 ha ganado. Enhorabuena!!!"
		return 1
	elif [[ ${tablero[0]} == $1 ]] && [[ ${tablero[3]} == $1 ]] && [[ ${tablero[6]} == $1 ]]
	then
		echo ""
		echo "El jugador $2 ha ganado. Enhorabuena!!!"
		return 1
	elif [[ ${tablero[1]} == $1 ]] && [[ ${tablero[4]} == $1 ]] && [[ ${tablero[7]} == $1 ]]
	then
		echo ""
		echo "El jugador $2 ha ganado. Enhorabuena!!!"
		return 1
	elif [[ ${tablero[2]} == $1 ]] && [[ ${tablero[5]} == $1 ]] && [[ ${tablero[8]} == $1 ]]
	then
		echo ""
		echo "El jugador $2 ha ganado. Enhorabuena!!!"
		return 1
	elif [[ ${tablero[0]} == $1 ]] && [[ ${tablero[4]} == $1 ]] && [[ ${tablero[8]} == $1 ]]
	then
		echo ""
		echo "El jugador $2 ha ganado. Enhorabuena!!!"
		return 1
	elif [[ ${tablero[2]} == $1 ]] && [[ ${tablero[4]} == $1 ]] && [[ ${tablero[6]} == $1 ]]
	then
		echo ""
		echo "El jugador $2 ha ganado. Enhorabuena!!!"
		return 1
	fi
	
	if [[ $indice -eq 8 ]]
	then
		echo ""
		echo "Partida empatada. Bien jugado!!!"
		return 1
	fi
}

validar_dato(){
	if [[ ! $1 =~ ^[1-9]{1}$ ]]
	then
		echo "Vuelva a introducir un número dentro del rango (0-9)."
		return 1
	elif [[ ${tablero[$(($1-1))]} != "" ]]
	then
		echo "Celda ocupada, elija otra celda para poner su ficha."
		return 2
	fi
	return 0
}

imprimir_tablero(){	
	printf "+---------+---------+---------+\n"
	printf "|1)       |2)       |3)       |\n"
	
	printf "|%5s    " ${tablero[0]}
	printf "|%5s    " ${tablero[1]}
	printf "|%5s    |\n" ${tablero[2]}
	
	printf "|         |         |         |\n"
	printf "+---------+---------+---------+\n"
	printf "|4)       |5)       |6)       |\n"
	
	printf "|%5s    " ${tablero[3]}
	printf "|%5s    " ${tablero[4]}
	printf "|%5s    |\n" ${tablero[5]}
	
	printf "|         |         |         |\n"	
	printf "+---------+---------+---------+\n"
	printf "|7)       |8)       |9)       |\n"
	
	printf "|%5s    " ${tablero[6]}
	printf "|%5s    " ${tablero[7]}
	printf "|%5s    |\n" ${tablero[8]}
	
	printf "|         |         |         |\n"	
	printf "+---------+---------+---------+\n"
}


while [[ $indice -lt ${#tablero[@]} ]]
do
	menu
	imprimir_tablero
	select_turno
	if [[ $indice -eq 9 ]]
	then
		echo ""
		echo "FIN DE LA PARTIDA, RESULTADO DEL TABLERO"
		imprimir_tablero
		read -p "¿Otra Partida? (S/N): " partida
		if [[ $partida =~ ^[Ss]{1}$ ]]
		then
			turno=1
			tablero=("" "" "" "" "" "" "" "" "")
			indice=0
		fi
	fi
done
