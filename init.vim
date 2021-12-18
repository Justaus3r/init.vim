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

for s:conf_file in g:config_files 
    execute printf("source ~/.config/nvim/configs/%s",s:conf_file) 
endfor



