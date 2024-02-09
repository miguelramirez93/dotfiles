return {
	"mvllow/modes.nvim",
	config = function()
		require("modes").setup({
			colors = {
				copy = "#f5c359",
				delete = "#c75c6a",
				insert = "#78ccc5",
				visual = "#e0def4",
			},
			line_opacity = 0.30,
			set_cursor = false,
		})
	end,
}
