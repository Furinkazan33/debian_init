# debian_init
Customizable Bash script to initialize Debian environments (Debian, Ubuntu, Kali, ...)

## Features
- easily extensible
- initialize locales
- initialize ~/.config files => you can add yours (.bash_aliases, .exrc, .gitconfig, .netrc, .vimrc, ...)
- install packages from the defaults repositories
- install packages from other sources
- personnalized installations => you can add some commands to run before installation process
- interactive menu => you can ask for what you want to install

## Functions
```
package_add <packages list> : Adding these packages to the packages list
package_ask <description> <package> : Ask if this package is required and add to the packages list
package_required <package> : Test if the package is in the package list
post_install_add <command> : Add this command to the post_install step (usefull if you need to execute a command that is not yet installed)
```

## Example with Visual Studio Code

**Add this line to the debian_init script to ask for install**
```
package_ask "Visual Studio Code" "code"
```

**Add these lines to the lib/install script to add custom install**
```
# vscode
    package_required "code" && {
        # test if installed
        if ! command -v "code" &> /dev/null; then
            wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > ~/packages.microsoft.gpg
            sudo install -o root -g root -m 644 ~/packages.microsoft.gpg /etc/apt/trusted.gpg.d/
            rm ~/packages.microsoft.gpg
            sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
            sudo apt-get install apt-transport-https
        else
            echo "code is already installed !"
        fi
    }

```

**Execution result**
```
$ ./bash_init.sh 
=======================================
= Starting environment initialisation =
=======================================

Configuring locales...
Generating locales (this might take a while)...
  en_US.UTF-8... done
  fr_FR.UTF-8... done
Generation complete.

Copying config files...

Creating aliases...

Installing packages...

Install Visual Studio Code ? (y/n)
y
code is already installed !

. . . default packages installation process occuring here . . .

=========================================
= Environment initialisation complete ! =
=========================================
```
