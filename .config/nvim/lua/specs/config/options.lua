local opt = vim.opt
local g = vim.g

-- enable new loader for caching some
-- internal calls
-- vim.loader.enable()

opt.relativenumber = true
opt.number = true
opt.timeoutlen = 300
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.incsearch = true
opt.splitright = true
opt.splitbelow = true
opt.cursorline = true
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.updatetime = 250
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
-- vim.schedule(function()
-- 	vim.opt.clipboard = "unnamedplus"
-- end)
opt.termguicolors = true
opt.showmode = true
opt.swapfile = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.undofile = true
opt.writebackup = false
opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

-- readability
-- opt.list = true
-- opt.listchars = { eol = "↲", trail = "·", nbsp = "␣" }

-- enable spelling
opt.spell = true
opt.spelllang = "en_us,es"

-- netrw
g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

-- opt.laststatus = 3
-- -- Allow recursive find
opt.path:append("**")
