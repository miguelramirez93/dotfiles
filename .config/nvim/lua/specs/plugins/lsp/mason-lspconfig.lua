return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	priority = 700,
	opts = {
		automatic_installation = true,
	},
	setup = function(opts)
		require("mason-lspconfig").setup(opts)
	end,
}
