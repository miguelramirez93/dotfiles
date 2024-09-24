local themes_cfg = {
	awesome = {
		src = "rafi/awesome-vim-colorschemes",
		colorscheme_name = "hybrid",
	},
	gruber = {
		src = "blazkowolf/gruber-darker.nvim",
		colorscheme_name = "gruber-darker",
	},
	vscode = {
		src = "Mofiqul/vscode.nvim",
		colorscheme_name = "vscode",
	},
	ok = {
		src = "e-q/okcolors.nvim",
		name = "okcolors",
		colorscheme_name = "okcolors",
	},
	rose = {
		src = "rose-pine/neovim",
		name = "rose-pine",
		colorscheme_name = "rose-pine",
	},
	gruvbox = {
		src = "sainnhe/gruvbox-material",
		colorscheme_name = "gruvbox-material",
	},
	tokyo = {
		src = "folke/tokyonight.nvim",
		colorscheme_name = "tokyonight",
	},
	osaka = {
		src = "craftzdog/solarized-osaka.nvim",
		colorscheme_name = "solarized-osaka",
		opts = {
			transparent = false,
		},
		setup = function(opts)
			require("solarized-osaka").setup(opts)
		end,
	},
}

local selected = "tokyo"

return {
	themes_cfg[selected].src,
	name = themes_cfg[selected].name or nil,
	priority = 1200,
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
