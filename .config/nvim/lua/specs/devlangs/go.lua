return {
	ls = {
		gopls = {
			settings = {
				gopls = {
					gofumpt = false,
					codelenses = {
						gc_details = false,
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					analyses = {
						nilness = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
						unreachable = false,
						unusedvariable = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					semanticTokens = false,
				},
			},
		},
	},
	deps = {
		"gopls",
		"goimports",
		"gofumpt",
		"gomodifytags",
		"impl",
		"delve",
		"gotests",
		"golangci-lint",
		"golines",
		"goimports-reviser",
	},
	langs = {
		"go",
		"gomod",
		"gowork",
		"gosum",
	},
	formaters = {
		go = { "gofumpt", "goimports", "goimports-reviser" },
	},
	linters = {
		go = { "golangcilint" },
	},
	test_runners = {
		["neotest-go"] = {
			experimental = {
				test_table = true,
			},
			recursive_run = true,
			args = { "-count=1", "-timeout=30s" },
		},
	},
}
