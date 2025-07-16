return {
	"stevedylandev/darkmatter-nvim",
	lazy = false,
	priority = 1000,
    disabled = true,
	opts = {
		transparent = false,
	},
	config = function(_, opts) end,
	setup = function(opts)
		require("darkmatter").setup(opts)
		vim.cmd.colorscheme("darkmatter")
	end,
}
