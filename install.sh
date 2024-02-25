#!/usr/bin/env bash

# A terrible user-script for autamating stuff

NVIM_CONF_PATH="$HOME/.config/nvim/"
PLUGGED_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"
PIP_CMD="python3 -m pip"
PIP_DOWNLOAD_LINK="https://bootstrap.pypa.io/get-pip.py"
PACKMAN_CMD="NONE"

get_system_packman(){
	if [ $(command -v pacman) ];then
		PACKMAN_CMD="pacman -Syu "
	elif [ $(command -v apt) ];then
		PACKMAN_CMD="apt install "
	elif [ $(command -v apt-get) ];then
		PACKMAN_CMD="apt-get install "
	else
		printf "Could not determine the system package manager!\nPlease enter the install command for your system's package manager(without sudo):\n>>"
		read PACKMAN_CMD
		return	
	fi
	read -p "Using package manager command '$PACKMAN_CMD' , Continue[Y/N]:" opt
	if [ $opt == "N" ];then
		read -p "Enter package manager command(without sudo): " PACKMAN_CMD
	fi
}


init_nvim_conf() {
    if [ -d $NVIM_CONF_PATH ];then
	cp -r configs/ init.vim $NVIM_CONF_PATH
    else
	printf "Nvim config directory not found,creating one..\n"
	mkdir $NVIM_CONF_PATH
        cp -r configs/ init.vim $NVIM_CONF_PATH
   fi
}

install_pip() {
	$PIP_CMD 1> /dev/null
	if [ $? -eq 0 ];then
		return
	fi
	wget $PIP_DOWNLOAD_LINK
	python3 get-pip.py
	rm get-pip.py
}

validate_runtime_dependencies() {
    if ! [ -x "$(command -v node )" ];then
        printf "Nodejs not found,Downloading+Installing...\n"
        curl -sL install-node.vercel.app/lts |sudo bash
    fi
    
    if ! [ -x "$(command -v xclip )" ];then
        printf "Xclip not found,installing...\n"
        yes | sudo $PACKMAN_CMD xclip
    fi
    # install pip if not installed
    install_pip
    python3 -m pip install yapf pynvim
}


validate_vim-plug() {
    if [ -e $PLUGGED_PATH ];then
        return 0
    else
	printf "Vim_plugged/Plugged not found,downloading..\n"
	curl -fLo $PLUGGED_PATH --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
}



get_system_packman
init_nvim_conf
validate_runtime_dependencies
validate_vim-plug
printf "Done..\n"


