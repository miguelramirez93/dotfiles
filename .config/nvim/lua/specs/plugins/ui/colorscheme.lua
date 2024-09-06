local themes_cfg = {
	awesome = {
		src = "rafi/awesome-vim-colorschemes",
		colorscheme_name = "minimalist",
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
	nightfox = {
		src = "EdenEast/nightfox.nvim",
		colorscheme_name = "carbonfox",
	},
}

local selected = "nightfox"

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
