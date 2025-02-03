######################################################################
#                         BASH configuration                         #
######################################################################

# Homebrew
if ! type brew &>/dev/null; then
  brew_paths=( {{/home/linuxbrew,$HOME}/.linuxbrew/,/opt/homebrew/{,s},/usr/{,s,local/{,s}},/{,s}}bin/brew )
  for brew_path in ${brew_paths[@]}; do
    if test -x $brew_path; then
      eval $($brew_path shellenv)
      break
    fi
  done
fi

# Homebrew completions
if type brew &>/dev/null; then
  if [ -z "$HOMEBREW_PREFIX" ]; then
    eval $(brew shellenv)
  fi
  if [ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [ -r "${COMPLETION}" ] && source "${COMPLETION}"
    done
  fi
fi

# Add private bin folders to PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Environment variables
export LESSHISTFILE=-

# Use micro as default editor
if type micro &>/dev/null; then
  export EDITOR=$(command -v micro)
  export VISUAL=$EDITOR
fi

# Configure ssh forwarding if using WSL
if [ -r  ~/.config/bash/wsl-ssh-forwarding.bash ]; then
  source ~/.config/bash/wsl-ssh-forwarding.bash
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
if [ -r  ~/.config/zsh/alias-personal.zsh ]; then
  source ~/.config/zsh/alias-personal.zsh
fi
if [ -r  ~/.config/zsh/functions-personal.zsh ]; then
  source ~/.config/zsh/functions-personal.zsh
fi
