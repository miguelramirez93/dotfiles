#!/bin/bash
echo "Initialating Vim env"
source ./utils.sh
echo "Checking dependencies"
command_exist node
command_exist go
command_exist ag
echo "installing plugins"
source ./init-vim-plugins.sh
echo "installing color schemas"
source ./install-color-schemas.sh
echo "Coping config files"
cp ../vimrc  ~/.vimrc
cp ../coc-settings.json  ~/.vim/coc-settings.json

