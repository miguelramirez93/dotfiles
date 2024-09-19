return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	event = "BufEnter",
	install_formaters = function(formaters)
		require("conform").setup({
			formatters_by_ft = formaters,
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
