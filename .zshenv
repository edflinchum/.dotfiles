#
# ~/.zshenv
#

## Variables

typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

export HOSTNAME="$(hostname)"

#export EDITOR=/usr/bin/nano
#export VISUAL=/usr/bin/nano

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

export MOZ_ENABLE_WAYLAND=1