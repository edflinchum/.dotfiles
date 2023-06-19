######################################################################
#                         BASH configuration                         #
######################################################################

# Use micro as default editor
if type micro &>/dev/null; then
  export EDITOR=$(command -v micro)
  export VISUAL=$EDITOR
fi

# Environment variables
export LESSHISTFILE=-

######################################################################
#                        Additional features                         #
######################################################################

# Homebrew
if ! type brew &>/dev/null; then
  if   [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    BREW_LOCATION="/home/linuxbrew/.linuxbrew/bin/brew"
  elif [ -x /opt/homebrew/bin/brew ]; then
    BREW_LOCATION="/opt/homebrew/bin/brew"
  elif [ -x /usr/local/bin/brew ]; then
    BREW_LOCATION="/usr/local/bin/brew"
  elif [ -x "$HOME/.linuxbrew/bin/brew" ]; then
    BREW_LOCATION="$HOME/.linuxbrew/bin/brew"
  fi
  if [ -n "$BREW_LOCATION" ]; then
    eval $($BREW_LOCATION shellenv)
    unset BREW_LOCATION
  fi
fi
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [ -r  "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [ -r "${COMPLETION}" ] && source "${COMPLETION}"
    done
  fi
fi

# Load starship prompt
if type starship &>/dev/null; then 
  eval "$(starship init bash)"
fi

# Print some system information when the shell is first started
if type fastfetch &>/dev/null; then
  fastfetch
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
