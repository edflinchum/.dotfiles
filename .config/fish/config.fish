#
# ~/.config/fish/config.fish
#

# Homebrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# -------------------------------------------------------

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Starship
    if type -q starship
      starship init fish | source
    end

    # Aliases
    source ~/.alias-personal
end
