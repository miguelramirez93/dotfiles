return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	-- dependencies = "rafamadriz/friendly-snippets",
	-- event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"mikavilpas/blink-ripgrep.nvim",
		{ "folke/lazydev.nvim", opts = {} },
		-- add blink.compat to dependencies
		-- {
		-- 	"saghen/blink.compat",
		-- 	optional = true, -- make optional so it's only enabled if any extras need it
		-- 	opts = {},
		-- 	version = "*",
		-- },
	},

	enabled = vim.g.zen_mode or true,
	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		keymap = { preset = "enter" },
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		cmdline = {
			enabled = false,
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "ripgrep", "lazydev" },
			providers = {
				lsp = {
					score_offset = 100,
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					score_offset = 1,
					-- the options below are optional, some default values are shown
					---@module "blink-ripgrep"
					---@type blink-ripgrep.Options
					opts = {
						-- For many options, see `rg --help` for an exact description of
						-- the values that ripgrep expects.

						-- the minimum length of the current word to start searching
						-- (if the word is shorter than this, the search will not start)
						prefix_min_len = 3,

						-- The number of lines to show around each match in the preview
						-- (documentation) window. For example, 5 means to show 5 lines
						-- before, then the match, and another 5 lines after the match.
						context_size = 5,

						-- The maximum file size of a file that ripgrep should include in
						-- its search. Useful when your project contains large files that
						-- might cause performance issues.
						-- Examples:
						-- "1024" (bytes by default), "200K", "1M", "1G", which will
						-- exclude files larger than that size.
						max_filesize = "1M",

						-- Specifies how to find the root of the project where the ripgrep
						-- search will start from. Accepts the same options as the marker
						-- given to `:h vim.fs.root()` which offers many possibilities for
						-- configuration. If none can be found, defaults to Neovim's cwd.
						--
						-- Examples:
						-- - ".git" (default)
						-- - { ".git", "package.json", ".root" }
						project_root_marker = ".git",

						-- The casing to use for the search in a format that ripgrep
						-- accepts. Defaults to "--ignore-case". See `rg --help` for all the
						-- available options ripgrep supports, but you can try
						-- "--case-sensitive" or "--smart-case".
						search_casing = "--ignore-case",

						-- (advanced) Any additional options you want to give to ripgrep.
						-- See `rg -h` for a list of all available options. Might be
						-- helpful in adjusting performance in specific situations.
						-- If you have an idea for a default, please open an issue!
						--
						-- Not everything will work (obviously).
						additional_rg_options = {},

						-- When a result is found for a file whose filetype does not have a
						-- treesitter parser installed, fall back to regex based highlighting
						-- that is bundled in Neovim.
						fallback_to_regex_highlighting = true,

						-- Absolute root paths where the rg command will not be executed.
						-- Usually you want to exclude paths using gitignore files or
						-- ripgrep specific ignore files, but this can be used to only
						-- ignore the paths in blink-ripgrep.nvim, maintaining the ability
						-- to use ripgrep for those paths on the command line. If you need
						-- to find out where the searches are executed, enable `debug` and
						-- look at `:messages`.
						ignore_paths = {},

						-- Show debug information in `:messages` that can help in
						-- diagnosing issues with the plugin.
						debug = false,
					},
					-- (optional) customize how the results are displayed. Many options
					-- are available - make sure your lua LSP is set up so you get
					-- autocompletion help
					transform_items = function(_, items)
						for _, item in ipairs(items) do
							-- example: append a description to easily distinguish rg results
							item.labelDetails = {
								description = "(rg)",
							}
						end
						return items
					end,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
		-- experimental signature help support
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},

		completion = {
			menu = {
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
				},
			},
			ghost_text = {
				enabled = false,
			},
		},
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.default" },
	get_lsp_capabilities = function()
		return require("blink.cmp").get_lsp_capabilities()
	end,
}
