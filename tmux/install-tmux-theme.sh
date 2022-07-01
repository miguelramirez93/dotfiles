#!/bin/bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


cat ./tmux-gruvbox-dark.conf >> ~/.tmux.conf
tmux source ~/.tmux.conf

