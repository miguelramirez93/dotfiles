#!/bin/bash
source ./utils.sh
echo "installing color schemas"
install_vim_package ../color-schemes/onedark.vim ~/.vim/pack/*/opt
install_vim_package ../color-schemes/dracula ~/.vim/pack/*/opt
