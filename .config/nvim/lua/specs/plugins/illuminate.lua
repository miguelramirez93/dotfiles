return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("illuminate").configure({
			providers = { "treesitter", "regex" },
			disable_keymaps = true,
		})

		vim.keymap.set("n", "]]", require("illuminate").goto_next_reference, { desc = "Next reference" })
		vim.keymap.set("n", "[[", require("illuminate").goto_prev_reference, { desc = "Previous reference" })
		vim.keymap.set({ "o", "x" }, "ir", require("illuminate").textobj_select, { desc = "Reference text object" })
		vim.keymap.set({ "o", "x" }, "ar", require("illuminate").textobj_select, { desc = "Reference text object" })
	end,
}
