#!/usr/bin/env bash

NVIM_CONF_PATH="$HOME/.config/nvim"
PLUGGED_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"

function init_nvim_conf {
    if [ -d $NVIM_CONF_PATH ];then
	cp init.vim $NVIM_CONF_PATH
    else
	printf "Nvim config directory not found,creating one..\n"
	mkdir $NVIM_CONF_PATH
        cp init.vim $NVIM_CONF_PATH
   fi
}

function validate_vim-plug {
    if [ -e $PLUGGED_PATH ];then
        return 0
    else
	printf "Vim_plugged/Plugged not found,downloading..\n"
	curl -fLo $PLUGGED_PATH --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
}


init_nvim_conf
validate_vim-plug
printf "Done..\n"
