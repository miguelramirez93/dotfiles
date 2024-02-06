local lazy = require("plugins.lazy")
local lspconfig = require("plugins.lsp.lspconfig")
local go = require("plugins.lsp.langs_cfg.go")
local mason = require("plugins.lsp.mason")
local treesitter = require("plugins.lsp.treesitter")
local cmp = require("plugins.coding.cmp")
local minipairs = require("plugins.coding.mini-pairs")
local commentstring = require("plugins.coding.comment-string")
local minicomments = require("plugins.coding.mini-comment")
local trouble = require("plugins.editor.trouble")
local todocomments = require("plugins.editor.todo-comments")
local vimilluminate = require("plugins.editor.vim-illuminate")
local telescope = require("plugins.editor.telescope")
local identblackline = require("plugins.ui.identblackline")
local dressing = require("plugins.ui.dressing")
local noice = require("plugins.ui.noice")
local nui = require("plugins.ui.nui")
local conform = require("plugins.coding.conform")
local iconsSrc = require("cfg.icons")
local lualine = require("plugins.ui.lualine")
local gitsigns = require("plugins.editor.gitsigns")
local incline = require("plugins.ui.incline")
local luasnip = require("plugins.lsp.luasnip")
local friendlysnipperts = require("plugins.lsp.friendlysnipperts")
local neotest = require("plugins.testhandlers.neotest")
local testrunners = require("plugins.testhandlers.testrunners")
local persistence = require("plugins.editor.persistence")
local java = require("plugins.lsp.langs_cfg.java")
local markdown = require("plugins.lsp.langs_cfg.markdown")
local lua_ls = require("plugins.lsp.langs_cfg.lua_ls")
local typescript = require("plugins.lsp.langs_cfg.typescript")
local zenmode = require("plugins.ui.zenmode")

local m = {
	plugins = {
		manager = {
			client = lazy,
		},
		list = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			lspconfig,
			mason,
			treesitter,
			cmp,
			minipairs,
			commentstring,
			minicomments,
			telescope,
			trouble,
			todocomments,
			vimilluminate,
			telescope,
			identblackline,
			dressing,
			nui,
			noice,
			conform,
			lualine,
			gitsigns,
			{
				"tpope/vim-fugitive",
			},
			incline,
			luasnip,
			friendlysnipperts,
			neotest,
			testrunners,
			persistence,
			{ "blazkowolf/gruber-darker.nvim", lazy = true, priority = 1000 },
			{ "folke/tokyonight.nvim", lazy = true, opts = { style = "moon" } },
			{
				"craftzdog/solarized-osaka.nvim",
				lazy = false,
				--priority = 1000,
				opts = {
					transparent = true,
				},
				{
					"oxfist/night-owl.nvim",
					lazy = false,
					-- priority = 1000,
					pts = {
						transparent_background = true,
					},
				},
			},
			markdown,
			zenmode,
		},
	},
	lsp = {
		manager = {
			ls_client = lspconfig,
			lang_deps_client = mason,
			syntax_tree_client = treesitter,
			formater_client = conform,
			capabilities_enhancer_client = cmp,
		},
		servers = {
			go,
			java,
			lua_ls,
			markdown,
			typescript,
		},
	},
	tests = {
		manager = {
			service = neotest,
		},
	},
	icons = iconsSrc,
}

return m
