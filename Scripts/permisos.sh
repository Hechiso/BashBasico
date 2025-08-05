#!/bin/bash

# Carpeta a inspeccionar, puede ser pasada como argumento o usar la actual
DIRECTORIO="${1:-.}"

# Validar si el directorio existe
if [ ! -d "$DIRECTORIO" ]; then
  echo "❌ Error: El directorio '$DIRECTORIO' no existe."
  exit 1
fi

echo "🔍 Revisando permisos en: $DIRECTORIO"

# Buscar todos los archivos y carpetas de forma recursiva
find "$DIRECTORIO" -type f | while read -r archivo; do
  extension="${archivo##*.}"

  case "$extension" in
    txt)
      # Quitar permiso de ejecución a .txt
      chmod 640 "$archivo"
      echo "✏️ Quitar ejecución: $archivo"
      ;;
    sh)
      # Asegurar que los scripts .sh sí tengan ejecución (opcional)
      chmod 740 "$archivo"
      echo "⚙️ Asegurar ejecución: $archivo"
      ;;
   avi)
      chmod 640 "$archivo"
      echo"✏ Quitar ejecucion: $archivo"
      ;;
   pdf)
      chmod 640 "$archivo"
      echo"✏ Quitar ejecucion: $archivo"
      ;;
   php)
      chmod 640 "$archivo"
      echo"✏ Quitar ejecucion: $archivo"
      ;;
   html)
      chmod 640 "$archivo"
      echo"✏ Quitar ejecucion: $archivo"
      ;;
   css)
      chmod 640 "$archivo" 
      echo"✏ Quitar ejecucion: $archivo"
      ;;
   js)
      chmod 640 "$archivo" 
      echo"✏ Quitar ejecucion: $archivo"
      ;;
   mkv)
      chmod 640 "$archivo" 
      echo"✏ Quitar ejecucion: $archivo"
      ;;
   mp4)
      chmod 640 "$archivo"
      echo"✏ Quitar ejecucion: $archivo"
      ;;      
    *)
      # No hacer nada con otras extensiones, pero puedes ampliar aquí
      ;;
  esac
done

# Ahora procesamos las carpetas para asegurar permisos seguros
find "$DIRECTORIO" -type d | while read -r carpeta; do
  # Establecer permisos 755 para carpetas (drwxr-xr-x)
  chmod 700 "$carpeta"
  echo "📁 Ajustar permisos carpeta: $carpeta"
done
echo "✅ Permisos ajustados correctamente."

