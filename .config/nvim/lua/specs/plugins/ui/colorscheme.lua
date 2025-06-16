return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	setup = function(opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
