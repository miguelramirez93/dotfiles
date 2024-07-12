local module_loader = require("common.module_loader")
local service = {
	devlangs_folder = "specs/devlangs",
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
	tests_runner_client = {
		install_runners = function(runners) end,
	},
}

function service.setup_servers()
	local servers_list = module_loader.load_from_folder(service.devlangs_folder)
	local servers = {}
	for _, server_cfg in ipairs(servers_list) do
		if service.is_server_enabled(server_cfg) and server_cfg.ls then
			servers = vim.tbl_extend("keep", servers, server_cfg.ls)
		end
	end

	service.install_lang_deps(servers_list)

	service.install_lang_syntax(servers_list)

	service.ls_client.setup_servers(servers, service.capabilities_enhancer_client.get_lsp_capabilities())

	service.install_test_runners(servers_list)

	service.install_formaters(servers_list)
end

function service.install_lang_deps(servers_list)
	local deps = {}
	for _, server in pairs(servers_list) do
		if service.is_server_enabled(server) and server.deps then
			vim.list_extend(deps, server.deps)
		end
	end
	service.lang_deps_client.install_deps(deps)
end

function service.install_lang_syntax(servers_list)
	local langs = {}
	for _, server in pairs(servers_list) do
		if service.is_server_enabled(server) and server.langs then
			vim.list_extend(langs, server.langs)
		end
	end
	service.syntax_tree_client.install_lang_syntax(langs)
end

function service.install_formaters(servers_list)
	local formaters = {}
	for _, server_cfg in ipairs(servers_list) do
		if service.is_server_enabled(server_cfg) and server_cfg.formaters then
			formaters = vim.tbl_extend("keep", formaters, server_cfg.formaters)
		end
	end
	service.format_client.install_formaters(formaters)
end

function service.install_test_runners(servers_list)
	local runners = {}
	for _, server in pairs(servers_list) do
		if service.is_server_enabled(server) and server.test_runners then
			runners = vim.tbl_extend("force", runners, server.test_runners)
		end
	end

	service.tests_runner_client.install_runners(runners)
end

function service.is_server_enabled(server_cfg)
	if server_cfg.enabled == false then
		return false
	end
	return true
end

return service
