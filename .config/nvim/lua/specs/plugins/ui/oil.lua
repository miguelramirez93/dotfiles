return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true, -- Show hidden files
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	setup = function(opts)
		require("oil").setup(opts)
	end,
}
