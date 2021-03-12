#!/bin/bash
# After install

#Find fastest mirrors and update
sudo pacman-mirrors --fasttrack && sudo pacman -Syyu --noconfirm

#Programs I like to have
sudo pacman -Sy --noconfirm neovim python3 asciiquarium calcurse calibre chromium cmatrix clisp docker gcc make git curl wget gparted htop neovim nodejs npm yarn python-pip ruby ruby-irb ttf-fira-code veracrypt vlc virtualbox virtualbox-sdk zathura zathura-pdf-mupdf zip zsh tmux xclip fzf ripgrep clang ctags

cd ~

#For neovim support
pip install --user pynvim

if [ ! -d ~/.config/nvim  ]
then
  mkdir ~/.config/nvim
fi

if [ ! -d ~/.i3  ]
then
  mkdir ~/.i3
fi

cp ~/dot_files/.i3/config ~/.i3
cp ~/dot_files/.Xresources ~
cp ~/dot_files/.xmodmap ~
cp ~/dot_files/.config/nvim/init.vim ~/.config/nvim/
cp ~/dot_files/.zshrc ~
cp ~/dot_files/.tmux.conf ~
cp ~/dot_files/.gitconfig ~
cp ~/dot_files/aliasrc ~/.config

#Nerd Fonts for Icons
git clone https://aur.archlinux.org/nerd-fonts-complete.git
cd nerd-fonts-complete
makepkg -si
cd ..
rm -rf nerd-fonts-complete

#For syntax highligh in zsh
git clone https://github.com/zdharma/fast-syntax-highlighting ~/.config/zsh_configs/plugins/fast-syntax-highlighting.plugin.zsh

#Pretty ls
git clone https://github.com/sebastiencs/icons-in-terminal.git
cd icons-in-terminal
./install.sh
cd
rm -rf icons-in-terminal
git clone https://github.com/sebastiencs/ls-icons.git
cd ls-icons
./bootstrap
export CC=clang CXX=clang++
./configure --prefix=/opt/coreutils
make
make install
/opt/coreutils/bin/ls
rm -rf ~/ls-icons

git clone https://aur.archlinux.org/lf.git
cd lf
makepkg -sci
rm -rf ~/lf && cd
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
