######################################################################
#                          ZSH configuration                         #
######################################################################

# Additional options, completions, and styles
setopt appendhistory            # immediately append history instead of overwriting
setopt autocd                   # if only directory path is entered, cd there
setopt nobeep                   # no beep
setopt nocaseglob               # case insensitive globbing
setopt nocheckjobs              # don't warn about running processes when exiting
setopt completealiases          # make the alias a distinct command for completion purposes
setopt correct                  # auto correct mistakes
setopt extendedglob             # extended globbing. Allows using regular expressions with *
setopt globdots                 # don't require a leading . in a filename to be matched
setopt histignorealldups        # if a new command is a duplicate, remove the older one
setopt numericglobsort          # sort filenames numerically when it makes sense
setopt rcexpandparam            # array expansion with parameters
setopt promptsubst              # enable substitution for prompt

compdef dot=git

zstyle ':bracketed-paste-magic' active-widgets '.self-*'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Use 1password cli and plugins
if (( $+commands[op] )); then
  eval "$(op completion zsh)"; compdef _op op
  if [ -f  ~/.config/op/plugins.sh ]; then
    source ~/.config/op/plugins.sh
  fi
fi

# Print some system information when the shell is first started
if (( $+commands[fastfetch] )); then
  fastfetch
else
  echo $USER@$HOST  $(uname -srm)  $((( $+commands[lsb_release] )) && lsb_release -rcs)
fi
