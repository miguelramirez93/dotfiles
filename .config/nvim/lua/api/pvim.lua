local file_explorer = require("adapters.ui.netrw_file_explorer")
local terminal_manager = require("adapters.ui.native_terminal_manager")
local pvim = {
	fexplorer = file_explorer,
	terminalman = terminal_manager,
}

-- set zen mode related global vars
vim.g.zen_mode = false
vim.g.enable_lsp_plugs = not vim.g.zen_mode

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

	if vim.g.zen_mode == true then
		lsp_config_service.setup_servers_zenmode()
		return
	end

	lsp_config_service.setup_servers()
end

function pvim.enable_zen_mode()
	-- set zen mode related global vars
	vim.g.zen_mode = true
	vim.g.enable_lsp_plugs = not vim.g.zen_mode
end

function pvim.open_file_explorer()
	pvim.fexplorer.open()
end

function pvim.toggle_terminal(mode)
	pvim.terminalman.toggle(mode)
end

function pvim.new_terminal(mode)
	pvim.terminalman.open(mode)
end

function pvim.setup(opts)
	if not opts.minimal then
		setup_plugs(opts)
		setup_lsp(opts)
	end
	setup_config_specs(opts)
end

function pvim.git_branch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	if string.len(branch) > 0 then
		return branch
	else
		return ":"
	end
end

return pvim
