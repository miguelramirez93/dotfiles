return {
	"leoluz/nvim-dap-go",
	opts = {},
	setup = function(opts)
		require("dap-go").setup(opts)
	end,
}
