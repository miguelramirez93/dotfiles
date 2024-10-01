#!/bin/bash

echo "Installing nvim config"

NVIM_FOLDER=$HOME/.config/

echo "Copying dotfiles to $NVIM_FOLDER"

cp -r ../.config/nvim $NVIM_FOLDER
