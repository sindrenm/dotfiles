" Required:
set runtimepath+=$HOME/.config/nvim/dein/packages/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin($HOME . '/.config/nvim/dein/packages')

" Required: Let dein manage dein
call dein#add('Shougo/dein.vim')

" Add or remove plugins here:
source $HOME/.config/nvim/dein/packages.vim

" Required:
call dein#end()

" Required:
filetype plugin indent on
