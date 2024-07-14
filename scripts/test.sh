#!/bin/bash

thunar_packages=(
    thunar
    thunar-volman
    tumbler
    ffmpegthumbnailer
    udisks2
)

install_packages() {
    sudo apt update > /dev/null 2>&1
    sudo apt install --no-install-recommends -y "${thunar_packages[@]}" > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        exit 1
    fi
}

check_udisks_daemon() {
    if ! pgrep -x "udisksd" >/dev/null; then
        sudo service udisks2 start > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            exit 1
        fi
    fi
}

setup_thunar_volman_rules() {
    local volman_config_path=~/.config/Thunar/uca.xml
    if [ ! -f "$volman_config_path" ]; then
        mkdir -p ~/.config/Thunar
        cp assets/uca.xml ~/.config/Thunar/
    fi
}

install_packages
check_udisks_daemon
setup_thunar_volman_rules

echo "Thunar and essential related packages installed and configured successfully." > /dev/null 2>&1