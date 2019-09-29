#!/bin/sh
# Requires fd
src=$(realpath "$(dirname $0)")/.config
dest="${XDG_CONFIG_HOME:-$HOME/.config}"
ln_opts="-s -f"
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
fd --hidden --type d --exec-batch mkdir -p "$dest"/{}
fd --hidden --type f --exec ln $ln_opts "$src"/{} "$dest"/{}
cd "$OLDPWD"
