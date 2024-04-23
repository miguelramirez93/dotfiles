return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	lazy = false,
	enabled = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"linrongbin16/lsp-progress.nvim",
			config = function()
				require("lsp-progress").setup()
			end,
		},
	},
	setup = function(_)
		local my_filename = require("lualine.components.filename"):extend()
		my_filename.apply_icon = require("lualine.components.filetype").apply_icon
		my_filename.icon_hl_cache = {}
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_b = { "branch" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = {},
				lualine_y = { require("lsp-progress").progress, "encoding", "progress" },
				lualine_z = {
					{ "location" },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = { "neo-tree", "lazy" },
		})
	end,
}
