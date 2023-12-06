-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- lsp
vim.keymap.set("n", "gv", ":vsplit | lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.keymap.set("n", "rn", vim.lsp.buf.rename, { silent = true })

-- Terminal
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
vim.keymap.set("n", "<C-j>v", function()
  vim.cmd([[ ToggleTerm size=12 direction=horizontal ]])
end, { silent = false })
vim.keymap.set("n", "<C-j>", function()
  vim.cmd([[ ToggleTerm size=80 direction=vertical ]])
end, { silent = false })
vim.keymap.set("n", "<C-j>f", function()
  vim.cmd([[ ToggleTerm direction=float ]])
end, { silent = false })

-- file explorer
vim.keymap.set("n", "<C-e>", function()
  vim.cmd([[ Telescope file_browser ]])
end, { silent = false })

-- Git
vim.keymap.set("n", "<C-g>d", function()
  vim.cmd([[ Telescope git_status ]])
end, { silent = false })

--buffers
vim.keymap.set("n", "<C-e>b", function()
  vim.cmd([[ Telescope buffers ]])
end, { silent = false })
