# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Homebrew paths
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

# Homebrew completions
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

# Add private bin folders to PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Environment variables
export LESSHISTFILE=-

# Load personal configs
if [ -f  ~/.config/personal/bashrc-personal.bash ]; then
  source ~/.config/personal/bashrc-personal.bash
fi
