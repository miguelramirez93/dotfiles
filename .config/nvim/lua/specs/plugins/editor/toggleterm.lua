return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	enabled = false,
	setup = function(opts)
		require("toggleterm").setup(opts)
	end,
}
