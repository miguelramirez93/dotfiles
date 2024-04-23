#!/bin/bash


echo "Removing nvim configuration files..."

NVIM_SHARED_FOLDER=$HOME/.local/share/nvim
NVIM_CACHE_FOLDER=$HOME/.cache/nvim
NVIM_CFG_FOLDER=$HOME/.config/nvim

echo "Removing $NVIM_SHARED_FOLDER"
rm -rf $NVIM_SHARED_FOLDER

echo "Removing $NVIM_CACHE_FOLDER"
rm -rf $NVIM_CACHE_FOLDER

echo "Removing $NVIM_CFG_FOLDER"
rm -rf $NVIM_CFG_FOLDER


