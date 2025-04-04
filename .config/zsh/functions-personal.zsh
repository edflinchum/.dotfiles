######################################################################
#                             Functions                              #
######################################################################

# Git wrapper for .dotfiles bare repo when in home folder unless in a different git work tree
git() {
    if [[ "$1" != clone && "$PWD" =~ "$HOME" && ! $(command git rev-parse --is-inside-work-tree) ]] &>/dev/null; then
        command git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
    else
        command git "$@"
    fi
}

# Alias for git using .dotfiles bare repo that runs status if no arguments provided
dot() {
    if test "$#" -eq 0; then
        command git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" status
    else
        command git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
    fi
}

# Cleanup local git branches that are no longer found on remote side
git_branch_cleanup() {
    git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}

# Package manager independent update
update () {
    if [ -e /etc/os-release ] ; then
        source /etc/os-release
        case $ID in
            arch | endeavouros)
              if command -v paru &>/dev/null
                then paru -Syu
                else sudo pacman -Syu
              fi ;;
            debian | ubuntu)
              if command -v nala &>/dev/null
                then sudo nala upgrade
                else sudo apt update && sudo apt upgrade
              fi ;;
            fedora | ultramarine)
              sudo dnf upgrade ;;
            *leap)
              sudo zypper update ;;
            *tumbleweed)
              sudo zypper dist-upgrade ;;
            *)
              echo "Unable to determine which package manager to use for updates" ;;
        esac
    else
        echo "Unable to determine which package manager to use for updates"
    fi
}

# Update packages from all sources
upall () {
    update
    if command -v flatpak  &>/dev/null; then printf "\n\n*** Flatpak update ***\n\n" ; flatpak update ; fi
    if command -v pacstall &>/dev/null; then printf "\n\n*** Pacstall update ***\n\n"; pacstall -Up   ; fi
    if command -v brew     &>/dev/null; then printf "\n\n*** Homebrew update ***\n\n"; brew upgrade   ; fi
}

# Colormap
colormap() {
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# Find a file with a pattern in name:
ff()
{
    find . -type f -iname '*'"$*"'*' -ls ;
}

# Creates an archive (*.tar.gz) from given directory.
maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
makezip() { zip -r "${1%%/}.zip" "$1" ; }

mcd () {
    mkdir -p $1
    cd $1
}

# Get IP address
my_ip()
{
    curl ifconfig.co
}

my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

# Get current host related info
sys_info()
{
    echo -e "\n${BRed}System Informations:$NC " ; uname -a
    echo -e "\n${BRed}Online User:$NC " ; w -hs | cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Date :$NC " ; date
    echo -e "\n${BRed}Server stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Public IP Address :$NC " ; my_ip
    echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
    echo -e "\n${BRed}CPU info :$NC "; cat /proc/cpuinfo ;
    echo -e "\n"
}
