#!/bin/bash

# cloudflare dns
export CF_Token="your_token"
export CF_Account_ID="your_account_id"

# issue
# example.com 替换成自己的域名
~/.acme.sh/acme.sh \
--issue \
-d example.com \
--keylength ec-256 \
--force \
--dns dns_cf

# install
# example.com 替换成自己的域名
~/.acme.sh/acme.sh \
--install-cert \
-d example.com \
--ecc \
--fullchain-file /root/hy2/certs/fullchain.cer \
--ca-file /root/hy2/certs/ca.cer \
--cert-file /root/hy2/certs/example.com.cer \
--key-file /root/hy2/certs/example.com.key
