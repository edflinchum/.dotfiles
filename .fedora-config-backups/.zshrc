######################################################################
#                          ZSH configuration                         #
######################################################################

# Print some system information when the shell is first started
# echo $USER@$HOST  $(uname -srm) $(lsb_release -rcs)
neofetch

######################################################################
#                             ZSH theming                            #
######################################################################
## Theming section
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

### Load colors
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done

### Set Colors to use in the script
# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

### Set prompt
# Maia prompt from Manjaro
#PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " 

# Default prompt from Anarchy Linux
# PR_NO_COLOR="%{$terminfo[sgr0]%}"
# PS1="[%(!.${PR_RED}%n.$PR_LIGHT_YELLOW%n)%(!.${PR_LIGHT_YELLOW}@.$PR_RED@)$PR_NO_COLOR%(!.${PR_LIGHT_RED}%U%m%u.${PR_LIGHT_GREEN}%U%m%u)$PR_NO_COLOR:%(!.${PR_RED}%2c.${PR_BLUE}%2c)$PR_NO_COLOR]%(?..[${PR_LIGHT_RED}%?$PR_NO_COLOR])%(!.${PR_LIGHT_RED}#.${PR_LIGHT_GREEN}$) "
# RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"


######################################################################
#                             ZSH options                            #
######################################################################

## Options section
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

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' menu select=1                            # enable menu selection
zstyle ':completion::complete:*' gain-privileges 1              # enables sudo to gain extra privileges for completion
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

## Set variables
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Modules section  
autoload -Uz compinit colors zcalc
compinit -d
colors

## Terminal window title bar prompt
autoload -Uz add-zsh-hook
function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m: %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}
function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m: %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}
if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi


######################################################################
#                        Additional features                         #
######################################################################

## Plugins section

# Use zsh-syntax-highlighting
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use zsh-history-substring-search
source /home/linuxbrew/.linuxbrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  # bind UP and DOWN arrow keys to history substring search
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
  bindkey '^[[A' history-substring-search-up			
  bindkey '^[[B' history-substring-search-down

# Use zsh-autosuggestions
source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Use Fuzzy finder
source /usr/share/fzf/shell/key-bindings.zsh
# source /usr/share/fzf/completion.zsh

# Use Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Use Starship prompt
eval "$(starship init zsh)"


######################################################################
#                              Aliases                               #
######################################################################

# Load aliases
if [[ -r "$HOME/.alias-personal" ]]; then
  source "$HOME/.alias-personal"
fi
