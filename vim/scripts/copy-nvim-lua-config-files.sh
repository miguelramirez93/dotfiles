#!/bin/bash
echo "Copiyng config files"
mkdir -p ~/.config/nvim/lua
cp ../config-files/init.lua ~/.config/nvim/init.lua
cp ../config-files/settings.lua ~/.config/nvim/lua/settings.lua
cp ../config-files/plugins.lua ~/.config/nvim/lua/plugins.lua
cp ../config-files/keymaps.lua ~/.config/nvim/lua/keymaps.lua
cp ../coc-settings.json ~/.config/nvim/coc-settings.json
