return {
	"tamton-aquib/staline.nvim",
	version = "*",
	event = "VeryLazy",
	enabled = true,
	setup = function(_)
		require("staline").setup({
			defaults = {
				line_column = "[%l:%c] P %p%% ",
				true_colors = true,
				left_separator = "",
				right_separator = "",
			},
			mode_colors = {
				n = "#7287fd",
				i = "#dd7878", -- etc mode
				c = "#df8e1d",
				v = "#ea76cb",
			},
			sections = {
				left = {
					-- "right_sep",
					"-mode",
					-- "left_sep",
					"- ",
					-- "right_sep",
					"-branch",
					-- "left_sep",
					" ",
					-- "file_name",
					-- " ",
					"lsp",
				},
				mid = {},
				right = {
					"cool_symbol",
					-- "right_sep",
					"-line_column",
					-- "left_sep"
				},
			},
			lsp_symbols = {
				Error = "󰨰 ",
				Info = "󰋽 ",
				Warn = " ",
				Hint = " ",
			},
		})
	end,
}
