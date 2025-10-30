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

--File explorer
vim.keymap.set("n", "<leader>b", "<Cmd>Explore<CR>", { silent = true })

-- files
vim.keymap.set("n", "<leader>p", "<Cmd>echo expand('%:.')<CR>", { silent = true })
vim.keymap.set("n", "<leader>cp", "<Cmd>echo expand('%')<CR>", { silent = true })
vim.keymap.set("n", "<leader>,", ":buffer ", { silent = true })
vim.keymap.set("n", "<leader>ff", ":find ", { silent = true })

-- git
vim.keymap.set(
	"n",
	"<leader>gb",
	"<Cmd>lua vim.notify('   ' .. require('internal.git.helpers').git_branch())<CR>",
	{ silent = true }
)

vim.keymap.set("n", "<C-j>", '<Cmd>lua require("internal.terminal.viewer").toggle()<CR>', { silent = true })
vim.keymap.set("n", "<C-j>v", '<cmd>lua require("internal.terminal.viewer").toggle("vertical")<CR>', { silent = true })
vim.keymap.set("n", "<C-j>h", '<cmd>lua require("internal.terminal.viewer").toggle("horizontal")<CR>', { silent = true })
vim.keymap.set("n", "<C-j>n", '<Cmd>lua require("internal.terminal.viewer").open()<CR>', { silent = true })
vim.keymap.set("n", "<C-j>nv", '<cmd>lua require("internal.terminal.viewer").open("vertical")<CR>', { silent = true })
vim.keymap.set("n", "<C-j>nh", '<cmd>lua require("internal.terminal.viewer").open("horizontal")<CR>', { silent = true })

vim.keymap.set("n", "<C-w>a", "<cmd>BufOnly<CR>", { silent = true })

vim.keymap.set("n", "<C-t>", "<cmd>tabnew<cr>", { silent = true })
vim.keymap.set("n", "<SC-Right>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "<SC-Left>", "<cmd>tabprev<cr>", { silent = true })
