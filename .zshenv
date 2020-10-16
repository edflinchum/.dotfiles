if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.config/alacritty" "$path[@]")
export PATH