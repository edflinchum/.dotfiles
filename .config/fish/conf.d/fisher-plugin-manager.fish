# Install fisher plugin manager if it is missing
set -l fisher_path $HOME/.config/fish/functions/fisher.fish
if not test -e $fisher_path
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish -o $fisher_path
end
