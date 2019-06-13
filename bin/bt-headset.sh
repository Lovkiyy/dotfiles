#!/bin/sh
bluetoothctl power on
if [ -z "$(pgrep pulseaudio)" ]; then
  pulseaudio -D
fi
bluetoothctl connect 78:44:05:B0:29:9F
