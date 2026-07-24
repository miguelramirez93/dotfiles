vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- tabs
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<cr>", { silent = true })
vim.keymap.set("n", "<SC-Right>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "<SC-Left>", "<cmd>tabprev<cr>", { silent = true })

-- save
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { silent = true, desc = "Save buffer" })
vim.keymap.set({ "n", "i" }, "<C-S>", "<cmd>wa<cr>", { silent = true, desc = "Save all buffers" })

-- terminal
vim.keymap.set("n", "<C-j>", "<cmd>terminal<cr>", { silent = true })
