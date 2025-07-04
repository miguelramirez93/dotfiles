return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	setup = function(opts)
		vim.cmd.colorscheme("gruvbox")
	end,
}
