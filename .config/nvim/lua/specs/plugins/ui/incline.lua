return {
	"b0o/incline.nvim",
	enabled = false,
	setup = function(_)
		require("incline").setup({
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local modified = vim.bo[props.buf].modified
				return {
					" " .. filename,
					modified and { " ", gui = "bold" } or "",
					" ",
					guibg = "#44406e",
				}
			end,
			hide = {
				cursorline = true,
				focused_win = false,
				only_win = false,
			},
		})
	end,
	-- Optional: Lazy load Incline
	event = "VeryLazy",
}
