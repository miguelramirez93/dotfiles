local function on_attach(_, bufnr)
	local opts = { buffer = bufnr, silent = true }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({
			count = -1,
			on_jump = function()
				vim.diagnostic.open_float()
			end,
		})
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({
			count = 1,
			on_jump = function()
				vim.diagnostic.open_float()
			end,
		})
	end, opts)
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		if not vim.g.lsp_enabled then
			return
		end

		local langs = require("specs.langs")
		langs.setup_all()

		local servers = langs.lsp_servers()
		local server_names = vim.tbl_keys(servers)

		require("mason-lspconfig").setup({
			ensure_installed = server_names,
			automatic_enable = server_names,
		})

		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		for name, cfg in pairs(servers) do
			vim.lsp.config(name, cfg)
		end

		vim.lsp.enable(server_names)

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				on_attach(nil, args.buf)
				langs.on_attach(args.buf)
			end,
		})
	end,
}
