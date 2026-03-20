-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- tabs
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<cr>", { silent = true })
vim.keymap.set("n", "<SC-Right>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "<SC-Left>", "<cmd>tabprev<cr>", { silent = true })

-- terminal
vim.keymap.set("n", "<C-j>", "<cmd>terminal<cr>", { silent = true })
