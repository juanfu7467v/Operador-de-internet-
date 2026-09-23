FROM alpine:latest

# Instalación de dependencias mínimas
RUN apk add --no-cache ca-certificates curl jq unzip tzdata

# Descargar e instalar la última versión estable de Xray-core
RUN XLATEST=$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases/latest | jq -r .tag_name) && \
    curl -L -H "Cache-Control: no-cache" -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/download/${XLATEST}/Xray-linux-64.zip" && \
    unzip /tmp/xray.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/xray && \
    rm -rf /tmp/xray.zip /usr/local/bin/README.md /usr/local/bin/LICENSE

# Crear directorio de configuración y copiar archivos
WORKDIR /etc/xray
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV PORT=8080

ENTRYPOINT ["/entrypoint.sh"]
