vim.cmd("au TermOpen * setlocal nospell")
vim.cmd("hi SpellBad ctermfg=red guifg=red cterm=underline")
vim.cmd("autocmd FileType netrw setlocal number")

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
	callback = function()
		if vim.fn.getcwd() ~= vim.env.HOME then
			require("persistence").load()
		end
	end,
	nested = true,
})
