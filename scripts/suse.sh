#!/bin/bash

sudo zypper in --no-recommends fastfetch fontawesome-fonts tiro-bangla-fonts

# Signal
zypper addrepo https://download.opensuse.org/repositories/home:nuklly/openSUSE_Tumbleweed/home:nuklly.repo
zypper refresh
zypper install signal-desktop

# Librewolf
sudo rpm --import https://rpm.librewolf.net/pubkey.gpg
sudo zypper ar -ef https://rpm.librewolf.net librewolf
sudo zypper ref
sudo zypper in librewolf

# Obsidian
zypper addrepo https://download.opensuse.org/repositories/home:DenysMadureira/openSUSE_Tumbleweed/home:DenysMadureira.repo
zypper refresh
zypper install obsidian

# VSCodium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/zypp/repos.d/vscodium.repo
sudo zypper in codium

fastfetch
