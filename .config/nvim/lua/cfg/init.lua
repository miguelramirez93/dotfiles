require("cfg.options")
require("cfg.keymaps")
require("cfg.lsp")

local dependences = require("cfg.dependences")
local plugins_manager = require("core.plugins.manager")
local server_manager = require("core.lsp.server_manager")
local tests_manager = require("core.testrunners.manager")

plugins_manager.client = dependences.plugins.manager.client

server_manager.ls_client = dependences.lsp.manager.ls_client

server_manager.lang_deps_client = dependences.lsp.manager.lang_deps_client

server_manager.syntax_tree_client = dependences.lsp.manager.syntax_tree_client

server_manager.format_client = dependences.lsp.manager.formater_client

server_manager.capabilities_enhancer_client = dependences.lsp.manager.capabilities_enhancer_client

tests_manager.tests_service = dependences.tests.manager.service

plugins_manager.sync(dependences.plugins.list)

tests_manager.setup_tests_runners(dependences.lsp.servers)

server_manager.setup_servers(dependences.lsp.servers)

vim.cmd.colorscheme("night-owl")
