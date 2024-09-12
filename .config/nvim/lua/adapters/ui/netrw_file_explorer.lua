local m = {}

function m.open()
	pcall(vim.cmd, 'let @/=expand("%:t") | execute \'Explore\' expand("%:h") | normal n ')
end

return m
