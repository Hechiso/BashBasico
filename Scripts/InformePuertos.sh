#!/bin/bash

# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.

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

