#!/bin/bash

# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.



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

