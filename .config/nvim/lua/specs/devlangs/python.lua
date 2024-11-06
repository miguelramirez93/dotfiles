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
		pyright = {},
		-- basedpyright = {},
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
