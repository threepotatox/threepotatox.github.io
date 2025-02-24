#!/bin/bash

docker container stop filebrowser
docker container rm filebrowser

# File Browser 配置默认 /srv 为网站根路径
# /root 目录挂载到 /srv
# 所以 File Browser 可以访问 /root 目录下的所有文件

docker container run \
    --name filebrowser \
    -d \
    -v /root:/srv \
    -v /root/filebrowser/.filebrowser.json:/.filebrowser.json \
    -v /root/filebrowser/filebrowser.db:/database.db \
    -u $(id -u):$(id -g) \
    -p 127.0.0.1:8080:80 \
    docker.io/filebrowser/filebrowser
