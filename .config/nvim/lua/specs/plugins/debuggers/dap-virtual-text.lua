return {
	"theHamsta/nvim-dap-virtual-text",
	event = "BufEnter",
	setup = function(_)
		require("nvim-dap-virtual-text").setup()
	end,
}
