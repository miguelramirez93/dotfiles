return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = function()
		local langs = require("specs.langs")
		return {
			formatters_by_ft = langs.formatters_by_ft(),
			formatters = langs.formatter_overrides(),
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
		}
	end,
}
