return {
	"VonHeikemen/lsp-zero.nvim",
	setup = function(_)
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_lspconfig()

		-- lsp_zero.on_attach(function(client, bufnr)
		-- 	lsp_zero.default_keymaps({ buffer = bufnr })
		-- end)
	end,
}
