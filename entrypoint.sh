#!/bin/sh

# Modifica el puerto de escucha dinámicamente según lo requiera Fly.io
sed -i "s/8080/${PORT}/g" /etc/xray/config.json

echo "========================================================="
echo " Servidor iniciado correctamente en Fly.io "
echo " El servicio permanecerá activo mientras la instancia siga en ejecución "
echo "========================================================="

# Inicia el motor de red en primer plano
exec /usr/local/bin/xray run -c /etc/xray/config.json
