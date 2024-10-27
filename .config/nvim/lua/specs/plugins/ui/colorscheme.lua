local themes_cfg = {
	gruber = {
		src = "blazkowolf/gruber-darker.nvim",
		colorscheme_name = "gruber-darker",
	},
	vscode = {
		src = "Mofiqul/vscode.nvim",
		colorscheme_name = "vscode",
	},
	accent = {
		src = "alligator/accent.vim",
		colorscheme_name = "accent",
	},
	meh = {
		src = "davidosomething/vim-colors-meh",
		colorscheme_name = "meh",
	},
	komau = {
		src = "ntk148v/komau.vim",
		colorscheme_name = "komau",
	},
	plain = {
		src = "andreypopp/vim-colors-plain",
		colorscheme_name = "plain",
	},
	no_clown = {
		src = "aktersnurra/no-clown-fiesta.nvim",
		colorscheme_name = "no-clown-fiesta",
	},
	candle = {
		src = "aditya-azad/candle-grey",
		colorscheme_name = "candle-grey",
	},
}

local selected = "candle"
return {
	themes_cfg[selected].src,
	name = themes_cfg[selected].name or nil,
	priority = 1200,
	dependencies = themes_cfg[selected].dependencies or nil,
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
