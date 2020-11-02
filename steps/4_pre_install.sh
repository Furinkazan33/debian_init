#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# pre_install step
#############################################################

# vscode
package_required "code" && {
    # test if installed
    if ! command -v "code" &> /dev/null; then
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
        sudo install -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        rm -f /tmp/packages.microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt-get install apt-transport-https
    else
        color_echo 0 RED "code is already installed !"
    fi
}

package_required "your_package" && {
    color_echo 0 GREEN "Do stuff here needed for your_package"
}

