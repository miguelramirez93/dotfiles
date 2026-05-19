-- yank file path (and line range in visual mode) as @-prefixed mention
local function relative_path()
  local path = vim.fn.expand("%:.")
  if path == "" then
    vim.notify("No file name for current buffer", vim.log.levels.WARN)
    return nil
  end
  return path
end

vim.keymap.set("n", "<leader>yp", function()
  local path = relative_path()
  if not path then return end
  local payload = "@" .. path
  vim.fn.setreg("+", payload)
  vim.notify("Copied: " .. payload)
end, { silent = true, desc = "Yank @path for agent chat" })

vim.keymap.set("x", "<leader>yp", function()
  local path = relative_path()
  if not path then return end
  local s = vim.fn.line("v")
  local e = vim.fn.line(".")
  if s > e then s, e = e, s end
  local payload = "@" .. path .. ":" .. s .. "-" .. e
  vim.fn.setreg("+", payload)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  vim.notify("Copied: " .. payload)
end, { silent = true, desc = "Yank @path:start-end for agent chat" })
