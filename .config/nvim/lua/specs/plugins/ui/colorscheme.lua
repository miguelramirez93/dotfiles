local themes_cfg = {
	gruber = {
		src = "blazkowolf/gruber-darker.nvim",
		colorscheme_name = "gruber-darker",
	},
	vscode = {
		src = "Mofiqul/vscode.nvim",
		colorscheme_name = "vscode",
	},
	jellybeans = {
		src = "wtfox/jellybeans.nvim",
		colorscheme_name = "jellybeans",
	},
	nightfox = {
		src = "EdenEast/nightfox.nvim",
		colorscheme_name = "nightfox",
	},
	alabaster = {
		src = "p00f/alabaster.nvim",
		colorscheme_name = "alabaster",
	},
	zenbones = {
		src = "zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		colorscheme_name = "zenwritten",
	},
	neomodern = {
		src = "cdmill/neomodern.nvim",
		colorscheme_name = "coffeecat",
	},
}

local selected = "neomodern"
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
