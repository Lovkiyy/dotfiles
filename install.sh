#!/bin/sh
# src is the path to the directory the script is run from
src=$(realpath "$(dirname $0)")
dest_config="${XDG_CONFIG_HOME:-$HOME/.config}"
dest_data="${XDG_DATA_HOME:-$HOME/.local/share}"
ln_flags="-s -f -v"
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

# Create symlinks to all the files in $1 in $2 recursively($1 and $2 are directories)
# Automatically creates necessary subdirectories. It doesn't handle filenames with spaces well
linkfiles () {
  cd "$1"
  mkdir -pv $(find -type d | sed "s|^\./|$2/|")
  find -type f | sed 's|^\./||' | xargs -I _ ln $ln_flags "$1"/_ "$2"/_
}

linkfiles "$src/.config" "$dest_config"
linkfiles "$src/.local/share" "$dest_data"
