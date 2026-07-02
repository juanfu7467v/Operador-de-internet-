#!/bin/sh

echo "========================================================="
echo " Servidor iniciado correctamente en Fly.io "
echo "========================================================="

# Inicia el motor directamente respetando el puerto 8080 del config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
