return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	setup = function(opts)
		require("toggleterm").setup(opts)
	end,
}
