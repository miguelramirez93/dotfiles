local m = {
	disabled = false,
}

function m.get_file_path()
	local raw_file_path = vim.fn.expand("%:.")
	if raw_file_path == "" then
		return ""
	end

	local formatted_file_path = " 󰣞 " .. string.gsub(raw_file_path, "/", " > ")

	return formatted_file_path
end

function m.get_buffer_status()
	if vim.bo.modified then
		return "[]"
	end
	return ""
end

function m.build_static()
	local parts = {
		"%#Normal#",
		m.get_file_path(),
		[[%<%{luaeval("require'specs.config.winbar'.get_buffer_status()")} ]],
		-- "%*",
	}
	return table.concat(parts, "")
end

return m
