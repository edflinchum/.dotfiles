abbr -a -- cd.. 'cd ..'
abbr -a -- cls clear
abbr -a -- cp 'cp -iv'
abbr -a -- df 'df -hT'
abbr -a -- dot 'git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
abbr -a -- dots 'git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" status'
abbr -a -- du 'du -ach | sort -h'
abbr -a -- egrep 'egrep --color=auto'
abbr -a -- fgrep 'fgrep --color=auto'
abbr -a -- free 'free -mt'
abbr -a -- gbc git_branch_cleanup
abbr -a -- jctl 'journalctl -p 3 -xb'
abbr -a -- k kubectl
abbr -a -- kctx kubectx
abbr -a -- kcu 'kubectl config unset current-context'
abbr -a -- kns kubens
abbr -a -- mkdir 'mkdir -pv'
abbr -a -- mv 'mv -iv'
abbr -a -- psa 'ps auxf'
abbr -a -- rm 'rm -Iv'
abbr -a -- spta 'starship toggle aws'
abbr -a -- sptg 'starship toggle gcloud'
abbr -a -- sptz 'starship toggle azure'
abbr -a -- sr 'sudo reboot'
abbr -a -- ssn 'sudo shutdown now'
abbr -a -- t 'tail -f'
abbr -a -- wget 'wget -c'

if type -q apt
  abbr -a -- upall 'sudo apt update; and sudo apt upgrade; and brew upgrade'
  abbr -a -- update 'sudo apt update; and sudo apt upgrade'
end
if type -q nala
  abbr -a -- upall 'sudo nala upgrade; and brew upgrade'
  abbr -a -- update 'sudo nala upgrade'
end
if type -q dnf
  abbr -a -- upall 'sudo dnf upgrade; and brew upgrade'
  abbr -a -- update 'sudo dnf upgrade'
end
if type -q pacman
  abbr -a -- upall 'sudo pacman -Syyu; and brew upgrade'
  abbr -a -- update 'sudo pacman -Syyu'
end
if type -q paru
  abbr -a -- upall 'paru -Syu --noconfirm; and brew upgrade'
  abbr -a -- update 'paru -Syu --noconfirm'
end
