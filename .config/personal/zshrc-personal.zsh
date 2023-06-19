######################################################################
#                          ZSH configuration                         #
######################################################################

# Additional options and completions
setopt nobeep
setopt completealiases
compdef dot=git

# Print some system information when the shell is first started
if   (( $+commands[fastfetch] )); then fastfetch
elif (( $+commands[neofetch]  )); then neofetch
else echo $USER@$HOST  $(uname -srm)  $((( $+commands[lsb_release] )) && lsb_release -rcs)
fi

# Use micro as default editor
if (( $+commands[micro] )); then
  export EDITOR=$(command -v micro)
  export VISUAL=$EDITOR
fi

# Do not expand these aliases using omz globalias plugin
GLOBALIAS_FILTER_VALUES=(
  cp
  egrep
  fgrep
  gh
  grep
  lg
  ll
  ls
  lt
  mv
  rm
  which
)

# Use 1password cli and plugins
if (( $+commands[op] )); then
  eval "$(op completion zsh)"; compdef _op op
  if [ -f  ~/.config/op/plugins.sh ]; then
    source ~/.config/op/plugins.sh
  fi
fi
