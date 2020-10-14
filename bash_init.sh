#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Bash script to initialize environment
#############################################################

#######################################
# Usages and parameters check
#######################################
. ./lib/usages.sh
[ "$0" = "$BASH_SOURCE" ] || { not_executed; return 1; }

#######################################
# Copying config files
#######################################
for file in `ls -A ./config`; do
    cp ./config/$file ~/
done

#######################################
# .bashrc and .bash_aliases
#######################################
[ ! -f ~/.bashrc ] && touch ~/.bashrc
grep -q ". ~/.bash_aliases" ~/.bashrc || echo ". ~/.bash_aliases" >> ~/.bashrc

#######################################
# Configuring locales
#######################################
sudo dpkg-reconfigure locales

#######################################
# Packages installations
#######################################
. ./lib/install.sh

# Packages list
add_packages gedit git
add_packages vim

# Specific installations here (see ./lib/install.sh)
ask_install "Visual Studio Code" "code"
#ask_install <Description> <package_name>

install_packages

