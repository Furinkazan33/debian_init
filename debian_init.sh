#! /bin/bash
#############################################################
# debian_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# Bash script to initialize Debian environments
#############################################################

# Usage
. ./lib/usages.sh
not_executed && return 1

# Sourcing files
. ./lib/colors.sh
. ./lib/packages.sh
. ./lib/post_install.sh

# Beginning of the script
. ./steps/0_start.sh

. ./steps/1_locales.sh
. ./steps/2_config_files.sh
. ./steps/3_custom_packages.sh
. ./steps/4_pre_install.sh
. ./steps/5_install.sh
. ./steps/6_post_install.sh

. ./steps/99_end.sh

