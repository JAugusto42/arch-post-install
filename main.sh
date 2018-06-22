#!/bin/bash

#[INFO]###########################################
# Autor      = José Augusto                      #
# Date       = 12/06/2018                        #
# LastUpdate = 13/06/2018                        #
#-[TODO]-----------------------------------------#
##################################################

function text_editors_install() {
    clear
    read -p "
    ----------------------------
    --- Select a office tool ---
    ----------------------------
    [1] - libreoffice-fresh-pt-br
    [2] - mousepad
    [3] - leafpad
->" input;

    case $input in
        1)
            sudo pacman -Sy libreoffice-fresh-pt-br
            text_editors_install
            ;;
        2)
            sudo pacman -Sy mousepad
            text_editors_install
            ;;
        3)
            sudo pacman -Sy leafpad
            text_editors_install
            ;;
        0)
            main
            ;;
        *)
            clear
            echo "Wrong Input, try again..."
            sleep 1
            text_editors_install
    esac
}

function development_install() {
    clear
    read -p "
    ---------------------------------
    --- Select a development tool ---
    ---------------------------------
    [1] - Atom
    [2] - Sublime
    [3] - Visual Studio Code
    [4] - Gvim
        [0] - back
->" input;

    case $input in
        1)
            sudo pacman -Sy atom
            development_install
            ;;
        2)
            # Install from oficial guide on site
            development_install
            ;;
        3)
            ${PKG} -S visual-studio-code-bin
            development_install
            ;;
        4)
            sudo pacman -Sy gvim
            development_install
            ;;
        0)
            main
            ;;
        *)
            clear
            echo "Wrong Input, try again..."
            sleep 1
            development_install
    esac

}

function terminals_install() {
    clear
    read -p "
    -----------------------
    --- Select terminal ---
    -----------------------
    [1] - Terminator
    [2] - Tilix
    [3] - Guake
    [4] - termite
        [0] - Back
->" input;

    case $input in
        1)
            sudo pacman -Sy terminator
            terminals_install
            ;;
        2)
            sudo pacman -Sy tilix
            terminals_install
            ;;
        3)
            sudo pacman -Sy guake
            terminals_install
            ;;
        4)
            sudo pacman -Sy termite
            ;;
        0)
            main
            ;;
        *)
            clear
            echo "Wrong input, try again..."
            sleep 1
            terminals_install
    esac

}

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
            browser_install
            ;;
        2)
            clear
            $PKG -S google-chrome
            browser_install
            ;;
        3)
            clear
            sudo pacman -Sy opera
            browser_install
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
        [0] - back
->" input;
    #TODO trocar pelo case
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

    elif [[ $input -eq 0 ]]; then
        main
    else
        echo "Wrong input, try again..."
        aur_helper_install
    fi

}

function install() {
    # This function exists for aur_helper installer,
    # because i use the package on aur with a pkgbuild. 
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
  [5] - Text Editors
  [6] - Communication
  [7] - Fonts
  [8] - Tools
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
        text_editors_install
        ;;
    6)
        communication_install
        ;;
    7)
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
