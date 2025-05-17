#!/usr/bin/env sh

alacritty \
  --config-file ~/.config/alacritty/alacritty-theme-preview.toml \
  --working-directory ~/.config/alacritty \
  --command sh -c '
    load_themes () {
      if [ -d alacritty-theme ]; then
        echo Updating theme list...
        command git -C alacritty-theme pull
      else
        echo Installing themes...
        git clone https://github.com/alacritty/alacritty-theme
        echo
        echo Theme package has been loaded for the first time.
        echo Live theme reloading will not occur until a theme is selected and the terminal is restarted.
      fi
    }

    select_theme () {
      echo Select a new theme...
      ls alacritty-theme/themes |
      fzf --cycle --layout=reverse --border --height=60% --preview-window=wrap,60% --preview "\
        ln -sf alacritty-theme/themes/{} theme-preview.toml
        echo ALACRITTY THEME: {}
        echo
        alacritty-theme/print_colors.sh
      " | xargs -I {} ln -sf alacritty-theme/themes/{} theme.toml
    }

    echo ALACRITTY THEME SELECTOR
    echo
    load_themes
    echo
    select_theme
  '
