local plg_man = require("internal.plugins.manager")
local module_loader = require("internal.module.loader")

local _plgs_path = "specs/plugins"
local _cfg_path = "specs/config"

plg_man.install()

local plugins = module_loader.recursive_load_form_folder(_plgs_path)

module_loader.recursive_load_form_folder(_cfg_path)

plg_man.sync(plugins)

plg_man.setup(plugins)
