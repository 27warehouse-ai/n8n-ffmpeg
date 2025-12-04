FROM n8nio/n8n:latest

USER root

# 安裝 FFmpeg 和相關依賴（使用 apk 包管理器）
RUN apk add --no-cache \
    ffmpeg \
    ffmpeg-libs \
    && rm -rf /var/cache/apk/*

# 創建共享目錄用於 FFmpeg 處理文件
RUN mkdir -p /data/shared && \
    chown -R node:node /data/shared && \
    chmod -R 755 /data/shared

USER node

EXPOSE 5678
