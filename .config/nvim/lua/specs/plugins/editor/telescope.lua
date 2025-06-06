return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false, -- telescope did only one release, so use HEAD for now
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			enabled = vim.fn.executable("make") == 1,
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	setup = function(opts)
		local actions = require("telescope.actions")

		local l_opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
				sorting_strategy = "ascending",
				prompt_prefix = " ",
				selection_caret = " ",
				-- open files in the first window that is an actual file.
				-- use the current window if no other window is available.
				get_selection_window = function()
					local wins = vim.api.nvim_list_wins()
					table.insert(wins, 1, vim.api.nvim_get_current_win())
					for _, win in ipairs(wins) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].buftype == "" then
							return win
						end
					end
					return 0
				end,
				mappings = {
					i = {
						["<C-Down>"] = actions.cycle_history_next,
						["<C-Up>"] = actions.cycle_history_prev,
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
					},
					n = {
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
				live_grep = {
					theme = "dropdown",
				},
				lsp_document_symbols = {
					theme = "dropdown",
				},
			},
		}

		local extended_opts = vim.tbl_extend("force", opts or {} , l_opts)

		require("telescope").setup(extended_opts)
	end,
}
