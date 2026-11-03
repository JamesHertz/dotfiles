syntax on

" for changing the number of space per tab
" set expandtab autoindent tabstop=4 shiftwidth=4
" set noexpandtab
set autoindent tabstop=4 shiftwidth=4

set relativenumber
set number

" for setting the terminal below
set splitbelow
" set linebreak
set hlsearch incsearch

let g:mapleader = " "

map <leader>e :Ex<cr>
map <leader>y "+y
map <leader>p "+p
map <leader>ch <cmd>let @/ = ""<CR>
" map <leader>l :next<cr>
