# .dotfiles repo
Backup of configuration files using a bare git repo

## Git config
```sh
git config --global user.name "DiscFlyer"
git config --global user.email ed@flinchum.net
```

## Setup
```sh
git init --bare $HOME/.dotfiles
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot remote add origin git@github.com:DiscFlyer/.dotfiles.git
```

## Replication
```sh
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/DiscFlyer/.dotfiles.git my-dotfiles-tmp
rsync --recursive --verbose --exclude '.git' my-dotfiles-tmp/ $HOME/
rm --recursive my-dotfiles-tmp
```

## Configuration
```sh
dot config --local status.showUntrackedFiles no
dot remote set-url origin git@github.com:DiscFlyer/.dotfiles.git
```

## Usage
```sh
dot status
dot add .zshrc
dot commit -m 'Add zshrc'
dot push
```
