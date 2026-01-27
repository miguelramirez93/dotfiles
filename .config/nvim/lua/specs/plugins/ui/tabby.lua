local function get_cfg()
	local theme = {
		fill = "TabLineFill",
		head = "TabLine",
		current_tab = "TabLineSel",
		tab = "TabLine",
		win = "TabLine",
		tail = "TabLine",
		left_sep = "",
		right_sep = "",
		current_indicator = "",
	}

	return {
		line = function(line)
			return {
				{
					{ "  ", hl = theme.head },
					line.sep(theme.right_sep, theme.head, theme.fill),
				},
				line.tabs().foreach(function(tab)
					local hl = tab.is_current() and theme.current_tab or theme.tab
					local indicator = tab.is_current() and theme.current_indicator or ""

					-- remove count of wins in tab with [n+] included in tab.name()
					local name = tab.name()
					local index = string.find(name, "%[%d")
					local tab_name = index and string.sub(name, 1, index - 1) or name

					-- indicate if any of buffers in tab have unsaved changes
					local modified = false
					local win_ids = require("tabby.module.api").get_tab_wins(tab.id)
					for _, win_id in ipairs(win_ids) do
						if pcall(vim.api.nvim_win_get_buf, win_id) then
							local bufid = vim.api.nvim_win_get_buf(win_id)
							if vim.api.nvim_buf_get_option(bufid, "modified") then
								modified = true
								break
							end
						end
					end

					return {
						line.sep(theme.left_sep, hl, theme.fill),
						indicator,
						tab.number(),
						tab_name,
						modified and "[]",
						tab.close_btn(""),
						line.sep(theme.right_sep, hl, theme.fill),
						hl = hl,
						margin = " ",
					}
				end),
				line.spacer(),
				{
					line.sep(theme.left_sep, theme.tail, theme.fill),
					{ "  ", hl = theme.tail },
				},
				hl = theme.fill,
			}
		end,
	}
end

return {
	"nanozuki/tabby.nvim",
	disabled = false,
	setup = function(_)
		vim.o.showtabline = 2

		require("tabby").setup(get_cfg())
	end,
}
