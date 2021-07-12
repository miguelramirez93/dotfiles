#!/bin/bash
source ./utils.sh


# Init plugins for vim initial set-up
echo "installing plugins"
install_vim_package ../plugins/coc ~/.vim/pack/coc/start
install_vim_package ../plugins/fugitive ~/.vim/pack/tpope/start
install_vim_package ../plugins/vim-airline ~/.vim/pack/dist/start
install_vim_package ../plugins/vim-gitgutter ~/.vim/pack/airblade/start
install_vim_package ../plugins/typescript-vim ~/.vim/pack/typescript/start
install_vim_package ../plugins/vim-go ~/.vim/pack/plugins/start
install_vim_package ../plugins/ack.vim ~/.vim/pack/ack/start
install_vim_package ../plugins/ctrlp ~/.vim/pack/ctrlp/start
install_vim_package ../plugins/vim-jsx-pretty ~/.vim/pack/vim-jsx-pretty/start
install_vim_package ../plugins/vim-visual-multi ~/.vim/pack/vim-visual-multi/start

