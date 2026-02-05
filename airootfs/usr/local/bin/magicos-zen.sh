#!/bin/bash
set -e

[[ "$(cat /tmp/magicos/zen)" != "true" ]] && exit 0

pacman -Sy --noconfirm git base-devel

user=$(ls /home | head -n1)

sudo -u "$user" bash <<EOF
cd /tmp
git clone https://aur.archlinux.org/zen-browser-bin.git
cd zen-browser-bin
makepkg -si --noconfirm
EOF
