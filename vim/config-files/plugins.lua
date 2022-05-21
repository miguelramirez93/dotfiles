return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- use {
  --  'neoclide/coc.nvim', branch = 'release'
  -- }

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

  use "lunarvim/colorschemes"

  use {
     'kyazdani42/nvim-tree.lua',
     requires = {
       'kyazdani42/nvim-web-devicons', -- optional, for file icon
     },
     tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)




