call plug#begin('~/.local/share/nvim/plugged')
" to temp disable a plugin: Plug 'foo/bar', { 'on': [] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-ctrlspace/vim-ctrlspace'

"Colorscheme
"Plug 'cocopon/iceberg.vim'
" now using cappucin/nvim
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }



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

" For Dockerfile linting
Plug 'ekalinin/Dockerfile.vim'

Plug 'alvan/vim-closetag'

call plug#end()
