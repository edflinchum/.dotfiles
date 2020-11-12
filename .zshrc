#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal
