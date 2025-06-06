local formaters = {
	go = { "gofumpt", "goimports", "goimports-reviser" },
	lua = { "stylua" },
	typescript = { { "prettierd", "prettier" } },
	python = { "autopep8", "ruff_organize_imports" },
}

local function format_on_save_wrapper(bufnr)
	-- Disable with a global or buffer-local variable
	if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
		return
	end
	return { timeout_ms = 500, lsp_format = "fallback" }
end

-- TODO: Make this a formatting tool agnostic function
-- should relay in abstraction level
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	event = "BufEnter",
	setup = function(_)
		require("conform").setup({
			formatters_by_ft = formaters,
			format_on_save = format_on_save_wrapper,
		})
	end,
}
