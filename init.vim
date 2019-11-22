set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set clipboard+=unnamedplus 

call plug#begin('~/.local/share/nvim/plugged')


call plug#end()




