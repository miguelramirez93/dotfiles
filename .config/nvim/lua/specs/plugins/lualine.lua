return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sections = {
			-- While a server is starting/indexing, `vim.lsp.status()` reports its
			-- progress (e.g. "clojure_lsp: Indexing"); once idle it returns "", so
			-- this falls back to the filetype instead of showing both at once.
			lualine_x = {
				function()
					local status = vim.lsp.status()
					if status ~= "" then
						return status
					end
					return vim.bo.filetype
				end,
				"encoding",
				"fileformat",
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
