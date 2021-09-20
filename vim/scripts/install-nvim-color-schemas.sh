#!/bin/bash
source ./utils.sh
echo "installing color schemas"
install_vim_package ../color-schemes/dracula ~/.local/share/nvim/site/pack/dracula/start
install_vim_package ../color-schemes/vim-colors-xcode ~/.local/share/nvim/site/pack/vim-colors-xcode/start
install_vim_package ../color-schemes/gruvbox ~/.local/share/nvim/site/pack/gruvbox/start
install_vim_package ../color-schemes/gruvbox-material ~/.local/share/nvim/site/pack/gruvbox-material/start
