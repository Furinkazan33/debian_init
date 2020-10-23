#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# post_install function
#############################################################

POST_INSTALL=()

# Function to add post install commands
# post_install_add 'vim -c :PlugInstall'
post_install_add() {
    POST_INSTALL+=("$*")
}

post_install_exec() {

    for i in ${!POST_INSTALL[@]}; do 
        eval ${POST_INSTALL[$i]}
    done
}
