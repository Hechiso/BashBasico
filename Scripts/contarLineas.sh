#!/bin/bash

# Nombre del archivo
file_name="archivo.txt"

# Verifica si el archivo existe
if [ ! -f "$file_name" ]; then
  echo "El archivo $file_name no existe."
  exit 1
fi

# Cuenta las líneas del archivo y muestra el resultado
line_count=$(wc -l < "$file_name")
echo "El archivo $file_name tiene $line_count líneas."

