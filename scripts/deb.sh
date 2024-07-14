#!/bin/bash

sudo sed -i "1s/.*/Acquire::http::Pipeline-Depth \"$PARALLEL_DOWNLOADS\";/" /etc/apt/apt.conf.d/99parallel-downloads
sudo apt update

# DWM packages
sudo apt install --no-install-recommends coreutils xserver-xorg x11-xserver-utils xinit make libx11-dev libxft-dev libxinerama-dev build-essential fonts-noto-color-emoji libfribidi-dev unzip

sudo apt install --no-install-recommends lxappearance feh picom thunar alacritty

# Pipewire
ssudo apt install --no-install-recommends pamixer pipewire-pulse pipewire-alsa pipewire-jack pipewire-audio wireplumber pulseaudio-utils 

systemctl --user --now enable wireplumber.service

cd
git clone https://github.com/mashrukk/dwm
mv dwm/ wm

echo "Installing dwm, dmenu, and slstatus..."
cd wm/dwm || exit
sudo make clean install
cd ../dmenu || exit
sudo make clean install
cd ../slstatus || exit
sudo make clean install
cd
mv wm/xinitrc ~/.xinitrc

echo "Setting up picom"
cd
cd /etc/xdg/ || exit
sudo rm picom.conf
cd
sudo mv wm/picom.conf /etc/xdg/
cd
mv wm/alacritty ~/.config/
cd
mkdir Pictures
cd Pictures
mkdir wallpapers
cd
mv wm/wall.jpg Pictures/wallpapers
mkdir Videos
mkdir Documents
cd Documents
mkdir Shared
cd
cd wm/scripts
rm install.sh deb.sh suse.sh
cd
startx