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
set background=dark "Set background for theme
 
" powerline fonts don't work out of the box,we gotta install the patch fonts
" as described here(https://github.com/vim-airline/vim-airline#user-content-integrating-with-powerline-fonts) and then set following var to 1.if that doesn't work this(https://vi.stackexchange.com/a/3363) might help.
let g:airline_powerline_fonts = 1
let mapleader = "," " settin <leader> to ','

"Disable code completion since we use coc for that 
let g:jedi#completions_enabled = 0

" open the go-to function" in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"  ---------------------------
" | Custom defined functions |
"  ---------------------------

" function Yank_to_sys_clipboard()
"     y:call system("xclip -selection clipboard", @")<CR>   
"     echon ''
" endfunction

" function Is_previous_line_empty()
"     return strchars(getbufline(bufnr('%'),line('.')-1)[0]) > 0
" endfunction 



"  ---------- 
" | Mappings |
"  ---------- 
 
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" " completion on pressing tab 
map <leader>l ggVG " Select all text
" Copy to system clipboard using external binary:https://stackoverflow.com/a/51682050
" Requires xclip to be installed
map <c-c> y:call system("xclip -selection clipboard", @")<CR>:echon ''<CR>

" Colorscheme
autocmd vimenter * ++nested colorscheme gruvbox

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
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim' " Only for code jump,definition
Plug 'scrooloose/nerdtree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tmhedberg/SimpylFold'
Plug 'morhetz/gruvbox'

call plug#end()

