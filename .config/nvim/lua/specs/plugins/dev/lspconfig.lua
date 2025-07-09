local servers_list = {
	{
		name = "gopls",
		cfg = {
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
	{
		name = "lua_ls",
		cfg = {
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
	{
		name = "jsonls",
	},
	{
		name = "marksman",
	},
	{
		name = "ts_ls",
		cfg = {
			settings = {
				tsserver = {
					filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
					rootMarkers = { "package.json", "tsconfig.json", "jsconfig.json" },
					logVerbosity = "normal",
				},
				completions = {
					completeFunctionCalls = true,
				},
			},
		},
	},
	{
		name = "pyright",
		cfg = {
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "basic",
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
					},
				},
			},
		},
	},
	{
		name = "ruff",
	},
	{
		name = "clojure_lsp",
	},
}

local merge_on_attach = function(callback)
	return function(client, bufnr)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
		end
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
			end, "[T]oggle Inlay [H]ints")
		end
		if callback then
			callback(client, bufnr)
		end
		-- Add navic capabilities
		local navic = require("nvim-navic")
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
	end
end

local function extend_def_capabilities(capabilities)
	local extCapabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), capabilities)
	-- extCapabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
	return extCapabilities
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"SmiteshP/nvim-navic",
		"saghen/blink.cmp",
		"mason.nvim",
		{ "folke/lazydev.nvim", opts = {} },
	},
	setup = function(_)
		for _, sl in ipairs(servers_list) do
			local cfg = sl.cfg or {}
			cfg.on_attach = merge_on_attach(cfg.on_attach)

			local extCapabilities = extend_def_capabilities({})
			local extended_cfg = vim.tbl_extend("keep", cfg, {
				capabilities = extCapabilities,
				-- on_init = function(client)
				-- 	client.config.flags = {
				-- 		allow_incremental_sync = true,
				-- 	}
				-- end,
			})
			vim.lsp.config[sl.name] = extended_cfg
			vim.lsp.enable(sl.name)
		end
	end,
}
