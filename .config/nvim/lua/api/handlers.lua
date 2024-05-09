local m = {}

function m.init_ide(deps)
	local plugins_manager = require("core.plugins.manager")
	local server_manager = require("core.lsp.server_manager")
	local tests_manager = require("core.testrunners.manager")

	plugins_manager.client = deps.plugins.manager.client

	server_manager.ls_client = deps.lsp.manager.ls_client

	server_manager.lang_deps_client = deps.lsp.manager.lang_deps_client

	server_manager.syntax_tree_client = deps.lsp.manager.syntax_tree_client

	server_manager.format_client = deps.lsp.manager.formater_client

	server_manager.capabilities_enhancer_client = deps.lsp.manager.capabilities_enhancer_client

	tests_manager.client = deps.tests.manager.client

	plugins_manager.sync(deps.plugins.list)

	tests_manager.setup_tests_runners(deps.lsp.servers)

	server_manager.setup_servers(deps.lsp.servers)

	vim.cmd.colorscheme(deps.theme)
end

return m
