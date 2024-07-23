#!/bin/bash

sudo apt install -y gnome-tweaks chrome-gnome-shell
git clone https://github.com/micheleg/dash-to-dock.git dock
cd dock && make install
cd ..
rm -rf dock
gnome-extensions enable -e ubuntu-dock@ubuntu.com
# gnome-extensions-app for interactive use.

dconf load /org/gnome < ../../gnome.dconf
