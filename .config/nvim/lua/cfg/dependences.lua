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
local modes = require("plugins.ui.modes")

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
			{
				"folke/tokyonight.nvim",
				lazy = false,
				-- priority = 1000,
				opts = {
					transparent = false,
				},
			},
			{
				"rose-pine/neovim",
				-- priority = 1000,
				enabled = false,
				opts = {
					variant = "moon",
					dark_variant = "moon",
					extend_background_behind_borders = true,
					styles = {
						transparency = true,
					},
					enable = {
						terminal = true,
						legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
						migrations = false, -- Handle deprecated options automatically
					},
				},
				setup = function(opts)
					require("rose-pine").setup(opts)
					vim.api.nvim_create_autocmd("ColorScheme", {
						command = [[highlight CursorLine guibg=#403d52 cterm=underline]],
					})
				end,
				name = "rose-pine",
			},
			{
				"lewpoly/sherbet.nvim",
				-- priority = 1000,
				name = "sherbet",
			},
			{
				"bluz71/vim-moonfly-colors",
				name = "moonfly",
				lazy = false,
				priority = 1000,
				setup = function()
					vim.g.moonflyTransparent = true
				end,
			},
			-- below themes have issues with bordered cmp completions
			{
				"blazkowolf/gruber-darker.nvim",
				-- priority = 1000,
				lazy = true,
			},
			{
				"craftzdog/solarized-osaka.nvim",
				lazy = true,
				--priority = 1000,
				opts = {
					transparent = true,
				},
			},
			markdown,
			zenmode,
			modes,
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
	theme = "moonfly",
}

return m
