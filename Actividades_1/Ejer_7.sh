#!/bin/bash

# Convierte los grados Celsius a Fahrenheit.

read -p "Introduce los grados en Celsius: " celsius

Fahrenheit=$(echo "print($celsius*9/5+32)" | python3)

echo "$celsius [ºC] son: $Fahrenheit [ºF]"
