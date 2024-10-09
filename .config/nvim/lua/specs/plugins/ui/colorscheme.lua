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
	darkvoid = {
		src = "aliqyan-21/darkvoid.nvim",
		colorscheme_name = "darkvoid",
	},
	atlas = {
		src = "huyvohcmc/atlas.vim",
		colorscheme_name = "atlas",
	},
}

local selected = "atlas"

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
