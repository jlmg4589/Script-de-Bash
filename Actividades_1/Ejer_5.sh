#!/bin/bash

# Calcula el número de picos y de patas a un número de gallinas y de cerdos introducidos por pantalla.

read -p "Introduce el número de gallinas: " gallinas
read -p "Introduce el número de cerdos: " cerdos

echo "Número de cabezas: $((cerdos+gallinas))"
echo "Número de patas: $((cerdos*4+gallinas*2))"
