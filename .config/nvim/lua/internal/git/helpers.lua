local m = {}

function m.git_branch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	if string.len(branch) > 0 then
		return branch
	else
		return ":"
	end
end

vim.keymap.set(
	"n",
	"<leader>gb",
	"<Cmd>lua vim.notify('   ' .. require('internal.git.helpers').git_branch())<CR>",
	{ silent = true }
)

return m
