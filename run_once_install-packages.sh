#!/bin/bash
# sudo apt install ripgrep

# -----------------------------------------------------------------------------
# COMMON CODE
# -----------------------------------------------------------------------------

#DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
    echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

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

# -----------------------------------------------------------------------------
# DIRECTORIES AND SOURCES
# -----------------------------------------------------------------------------

# Git directories
git_dirs=(
    ~/.tmux/plugins/tpm
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
)

# Git repositories
git_repos=(
    git@github.com:tmux-plugins/tpm.git
    git@github.com:romkatv/powerlevel10k.git
    git@github.com:zsh-users/zsh-syntax-highlighting.git
    git@github.com:zsh-users/zsh-autosuggestions.git
)

# -----------------------------------------------------------------------------
# INSTALLATION
# -----------------------------------------------------------------------------

title "Installing dotfile dependencies"

# Iterate over all git repos and dirs
for i in ${!git_dirs[@]}; do
    git_install "${git_repos[$i]}" "${git_dirs[$i]}"
done
