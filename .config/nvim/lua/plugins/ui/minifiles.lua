return {
	"echasnovski/mini.files",
	version = "*",
	keys = {
		{
			"<leader>B",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
			end,
			desc = "Open mini.files (directory of current file)",
		},
		{
			"<leader>b",
			function()
				require("mini.files").open(vim.uv.cwd(), true)
			end,
			desc = "Open mini.files (cwd)",
		},
	},
	opts = {
		mappings = {
			close = "q",
			go_in = "s",
			go_in_plus = "S",
			go_out = "a",
			go_out_plus = "A",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},
		windows = {
			max_number = 4,
			preview = true,
			width_preview = 100,
		},
	},
	setup = function(opts)
		require("mini.files").setup(opts)
	end,
}
