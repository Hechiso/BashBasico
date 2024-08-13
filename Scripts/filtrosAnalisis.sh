#!/bin/bash

# Archivo de captura
PCAP_FILE="captura_todo_trafico_red.pcap"

# Directorio de salida para archivos filtrados y análisis
OUTPUT_DIR="filtrados"
ANALYSIS_DIR="analisis"
mkdir -p $OUTPUT_DIR
mkdir -p $ANALYSIS_DIR

# Verifica si el archivo de captura existe y no está vacío
if [ ! -s $PCAP_FILE ]; then
    echo "El archivo $PCAP_FILE no existe o está vacío."
    exit 1
fi

# Filtrar tráfico HTTP
tcpdump -r $PCAP_FILE -nn -s 0 -A 'tcp port 80' > $OUTPUT_DIR/http_traffic.txt
grep -E -i "GET|POST|Host|User-Agent|Referer|Cookie" $OUTPUT_DIR/http_traffic.txt > $ANALYSIS_DIR/http_analysis.txt

# Filtrar tráfico DNS
tcpdump -r $PCAP_FILE -nn -s 0 -A 'udp port 53' > $OUTPUT_DIR/dns_traffic.txt
grep -E -i "A\?|AAAA\?|CNAME\?" $OUTPUT_DIR/dns_traffic.txt > $ANALYSIS_DIR/dns_analysis.txt

# Filtrar tráfico HTTPS
tcpdump -r $PCAP_FILE -nn -s 0 -A 'tcp port 443' > $OUTPUT_DIR/https_traffic.txt
grep -E -i "ServerHello|ClientHello|Certificate" $OUTPUT_DIR/https_traffic.txt > $ANALYSIS_DIR/https_analysis.txt

# Filtrar tráfico ICMP
tcpdump -r $PCAP_FILE -nn -s 0 -A 'icmp' > $OUTPUT_DIR/icmp_traffic.txt

# Filtrar tráfico SSH
tcpdump -r $PCAP_FILE -nn -s 0 -A 'tcp port 22' > $OUTPUT_DIR/ssh_traffic.txt

echo "Filtrado completado. Los archivos se guardaron en los directorios $OUTPUT_DIR y $ANALYSIS_DIR."

