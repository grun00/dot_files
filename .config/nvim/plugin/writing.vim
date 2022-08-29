" ================== writing
"Dictionaries
map <F6> :set spell spelllang=en_us<CR>
map <F7> :set spell spelllang=pt<CR>
map <F8> :set spell spelllang=de<CR>

" Wiki
command Diary :e /home/grun/vimwiki/TODO.md
let g:vimwiki_filetypes = ['markdown']
let g:vimwiki_list = [ { 'syntax': 'markdown', 'ext': '.md', 'auto_diary_index': 1}]
let g:vimwiki_diary_months = {
      \ 1: 'January', 2: 'February', 3: 'March',
      \ 4: 'April', 5: 'May', 6: 'June',
      \ 7: 'July', 8: 'August', 9: 'September',
      \ 10: 'October', 11: 'November', 12: 'December'
      \ }
"
" Goyo for no distraction writing
nnoremap <Leader>gy :Goyo<CR>
