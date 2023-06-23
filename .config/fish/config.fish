# -------------------------------------------------------
# ~/.config/fish/config.fish
# -------------------------------------------------------

# set PATH so it includes user's private bin if it exists
if test -d $HOME/bin
  fish_add_path -m $HOME/bin
end
if test -d $HOME/.local/bin
  fish_add_path -m $HOME/.local/bin
end

# Fzf
set -q FZF_DEFAULT_OPTS; or set -gx FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=40% --preview-window=wrap --marker="*"'

# Less
set -q LESSHISTFILE; or set -gx LESSHISTFILE "-"

# Micro
if type -q micro
  set -q EDITOR; or set -gx EDITOR (command -v micro)
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
end
