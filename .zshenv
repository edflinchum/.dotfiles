# Homebrew
if (( ! $+commands[brew] )); then
  brew_paths=( {{/home/linuxbrew,$HOME}/.linuxbrew/,/opt/homebrew/{,s},/usr/{,s,local/{,s}},/{,s}}bin/brew(N) )
  if [ -n "$brew_paths" ]; then
    eval $(${brew_paths[1]} shellenv)
  fi
fi

# Homebrew completions
if (( $+commands[brew] )); then
  if [ -z "$HOMEBREW_PREFIX" ]; then
    eval $(brew shellenv)
  fi
  fpath+=( "$HOMEBREW_PREFIX/share/zsh/site-functions"(-/N) )
fi

# Add private bin folders to PATH
typeset -U PATH path FPATH fpath
path=( $HOME{/.local,}/bin(-/N) $path[@] )

# Environment variables
skip_global_compinit=1
export LESSHISTFILE=-
