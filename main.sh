#!/bin/bash

#[INFO]###########################################
# Autor      = José Augusto                      #
# Date       = 12/06/2018                        #
# LastUpdate = 12/06/2018                        #
#-[TODO]-----------------------------------------#
# Adicionar uma opção de instalação de interface #
##################################################

function browser_install() {
    clear
    read -p "
    ----------------------
    --- Select browser ---
    ----------------------
    [1] - Firefox
    [2] - Google-Chome
    [3] - Opera
        0 - Back
->" input;

    case $input in
        1)
            clear
            sudo pacman -Sy firefox
            ;;
        2)
            clear
            $PKG -S google-chrome
            ;;
        3)
            clear
            sudo pacman -Sy opera
            ;;
        0)
            main
            ;;
        *)
            clear
            echo 'Wrong Input, try again...'
            sleep 1
            browser_install
            ;;
    esac
}

function aur_helper_install() {
    clear
    read -p "
    --- Select an aur helper ---
    [1] - yay
    [2] - bauerbill
    [3] - trizen
    [4] - aurman
->" input;

    if [[ $input -eq 1 ]]; then
        clear
        echo "Installing yay..."

        install "yay"

    elif [[ $input -eq 2 ]]; then
        clear
        echo "Installing bauerbill..."

        install "bauerbill"

    elif [[ $input -eq 3 ]]; then
        clear
        echo "Installing Trizen..."

        install "trizen"

    elif [[ $input -eq 4 ]]; then
        clear
        echo "Installing aurman..."

        install "aurman"

    else
        echo "Wrong input, try again..."
        aur_helper_install
    fi

}

function install() {
    for PKG in $1; do
        curl -o /tmp/${PKG}.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/${PKG}.tar.gz
        cd /tmp
        tar zxvf ${PKG}.tar.gz
         rm ${PKG}.tar.gz
         cd ${PKG}
         if sudo true; then
             makepkg -csi --noconfirm
             main
         else
             echo "Unable to makepkg, Permission Error!"
             exit 1
         fi
     done
}

function main() {
    clear
    read -p "
  -------------------------------
  --- Arch Linux Post Install ---
  -------------------------------
  [1] - Aur Helper
  [2] - Browser
  [3] - Terminals
  [4] - Development
  [5] - Office
  [6] - Text Editors
  [7] - Communication
  [8] - Fonts
  [9] - Tools
      0 - Exit

-> " input

    case $input in

    1)
        aur_helper_install
        ;;

    2)
        browser_install
        ;;
    3)
        terminals_install
        ;;
    4)
        development_install
        ;;
    5)
        office_install
        ;;
    6)
        text_editors_install
        ;;
    7)
        communication_install
        ;;
    8)
        fonts_install
        ;;
    9)
        tools_install
        ;;
    0)
        clear
        exit
        ;;
    *)
        clear
        echo "Wrong input, try again..."
        sleep 1
        main
        ;;
  esac
}

main
