# CachyOS Kernel znver4 for Fedora

This repository provides **kernel-cachyos-znver4** — a CachyOS kernel optimized for AMD Zen 4/5 CPUs (`znver4` microarchitecture), built with GCC (no LTO).

## Original Repository

Based on: [CachyOS/copr-linux-cachyos](https://github.com/CachyOS/copr-linux-cachyos)

## Kernel Details

- **Name**: `kernel-cachyos-znver4`
- **Scheduler**: BORE (sched-ext support)
- **Microarchitecture**: `znver4` (AMD Zen 4/5)
- **Compiler**: GCC
- **ISA Level**: x86-64-v4 + Zen 4/5 specific instructions (AVX-512, clzero, mwaitx, vaes, gfni, etc.)
- **Hz tick**: 1000

## Features

- Cachy Sauce - scheduler tweaks and improvements
- BORE scheduler with sched-ext support
- AMD P-State Preferred Core, AMD CPB Switch
- Latest ZSTD patchset
- BBRv3 tcp_congestion_control
- v4l2loopback modules included
- Cherry picked patches from Clear Linux
- Backported patches from linux-next

## Build System

Automated build via GitHub Actions + COPR:

- Checks latest CachyOS/linux tag daily
- Builds SRPM on GitHub Actions
- Full kernel compilation on COPR servers

## Installation

```bash
# Enable COPR repository
sudo dnf copr enable itotm/cachyos-kernel-znver4

# Install kernel
sudo dnf install kernel-cachyos-znver4 kernel-cachyos-znver4-devel-matched
```

### Verify CPU support

```bash
/lib64/ld-linux-x86-64.so.2 --help | grep "znver4"
```

## Development

Spec file: `sources/kernel-cachyos-bore/kernel-cachyos.spec`

Build locally:

```bash
./build-kernel-znver4.sh
```

## Credits

- [CachyOS](https://cachyos.org)
- [CachyOS/linux](https://github.com/CachyOS/linux)
- [CachyOS/copr-linux-cachyos](https://github.com/CachyOS/copr-linux-cachyos)
