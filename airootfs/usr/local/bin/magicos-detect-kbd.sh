#!/bin/bash
# MagicOS Keyboard Auto-Detection Script
# Attempts to set the correct keyboard layout based on available info

# 1. Check if a layout is already set by kernel parameters
KBD_LAYOUT=$(cat /proc/cmdline | grep -oP 'xkblayout=\K[^ ]+')

if [ -n "$KBD_LAYOUT" ]; then
    echo "Using layout from kernel parameters: $KBD_LAYOUT"
    localectl set-x11-keymap "$KBD_LAYOUT"
    exit 0
fi

# 2. Heuristic: If system language is PT-BR, default to br-abnt2
if [[ "$LANG" == *"pt_BR"* ]]; then
    echo "Portuguese locale detected. Setting layout to br"
    localectl set-x11-keymap br
    exit 0
fi

# 3. GeoIP Check (Optional, but "Magic")
# If we have internet, we can check the country
if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
    COUNTRY=$(curl -s https://ipapi.co/country/)
    if [ "$COUNTRY" == "BR" ]; then
        echo "Brazil detected via IP. Setting layout to br"
        localectl set-x11-keymap br
        exit 0
    fi
fi

# 4. Default Fallback
# If we are here, we couldn't be sure, but let's assume 'br' for this user's project
# Or just leave it as is.
echo "No definitive layout detected. Defaulting to br for MagicOS experience."
localectl set-x11-keymap br
