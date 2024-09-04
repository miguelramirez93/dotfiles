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
vim.keymap.set("x", "<leader>p", '"_dp')

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
-- vim.keymap.set("n", "<leader>b", "<Cmd>Oil<CR>")
-- vim.keymap.set("n", "<leader>b", "<Cmd>Neotree toggle filesystem reveal right<CR>")
vim.keymap.set("n", "<leader>b", '<Cmd>lua require("api.pvim").open_file_explorer()<CR>', { silent = true })

-- files
vim.keymap.set("n", "<leader>cp", "<Cmd>echo expand('%')<CR>", { silent = true })

-- Tests runner
vim.keymap.set("n", "<leader>t", "<Cmd>TestFunc<CR>")
vim.keymap.set("n", "<leader>tf", "<Cmd>TestCurrentFile<CR>")
vim.keymap.set("n", "<leader>tt", "<Cmd>TestAll<CR>")
vim.keymap.set("n", "<leader>ts", "<Cmd>TestSummary<CR>")
vim.keymap.set("n", "<leader>tr", "<Cmd>TestCurrResult<CR>")
vim.keymap.set("n", "<leader>td", "<Cmd>TestDebug<CR>")

vim.api.nvim_create_user_command("TestDebug", function()
	require("neotest").run.run({ strategy = "dap" })
	require("dapui").open()
end, {})

-- debug
vim.keymap.set("n", "<leader>dp", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dq", "<cmd>lua require'dapui'.close()<CR>")

-- new keymaps cfg
local keymaps = {
	-- telescope
	{ mode = "n", bind = "<leader>,", cmd = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" },
	{ mode = "n", bind = "<leader>ff", cmd = "<cmd>Telescope find_files<cr>" },
	{ mode = "n", bind = "<leader>gc", cmd = "<cmd>Telescope git_commits<CR>" },
	{ mode = "n", bind = "<leader>fc", cmd = "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
	{ mode = "n", bind = "<leader>fg", cmd = "<cmd>Telescope live_grep<cr>" },
	{ mode = "n", bind = "<leader>ss", cmd = "<cmd>Telescope lsp_document_symbols<cr>" },
	{ mode = "n", bind = "<leader>fb", cmd = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>" },
	-- toggle term
	-- { mode = "n", bind = "<leader>j", cmd = "<cmd>ToggleTerm direction=horizontal<cr>" },
	-- { mode = "n", bind = "<leader>jf", cmd = "<cmd>ToggleTerm direction=float<cr>" },
	-- { mode = "n", bind = "<leader>jv", cmd = "<cmd>ToggleTerm direction=vertical<cr>" },

	{ mode = "n", bind = "<leader>j", cmd = '<Cmd>lua require("api.pvim").open_terminal()<CR>' },
	{ mode = "n", bind = "<leader>jv", cmd = '<cmd>lua require("api.pvim").open_terminal("vertical")<CR>' },
	-- { mode = "n", bind = "<leader>jt", cmd = '<cmd>lua require("api.pvim").open_terminal("tab")<CR>' },

	{ mode = "n", bind = "<leader>t", cmd = "<cmd>tabnew<cr>" },
	{ mode = "n", bind = "<leader>tn", cmd = "<cmd>tabnext<cr>" },
	{ mode = "n", bind = "<leader>tp", cmd = "<cmd>tabprev<cr>" },
}

for _, k_map in pairs(keymaps) do
	vim.keymap.set(k_map.mode, k_map.bind, k_map.cmd)
end
