return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = false,
	},
	config = function(_, opts) end,
	setup = function(opts)
		require("kanagawa").setup(opts)
		vim.cmd.colorscheme("kanagawa-dragon")
	end,
}
