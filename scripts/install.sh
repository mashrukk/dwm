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
paru -S --noconfirm xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxft noto-fonts noto-fonts-emoji alacritty mpv libxinerama lxappearance brightnessctl pulsemixer playerctl pamixer flameshot fastfetch btop polkit-gnome feh xtrlock gnome-themes-extra papirus-icon-theme blueman
sudo systemctl enable bluetooth

# Thunar
./thunar.sh
clear
cd 

# Apps
paru -S --noconfirm obsidian signal-desktop syncthing keepassxc vulkan-headers
paru -S --noconfirm librewolf-bin
clear
paru -S --noconfirm vscodium-bin
clear
paru -S --noconfirm qview-git
clear
paru -S --noconfirm picom-ftlabs-git
paru -c --noconfirm
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

mkdir -p ~/Pictures/Wallpapers/
mkdir ~/Downloads
mkdir ~/Videos
mkdir -p ~/Documents/Shared/
mkdir -p ~/.local/share/icons/
mv ~/wm/cursor ~/.local/share/icons/
mv ~/wm/alacritty ~/.config/
mv wm/wall.jpg Pictures/Wallpapers
rm ~/wm/scripts/install.sh
cd
startx
