#!/bin/bash


# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.

# Nombre del archivo CSV
archivo="usuarios.csv"

# Comprobamos si el archivo ya existe o no
if [ ! -e "$archivo" ]; then
  # Si no existe, creamos el archivo con encabezados
  echo "Nombre,Edad,Correo" > "$archivo"
fi

# Solicitar información del usuario
echo "Ingrese el nombre del usuario:"
read nombre

echo "Ingrese la edad del usuario:"
read edad

echo "Ingrese el correo electrónico del usuario:"
read correo

# Agregar la información al archivo CSV
echo "$nombre,$edad,$correo" >> "$archivo"

echo "Información guardada en $archivo"

