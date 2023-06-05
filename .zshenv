# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"

# Environment variables
export FZF_DEFAULT_OPTS='--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
export SHOW_AWS_PROMPT=false
