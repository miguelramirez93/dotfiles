return {
	"vague2k/vague.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = false,
	},
	config = function(_, opts) end,
	setup = function(opts)
		require("vague").setup(opts)
		vim.cmd.colorscheme("vague")
	end,
}
