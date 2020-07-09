#!/bin/bash

printf "%-80s" "Creating tree folders on home"
mkdir -p ~/Documents/Projects/{autoseg,git,docs}
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 1 ; fi


printf "%-80s" "Find fastest mirrors and update"
sudo pacman-mirrors --fasttrack && sudo pacman -Syyu --noconfirm 1>/dev/null 2>/dev/null
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 2 ; fi


printf "%-80s" "Installing Programs I need"
sudo pacman -Sy --noconfirm chromium git docker zsh tmux
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" l; exit 4 ; fi


printf "%-80s" "Installing compilers programs"
sudo pacman -Sy --noconfirm gcc make curl wget gparted htop jre8-openjdk
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 3 ; fi


printf "%-80s" "Installing Devs"
sudo pacman -Sy --noconfirm nodejs npm yarn python-pip python3 ctags
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 90 ;  fi


printf "%-80s" "Installing rbenv"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 91 ;  fi


printf "%-80s" "Setting rbenv"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 93 ;  fi


printf "%-80s" "Installing Ruby Build"
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 95 ;  fi


printf "%-80s" "Installing programs that i like :D"
sudo pacman -Sy --noconfirm neovim asciiquarium cmatrix ttf-fira-code zathura zathura-pdf-mupdf zip xclip fzf clang
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 5 ; fi


printf "%-80s" "Installing neovim support"
pip install --user pynvim
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 5 ; fi


printf "%-80s" "Setting nvim config"
if [ ! -d ~/.config/nvim ]; then
  mkdir ~/.config/nvim
  [[ $? -eq 0 ]]; then echo -e "[  Ok  ]" ; else echo -e "[ Fail ]" ; exit 5 ; fi

fi


printf "%-80s" "Configuring i3config"
[[ ! -d ~/.i3 ]]; then mkdir ~/.i3 ; else echo -e "[ Fail ]" ; exit 6 ; fi
cp ~/dot_files/.i3/config ~/.i3
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 7 ; fi9


printf "%-80s" "Configuring X-Resources"
cp ~/dot_files/.Xresources ~
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 8 ; fi9


printf "%-80s" "Configuring zshrc config"
cp ~/dot_files/.zshrc ~
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 9 ; fi9


printf "%-80s" "Configuring aliasrc"
cp ~/dot_files/aliasrc ~/.config
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 10 ; fi9


printf "%-80s" "Configuring nvim"
cp ~/dot_files/.config/nvim/init.vim ~/.config/nvim/
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 10 ; fi9



printf "%-80s" "Installing Luke's Simples Terminal"
git clone https://github.com/LukeSmithxyz/st /tmp
cd /tmp/st
sudo make install
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 11 ; fi9
cd /tmp
rm -rf st


printf "%-80" "Installing Nerd fonts for icons on terminal"
git clone https://aur.archlinux.org/nerd-fonts-complete.git /tmp
cd /tmp/nerd-fonts-complete
makepkg -si
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 12 ; fi9
cd /tmp
rm -rf nerd-fonts-complete


printf "%-80s" "Installing highligh syntax to ZSH"
git clone https://github.com/zdharma/fast-syntax-highlighting ~/.config/zsh_configs/plugins/fast-syntax-highlighting.plugin.zsh
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 13 ; fi9


printf "%-80s" "Installing lf for file navigation"
git clone https://aur.archlinux.org/lf.git
cd lf
makepkg -si
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 14 ; fi9
rm -rf ~/lf && cd


ptintf "%-80s" "Installing Power level 10 K to terminal"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
[[ $? -eq 0 ]]; then echo -e "[  Ok  ]"; else echo -e "[ Fail ]" ; exit 15 ; fi9
