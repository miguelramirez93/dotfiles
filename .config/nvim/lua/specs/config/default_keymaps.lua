vim.g.mapleader = " "

vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- open technotes
vim.keymap.set("n", "<space>nv", ":vsplit /Users/joser/Dev/tech_notes/ <CR>", { silent = true })
vim.keymap.set("n", "<space>n", ":e /Users/joser/Dev/tech_notes/ <CR>", { silent = true })

--File explorer
vim.keymap.set("n", "<leader>b", "<Cmd>Explore<CR>", { silent = true })

-- files - buffers
vim.keymap.set("n", "<leader>p", "<Cmd>echo expand('%:.')<CR>", { silent = true })
vim.keymap.set("n", "<leader>cp", "<Cmd>echo expand('%')<CR>", { silent = true })
vim.keymap.set("n", "<leader>,", ":buffer ", { silent = true })
vim.keymap.set("n", "<leader>ff", ":find ", { silent = true })
vim.keymap.set("n", "<C-w>a", "<cmd>BufOnly<CR>", { silent = true })

-- tabs
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<cr>", { silent = true })
vim.keymap.set("n", "<SC-Right>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "<SC-Left>", "<cmd>tabprev<cr>", { silent = true })
