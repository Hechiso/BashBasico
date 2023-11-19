#!/bin/bash

# Verificar si el archivo existe
if [ -e "listaRepositorios.txt" ]; then
    # Abrir el archivo para lectura
    while IFS= read -r linea || [[ -n "$linea" ]]; do
        # clona el repositorio
	git clone git@github.com:Hechiso/"$linea"
    done < "listaRepositorios.txt"
else
    echo "El archivo 'listaRepositorios.txt' no existe."
fi

