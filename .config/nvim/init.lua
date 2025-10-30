local plg_man = require("internal.plugins.manager")
local module_loader = require("internal.module.loader")

local _plgs_path = "specs/plugins"
local _cfg_path = "specs/config"

plg_man.install()

local all_plugins = module_loader.load_folder(_plgs_path)

local enabled_plugins = {}

for _, plg in ipairs(all_plugins) do
	if not plg.disabled or plg.disabled == false then
		table.insert(enabled_plugins, plg)
	end
end

module_loader.load_folder(_cfg_path)

plg_man.sync(enabled_plugins)

plg_man.setup(enabled_plugins)
