#!/bin/bash

# Nombre del archivo de informe
report_file="informe_de_puertos.txt"

# Fecha y hora actual
current_date=$(date +"%Y-%m-%d %H:%M:%S")

# Encabezado del informe
echo "Informe de Puertos en Escucha - $current_date" > "$report_file"
echo "" >> "$report_file"

# Puertos TCP en escucha
echo "Puertos TCP en Escucha:" >> "$report_file"
echo "------------------------" >> "$report_file"
ss -tuln | grep 'LISTEN' | grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{1,5} .*" >> "$report_file"
echo "" >> "$report_file"

# Puertos UDP en escucha
echo "Puertos UDP en Escucha:" >> "$report_file"
echo "------------------------" >> "$report_file"
ss -uln | grep 'UNCONN' | grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{1,5} .*" >> "$report_file"
echo "" >> "$report_file"

echo "Informe generado en $report_file."

