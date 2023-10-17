#!/bin/bash

# Compilar 
g++ -o miPrograma main.cpp 

# Verificar si la compilación fue exitosa
if [ $? -eq 0 ]; then
    echo "Compilación exitosa. Ejecuta el programa con './miPrograma'."
else
    echo "Error durante la compilación."
fi

