" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'https://github.com/tpope/vim-fugitive.git', {'branch': 'master'}

Plug 'davidhalter/jedi-vim', {'branch': 'master'}

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

Plug 'https://github.com/leafgarland/typescript-vim.git', {'branch': 'master'}

Plug 'https://github.com/vim-airline/vim-airline.git', {'branch': 'master'}

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'https://github.com/MaxMEllon/vim-jsx-pretty.git', {'branch': 'master'}

Plug 'https://github.com/mg979/vim-visual-multi.git', {'branch': 'master'}

"Plug 'https://github.com/vifm/vifm.vim', {'branch': 'master'}

Plug 'https://github.com/rafi/awesome-vim-colorschemes'

" Plug 'https://github.com/terryma/vim-multiple-cursors'

Plug 'ryanoasis/vim-devicons'

Plug 'jiangmiao/auto-pairs'

Plug 'nvim-lua/plenary.nvim'

Plug 'lewis6991/gitsigns.nvim'

Plug 'akinsho/toggleterm.nvim'

Plug 'preservim/nerdtree'

" themes

Plug 'https://github.com/sainnhe/gruvbox-material.git', {'branch': 'master', 'as': 'gruvbox-material'}

Plug 'dracula/vim', {'branch': 'master', 'as': 'dracula' }

Plug 'https://github.com/morhetz/gruvbox.git', {'branch': 'master', 'as': 'gruvbox'}

Plug 'chriskempson/base16-vim'      

Plug 'sainnhe/everforest'

call plug#end()
