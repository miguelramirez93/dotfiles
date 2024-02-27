local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

return {
	"neovim/nvim-lspconfig",
	event = "BufEnter",
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		{ "folke/neodev.nvim", opts = {} },
		"mason.nvim",
	},
	setup_servers = function(servers_list, capabilities)
		for name, cfg in pairs(servers_list) do
			local extended_cfg = vim.tbl_extend("keep", cfg, {
				-- currently LSP zero injects this
				-- capabilities = capabilities,
				handlers = handlers,
			})
			require("lspconfig")[name].setup(extended_cfg)
		end
	end,
}
