function git -w git -d "Git wrapper that uses .dotfiles bare repo when in HOME directory"
	if [ "$PWD" = "$HOME" ]
		command git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" $argv
	else
		command git $argv
	end
end
