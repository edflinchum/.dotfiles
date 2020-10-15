# .dotfiles repo
Backup of configuration files using a bare git repo

## Git initial setup
```sh
git config --global user.name "DiscFlyer"
git config --global user.email ed@flinchum.net
```

## Setup
```sh
git init --bare $HOME/git-repos/.dotfiles
alias dotgit='git --git-dir=$HOME/git-repos/.dotfiles/ --work-tree=$HOME'
dotgit remote add origin git@github.com:DiscFlyer/.dotfiles.git
```

## Replication
```sh
git clone --separate-git-dir=$HOME/git-repos/.dotfiles https://github.com/DiscFlyer/.dotfiles.git my-dotfiles-tmp
rsync --recursive --verbose --exclude '.git' my-dotfiles-tmp/ $HOME/
rm --recursive my-dotfiles-tmp
```

## Configuration
```sh
dotgit config --local status.showUntrackedFiles no
dotgit remote set-url origin git@github.com:DiscFlyer/.dotfiles.git
```

## Usage
```sh
dotgit status
dotgit add .zshrc
dotgit commit -m 'Add zshrc'
dotgit push
```
