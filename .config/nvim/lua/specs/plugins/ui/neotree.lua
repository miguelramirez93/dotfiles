local m = {
	open = false,
}

function m.get_toggle_command()
	if not m.open then
		return "reveal"
	else
		return "toggle"
	end
end

vim.api.nvim_create_user_command("NeotreeCustomToggle", function(args)
	vim.cmd("Neotree " .. m.get_toggle_command())
	m.open = not m.open
end, {})

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	disabled = false,
	setup = function(_)
		require("neo-tree").setup({
			enable_git_status = false,
			-- options go here
			sources = {
				"filesystem",
			},
			close_if_last_window = true,
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				--               -- the current file is changed while the tree is open.
				leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						-- auto close
						-- vim.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
						m.status = "closed"
					end,
				},
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						-- auto close
						-- vim.cmd("Neotree close")
						-- OR
						m.status = "open"
					end,
				},
			},
		})

		vim.keymap.set("n", "<leader>b", "<Cmd>NeotreeCustomToggle<CR>", { silent = true })
	end,
}
