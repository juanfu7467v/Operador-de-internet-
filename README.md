# laboratorio-prueva-red 🧪

Este proyecto levanta un servidor Xray (protocolo VLESS + WebSocket) en la plataforma Fly.io para pruebas de red de corta duracion. El servicio tiene un temporizador automatico que lo apaga despues de 24 horas de estar corriendo.

## Archivos del proyecto

Dockerfile: Descarga la ultima version de Xray-core desde el repositorio oficial de GitHub, copia las configuraciones adentro de la imagen (Alpine Linux) y expone el puerto interno 8080.
config.json: Define la entrada (inbound) en el puerto 8080 usando el protocolo `vless` con ID de cliente fijo (`73622285-3a15-40f6-9fa1-f6a35e2dae7b`). El trafico viaja encapsulado por Websockets en la ruta `/datos-libres`. La salida (outbound) esta en modo `freedom` (directo a internet).
entrypoint.sh: Script de arranque que ajusta el puerto dinamicamente segun la variable de entorno que le asigna Fly.io. Incluye un proceso en segundo plano que cuenta 86400 segundos (24 horas) para matar el proceso principal de forma automatica.
fly.toml: Archivo de configuracion para el despliegue en Fly.io. Mapea el puerto externo 443 con manejo de TLS hacia el puerto interno 8080 de la maquina virtual.

## Notas de despliegue

El servidor se conecta usando TLS por el puerto 443, por lo que externamente responde al dominio asignado por Fly (`.fly.dev`). 
