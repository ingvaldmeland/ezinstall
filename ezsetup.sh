#!/bin/bash

# Install and compile applications
sudo pacman -Syu --noconfirm
sudo pacman -S git vim btop bat ranger --noconfirm
sudo pacman -S --needed --noconfirm base-devel

git clone https://aur.archlinux.org/paru.git
pushd paru/
makepkg -Si
popd
rm -rf paru/

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


