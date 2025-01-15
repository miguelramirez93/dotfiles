return {
	"leoluz/nvim-dap-go",
	event = "BufEnter",
	enabled = vim.g.enable_lsp_plugs,
	opts = {},
	setup = function(opts)
		require("dap-go").setup(opts)
	end,
}
