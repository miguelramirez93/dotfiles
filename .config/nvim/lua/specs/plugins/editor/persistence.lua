vim.api.nvim_create_user_command("RestorePrevSession", function()
	if vim.fn.getcwd() ~= vim.env.HOME then
		require("persistence").load()
	end
end, {})
return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {
		-- add any custom options here
	},
}
