#!/bin/sh
# src is the path to the directory the script is run from
src=$(realpath "$(dirname $0)")
dest_config="${XDG_CONFIG_HOME:-$HOME/.config}"
dest_data="${XDG_DATA_HOME:-$HOME/.local/share}"
ln_flags="-s -f"
script_name="$(basename $0)"
systemd_user_services="syncthing tldr.timer cmus-update-cache.timer"
vimplug="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"

if [ ! -d "$src" ];then
  echo "$script_name": "$src" does not exist or is not a directory; exit 1
fi

# Create symlinks to all the files in $1 in $2 recursively($1 and $2 ought to be directories)
# Automatically creates necessary subdirectories. Doesn't handle filenames with spaces well
linkfiles () {
  cd "$1" || exit 1
  mkdir -pv $(find . -type d | sed "s|^\./|$2/|")
  find . -type f | sed 's|^\./||' | xargs -I _ ln $ln_flags "$1"/_ "$2"/_
}

linkfiles "$src/.config" "$dest_config"
linkfiles "$src/.local/share" "$dest_data"

ln $ln_flags "$src/.profile" "$HOME"
ln $ln_flags "$src/.mkshrc" "$HOME"
ln $ln_flags "$src/bin" "$HOME"

mkdir -p "$HOME/usr/vid" "$HOME/var/bak" "$HOME/var/mnt" "$HOME/var/iso" "$HOME/tmp"
for dir in usr/notes usr/music usr/doc usr/img src;do
  mkdir -p $HOME/sync/$(basename "$dir")
  if [ -h "$HOME/$dir" ] && [ "$(readlink $HOME/$dir)" = "$HOME/sync/$(basename $dir)" ];then
    true
  elif [ -h "$HOME/$dir" ];then
    ln -sfT $HOME/sync/$(basename "$dir") "$HOME/$dir"
  else
    ln -siT $HOME/sync/$(basename "$dir") "$HOME/$dir"
  fi
done

echo "Copying files from to /etc. Password may be required"
sudo rsync -r "$src/etc/" /etc

for service in $systemd_user_services;do
  systemctl --user is-enabled "$service" --quiet || systemctl --user enable "$service"
done

# Install vim-plug and plugins for neovim
if [ ! -f "$vimplug" ];then
  curl --fail --location --create-dirs --silent --output "$vimplug" \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
nvim -c ':PlugInstall' -c ':q' -c ':q'

if ! grep -e "$USER" /etc/passwd | grep -q "/bin/mksh";then
  chsh -s /bin/mksh
fi

if ! grep -q $HOME/tmp /etc/fstab;then
  echo "Adding tmpfs mount on $HOME/tmp to /etc/fstab. Password may be required"
  printf "tmpfs\t$HOME/tmp\ttmpfs\trw,nodev,nosuid\t0\t0\n" | sudo tee -a /etc/fstab
fi

if lsmod | grep -wq "^pcspkr";then
  echo "Removing pcspkr(beep) module. Password may be required"
  echo blacklist pcspkr | sudo tee /etc/modprobe.d/nobeep.conf
fi

# Run scripts that are not part of this repo
if [ -x "$HOME/src/scripts/drive.sh" ];then
  "$HOME/src/scripts/drive.sh"
fi
