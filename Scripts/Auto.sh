#!/bin/bash

# Solicitar al usuario los puertos a escanear
read -p "Ingrese los puertos a escanear separados por espacios: " PUERTOS

# Solicitar al usuario los segundos para la próxima ejecución
read -p "Ingrese la cantidad de segundos antes de la siguiente ejecución: " SEGUNDOS


# Solicitar al usuario la ruta del archivo de salida
read -p "Ingrese la ruta completa del archivo de salida (por ejemplo, /ruta/de/la/carpeta/archivo.txt): " RUTA_ARCHIVO

# Función para escanear los puertos
escanear_puertos() {
    while true; do
        echo "---------- $(date) ----------" >> $RUTA_ARCHIVO
        for PUERTO in $PUERTOS; do
            nc -zv -w 1 localhost $PUERTO 2>&1 | tee -a $RUTA_ARCHIVO
        done

        sleep $SEGUNDOS
    done
}


# Ejecutar la función en segundo plano
escanear_puertos 


