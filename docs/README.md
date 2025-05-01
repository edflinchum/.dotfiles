# My .dotfiles repo
This is how I backup my configuration files using a bare git repo named `.dotfiles` with the git work-tree set to `$HOME`.

## How to set up a new computer to use these .dotfiles
```sh
git clone --bare https://github.com/edflinchum/.dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout -f
```
### Additional Configuration
**_Note:_** The `dot` alias shown here is no longer needed with the `git` wrapper function included in this repo.
```sh
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
I only want git to track files that I explicitly add to the repo.
```sh
dot config --local status.showUntrackedFiles no
```
This is how to set user identity to be used with the .dotfiles repo.
```sh
dot config --local user.name "John Doe"
dot config --local user.email johndoe@example.com
```
This will configure git to use ssh instead of https with this repo.
```sh
dot remote set-url origin git@github.com:edflinchum/.dotfiles.git
```

## How to set up your own .dotfiles bare repo from scratch
```sh
git init --bare $HOME/.dotfiles
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot remote add origin git@github.com:[your_github_name]/.dotfiles.git
```
### Example Usage
```sh
dot status
dot add .filename
dot commit -m 'Add .filename'
dot push
```
