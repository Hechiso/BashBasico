#! /bin/bash

# Verificar si Firefox está instalado
if ! command -v firefox &>/dev/null; then
    echo "Firefox no está instalado. Se instalará."
    sudo apt-get update
    sudo apt-get install firefox -y  # Agregué la bandera -y para aceptar automáticamente la instalación
else
    echo "Firefox ya está instalado."
fi

# Verificar si git está instalado
if ! command -v git &>/dev/null; then
    echo "Git no está instalado. Se instalará."
    sudo apt-get update
    sudo apt-get install git -y  # Agregué la bandera -y para aceptar automáticamente la instalación
else
    echo "Git ya está instalado."
fi

# Generar la clave SSH
ssh-keygen -t ed25519 -C "NigromanteOficial@outlook.com"

# Agregar la clave al agente SSH
ssh-add ~/.ssh/id_ed25519

# Configurar correo y nombre de usuario global de Git
git config --global user.email "NigromanteOficial@outlook.com"
git config --global user.name "Hechiso"

# Mostrar la clave SSH para copiarla
cat ~/.ssh/id_ed25519.pub

# Abrir Firefox en la página para agregar la clave SSH a GitHub
firefox https://github.com/settings/keys &

# Solicitar al usuario el nombre del repositorio a clonar
echo "Escribe el nombre del repositorio que quieres clonar: "
read variableRepositorio

# Clonar el repositorio utilizando la clave SSH configurada
git clone git@github.com:Hechiso/"$variableRepositorio"



#NOTA :: al hacer el push asegurarse que el nombre del branche sea el correcto git push -u main ,en este ejemplo (main) es el nombre del la rama en mi caso 
#
