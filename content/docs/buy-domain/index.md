+++
title = "购买域名"
weight = 5
# bookFlatSection = false
# bookToc = true
# bookHidden = false
# bookCollapseSection = false
# bookComments = false
# bookSearchExclude = false
+++

## 搭建代理为什么需要域名

因为目前最有效的代理方式，就是将代理流量基于安全的 HTTPS 连接，而 HTTPS 依赖 SSL/TLS 证书，申请证书则需要域名。

>注：
>
> 没有域名，直接为 IP 地址申请 SSL/TLS 证书也是可行的，但极不推荐。
>
> 绝大多数 CA（证书颁发机构）不支持免费申请基于 IP 的证书。（ZeroSSL 可以免费申请基于 IP 的证书）
>
> 没有域名则只能使用 IP 访问服务器，安全性和灵活性大大降低。

## 购买域名

[NameSilo](https://www.namesilo.com/)

NameSilo 现在也是较为老牌的域名注册商之一了。
- ~~首年价和~~续费性价比较高
- 提供免费的 WHOIS 隐私保护
- 几乎没有优惠活动，价格透明，可以支付宝付款

于 2024 年 9 月份第二次调价后，第一年的购入价格不一定最便宜了，但续费价格依旧是最优惠的注册商之一。

在早年，大部分商家的域名隐私保护是收费的，而 Namesilo 一直都是免费。不过现在这点的优势没那么大了。

当然我最喜欢的还是不搞促销活动，常用的顶级域 `.com`，`.org`，`.net` 全年保持统一价格，而大多数冷门的顶级域则是常年挂着折扣价。

> 我唯一知道的活动，新用户订单超过 10 美元可以使用老用户提供的优惠码抵扣 1 美元，且每个账号仅能优惠一次。

[GoDaddy](https://www.godaddy.com/)

可以说是行业老大，虽然第一年相对便宜，但续费价格偏高。

## 将域名托管到 Cloudflare

打开 [Cloudflare 面板](https://dash.cloudflare.com/)，添加域名后，并根据提示，修改域名注册商的解析服务器，将其指向 Cloudflare。这样才能使用 Cloudflare 提供的各种服务。之后，域名的续费在注册商，域名的管理在 Cloudflare。

如果是在 Cloudflare 注册购买的域名，应该不需要这个步骤。

