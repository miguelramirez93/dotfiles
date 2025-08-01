vim.g.mapleader = " "

vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
--

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
-- open technotes
vim.keymap.set("n", "<space>nv", ":vsplit /Users/joser/Dev/tech_notes/ <CR>", { silent = true })
vim.keymap.set("n", "<space>n", ":e /Users/joser/Dev/tech_notes/ <CR>", { silent = true })

-- TODO: Put plugin specific key maps inside the plugin specification to keep clean this aspect
-- unotree
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)

-- GIT
vim.keymap.set("n", "<leader>gs", vim.cmd.Neogit)
vim.keymap.set("n", "<leader>gd", "<Cmd>Gitsigns preview_hunk<CR>")

-- better copy/paste flow
-- vim.keymap.set("x", "<leader>p", '"_dp')

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
		vim.keymap.set("n", "dg", vim.diagnostic.open_float)
		-- lsp
		vim.keymap.set("n", "gv", ":vsplit | lua vim.lsp.buf.definition()<CR>", { silent = true })
		vim.keymap.set("n", "rn", vim.lsp.buf.rename, { silent = true })
		vim.keymap.set(
			"n",
			"<space>cc",
			"<Cmd>lua vim.notify('   ' .. require'nvim-navic'.get_location())<CR>",
			{ silent = true }
		)
	end,
})

-- spectre
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

--File explorer
vim.keymap.set("n", "<leader>b", "<Cmd>lua require('internal.explorer.manager').toggle()<CR>", { silent = true })

-- files
vim.keymap.set("n", "<leader>p", "<Cmd>echo expand('%:.')<CR>", { silent = true })
vim.keymap.set("n", "<leader>cp", "<Cmd>echo expand('%')<CR>", { silent = true })

-- git
vim.keymap.set(
	"n",
	"<leader>gb",
	"<Cmd>lua vim.notify('   ' .. require('internal.git.helpers').git_branch())<CR>",
	{ silent = true }
)

-- new keymaps cfg
local keymaps = {
	-- telescope
	-- { mode = "n", bind = "<leader>,", cmd = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" },
	-- { mode = "n", bind = "<leader>ff", cmd = "<cmd>Telescope find_files<cr>" },
	{ mode = "n", bind = "<leader>,", cmd = ":buffer " },
	{ mode = "n", bind = "<leader>ff", cmd = ":find " },
	{ mode = "n", bind = "<leader>fw", cmd = "<cmd>Rgrep<cr>" },
	{ mode = "n", bind = "<leader>gc", cmd = "<cmd>Telescope git_commits<CR>" },
	{ mode = "n", bind = "<leader>fc", cmd = "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
	{ mode = "n", bind = "<leader>fg", cmd = "<cmd>Telescope live_grep<cr>" },
	{ mode = "n", bind = "<leader>ss", cmd = "<cmd>Telescope lsp_document_symbols<cr>" },
	-- toggle term
	-- { mode = "n", bind = "<leader>j", cmd = "<cmd>ToggleTerm direction=horizontal<cr>" },
	-- { mode = "n", bind = "<leader>jf", cmd = "<cmd>ToggleTerm direction=float<cr>" },
	-- { mode = "n", bind = "<leader>jv", cmd = "<cmd>ToggleTerm direction=vertical<cr>" },

	{ mode = "n", bind = "<C-j>", cmd = '<Cmd>lua require("internal.terminal.viewer").toggle()<CR>' },
	{ mode = "n", bind = "<C-j>v", cmd = '<cmd>lua require("internal.terminal.viewer").toggle("vertical")<CR>' },
	{ mode = "n", bind = "<C-j>h", cmd = '<cmd>lua require("internal.terminal.viewer").toggle("horizontal")<CR>' },
	{ mode = "n", bind = "<C-j>n", cmd = '<Cmd>lua require("internal.terminal.viewer").open()<CR>' },
	{ mode = "n", bind = "<C-j>nv", cmd = '<cmd>lua require("internal.terminal.viewer").open("vertical")<CR>' },
	{ mode = "n", bind = "<C-j>nh", cmd = '<cmd>lua require("internal.terminal.viewer").open("horizontal")<CR>' },

	{ mode = "n", bind = "<C-w>a", cmd = "<cmd>BufOnly<CR>" },

	{ mode = "n", bind = "<C-t>", cmd = "<cmd>tabnew<cr>" },
	{ mode = "n", bind = "<SC-Right>", cmd = "<cmd>tabnext<cr>" },
	{ mode = "n", bind = "<SC-Left>", cmd = "<cmd>tabprev<cr>" },
	{ mode = "n", bind = "<leader>d", cmd = "<cmd>Trouble diagnostics toggle<cr>" },
}

for _, k_map in pairs(keymaps) do
	vim.keymap.set(k_map.mode, k_map.bind, k_map.cmd)
end
