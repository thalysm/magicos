#!/bin/bash

GPU_INFO=$(lspci | grep -Ei "VGA|3D")

if echo "$GPU_INFO" | grep -qi "nvidia"; then
  calamares -s magicos_gpu "nvidia"
elif echo "$GPU_INFO" | grep -qi "amd|advanced micro devices"; then
  calamares -s magicos_gpu "amd"
elif echo "$GPU_INFO" | grep -qi "intel"; then
  calamares -s magicos_gpu "intel"
else
  calamares -s magicos_gpu "unknown"
fi
