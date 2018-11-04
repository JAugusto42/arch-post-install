#!/usr/bin/env bash

#[TODO]###################################
# opçao para instalar um aur helper
# Navegadores
# evince-light
# Sublime
# 

function main() {
    clear
    echo "Installing base programs..."
    
    programs=(
    'wget' 'curl' 'zip' 'unzip' 'unrar' 'p7zip' 'lzop' 'cpio' 'xarchiver' 'gtk-engine-murrine'
    'ttf-dejavu' 'ttf-hack' 'telegram-desktop' 'libreoffice-fresh-pt-br' 'leafpad' 'firefox'
    )

    for pkg in "${programs[@]}"; do
       sudo pacman -Sy "${pkg}" --noconfirm
       clear
    done

    interface
}

function programming() {
    clear
    echo "Installing development programs..."

    programs=('ruby' 'ruby-bundler' 'gvim' 'go' 'git' 'code')

    for pkg in "${programs[@]}"; do
        sudo pacman -S "${pkg}" --noconfirm
    done

    configs
}

main
