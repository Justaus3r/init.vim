" My sorry-state noevim conf script
"  ---------- 
" | Settings |
"  ----------
set number " display line-no
set ignorecase " Ignore case's while searching strings
set tabstop=4 " set tab to 4 spaces
set shiftwidth=4 " To set an indentation to single TAB
set mouse=a " Use mouse globally on all modes
set incsearch " Use incremental search,i.e jump to first occurrences while search is going
set autoread " Automatically reload the file,if it is changed by external source
set expandtab " Expand Tabs to spaces

" powerline fonts don't work out of the box,we gotta install the patch fonts
" as described here(https://github.com/vim-airline/vim-airline#user-content-integrating-with-powerline-fonts) and then set following var to 1.if that doesn't work this(https://vi.stackexchange.com/a/3363) might help.
let g:airline_powerline_fonts = 1
let mapleader = "," " settin <leader> to ','

"  ---------------------------
" | Custom defined functions |
"  ---------------------------

" function Yank_to_sys_clipboard()
"     y:call system("xclip -selection clipboard", @")<CR>   
"     echon ''
" endfunction
 
"  ---------- 
" | Mappings |
"  ---------- 
 
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" " completion on pressing tab
" Pretty ugly i know,xDD.tho i only need map for these two modes so ain't that
" bad,is it?
inoremap jj <esc> " map ESC to jj for insert mode   
vnoremap jj <esc> " map ESc for visual mode 

" Copy to system clipboard using external binary:https://stackoverflow.com/a/51682050
" Requires xclip to be installed
map <c-c> y:call system("xclip -selection clipboard", @")<CR>:echon ''<CR>

"  ---------- 
" | Plugins  |
"  ----------

call plug#begin('~/.local/share/nvim/plugged')
" to temp disable a plugin: Plug 'foo/bar', { 'on': [] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'

call plug#end()

