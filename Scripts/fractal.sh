#!/bin/bash

# Tamaño de la cuadrícula
WIDTH=80
HEIGHT=40

# Rango y límites
xmin=-2
xmax=2
ymin=-2
ymax=2

# Iteraciones máximas y umbral de escape
MAX_ITER=50
THRESHOLD=4

# Bucle para cada fila
for ((row=1; row<=HEIGHT; row++)); do
    # Calcula la parte imaginaria correspondiente al valor y
    y=$(echo "scale=2; $ymin + ($ymax - $ymin) * $row / $HEIGHT" | bc)
    
    # Bucle para cada columna
    for ((col=1; col<=WIDTH; col++)); do
        # Calcula la parte real correspondiente al valor x
        x=$(echo "scale=2; $xmin + ($xmax - $xmin) * $col / $WIDTH" | bc)
        
        # Inicializa z
        real=0
        imag=0
        
        # Itera
        for ((i=0; i<MAX_ITER; i++)); do
            # Z = Z^2 + C
            temp_real=$real
            real=$(echo "scale=2; $real * $real - $imag * $imag + $x" | bc)
            imag=$(echo "scale=2; 2 * $temp_real * $imag + $y" | bc)

            # Comprueba el umbral de escape
            if [ $(echo "$real * $real + $imag * $imag > $THRESHOLD" | bc) -eq 1 ]; then
                break
            fi
        done

        # Determina el carácter en función de las iteraciones
        if [ $i == $MAX_ITER ]; then
            echo -n " "
        else
            echo -n "*"
        fi
    done
    echo
done

