function Multi_mode_mapping(lhs, rhs, modes)
    for mode in a:modes
        execute mode.'noremap' a:lhs a:rhs
    endfor
endfunction

function Set_clipboard()
    if has('unix') || has('macunix')
        let l:cmd = "xclip -selection clipboard"
    else
        " Dunno why but piping wasn't working so
        " had to use this half-ass way...
        let l:buffer=@
        let l:filepath = stdpath('config') . '\configs\tmpfile'
        call writefile(split(l:buffer, "\n", 1), l:filepath, 'b')
        let l:cmd = "copyq copy - <" . ' ' . l:filepath
    endif
    call system(l:cmd)
    call system('del'. ' ' . l:filepath)
endfunction

" Trigger coc tab completion 
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

map <leader>l ggVG " Select all text

map <c-c> y:call Set_clipboard()<CR>:echon ''<CR>
tnoremap <Esc> <C-\><C-n> "Revert back from terminal mode to normal mode

call Multi_mode_mapping('<leader>t', '<esc>:call Spawn_shell()<CR>', ['i','n'])
call Multi_mode_mapping('<leader>z', '<esc>:NERDTree<CR>', ['i','n'])