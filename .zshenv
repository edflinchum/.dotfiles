# Homebrew
if (( ! $+commands[brew] )); then
  if   test -x /home/linuxbrew/.linuxbrew/bin/brew; then
    BREW_FILE="/home/linuxbrew/.linuxbrew/bin/brew"
  elif test -x /opt/homebrew/bin/brew; then
    BREW_FILE="/opt/homebrew/bin/brew"
  elif test -x /usr/local/bin/brew; then
    BREW_FILE="/usr/local/bin/brew"
  elif test -x $HOME/.linuxbrew/bin/brew; then
    BREW_FILE="$HOME/.linuxbrew/bin/brew"
  else
    return
  fi
  eval $($BREW_FILE shellenv)
  unset BREW_FILE
fi
if [ -z "$HOMEBREW_PREFIX" ]; then
  export HOMEBREW_PREFIX="$(brew --prefix)"
fi
if [ -d "$HOMEBREW_PREFIX/share/zsh/site-functions" ]; then
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
export LESSHISTFILE=-
