#!/usr/bin/env sh

alacritty --config-file ~/.config/alacritty/alacritty-preview.toml -e bash -c ' \
  ls /usr/share/alacritty/themes | fzf --cycle --layout=reverse --border --preview-window=wrap --preview \
  "ln -sf /usr/share/alacritty/themes/{} ~/.config/alacritty/theme-preview.toml && ~/.config/alacritty/print_colors.sh" | \
  xargs -I {} ln -sf /usr/share/alacritty/themes/{} ~/.config/alacritty/theme-current.toml \
'
