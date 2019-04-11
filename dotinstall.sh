#!/bin/sh
src="$HOME/src/dotfiles/.config"
destdir="$HOME/.config"
opts="-s -i"

if [ ! -d $destdir ]
  then
    echo $destdir does not exist; exit 1
fi

for i in $(find "$src" -maxdepth 1 -mindepth 1)
  do
    if [ -f $i ]
      then
        ln $opts -t $destdir $i
    elif [ -d $i ]
      then
        current="$destdir/$(basename $i)"
        mkdir -p $current
        for l in $(find $i -mindepth 1)
          do
            ln $opts -t $current $l
        done
  fi
done
