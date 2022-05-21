#!/bin/bash
echo "Copiyng config files"
mkdir -p ~/.config/nvim/lua
cp -r ../lua/ ~/.config/nvim/lua/
cp ../config-files/init-n.lua ~/.config/nvim/init.lua
#cp ../config-files/init.lua ~/.config/nvim/init.lua
#cp ../config-files/settings.lua ~/.config/nvim/lua/settings.lua
#cp ../config-files/plugins.lua ~/.config/nvim/lua/plugins.lua
#cp ../config-files/keymaps.lua ~/.config/nvim/lua/keymaps.lua
#cp ../coc-settings.json ~/.config/nvim/coc-settings.json
#cp ../config-files/nvim-tree.lua ~/.config/nvim/lua/nvim-tree.lua
#cp ../config-files/cmp.lua ~/.config/nvim/lua/cmp.lua
#cp -r ../config-files/lsp/ ~/.config/nvim/lua/lsp/
