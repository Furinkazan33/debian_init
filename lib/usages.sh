#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Usages functions
#############################################################

not_bash() {
    echo "Your Shell is $0"
    echo "This is a bash source file"
}

usage() {
    echo "Usage: ./bash_init.sh"
}

not_executed() {
    echo "This file is intended to be executed not sourced !"
    usage
}

[ "$0" != "bash" ] && { not_bash; exit 1; }
[ "$0" = "$BASH_SOURCE" ] || { not_executed; return 1; }

