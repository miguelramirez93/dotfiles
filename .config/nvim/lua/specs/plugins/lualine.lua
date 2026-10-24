return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		tabline = {
			lualine_a = {
				{
					"buffers",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
			},
			lualine_z = { "tabs" },
		},
		sections = {
			lualine_x = {
				"encoding",
				"fileformat",
				"filetype",
			},
			lualine_c = {
				function()
					if vim.fn.expand("%") == "" then
						return ""
					end
					local dir = vim.fn.expand("%:~:.:h")
					local root = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					if dir == "." then
						dir = root
					else
						dir = root .. "/" .. dir
					end
					return vim.fn.nr2char(0xf07c) .. " " .. dir
				end,
			},
		},
	},
}
