#!/bin/bash

sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$nc\"/g" /etc/makepkg.conf
sudo sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g" /etc/makepkg.conf

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
paru -S --noconfirm obsidian signal-desktop syncthing keepassxc
paru -S --noconfirm brave-bin
clear
paru -S --noconfirm vscodium-bin
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
