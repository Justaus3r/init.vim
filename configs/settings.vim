set number " display line-no
set ignorecase " Ignore case's while searching strings
set tabstop=4 " set tab to 4 spaces
set shiftwidth=4 " To set an indentation to single TAB
set mouse=a " Use mouse globally on all modes
set incsearch " Use incremental search,i.e jump to first occurrences while search is going
set autoread " Automatically reload the file,if it is changed by external source
set expandtab " Expand Tabs to spaces
set background=dark "Set background for theme
set number relativenumber "Set line numbering to hybrid, for absolute -> set number norelativenumber


" powerline fonts don't work out of the box,we gotta install the patch fonts
" as described here(https://github.com/vim-airline/vim-airline#user-content-integrating-with-powerline-fonts) and then set following var to 1.if that doesn't work this(https://vi.stackexchange.com/a/3363) might help.
let g:airline_powerline_fonts = 1

let mapleader = "," " settin <leader> to ','

"Disable code completion since we use coc for that 
let g:jedi#completions_enabled = 0

" open the go-to function" in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"Colorscheme
" now using iceberg instead of gruvbox
autocmd vimenter * ++nested colorscheme iceberg
