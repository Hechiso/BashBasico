#!/bin/bash

# Ruta del archivo de registro
log_file="/var/log/mi_demonio.log"

# Función que realiza la tarea principal del demonio
main() {
    while true; do
        echo "Registro de actividad: $(date)" >> "$log_file"
        sleep 60  # Espera 60 segundos entre registros
    done
}

# Iniciar el demonio
main > "$log_file" 2>&1 &
echo "Demonio iniciado. ID del proceso: $!"

# Manejar señales de detención (puedes personalizar esto)
trap 'kill -TERM $PID' TERM INT

# Mantener el script en ejecución
PID=$!
wait $PID

