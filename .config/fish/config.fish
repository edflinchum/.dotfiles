#
# ~/.config/fish/config.fish
#
# -------------------------------------------------------

# Homebrew completions
if test -d "$HOMEBREW_PREFIX/share/fish/completions"
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end
if test -d "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
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

# Workaround for git completions taking too long due to searching untracked files in entire home directory
# This is in addition to the custom modifications made to the default git completions file
complete git -n '__fish_git_using_command add' --force-files

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
