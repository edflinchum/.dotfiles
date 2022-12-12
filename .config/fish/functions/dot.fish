function dot --wraps=git --description 'Git alias for .dotfiles bare repo with HOME work tree'
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" $argv; 
end
