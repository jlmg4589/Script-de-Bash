#!/bin/bash

# Calcula el valor de la aceleración normal, introduciendo la velocidad angular (rad/s) y el radio "R" en (m)

read -p "Introduce la velocidad angular [rad/s]: " velocidad_angular
read -p "Introduce el radio R [m]: " radio

echo "La aceleración angula = $((velocidad_angular**2*radio)) [rad*m/s]"
