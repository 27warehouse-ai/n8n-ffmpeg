FROM n8nio/n8n:2.1.5

USER root
RUN apt-get update && \
    apt-get install -y ffmpeg curl && \
    rm -rf /var/lib/apt/lists/*

USER node
EXPOSE 5678
CMD ["n8n", "start"]
