function upall --description "Update packages from all sources"
  update
    if type -q flatpak
      printf "\n\n*** Flatpak update ***\n\n"
      flatpak update
    end
    if type -q pacstall
      printf "\n\n*** Pacstall update ***\n\n"
      pacstall -Up
    end
    if type -q brew
      printf "\n\n*** Homebrew update ***\n\n"
      brew upgrade
    end
end
