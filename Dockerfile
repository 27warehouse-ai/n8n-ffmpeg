FROM n8nio/n8n:2.1.5
USER root
RUN apt-get update \&& apt-get install -y ffmpeg curl \&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p /data/shared \&& chown -R node:node /data/shared \&& chmod -R 755 /data/shared
USER node
EXPOSE 5678
