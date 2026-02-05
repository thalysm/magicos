#!/bin/bash
set -e

GPU=$(calamares -g magicos_gpu)

if [[ "$GPU" != "nvidia" ]]; then
  echo "NVIDIA GPU not detected, skipping driver install"
  exit 0
fi

if [[ "$(calamares -g magicos_install_nvidia)" != "true" ]]; then
  exit 0
fi

pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
