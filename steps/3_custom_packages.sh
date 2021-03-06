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
package_add vim vim-snippets vim-syntastic vim-fugitive vim-airline vim-airline-themes vim-lastplace exuberant-ctags netrw

# Optionnal installations (see ./steps/4_pre_install.sh)
package_ask "Visual Studio Code from microsoft" "code"
#package_ask <Description> <package_name>

