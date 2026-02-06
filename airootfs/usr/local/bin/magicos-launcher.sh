#!/bin/bash
# MagicOS Calamares Launcher
# Wait for session to be ready
sleep 3

# Grant permissions for root to open windows if on X11
if [ -n "$DISPLAY" ]; then
    xhost +local:root > /dev/null 2>&1
fi

# Run Keyboard Auto-Detection
/usr/local/bin/magicos-detect-kbd.sh

# Run Calamares with the custom configuration
sudo calamares -d /etc/calamares-custom/settings.conf
