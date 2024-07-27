#!/bin/bash

# Get OS 
system_type=$(uname -s)

# Programs whose configuration files will be symlinked
to_symlink=(bash git zsh tmux)

read -p "Enter your username: " USER

if [ "$system_type" = "Linux" ]; then
    sudo apt install stow
    
    ./scripts/aptinstall.sh

    # Check zsh version
    echo "Current zsh version is $(zsh --version)"
    if [ $? -ne 0 ]; then
        exit 1
    else
        chsh -s $(which zsh)
    fi

    ./scripts/programs.sh
    ./scripts/desktop.sh
    
    # https://unix.stackexchange.com/questions/680413/opposite-of-adopt-option-for-gnu-stow
    stow ${to_symlink[@]} --target ${HOME} --adopt
    git reset --hard

    sudo apt upgrade -y

    source ~/.bashrc
    source ~/.zshrc

else

    ./scripts/homebrew.sh
    # Install homebrew?
    
    brew install stow

    brew bundle install

    # Install Oh-My-Zsh and Plugins
    if [ -d /Users/$USER/.oh-my-zsh ]; then 
    	sudo rm -r /Users/$USER/.oh-my-zsh
    fi
    
    ./scripts/programs/oh-my-zsh.sh
    
    stow ${to_symlink[@]} --target ${HOME} --adopt
    git reset --hard
    
    stow jrnl --target ${HOME}/.config/jrnl 
fi

# Conda init shells
conda init bash
conda init zsh

# Configure git credential manager
git-credential-manager configure

