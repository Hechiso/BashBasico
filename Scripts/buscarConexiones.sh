#!/bin/bash


# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.


# Ruta de la base de datos places.sqlite en tu instalación de Firefox
places_db="snap/firefox/common/.mozilla/firefox/9rutszx4.default/places.sqlite"

# Verificar si la base de datos places.sqlite existe
if [ ! -f "$places_db" ]; then
  echo "La base de datos places.sqlite no fue encontrada en la ubicación especificada."
  exit 1
fi

# Consultar la base de datos para obtener las direcciones IP de conexiones web
addresses=$(sqlite3 "$places_db" "SELECT DISTINCT moz_places.url FROM moz_places WHERE LENGTH(moz_places.url) > 0 AND moz_places.url LIKE 'http%';")

echo "Direcciones IP de conexiones web en Firefox:"
echo "$addresses"

