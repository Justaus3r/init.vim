call plug#begin('~/.local/share/nvim/plugged')
" to temp disable a plugin: Plug 'foo/bar', { 'on': [] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
# Plug 'tmhedberg/SimpylFold'
Plug 'morhetz/gruvbox'
Plug 'andweeb/presence.nvim'
call plug#end()

