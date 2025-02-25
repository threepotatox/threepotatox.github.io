#!/bin/bash

docker container stop hy2
docker container rm hy2

# /root/hy2
# 替换成自己的路径
docker container run \
    --name hy2 \
    --mount type=bind,source=/root/hy2,target=/etc/hysteria,readonly \
    -d \
    --network=host \
    docker.io/tobyxdd/hysteria \
    server -c /etc/hysteria/config.yaml

# 注意：这里 hy2 容器使用参数，--network=host，表示容器网络直接使用宿主机的 IP 地址和端口，而不是创建容器自己的隔离网络
# 本示例主要是为了后续 hy2 容器内方便使用 127.0.0.1 直接访问宿主机服务资源
