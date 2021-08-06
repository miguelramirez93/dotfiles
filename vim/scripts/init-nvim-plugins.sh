#!/bin/bash
source ./utils.sh


# Init plugins for vim initial set-up
echo "installing plugins"
install_vim_package ../plugins/coc ~/.local/share/nvim/site/pack/coc/start
install_vim_package ../plugins/fugitive ~/.local/share/nvim/site/pack/tpope/start
install_vim_package ../plugins/vim-airline ~/.local/share/nvim/site/pack/dist/start
install_vim_package ../plugins/vim-gitgutter ~/.local/share/nvim/site/pack/airblade/start
install_vim_package ../plugins/typescript-vim ~/.local/share/nvim/site/pack/typescript/start
install_vim_package ../plugins/vim-go ~/.local/share/nvim/site/pack/plugins/start
install_vim_package ../plugins/ack.vim ~/.local/share/nvim/site/pack/ack/start
install_vim_package ../plugins/ctrlp ~/.local/share/nvim/site/pack/ctrlp/start
install_vim_package ../plugins/vim-jsx-pretty ~/.local/share/nvim/site/pack/vim-jsx-pretty/start
install_vim_package ../plugins/vim-visual-multi ~/.local/share/nvim/site/pack/vim-visual-multi/start
install_vim_package ../plugins/jedi-vim ~/.local/share/nvim/site/pack/jedi-vim/start

