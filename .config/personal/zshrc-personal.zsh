######################################################################
#                          ZSH configuration                         #
######################################################################

# Additional options and completions
setopt autocd                                                   # if only directory path is entered, cd there
setopt completealiases                                          # make the alias a distinct command for completion purposes
setopt extendedglob                                             # extended globbing. Allows using regular expressions with *
setopt globdots                                                 # don't require a leading . in a filename to be matched
setopt nocaseglob                                               # case insensitive globbing
setopt numericglobsort                                          # sort filenames numerically when it makes sense
setopt rcexpandparam                                            # array expansion with parameters
setopt appendhistory                                            # immediately append history instead of overwriting
setopt histignorealldups                                        # if a new command is a duplicate, remove the older one
setopt correct                                                  # auto correct mistakes
setopt nocheckjobs                                              # don't warn about running processes when exiting
setopt nobeep                                                   # no beep
setopt promptsubst                                              # enable substitution for prompt

compdef dot=git

# Use micro as default editor
if (( $+commands[micro] )); then
  export EDITOR=$(command -v micro)
  export VISUAL=$EDITOR
fi

# Use 1password cli and plugins
if (( $+commands[op] )); then
  eval "$(op completion zsh)"; compdef _op op
  if [ -f  ~/.config/op/plugins.sh ]; then
    source ~/.config/op/plugins.sh
  fi
fi

# Print some system information when the shell is first started
if   (( $+commands[fastfetch] )); then fastfetch
elif (( $+commands[neofetch]  )); then neofetch
else echo $USER@$HOST  $(uname -srm)  $((( $+commands[lsb_release] )) && lsb_release -rcs)
fi
