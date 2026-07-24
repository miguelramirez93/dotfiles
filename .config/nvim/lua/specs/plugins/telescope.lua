return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Grep Search",
		},
		{
			"<leader>,",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Switch Buffer",
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Document Symbols",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").grep_string()
			end,
			mode = "n",
			desc = "Grep Word Under Cursor",
		},
		{
			"<leader>fg",
			function()
				local old_reg = vim.fn.getreg("v")
				vim.cmd('noautocmd normal! "vy')
				local selection = vim.fn.getreg("v")
				vim.fn.setreg("v", old_reg)
				require("telescope.builtin").grep_string({ search = selection })
			end,
			mode = "v",
			desc = "Grep Selected Text",
		},
	},
}
