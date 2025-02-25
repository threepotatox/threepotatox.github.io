+++
title = "Windows 类 Unix 环境简介"
weight = 101
# bookFlatSection = false
# bookToc = true
# bookHidden = false
# bookCollapseSection = false
# bookComments = false
# bookSearchExclude = false
+++

## Windows 系统的类 Unix 环境

Windows 系统的类 Unix 环境是指，在 Windows 平台上，兼容或模拟 Unix/Linux 平台命令和功能的工具集。以在 Windows 系统上提供和 Unix/Linux 系统上一致的命令工具和开发流程。

### MinGW/MinGW-w64

移植的开发工具集合，包括GCC 编译器和 GNU Binutils 开发工具链等在 Win32/64 平台的移植版，并不直接提供完整的类 Unix 环境。

可直接在 Windows 平台用于开发 Windows 应用程序，但也作为开发工具包集成在其他类 Unix 环境中。

- 把 Linux 平台的开发工具（gcc、gdb、make 等命令）移植到了 Windows 平台
- 提供了 Windows API 的支持，编译出的程序可以直接在 Windows 上运行，无需额外的 DLL
- 也可以安装到其他平台，用以开发 Windows 应用
- MinGW-w64 于 2008 左右从 MinGW 分支出来，现独立发展

### Cygwin

Cygwin 旨在提供一个完整的类 Unix 环境。算是发展较早且非常成熟的类 Unix 环境软件之一。

- 可用的类 Unix/Linux 软件包，数量大而全
- 在 Cygwin 开发程序，可以在 Windows 上运行，但程序运行需要依赖 Cygwin 实现的 DLL

### MSYS

MSYS 是从一个比较旧的 Cygwin 版本创建的分支，用于提供基本的类 Unix 环境。

- 目标是小巧，提供基本的类 Unix 命令和工具
- 主要用于辅助 Windows 版 MinGW 进行命令行开发

### MSYS2

MSYS2 是基于现代 Cygwin 和 MinGW-w64，对 MSYS 的独立重写版本，以提供更好的类 Unix 环境体验。

- 目标是与本地 Windows 软件更好的互操作性
- MSYS2 集成了 pacman 包管理器，有活跃的开发者和用户组，拥有大量预编译的软件包

### WSL

适用于 Linux 的 Windows 子系统 (WSL) 是 Windows 的一项功能，可用于在 Windows 计算机上运行 Linux 环境。

- 微软开发提供了 Linux 兼容的内核接口（不包含 Linux 内核代码），然后可以在其上运行 GNU 用户空间
- 无需单独的虚拟机或安装双系统，以直接运行各种 Linux 发行版，例如 Ubuntu、Debian、Kali 等

### WSL 2

使用虚拟化技术在轻量级虚拟机 (Hyper-V) 中运行完整 Linux 内核。

- 拥有完整的 Linux 内核与对 Systemd 的支持
- 本质是在虚拟机中运行的 Linux，和传统虚拟机运行 Linux 相比，WSL 2 和 Windows 无缝集成具有非常好的互操作性
- Windows 10 可用，Windows11 22H2 版本及以上支持镜像网络（Linux 子系统直接使用 Windows 系统的网络命名空间）

> Hyper-V 虚拟机也是 Windows 的一项功能，可以单独使用，但和其他传统虚拟机软件一样，能创建、管理虚拟机以及基本交互操作，没有 WSL 2 无缝集成的体验。
