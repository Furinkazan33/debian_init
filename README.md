# bash_init
Customizable Bash script to initialize Debian environments (locales, aliases, main config files, install packages ...)

## Features
- easily extensible
- initialize locales
- initialize ~/.config files => you can add yours
- default packages installations => you can choose wich packages to install
- personnalized installations => you can add some commands to run before installation process
- interactive menu => you can ask for what you want to install

### Config files :
 - .bash_aliases
 - .exrc
 - .gitconfig
 - .netrc
 - .vimrc

### You can add specific installations commands in the pre_install process
```
# Test if "my_package" is in the packages list
required "my_package" && {
  # Your commands here will be executed before the installation process
}
```

For example, if you want to install Visual Studio Code, just do the followings :

### You can ask for package installation
```
ask_install <description> <package_name>
```

## Example with Visual Studio Code

### Add this line to the debian_init script
```
ask_install "Visual Studio Code" "code"
```

### Add these lines to the lib/install script
```
# vscode
    required "code" && {
        # test if installed
        if ! command -v "code" &> /dev/null; then
            wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > ~/packages.microsoft.gpg
            sudo install -o root -g root -m 644 ~/packages.microsoft.gpg /etc/apt/trusted.gpg.d/
            rm ~/packages.microsoft.gpg
            sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
            sudo apt-get install apt-transport-https
            sudo apt-get update
        else
            echo "code is already installed !"
        fi
    }

```
### Execution result
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
