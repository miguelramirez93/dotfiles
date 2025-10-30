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
	{
		name = "pylsp",
	},
	{
		name = "dartls",
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
	return vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), capabilities)
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
			})
			vim.lsp.config[sl.name] = extended_cfg
			vim.lsp.enable(sl.name)
		end

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
				vim.keymap.set("n", "dg", vim.diagnostic.open_float)
				-- lsp
				vim.keymap.set("n", "gv", ":vsplit | lua vim.lsp.buf.definition()<CR>", { silent = true })
				vim.keymap.set("n", "rn", vim.lsp.buf.rename, { silent = true })
				vim.keymap.set(
					"n",
					"<space>cc",
					"<Cmd>lua vim.notify('   ' .. require'nvim-navic'.get_location())<CR>",
					{ silent = true }
				)
			end,
		})
	end,
}
