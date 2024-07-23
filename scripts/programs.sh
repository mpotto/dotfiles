#!/bin/bash

sudo apt update

declare -A binaries

# Update binaries once a while.
# google-chrome: not needed
# rstudio: https://dailies.rstudio.com/links/#rstudio-desktop-stable
# jabref: https://github.com/JabRef/jabref/releases/latest
# gcm: https://github.com/git-ecosystem/git-credential-manager/releases/latest
# dropbox: https://www.dropbox.com/install-linux
# zoom: https://zoom.us/download
# vscode: not needed

binaries["google-chrome"]="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
binaries["rstudio"]="https://rstudio.org/download/latest/stable/server/jammy/rstudio-server-latest-amd64.deb"
binaries["jabref"]="https://github.com/JabRef/jabref/releases/download/v5.15/jabref_5.15_amd64.deb"
binaries["gcm"]="https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.5.1/gcm-linux_amd64.2.5.1.deb"
binaries["dropbox"]="https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2024.04.17_amd64.deb"
binaries["zoom"]="https://zoom.us/client/6.1.1.443/zoom_amd64.deb"
binaries["vscode"]="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

function install {
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        echo ${binaries[$1]}
        curl -L ${binaries[$1]} -o ${1}.deb
        sudo apt install -y ./${1}.deb
        rm -rf ${1}.deb
    else
        echo "Already installed: ${1}"
    fi
}

# Install Docker and R
cd programs/

./oh-my-zsh.sh
./docker.sh
./keepassxc.sh
./miniconda.sh
./pdm.sh
./r.sh
./rig.sh

# Install binaries
install google-chrome
install rstudio
install jabref
install gcm
install dropbox
install zoom
install vscode 

# Install macchina
cargo install macchina



