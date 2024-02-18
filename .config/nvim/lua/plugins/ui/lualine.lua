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
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "branch" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { require("lsp-progress").progress },
				lualine_y = { "filetype", "encoding", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
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
