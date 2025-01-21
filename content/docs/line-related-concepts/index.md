+++
title = "线路相关概念"
weight = 11
# bookFlatSection = false
# bookToc = true
# bookHidden = false
# bookCollapseSection = false
# bookComments = false
# bookSearchExclude = false
+++

搜索 VPS 线路时，会遇到很多概念，和纯粹的软件、协议概念不同，“线路”相关的概念可能还会涉及社会机构、公司、组织等。这里根据自己的理解简单罗列一下相关概念。

搜索线路时，一定会遇到类似 AS4134、AS4809 这样的编号，这些编号具有唯一性，和我们所说的线路直接相关。

## 什么是 AS 和 ASN

- AS：自治系统或自治域（Autonomous system）
    - 是指在互联网中，一个或多个实体管辖的所有 IP 和路由器的大型网络，并执行统一的路由策略。连接到互联网的每台计算机或设备都连接到一个 AS。

- ASN：自治系统编号（Autonomous System Number）
    - 是一个全球唯一的数字标识符，用于标识一个自治系统。

自治系统（AS）是构建互联网不可或缺的一部分，它们通过分布式管理、互联互通、有效的路由选择和优化策略，使得全球各地的网络能够高效地连接。

[什么是自治系统？| 什么是 ASN？](https://www.cloudflare.com/zh-cn/learning/network-layer/what-is-an-autonomous-system/)

## AS 之间如何互联

AS 之间在「互联网交换点（IXP）」互联即组成了全球互联网。

- IXP：互联网交换点（Internet exchange points）
    - 是指一个物理位置或场所。在这里使用网络交换机等设备连接不同网络。
    - 大多数交换点是由独立于参与者的非营利组织运营。

AS 之间的连接方式主要分为，Peering 和 Transit：

- Peering：对等互联
    - 两个网络之间直接互连，以便相互交换流量。这种连接通常是免费的，双方都不向对方收费。
    - 公共 Peering：在 IXP 通过共享设备交换流量。
    - 私有 Peering：私有协议或设备等交换流量，可能涉及费用或服务条款。

- Transit：传输
    - 客户与其上游提供商之间的协议。是一项有偿服务。

[什么是互联网交换点？| IXP 如何运作？](https://www.cloudflare.com/zh-cn/learning/cdn/glossary/internet-exchange-point-ixp/)

## ASN 由谁管理

ASN 需要在 RIR 申请，而 RIR 所拥有的这些资源是由 IANA 管理和分配的。

- RIR：区域互联网注册机构（Regional Internet Registry）
    - 负责特定地理区域内 IP 地址和 ASN 分配的组织。全球分为五个主要地区，分别是：
        - ARIN（美洲互联网号码注册中心）
        - RIPE NCC（欧洲IP网络协调中心）
        - APNIC（亚太网络信息中心）
        - LACNIC（拉丁美洲和加勒比网络信息中心）
        - AFRINIC（非洲网络信息中心）

- IANA：互联网号码分配局（Internet Assigned Numbers Authority）
    - 负责全球互联网号码资源的管理机构，包括 IP 地址、自治系统编号（ASN）、域名系统（DNS）根区域等。

RIR 和 IANA 的关系：

- 层级结构：IANA 位于全球互联网资源管理的顶层，负责将未分配的 IP 地址和 ASN 分配给各个 RIR。RIR 则在其各自的区域内将这些资源进一步分配给本地互联网服务提供商（ISP）和其他用户。
- 政策制定：IANA 制定全球范围内的资源分配政策，而 RIR 则根据当地社区的需求和政策制定过程（PDP）来管理和分配资源。
- 从属关系：两者不构成直接的从属关系，而是合作与协调关系。虽然 RIR 依赖于 IANA 提供资源，但两者在运作上是独立的。

## 具体的 ASN 和线路

各类型组织通过向 RIR 申请，得到最重要的资源就是互联网 IP 地址，再基于这些 IP 建设具有唯一编号（ASN）的自治系统（AS），即所说的骨干网及其他网络等基础网络。

- AS4134：中国公用计算机互联网（ChinaNet / 163）
    - 中国电信 163 骨干网，电信的大多数用户和流量都接入此网络。

- AS4809：中国电信下一代承载网（China Telecom Next Generation Carrier Network）
    - 简称 CN2，是中国电信的第二张骨干网，使用技术相对先进，故使用体验优于 163，但是收费也相对较高。

而类似 CN2 GT、CN2 GIA 等则是基于这些基础网络架构，推出的具体产品服务，也就是我们通常所说的线路。

- CN2 GT：省级和出国节点为 202.97（163 骨干网）开头，国际骨干节点有若干个 59.43（CN2 骨干网）开头的节点。在出国线路上，比单纯的 163 稍强，相比 CN2 GIA 性价比要高。
- CN2 GIA：省级、出国、国际骨干节点均 59.43 开头，全程 CN2。理论上在出国线路上速度最快最稳，但是价格也相对偏高。

## 光缆或海缆

有时会看到 NCP、TPE、APCN2、APG 等缩写，这些都是海底光缆系统，是物理意义上的线路，即“网线”。

而我们需要关心的是 ASN（自治系统编号）对应的“网络架构线路”。

## 其他相关概念

ASN 归属于各个公司或组织，包括 ISP、大型企业、数据中心、云服务提供商、教育机构以及 CDN 提供商等，这些公司或组织可能向外租售自己的服务，也可能仅服务于内部。

- ISP：互联网服务供应商（Internet Service Provider）
    - 指为用户提供互联网接入、信息服务和增值服务的公司或组织。提供拨号上网、DSL、光纤、宽带等多种连接方式，并可能提供电子邮件、网页托管等附加服务。
    - 如电信、联通、移动这些公司。
- VPS：虚拟专用服务器（Virtual private server）
    - 是一种通过虚拟化技术将单个物理机划分为多个独立的虚拟机的托管解决方案。每个 VPS 都拥有自己的操作系统、资源（如CPU、内存、存储）和网络带宽，能够独立运行和管理。虚拟化技术包括虚拟机技术和容器技术。
    - 虚拟机技术：KVM、VMware、Hyper-V 等
    - 容器技术：Docker、Podman 等
- VPS 服务商：
    - 是指提供 VPS 托管服务的公司或组织。
    - 阿里云、亚马逊云、谷歌云、搬瓦工等。
- CDN：內容分发网络（Content Delivery Network 或 Content Distribution Network）
    - 是一个由分布在不同地理位置的服务器组成的网络系统。通过将内容缓存到离用户更近的地方，从而加速内容的交付。
- CDN 服务商：
    - 提供 CDN 服务的公司或组织。
    - 如 Cloudflare，以及阿里云、亚马逊云等云服务厂商。

