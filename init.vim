set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.local/share/nvim/plugged')

Plugin 'svermeulen/vim-subversive'

call plug#end()

set clipboard+=unnamedplus

" s for substitute 
nmap <leader>s <plug>(SubversiveSubstitute) 
nmap <leader>ss <plug>(SubversiveSubstituteLine) 
nmap <leader>S <plug>(SubversiveSubstituteToEndOfLine)


