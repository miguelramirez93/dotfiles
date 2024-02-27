local m = {
	ls_client = {
		setup_servers = function(servers_list, capabilities) end,
	},
	lang_deps_client = {
		install_deps = function(deps) end,
	},
	syntax_tree_client = {
		install_lang_syntax = function(langs) end,
	},
	format_client = {
		install_formaters = function(formaters) end,
	},
	capabilities_enhancer_client = {
		get_lsp_capabilities = function()
			return {}
		end,
	},
}

function m.setup_servers(servers_list)
	local servers = {}
	for _, server_cfg in ipairs(servers_list) do
		if server_cfg.ls then
			servers = vim.tbl_extend("keep", servers, server_cfg.ls)
		end
	end
	m.ls_client.setup_servers(servers, m.capabilities_enhancer_client.get_lsp_capabilities())

	m.install_lang_deps(servers_list)

	m.install_lang_syntax(servers_list)

	m.install_formaters(servers_list)
end

function m.install_lang_deps(servers_list)
	local deps = {}
	for _, server in pairs(servers_list) do
		if server.deps then
			vim.list_extend(deps, server.deps)
		end
	end
	m.lang_deps_client.install_deps(deps)
end

function m.install_lang_syntax(servers_list)
	local langs = {}
	for _, server in pairs(servers_list) do
		if server.langs then
			vim.list_extend(langs, server.langs)
		end
	end
	m.syntax_tree_client.install_lang_syntax(langs)
end

function m.install_formaters(servers_list)
	local formaters = {}
	for _, server_cfg in ipairs(servers_list) do
		if server_cfg.formaters then
			formaters = vim.tbl_extend("keep", formaters, server_cfg.formaters)
		end
	end
	m.format_client.install_formaters(formaters)
end

return m
