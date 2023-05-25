abbr -a -g -- cd.. 'cd ..'
abbr -a -g -- cls clear
abbr -a -g -- cp 'cp -iv'
abbr -a -g -- df 'df -hT'
abbr -a -g -- dots 'dot status'
abbr -a -g -- du 'du -ach | sort -h'
abbr -a -g -- egrep 'egrep --color=auto'
abbr -a -g -- fgrep 'fgrep --color=auto'
abbr -a -g -- free 'free -mt'
abbr -a -g -- gbc git_branch_cleanup
abbr -a -g -- jctl 'journalctl -p 3 -xb'
abbr -a -g -- k kubectl
abbr -a -g -- kctx kubectx
abbr -a -g -- kcu 'kubectl config unset current-context'
abbr -a -g -- kns kubens
abbr -a -g -- mkdir 'mkdir -pv'
abbr -a -g -- mv 'mv -iv'
abbr -a -g -- psa 'ps auxf'
abbr -a -g -- rm 'rm -Iv'
abbr -a -g -- spta 'starship toggle aws'
abbr -a -g -- sptg 'starship toggle gcloud'
abbr -a -g -- sptz 'starship toggle azure'
abbr -a -g -- sr 'sudo reboot'
abbr -a -g -- ssn 'sudo shutdown now'
abbr -a -g -- t 'tail -f'
abbr -a -g -- wget 'wget -c'

if type -q apt
  abbr -a -g -- upall 'sudo apt update; and sudo apt upgrade; and brew upgrade'
  abbr -a -g -- update 'sudo apt update; and sudo apt upgrade'
end
if type -q nala
  abbr -a -g -- upall 'sudo nala upgrade; and brew upgrade'
  abbr -a -g -- update 'sudo nala upgrade'
end
if type -q dnf
  abbr -a -g -- upall 'sudo dnf upgrade; and brew upgrade'
  abbr -a -g -- update 'sudo dnf upgrade'
end
if type -q pacman
  abbr -a -g -- upall 'sudo pacman -Syyu; and brew upgrade'
  abbr -a -g -- update 'sudo pacman -Syyu'
end
if type -q paru
  abbr -a -g -- upall 'paru -Syu --noconfirm; and brew upgrade'
  abbr -a -g -- update 'paru -Syu --noconfirm'
end
