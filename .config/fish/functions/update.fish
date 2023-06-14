function update --description "Package manager independent update"
  set -l ID (grep -s ^ID= /etc/os-release)

  switch $ID

    case '*arch'
      if type -q paru
        paru -Syu --noconfirm
      else
        sudo pacman -Syu
      end

    case '*debian' '*ubuntu'
      if type -q nala
        sudo nala upgrade
      else
        sudo apt update; and sudo apt upgrade
      end

    case '*fedora' '*ultramarine'
      sudo dnf upgrade

    case '*leap'
      sudo zypper update

    case '*tumbleweed'
      sudo zypper dist-upgrade

    case '*'
      echo "Unable to determine which package manager to use for updates"

  end

end
