# Homebrew
if (( ! $+commands[brew] )); then
  brew_paths=($(echo {{/home/linuxbrew,$HOME}/.linuxbrew/,/opt/homebrew/{,s},/usr/{,s,local/{,s}},/{,s}}bin/brew))
  for brew_path in $brew_paths; do
    if test -x $brew_path; then
      eval $($brew_path shellenv)
      break
    fi
  done
fi

# Homebrew completions
if [ -d "$HOMEBREW_PREFIX/share/zsh/site-functions" ]; then
  fpath+=("$HOMEBREW_PREFIX/share/zsh/site-functions")
fi

# Add private bin folders to PATH
typeset -U PATH path
if [ -d "$HOME/bin" ]       ; then path=("$HOME/bin"        "$path[@]"); fi
if [ -d "$HOME/.local/bin" ]; then path=("$HOME/.local/bin" "$path[@]"); fi
export PATH

# Environment variables
export LESSHISTFILE=-
