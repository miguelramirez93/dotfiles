local pvim = {}

local function setup_plugs(opts)
	local plgs_service = require("plugins.service")

	plgs_service.manager = opts.plugins.manager
	plgs_service.plugins_folder_path = opts.plugins.folder or plgs_service.plugins_folder_path

	plgs_service.sync()
end

local function setup_config_specs(opts)
	local conf_service = require("config.service")
	conf_service.config_folder = opts.config.folder or conf_service.config_folder
	conf_service.load_presets()
end

local function setup_lsp(opts)
	local lsp_config_service = require("lsp.service")
	lsp_config_service.devlangs_folder = opts.lsp.devlangs_folder or lsp_config_service.devlangs_folder

	lsp_config_service.ls_client = opts.lsp.devlangs_client

	lsp_config_service.lang_deps_client = opts.lsp.devlangs_deps_client

	lsp_config_service.syntax_tree_client = opts.lsp.syntax_tree_client

	lsp_config_service.format_client = opts.lsp.format_client

	lsp_config_service.capabilities_enhancer_client = opts.lsp.capabilities_enhancer_client

	lsp_config_service.tests_runner_client = opts.lsp.tests_runners_client

	lsp_config_service.setup_servers()
end

function pvim.setup(opts)
	setup_config_specs(opts)
	setup_plugs(opts)
	setup_lsp(opts)
end

return pvim
