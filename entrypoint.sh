#!/bin/sh

# Modifica el puerto de escucha dinámicamente según lo requiera Fly.io
sed -i "s/8080/${PORT}/g" /etc/xray/config.json

echo "========================================================="
echo " Servidor de pruebas iniciado con éxito en Fly.io "
echo " Alerta: Se destruirá automáticamente en 24 horas exactas "
echo "========================================================="

# Temporizador en segundo plano (86400 segundos = 24 horas)
(
    sleep 86400
    echo "[!] Límite de 24 horas alcanzado. Ejecutando autodestrucción del servicio..."
    kill -15 1
) &

# Inicia el motor de red en primer plano
exec /usr/local/bin/xray run -c /etc/xray/config.json
