#!/bin/bash


# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.


#Se inicia el bucle
while true; do

#----------------------------------------------------------------------------------------------------------------------------------------------

# Obtener la fecha y hora actual
fecha_hora=$(date +"%Y-%m-%d %H:%M:%S")

# Archivo de destino
archivo_txt="infoDivisas.txt"

# Agregar la fecha y hora al archivo
echo "Fecha y hora: $fecha_hora" >> "$archivo_txt"

# Agregar más contenido al archivo si es necesario
echo "=====================" >> "$archivo_txt"


# Se obtienen los datos del precio del dólar
curl -s https://www.eldolar.info/es-MX/mexico/dia/hoy | grep -o '<span class="xTimes">[^<]*</span>' | sed 's/<[^>]*>//g' > infodolar.txt

# Se escribe un mensaje de confirmación
echo "Se obtuvieron los datos acerca del dólar"

# Nombre del archivo de entrada y salida
archivo_entrada="infodolar.txt"
archivo_salida="infodolar_modificado.txt"

# Contador de línea
numero_linea=0


#----------------------------------------------------------------------------------------------------------------------------------------------

# Leer el archivo de entrada línea por línea y modificar el contenido
while IFS= read -r linea
do
    # Incrementar el contador de línea
    ((numero_linea++))

    # Agregar el texto correspondiente a cada línea
    case "$numero_linea" in
        1) echo "$linea dolar" ;;
        2) echo "$linea Precio Actual" ;;
        3) echo "$linea Precio Compra" ;;
        4) echo "$linea Precio Venta" ;;
    esac
done < "$archivo_entrada" > "$archivo_salida"

cat "$archivo_salida" >> infoDivisas.txt

cat "$archivo_salida"


#----------------------------------------------------------------------------------------------------------------------------------------------


sleep 10

#----------------------------------------------------------------------------------------------------------------------------------------------


./metadatosDivisas.sh

done
