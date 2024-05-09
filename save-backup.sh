#!/bin/bash

# 設定原始資料夾和目標資料夾的路徑
SRC_FOLDER="/home/comvanillasoulrendezvous/docker-vrising/data/Saves/v3/world1"
DEST_FOLDER="/mnt/backup"

# 在原始資料夾中找到編號最大的 AutoSave 檔案
MAX_FILE=$(ls $SRC_FOLDER/AutoSave_*.save.gz | sort -V | tail -n 1)

# 檢查是否有找到檔案
if [[ -n "$MAX_FILE" ]]; then
    # 複製檔案到目標資料夾
    sudo cp "$MAX_FILE" "$DEST_FOLDER"
    echo "檔案已複製到 $DEST_FOLDER"
else
    echo "未找到 AutoSave 檔案"
fi

sudo mkdir -p $DEST_FOLDER
sudo -E rclone sync $DEST_FOLDER gd:46.vrising-backup -P