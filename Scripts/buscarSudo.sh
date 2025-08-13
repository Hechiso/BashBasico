#!/bin/bash

# Solicitar al usuario el nombre del archivo y la palabra a buscar
archivo=/var/log/auth.log
palabra_a_buscar="pam_unix(sudo:auth):"

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
  echo "El archivo $archivo no existe."
  exit 1
fi

# Buscar y mostrar las líneas que contienen la palabra
cat "$archivo" | tr -cd '\11\12\15\40-\176' | grep "$palabra_a_buscar"


