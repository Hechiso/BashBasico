#!/bin/bash

archivo="monitoreo.txt"  


# Se compueba si el tamaño llego al limite programado
if [[ "$tamano" < 100000 ]]; then

	echo "el archivo $archivo llego a 1 gb de informacion."

		while IFS= read -r linea; do
    			if echo "$linea" | grep -q "$palabra"; then
        		hora=$(echo "$linea" | awk '{print $8}' | cut -d ' ' -f 1)
    			fi

    			if echo "$linea" | grep -q "Uso de la CPU:"; then
        		Uso_cpu=$(echo "$linea" | awk '{print $5}' | cut -d ' ' -f 1 | sed 's/%//')
        		echo "Uso de la CPU sin %: $Uso_cpu"
        
        			if [[ "$Uso_cpu" > "$UsocpuMaximo" ]]; then
            			UsocpuMaximo="$Uso_cpu"
            			horaMaxima="$hora"
            			echo "El uso máximo de CPU: $UsocpuMaximo %"
        			fi
    			fi
		done < "$archivo"


else
    echo "El archivo $archivo no ha llegado al limite."
fi



echo "=============== Informe sobre Comsumo Cpu =============="
echo "Archivo de trabajo : $archivo "


# este es el fin del script

