#!/bin/bash

podman container stop cloudflared
podman container rm cloudflared

# --network=host：容器网络使用宿主机命名空间，方便使用 127.0.0.1 访问宿主机服务资源
# --protocol http2：cloudflared 默认只用 QUIC 协议，加上 http2 后，若 QUIC 不可用会自动回退 HTTP/2 协议
# --token：后面替换成复制的 token
podman container run \
    --name cloudflared \
    --network=host \
    -d \
    docker.io/cloudflare/cloudflared:latest tunnel --no-autoupdate --protocol http2 run --token your_token_string
