set number
set ignorecase


" powerline fonts don't work out of the box,we gotta install the patch fonts
" as described here(https://github.com/vim-airline/vim-airline#user-content-integrating-with-powerline-fonts) and then set following var to 1.if that doesn't work this(https://vi.stackexchange.com/a/3363) might help.

let g:airline_powerline_fonts = 1

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

call plug#begin('~/.local/share/nvim/plugged')

" to temp disable a plugin: Plug 'foo/bar', { 'on': [] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'


call plug#end()
