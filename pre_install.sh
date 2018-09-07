#!/usr/bin/env bash

function main() {
    clear
    echo "Instalando base para a pós instalação..."
    
    programs=(
    'xorg-server' 'xorg-xinit' 'gvfs-mtp' 'xf86-video-intel' 'alsa-utils' 'pulseaudio' 'pavucontrol'
    'xdg-user-dirs' 'openssh' 'ufw' 'network-manager-applet'
    )

    for pkg in "${programs[@]}"; do
       sudo pacman -Sy "${pkg}" --noconfirm
       clear
    done

    interface
}

function interface() {
    clear
    echo 'Installing an interface...'

    programs=('xfce4' 'xfce4-goodies')

    for pkg in "${programs[@]}"; do
        pacman -Sy "${pkg}" --noconfirm
    done

    login_manager
}

function login_manager() {
    clear
    echo 'Installing an login manager'

    programs=('lightdm-gtk-greeter-settings')

    for pkg in "${programs[@]}"; do
        pacman -Sy "${pkg}" --noconfirm
    done

    programming
}

function programming() {
    clear
    echo "Installing development programs..."

    programs=('ruby' 'ruby-bundler' 'gvim')

    for pkg in "${programs[@]}"; do
        pacman -S "${pkg}" --noconfirm
    done

    configs
}

function configs() {
    clear
    echo "Setting..."
    comands=('systemctl enable lightdm.service' 'localectl set-x11-keymap br abnt2' 'xdg-user-dirs-update'
    'ufw enable' 'systemctl enable ufw.service' 'mount -o remount,size=4G,noatime /tmp'
    )

    for comand in "${comands}"; do
        "${comand}"
    done
}

main
