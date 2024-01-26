return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	ls = {
		marksman = {},
	},
	langs = {
		"markdown_inline",
	},
	deps = {
		"markdownlint",
		"marksman",
	},
}
