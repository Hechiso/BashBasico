#!/bin/bash

# Carpeta base
DIRECTORIO="${1:-.}"  # Si no se pasa argumento, usa el directorio actual

# Buscar archivos .txt
find "$DIRECTORIO" -type f -name "*.sh"

