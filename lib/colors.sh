#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# color_echo is echo with indentation and colors
#############################################################

######################################
# Colors
######################################
declare -A COLORS
COLORS[NO_COLOUR]="\033[0m"
COLORS[GREY]="\033[1;30m"
COLORS[RED]="\033[1;31m"
COLORS[GREEN]="\033[1;32m"
COLORS[YELLOW]="\033[1;33m"
COLORS[DARK_BLUE]="\033[1;34m"
COLORS[PURPLE]="\033[1;35m"
COLORS[BLUE]="\033[1;36m"
COLORS[LIGHTGREY]="\033[1;37m"
COLORS[BLACK]="\033[1;38m"
COLORS[OK]=${COLORS[GREEN]}
COLORS[KO]=${COLORS[RED]}


# echoc n_indent color string
color_echo() {
    local indentation=$(head -c $1 < /dev/zero | tr '\0' '\40')
    local color=$2
    local mes=${*:3}

    echo -e "$indentation${COLORS[$color]}$mes${COLORS[NO_COLOUR]}"
}

color_list() {
    for color in ${!COLORS[@]}; do
        echo $color
    done | sort
}
