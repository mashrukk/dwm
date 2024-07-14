#!/bin/bash

sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$nc\"/g" /etc/makepkg.conf
sudo sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g" /etc/makepkg.conf

# Librewolf
sudo rpm --import https://rpm.librewolf.net/pubkey.gpg

sudo zypper ar -ef https://rpm.librewolf.net librewolf

sudo zypper ref

sudo zypper install librewolf

# Brave
sudo zypper install curl

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo zypper install brave-browser

#sudo zypper in --no-recommends'
#sudo zypper rm -u'
# Apps
sudo zypper in --no-recommends xorg-x11-server xorg-x11-xinit xrandr xsetroot libXft libXinerama gcc picom noto-fonts

# DWM
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
