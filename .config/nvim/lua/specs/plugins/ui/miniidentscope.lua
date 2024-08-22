return {
	"echasnovski/mini.indentscope",
	version = "*",
	setup = function()
		require("mini.indentscope").setup({
			draw = {
				-- Delay (in ms) between event and start of drawing scope indicator
				delay = 50,

				--animation = require("mini.indentscope").gen_animation.none(),

				priority = 2,
			},
			symbol = "│",
		})
	end,
}
