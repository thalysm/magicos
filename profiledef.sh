#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="magicos"
iso_label="MAGICOS"
iso_publisher="MagicOS"
iso_application="MagicOS - Arch-based"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux'
           'uefi.grub')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"


airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/magicos-detect-gpu.sh"]="0:0:755"
  ["/usr/local/bin/magicos-detect-kbd.sh"]="0:0:755"
  ["/usr/local/bin/magicos-dev.sh"]="0:0:755"
  ["/usr/local/bin/magicos-gaming.sh"]="0:0:755"
  ["/usr/local/bin/magicos-launcher.sh"]="0:0:755"
  ["/usr/local/bin/magicos-nvidia.sh"]="0:0:755"
  ["/usr/local/bin/magicos-options.sh"]="0:0:755"
  ["/usr/local/bin/magicos-postinstall.sh"]="0:0:755"
)

