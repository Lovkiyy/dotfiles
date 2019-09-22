export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH=$HOME/bin:$PATH
export EDITOR=nvim
export BROWSER=qutebrowser
export TERMINAL=alacritty

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export STARDICT_DATA_DIR="$XDG_DATA_HOME"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export _FASD_DATA="$XDG_DATA_HOME/fasd"
export PASSWORD_STORE_DIR="$HOME/usr/pass"
export PASSWORD_CLIP_TIME="120"
export QT_QPA_PLATFORMTHEME=gtk2
export LESSHISTFILE=-

# Less config
export LESS="-R -M"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
