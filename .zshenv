# Environment variables
GLOBALIAS_FILTER_VALUES=(cp egrep fgrep gh grep lg ll ls lt mv rm which 1 2 3 4 5 6 7 8 9)
SHOW_AWS_PROMPT=false
skip_global_compinit=1

export LESSHISTFILE=-
export FZF_DEFAULT_OPTS='--cycle --layout=reverse --border --height=40% --preview-window=wrap --marker="*"'
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

if (( $+commands[micro] )); then
  MICRO_TRUECOLOR=1
  export EDITOR=$(command -v micro)
  export VISUAL=$EDITOR
fi


# Load brew
if (( ! $+commands[brew] )); then
  brew_paths=( {{/home/linuxbrew,$HOME}/.linuxbrew/,/opt/homebrew/{,s},/usr/{,s,local/{,s}},/{,s}}bin/brew(N) )
  if [ -n "$brew_paths" ]; then
    eval $(${brew_paths[1]} shellenv)
  fi
fi
# Load brew completions
if (( $+commands[brew] )); then
  if [ -z "$HOMEBREW_PREFIX" ]; then
    eval $(brew shellenv)
  fi
  fpath+=( "$HOMEBREW_PREFIX/share/zsh/site-functions"(/N) )
fi


# Add folders to PATH
typeset -U PATH path FPATH fpath
path=( $HOME{/.local,}/bin(/N) $path[@] )
export PATH
