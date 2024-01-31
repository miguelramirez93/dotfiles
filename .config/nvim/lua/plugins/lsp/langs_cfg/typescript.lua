return {
	ls = {
		tsserver = {
			---@diagnostic disable-next-line: missing-fields
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		},
	},
	deps = {
		"typescript-language-server",
	},
	langs = {
		"typescript",
		"tsx",
	},
}
