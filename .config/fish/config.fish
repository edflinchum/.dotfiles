#
# ~/.config/fish/config.fish
#

# -------------------------------------------------------

# Homebrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
if test -d (brew --prefix)"/share/fish/completions"
  set -g fish_complete_path (brew --prefix)/share/fish/completions $fish_complete_path
end
if test -d (brew --prefix)"/share/fish/vendor_completions.d"
  set -g fish_complete_path (brew --prefix)/share/fish/vendor_completions.d $fish_complete_path
end

# 1password cli
if type -q op
  op completion fish | source
  if test -e ~/.config/op/plugins.sh
      source ~/.config/op/plugins.sh
  end
end

# -------------------------------------------------------

if status is-interactive
# Commands to run in interactive sessions can go here

  # Starship
  if type -q starship
      starship init fish | source
      enable_transience
  end

end
