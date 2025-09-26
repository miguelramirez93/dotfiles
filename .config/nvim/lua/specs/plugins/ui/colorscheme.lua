return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	-- dependencies = {
	-- 	"rktjmp/lush.nvim",
	-- },
	opts = {
		transparent = false,
	},
	config = function(_, opts) end,
	setup = function(_)
		vim.cmd.colorscheme("catppuccin-frappe")
	end,
}
