#!/bin/bash
set -e

[[ "$(cat /tmp/magicos/dev)" != "true" ]] && exit 0

pacman -S --noconfirm base-devel git docker docker-compose
systemctl enable docker
