local opts = {
	sync_install = true,
	highlight = { enable = false },
	indent = { enable = true },
	ensure_installed = {},
}

return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	-- version = false, -- last release is way too old and doesn't work on Windows
	event = { "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,
	build = ":TSUpdate",
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	install_lang_syntax = function(langs)
		opts.ensure_installed = vim.tbl_extend("force", opts.ensure_installed, langs)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
