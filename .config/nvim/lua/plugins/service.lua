local module_loader = require("common.module_loader")

local service = {
	plugins_folder_path = "specs/plugins",
	manager = {
		sync = function(plugins_list) end,
		install = function() end,
		installed = function() end,
	},
}

function service.sync()
	service.manager.install()

	local plugins_list = module_loader.load_from_folder(service.plugins_folder_path)


	local enabled_plgs = {}
	for _, plugin_cfg in pairs(plugins_list) do
		if service.is_plug_enabled(plugin_cfg) then
			table.insert(enabled_plgs, plugin_cfg)
		end
	end

	service.manager.sync(enabled_plgs)

	for _, plugin_cfg in pairs(enabled_plgs) do
		if plugin_cfg.setup then
			plugin_cfg.setup(plugin_cfg.opts or {})
		end
	end
end

function service.is_plug_enabled(plugin_cfg)
	if plugin_cfg.enabled == false then
		return false
	end
	return true
end

return service
