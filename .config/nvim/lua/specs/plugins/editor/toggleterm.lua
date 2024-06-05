return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	keys = {
		{
			"<leader>j",
			"<cmd>ToggleTerm direction=float<cr>",
			desc = "Open terminal",
		},
		{
			"<leader>jh",
			"<cmd>ToggleTerm direction=horizontal<cr>",
			desc = "Open terminal",
		},
		{
			"<leader>jv",
			"<cmd>ToggleTerm direction=vertical<cr>",
			desc = "Open terminal",
		},
	},
	setup = function(opts)
		require("toggleterm").setup(opts)
	end,
}
