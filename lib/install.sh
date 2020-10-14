#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Utility functions
#############################################################

packages_to_install=" "

required() {
    echo "$packages_to_install" | grep " $1 " > /dev/null && return 0
    return 1
}

install_packages() {    
    # vscode
    required "code" && {
        # test if installed
        if ! command -v "code" &> /dev/null; then
            wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > ~/packages.microsoft.gpg
            sudo install -o root -g root -m 644 ~/packages.microsoft.gpg /etc/apt/trusted.gpg.d/
            rm ~/packages.microsoft.gpg
            sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
            sudo apt-get install apt-transport-https
            sudo apt-get update
        else
            echo "code is already installed !"
        fi
    }

    required "your_package" && {
        echo "Do stuff before installing this package"
    }

    # Installing
    sudo apt-get install $packages_to_install

    # Cleaning
    sudo apt autoremove
}

add_packages() {
    packages_to_install="$packages_to_install $* "
}

ask_install() {
    [ $# -ne 2 ] && { echo "Usage: ask_install <description> <package_name>"; return 1; }

    local question="$1"
    local package="$2"

    echo "Install $question ? (y/n)"
    read answer

    [ "$answer" == "y" ] && add_packages "$package"
}

