return {
	"savq/melange-nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = false,
	},
	config = function(_, opts) end,
	setup = function(opts)
		-- require("melange").setup(opts)
		vim.cmd.colorscheme("melange")
	end,
}
