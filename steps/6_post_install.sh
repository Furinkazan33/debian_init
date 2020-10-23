#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# post_install step
#############################################################


echo 
color_echo 0 PURPLE "Executing the post install commands..."
post_install_exec

echo 
color_echo 0 PURPLE "Cleaning up..."
sudo apt autoremove

