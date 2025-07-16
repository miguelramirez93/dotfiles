return {
	"nvimdev/indentmini.nvim",
	event = "BufEnter",
	disabled = true,
	opts = {},
	main = "indentmini",
	setup = function(opts)
		require("indentmini").setup(opts)
	end,
}
