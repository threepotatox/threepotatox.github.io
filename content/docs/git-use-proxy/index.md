+++
title = "Git 使用代理"
weight = 14
# bookFlatSection = false
# bookToc = true
# bookHidden = false
# bookCollapseSection = false
# bookComments = false
# bookSearchExclude = false
+++

> 注：
>
> 建议使用 **配置文件** 的方式
>
> 因为如果要使用 `引号` 处理某些参数中的 `空格` 或 `转义字符` 时，参考工具对应的文档手册，使用配置文件配置会更简单更通用。
>
> 执行命令时，`"`、`'`、<code>&grave;</code> 三种引号和 `字符的转义` 等，在 Linux Shell（如 Bash）、Windows PowerShell、Windows cmd 中的解析方式完全不同，需要格外注意

[Git 文档](https://git-scm.com/docs)

## Git HTTP/S 协议使用代理

Git 使用 HTTP/S 协议时，可以使用 `http.proxy` 参数配置代理地址：

{{% tabs %}}

{{% tab "方式一：Git 配置文件（推荐）" %}}

```bash
# [Git 文档 - 配置文件格式](https://git-scm.com/docs/git-config/zh_HANS-CN#_%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
# Git --global 配置文件路径
# ~/.gitconfig

# 添加到配置文件末尾
# socks5://127.0.0.1:10808：代理地址，替换为自己的即可使用
# [Git Docs - http.proxy](https://git-scm.com/docs/git-config#Documentation/git-config.txt-httpproxy)
[http]
	proxy = socks5://127.0.0.1:10808
```

{{% /tab %}}

{{% tab "方式二：git config 命令（推荐）（Bash 格式）" %}}

```bash
# 注：虽然是 Bash 格式，但本条命令可以在 Bash、cmd、PowerShell 执行，因为没有涉及转义字符等复杂命令解析

# [Git docs - git-config](https://git-scm.com/docs/git-config)

# socks5://127.0.0.1:10808：代理地址，替换为自己的即可使用

# git config 命令可以设置配置文件的值
# 旧版本用
git config --global http.proxy socks5://127.0.0.1:10808
# 新版本用
git config set --global http.proxy socks5://127.0.0.1:10808

# 取消设置
# 旧版本用
git config --unset --global http.proxy
# 新版本用
git config unset --global http.proxy
```
{{% /tab %}}

{{% tab "方式三：执行单次命令（Bash 格式）" %}}

```bash
# 注：虽然是 Bash 格式，但本条命令可以在 Bash、cmd、PowerShell 执行，因为没有涉及转义字符等复杂命令解析

# [Git docs - git-config](https://git-scm.com/docs/git-config)

# socks5://127.0.0.1:10808：代理地址，替换为自己的即可使用

# Git 执行单次命令时，可用 -c（小写） 参数指定配置文件提供的选项，-c 可添加多次以指定多个参数，指定的键值对 = 等号两边不要有空格
git clone -c http.proxy=socks5://127.0.0.1:2080 https://github.com/threepotatox/threepotatox.github.io.git
```
{{% /tab %}}

{{% /tabs %}}

## Git SSH 协议使用代理

Git 使用 SSH 协议时，git 命令会调用 ssh 命令建立连接，所以有两种方式设置 Git SSH 协议使用代理：

### 1. 设置 SSH 客户端配置文件（**推荐方式**）

可参考本站[SSH 配置 Natcat(nc)/Nmap(ncat) 使用代理](/docs/ssh-configure-netcat_nc_nmap_ncat-to-use-proxy/)。

配置好 SSH 使用代理，这样 git 命令调用 ssh 命令时，ssh 命令就会按照配置文件使用代理。

这种方式，SSH 只需自己管理好代理信息，管理简单方便，同时，不仅 ssh 自己可用，而且 git 及其他命令都可调用 ssh 命令以使用代理，通用性强，所以推荐这种方式。

### 2. 设置 Git 调用 SSH 的参数

Git 使用 SSH 协议时，可以使用 `core.sshCommand` 参数配置调用 SSH 的参数：
- 这种方式更多作为示意参考
- 或某些特殊情况，如没有 SSH 相关文件的操作权限

`core.sshCommand` 原理和 [SSH ProxyCommand](/docs/ssh-configure-netcat_nc_nmap_ncat-to-use-proxy/#ssh-proxycommand-%e7%ae%80%e5%8d%95%e4%bb%8b%e7%bb%8d) 工作原理一致。

2.1 安装并使用 Nmap/Ncat（ncat）

{{% tabs %}}

{{% tab "方式一：Git 配置文件 - ssh ncat" %}}

```bash
# [Git 文档 - 配置文件格式](https://git-scm.com/docs/git-config/zh_HANS-CN#_%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
# Git --global 配置文件路径
# ~/.gitconfig

# 添加到配置文件末尾
# socks5://127.0.0.1:10808：代理地址，替换为自己的即可使用
# [Git Docs - http.proxy](https://git-scm.com/docs/git-config#Documentation/git-config.txt-httpproxy)
[http]
	proxy = socks5://127.0.0.1:10808
[core]
	sshCommand = ssh -o \"ProxyCommand ncat --proxy-type socks5 --proxy 127.0.0.1:10808 %h %p\"
```

{{% /tab %}}

{{% tab "方式二：git config 命令（仅 Bash 格式） - ssh ncat" %}}

```bash
# 注：这里仅 Bash 格式，本条命令仅可在 Bash 执行，因为要转义 " 引号字符
# Windows 可在安装 Git 后，打开 Git Bash 执行命令示例

# [Git docs - git-config](https://git-scm.com/docs/git-config)

# git config 命令可以设置配置文件的值
# 旧版本用
git config --global core.sshCommand "ssh -o \"ProxyCommand ncat --proxy-type socks5 --proxy 127.0.0.1:10808 %h %p\""
# 新版本用
git config set --global core.sshCommand "ssh -o \"ProxyCommand ncat --proxy-type socks5 --proxy 127.0.0.1:10808 %h %p\""

# 取消设置
# 旧版本用
git config --unset --global core.sshCommand
# 新版本用
git config unset --global core.sshCommand
```
{{% /tab %}}

{{% tab "方式三：执行单次命令（仅 Bash 格式） - ssh ncat" %}}

```bash
# 注：这里仅 Bash 格式，本条命令仅可在 Bash 执行，因为要转义 " 引号字符
# Windows 可在安装 Git 后，打开 Git Bash 执行命令示例

# [Git docs - git-config](https://git-scm.com/docs/git-config)

# Git 执行单次命令时，可用 -c（小写） 参数指定配置文件提供的选项，-c 可添加多次以指定多个参数，指定的键值对 = 两边不要有空格
# 仓库地址为 SSH 协议的格式
git clone -c core.sshCommand="ssh -o \"ProxyCommand ncat --proxy-type socks5 --proxy 127.0.0.1:10808 %h %p\"" git@github.com:threepotatox/threepotatox.github.io.git
```
{{% /tab %}}

{{% /tabs %}}

2.2 安装并使用 Netcat（nc）

{{% tabs %}}

{{% tab "方式一：Git 配置文件 - ssh nc" %}}

```bash
# [Git 文档 - 配置文件格式](https://git-scm.com/docs/git-config/zh_HANS-CN#_%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
# Git --global 配置文件路径
# ~/.gitconfig

# 添加到配置文件末尾
# socks5://127.0.0.1:10808：代理地址，替换为自己的即可使用
# [Git Docs - http.proxy](https://git-scm.com/docs/git-config#Documentation/git-config.txt-httpproxy)
[http]
	proxy = socks5://127.0.0.1:10808
[core]
	sshCommand = ssh -o \"ProxyCommand nc -X 5 -x 127.0.0.1:10808 %h %p\"
```

{{% /tab %}}

{{% tab "方式二：git config 命令（仅 Bash 格式） - ssh nc" %}}

```bash
# 注：这里仅 Bash 格式，本条命令仅以在 Bash 执行，因为要转义 " 引号字符
# Windows 可在安装 Git 后，打开 Git Bash 执行命令示例

# [Git docs - git-config](https://git-scm.com/docs/git-config)

# git config 命令可以设置配置文件的值
# 旧版本用
git config --global core.sshCommand "ssh -o \"ProxyCommand nc -X 5 -x 127.0.0.1:10808 %h %p\""
# 新版本用
git config set --global core.sshCommand "ssh -o \"ProxyCommand nc -X 5 -x 127.0.0.1:10808 %h %p\""

# 取消设置
# 旧版本用
git config --unset --global core.sshCommand
# 新版本用
git config unset --global core.sshCommand
```
{{% /tab %}}

{{% tab "方式三：执行单次命令（仅 Bash 格式） - ssh nc" %}}

```bash
# 注：这里仅 Bash 格式，本条命令仅可在 Bash 执行，因为要转义 " 引号字符
# Windows 可在安装 Git 后，打开 Git Bash 执行命令示例

# [Git docs - git-config](https://git-scm.com/docs/git-config)

# Git 执行单次命令时，可用 -c（小写） 参数指定配置文件提供的选项，-c 可添加多次以指定多个参数，指定的键值对 = 两边不要有空格
# 仓库地址为 SSH 协议的格式
git clone -c core.sshCommand="ssh -o \"ProxyCommand nc -X 5 -x 127.0.0.1:10808 %h %p\"" git@github.com:threepotatox/threepotatox.github.io.git
```
{{% /tab %}}

{{% /tabs %}}
