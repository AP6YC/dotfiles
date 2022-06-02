#!/bin/sh
# sudo apt install ripgrep

#DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

error() {
    printf "${COLOR_RED}Error: ${COLOR_NONE}$1\n"
    exit 1
}

warning() {
    printf "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1\n"
}

info() {
    #echo -e "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
    printf "${COLOR_BLUE}Info: ${COLOR_NONE}$1\n"
}

success() {
    printf "${COLOR_GREEN}$1${COLOR_NONE}\n"
}

: '
    already_installed

Echos that a directory has already been installed.

* `$1` - Directory that is already installed.
'
already_installed () {
    #echo "------- SASHA'S CM - Already installed: $1"
    # echo "${COLOR_GREEN}------- SASHA'S CM ${COLOR_NONE}- Already installed: $1"
    info "Already installed: $1"

}

: '
    try_install

Tries to run the command if the target directory does not exist.
* `$1` - Directory to check.
* `$2` - String, command to be executed.
'
try_install () {
    if [ ! -d $1 ]
    then
        eval "$2"
    else
        already_installed "$1"
    fi
}

# Gotop
# git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
# /tmp/gotop/scripts/download.sh

# TPM
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# git@github.com:tmux-plugins/tpm.git
LOCAL_DIR=~/.tmux/plugins/tpm
LOCAL_COMMAND="git clone https://github.com/tmux-plugins/tpm.git $LOCAL_DIR"
try_install "$LOCAL_DIR" "$LOCAL_COMMAND"

# Zsh Powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
LOCAL_DIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
LOCAL_COMMAND="git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $LOCAL_DIR"
try_install "$LOCAL_DIR" "$LOCAL_COMMAND"

# Zsh syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
LOCAL_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
LOCAL_COMMAND="git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $LOCAL_DIR"
try_install "$LOCAL_DIR" "$LOCAL_COMMAND"

# Zsh autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
LOCAL_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
LOCAL_COMMAND="git clone https://github.com/zsh-users/zsh-autosuggestions $LOCAL_DIR"
try_install "$LOCAL_DIR" "$LOCAL_COMMAND"
