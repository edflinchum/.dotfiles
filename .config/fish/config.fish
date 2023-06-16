# -------------------------------------------------------
# ~/.config/fish/config.fish
# -------------------------------------------------------

# Homebrew
if type -q brew
else
  if test -x /opt/homebrew/bin/brew
    set BREW_LOCATION "/opt/homebrew/bin/brew"
  else if test -x /usr/local/bin/brew
    set BREW_LOCATION "/usr/local/bin/brew"
  else if test -x /home/linuxbrew/.linuxbrew/bin/brew
    set BREW_LOCATION "/home/linuxbrew/.linuxbrew/bin/brew"
  else if test -x "$HOME/.linuxbrew/bin/brew"
    set BREW_LOCATION "$HOME/.linuxbrew/bin/brew"
  end
  eval ($BREW_LOCATION shellenv)
  set -e BREW_LOCATION
end

# Homebrew completions
if test -d "$HOMEBREW_PREFIX/share/fish/completions"
  set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end
if test -d "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
  set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
end

# Micro
if type -q micro
  set -q EDITOR; or set -gx EDITOR $(which micro)
  set -q VISUAL; or set -gx VISUAL $EDITOR
end

# -------------------------------------------------------
# Commands to run in interactive sessions can go here
# -------------------------------------------------------
if status is-interactive
  # Starship
  if type -q starship
    starship init fish | source
    enable_transience
  end

  # Fastfetch
  if type -q fastfetch
      fastfetch
  end

  # 1password cli
  if type -q op
    op completion fish | source
    if test -e ~/.config/op/plugins.sh
        source ~/.config/op/plugins.sh
    end
  end

  # Workaround for git completions taking too long due to searching untracked files in entire home directory
  # This is in addition to the custom modifications made to the default git completions file
  complete git -n '__fish_git_using_command add' --force-files
end
