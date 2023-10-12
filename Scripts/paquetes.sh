#!/bin/bash

# Dirección IP del servidor a escanear
SERVER="192.168.1.1"

# Escaneo de todos los puertos (1-65535)
for port in {1..65535}; do
    nc -z -v -w 1 $SERVER $port 2>/dev/null && echo "Puerto $port está abierto" || echo "Puerto $port está cerrado"
done

