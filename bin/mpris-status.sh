#!/bin/sh
PLAYER=cmus
info="$(playerctl -p "$PLAYER" metadata --format '{{artist}} - {{title}}' 2>/dev/null)"
status="$(playerctl -p "$PLAYER" status 2>/dev/null)"
if [ "$status" = "Playing" ];then
  echo " $info"
elif [ "$status" = "Paused" ];then
  echo " $info "
else
  echo ""
fi
