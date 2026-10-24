-- Parsers not tied to a specific language config (editing this very nvim
-- config, plus docs/markdown), merged with the per-language `treesitter`
-- parser lists from specs.langs.
local base_parsers = {
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
}

local seen = {}
local ensure_installed = {}
for _, parser in ipairs(vim.list_extend(vim.deepcopy(base_parsers), require("specs.langs").treesitter_parsers())) do
	if not seen[parser] then
		seen[parser] = true
		table.insert(ensure_installed, parser)
	end
end

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
