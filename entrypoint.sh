#!/bin/sh

echo "========================================================="
echo " Servidor Xray VLESS-WS iniciado en Fly.io "
echo " Puerto interno: 8080 | Ruta: /datos-libres "
echo "========================================================="

exec /usr/local/bin/xray run -c /etc/xray/config.json
