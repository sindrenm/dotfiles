" Required: Add dein installation to the runtime path
set runtimepath+=$HOME/.config/nvim/dein/plugins/repos/github.com/Shougo/dein.vim

" Required: Start dein, providing it the directory of plugins
call dein#begin($HOME . '/.config/nvim/dein/plugins')

" Required: Let dein manage dein
call dein#add('Shougo/dein.vim')

" Source custom plugins from its own file
source $HOME/.config/nvim/dein/plugins.vim

" Required: Stop running dein
call dein#end()

" Required: Enable file type detection
filetype plugin indent on
