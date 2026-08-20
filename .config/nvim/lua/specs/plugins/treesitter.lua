local ensure_installed = {
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
	"clojure",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")
		ts.install(ensure_installed)

		local available = nil

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(args.match) or args.match
				available = available or require("nvim-treesitter.config").get_available()
				if not vim.tbl_contains(available, lang) then
					return
				end
				pcall(function()
					ts.install(lang):wait(30000)
				end)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
