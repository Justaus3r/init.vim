" my sorry-state noevim conf script

"  ----------------------------- 
" | Sourcing all config scripts |
"  -----------------------------
 
let g:config_files = [ 
    \ "settings.vim",
    \ "plugins.vim",
    \ "commands.vim",
    \ "mappings.vim",
    \ "shell.vim",
    \ ]

if has('unix') || has('macunix')
    let g:path_sep = '/'
else
    let g:path_sep = '\'
endif

for s:conf_file in g:config_files
    let s:config_path = join([stdpath('config'), 'configs/%s'],g:path_sep)
    execute printf(join(["source",s:config_path], ' '),s:conf_file) 
endfor