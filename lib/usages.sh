#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Usages functions
#############################################################

not_bash() {
    color_echo 0 RED "Your Shell is not bash"
    color_echo 0 RED "This is a bash script file"
}

usage() {
    color_echo 0 RED "Usage: ./bash_init.sh"
}

not_executed() {
    color_echo 0 RED "This file is intended to be executed not sourced !"
    usage
}

