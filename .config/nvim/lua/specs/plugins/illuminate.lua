return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("illuminate").configure({
			providers = { "treesitter", "regex" },
			disable_keymaps = true,
		})

		-- vim-illuminate falls back to an underline (`hi def ... gui=underline`)
		-- whenever the active colorscheme doesn't define these groups itself, so
		-- pin them to the standard background-highlight look on every colorscheme
		-- change instead.
		local function set_highlights()
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
		end
		set_highlights()
		vim.api.nvim_create_autocmd("ColorScheme", { callback = set_highlights })

		vim.keymap.set("n", "]]", require("illuminate").goto_next_reference, { desc = "Next reference" })
		vim.keymap.set("n", "[[", require("illuminate").goto_prev_reference, { desc = "Previous reference" })
		vim.keymap.set({ "o", "x" }, "ir", require("illuminate").textobj_select, { desc = "Reference text object" })
		vim.keymap.set({ "o", "x" }, "ar", require("illuminate").textobj_select, { desc = "Reference text object" })
	end,
}
