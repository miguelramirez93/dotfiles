return {
	"nvim-mini/mini.surround",
	version = "*",
	event = "BufEnter",
	setup = function()
		require("mini.surround").setup({})
	end,
}
