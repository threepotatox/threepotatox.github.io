+++
title = "Hysteria2 代理"
weight = 9
# bookFlatSection = false
# bookToc = true
# bookHidden = false
# bookCollapseSection = false
# bookComments = false
# bookSearchExclude = false
+++

## 使用 Docker 安装 Hysteria

[Hysteria 官网](https://v2.hysteria.network/zh/)

> - hysteria2 魔改 quic-go 拥塞控制的代理协议。
>     - 得益于 QUIC 的全加密和填充，大大地增加中间防火墙嗅探的负担
>     - 强制要求使用 TLS 1.3
>     - 真正的多路复用，还从根本上解决了 TLS 和多路复用带来的队头阻塞问题
>
> 引用自 https://www.v2fly.org/v5/config/stream/hy2.html

只要实现了 hysteria2 协议的代理工具，均可以安装后配置 hysteria2 协议。为了简单直接，这里直接使用 Hysteria 的官方工具。

Hysteria 的官方文档写的非常详细，可以根据文档选择喜欢的安装方式，以及自定义配置文件。

### 示例目录结构

相关证书文件由 acme.sh 生成和安装。

- 其中 fullchain.cer 和 example.com.cer 有一定的区别：
    - example.com.cer：这个文件仅包含服务器证书，不包含任何中间证书
    - fullchain.cer：这个文件包含了服务器证书（example.com.cer）以及所有必需的中间证书和根证书，形成一个完整的证书链

大多数 Web 服务器（如 Nginx）需要使用 fullchain.cer，这里 Hysteria 也要使用 fullchain.cer。

```shell
# 示例目录结构
# /root
# ├── hy2-start-docker.sh
# └── hy2
#        ├── config.yaml
#        └── certs
#                ├── ca.cer
#                ├── fullchain.cer
#                ├── example.com.cer
#                └── example.com.key
```

### Docker/Podman 安装 Hysteria 示例

下面是 Shell 脚本示例，可以保存成 `hy2-start-docker.sh` 文件后运行。

{{% tabs %}}

{{% tab "docker" %}}

```shell
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
```

{{% /tab %}}

{{% tab "podman" %}}

```shell
#!/bin/bash

podman container stop hy2
podman container rm hy2

# /root/hy2
# 替换成自己的路径
podman container run \
 --name hy2 \
 --mount type=bind,source=/root/hy2,target=/etc/hysteria,readonly \
 -d \
 --network=host \
 docker.io/tobyxdd/hysteria \
 server -c /etc/hysteria/config.yaml
```

{{% /tab %}}

{{% /tabs %}}

运行脚本命令：

```bash
bash /root/hy2-start-docker.sh
```

### Hysteria 配置示例

配置文件路径：`/root/hy2/config.yaml`

```yaml
# listen: :443 

tls:
  cert: /etc/hysteria/certs/fullchain.cer  # 替换成自己的证书，注意使用 fullchain.cer 证书
  key: /etc/hysteria/certs/example.com.key  # 替换成自己的密钥

auth:
  type: password
  password: 'your_password'  # 替换成自己的密码

masquerade: 
  type: proxy
  proxy:
    url: https://www.bing.com/ 
    rewriteHost: true

sniff:
  enable: true 
  timeout: 2s 
  rewriteDomain: false 
  tcpPorts: 80,443,8000-9000 
  udpPorts: all
```
