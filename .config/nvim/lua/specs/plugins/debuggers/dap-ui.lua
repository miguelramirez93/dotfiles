return {
	"rcarriga/nvim-dap-ui",
	event = "BufEnter",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	setup = function(_)
		require("dapui").setup()
	end,
}
