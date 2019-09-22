#!/bin/sh
# TODO: check on files/directories with spaces
src=$(realpath "$(dirname $0)")/.config
dest="${XDG_CONFIG_HOME:-$HOME/.config}"
ln_opts="-s -i -r"
script_name="$(basename $0)"

if [ ! -d $src ];then
  echo $script_name: $src does not exist or is not a directory; exit 1
fi

if [ ! -d $dest ];then
  echo $script_name: $dest does not exist or is not a directory; exit 1
fi

if [ ! -w $dest ];then
  echo $script_name: $dest is not writable; exit 1
fi

dir="$src/*/*"
for i in $dir; do
  destfile="${dest}${i#$src}"
  if [ ! -e $(dirname $destfile) ];then
    mkdir $(dirname $destfile)
  fi
  ln $ln_opts $i $destfile
done
