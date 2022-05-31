#!/bin/sh
# sudo apt install ripgrep

# Zsh syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
LOCAL_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
[ ! -d $LOCAL_DIR ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $LOCAL_DIR || echo "Zsh syntax highlighting already installed"

# Zsh autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
LOCAL_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[ ! -d $LOCAL_DIR ] && git clone https://github.com/zsh-users/zsh-autosuggestions $LOCAL_DIR || echo "Zsh autosuggestions already installed"
