#!/bin/bash

# 定义项目路径
PROJECT_DIR="/Users/domom/node-red"
LOG_FILE="$PROJECT_DIR/node_red.log"

# 进入项目目录
cd $PROJECT_DIR || exit 1

# 执行构建
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting npm run build..." >> $LOG_FILE
npm run build >> $LOG_FILE 2>&1

# 检查构建是否成功
if [ $? -ne 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Build failed" >> $LOG_FILE
    exit 1
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Build completed successfully" >> $LOG_FILE

# 启动Node-RED服务
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting Node-RED..." >> $LOG_FILE
nohup npm start >> $LOG_FILE 2>&1 &

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Node-RED started in background" >> $LOG_FILE
echo "Logs can be found at: $LOG_FILE"