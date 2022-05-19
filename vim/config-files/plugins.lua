-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
vim.g.NERDTreeQuitOnOpen = 1

vim.cmd [[
  function! NERDTreeToggleInCurDir()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
  endfunction
]]
return require('packer').startup(function()
   -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'neoclide/coc.nvim', branch = 'release'
  }

  use {
    'tpope/vim-fugitive', branch = 'master'
  }

  use 'nvim-lua/plenary.nvim'

  use 'nvim-telescope/telescope.nvim'

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'leafgarland/typescript-vim',
    branch = 'master'
  }

  use 'vim-airline/vim-airline'
  
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries'
  }

  use 'MaxMEllon/vim-jsx-pretty'

  use 'mg979/vim-visual-multi'

  use 'rafi/awesome-vim-colorschemes'

  use 'ryanoasis/vim-devicons'

  use 'jiangmiao/auto-pairs'

  use 'lewis6991/gitsigns.nvim'

  use 'akinsho/toggleterm.nvim'

  -- themes

  use { 'sainnhe/gruvbox-material', as = 'gruvbox-material' }

  use {'dracula/vim', as = 'dracula'}

  use { 'morhetz/gruvbox', as = 'gruvbox' }

  use 'chriskempson/base16-vim'
 
  use {
     'kyazdani42/nvim-tree.lua',
     requires = {
       'kyazdani42/nvim-web-devicons', -- optional, for file icon
     },
     tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

end)




