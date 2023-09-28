#!/bin/bash

# Configura el puerto serie (ajusta el nombre del puerto según corresponda)
PUERTO_SERIE="/dev/ttyACM1"

# Configura la velocidad de comunicación
VELOCIDAD_SERIE="9600"

# Inicia la lectura del puerto serie
stty -F $PUERTO_SERIE $VELOCIDAD_SERIE cs8 -cstopb -parenb
exec 3<$PUERTO_SERIE

# Bucle para leer el puerto serie y simular pulsaciones de teclado
while true; do
  read -rsn1 -t 0.1 -u 3 CHAR
  case "$CHAR" in
    "a") xdotool type "a" ;;
    "q") xdotool type "q" ;;
    "e") xdotool type "e" ;;
    "s") xdotool type "s" ;;
    "z") xdotool type "z" ;;
    "c") xdotool type "c" ;;
  esac
done

# Cierra el puerto serie al salir del script
exec 3<&-

