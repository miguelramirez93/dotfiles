return {
	"stevearc/oil.nvim",
	opts = {
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		-- win_options = {
		-- 	winbar = "%{v:lua.require('oil').get_current_dir()}",
		float = {
			padding = 2,
			max_width = 90,
			max_height = 0,
		},
		win_options = {
			wrap = true,
			winblend = 0,
		}, -- },
	},
	enabled = false,
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	setup = function(opts)
		require("oil").setup(opts)
	end,
}
