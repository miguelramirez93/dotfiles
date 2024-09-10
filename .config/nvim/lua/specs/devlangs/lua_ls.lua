return {
	ls = {
		lua_ls = {
			-- mason = false, -- set to false if you don't want this server to be installed with mason
			-- Use this to add any additional keymaps
			-- for specific lsp servers
			---@type LazyKeysSpec[]
			-- keys = {},
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
					completion = {
						callSnippet = "Replace",
					},
					hint = {
						enable = true,
					},
				},
			},
		},
	},
	deps = {
		"stylua",
		"shfmt",
	},
	formaters = {
		lua = { "stylua" },
	},
	langs = {
		"lua",
		"vimdoc",
		"regex",
	},
}
