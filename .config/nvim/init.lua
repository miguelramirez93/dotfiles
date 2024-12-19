local pvim = require("api.pvim")

local lazy_plug_man = require("specs.plgmanagers.lazy")

lazy_plug_man.enable_lazy_load = true

-- pvim.fexplorer = require("adapters.ui.oil_file_explorer")

pvim.setup({
	minimal = false,
	plugins = {
		manager = lazy_plug_man,
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
		capabilities_enhancer_client = require("specs.plugins.lsp.blink-cmp"),
		tests_runners_client = require("specs.plugins.testhandlers.neotest"),
	},
})

-- testing
