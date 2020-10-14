#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Usages functions
#############################################################

not_bash() {
    echo "Your Shell is not bash"
    echo "This is a bash script file"
}

usage() {
    echo "Usage: ./bash_init.sh"
}

not_executed() {
    echo "This file is intended to be executed not sourced !"
    usage
}

