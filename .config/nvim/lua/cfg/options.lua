local opt = vim.opt
-- local o = vim.o

-- enable new loader for caching some
-- internal calls
vim.loader.enable()

opt.relativenumber = true
opt.number = true
opt.timeoutlen = 250
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.incsearch = true
opt.splitright = true
opt.splitbelow = true
opt.cursorline = true
opt.guioptions = "-r"
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.updatetime = 50
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.showmode = false
opt.swapfile = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.undofile = true
opt.writebackup = false
-- opt.colorcolumn = "80"
opt.hlsearch = false
opt.incsearch = true
-- o.lazyredraw = true
-- opt.guicursor = "n-v-c-i:block"

-- enable spelling
opt.spelllang = "en_us,es_mx"
opt.spell = true
