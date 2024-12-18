return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	enabled = false,
	event = "VeryLazy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		-- configurations go here
		attach_navic = false,
		show_dirname = true,
		show_modified = true,
		exclude_filetypes = { "toggleterm" },
	},
	setup = function(opts)
		require("barbecue").setup(opts)
	end,
}
