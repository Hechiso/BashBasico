#!/bin/bash

# Copyright [2023] [Nigromante-Hechiso]

# Este programa es software libre: usted puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General de GNU publicada por 
# la Free Software Foundation, ya sea la versión 3 de la Licencia o (a su elección) cualquier versión posterior.

# Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIALIZACIÓN 
# o  IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.

# Debería haber recibido una copia de la Licencia Pública General de GNU junto con este programa. Si no la ha recibido, 
# consulte <https://www.gnu.org/licenses/gpl.html>.

# Dirección de correo electrónico del destinatario
destinatario="destinatario@ejemplo.com"

# Asunto del correo electrónico
asunto="Asunto del correo"

# Cuerpo del correo electrónico
cuerpo="Este es el contenido del correo."

# Utilizar sendmail para enviar el correo electrónico
echo -e "Asunto: $asunto\n$cuerpo" | sendmail "$destinatario"

# Verificar si el envío fue exitoso
if [ $? -eq 0 ]; then
  echo "Correo electrónico enviado con éxito a $destinatario."
else
  echo "Error al enviar el correo electrónico."
fi

