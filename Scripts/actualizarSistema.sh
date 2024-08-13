#!/bin/bash

# Actualiza la lista de paquetes
echo "Actualizando la lista de paquetes..."
sudo apt update
if [ $? -eq 0 ]; then
    echo "La lista de paquetes se actualizó correctamente."
else
    echo "No se pudo actualizar la lista de paquetes."
    exit 1
fi

# Actualiza los paquetes instalados
echo "Actualizando los paquetes instalados..."
sudo apt upgrade -y
if [ $? -eq 0 ]; then
    echo "Los paquetes instalados se actualizaron correctamente."
else
    echo "No se pudieron actualizar los paquetes instalados."
    exit 1
fi

# Actualiza paquetes con cambios en las dependencias
echo "Actualizando los paquetes con cambios de dependencias..."
sudo apt full-upgrade -y
if [ $? -eq 0 ]; then
    echo "Los paquetes con cambios de dependencias se actualizaron correctamente."
else
    echo "No se pudieron actualizar los paquetes con cambios de dependencias."
    exit 1
fi

# Limpia el sistema de paquetes obsoletos
echo "Limpiando paquetes obsoletos..."
sudo apt autoremove -y
if [ $? -eq 0 ]; then
    echo "Se limpiaron los paquetes obsoletos correctamente."
else
    echo "No se pudieron limpiar los paquetes obsoletos."
    exit 1
fi

echo "Todas las operaciones se completaron con éxito."


# en caso de que no se actualizen todos los paquetes utilizar sudo apt-get install --only-upgrade <" todos los paquetes que no se acutalizan ">
