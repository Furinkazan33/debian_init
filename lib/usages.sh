#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Usages functions
#############################################################

usage() {
    echo -e "\033[1;31m""Usage: ./debian_init.sh""\033[0m"
}

not_executed() {
    [ "$0" != "./debian_init.sh" ] && {
        echo -e "\033[1;31m""This file is intended to be executed not sourced !""\033[0m"
        usage
        return 0
    }
    return 1
}
