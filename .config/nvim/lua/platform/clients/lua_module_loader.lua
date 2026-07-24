local M = {}

function M.load_from_folder(modules_dir)
	local path = vim.fn.stdpath("config") .. "/lua/" .. modules_dir:gsub("%.", "/")
	local files = vim.fn.glob(path .. "/*.lua", false, true)

	for _, file in ipairs(files) do
		local name = vim.fn.fnamemodify(file, ":t:r")
		if name ~= "init" then
			require(modules_dir .. "." .. name)
		end
	end
end

return M
