# Add brew location to PATH
if (( ! $+commands[brew] )); then
  if test -x "/home/linuxbrew/.linuxbrew/bin/brew"; then
    BREW_LOCATION="/home/linuxbrew/.linuxbrew/bin/brew"
  elif test -x "/opt/homebrew/bin/brew"; then
    BREW_LOCATION="/opt/homebrew/bin/brew"
  elif test -x "/usr/local/bin/brew"; then
    BREW_LOCATION="/usr/local/bin/brew"
  elif test -x "$HOME/.linuxbrew/bin/brew"; then
    BREW_LOCATION="$HOME/.linuxbrew/bin/brew"
  fi
fi
if [ -n "$BREW_LOCATION" ]; then
  eval $($BREW_LOCATION shellenv)
  unset BREW_LOCATION
  if [ -d "$HOMEBREW_PREFIX/share/zsh/site-functions" ]; then
    fpath+=("$HOMEBREW_PREFIX/share/zsh/site-functions")
  fi
fi

# Add private bin folders to PATH
typeset -U PATH path
if [ -d "$HOME/bin" ]; then
  path=("$HOME/bin" "$path[@]")
fi
if [ -d "$HOME/.local/bin" ]; then
  path=("$HOME/.local/bin" "$path[@]")
fi
export PATH

# Environment variables
export LESSHISTFILE=-

