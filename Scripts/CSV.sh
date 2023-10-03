#!/bin/bash

# Nombre del archivo CSV
archivo="usuarios.csv"

# Comprobamos si el archivo ya existe o no
if [ ! -e "$archivo" ]; then
  # Si no existe, creamos el archivo con encabezados
  echo "Nombre,Edad,Correo" > "$archivo"
fi

# Solicitar información del usuario
echo "Ingrese el nombre del usuario:"
read nombre

echo "Ingrese la edad del usuario:"
read edad

echo "Ingrese el correo electrónico del usuario:"
read correo

# Agregar la información al archivo CSV
echo "$nombre,$edad,$correo" >> "$archivo"

echo "Información guardada en $archivo"

