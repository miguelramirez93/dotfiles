return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup({
			diagnostic = { -- set diagnostic to false to disable vim.diagnostic.config setup,
				-- true: default nvim setup
				hdlr = false, -- hook lsp diag handler and send diag to quickfix
				underline = true,
				virtual_text = false, -- virtual text setup
				signs = { "", "", "", "" }, -- set to true to use default signs, an array of 4 to specify custom signs
				update_in_insert = false,
			},
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
