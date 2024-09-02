local m = {}

function m.open()
	print("Calling opne")
	pcall(vim.cmd, 'let @/=expand("%:t") | execute \'Explore\' expand("%:h") | normal n ')
end

return m
