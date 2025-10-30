local m = {
	modes = {
		["vertical"] = function()
			-- pcall(vim.cmd, "execute 'vsplit'|execute 'terminal'")
			return "vsplit"
		end,
		["horizontal"] = function()
			-- pcall(vim.cmd, "execute 'tab term'")
			return "split"
		end,
	},
	opened_buffer_id = nil,
}

local function is_there_an_opened_terminal()
	return m.opened_buffer_id ~= nil
end

local function open_terminal_buffer()
	local ok, _ = pcall(vim.cmd, "execute 'buffer " .. m.opened_buffer_id .. "'")
	return ok
end

local function buffer_exists(id)
	local ok, _ = pcall(vim.api.nvim_buf_get_name, id)
	return ok
end

function m.open(mode)
	local cmd = "execute 'terminal'"
	if mode == nil or m.modes[mode] == nil then
		pcall(vim.cmd, cmd)
		return
	end
	local mode_prefix = m.modes[mode]()
	cmd = "execute '" .. mode_prefix .. "' |" .. cmd
	pcall(vim.cmd, cmd)
end

function m.toggle(mode)
	local cmd = "execute 'terminal'"
	if mode == nil or m.modes[mode] == nil then
		if is_there_an_opened_terminal() and buffer_exists(m.opened_buffer_id) then
			open_terminal_buffer()
			return
		end
		pcall(vim.cmd, cmd)
		m.opened_buffer_id = vim.api.nvim_get_current_buf()
		return
	end
	local mode_prefix = m.modes[mode]()
	cmd = "execute '" .. mode_prefix .. "'"
	pcall(vim.cmd, cmd)
	if is_there_an_opened_terminal() and buffer_exists(m.opened_buffer_id) then
		open_terminal_buffer()
		return
	end
	pcall(vim.cmd, "execute 'terminal'")
	m.opened_buffer_id = vim.api.nvim_get_current_buf()
end

vim.keymap.set("n", "<C-j>", '<Cmd>lua require("internal.terminal.viewer").toggle()<CR>', { silent = true })
vim.keymap.set("n", "<C-j>v", '<cmd>lua require("internal.terminal.viewer").toggle("vertical")<CR>', { silent = true })
vim.keymap.set(
	"n",
	"<C-j>h",
	'<cmd>lua require("internal.terminal.viewer").toggle("horizontal")<CR>',
	{ silent = true }
)
vim.keymap.set("n", "<C-j>n", '<Cmd>lua require("internal.terminal.viewer").open()<CR>', { silent = true })
vim.keymap.set("n", "<C-j>nv", '<cmd>lua require("internal.terminal.viewer").open("vertical")<CR>', { silent = true })
vim.keymap.set("n", "<C-j>nh", '<cmd>lua require("internal.terminal.viewer").open("horizontal")<CR>', { silent = true })

return m
