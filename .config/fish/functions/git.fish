function git --description "Git wrapper for .dotfiles bare repo when in home folder unless in a different git work tree"
  if test $argv[1] != clone
  and string match -qr $HOME $PWD
  and not command git rev-parse --is-inside-work-tree &> /dev/null
    command git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" $argv
  else
    command git $argv
  end
end
