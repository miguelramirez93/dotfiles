vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	underline = true,
	signs = {
		text = {
			-- [vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.ERROR] = "󰨰",
			[vim.diagnostic.severity.WARN] = "▲",
			-- [vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.HINT] = "",
			-- [vim.diagnostic.severity.INFO] = "»",
			[vim.diagnostic.severity.INFO] = "󰋽",
		},
		-- linehl = {
		-- 	[vim.diagnostic.severity.ERROR] = "SpellBad",
		-- },
		-- numhl = {
		-- 	[vim.diagnostic.severity.WARN] = "WarningMsg",
		-- },
	},
})

-- close quickfix list after select an item
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]],
})

-- auto select quickfix element
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.keymap.set("n", "<Up>", "<Up><CR><C-w>p", { buffer = true, remap = false, desc = "Navigate up quickfix" })
		vim.keymap.set(
			"n",
			"<Down>",
			"<Down><CR><C-w>p",
			{ buffer = true, remap = false, desc = "Navigate down quickfix" }
		)
	end,
})
