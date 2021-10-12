#!/bin/bash
sudo apt-get update -y
sudo apt-get install ripgrep -y
sudo apt-get install fzf -y
sudo apt install fd-find -y

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update -y
sudo apt-get install neovim -y

sudo apt install python3-autopep8 -y
