#!/bin/bash
echo "Bienvenido, $(whoami)!"


#-----------------------------------    Hacer la conexion a internet    ----------------------------------
# Pregunta si desea habilitar el Wi-Fi
read -p "¿Quieres habilitar el Wi-Fi y conectarte a Internet? (s/n): " respuesta

if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
    # Habilitar la interfaz Wi-Fi
    nmcli radio wifi on

echo "Wi-Fi habilitado y conectado a 'MEGACABLE-1FA2-5G'."
      ./SitioWeb.sh
else
echo "Has decidido no habilitar el Wi-Fi."
fi



exec bash

