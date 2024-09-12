return {
	"ThePrimeagen/refactoring.nvim",
	event = "BufEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup()
	end,
	opts = {
		prompt_func_return_type = {
			go = true,
			java = true,
			python = true,
			cpp = false,
			c = false,
			h = false,
			hpp = false,
			cxx = false,
		},
		prompt_func_param_type = {
			go = true,
			java = true,
			python = true,
			cpp = false,
			c = false,
			h = false,
			hpp = false,
			cxx = false,
		},
		printf_statements = {},
		print_var_statements = {},
		show_success_message = false, -- shows a message with information about the refactor on success
		-- i.e. [Refactor] Inlined 3 variable occurrences
	},
	setup = function(opts)
		require("refactoring").setup(opts)
	end,
}
