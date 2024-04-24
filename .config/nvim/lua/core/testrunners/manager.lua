local m = {
	client = {
		install_runners = function(runners) end,
	},
}

function m.setup_tests_runners(servers_list)
	local runners = {}
	for _, server in pairs(servers_list) do
		if server.test_runners then
			runners = vim.tbl_extend("force", runners, server.test_runners)
		end
	end
	m.client.install_runners(runners)
end

return m
