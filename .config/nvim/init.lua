vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("core.config.loader").load("specs.config")
require("core.lsp.loader").load("specs.servers")

local plugin_manager = "lazy"
require("core.plg_manager.loader").load(plugin_manager, "specs.plugins")
