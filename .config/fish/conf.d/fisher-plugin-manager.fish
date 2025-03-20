# Install fisher plugin manager if it is missing
set -l fisher_path $__fish_config_dir/functions/fisher.fish
if not test -e $fisher_path
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
end
