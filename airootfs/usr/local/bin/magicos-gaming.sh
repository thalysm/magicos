#!/bin/bash
set -e

[[ "$(cat /tmp/magicos/gaming)" != "true" ]] && exit 0

pacman -S --noconfirm steam lutris gamemode mangohud
