FROM n8nio/n8n:latest

USER root
COPY --from=mwader/static-ffmpeg:6.1.1 /ffmpeg /usr/local/bin/
COPY --from=mwader/static-ffmpeg:6.1.1 /ffprobe /usr/local/bin/
RUN mkdir -p /data/shared && \
    chown -R node:node /data/shared && \
    chmod -R 777 /data/shared

USER node
