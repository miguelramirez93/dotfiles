return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = false,
	},
	setup = function(opts)
        require("nightfox").setup(opts)
		vim.cmd.colorscheme("nightfox")
	end,
}
