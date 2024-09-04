return {
	"tamton-aquib/staline.nvim",
	version = "*",
	setup = function(_)
		require("staline").setup({
			defaults = {
				line_column = "[%l:%c] P %p%% ",
				true_colors = true,
			},
			mode_colors = {
				n = "#7287fd",
				i = "#dd7878", -- etc mode
				c = "#df8e1d",
				v = "#ea76cb",
			},
			sections = {
				left = {
					"- ",
					"-mode",
					"- ",
					"-branch",
					"left_sep_double",
					"file_name",
					" ",
					"lsp",
				},
				mid = {},
				right = { "cool_symbol", "right_sep_double", "-line_column" },
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
