# EzInstall 💻🔥
My personal script for installing packages and copying over dotfiles on arch based distributions

The list of packages currently include; ``git vim btop bat ranger eza figlet zathura zathura-pdf-mupdf`` aur; ``paru, librewolf-git`` more packages will be added as I see fit.

This script will override config files for vim, ranger, pacman and paru. It will also append new alias shortcuts to your bashrc aswell as replace your PS1 prompt.

The list of aliases include:
```console
# Shortcuts for editing bashrc
alias brc='sudo vim /etc/bash.bashrc'
alias br='source /etc/bash.bashrc'

# Shortcut for editing vimrc for all users
alias vrc='vim $HOME/.vimrc && sudo cp $HOME/.vimrc /etc/vimrc'

alias r='ranger'
alias rr='sudo ranger'

alias c='clear'

# Replace ls with eza
alias ls='exa -gF --grid --icons'
alias ll='exa -laF --header --git --icons'
alias lt='exa -laF --tree --level=2 --header --git --icons'"
```

# Dependencies
- git

# Installing
Clone from git
```console
git clone https://github.com/ingvaldmeland/ezinstall.git
```

Make the script executable
```console
sudo chmod +x ezinstall.sh
```

Run the script
```console
./ezinstall
```
