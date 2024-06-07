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
local themes_cfg = {
	tokyonight = {
		req_path = "tokyonight",
		colorscheme_name = "tokyonight-moon",
		src = "folke/tokyonight.nvim",
		opts = {
			transparent = true,
		},
	},
	catppuccin = {
		req_path = "catppuccin",
		name = "catppuccin",
		colorscheme_name = "catppuccin-mocha",
		src = "catppuccin/nvim",
		opts = {
			transparent_background = true,
		},
	},
}

local selected = "catppuccin"

return {
	themes_cfg[selected].src,
	name = themes_cfg[selected].name or nil,
	priority = 1000,
	lazy = false,
	opts = themes_cfg[selected].opts,
	setup = function(opts)
		if themes_cfg[selected].setup then
			themes_cfg[selected].setup(opts)
		end
		require(themes_cfg[selected].req_path).setup(opts)
		vim.cmd.colorscheme(themes_cfg[selected].colorscheme_name)
	end,
}
