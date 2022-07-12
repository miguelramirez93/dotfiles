local keymaps_utils = require('user.utils.keymaps')

local M = {}

function M.setup()
  keymaps_utils.map("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  keymaps_utils.map("n", "gv", ":vsplit | lua vim.lsp.buf.definition()<CR>")
  keymaps_utils.map("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
end


return M




