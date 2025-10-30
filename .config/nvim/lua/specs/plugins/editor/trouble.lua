return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	enabled = vim.g.enable_lsp_plugs,
	opts = {
		use_diagnostic_signs = true,
	},
	setup = function(opts)
		vim.keymap.set("n", "<leader>d", "<cmd>Trouble diagnostics toggle<cr>", { silent = true })
	end,
}
