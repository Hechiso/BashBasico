#!/bin/bash

# Nombre del archivo de entrada
archivo_entrada="infoDivisas.txt"

# Nombre del archivo de salida CSV
archivo_salida="output.csv"

# Comprobamos si el archivo de entrada existe
if [ ! -f "$archivo_entrada" ]; then
  echo "El archivo de entrada $archivo_entrada no existe."
  exit 1
fi

# Eliminamos el archivo de salida si ya existe
if [ -f "$archivo_salida" ]; then
  rm "$archivo_salida"
fi

# Inicializamos las variables para almacenar los valores
fecha=""
hora=""
actual=""
compra=""
venta=""

# Iteramos a través del archivo de entrada y convertimos los datos en CSV
while IFS= read -r linea; do
  if [[ "$linea" == "Fecha"* ]]; then
    fecha=$(echo "$linea" | cut -d' ' -f2)
  elif [[ "$linea" == "Hora"* ]]; then
    hora=$(echo "$linea" | cut -d' ' -f2)
  elif [[ "$linea" == "Actual"* ]]; then
    actual=$(echo "$linea" | cut -d' ' -f2)
  elif [[ "$linea" == "Compra"* ]]; then
    compra=$(echo "$linea" | cut -d' ' -f2)
  elif [[ "$linea" == "Venta"* ]]; then
    venta=$(echo "$linea" | cut -d' ' -f2)
    # Escribimos los datos en el archivo CSV
    if [ -n "$fecha" ]; then
      echo "$fecha,$hora,$actual,$compra,$venta" >> "$archivo_salida"
    fi
  fi
done < "$archivo_entrada"

echo "Archivo CSV creado: $archivo_salida"

#./baseDivisas.sh

echo "Se creo base de datos exitosamente"
