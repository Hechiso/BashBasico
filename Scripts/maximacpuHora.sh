#!/bin/bash

# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.


palabra="Fecha"  # Reemplaza con la palabra que deseas buscar
palabracpu="CPU"

archivo="monitoreo.txt"  # Reemplaza con el nombre de tu archivo
horaMaxima="00:00:00"  # Inicializa con una hora mínima
hora="00:00:00"
Usocpu="100.00"
UsocpuMaximo="100.00"

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

echo "Registro de la hora de mayor Consumo de CPU : $horaMaxima"
echo "El uso máximo de la CPU fue de: $UsocpuMaximo %"

