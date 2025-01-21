+++
title = "购买 VPS"
weight = 4
# bookFlatSection = false
# bookToc = true
# bookHidden = false
# bookCollapseSection = false
# bookComments = false
# bookSearchExclude = false
+++

## 购买关注点

购买服务器 VPS，通常需要考虑服务商、配置、流量、位置等主要因素。

- 服务商：云服务大厂均可，如 AWS、Microsoft、Google、Oracle、Vultr……
- 配置：服务器主要处理代理的网络请求，不需要其他计算资源且代理软件通常都设计的非常轻量，所以配置不需要很高，通常选择最小型号即可，如 1 个 CPU、1GB 内存、20-50GB 硬盘。
- **流量：**
    - **可用流量**：有的云服务，硬件配置和流量是分别单独计算的，有的流量按照每月上限计价，有的流量按照用多少计价，需要额外注意。通常来说每月 500GB 够用了。
    - 带宽：带宽要求不需要太高，通常 30-50Mbps 也够用了，而那些标注 1Gbps 的，通常来说是“共享”带宽，因为“独享”带宽是非常贵的。
- **位置：**
    - 地理位置：理论上来说，物理距离越短，网络质量上限也越高，价格也越高，香港、台湾、日本、韩国、新加坡、美国、欧洲等。
    - **线路**：CN2 GIA 线路体验很好，但偏贵些，普通 CN2 线路体验尚可，价格也相应便宜些。
    - **原生 IP**：海外应用通常会有地区限制，甚至部分 VPS 的 IP 也会被限制，所以即使翻墙后，也有可能无法连接海外应用。可以使用 Cloudflare WARP 进一步解除 IP 封锁。

## VPS 服务商

| | 试用服务 | 最低价格 | 价格模式 | 国际信用卡 | 银联卡 | 支付宝 | 特点 |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| [Vultr](https://www.vultr.com/) | 赠送 $100 | $2.5/m | 计时付费 |Y||Y| 机房丰富，但要有余额才能用，且单次充值最低额度为 $10 |
| [Google Cloud Platform](https://cloud.google.com/) | 赠送 $300 || 随用随付 |Y||| 硬件和流量分别按量计费，流量偏贵；速度快，特别是台湾、香港节点；因为是 Google 的产品，所以 GCP 的购买和部署页需要先翻墙才能访问 |
| [BandwagonHOST](https://bandwagonhost.com/) | 无 | $49.99/y | 套餐 |Y||Y| 俗称“搬瓦工”，科学上网美区最优选之一，整体速度很快，可选 CN2 GIA 线路，且推出了自家的机场 JustMySocks |
| [AWS LightSail](https://lightsail.aws.amazon.com/) | 免费 3 个月 | $3.5/m | 套餐 |Y|Y|| 适合小型项目和个人用户，固定费用简单易懂 |
| [Microsoft Azure](https://azure.microsoft.com/zh-cn/) | 免费 1 年 B1S 实例 |||Y||| 微软家的云服务，与微软生态系统集成良好 |
| [Oracle Cloud](https://www.oracle.com/cloud/free/) | 两台 VPS 无限期 |||Y||| 可申请两台无限期 VPS，但申请认证难度较大 |
| [RackNerd](https://my.racknerd.com/) ||||Y|Y|Y| 购买时提供机房位置的 IP，可以测试 ping 值后再下单，部分活动可选到低价 VPS |
| [AWS EC2](https://aws.amazon.com/cn/) | 免费一年 EC2 实例 |||Y|Y|| 适合需要高度可配置和灵活性的用户，包括企业和开发者 |
| [Linode](https://www.linode.com/) ||||Y||| 老牌 IDC 之一，现在被收购至 Akamai 旗下 |

> 注：
> 
> * 上面三个是个人目前在用的，其中搬瓦工为主力，Vultr 和 GCP 作测试用；其他服务商信息主要由官网和评测收集。
>
> * 试用服务和最低价格，服务商可能随时变更，使用前请参考服务商最新用户协议。
>
> * 因为网络的复杂性，所以不同的地区、时间、线路，到不同的国家可能会完全不一样，各种评测结果更多的参考意义。

## 线路简介

CN2 GIA 英文全称 ChinaNet Next Carrying Network - Global Internet Access，属于电信国际精品网络，路由骨干节点 IP 均为 59.43 开头。想要流畅的体验，认准 CN2 GIA 就好，代表服务商“搬瓦工”。

CN2 英文全称 ChinaNet Next Carrying Network，中国电信下一代承载网，分为 CN2 GT 和 CN2 GIA 两种类型：

- CN2 GT: CN2 Global Transit，属于 CN2 的低中端线路，出国体验上比 163 骨干网稍强，虽然没有 CN2 GIA 速度快，但性价比较高。

- CN2 GIA: CN2 Global Internet Access，高端产品，理论上是速度最快最稳的，不过价格也相对较高。
