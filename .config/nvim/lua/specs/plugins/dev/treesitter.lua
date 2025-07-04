local opts = {
	sync_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = {
		--go
		"go",
		"gomod",
		"gowork",
		"gosum",
		--lua
		"lua",
		"vimdoc",
		"regex",
		--json
		"jsonc",
		--md
		"markdown_inline",
		"markdown",
		--jscript/typescript
		"javascript",
		"typescript",
		"tsx",
		--python
		"python",
		"ninja",
		"rst",
		--clojure
		"clojure",
	},
}

return {
	"nvim-treesitter/nvim-treesitter",
	-- dependencies = {
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- },
	-- version = false, -- last release is way too old and doesn't work on Windows
	event = { "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,
	build = ":TSUpdate",
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	setup = function(_)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
