local winbar = require("specs.config.winbar")
local statusline = require("specs.config.statusline")

vim.cmd("au TermOpen * setlocal nospell")
-- vim.cmd("hi SpellBad ctermfg=red guifg=red cterm=underline")
vim.cmd("autocmd FileType netrw setlocal number")

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
-- 	callback = function()
-- 		if vim.fn.getcwd() ~= vim.env.HOME then
-- 			require("persistence").load()
-- 		end
-- 	end,
-- 	nested = true,
-- })

vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

-- Disable automatically adding comments to the next line
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })

		-- Disable swapfiles
		vim.bo.swapfile = false

		-- Insert 4 spaces instead of a tab char when pressing the tab key in insert
		-- modes
		vim.bo.expandtab = true

		-- Tab counts for 4 spaces
		vim.bo.tabstop = 4
	end,
})

-- custom winbar
-- TODO: create a plugin for this
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.wo.winbar = winbar.build_static()
	end,
})

-- custom statusline
vim.api.nvim_create_autocmd({ "UIEnter", "ModeChanged", "BufEnter" }, {
	callback = function()
		vim.wo.statusline = statusline.build()
	end,
})
