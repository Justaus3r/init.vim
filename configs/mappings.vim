
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" " completion on pressing tab 

map <leader>l ggVG " Select all text

" Copy to system clipboard using external binary:https://stackoverflow.com/a/51682050
" Requires xclip to be installed
map <c-c> y:call system("xclip -selection clipboard", @")<CR>:echon ''<CR>

tnoremap <Esc> <C-\><C-n> "Revert back from terminal mode to normal mode

