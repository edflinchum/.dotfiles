######################################################################
#                              Aliases                               #
######################################################################

# misc
alias cd..="cd .."
alias cls="clear"

# list files
alias ls="ls --color=auto"                                                      # ls short listing
alias la="ls -AFhl --color=auto --group-directories-first"                      # ls long listing
alias l.="ls -A | egrep '^\.'"                                                  # ls hidden files
alias ll="eza -aghlF --group-directories-first --time-style=long-iso --icons"   # eza long listing
alias lg="eza -aGghlF --group-directories-first --time-style=long-iso --icons"  # eza grid listing
alias lt="eza -aTF --group-directories-first --icons"                           # eza tree listing

# confirm before overwriting files
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -Iv"

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# grep history
alias histg="history | grep"

# processes
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# utilities
alias df="df -hT"                                                # Human-readable sizes
alias du="du -ach | sort -h"
alias free="free -mt"                                            # Show sizes in MB
alias mkdir="mkdir -pv"
alias t="tail -f"
alias wget="wget -c"                                             # continue download

# get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# userlist
alias userlist="cut -d: -f1 /etc/passwd"

# shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# git
alias dots="dot status"
alias gbc=git_branch_cleanup

# kubernetes
alias k=kubectl
alias kctx=kubectx
alias kns=kubens
alias kcu="kubectl config unset current-context"
# short alias to set/show context/namespace (only works for bash and bash-compatible shells, current context to be set before using kn to set namespace)
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

# starship prompt
alias spta="starship toggle aws"
alias sptz="starship toggle azure"
alias sptg="starship toggle gcloud"

# fastfetch
alias f="fastfetch"
