#!/bin/bash
echo "Copying i3 config"
cp ../config-files/config ~/.config/i3/config
echo "Copying kitty config"
mkdir -p ~/.config/kitty 
cp ../config-files/kitty-gruvbox-theme.conf ~/.config/kitty/theme.conf
cp ../config-files/kitty.conf ~/.config/kitty/kitty.conf
