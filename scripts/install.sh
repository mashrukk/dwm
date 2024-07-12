#!/bin/bash

echo "Installing AUR helper..."
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin || exit
makepkg -si --noconfirm
cd ..
rm -rf paru-bin

echo "Installing packages"
paru -S hyprland waybar wofi swww noto-fonts noto-fonts-emoji alacritty mpv pavucontrol playerctl otf-font-awesome polkit-gnome gnome-themes-extra papirus-icon-theme blueman
sudo systemctl enable bluetooth

# Thunar
./thunar.sh
clear

# Apps
paru -S --noconfirm obsidian signal-desktop syncthing keepassxc
paru -S --noconfirm brave-bin
clear
paru -S --noconfirm qview-git
clear
paru -S --noconfirm vscodium-bin
clear
paru -S --noconfirm nwg-look-bin

echo "Configuring Hyprland Desktop Environment..."
mkdir -p ~/Pictures/wallpapers
mkdir -p ~/Documents/Shared
mkdir ~/Videos
cd ..
mv alacritty/ ~/.config/
mv wofi/ ~/.config/
mv wall.jpg ~/Pictures/wallpapers/
mv hyprland.conf ~/.config/hypr/hyprland.conf
rm scripts/install.sh
cd
sudo rm /usr/share/hyprland/*
clear
Hyprland
