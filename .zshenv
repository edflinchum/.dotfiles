typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.config/alacritty" "$path[@]")
export PATH

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'