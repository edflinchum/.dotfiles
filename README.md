# .dotfiles repo
Backup of configuration files using a bare git repo


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
dot remote set-url origin git@github.com:DiscFlyer/.dotfiles.git
dot config --local status.showUntrackedFiles no
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global init.defaultBranch main
```

## Usage
```sh
dot status
dot add .filename
dot commit -m 'Add .filename'
dot push
```
