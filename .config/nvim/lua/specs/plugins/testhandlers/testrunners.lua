local runners = {
	{ "nvim-neotest/neotest-go" },
	{ "nvim-neotest/neotest-plenary" },
	{ "andy-bell101/neotest-java" },
}

local function get_runner_deps()
	if vim.g.enable_lsp_plugs == false then
		return {}
	end

	local built_runners = {}
	for _, runner in pairs(runners) do
		runner["lazy"] = false
		runner["event"] = "BufEnter"
		table.insert(built_runners, runner)
	end
	return built_runners
end

return get_runner_deps()
