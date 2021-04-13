#!/bin/bash
source ./utils.sh


# Init plugins for vim initial set-up

install_vim_package ../plugins/coc ~/.vim/pack/coc/start
install_vim_package ../plugins/fugitive ~/.vim/pack/tpope/start
install_vim_package ../plugins/vim-airline ~/.vim/pack/dist/start
install_vim_package ../plugins/vim-gitgutter ~/.vim/pack/airblade/start
install_vim_package ../plugins/typescript-vim ~/.vim/pack/typescript/start

