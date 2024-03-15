#!/bin/sh

figlet Ez Install

# Install and compile applications
sudo cp .config/pacman.conf /etc/pacman.conf
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm base-devel git vim btop bat ranger

git clone https://aur.archlinux.org/paru.git
pushd paru/
makepkg -Si
popd
rm -rf paru/
sudo cp .config/paru.conf /etc/paru.conf

# git clone https://aur.archlinux.org/librewolf-bin.git
# pushd librewolf-bin/
# makepkg -Si
# popd
# rm -rf librewolf-bin/

# Copy config files
ranger --copy-config=all
cp rc.conf $HOME/.config/ranger
sudo cp .config/rc.conf /root/.config/ranger

cp .vimrc $HOME
sudo cp -a  .config/.vimrc /etc/vimrc


sed -i "s/PS1='.*/PS1='\[\e[91m\][\[\e[93m\]\u\[\e[92m\]@\[\e[96m\]\H\[\e[0m\] \[\e[95m\]\w\[\e[91m\]]\[\e[0m\]\\$'/" bash.bashrc

printf "
alias brc='sudo vim /etc/bash.bashrc'
alias br='source /etc/bash.bashrc'

alias vrc='vim /home/val/.vimrc && sudo cp /home/val/.vimrc /etc/vimrc'

alias r='ranger'
alias rr='sudo ranger'

alias c='clear'

alias ls='exa -gF --grid --icons'
alias ll='exa -laF --header --icons'
alias lt='exa -laF --tree --level=2 --header --icons'" >> test.txt

source /etc/bash.bashrc
