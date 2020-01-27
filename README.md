nvim
====

* Leader key is " " (space)

Generic mappins
===============

* ss splits screen horizontally
* sv splits screen vertically
* \<leader\>S/V fzf for a file and opens it in a split
* Navigation Inside splits is done with <C-x> x: hjkl
* \<leader\>Tab/<leader><S-Tab> cycle through buffers
* \<leader\><Enter> fzf open buffers
* \<C-p\> searches directory with fzf
* \<C-s\> grep directory with ripgrep
* \<leader\>+/- resizes horizontal split
* \<leader\></> resizes vertical split
* \<leader\>ç opens netrw
* tab navigation is done with tX -> X is the motion
* Scrolling \<C-d\>/\<C-u\> with easy motion
* zf/zo closing and opening folds
* repeating macros is done with ,
* \<leader\>z togles zoom on splits

Fugitive
========
* \<leader\>gX is the general form
* \<leader\>ga :Git add . -> Addes all changes to staging
* \<leader\>gb :Gblame
* \<leader\>gc :Gcommit
* \<leader\>gd :Gdiff
* \<leader\>gl :Gllog
* \<leader\>gl :Gread
* \<leader\>gm :Gmerge
* \<leader\>gpl :Gpull
* \<leader\>gps :Gpush
* \<leader\>gs :Gstatus
* \<leader\>gw :Gwrite
* \<leader\>gcb :Merginal

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
