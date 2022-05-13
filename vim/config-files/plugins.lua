-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
vim.g.NERDTreeQuitOnOpen = 1

vim.cmd [[
  function! NERDTreeToggleInCurDir()
    " If NERDTree is open in the current buffer
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
      exe ":NERDTreeClose"
    else
      exe ":NERDTreeFind"
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

  use 'preservim/nerdtree'

  -- themes

  use { 'sainnhe/gruvbox-material', as = 'gruvbox-material' }

  use {'dracula/vim', as = 'dracula'}

  use { 'morhetz/gruvbox', as = 'gruvbox' }

  use 'chriskempson/base16-vim'
 

end)




