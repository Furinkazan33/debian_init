#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Custom packages step
#############################################################


echo
color_echo 0 PURPLE "Installing packages..."
# Adding packages
package_add gedit git
package_add vim vim-syntastic vim-fugitive exuberant-ctags

# Optionnal installations (see ./lib/install.sh)
package_ask "vim-plug from github" "vim-plug"
package_ask "Visual Studio Code from microsoft" "code"
#package_ask <Description> <package_name>

