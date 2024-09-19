local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local merge_on_attach = function(callback)
	return function(client, bufnr)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true)
		end
		if callback then
			callback(client, bufnr)
		end
	end
end

function extend_def_capabilities(capabilities)
	local extCapabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), capabilities)
	extCapabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
	return extCapabilities
end

return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		{ "folke/neodev.nvim", opts = {} },
		"mason.nvim",
	},
	setup_servers = function(servers_list, capabilities)
		local extCapabilities = extend_def_capabilities(capabilities)

		for name, cfg in pairs(servers_list) do
			cfg.on_attach = merge_on_attach(cfg.on_attach)
			local extended_cfg = vim.tbl_extend("keep", cfg, {
				capabilities = extCapabilities,
				handlers = handlers,
			})
			require("lspconfig")[name].setup(extended_cfg)
		end
	end,
}
