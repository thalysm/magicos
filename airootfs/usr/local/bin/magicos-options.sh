#!/bin/bash

echo "MagicOS optional features setup"

zen=$(zenity --checklist \
  --title="MagicOS Options" \
  --text="Choose optional components:" \
  --column="Install" --column="Feature" \
  TRUE "Zen Browser" \
  FALSE "NVIDIA Drivers" \
  FALSE "Development Tools" \
  FALSE "Gaming Tools" \
  --width=400 --height=300)

mkdir -p /tmp/magicos

[[ "$zen" == *"Zen Browser"* ]] && echo "true" > /tmp/magicos/zen || echo "false" > /tmp/magicos/zen
[[ "$zen" == *"NVIDIA Drivers"* ]] && echo "true" > /tmp/magicos/nvidia || echo "false" > /tmp/magicos/nvidia
[[ "$zen" == *"Development Tools"* ]] && echo "true" > /tmp/magicos/dev || echo "false" > /tmp/magicos/dev
[[ "$zen" == *"Gaming Tools"* ]] && echo "true" > /tmp/magicos/gaming || echo "false" > /tmp/magicos/gaming
