#!/bin/bash

podman container stop sing-box
podman container rm sing-box

podman container run \
    --name sing-box \
    --mount type=bind,source=/root/sing-box/config.json,target=/etc/sing-box/config.json,readonly \
    -d \
    --network=host \
    ghcr.io/sagernet/sing-box \
    -D /var/lib/sing-box \
    --config /etc/sing-box/config.json run
