#! /bin/bash
#############################################################
# bash_init
# Author : Mathieu Vidalies https://github.com/Furinkazan33
#############################################################
# pre_install step
#############################################################

# vscode
package_required "code" && {
    # test if installed
    if ! command -v "code" &> /dev/null; then
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
        sudo install -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        rm -f /tmp/packages.microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt-get install apt-transport-https
    else
        color_echo 0 RED "code is already installed !"
    fi
}

package_required "vim-plug" && {
    sudo apt-get install curl
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo "" >> ~/.vimrc
    echo "\" vim-plug" >> ~/.vimrc
    echo "call plug#begin('~/.vim/plugged')" >> ~/.vimrc

    echo "" >> ~/.vimrc
    echo "\" fzf plugin" >> ~/.vimrc
    echo "Plug 'junegunn/fzf'" >> ~/.vimrc
    echo "map ; :FZF<CR>" >> ~/.vimrc

    echo "" >> ~/.vimrc
    echo "\" lightline plugin" >> ~/.vimrc
    echo "Plug 'itchyny/lightline.vim'" >> ~/.vimrc

    echo "" >> ~/.vimrc
    echo "\" gitgutter plugin" >> ~/.vimrc
    echo "Plug 'airblade/vim-gitgutter'" >> ~/.vimrc
    echo "autocmd VimEnter * GitGutter" >> ~/.vimrc

    echo "" >> ~/.vimrc
    echo "call plug#end()" >> ~/.vimrc

    # Installing vim plugins in the post_install step
    post_install_add 'vim -c :PlugInstall &'
}

package_required "vim-syntastic" && {
    sudo apt-get install vim-syntastic
    echo "" >> ~/.vimrc
    echo "\" Syntastic options" >> ~/.vimrc
    echo "set statusline+=%#warningmsg#" >> ~/.vimrc
    echo "set statusline+=%{SyntasticStatuslineFlag()}" >> ~/.vimrc
    echo "set statusline+=%*" >> ~/.vimrc
    echo "let g:syntastic_always_populate_loc_list = 1" >> ~/.vimrc
    echo "let g:syntastic_auto_loc_list = 1" >> ~/.vimrc
    echo "let g:syntastic_check_on_open = 1" >> ~/.vimrc
    echo "let g:syntastic_check_on_wq = 0" >> ~/.vimrc
    echo "let g:syntastic_sh_checkers = ['shellcheck', 'sh']" >> ~/.vimrc
    echo "let g:syntastic_shell = \"/bin/bash\"" >> ~/.vimrc
}

package_required "your_package" && {
    color_echo 0 GREEN "Do stuff here needed for your_package"
}

