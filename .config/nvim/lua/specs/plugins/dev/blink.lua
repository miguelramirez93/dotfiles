return {
	"saghen/blink.nvim",
	build = "cargo build --release", -- for delimiters
	lazy = false,
	opts = {
		chartoggle = { enabled = true },
		indent = { enabled = false },
		tree = { enabled = true },
	},
}
