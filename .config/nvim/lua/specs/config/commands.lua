vim.cmd([[ command BufOnly silent! execute "%bd|e#|bd#" ]])

-- recursive find commands
vim.api.nvim_create_user_command("Rgrep", function(args)
	local pattern
	if args.args ~= "" then
		pattern = args.args
	else
		-- Get the word under the cursor
		pattern = vim.fn.expand("<cword>")
	end
	vim.cmd.vimgrep(pattern, "**")
	vim.cmd("cclose")
	vim.cmd("copen")
end, { nargs = "?" })
