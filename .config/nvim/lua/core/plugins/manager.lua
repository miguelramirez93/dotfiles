local m = {
    client = {
        sync = function(plugins_list) end,
    },
}

function m.sync(plugins_list)
    m.client.sync(plugins_list)
    for _, plugin_cfg in pairs(plugins_list) do
        if m.is_plug_enabled(plugin_cfg)  and plugin_cfg.setup then
            plugin_cfg.setup(plugin_cfg.opts or {})
        end
    end
end

function m.is_plug_enabled(plugin_cfg)
	if plugin_cfg.enabled == false then 
		return false 
	end 
	return true 
end

return m
