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
		linehl = {
			[vim.diagnostic.severity.ERROR] = "SpellBad",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
