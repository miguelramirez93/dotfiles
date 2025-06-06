local plgs_man_cli = require("specs.lazy")

local m = {}

function m.install()
	plgs_man_cli.install()
end

function m.sync(plugins_list)
	plgs_man_cli.sync(plugins_list)
end

function m.setup(plugins_list)
	for _, plg in pairs(plugins_list) do
		if (not plg.disabled or plg.disabled == false) and plg.setup then
			plg.setup(plg.opts or {})
		end
	end
end

return m
