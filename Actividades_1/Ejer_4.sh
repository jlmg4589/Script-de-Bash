#!/bin/bash

#Se le pasan 3 medidas, 1ª en mm, 2ª en cm y 3ª en m

read -p "Introduce la medida de mm: " milimetros
read -p "Introduce la medida de cm: " centimetros
read -p "Introduce la medida de m: " metros

# resultado=$((milimetros/10+centimetros+metros*100))	# Este es el resultado entero utilizando Bash
resultado=$(echo "print($milimetros/10+$centimetros+$metros*100)" | python3)	# Este es el resultado real utilizando Python3

echo "El resultado en [cm] es: $resultado" 
