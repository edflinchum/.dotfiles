# -------------------------------------------------------
# ~/.config/fish/config.fish
# -------------------------------------------------------

# Micro
if type -q micro
  set -q EDITOR; or set -gx EDITOR $(command -v micro)
  set -q VISUAL; or set -gx VISUAL $EDITOR
end

# Workaround for git completions taking too long due to searching untracked files in entire home directory
# This is in addition to the custom modifications made to the default git completions file
complete git -n '__fish_git_using_command add' --force-files

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
end
