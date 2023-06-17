# Homebrew
if not type -q brew
  if      test -x /home/linuxbrew/.linuxbrew/bin/brew
    set BREW_FILE /home/linuxbrew/.linuxbrew/bin/brew
  else if test -x /opt/homebrew/bin/brew
    set BREW_FILE /opt/homebrew/bin/brew
  else if test -x /usr/local/bin/brew
    set BREW_FILE /usr/local/bin/brew
  else if test -x $HOME/.linuxbrew/bin/brew
    set BREW_FILE $HOME/.linuxbrew/bin/brew
  else
    return
  end
  eval ($BREW_FILE shellenv)
  set -e BREW_FILE
  # Homebrew completions
  if test -d $HOMEBREW_PREFIX/share/fish/completions
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
  end
  if test -d $HOMEBREW_PREFIX/share/fish/vendor_completions.d
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
  end
end
