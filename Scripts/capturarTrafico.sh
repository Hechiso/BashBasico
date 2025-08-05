#!/bin/bash

# Definir la interfaz de red
INTERFAZ="wlp2s0"

# Archivo de salida para la captura de tráfico
ARCHIVO_SALIDA="captura_todo_trafico_red.txt"

# Activar el modo promiscuo
echo "Activando modo promiscuo en la interfaz $INTERFAZ..."
sudo ip link set dev $INTERFAZ promisc on

# Verificar si se activó el modo promiscuo correctamente
if [ $? -ne 0 ]; then
    echo "Error al activar el modo promiscuo en la interfaz $INTERFAZ"
    exit 1
fi

# Capturar 2000 paquetes en la interfaz de red y guardarlos en un archivo pcap
echo "Capturando 2000 paquetes en la interfaz $INTERFAZ..."
sudo tcpdump -i $INTERFAZ -c 2000 -w captura_todo_trafico_red.pcap

# Verificar si la captura fue exitosa
if [ $? -eq 0 ]; then
    echo "Captura completada exitosamente. Archivo guardado en captura_todo_trafico_red.pcap"
else
    echo "Error en la captura de tráfico."
    sudo ip link set dev $INTERFAZ promisc off
    exit 1
fi

# Convertir el archivo pcap a texto
echo "Convirtiendo el archivo pcap a texto..."
sudo tcpdump -r captura_todo_trafico_red.pcap > $ARCHIVO_SALIDA

# Verificar si la conversión fue exitosa
if [ $? -eq 0 ]; then
    echo "Conversión completada exitosamente. Archivo guardado en $ARCHIVO_SALIDA"
else
    echo "Error en la conversión del archivo pcap a texto."
    sudo ip link set dev $INTERFAZ promisc off
    exit 1
fi

# Desactivar el modo promiscuo
echo "Desactivando modo promiscuo en la interfaz $INTERFAZ..."
sudo ip link set dev $INTERFAZ promisc off

# Verificar si se desactivó el modo promiscuo correctamente
if [ $? -eq 0 ]; then
    echo "Modo promiscuo desactivado correctamente."
else
    echo "Error al desactivar el modo promiscuo en la interfaz $INTERFAZ"
    exit 1
fi

echo "Todas las operaciones se completaron con éxito."

