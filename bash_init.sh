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

#######################################
# Adding aliases
#######################################
. ./lib/aliases.sh

#######################################
# Configuring locales
#######################################
sudo dpkg-reconfigure locales

#######################################
# Copying config files
#######################################
for file in `ls -A ./config`; do
    cp "./config/$file" "~/$file"
done

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

