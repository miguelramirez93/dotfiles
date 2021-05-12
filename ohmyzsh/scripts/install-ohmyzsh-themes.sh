#!/bin/bash
source ../../scripts/utils.sh

zsh_dir=$HOME/.oh-my-zsh/custom
echo "Creating custom themes dir"
mkdir -p $zsh_dir
echo "Coping zsh themes"
copy_dir ../themes $zsh_dir/themes
echo "OhMyZsh Themes copied!!"

