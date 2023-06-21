######################################################################
#                         BASH configuration                         #
######################################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

######################################################################
#                        Additional features                         #
######################################################################

# Use micro as default editor
if type micro &>/dev/null; then
  export EDITOR=$(command -v micro)
  export VISUAL=$EDITOR
fi

# Load starship prompt
if type starship &>/dev/null; then
  eval "$(starship init bash)"
fi

# Print some system information when the shell is first started
if type fastfetch &>/dev/null; then
  fastfetch
elif type neofetch &>/dev/null; then
  neofetch
else
  echo $USER@$HOST  $(uname -srm)  $(command -v lsb_release &>/dev/null && lsb_release -rcs)
fi

######################################################################
#                              Aliases                               #
######################################################################

# Load personal aliases and functions
if [ -r  ~/.config/personal/alias-personal.zsh ]; then
  source ~/.config/personal/alias-personal.zsh
fi
if [ -r  ~/.config/personal/functions-personal.zsh ]; then
  source ~/.config/personal/functions-personal.zsh
fi
