local m = {
	modes = {
		["vertical"] = function()
			pcall(vim.cmd, "execute 'vsplit'|execute 'terminal'")
		end,
		["tab"] = function()
			pcall(vim.cmd, "execute 'tab term'")
		end,
		["full"] = function()
			pcall(vim.cmd, "execute 'terminal'")
		end,
	},
}

function m.open(mode)
	if mode == nil or m.modes[mode] == nil then
		m.modes["full"]()
		return
	end
	m.modes[mode]()
end

return m
