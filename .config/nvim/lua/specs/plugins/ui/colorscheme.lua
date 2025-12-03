return {
	"rebelot/kanagawa.nvim",
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
		vim.cmd.colorscheme("kanagawa-dragon")
		if opts.transparent then
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		end
	end,
}
