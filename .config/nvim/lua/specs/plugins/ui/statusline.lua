return {
	"tamton-aquib/staline.nvim",
	version = "*",
	enabled = false,
	setup = function(_)
		require("staline").setup({
			defaults = {
				line_column = "[%l:%c] P %p%% ",
				true_colors = true,
			},
			mode_colors = {
				n = "#ea76cb",
				i = "#dd7878", -- etc mode
				c = "#df8e1d",
				v = "#7287fd",
			},
			sections = {
				left = { "- ", "-mode", "left_sep_double", " ", "branch", " ", "lsp" },
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
