#!/bin/bash
echo "Coping config files"
mkdir -p ~/.config/vifm/colors
mkdir -p ~/.config/vifm/dev-icons
cp ../colors/gruvbox.vifm ~/.config/vifm/colors/gruvbox.vifm
cp ../icons/favicons.vifm ~/.config/vifm/dev-icons/favicons.vifm
cp ../vifmrc ~/.config/vifm/vifmrc
