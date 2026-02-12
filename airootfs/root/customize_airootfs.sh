#!/usr/bin/env bash
# MagicOS - Airootfs Customization Script
# This script runs during ISO build to customize the live environment

set -e -u

# Set locale
sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

# Set timezone
ln -sf /usr/share/zoneinfo/UTC /etc/localtime

# Enable NetworkManager
systemctl enable NetworkManager

# Enable SDDM (display manager)
systemctl enable sddm

# Enable Bluetooth
systemctl enable bluetooth

# Set executable permissions for MagicOS scripts
chmod +x /usr/local/bin/magicos-setup-glassmorphism
chmod +x /usr/local/bin/magicos-autostart-installer

# Create live user configuration
useradd -m -G wheel,audio,video,optical,storage -s /bin/bash liveuser
echo "liveuser:liveuser" | chpasswd

# Enable sudo for wheel group
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Set hostname
echo "magicos" > /etc/hostname

# Configure hosts file
cat > /etc/hosts << EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   magicos.localdomain magicos
EOF

# Set default shell to bash for liveuser
chsh -s /bin/bash liveuser

echo "✅ MagicOS airootfs customization completed!"
