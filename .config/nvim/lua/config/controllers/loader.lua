local M = {
	plg_cli = {},
	lua_files_loader = require("platform.clients.lua_module_loader"),
}

function M.load(plg_dir, cfg_dir, opts)
	M.lua_files_loader.load_from_folder(cfg_dir)
	M.plg_cli.setup(plg_dir, opts)
end

return M
