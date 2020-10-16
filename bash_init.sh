#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Bash script to initialize environment
#############################################################
MY_HOME=~

#######################################
# Usages and parameters check
#######################################
. ./lib/usages.sh
[ "$0" = "$BASH_SOURCE" ] || { not_executed; return 1; }
[ $# -ne 0 ] && { usage; exit 1; }

#######################################
# Configuring locales
#######################################
echo "Configuring locales..."
sudo dpkg-reconfigure locales

#######################################
# Copying config files
#######################################
echo "Copying config files..."
for file in `ls -A ./config`; do
    cp ./config/$file "${MY_HOME}"/
done

#######################################
# .bashrc and .bash_aliases
#######################################
echo "Creating aliases..."
[ ! -f "${MY_HOME}"/.bashrc ] && touch "${MY_HOME}"/.bashrc
grep -q '\. ~/.bash_aliases' "${MY_HOME}"/.bashrc || echo ". ${MY_HOME}/.bash_aliases" >> "${MY_HOME}"/.bashrc

#######################################
# Packages installations
#######################################
echo "Installing packages..."
. ./lib/install.sh

# Adding packages
add_packages gedit git
add_packages vim

# Adding specific installs (see ./lib/install.sh)
ask_install "Visual Studio Code" "code"
#ask_install <Description> <package_name>

pre_install

install_packages

post_install
