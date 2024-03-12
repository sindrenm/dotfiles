source $HOME/.config/nvim/dein/init.vim
source $HOME/.config/nvim/theme.vim

syntax enable

" Ignore case when searching, unless at least one
" uppercase character is used in the search term
set ignorecase
set smartcase

" Enable line numbers
set number

" Allow cursor to move to all empty spaces
set virtualedit=all

" Prefer 2 spaces over tabs by default
set expandtab
set shiftwidth=2
set softtabstop=2

" Make sure Vim knows we have a dark background
set background=dark
