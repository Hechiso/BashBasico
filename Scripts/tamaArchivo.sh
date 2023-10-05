#!/bin/bash

archivo="Ejemplo.txt"  
tamano=$(stat -c %s "$archivo")

echo "=============== Tamaño del archivo =============="
echo "El archivo $archivo tiene un tamaño de: $tamano bytes"

# Se crea una variable para ajustar la informacion obtenida del archivo y presentarla al usuario
    tamano_legible=$(echo "scale=1; $tamano / 1000" | bc)
    echo "${tamano_legible} Kilobytes"

# Se compueba si el tamaño llego al limite programado
if [[ "$tamano" < 100000 ]]; then
	echo "el archivo $archivo llego a 1 gb de informacion."
	echo "$tamano"
else
    echo "El archivo $archivo no ha llegado al limite."
fi

# este es el fin del script


