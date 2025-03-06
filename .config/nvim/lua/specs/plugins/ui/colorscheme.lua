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
		opts = {
			options = {
				transparent = true,
			},
		},
		setup = function(opts)
			require("nightfox").setup(opts)
		end,
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
		colorscheme_name = "quiet",
		builtin = true,
		overwrite = function()
			vim.api.nvim_set_hl(0, "Normal", { fg = "#d4d4d4", bg = "#1f1f1f" })
			vim.api.nvim_set_hl(0, "Pmenu", { fg = "#bbbbbb", bg = "#202020" })
			vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#bbbbbb", bg = "#04395e" })
			vim.api.nvim_set_hl(0, "LangKeyWord", { fg = "#c586c0" })
			vim.api.nvim_set_hl(0, "Conditional", { link = "LangKeyWord" })
			vim.api.nvim_set_hl(0, "Repeat", { link = "LangKeyWord" })
			vim.api.nvim_set_hl(0, "Statement", { link = "LangKeyWord" })
			vim.api.nvim_set_hl(0, "GenComment", { fg = "#6a9955" })
			vim.api.nvim_set_hl(0, "SpecialComment", { link = "GenComment" })
			vim.api.nvim_set_hl(0, "Comment", { link = "GenComment" })
			-- Character      xxx guifg=#ce9178
			-- Constant       xxx guifg=#569cd6
			-- Number         xxx guifg=#b5cea8
			-- Boolean        xxx guifg=#569cd6
			-- Float          xxx guifg=#b5cea8
			-- Conditional    xxx guifg=#c586c0
			-- Statement      xxx guifg=#c586c0
			-- Repeat         xxx guifg=#c586c0
			-- Label          xxx guifg=#c586c0
			-- Keyword        xxx guifg=#c586c0
			-- Exception      xxx guifg=#c586c0
			-- Include        xxx guifg=#c586c0
			-- PreProc        xxx guifg=#c586c0
			-- Define         xxx guifg=#c586c0
			-- Macro          xxx guifg=#c586c0
			-- PreCondit      xxx links to PreProc
			-- StorageClass   xxx guifg=#569cd6
			-- Type           xxx guifg=#569cd6
			-- Structure      xxx guifg=#4ec9b0
			-- Typedef        xxx guifg=#569cd6
			-- Tag            xxx guifg=#d4d4d4
			-- Special        xxx guifg=#d7ba7d
			-- SpecialChar    xxx guifg=#d4d4d4
			-- SpecialComment xxx guifg=#6a9955
			-- Comment        xxx guifg=#6a9955
		end,
	},
	-- TODO: make a fork for this theme
	-- URL: https://github.com/alexxGmZ/e-ink.nvim
	eink = {
		src = "alexxGmZ/e-ink.nvim",
		colorscheme_name = "e-ink",
		overwrite = function()
			-- IncSearch
			vim.api.nvim_set_hl(0, "Normal", { fg = "#d4d4d4", bg = "#1f1f1f" })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#363636" })
		end,
	},
}

local selected = "nightfox"

if themes_cfg[selected].builtin == true then
	vim.cmd.colorscheme(themes_cfg[selected].colorscheme_name)
	if themes_cfg[selected].overwrite then
		themes_cfg[selected].overwrite()
	end
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
