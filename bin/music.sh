#!/bin/sh
# Prints track that is currently played by cmus
music () {
  info="$(cmus-remote -Q 2> /dev/null)"
  if [ -z "$info" ];then
    exit 1
  fi
  artist="$(echo "$info" | grep 'tag artist ' | cut -d " " -f 3-)"
  title="$(echo "$info" | grep title | cut -d " " -f 3-)"
  status="$(echo "$info" | sed 1q | awk '{print $2}')"

  duration="$(echo "$info" | grep duration | awk '{print $2}')"
  position="$(echo "$info" | grep position | awk '{print $2}')"

  if [ "$duration" ] && [ "$duration" -ge 0 ]; then
    pos_minutes=$(printf "%02d" $((position / 60)))
    pos_seconds=$(printf "%02d" $((position % 60)))

    dur_minutes=$(printf "%02d" $((duration / 60)))
    dur_seconds=$(printf "%02d" $((duration % 60)))

    info_string="$pos_minutes:$pos_seconds/$dur_minutes:$dur_seconds"
  fi
  info_string="$artist - $title | $info_string"
  if [ $status = "playing" ];then
    echo $info_string
  elif [ $status = "paused" ];then
    echo "$info_string "
  elif [ $status = "stopped" ];then
    echo ""
  fi
}

music
