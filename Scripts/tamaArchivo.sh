#!/bin/bash

# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.


archivo="Ejemplo.txt"  
tamano=$(stat -c %s "$archivo")

echo "=============== Tamaño del archivo =============="
echo "El archivo $archivo tiene un tamaño de: $tamano bytes"

# Se crea una variable para ajustar la informacion obtenida del archivo y presentarla al usuario
    tamano_legible=$(echo "scale=1; $tamano / 1000" | bc)
    echo "${tamano_legible} Kilobytes"

# Se compueba si el tamaño llego al limite programado
if [[ "$tamano" < 100000 ]]; then
	echo "el archivo $archivo llego a 1 gb de informacion."
	echo "$tamano"
else
    echo "El archivo $archivo no ha llegado al limite."
fi

# este es el fin del script


