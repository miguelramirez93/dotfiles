return {
	"rcarriga/nvim-notify",
	setup = function(_)
		vim.notify = require("notify")
	end,
}
