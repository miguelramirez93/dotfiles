vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

config_loader = require("config.controllers.loader")

lazy_plg_cli = require("platform.clients.lazy")

config_loader.plg_cli = lazy_plg_cli

local cfg_modules_dir_path = "specs.config"
local plgs_dir_path = "specs.plugins"

config_loader.load(plgs_dir_path, cfg_modules_dir_path)
