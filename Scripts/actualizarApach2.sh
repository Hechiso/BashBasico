#!/bin/bash

# Actualizar Apache2
actualizar_apache() {
    sudo apt update
    sudo apt upgrade apache2 -y
    sudo systemctl restart apache2
}

# Ejecutar la actualización
actualizar_apache

# Esperar 2 días antes de ejecutar de nuevo
while true; do
    sleep 2d

    # Verificar si se debe seguir ejecutando o detener
    if [ -f ~/Documentos/ActualizarServidor/detener/detenerActualizacion.txt ]; then
        echo "Deteniendo actualización de Apache2..."
        rm ~/Documentos/ActualizarServidor/detener/detenerActualizacion.txt
        exit 0
    fi

    # Realizar la actualización cada dos días
    actualizar_apache
done

