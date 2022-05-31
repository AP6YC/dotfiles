#!/bin/sh
# sudo apt install ripgrep

"""
    already_installed

Echos that a directory has already been installed.

* `$1` - Directory that is already installed.
"""
already_installed () {
    echo "------- SASHA'S CM - Already installed: $1"
}

"""
    try_install

Tries to run the command if the target directory does not exist.
* `$1` - Directory to check.
* `$2` - String, command to be executed.
"""
try_install () {
    if [ ! -d $1 ]
    then
        eval $2
    else
        already_installed $1
    fi
}

# Zsh syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
LOCAL_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
LOCAL_COMMAND="git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $LOCAL_DIR"
try_install $LOCAL_DIR $LOCAL_COMMAND

# Zsh autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
LOCAL_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
LOCAL_COMMAND="git clone https://github.com/zsh-users/zsh-autosuggestions $LOCAL_DIR"
try_install $LOCAL_DIR $LOCAL_COMMAND
