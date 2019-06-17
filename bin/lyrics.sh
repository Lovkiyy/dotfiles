#!/bin/ksh
cachedir="$HOME/var/lyrics"
# Lipwalk is off because it hangs for a long time; lyricswiki appends garbage at the end
args="-v 1 -z 10 --write $cachedir --cache $cachedir --from all;-lipwalk;-lyricswiki"
if [ $# = 2 ];then
  glyrc lyrics -a "$1" -t "$2" $args -j 'nvim ":path:"'
  exit 0
fi
artist="$(cmus-remote -Q 2> /dev/null | grep 'tag artist ' | cut -d " " -f 3-)"
title="$(cmus-remote -Q 2> /dev/null | grep title | cut -d " " -f 3-)"
if [ -z "$title" ] || [ -z "$artist" ]; then
  echo $(basename $0): cannot fetch artist or song title
  exit 1
fi
glyrc lyrics -a "$artist" -t "$title" $args -j 'nvim ":path:"'
