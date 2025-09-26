return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufEnter",
	disabled = false,
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = true },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
	main = "ibl",
	setup = function(opts)
		require("ibl").setup(opts)
	end,
}
