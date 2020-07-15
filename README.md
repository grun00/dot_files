nvim
====

* Leader key is " " (space)
* I changed my capslock key to an ESC key. The configs for that are in the .xmodmap file.

Generic mappins
===============

* ss splits screen horizontally
* sv splits screen vertically
* \<leader\>S/V fzf for a file and opens it in a split
* Navigation Inside splits is done with <C-x> x: hjkl
* \<leader\>Tab cycle through buffers
* \<leader\><Enter> fzf open buffers
* \<C-p\> searches directory with fzf
* \<C-s\> grep directory with ripgrep
* tab navigation is done with tX -> X is the motion
* Scrolling \<C-d\>/\<C-u\> with easy motion
* repeating macros is done with ,
* \<leader\>z togles zoom on splits

Fugitive
========
```vimscript
 <leader>ga :Git add .<CR>
 <leader>gb :Gblame<CR>
 <leader>gc :Gcommit -v -q<CR>
 <leader>gd :Gdiff<CR>
 <leader>go :Gllog<CR>
 <leader>gi :Gread<CR>
 <leader>gm :Gmerge
 <leader>gps :Gpush origin HEAD<CR>
 <leader>gpl :Gpull
 <leader>gw :Gwrite<CR>
 <leader>gcb :Merginal<CR>
 <leader>gr :G<CR>
 <leader>gt :GV<CR>
```

vim-tests
=========

* \<leader\>rs :TestNearest -> Nearest test from cursor
* \<leader\>rf :TestFile -> Whole file
* \<leader\>ra :TestSuite -> All tests
* \<leader\>rl :TestLast -> Last test
* \<leader\>rv :TestVisit -> Opens last test in buffer

VisIncr
=======

Use \<C-v\> for visual more and call:
* :I increment all selected by 1 as a default, but takes a number as a step argument

Tmux
====

* Prefix \<C-a\>
* Split Horizontal Prefix -
* Split Vertical Prefix /

i3wm
====

Mostly using vimkeys to move around and kept a lot of the Manjaro-i3 configs

ZSH
===

* ctrl + e to open command in vim mode for editing
* ctrl + o to open file navigation

install.sh
==========

This is just a small script to install most of the things I need in a new arch/manjaro install.
