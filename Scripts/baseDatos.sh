#!/bin/bash

# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.

# Pedir al usuario el nombre de la base de datos
echo "Escribe el nombre de la base de datos"
read db_nombre

# Crear la base de datos
sqlite3 "$db_nombre" <<EOF
-- Crear una tabla llamada "Nombre de la tabla" con dos columnas
CREATE TABLE jugadores (
    nombre_del_jugador TEXT,
    nivel INTEGER
);

-- Salir de SQLite
.quit
EOF

echo "Base de datos '$db_nombre' creada exitosamente."

