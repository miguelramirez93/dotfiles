return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		-- configurations go here
		attach_navic = false,
		show_dirname = false,
		show_modified = true,
	},
	setup = function(opts)
		require("barbecue").setup(opts)
	end,
}
