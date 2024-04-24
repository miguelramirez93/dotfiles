local m = {
	deps = {},
}

function m.init_ide()
	local plugins_manager = require("core.plugins.manager")
	local server_manager = require("core.lsp.server_manager")
	local tests_manager = require("core.testrunners.manager")

	plugins_manager.client = m.deps.plugins.manager.client

	server_manager.ls_client = m.deps.lsp.manager.ls_client

	server_manager.lang_deps_client = m.deps.lsp.manager.lang_deps_client

	server_manager.syntax_tree_client = m.deps.lsp.manager.syntax_tree_client

	server_manager.format_client = m.deps.lsp.manager.formater_client

	server_manager.capabilities_enhancer_client = m.deps.lsp.manager.capabilities_enhancer_client

	tests_manager.client = m.deps.tests.manager.client

	plugins_manager.sync(m.deps.plugins.list)

	tests_manager.setup_tests_runners(m.deps.lsp.servers)

	server_manager.setup_servers(m.deps.lsp.servers)

	vim.cmd.colorscheme(m.deps.theme)
end

return m
