# Install fisher plugin manager if it is missing
if not type -q fisher
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish -o $HOME/.config/fish/functions/fisher.fish
end
