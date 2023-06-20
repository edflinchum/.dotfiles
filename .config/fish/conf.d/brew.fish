# Homebrew
if not type -q brew
  if test -x /home/linuxbrew/.linuxbrew/bin/brew
    set BREW /home/linuxbrew/.linuxbrew/bin/brew
  else if test -x /opt/homebrew/bin/brew
    set BREW /opt/homebrew/bin/brew
  else if test -x /usr/local/bin/brew
    set BREW /usr/local/bin/brew
  else if test -x $HOME/.linuxbrew/bin/brew
    set BREW $HOME/.linuxbrew/bin/brew
  end
end

if set -q BREW
  $BREW shellenv | source
  set -e BREW
end

# Homebrew completions
if test -d $HOMEBREW_PREFIX/share/fish/completions
  set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end
if test -d $HOMEBREW_PREFIX/share/fish/vendor_completions.d
  set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
end
