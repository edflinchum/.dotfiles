#
# ~/.config/fish/config.fish
#

# Homebrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# -------------------------------------------------------

if status is-interactive
    # Commands to run in interactive sessions can go here

    # 1password cli
    if type -q op
      op completion fish | source
      if test -e ~/.config/op/plugins.sh
        source ~/.config/op/plugins.sh
      end
    end

    # Starship
    if type -q starship
      starship init fish | source
      enable_transience
    end
end
