return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	disabled = true,
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "diagnostics" },
			lualine_c = {},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
	setup = function(opts)
		require("lualine").setup(opts)
	end,
}
