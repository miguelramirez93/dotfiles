local opts = {
	ensure_installed = {
		-- go
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
		--lua
		"stylua",
		"shfmt",
		"lua-language-server",
		--json
		"json-lsp",
		--md
		"markdownlint",
		"marksman",
		--jscript/typescript
		"typescript-language-server",
		"prettierd",
		"prettier",
		--python
		"python-lsp-server",
		"jinja-lsp",
		"pylint",
		"autopep8",
	},
}

return {
	"williamboman/mason.nvim",
	lazy = false,
	priority = 1200,
	setup = function(_)
		require("mason").setup(opts)
		for _, dep in ipairs(opts.ensure_installed) do
			if not require("mason-registry").is_installed(dep) then
				vim.cmd({ cmd = "MasonInstall", args = { dep } })
			end
		end
	end,
}
