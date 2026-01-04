FROM n8nio/n8n:latest
USER root
RUN apk add --no-cache ffmpeg curl
RUN mkdir -p /data/shared && chown -R node:node /data/shared && chmod -R 755 /data/shared
USER node
EXPOSE 5678
