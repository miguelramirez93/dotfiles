return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{ "williamboman/mason.nvim" },
	},
	lazy = false,
	opts = {
		automatic_installation = true,
	},
	setup = function(opts)
		require("mason-lspconfig").setup(opts)
	end,
}
