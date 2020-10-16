#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Bash script to initialize Debian environments
#############################################################
MY_HOME=~

#######################################
# Sourcing files
#######################################
. ./lib/usages.sh
. ./lib/colors.sh
. ./lib/install.sh

#######################################
# Usages and parameters check
#######################################
[ "$0" = "$BASH_SOURCE" ] || { not_executed; return 1; }
[ $# -ne 0 ] && { usage; exit 1; }

#######################################
# Beginning of the script
#######################################
echo
color_echo 0 GREY "======================================="
color_echo 0 GREY "= Starting environment initialisation ="
color_echo 0 GREY "======================================="

echo
color_echo 0 PURPLE "Configuring locales..."
sudo dpkg-reconfigure locales

echo
color_echo 0 PURPLE "Copying config files..."
for file in `ls -A ./config`; do
    cp ./config/$file "${MY_HOME}"/
done

echo
color_echo 0 PURPLE "Editing .bashrc file..."
grep '\. ~/.bash_aliases' "${MY_HOME}"/.bashrc &>/dev/null || echo ". ${MY_HOME}/.bash_aliases" >> "${MY_HOME}"/.bashrc

echo
color_echo 0 PURPLE "Installing packages..."
# Adding packages
add_packages gedit git
add_packages vim
# Adding specific installs (see ./lib/install.sh)
ask_install "Visual Studio Code" "code"
#ask_install <Description> <package_name>

pre_install
install_packages
post_install

echo
color_echo 0 GREY "========================================="
color_echo 0 GREY "= Environment initialisation complete ! ="
color_echo 0 GREY "========================================="
echo

