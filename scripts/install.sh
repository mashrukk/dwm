#!/bin/bash

echo "Installing AUR helper..."
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin || exit
makepkg -si --noconfirm
cd ..
rm -rf paru-bin

echo "Installing packages"
paru -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxft noto-fonts noto-fonts-emoji alacritty mpv libxinerama picom lxappearance brightnessctl pavucontrol playerctl pamixer flameshot otf-font-awesome polkit-gnome feh xtrlock gnome-themes-extra papirus-icon-theme blueman
sudo systemctl enable bluetooth

# Thunar
./thunar.sh
clear
cd 

# Apps
paru -S --noconfirm obsidian signal-desktop syncthing keepassxc ttf-indic-otf
paru -S --noconfirm librewolf-bin
clear
paru -S --noconfirm qview-git
clear
paru -S --noconfirm visual-studio-code-bin
clear
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
rm install.sh
cd
startx
