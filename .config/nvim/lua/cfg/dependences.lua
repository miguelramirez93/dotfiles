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
local undotree = require("plugins.editor.undotree")
local lspzero = require("plugins.lsp.lspzero")
local lspsignature = require("plugins.lsp.lspsignature")
local indentscope = require("plugins.ui.indentscope")
local python = require("plugins.lsp.langs_cfg.python")
local minifiles = require("plugins.ui.minifiles")
local toggleterm = require("plugins.editor.toggleterm")
local spectre = require("plugins.editor.spectre")
local neotree = require("plugins.ui.neotree")
local nui = require("plugins.ui.nui")
local noice = require("plugins.ui.noice")
local oil = require("plugins.ui.oil")

local m = {
	plugins = {
		manager = {
			client = lazy,
		},
		list = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			lspzero,
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
				"savq/melange-nvim",
				lazy = false,
				--priority = 1000,
			},
			{
				"rebelot/kanagawa.nvim",
				lazy = false,
				-- priority = 1000,
			},
			-- below themes have issues with bordered cmp completions
			{
				"blazkowolf/gruber-darker.nvim",
				--priority = 1000,
				lazy = false,
			},
			{
				"rose-pine/neovim",
				name = "rose-pine",
				-- priority = 1000,
				lazy = false,
				setup = function(_)
					require("rose-pine").setup({
						variant = "moon", -- auto, main, moon, or dawn
						dark_variant = "moon", -- main, moon, or dawn
						enable = {
							terminal = true,
							legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
							migrations = true, -- Handle deprecated options automatically
						},

						styles = {
							bold = true,
							italic = true,
							transparency = true,
						},
					})
				end,
			},
			{
				"scottmckendry/cyberdream.nvim",
				lazy = false,
				-- priority = 1000,
				config = function()
					local colors = require("cyberdream.colors")
					require("cyberdream").setup({
						-- Recommended - see "Configuring" below for more config options
						transparent = true,
						italic_comments = true,
						hide_fillchars = false,
						borderless_telescope = true,
						terminal_colors = true,
						theme = {
							highlights = {
								CursorLine = { fg = colors.bg, bg = colors.bgHighlight },
							},
						},
					})
				end,
			},
			{
				"datsfilipe/min-theme.nvim",
				lazy = false,
				setup = function(_)
					require("min-theme").setup({
						-- (note: if your configuration sets vim.o.background the following option will do nothing!)
						theme = "dark", -- String: 'dark' or 'light', determines the colorscheme used
						transparent = false, -- Boolean: Sets the background to transparent
						italics = {
							comments = true, -- Boolean: Italicizes comments
							keywords = true, -- Boolean: Italicizes keywords
							functions = true, -- Boolean: Italicizes functions
							strings = true, -- Boolean: Italicizes strings
							variables = true, -- Boolean: Italicizes variables
						},
						overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
					})
				end,
			},
			markdown,
			undotree,
			lspsignature,
			indentscope,
			incline,
			minifiles,
			toggleterm,
			spectre,
			neotree,
			oil,
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
			python,
		},
	},
	tests = {
		manager = {
			client = neotest,
		},
	},
	icons = iconsSrc,
	theme = "min-theme",
}

return m
