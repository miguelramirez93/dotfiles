return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	enabled = vim.g.enable_lsp_plugs,
	opts = {
		use_diagnostic_signs = true,
	},
}
