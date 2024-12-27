local m = {
	opened = false,
}

function m.open()
	vim.cmd([[ Neotree toggle ]])
end

return m
