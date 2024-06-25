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
	rosepine = {
		src = "rose-pine/neovim",
		name = "rose-pine",
		req_path = "rose-pine",
		colorscheme_name = "rose-pine-main",
		opts = {
			styles = {
				transparency = true,
			},
		},
	},
	awesome = {
		src = "rafi/awesome-vim-colorschemes",
		colorscheme_name = "jellybeans",
	},
	gruver = {
		src = "blazkowolf/gruber-darker.nvim",
		colorscheme_name = "gruber-darker",
	},
}

local selected = "gruver"

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
		if themes_cfg[selected].req_path then
			require(themes_cfg[selected].req_path).setup(opts)
		end
		vim.cmd.colorscheme(themes_cfg[selected].colorscheme_name)
	end,
}
