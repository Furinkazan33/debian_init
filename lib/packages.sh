#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Utility functions
#############################################################

# Blank space is important here
packages_to_install=" "

package_add() {
    # Blank space is important here
    packages_to_install="$packages_to_install $* "
}

package_ask() {
    [ $# -ne 2 ] && { color_echo 0 RED "Usage: package_ask <description> <package_name>"; return 1; }

    local question="$1"
    local package="$2"

    color_echo 2 DARK_BLUE "==> Install $question ? (y/n)"
    read answer

    [ "$answer" == "y" ] && package_add "$package"
}

package_required() {
    # Blank spaces are important here
    echo "$packages_to_install" | grep " $1 " > /dev/null && return 0
    return 1
}
