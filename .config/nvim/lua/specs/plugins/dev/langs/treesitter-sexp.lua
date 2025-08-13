return {
	"PaterJason/nvim-treesitter-sexp",
	opts = {},
	setup = function(opts)
		require("treesitter-sexp").setup(opts)
	end,
}
