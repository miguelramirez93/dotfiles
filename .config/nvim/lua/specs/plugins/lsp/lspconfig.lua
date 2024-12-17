local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local merge_on_attach = function(callback)
	return function(client, bufnr)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
		end
		-- NOTE: Code above enables lsp highlight on cursor hold, disabled for now
		-- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
		-- 	local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
		-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		-- 		buffer = bufnr,
		-- 		group = highlight_augroup,
		-- 		callback = vim.lsp.buf.document_highlight,
		-- 	})
		--
		-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		-- 		buffer = bufnr,
		-- 		group = highlight_augroup,
		-- 		callback = vim.lsp.buf.clear_references,
		-- 	})
		--
		-- 	vim.api.nvim_create_autocmd("LspDetach", {
		-- 		group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
		-- 		callback = function(event2)
		-- 			vim.lsp.buf.clear_references()
		-- 			vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
		-- 		end,
		-- 	})
		-- end

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		--
		-- This may be unwanted, since they displace some of your code
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
	extCapabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
	return extCapabilities
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"SmiteshP/nvim-navic",
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		{ "folke/neodev.nvim", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },
		"mason.nvim",
	},
	setup_servers = function(servers_list, capabilities)
		local extCapabilities = extend_def_capabilities(capabilities)

		for name, cfg in pairs(servers_list) do
			cfg.on_attach = merge_on_attach(cfg.on_attach)
			local extended_cfg = vim.tbl_extend("keep", cfg, {
				capabilities = extCapabilities,
				handlers = handlers,
				on_init = function(client)
					client.config.flags = {
						allow_incremental_sync = false,
					}
				end,
			})
			require("lspconfig")[name].setup(extended_cfg)
		end
	end,
}
