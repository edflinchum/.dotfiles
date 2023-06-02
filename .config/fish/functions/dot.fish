function dot --wraps="command git --git-dir=$HOME/.dotfiles --work-tree=$HOME" --description 'Git alias for .dotfiles bare repo with HOME work tree'
  if test (count $argv) -eq 0
    command git --git-dir=$HOME/.dotfiles --work-tree=$HOME status
  else
    command git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv
  end
end
