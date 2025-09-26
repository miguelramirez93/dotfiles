return {
	"SmiteshP/nvim-navic",
	event = "BufReadPre",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("nvim-navic").setup({
			highlight = true,
			separator = " > ",
			depth_limit = 3,
			depth_limit_indicator = "..",
			safe_output = true,
		})
	end,
}
