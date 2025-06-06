return {
	"EdenEast/nightfox.nvim",
	opts = {},
	priority = 1200,
	lazy = false,
	setup = function(_)
		require("nightfox").setup({})
		vim.cmd.colorscheme("nightfox")
	end,
}
