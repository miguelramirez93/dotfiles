local m = {
	set_color_1 = "%#ModeMsg#",
	set_color_2 = "%#StatusLine#",
	file_name = "",
	modified = "",
	align_right = "%=",
	fileencoding = " %{&fileencoding?&fileencoding:&encoding}",
	fileformat = " [%{&fileformat}]",
	filetype = " %y",
	percentage = " %p%%",
	linecol = " %l:%c",
	modes_text_map = {
		n = "NORMAL",
		i = "INSERT",
		c = "COMMAND",
		v = "VISUAL",
		V = "VISUAL",
		nt = "TERMINAL",
		t = "TERMINAL",
		no = "DELETE",
		RO = "FILE BROWSER",
	},
	modes_icon_map = {
		n = "󰫻",
		i = "󰫶",
		c = "󰫰",
		v = "󰬃",
		V = "󰬃",
		nt = "󰬁",
		t = "󰬁",
		no = "󰆴",
	},
}
function m.get_mode_text()
	return "[ " .. m.parse_mode(m.modes_text_map) .. "]"
end

function m.get_mode_icon()
	return " " .. m.parse_mode(m.modes_icon_map) .. " "
end

function m.parse_mode(map_table)
	local parsed_mode = map_table[vim.api.nvim_get_mode()["mode"]]
	if parsed_mode == nil then
		parsed_mode = vim.api.nvim_get_mode()["mode"]
	end
	return parsed_mode
end

function m.build()
	local parts = {
		m.set_color_1,
		m.get_mode_icon(),
		" ",
		m.set_color_2,
		m.align_right,
		m.filetype,
		m.fileencoding,
		m.fileformat,
		m.percentage,
		m.linecol,
	}
	return table.concat(parts, "")
end

return m
