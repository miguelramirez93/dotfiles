require("cfg.options")
require("cfg.keymaps")
require("cfg.lsp")

local dependences = require("cfg.dependences")
local api = require("api.handlers")

api.init_ide(dependences)
