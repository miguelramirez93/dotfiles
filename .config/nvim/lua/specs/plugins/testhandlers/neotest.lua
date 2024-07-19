local opts = {
	lazy = false,
	adapters = {
		"neotest-plenary",
	},
	status = { virtual_text = true },
	output = { open_on_run = true },
	quickfix = {
		open = function()
			-- local hastrouble, trouble = pcall(require, "trouble")
			-- if hastrouble then
			--     trouble.open({ mode = "quickfix", focus = false })
			-- else
			--     vim.cmd("copen")
			-- end
			vim.cmd("copen")
		end,
	},
}

local function parse_adapters(opts_adapters)
	local adapters = {}
	for name, config in pairs(opts_adapters or {}) do
		if type(name) == "number" then
			if type(config) == "string" then
				config = require(config)
			end
			adapters[#adapters + 1] = config
		elseif config ~= false then
			local adapter = require(name)
			if type(config) == "table" and not vim.tbl_isempty(config) then
				local meta = getmetatable(adapter)
				if adapter.setup then
					adapter.setup(config)
				elseif meta and meta.__call then
					adapter(config)
				else
					error("Adapter " .. name .. " does not support setup")
				end
			end
			adapters[#adapters + 1] = adapter
		end
	end
	return adapters
end

local function on_test_run_loading()
	vim.notify("Running tests...")
end

-- Commands
vim.api.nvim_create_user_command("TestCurrentFile", function()
	on_test_run_loading()
	require("neotest").run.run(vim.fn.expand("%"))
end, {})

vim.api.nvim_create_user_command("TestFunc", function()
	on_test_run_loading()
	require("neotest").run.run()
end, {})

vim.api.nvim_create_user_command("TestAll", function()
	on_test_run_loading()
	require("neotest").run.run(vim.loop.cwd())
end, {})

vim.api.nvim_create_user_command("TestCurrResult", function()
	require("neotest").output.open({ enter = true })
end, {})

vim.api.nvim_create_user_command("TestLast", function()
	on_test_run_loading()
	require("neotest").run.run_last()
end, {})

vim.api.nvim_create_user_command("TestSummary", function()
	require("neotest").summary.toggle()
end, {})

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",
	},
	lazy = false,
	install_runners = function(runners)
		opts.adapters = vim.tbl_extend("force", opts.adapters, runners)

		if opts.adapters then
			opts.adapters = parse_adapters(opts.adapters)
		end
		-- get neotest namespace (api call creates or returns namespace)
		-- local neotest_ns = vim.api.nvim_create_namespace("neotest")
		-- vim.diagnostic.config({
		-- 	virtual_text = {
		-- 		format = function(diagnostic)
		-- 			local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
		-- 			return message
		-- 		end,
		-- 	},
		-- }, neotest_ns)

		require("neotest").setup(opts)
	end,
}
