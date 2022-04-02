#!/bin/bash
echo "Installing i3"
sudo pacman -Syy i3
echo "Installing nitrogen"
sudo pacman -Syy nitrogen
echo "Uninstalling xfdesktop"
sudo pacman -Rc xfdesktop
echo "remplacing default wm by i3"
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa i3
echo "Installing rofi"
sudo pacman -Syy rofi
source ../../rofi_themes/setup.sh
echo "Installing kitty terminal"
sudo pacman -Syy kitty
source ./copy_config_files.sh

