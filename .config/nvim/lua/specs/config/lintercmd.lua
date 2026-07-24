-- Run a shell command against just the saved file whenever a file with a
-- matching extension is saved, e.g. `stylua {file}` for Lua files. Use the
-- `{file}` token in the command to reference the saved file's absolute path.
local M = {
	linters = {},
}

function M.add(ext, cmd, name)
	M.linters[ext] = { cmd = cmd, name = name or cmd }
end

local cljfmt_fix = "cljfmt fix --config ~/.cljfmt.edn {file}"
M.add("clj", cljfmt_fix, "cljfmt")
M.add("cljs", cljfmt_fix, "cljfmt")
M.add("cljc", cljfmt_fix, "cljfmt")
M.add("lua", "stylua {file}", "stylua")

local function root_dir()
	return vim.fs.root(0, { ".git" }) or vim.fn.getcwd()
end

local function run(cmd_template, file, cwd, name)
	local cmd = cmd_template:gsub("{file}", function()
		return file
	end)
	vim.fn.jobstart(cmd, {
		cwd = cwd,
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("[lintercmd] " .. name, vim.log.levels.INFO)
			else
				vim.notify("[lintercmd] " .. name .. " failed (" .. code .. ")", vim.log.levels.ERROR)
			end
		end,
	})
end

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function(args)
		local ext = vim.fn.fnamemodify(args.file, ":e")
		local linter = M.linters[ext]
		if linter then
			local file = vim.fn.fnamemodify(args.file, ":p")
			run(linter.cmd, file, root_dir(), linter.name)
		end
	end,
})

return M
