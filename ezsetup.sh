#!/bin/sh

# Install and compile applications
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm base-devel git vim btop bat ranger

git clone https://aur.archlinux.org/paru.git
pushd paru/
makepkg -Si
popd
rm -rf paru/
sudo cp paru.conf /etc/paru.conf

# git clone https://aur.archlinux.org/librewolf-bin.git
# pushd librewolf-bin/
# makepkg -Si
# popd
# rm -rf librewolf-bin/

# Copy config files
ranger --copy-config=all
cp rc.conf $HOME/.config/ranger
sudo cp rc.conf /root/.config/ranger

cp .vimrc $HOME
sudo cp -a  .vimrc /etc/vimrc

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
