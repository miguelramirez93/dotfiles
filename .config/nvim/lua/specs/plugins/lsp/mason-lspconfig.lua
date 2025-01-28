return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{ "williamboman/mason.nvim" },
	},
	enabled = vim.g.enable_lsp_plugs,
	lazy = false,
	opts = {
		automatic_installation = true,
	},
	setup = function(opts)
		require("mason-lspconfig").setup(opts)
	end,
}
