#!/bin/sh
clear

# Install applications
sudo cp .config/pacman.conf /etc/pacman.conf # Enables multilib repo
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm base-devel git vim btop bat ranger eza figlet zathura zathura-pdf-mupdf 


# Compile applications from the aur
git clone https://aur.archlinux.org/paru.git
pushd paru/
makepkg -Si
popd
rm -rf paru/
sudo cp .config/paru.conf /etc/paru.conf

git clone https://aur.archlinux.org/librewolf-bin.git
pushd librewolf-bin/
makepkg -Si
popd
rm -rf librewolf-bin/


# Copy config files
ranger --copy-config=all
cp .config/rc.conf $HOME/.config/ranger
sudo cp .config/rc.conf /root/.config/ranger

cp .config/.vimrc $HOME # Use $HOME variable for compatibility with different users
sudo cp -a .config/.vimrc /etc/vimrc


# Bash.rc config
#
# Replace PS1 prompt
sed -i "s|PS1='.*|PS1='\\\[\\e\[91m\\\]\[\\\[\\e\[93m\\\]\\u\\\[\\e\[92m\\\]\@\\\[\\e\[96m\\\]\\H\\\[\\e\[0m\\\] \\\[\\e\[95m\\\]\\w\\\[\\e\[91m\\\]\]\\\[\\e\[0m\\\]\\\\$ '|" /etc/bash.bashrc # bashrc path

# Adds terminal shortcuts
printf "
alias brc='sudo vim /etc/bash.bashrc'
alias br='source /etc/bash.bashrc'

alias vrc='vim $HOME/.vimrc && sudo cp $HOME/.vimrc /etc/vimrc'

alias r='ranger'
alias rr='sudo ranger'

alias c='clear'

# Replace ls with eza
alias ls='exa -gF --grid --icons'
alias ll='exa -laF --header --git --icons'
alias lt='exa -laF --tree --level=2 --header --git --icons'" >> /etc/bash.bashrc # bashrc path

source /etc/bash.bashrc

clear
figlet DONE !
