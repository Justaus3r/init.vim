function! Spawn_shell()
    23sp
    Cww
    term
    startinsert
endfunction    

inoremap <leader>t  <esc>:call Spawn_shell()<CR>

