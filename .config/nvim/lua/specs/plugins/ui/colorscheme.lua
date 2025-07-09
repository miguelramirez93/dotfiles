return {
	"webhooked/kanso.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
	},
	setup = function(opts)
		require("kanso").setup(opts)
		vim.cmd.colorscheme("kanso")
	end,
}
