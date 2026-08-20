-- Orchestrator: aggregates the per-language config maps in this folder and
-- exposes them in the shapes each tooling plugin (nvim-lspconfig, nvim-lint,
-- conform.nvim) expects, so adding a language only means adding one file
-- here rather than touching every plugin spec.
local M = {}

local langs = require("platform.clients.lua_module_loader").load_from_folder("specs.langs")

--- Map of lspconfig server name -> config, merged across languages that
--- share the same server (e.g. javascript/typescript both use ts_ls).
function M.lsp_servers()
	local servers = {}
	for _, lang in ipairs(langs) do
		if lang.lsp then
			local name = lang.lsp.name
			servers[name] = vim.tbl_deep_extend("force", servers[name] or {}, lang.lsp.config or {})
		end
	end
	return servers
end

--- Map of filetype -> linter names, for nvim-lint's `linters_by_ft`.
function M.linters_by_ft()
	local by_ft = {}
	for _, lang in ipairs(langs) do
		if lang.linters then
			for _, ft in ipairs(lang.filetypes or {}) do
				by_ft[ft] = lang.linters
			end
		end
	end
	return by_ft
end

--- Map of filetype -> formatter names, for conform's `formatters_by_ft`.
function M.formatters_by_ft()
	local by_ft = {}
	for _, lang in ipairs(langs) do
		if lang.formatters then
			for _, ft in ipairs(lang.filetypes or {}) do
				by_ft[ft] = lang.formatters
			end
		end
	end
	return by_ft
end

--- Map of formatter name -> conform formatter override, for conform's
--- `formatters` table (e.g. custom command/args/stdin behavior).
function M.formatter_overrides()
	local overrides = {}
	for _, lang in ipairs(langs) do
		if lang.formatter_overrides then
			overrides = vim.tbl_deep_extend("force", overrides, lang.formatter_overrides)
		end
	end
	return overrides
end

--- Run any language-specific side-effecting setup (e.g. registering
--- autocmds for non-standard LSP behavior). Safe to call once.
function M.setup_all()
	for _, lang in ipairs(langs) do
		if lang.setup then
			lang.setup()
		end
	end
end

--- Run the on_attach hook (if any) of the language matching this buffer's
--- filetype, e.g. to set up custom keymaps for non-standard LSP commands.
function M.on_attach(bufnr)
	local ft = vim.bo[bufnr].filetype
	for _, lang in ipairs(langs) do
		if lang.on_attach and vim.tbl_contains(lang.filetypes or {}, ft) then
			lang.on_attach(bufnr)
		end
	end
end

return M
