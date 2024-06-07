-- return {
--     "sainnhe/gruvbox-material",
--     lazy = false,
--     enabled = true,
--     priority = 1000,
--     opts = {},
--     setup = function()
--         vim.g.gruvbox_material_background = "hard"
--         vim.g.gruvbox_material_better_performance = 1
--         vim.cmd.colorscheme("gruvbox-material")
--     end,
-- }
local src = "folke/tokyonight.nvim"
return {
	src,
	priority = 1000,
	lazy = false,
	setup = function()
		require("tokyonight").setup({
			transparent = true,
		})
		vim.cmd.colorscheme("tokyonight-moon")
	end,
}
