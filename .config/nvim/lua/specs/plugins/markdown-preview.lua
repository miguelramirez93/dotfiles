return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	build = "cd app && npx --yes yarn install",
	keys = {
		{ "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },
	},
}
