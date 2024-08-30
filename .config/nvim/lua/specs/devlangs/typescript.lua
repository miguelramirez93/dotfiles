return {
	ls = {
		tsserver = {
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		},
	},
	deps = {
		"typescript-language-server",
		"prettierd",
		"prettier",
	},
	langs = {
		"typescript",
		"tsx",
	},
	formaters = {
		typescript = { { "prettierd", "prettier" } },
	},
}
