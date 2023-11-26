-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Tmux itegration

local autocmd_tmux = vim.api.nvim_create_augroup("Tmux integration auto-commands", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd([[ silent !tmux set status off ]])
  end,
  group = autocmd_tmux,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.cmd([[ !tmux set status on ]])
  end,
  group = autocmd_tmux,
})
