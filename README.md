# bash_init
bash script to initialize debian environments (locales, aliases, main config files, install packages ...)

## Current config files :
 - .bash_aliases
 - .exrc
 - .gitconfig
 - .netrc
 - .vimrc

## You can provide specific installations commands like following :
```
# Test if "my_package" is in the packages list
required "my_package" && {
  # Your commands here will be executed before the installation process
}
```

For example, if you want to install Visual Studio Code, just do the followings :

### Add this line to the bash_init script : 
```
ask_install "Visual Studio Code" "code"
```

### Add these lines to the lib/install script :
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
