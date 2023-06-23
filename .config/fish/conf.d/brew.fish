# Homebrew
if not type -q brew
  set -l brew_paths {{/home/linuxbrew,$HOME}/.linuxbrew/, /opt/homebrew/{,s}, /usr/{,s,local/{,s}}, /{,s}}bin/brew
  for brew_path in $brew_paths
    if test -x $brew_path
      $brew_path shellenv | source
      break
    end
  end
end

# Homebrew completions
if type -q brew
  if test -z $HOMEBREW_PREFIX
    brew shellenv | source
  end
  if test -d $HOMEBREW_PREFIX/share/fish/completions
    and not contains $HOMEBREW_PREFIX/share/fish/completions $fish_complete_path
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
  end
  if test -d $HOMEBREW_PREFIX/share/fish/vendor_completions.d
    and not contains $HOMEBREW_PREFIX/share/fish/vendor_completions.d $fish_complete_path
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
  end
end
