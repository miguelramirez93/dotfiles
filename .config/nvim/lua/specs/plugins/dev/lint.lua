vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()
	end,
})

local linters = {
	go = { "golangcilint" },
	clojure = { "clj-kondo" },
}

return {
	"mfussenegger/nvim-lint",
	setup = function(_)
		require("lint").linters_by_ft = linters or {}
	end,
}
