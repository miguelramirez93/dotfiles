return {
	ls = {
		-- pylsp = {
		-- 	plugins = {
		-- 		-- formatter options
		-- 		black = { enabled = true },
		-- 		autopep8 = { enabled = false },
		-- 		yapf = { enabled = false },
		-- 		-- linter options
		-- 		pylint = { enabled = true, executable = "pylint" },
		-- 		pyflakes = { enabled = false },
		-- 		pycodestyle = { enabled = false },
		-- 		-- type checker
		-- 		pylsp_mypy = { enabled = true },
		-- 		-- auto-completion options
		-- 		jedi_completion = { fuzzy = true },
		-- 		-- import sorting
		-- 		pyls_isort = { enabled = true },
		-- 	},
		-- },
		-- pyright = {},
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
				typeCheckingMode = "standard", --["off", "basic", "standard", "strict", "recommended", "all"]:
			},
		},
		ruff = {},
	},
	deps = {
		-- "python-lsp-server",
		"jinja-lsp",
		"pylint",
	},
	langs = {
		"python",
		"ninja",
		"rst",
	},
}
