return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	-- dependencies = {
	-- 	"rktjmp/lush.nvim",
	-- },
	opts = {
		transparent = true,
	},
	config = function(_, opts) end,
	setup = function(opts)
		require("vscode").setup(opts)
		vim.cmd.colorscheme("vscode")
	end,
}
