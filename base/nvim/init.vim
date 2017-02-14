source $HOME/.config/nvim/dein/init.vim
source $HOME/.config/nvim/theme.vim

set backupcopy=yes
set cursorline
set hidden
set number
set mouse=
set virtualedit=all
set ignorecase
set smartcase

set grepprg=ag\ --nogroup\ --nocolor
let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'

let mapleader = ","

" Maps for Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

map <C-Space> :CtrlSpace<CR>

autocmd! BufWritePost * Neomake

" TODO: Somehow enable only for Angular templates.
" autocmd FileType typescript JsPreTmpl html

let g:deoplete#enable_at_startup = 1
