---
title: "Dell XPS 9575 on Linux Thermal Shutdown"
date: 2018-11-28
tags: ["dell","linux","arch","manjaro"]
---
Recently I purchased a [Dell XPS 15 9575](https://www.dell.com/en-sg/shop/tablets/xps-15-9575/spd/xps-15-9575-2-in-1-laptop/w51795403sgw10). All the reviews warned about it running hotter than a firecracker, but with that much power that's to be expected. What I didn't expect was to suffer from random shutdowns while working from what the BIOS logs as _Thermal Critical Temperature Shutdown_ events.

Manjaro is my Linux OS of choice. I adjusted with all the built-in settings and installed [TLP](https://github.com/linrunner/TLP) to help with the issue. I lowered the perfomance settings to full-time power-save mode. I still suffered the shutdown issues. After more Googling, I discovered that I needed to install [thermald](https://01.org/linux-thermal-daemon/documentation/introduction-thermal-daemon). Since installing and enabling thermald, my overheating issues have went away. I have also increased CPU performance back to performance settings while on AC power.

### Installation on Arch/Manjaro Linux
```bash
sudo pacman -S thermald
sudo systemctl enable thermald.service
sudo systemctl start thermald.service
```
