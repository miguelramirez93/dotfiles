local module_loader = require "common.module_loader"
local service = {
    config_folder = "specs/config"
}

function service.load_presets()
    module_loader.load_from_folder(service.config_folder)
end

return service