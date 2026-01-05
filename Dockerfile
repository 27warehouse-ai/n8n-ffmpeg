# 1. 基底：使用你剛剛成功過的官方原廠版本
FROM n8nio/n8n:latest

USER root

# 2. 魔法：直接從靜態庫複製 FFmpeg (不需下載、不需安裝、不需依賴)
# 這是目前世界上在 Alpine 系統裝 FFmpeg 成功率最高的方法
COPY --from=mwader/static-ffmpeg:6.1.1 /ffmpeg /usr/local/bin/
COPY --from=mwader/static-ffmpeg:6.1.1 /ffprobe /usr/local/bin/

# 3. 補強：賦予執行權限 (防止複製過來變成無法執行的石頭)
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

# 4. 地基：確保資料夾權限全開
RUN mkdir -p /data/shared && \
    chown -R node:node /data/shared && \
    chmod -R 777 /data/shared

USER node
