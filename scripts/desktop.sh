#!/bin/bash

# Setup JetBrains font
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
fc-cache -f -v

# Setting up oh-my-zsh theme
cp ~/.dotfiles/oh-my-zsh/mpotto.zsh-theme ~/.oh-my-zsh/themes

# Install Dash-to-Dock extension
gdbus call --session \                               
           --dest org.gnome.Shell.Extensions \
           --object-path /org/gnome/Shell/Extensions \
           --method org.gnome.Shell.Extensions.InstallRemoteExtension \
           "dash-to-dock@micxgx.gmail.com"

gnome-extensions enable dash-to-dock@micxgx.gmail.com
# gnome-extensions-app for interactive usage

# Setting bar and other GNOME relevant configurations. 
./gnome-settings.sh

