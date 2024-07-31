local m = {
	modes = {
		["n"] = "NORMAL",
		["no"] = "NORMAL",
		["v"] = "VISUAL",
		["V"] = "VISUAL LINE",
		[""] = "VISUAL BLOCK",
		["s"] = "SELECT",
		["S"] = "SELECT LINE",
		[""] = "SELECT BLOCK",
		["i"] = "INSERT",
		["ic"] = "INSERT",
		["R"] = "REPLACE",
		["Rv"] = "VISUAL REPLACE",
		["c"] = "COMMAND",
		["cv"] = "VIM EX",
		["ce"] = "EX",
		["r"] = "PROMPT",
		["rm"] = "MOAR",
		["r?"] = "CONFIRM",
		["!"] = "SHELL",
		["t"] = "TERMINAL",
	},
	icons = {
		["error"] = "󰨰",
		["warn"] = "▲",
		["info"] = "󰋽",
		["hint"] = "",
		["ok"] = "",
		["loading"] = "󰁪",
	},
}

function m.diagnostic_status()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	local diagnostic = {}

	if count["errors"] ~= 0 then
		errors = "%#DiagnosticSignError#" .. m.get_icon("error") .. " " .. count["errors"]
		table.insert(diagnostic, errors)
	end
	if count["warnings"] ~= 0 then
		warnings = "%#DiagnosticSignWarn#" .. m.get_icon("warn") .. " " .. count["warnings"]
		table.insert(diagnostic, warnings)
	end
	if count["hints"] ~= 0 then
		hints = "%#DiagnosticSignHint#" .. m.get_icon("hint") .. " " .. count["hints"]
		table.insert(diagnostic, hints)
	end
	if count["info"] ~= 0 then
		info = "%#DiagnosticSignInfo#" .. m.get_icon("info") .. " " .. count["info"]
		table.insert(diagnostic, info)
	end

	if #diagnostic == 0 then
		table.insert(diagnostic, "%#DiagnosticSignOk#" .. m.get_icon("ok"))
	end

	table.insert(diagnostic, "%*")

	return table.concat(diagnostic, " ")
end

function m.get_active_lsp_clients()
	local buf_clients = vim.lsp.get_clients()
	local buf_client_names = {}
	for _, client in pairs(buf_clients) do
		table.insert(buf_client_names, client.name)
	end
	local active_clients = table.concat(buf_client_names, " , ")
	if active_clients == "" then
		return "N/A"
	end
	return active_clients
end

function m.get_mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format("%s", m.modes[current_mode]):upper()
end

function m.update_mode_colors()
	local current_mode = vim.api.nvim_get_mode().mode
	local mode_color = "%#StatusLineAccent#"
	if current_mode == "n" then
		mode_color = "%#ModeNormal#"
	elseif current_mode == "i" or current_mode == "ic" then
		mode_color = "%#StatuslineInsertAccent#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		mode_color = "%#Visual#"
	elseif current_mode == "R" then
		mode_color = "%#StatuslineReplaceAccent#"
	elseif current_mode == "c" then
		mode_color = "%#StatuslineCmdLineAccent#"
	elseif current_mode == "t" then
		mode_color = "%#StatuslineTerminalAccent#"
	end
	return mode_color
end

function m.build_status_line()
	local parts = {
		"%#Statusline#",
		" M: " .. m.get_mode(),
		" ",
		"%*",
		"%#Normal#",
		" D: " .. m.diagnostic_status() .. "%*",
		"%#Normal#",
		" LS: " .. m.get_active_lsp_clients(),
		[[%=]],
		"%#Statusline#",
		"",
		"Ln %l, Col %c, P %P ",
		" ",
		"E: %{&fileencoding?&fileencoding:&encoding} ",
	}
	return table.concat(parts, "")
end
function m.inactive()
	return ""
end

function m.get_icon(name)
	local icon = m.icons[name] or ""
	return icon
end

vim.cmd([[
set laststatus=3
augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.require'specs.config.status_line'.build_status_line()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.require'specs.config.status_line'.inactive()
  augroup END
]])
return m
