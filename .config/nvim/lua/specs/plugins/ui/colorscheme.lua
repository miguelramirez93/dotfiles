return {
	"chriskempson/base16-vim",
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
		vim.cmd.colorscheme("base16-default-dark")
		if opts.transparent then
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		end
	end,
}
