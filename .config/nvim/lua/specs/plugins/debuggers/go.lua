return {
	"leoluz/nvim-dap-go",
	event = "BufEnter",
	opts = {},
	setup = function(opts)
		require("dap-go").setup(opts)
	end,
}
