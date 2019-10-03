#!/bin/sh
# Script doesn't handle filenames with spaces well
src=$(realpath "$(dirname $0)")/.config
dest="${XDG_CONFIG_HOME:-$HOME/.config}"
ln_opts="-s -f -v"
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

cd "$src"
mkdir -pv $(find -type d | sed "s|^\./|$dest/|")
find -type f | sed 's|^\./||' | xargs -I _ ln $ln_opts "$src"/_ "$dest"/_
cd "$OLDPWD"
