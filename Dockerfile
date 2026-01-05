FROM alpine:latest as builder

RUN apk add --no-cache wget tar xz
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
    && tar xvf ffmpeg-release-amd64-static.tar.xz \
    && mv ffmpeg-*-amd64-static/ffmpeg /usr/local/bin/ffmpeg \
    && mv ffmpeg-*-amd64-static/ffprobe /usr/local/bin/ffprobe \
    && chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

FROM n8nio/n8n:latest

USER root

COPY --from=builder /usr/local/bin/ffmpeg /usr/local/bin/ffmpeg
COPY --from=builder /usr/local/bin/ffprobe /usr/local/bin/ffprobe

RUN mkdir -p /data/shared && \
    chown -R node:node /data/shared && \
    chmod -R 777 /data/shared

USER node

EXPOSE 5678
