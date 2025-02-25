#!/bin/bash

docker container stop warp
docker container rm warp

# /root/warp
# 替换成自己的路径
docker container run -d \
  --name=warp \
  --restart=always \
  --device-cgroup-rule='c 10:200 rwm' \
  -p 127.0.0.1:1080:1080 \
  -e WARP_SLEEP=5 \
  --cap-add=MKNOD \
  --cap-add=AUDIT_WRITE \
  --cap-add=NET_ADMIN \
  --sysctl net.ipv6.conf.all.disable_ipv6=0 \
  --sysctl net.ipv4.conf.all.src_valid_mark=1 \
  -v /root/warp:/var/lib/cloudflare-warp \
  docker.io/caomingjun/warp:latest

# 容器挂载此路径
# -v /root/warp:/var/lib/cloudflare-warp
# 会保存容器内 WARP 客户端的连接信息
# 下次启动容器，WARP 客户端会使用保存的信息连接
# 详细可查看文档 [warp-docker](https://github.com/cmj2002/warp-docker)
