FROM n8nio/n8n:2.1.5
LABEL "language"="nodejs"
LABEL "framework"="n8n"
USER root
RUN apk add --no-cache ffmpeg curl
RUN mkdir -p /data/shared && \
    chown -R node:node /data/shared && \
    chmod -R 777 /data/shared
USER node
EXPOSE 5678
CMD ["n8n", "start"]
