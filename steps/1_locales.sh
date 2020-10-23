#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Configuring locales step
#############################################################

echo
color_echo 0 PURPLE "Configuring locales..."
sudo dpkg-reconfigure locales
