#
# ~/.config/fish/config.fish
#

# -------------------------------------------------------

# Homebrew
if test -d "$HOMEBREW_PREFIX/share/fish/completions"
    set -g fish_complete_path $fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end
if test -d "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
    set -g fish_complete_path $fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
end

# 1password cli
if type -q op
    op completion fish | source
    if test -e ~/.1password/agent.sock
        set -gx SSH_AUTH_SOCK ~/.1password/agent.sock
    end
    if test -e ~/.config/op/plugins.sh
        source ~/.config/op/plugins.sh
    end
end

# Micro
if type -q micro
    set -gx EDITOR $(which micro)
end

# -------------------------------------------------------

# Commands to run in interactive sessions can go here
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

end
