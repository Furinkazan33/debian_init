#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# config step
#############################################################

MY_HOME=~

echo
color_echo 0 PURPLE "Copying config files..."
for file in `ls -A ./config`; do
    cp -pr ./config/$file "${MY_HOME}"/
done

echo
color_echo 0 PURPLE "Editing .bashrc file..."
grep '\. ~/.bash_aliases' "${MY_HOME}"/.bashrc &>/dev/null || echo ". ${MY_HOME}/.bash_aliases" >> "${MY_HOME}"/.bashrc

