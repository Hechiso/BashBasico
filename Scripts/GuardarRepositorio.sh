#!/bin/bash

# Se procesa el contenido de la carpeta actual
#ls -d */ | sed 's#/##' | tr '\n' ' ' > lista_directorios.txt

# Se crea el archivo tar usando la lista de directorios desde el archivo
tar -cvzf repositorios.tar.gz -T listaRepositorios.txt

# Verificación del éxito de la operación
if [ $? -eq 0 ]; then
    echo "Los repositorios se comprimieron exitosamente."
else
    echo "Hubo un problema al comprimir los repositorios."
fi


