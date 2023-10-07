#!/bin/bash

# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.



# Variables para los archivos y carpetas del proyecto

carpetaPrincipal="Portafolio"
archivoReadme="README.md"
archivoIndex="index.html"
carpetaCss="css"
archivoEstilos="estilos.css"
carpetaJs="js"

# construccion del proyecto

mkdir "$carpetaPrincipal"

cd "$carpetaPrincipal"

touch "$archivoReadme" "$archivoIndex"

mkdir "$carpetaCss" "$carpetaJs"

cd "$carpetaCss"

touch "$archivoEstilos"



