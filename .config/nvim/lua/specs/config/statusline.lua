local function statusline()
	local set_color_1 = "%#ModeMsg#"
	local mode = ""
	local set_color_2 = "%#StatusLine#"
	-- local file_name = "  %f"
	-- local modified = "%m"
	local file_name = " "
	local modified = ""
	local align_right = "%="
	local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
	local fileformat = " [%{&fileformat}]"
	local filetype = " %y"
	local percentage = " %p%%"
	local linecol = " %l:%c"

	return string.format(
		"%s %s %s%s%s%s%s%s%s%s%s",
		set_color_1,
		mode,
		set_color_2,
		file_name,
		modified,
		align_right,
		filetype,
		fileencoding,
		fileformat,
		percentage,
		linecol
	)
end

vim.opt.statusline = statusline()
vim.opt.winbar = "  %f%m"
