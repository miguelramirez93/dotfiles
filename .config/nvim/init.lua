local pvim = require("api.pvim")

local plug_man = require("specs.plgmanagers.lazy")

plug_man.load_all = true

pvim.setup({
	plugins = {
		manager = plug_man,
		folder = "specs/plugins",
	},
	config = {
		folder = "specs/config",
	},
	lsp = {
		devlangs_client = require("specs.plugins.lsp.lspconfig"),
		devlangs_deps_client = require("specs.plugins.lsp.mason"),
		syntax_tree_client = require("specs.plugins.lsp.treesitter"),
		format_client = require("specs.plugins.coding.conform"),
		capabilities_enhancer_client = require("specs.plugins.lsp.cmp"),
		tests_runners_client = require("specs.plugins.testhandlers.neotest"),
	},
})
