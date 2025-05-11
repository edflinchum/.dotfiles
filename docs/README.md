# My .dotfiles repository

This is how I backup my computer's configuration files, known informally as **"dotfiles"**, using GitHub.
I am using a bare git repository named **.dotfiles** with the git worktree set to my home directory.
This makes it trivial to set up a new computer with my own backed-up configuration files.

## How to set up a new computer to use these dotfiles

- Clone the **.dotfiles** repository and install the dotfiles using the proper directories as shown, overwriting files if they exist.
    ```sh
    git clone --bare https://github.com/edflinchum/.dotfiles.git $HOME/.dotfiles

    git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout -f
    ```

- Set an alias to configure git to use the bare repository when typing **dot**. This step can be skipped if you have restarted your shell after installing the dotfiles in the previous step.
    >**NOTE:** _The **dot** alias shown here is no longer needed with the git wrapper function included in this repository. You can replace `dot` in the following steps with `git` if you have restarted the shell with the dotfiles in place._
    ```sh
    alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    ```

- I only want git to track files that I explicitly add to the repository.
    ```sh
    dot config --local status.showUntrackedFiles no
    ```

- **[Optional]** This is how to set the git user identity to be used with the .dotfiles repository.
    ```sh
    dot config --local user.name "John Doe"

    dot config --local user.email johndoe@example.com
    ```

- **[Optional]** This will configure git to use **ssh** instead of **https** with this repository.
    ```sh
    dot remote set-url origin git@github.com:edflinchum/.dotfiles.git
    ```

## How to set up your own .dotfiles bare repository from scratch

- Initialize the bare git repository and set your remote target for backups.
    ```sh
    git init --bare $HOME/.dotfiles
    alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    dot remote add origin git@github.com:[YOUR_GITHUB_NAME]/.dotfiles.git
    ```
- Example usage to backup local configuration files to your .dotfiles repository.
    ```sh
    dot status
    dot add .filename
    dot commit -m 'Add .filename'
    dot push
    ```
