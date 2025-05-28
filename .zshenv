# Set custom location
ZDOTDIR=$HOME/.config/zsh

# Load personal configuration
if [ -r  $ZDOTDIR/.zshenv ]; then
  source $ZDOTDIR/.zshenv
fi
