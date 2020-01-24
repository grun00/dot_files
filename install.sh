#!/bin/bash

# After install
sudo pacman-mirrors --fasttrack --noconfirm && sudo pacman -Syyu --noconfirm

sudo pacman -Sy --noconfirm neovim python3 asciiquarium calcurse calibre chromium cmatrix clisp  docker entr gcc make git curl wget gparted htop jre8-openjdk neovim nodejs npm yarn python-pip ruby ruby-irb ttf-fira-code veracrypt vlc virtualbox virtualbox-sdk zathura zathura-pdf-mupdf zip zsh tmux xclip fzf ripgrep

cd ~

git clone git@github.com:grun00/dot_files.git

pip install --user pynvim

mkdir ~/.config/nvim
mkdir ~/.i3
cp ~/dot_files/.i3/config ~/.i3
cp ~/dot_files/.Xresources ~
cp ~/dot_files/.xmodmap ~
cp ~/dot_files/.config/nvim/init.vim ~/.config/nvim/
cp ~/dot_files/.zshrc ~
cp ~/dot_files/.tmux.conf ~
cp ~/dot_files/.gitconfig ~

#Thanks Luke
git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install
cd ~
rm -rf st
#Nerd Fonts for Icons
git clone https://aur.archlinux.org/nerd-fonts-complete.git
cd nerd-fonts-complete
makepkg -si
cd ..
rm -rf nerd-fonts-complete

