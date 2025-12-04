# 基於官方 n8n 映像
FROM n8nio/n8n:latest

# 切換到 root 用戶以安裝系統套件
USER root

# 更新套件列表並安裝 FFmpeg 及相關依賴
RUN apk update && \
    apk add --no-cache \
    ffmpeg \
    ffmpeg-libs \
    && rm -rf /var/cache/apk/*

# 驗證 FFmpeg 安裝
RUN ffmpeg -version

# 切換回 n8n 用戶（安全性最佳實踐）
USER node

# 暴露 n8n 默認端口
EXPOSE 5678

# 使用原始 n8n 入口點
CMD ["n8n"]
