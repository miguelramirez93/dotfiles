return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	opts = {
        transparent = false,
    },
	setup = function(opts)
        require("solarized-osaka").setup(opts)
		vim.cmd.colorscheme("solarized-osaka")
	end,
}
