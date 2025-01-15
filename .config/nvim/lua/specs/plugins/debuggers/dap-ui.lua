return {
	"rcarriga/nvim-dap-ui",
	event = "BufEnter",
	enabled = vim.g.enable_lsp_plugs,
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	setup = function(_)
		require("dapui").setup()
	end,
}
