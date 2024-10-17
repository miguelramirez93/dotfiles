return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		-- "hrsh7th/cmp-nvim-lsp-signature-help",
		{
			"saadparwaiz1/cmp_luasnip",
			dependencies = {
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
				dependencies = {
					{ "rafamadriz/friendly-snippets" },
				},
			},
		},
	},
	setup = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			performance = {
				max_view_entries = 20,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				-- this is a time
				-- { name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
				{
					name = "spell",
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return true
						end,
						preselect_correct_word = true,
					},
				},
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				-- `Enter` key to confirm completion
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				-- Ctrl+Space to trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),

				-- Scroll up and down in the completion documentation
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
			}),

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			}),
		})
	end,
	get_lsp_capabilities = function()
		return require("cmp_nvim_lsp").default_capabilities()
	end,
}
