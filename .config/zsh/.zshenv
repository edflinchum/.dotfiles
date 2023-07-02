## Homebrew
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
  fpath+=( "$HOMEBREW_PREFIX/share/zsh/site-functions"(/N) )
fi

## Environment variables
# Turn off less history file
export LESSHISTFILE=-
# Options for fzf plugin
  FZF_DEFAULT_OPTS='--cycle --layout=reverse --border --height=40% --preview-window=wrap --marker="*"'
# Do not expand these aliases using globalias plugin
  GLOBALIAS_FILTER_VALUES=(cp egrep fgrep gh grep lg ll ls lt mv rm which)
# Turn off rprompt info in aws plugin
  SHOW_AWS_PROMPT=false
# Used by Ubuntu global config
  skip_global_compinit=1

## Add private bin folders to PATH
typeset -U PATH path FPATH fpath
path=( $HOME{/.local,}/bin(/N) $path[@] )
export PATH
