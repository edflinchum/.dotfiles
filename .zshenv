# Homebrew
if (( ! $+commands[brew] )); then
  if   [ -x /opt/homebrew/bin/brew ]; then
    BREW_LOCATION="/opt/homebrew/bin/brew"
  elif [ -x /usr/local/bin/brew ]; then
    BREW_LOCATION="/usr/local/bin/brew"
  elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    BREW_LOCATION="/home/linuxbrew/.linuxbrew/bin/brew"
  elif [ -x "$HOME/.linuxbrew/bin/brew" ]; then
    BREW_LOCATION="$HOME/.linuxbrew/bin/brew"
  else
    return
  fi
  eval "$("$BREW_LOCATION" shellenv)"
  unset BREW_LOCATION
fi

if [ -z "$HOMEBREW_PREFIX" ]; then
  export  HOMEBREW_PREFIX="$(brew --prefix)"
fi

if [  -d  "$HOMEBREW_PREFIX/share/zsh/site-functions" ]; then
  fpath+=("$HOMEBREW_PREFIX/share/zsh/site-functions")
fi

# set PATH so it includes user's private bin if it exists
typeset -U PATH path
if [ -d "$HOME/bin" ]; then
  path=("$HOME/bin" "$path[@]")
fi
if [ -d "$HOME/.local/bin" ]; then
  path=("$HOME/.local/bin" "$path[@]")
fi
export PATH

# Environment variables
export FZF_DEFAULT_OPTS='--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
export SHOW_AWS_PROMPT=false
