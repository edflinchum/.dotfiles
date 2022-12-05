# DiscFlyer's .dotfiles repo
Backup of configuration files using a bare git repo


## First-time Setup (One time only)
```sh
git init --bare $HOME/.dotfiles
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot remote add origin git@github.com:DiscFlyer/.dotfiles.git
```

## Replicate Setup on Another Computer
```sh
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/DiscFlyer/.dotfiles.git my-dotfiles-tmp
rsync --recursive --verbose --exclude '.git' my-dotfiles-tmp/ $HOME/
rm --recursive my-dotfiles-tmp
```

## Additional Configuration
```sh
dot remote set-url origin git@github.com:DiscFlyer/.dotfiles.git
dot config --local status.showUntrackedFiles no
dot config --local user.name "John Doe"
dot config --local user.email johndoe@example.com
```

## Example Usage
```sh
dot status
dot add .filename
dot commit -m 'Add .filename'
dot push
```
