return {
	"theHamsta/nvim-dap-virtual-text",
	event = "BufEnter",
	enabled = vim.g.enable_lsp_plugs,
	setup = function(_)
		require("nvim-dap-virtual-text").setup()
	end,
}
