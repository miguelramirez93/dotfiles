return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	-- dependencies = {
	-- 	"rktjmp/lush.nvim",
	-- },
	opts = {
		transparent = false,
	},
	config = function(_, opts) end,
	setup = function(opts)
		vim.cmd.colorscheme("tokyonight")
		-- changing line separator color
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#FFFFFF" })
		if opts.transparent then
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		end
	end,
}
