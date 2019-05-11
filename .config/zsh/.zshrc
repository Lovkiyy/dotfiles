# Path to my oh-my-zsh installation.
export ZSH="$HOME/src/oh-my-zsh"

ZSH_THEME=agnoster
DEFAULT_USER=archie
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

# Uncomment to disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
)

autoload -U compaudit compinit
compinit -u -C -d

bindkey -e

setopt correct_all

setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt hist_verify
setopt share_history

setopt prompt_subst
# Menu completion
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

source $HOME/.config/zsh/agnoster.zsh-theme
source $HOME/.config/zsh/functions

#source "$ZSH/oh-my-zsh.sh"

# Some addons
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp)"
source /usr/share/doc/fzf/key-bindings.zsh
source /usr/share/doc/fzf/completion.zsh


# CDPATH for autocompletion
export CDPATH=$HOME

export DOTDIR="$HOME/.config/zsh"
source $DOTDIR/alias

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  startx
fi
