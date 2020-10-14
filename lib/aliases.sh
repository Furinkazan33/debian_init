#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Adding aliases
#############################################################

[ -f ~/.bashrc ] {
    grep ". ~/.bash_aliases" ~/.bashrc || echo ". ~/.bash_aliases" >> ~/.bashrc
}

echo "alias grep='grep --color=auto'" >> ~/.bash_aliases
echo "alias fgrep='fgrep --color=auto'" >> ~/.bash_aliases
echo "alias egrep='egrep --color=auto'" >> ~/.bash_aliases
echo "alias ll='ls -l'" >> ~/.bash_aliases
echo "alias la='ls -A'" >> ~/.bash_aliases
echo "alias l='ls -CF'" >> ~/.bash_aliases
echo "alias lart='ls -lart'" >> ~/.bash_aliases
