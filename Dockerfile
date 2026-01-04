FROM n8nio/n8n:latest

USER root

# 🔥 核心修正：將 apk (Alpine) 改為 apt-get (Debian)
# 這樣才能正確安裝 FFmpeg，不會報錯
RUN apt-get update && apt-get install -y ffmpeg curl && rm -rf /var/lib/apt/lists/*

# 保留你原本的資料夾設定 (以免影響既有功能)
RUN mkdir -p /data/shared && chown -R node:node /data/shared && chmod -R 755 /data/shared

USER node

EXPOSE 5678
