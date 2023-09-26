#!/bin/bash

# se declaran las variables
carpetaMain="RegistroApt"
path="ruta del archivo" 

#----------------------------------------------------  codigo de construcción  ---------------------------------------------------

if [ -d "$carpetaMain" ]; then           # Carpeta principal
    echo "La carpeta $carpetaMain existe."
else
    echo "La carpeta $carpetaMain no existe."
    echo "Se crea la carpeta : $carpetaMain "
    mkdir "$carpetaMain"
    cd "$carpetaMain"
    touch "$Registro"
fi

#--------------------------------------------------  instalación de paquetes  --------------------------------------------------

install_package() {
    package_name="$1"
    sudo apt-get update
    sudo apt-get install -y "$package_name"
    echo "El paquete $package_name se ha instalado correctamente."
    echo "Se instalo el paquete : $package_name" >> "$path"        
}


#--------------------------------------------------  desinstalacion de paquetes  -------------------------------------------------

uninstall_package() {
    package_name="$1"
    sudo apt-get remove -y "$package_name"
    if grep -q "Se instalo el paquete : $package_name" "$path"; then
        sed -i "/Se instalo el paquete : $package_name/d" "$path"
        echo "El paquete $package_name se ha desinstalado correctamente y se ha eliminado del registro."
    else
        echo "El paquete $package_name no estaba registrado en el archivo."
    fi
    sudo apt-get -y autoremove
}

# bucle para seleccionar tu opcion
while true; do
    echo "Opciones:"
    echo "1. Instalar paquete"
    echo "2. Desinstalar paquete"
    echo "3. Salir"
    read -p "Seleccione una opción (1/2/3): " choice

    case $choice in
        1)
            read -p "Ingrese el nombre del paquete que desea instalar: " package_name
            install_package "$package_name"
            ;;
        2)
            read -p "Ingrese el nombre del paquete que desea desinstalar: " package_name
            uninstall_package "$package_name"
            ;;
        3)
            break
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione 1, 2 o 3."
            ;;
    esac
done

