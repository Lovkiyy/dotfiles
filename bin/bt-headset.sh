#!/bin/sh
MAC_ADDR="78:44:05:B0:29:9F"
bluetoothctl power on
if [ -z "$(pgrep pulseaudio)" ]; then
  pulseaudio -D
fi
bluetoothctl connect $MAC_ADDR
