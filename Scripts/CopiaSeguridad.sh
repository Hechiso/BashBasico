#!/bin/bash

# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.



# Solicitar la ruta del archivo o directorio a respaldar
echo "Por favor, ingrese la ruta del archivo o directorio a respaldar:"
read source_path

# Verificar si la ruta existe
if [ ! -e "$source_path" ]; then
    echo "La ruta especificada no existe."
    exit 1
fi

# Solicitar la ruta donde se guardará la copia de seguridad
echo "Por favor, ingrese la ruta donde desea guardar la copia de seguridad:"
read backup_path

# Crear una copia de seguridad comprimida
tar -czvf "$backup_path/backup_$(date +%Y%m%d%H%M%S).tar.gz" "$source_path"

if [ $? -eq 0 ]; then
    echo "Copia de seguridad exitosa en $backup_path."
else
    echo "Error al realizar la copia de seguridad."
fi

