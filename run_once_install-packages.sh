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
    try_install

Tries to run the command if the target directory does not exist.
* `$1` - Directory to check.
* `$2` - String, command to be executed.
'
try_install () {
    if [ ! -d "$2" ]
    then
        eval "$1"
    else
        # already_installed "$2"
        info "Already installed: $2"
    fi
}

# GIT PACKAGES
git_install () {
    LOCAL_COMMAND="git clone $1 $2"
    try_install "$LOCAL_COMMAND" "$2"
}

# Gotop
# git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
# /tmp/gotop/scripts/download.sh

# TPM
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
LOCAL_DIR=~/.tmux/plugins/tpm
LOCAL_GIT=git@github.com:tmux-plugins/tpm.git
git_install "$LOCAL_GIT" "$LOCAL_DIR"


# Zsh Powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
LOCAL_DIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
LOCAL_GIT=git@github.com:romkatv/powerlevel10k.git
git_install "$LOCAL_GIT" "$LOCAL_DIR"

# Zsh syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
LOCAL_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
LOCAL_GIT=git@github.com:zsh-users/zsh-syntax-highlighting.git
git_install "$LOCAL_GIT" "$LOCAL_DIR"

# Zsh autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
LOCAL_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
LOCAL_GIT=git@github.com:zsh-users/zsh-autosuggestions.git
git_install "$LOCAL_GIT" "$LOCAL_DIR"