call plug#begin('~/.local/share/nvim/plugged')
" to temp disable a plugin: Plug 'foo/bar', { 'on': [] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'cocopon/iceberg.vim'

" Using google/vim-codefmt instead
" Plug 'sbdchd/neoformat'

" Both vim-maktaba and vim-glaive are needed for vim-codefmt
Plug 'google/vim-codefmt'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Justaus3r/vim-mypy',  {'branch': 'master'}

" Plug 'tmhedberg/SimpylFold'
" Plug 'morhetz/gruvbox'

Plug 'andweeb/presence.nvim'
call plug#end()
