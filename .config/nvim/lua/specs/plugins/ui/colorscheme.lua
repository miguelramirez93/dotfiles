local themes_cfg = {
	gruber = {
		src = "blazkowolf/gruber-darker.nvim",
		colorscheme_name = "gruber-darker",
		overwrite = function()
			-- IncSearch
			vim.api.nvim_set_hl(0, "Search", { link = "IncSearch" })
		end,
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
	neomodern = {
		src = "cdmill/neomodern.nvim",
		colorscheme_name = "roseprime",
	},
	vague = {
		src = "vague2k/vague.nvim",
		colorscheme_name = "vague",
	},
	off = {
		src = "pbrisbin/vim-colors-off",
		colorscheme_name = "off",
		overwrite = function()
			vim.api.nvim_set_hl(0, "PmenuSel", { link = "TabLine" })
		end,
	},
	twilight = {
		src = "vim-scripts/twilight256.vim",
		colorscheme_name = "twilight256",
	},
	poimandres = {
		src = "olivercederborg/poimandres.nvim",
		colorscheme_name = "poimandres",
	},
	builtin = {
		colorscheme_name = "retrobox",
		builtin = true,
	},
}

local selected = "poimandres"

if themes_cfg[selected].builtin == true then
	vim.cmd.colorscheme(themes_cfg[selected].colorscheme_name)
	return
end

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

		if themes_cfg[selected].overwrite then
			themes_cfg[selected].overwrite()
		end
	end,
}
