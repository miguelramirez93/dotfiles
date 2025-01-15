local opt = vim.opt
local g = vim.g

-- vim.cmd.syntax("off")
-- netrw
g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"
g.netrw_banner = 0
g.netrw_winsize = 75
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
opt.showmode = false
opt.swapfile = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.undofile = true
opt.writebackup = false
opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

-- wildmenu
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- readability
opt.list = true
-- TODO: show visible list char by triggering a command or keymap
-- opt.listchars = { eol = "↲", trail = " ", nbsp = "␣", tab = "  " }
opt.listchars = { eol = " ", trail = " ", nbsp = "␣", tab = "  " }

-- enable spelling
opt.spell = true
opt.spelllang = "en_us,es"
-- -- Allow recursive find
opt.path:append("**")

-- statusline
opt.laststatus = 3
-- enable new loader for caching some
-- internal calls
vim.loader.enable()
