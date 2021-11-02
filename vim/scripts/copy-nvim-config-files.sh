#!/bin/bash
echo "Coping config files"
mkdir -p ~/.config/nvim/general
cp ../config-files/settings.vim ~/.config/nvim/general/settings.vim
mkdir -p ~/.config/nvim/plugins
cp ../config-files/vim-plug.vim ~/.config/nvim/plugins/vim-plug.vim
mkdir -p ~/.config/nvim/keys
cp ../config-files/mappings.vim ~/.config/nvim/keys/mappings.vim
cp ../config-files/init.vim ~/.config/nvim/init.vim
cp ../coc-settings.json ~/.config/nvim/coc-settings.json

